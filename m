Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43604C48BF8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLMO7PXc5kXcgSHA+62eXdxcD/zKHDJBoNLJDC6ZQZA=; b=qp3YsQKYGEp6+Z
	AFUZ6YQBdXqzu39iIZbypviRnD62yvA3CvtEDbuowXwTQfO4XSC45tJgeSUpVk2sAs6mBiv3ilREP
	k79Ai0rPQLJ0hcbyCfJVDl8Q23uX1JXf1Ht+2m8JatSeXD3vKfOxzmYD/k/kvcglxSpXHN9DCWKV4
	AhmSI1DiHU+cxxunWPNh8TCl+ThGlWgfI257IGaDCLibUzm4JzJQ4Ve88CBCI16fiEqz8XKjPYAfP
	uod/sh9b4SsxMUiB9R2rvZv5c+W9X75hBqHWDIdYmKKGrCXx622L9ZBg7qOSrsoNIycHfw57cxmvH
	CvZQmAyzkGrzhrRJv22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc38M-0000000ATak-101d;
	Mon, 19 Feb 2024 12:52:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc38J-0000000ATZh-1hgb
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 12:52:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB71C60CF6;
	Mon, 19 Feb 2024 12:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045B9C433F1;
	Mon, 19 Feb 2024 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347150;
	bh=oFTNQdLe9IZPhk9GU/tAEuzjPFGM/mjuC7YNdKT5FeM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=efSH1iWpvJ2lvF7CV+Lz23JHIj5dcAdE4JHFDSdbVVPeBq37vZ0Iix8QV+WOPSUbI
	 oEPF49HuEbvx3+hUohbXwBMHPVcTTMoKW/0bPVPUxcfCCBC6tScCjrMdbWxjAr08Z+
	 T7LXUbcCv3c838J1dGlajH3Wp7l5R9WzroiChxC+U9ucIqJsndB4bmwO14/gFFfkbq
	 LnG3U/QIJomnz+zKMZaWjl/7snmBMGqsI/CJ6aorh9P4g+l+rDLuK2ksBK6eqxr1iP
	 ejYdCIPHxqPYKqS7kQGRM0otcMxj9mLf0csMo3iPDvaE4sSmzl6/dlH9F7uZKLi7q8
	 RSGfihMtiW+/g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel
 Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 3/7] riscv: kprobes: Use patch_text_nosync() for insn slots
In-Reply-To: <20240212025529.1971876-4-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <20240212025529.1971876-4-samuel.holland@sifive.com>
Date: Mon, 19 Feb 2024 13:52:27 +0100
Message-ID: <87a5nwfwfo.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_045231_510186_7A28E4C4 
X-CRM114-Status: GOOD (  11.03  )
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

U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyaXRlczoKCj4gVGhl
c2UgaW5zdHJ1Y3Rpb25zIGFyZSBub3QgeWV0IHZpc2libGUgdG8gdGhlIHJlc3Qgb2YgdGhlIHN5
c3RlbSwKPiBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGRvIHRoZSB3aG9sZSBzdG9wX21hY2hpbmUo
KSBkYW5jZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tPgo+IC0tLQo+Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVz
LmMgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVz
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gaW5kZXggMmYwOGMxNGE5
MzNkLi5jYmY4MTk3MDcyYmYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVz
L2twcm9iZXMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPiBA
QCAtMjgsOSArMjgsOSBAQCBzdGF0aWMgdm9pZCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX3NzX3Ns
b3Qoc3RydWN0IGtwcm9iZSAqcCkKPiAgCj4gIAlwLT5haW5zbi5hcGkucmVzdG9yZSA9ICh1bnNp
Z25lZCBsb25nKXAtPmFkZHIgKyBvZmZzZXQ7Cj4gIAo+IC0JcGF0Y2hfdGV4dChwLT5haW5zbi5h
cGkuaW5zbiwgJnAtPm9wY29kZSwgMSk7Cj4gLQlwYXRjaF90ZXh0KCh2b2lkICopKCh1bnNpZ25l
ZCBsb25nKShwLT5haW5zbi5hcGkuaW5zbikgKyBvZmZzZXQpLAo+IC0JCSAgICZpbnNuLCAxKTsK
PiArCXBhdGNoX3RleHRfbm9zeW5jKHAtPmFpbnNuLmFwaS5pbnNuLCAmcC0+b3Bjb2RlLCAxKTsK
PiArCXBhdGNoX3RleHRfbm9zeW5jKHAtPmFpbnNuLmFwaS5pbnNuICsgb2Zmc2V0LAo+ICsJCQkg
ICZpbnNuLCAxKTsKCk5pdDogMTAwIGNoYXJzIGxpbmVzIQoKTmljZSBmaW5kIQoKUmV2aWV3ZWQt
Ynk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
