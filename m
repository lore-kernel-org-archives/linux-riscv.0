Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80520C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 01:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTQEwTXVkVuBdZCIAsqLtytfiK2SvCCq8IoDYYRlHzI=; b=luG7HRaovon0+g
	+PZLNmxSGI6RZpFPFK/JltcgbVns69R6kmn9o8k50ypS7GpjhxJ6I2ZdB74UnzS5DaGkWHOw5UCI+
	3gyqqPd3l9kDt0aZzOkWi03/T4qDLizGx7YhMDqG+B5TO+Od1JHZDlOm7hpywd4q5fj95bVlgLvCl
	y/gO4/wg5U5YDvJ4Q/USAQve+dxNujZteVVWuYYgal3CTy8pazl41P7MWHAnDz/mZaeQC6RkOOq6W
	PSFe3SKfjj8uXxQYYygjapN1knr0YDyozZCW+ThsJPHfExt0E1sF/r4NbAQvS+LN85RVPVeW7bhLO
	EnJcATk3WFXhd25gg00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRMAT-000000095FZ-1xiZ;
	Wed, 10 Jul 2024 01:30:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRMAQ-000000095F2-2fis
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 01:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BA1B1CE1398
	for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 01:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6768C3277B
	for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 01:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720575042;
	bh=x8lbjp1PceBBHgHt/P9hnewqF+n+jC/8hR3PnA9sUm0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JWXG8xTv3g/AHIJGyJnL2ta2fXggG45B6sRd7OI6Ox+ZwF1O18vUzVoLHUhGUcP7s
	 mHt7NLB5OEuI6kzR4KUu1ascTcfQHu6y3soICWoYohZE1mFygnFuUZAs1WKqnoXbbE
	 xBVnMtMzKXxSyaEI3s6+SYZmLaMPbCXuUiFUbI/AF93XopO1/EmIcD4+rFwFkwqh6Q
	 HqOZq5CSqUpEssmuu2qx58oaHLSBSQkzogLP5mp2YFqTVJwPQdsJKvCLTz1PmJJGe6
	 pFxDUhNWplyCpxwwB0mH2hPqgckkaODPmVfzCD4OzsalCokMLW3RBYbF0LQQQ+3yro
	 AIrhJVsspVDJA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea0f18500so5453554e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 18:30:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZpYYxW84JpWBNzotns85Lw7bfUQS9unshvReYVQC00Ab/cwBS/oQOryB0elQlGqWuZtfBctcaVAqPYJ6uaL3H2mMx7sWz9OcPVqvRYpbW
X-Gm-Message-State: AOJu0YzLYbmGbz+m1gFU5akx686wRIwmZgjNCWWSQ3pv9oq7O2S2tE9c
	I7LAnCuweQD9cMU20kDC0vTRB8hyjhywRirKjBQ4d6rGA1I40aqO/2AlGP+7REcodFd7k8uyItt
	Xp8xOL9NjZ++Mvu9yA7GWMBB4x5I=
X-Google-Smtp-Source: AGHT+IG1sql72T4MYGYs5bbPBtwbR0BPqk0ELWMv6JVktc9ot3/sctTKgw2yg1t6XZqxEchSw0NJeHoB1P31cM21LRQ=
X-Received: by 2002:a05:6512:114d:b0:52e:9ba5:9853 with SMTP id
 2adb3069b0e04-52eb9994357mr2664442e87.24.1720575041326; Tue, 09 Jul 2024
 18:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240705060902.113294-1-alexghiti@rivosinc.com> <20240705060902.113294-2-alexghiti@rivosinc.com>
In-Reply-To: <20240705060902.113294-2-alexghiti@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 10 Jul 2024 09:30:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRJ2pPgqf0KSdk-q1w80vnVg6gPgRMw1NkQMPJJztr56A@mail.gmail.com>
Message-ID: <CAJF2gTRJ2pPgqf0KSdk-q1w80vnVg6gPgRMw1NkQMPJJztr56A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: vdso: Prevent gcc from inserting calls to memset()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Vladimir Isaev <vladimir.isaev@syntacore.com>, 
	Roman Artemev <roman.artemev@syntacore.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_183046_868920_08E72369 
X-CRM114-Status: GOOD (  13.94  )
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

T24gRnJpLCBKdWwgNSwgMjAyNCBhdCAyOjEw4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IGdjYyBpcyBzbWFydCBlbm91Z2ggdG8gaW5zZXJ0
IGEgY2FsbCB0byBtZW1zZXQoKSBpbgo+IHJpc2N2X3Zkc29fZ2V0X2NwdXMoKSwgd2hpY2ggZ2Vu
ZXJhdGVzIGEgZHluYW1pYyByZWxvY2F0aW9uLgo+Cj4gU28gcHJldmVudCBnY2MgZnJvbSBkb2lu
ZyB0aGF0IGJ5IHVzaW5nIHRoZQo+IC1mbm8tdHJlZS1sb29wLWRpc3RyaWJ1dGUtcGF0dGVybnMg
b3B0aW9uLgpHb29kIGNhdGNoLiBJIHRoaW5rIHdlIGNvdWxkIHB1dCBhIGNvbW1lbnQgb24KIi1m
bm8tdHJlZS1sb29wLWRpc3RyaWJ1dGUtcGF0dGVybnMiLiBlZzogUGVyZm9ybSBsb29wIGRpc3Ry
aWJ1dGlvbiBvZgpwYXR0ZXJucyB0aGF0IGNhbiBiZSBjb2RlIGdlbmVyYXRlZCB3aXRoIGNhbGxz
IHRvIGEgbGlicmFyeS4KCk90aGVycywgTEdUTSEKClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZp
bGUgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL3Zk
c28vTWFrZWZpbGUKPiBpbmRleCBmN2VmOGFkOWI1NTAuLmM3ZTQwYmYzNjM3MSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby9NYWtlZmlsZQo+IEBAIC0xOCw2ICsxOCw3IEBAIG9iai12ZHNvID0gJChwYXRz
dWJzdCAlLCAlLm8sICQodmRzby1zeW1zKSkgbm90ZS5vCj4KPiAgY2NmbGFncy15IDo9IC1mbm8t
c3RhY2stcHJvdGVjdG9yCj4gIGNjZmxhZ3MteSArPSAtRERJU0FCTEVfQlJBTkNIX1BST0ZJTElO
Rwo+ICtjY2ZsYWdzLXkgKz0gLWZuby10cmVlLWxvb3AtZGlzdHJpYnV0ZS1wYXR0ZXJucwo+Cj4g
IGlmbmVxICgkKGMtZ2V0dGltZW9mZGF5LXkpLCkKPiAgICBDRkxBR1NfdmdldHRpbWVvZmRheS5v
ICs9IC1mUElDIC1pbmNsdWRlICQoYy1nZXR0aW1lb2ZkYXkteSkKPiAtLQo+IDIuMzkuMgo+CgoK
LS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
