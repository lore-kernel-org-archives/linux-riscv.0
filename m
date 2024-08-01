Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7984AC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 00:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wz5PQtxdEQ0wcsiVTmndjjQtVx2/r4H41ieDKvzN8Js=; b=mmx05/E0l3FI5/
	2ohIWhF5nX0aKhAl0AwojQtpnaad9GVtvtQcX3JECCD/A0mCErLuAYbQ2oAX+yFSaBt+YpoDP7T62
	PAxDLYvNuuj/e/QwWwMC22HhcPrE5P6Jb6cC+rR0fdeeMR+fw6zJcv/YxYj5Z81lqZ7mGalpzl6xZ
	bCbEIC6Q7/EtN1ysRsdeVreX7HqzebMTy+VPEEp/Dvjv3QqerMhob2upvtHkSWVETSk4eEBaLOWuG
	EFok65PaWFX8BCQCt4d7zLbTzYA9RH6wYOX6jXIRnHF99/yJ/ouxgZc+ego41sSFIELRLA3tRnRZi
	4pW6u830yJX+gHFg/kJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJq1-000000033nh-03eL;
	Thu, 01 Aug 2024 00:38:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJpx-000000033mu-3YyD
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 00:38:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D37461741;
	Thu,  1 Aug 2024 00:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8EBC116B1;
	Thu,  1 Aug 2024 00:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722472713;
	bh=NbqnkNm54YARazMoAHscVDuOCUJdGW2n3rExvuwRPpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bwy5o7fgJZbuSM6MAhlcqQrqGL+XpFQyn7M4N43uRW25KcfeKnDJ7uA0UQkPOr8DC
	 oIDFHobQrxe1CGlsm4yDl6hLt8pPOCxz2uluYeC7af9uDEapKi7IIV76JcPjk3Y6o7
	 01vjb+BONB6dlep83L3lJBIg7OMNO7FJWLgSYLo+cyetCO8qX6WJoK15/QykynOphj
	 bzYxPMU86vBXplgtnm1gKyBjDmT82bGP7InC5UOA++1FjDbfvk/W3RXRtzIVhzVXlm
	 gK3hASo1V1OKEh5ompV3CV6yr0aZxaNavKIBQruzVnxxO5xiFgDTU144ocK/DNmBE2
	 tbDELVB46Tazw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	peterlin@andestech.com,
	akpm@linux-foundation.org,
	christophe.leroy@csgroup.eu,
	suagrfillet@gmail.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 29/38] riscv: mm: Take memory hotplug read-lock during kernel page table dump
Date: Wed, 31 Jul 2024 20:35:35 -0400
Message-ID: <20240801003643.3938534-29-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801003643.3938534-1-sashal@kernel.org>
References: <20240801003643.3938534-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_173833_953953_4E0CEEC1 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKWyBVcHN0cmVhbSBjb21t
aXQgMzc5OTJiN2YxMDk3YmE3OWNhNzViYTVhMjZkZGNmMGY1NGY5MWEwOCBdCgpEdXJpbmcgbWVt
b3J5IGhvdCByZW1vdmUsIHRoZSBwdGR1bXAgZnVuY3Rpb25hbGl0eSBjYW4gZW5kIHVwIHRvdWNo
aW5nCnN0YWxlIGRhdGEuIEF2b2lkIGFueSBwb3RlbnRpYWwgY3Jhc2hlcyAob3Igd29yc2UpLCBi
eSBob2xkaW5nIHRoZQptZW1vcnkgaG90cGx1ZyByZWFkLWxvY2sgd2hpbGUgdHJhdmVyc2luZyB0
aGUgcGFnZSB0YWJsZS4KClRoaXMgY2hhbmdlIGlzIGFuYWxvZ291cyB0byBhcm02NCdzIGNvbW1p
dCBiZjJiNTlmNjBlZTEgKCJhcm02NC9tbToKSG9sZCBtZW1vcnkgaG90cGx1ZyBsb2NrIHdoaWxl
IHdhbGtpbmcgZm9yIGtlcm5lbCBwYWdlIHRhYmxlIGR1bXAiKS4KClJldmlld2VkLWJ5OiBEYXZp
ZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IE9zY2FyIFNhbHZh
ZG9yIDxvc2FsdmFkb3JAc3VzZS5kZT4KU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNjA1
MTE0MTAwLjMxNTkxOC04LWJqb3JuQGtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogUGFsbWVyIERh
YmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4KLS0tCiBhcmNoL3Jpc2N2L21tL3B0ZHVtcC5jIHwgMyArKysKIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21t
L3B0ZHVtcC5jIGIvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYwppbmRleCBhY2U3NGRlYzc0OTJjLi5i
NWE4YzdjMjBkMTIwIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21tL3B0ZHVtcC5jCisrKyBiL2Fy
Y2gvcmlzY3YvbW0vcHRkdW1wLmMKQEAgLTYsNiArNiw3IEBACiAjaW5jbHVkZSA8bGludXgvZWZp
Lmg+CiAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgogI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4K
KyNpbmNsdWRlIDxsaW51eC9tZW1vcnlfaG90cGx1Zy5oPgogI2luY2x1ZGUgPGxpbnV4L3NlcV9m
aWxlLmg+CiAjaW5jbHVkZSA8bGludXgvcHRkdW1wLmg+CiAKQEAgLTMyNCw3ICszMjUsOSBAQCB2
b2lkIHB0ZHVtcF9jaGVja193eCh2b2lkKQogCiBzdGF0aWMgaW50IHB0ZHVtcF9zaG93KHN0cnVj
dCBzZXFfZmlsZSAqbSwgdm9pZCAqdikKIHsKKwlnZXRfb25saW5lX21lbXMoKTsKIAlwdGR1bXBf
d2FsayhtLCBtLT5wcml2YXRlKTsKKwlwdXRfb25saW5lX21lbXMoKTsKIAogCXJldHVybiAwOwog
fQotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
