Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FA5C54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QumSqzFIJINz/tRhlakHBvkLvxSMc3ko2HLSoq1Fsns=; b=RpxKHDdxS+CHCp
	4j6wLxoUTxvNnDsZMWUwSlHtf3vd96HPnWMeIZ1dJPAvFr6HxHI8RdBQ72CNuUa3JLO+it2YsPwou
	PuihqHxGlEDSK84TGooUx8olRtlPA2lOsPmtrYHzaxYENal4Zrd9mnfnNqbpaW0rNBJlMG0lsV5hW
	b835498rSGKxcyO6eSXfN+4fDtcmqFy3R3rqfuJFHEiivU6A180SDkbvqft390dTSZUZNUKGYr8uU
	vdChvjc8AJy7iPJ1wfPKY/bttcnpHZCpuUkFEzfF9wCoxC0bNYr5CjxZGocX/Pbe3CWID0PlS+nM0
	IZB1uUgdfmhWTB3GS1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL60c-00C0VJ-Fg; Thu, 26 Jan 2023 17:25:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL60a-00C0TT-51
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 17:25:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B357C61900;
	Thu, 26 Jan 2023 17:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080C1C433A4;
	Thu, 26 Jan 2023 17:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674753955;
	bh=TdYTdj6H5Qbtgmh1te0rA9iZLTDxbWp//XNrh7RF5Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J3iZOXekCvBiCWba07x6I1CFrKnGLzx4W949DYUD4tbysmB01KS/zW1L5l+gdxJnJ
	 tJ0OJgDM7t5AKS85BDbjSEGHqB1UbmMd/S/ayS4pc9hLoBhyE0UOdBrQuNyKAYedWF
	 TIDU1k4bjOsm02o/3YwpiZljbwjQQhNEBxkWxNI0h9TSSLl7/k6/YHvHqnkO0s7HRC
	 JvuyVOhmuRl84ApJkYwW4AxtwYsTwgTBvsuwWK7PbU4hP7G+ku0P6UIcl2USWPvNl4
	 Fmd/3YCdha0eVQJkYXL8JbdLUhkFP7JBvMKSs6l6TJNOL4l9V1QX+GrqzTcIqG/nNv
	 9dv5AniutXUCQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	ben@decadent.org.uk,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH -next V15 3/7] riscv: entry: Add noinstr to prevent instrumentation inserted
Date: Thu, 26 Jan 2023 12:25:12 -0500
Message-Id: <20230126172516.1580058-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230126172516.1580058-1-guoren@kernel.org>
References: <20230126172516.1580058-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_092556_338465_BBD7E040 
X-CRM114-Status: GOOD (  13.17  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKV2l0aG91dCBub2luc3Ry
IHRoZSBjb21waWxlciBpcyBmcmVlIHRvIGluc2VydCBpbnN0cnVtZW50YXRpb24gKHRoaW5rCmFs
bCB0aGUgaypTQU4sIEtDb3YsIEdDb3YsIGZ0cmFjZSBldGMuLikgd2hpY2ggY2FuIGNhbGwgY29k
ZSB3ZSdyZSBub3QKeWV0IHJlYWR5IHRvIHJ1biB0aGlzIGVhcmx5IGluIHRoZSBlbnRyeSBwYXRo
LCBmb3IgaW5zdGFuY2UgaXQgY291bGQKcmVseSBvbiBSQ1Ugd2hpY2ggaXNuJ3Qgb24geWV0LCBv
ciBleHBlY3QgbG9ja2RlcCBzdGF0ZS4gKGJ5IHBldGVyeikKCkxpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2L1l4Y1E2Tm9QZjNBSDBFWGVAaGlyZXoucHJvZ3JhbW1pbmcu
a2lja3MtYXNzLm5ldC8KUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4KU3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+
ClRlc3RlZC1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgpTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IEd1
byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzLmMKaW5kZXggNTQ5YmRlNWM5NzBhLi45NmVjNzZjNTRmZjIgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
YwpAQCAtOTUsOSArOTUsOSBAQCBzdGF0aWMgdm9pZCBkb190cmFwX2Vycm9yKHN0cnVjdCBwdF9y
ZWdzICpyZWdzLCBpbnQgc2lnbm8sIGludCBjb2RlLAogfQogCiAjaWYgZGVmaW5lZChDT05GSUdf
WElQX0tFUk5FTCkgJiYgZGVmaW5lZChDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkUpCi0jZGVmaW5l
IF9fdHJhcF9zZWN0aW9uCQlfX3NlY3Rpb24oIi54aXAudHJhcHMiKQorI2RlZmluZSBfX3RyYXBf
c2VjdGlvbiBfX25vaW5zdHJfc2VjdGlvbigiLnhpcC50cmFwcyIpCiAjZWxzZQotI2RlZmluZSBf
X3RyYXBfc2VjdGlvbgorI2RlZmluZSBfX3RyYXBfc2VjdGlvbiBub2luc3RyCiAjZW5kaWYKICNk
ZWZpbmUgRE9fRVJST1JfSU5GTyhuYW1lLCBzaWdubywgY29kZSwgc3RyKQkJCQlcCiBhc21saW5r
YWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIG5hbWUoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCVwKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
