Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E832C6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 01:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0KszUUyf5YSbUjCaeMzgfQG6OrFQhjmHGV5pZUSeGQ=; b=bk4N5mMiJDyX7F
	M9mF3qFCaZsy31T4BoQZl+FLwAuKPO9DDfXQXzj3bkz0KIrUOgN6v2nZ9P3aymwWEQ6h+64Y84ZFk
	a6SbSvIylM9GDPS+1ncn32D500vITik1V1tMd6zLG3T9o/ZzwLo7stoeJ8NqZHyXBnK03B6Op3LzC
	JxZ09+dcAMbzR6pq/KBGJMlmvhpzz6I1CkmO5bCiI9SPrGMF16F/0yKCKXgik13+AVrrjFUpF474Z
	UH+S7Yob+xrTgbGl1F5zkY2EoLqoWSAvwOKzvOq/LDSmC0edSeIfPl7odJKo+VFgoDc6yxWQnOI3W
	2aErXOu2DkBPiKzRIb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbA96-00CaGK-29;
	Wed, 30 Aug 2023 01:37:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbA93-00CaFq-1f
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 01:37:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F385962219
	for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 01:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCB9C433CD
	for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 01:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693359440;
	bh=dPf4kldHLwVQWKVmZVGZxcUp8BjRiStmfkC4GhSqQOo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kD2kdSw92+xzFguoEUs/NfjRaQv9uCx0X1ruiPMjbHf1i924ECnvo6SlQyeuBDiMM
	 3IUO5jQ4VraWCBcLlU5QUZVzxQKWNTCVrA4ifEzVoLADNntPMZEk+6VInCZls3gqzO
	 nTzuT14B1VBhFmC+8WEZV0HWeQPZ8x8JVyiqcM3opP4BJC7dwqTwYBNyE0u9DznVRO
	 1A01N0Ixa7i0Hi28Ig8aaAbRUXrBfNl5Tu0QB8l3mIbXbIN5aFnZHvjVvqDO7EzGAq
	 kLTPrYrlhe6ZhBRJre5iCVhb80eDAAknCCpDWNJpZu4Xf+tBu2TFREc9nxMV/4vQ9g
	 kCNy5IeZJttNQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so6577925a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 18:37:20 -0700 (PDT)
X-Gm-Message-State: AOJu0YxQo8RC07Lia6kY3Fi2n4ni+VEX4OOVkU9OxN8fvESRoB6EKI2B
	tUG/zQYNn96qugLWUx4FChhS+Y97etwbUotFDX4=
X-Google-Smtp-Source: AGHT+IFxM/pc+mlJmDqVNMXxYu6T33APpKzC6JZXNd2v6LFSpNeeV1Tzov2tS3Gr5aayD63mcZuwkyYwBi0GNRphdAo=
X-Received: by 2002:a05:6402:1287:b0:528:90d7:a1f with SMTP id
 w7-20020a056402128700b0052890d70a1fmr695346edv.10.1693359438604; Tue, 29 Aug
 2023 18:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230829182500.61875-1-namcaov@gmail.com>
In-Reply-To: <20230829182500.61875-1-namcaov@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 30 Aug 2023 09:37:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2vZLFo=cfg+KD_LY8z=_D4sLROGgx4GiwTYKXt=8k4w@mail.gmail.com>
Message-ID: <CAJF2gTR2vZLFo=cfg+KD_LY8z=_D4sLROGgx4GiwTYKXt=8k4w@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobes: allow writing to x0
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_183721_598180_39827523 
X-CRM114-Status: GOOD (  17.56  )
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

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgMjoyNeKAr0FNIE5hbSBDYW8gPG5hbWNhb3ZAZ21haWwu
Y29tPiB3cm90ZToKPgo+IEluc3RydWN0aW9ucyBjYW4gd3JpdGUgdG8geDAsIHNvIHdlIHNob3Vs
ZCBzaW11bGF0ZSB0aGVzZSBpbnN0cnVjdGlvbnMKPiBub3JtYWxseS4KPgo+IEN1cnJlbnRseSwg
dGhlIGtlcm5lbCBoYW5ncyBpZiBhbiBpbnN0cnVjdGlvbiB3aG8gd3JpdGVzIHRvIHgwIGlzCj4g
c2ltdWxhdGVkLgo+Cj4gRml4ZXM6IGMyMmIwYmNiMWRkMCAoInJpc2N2OiBBZGQga3Byb2JlcyBz
dXBwb3J0ZWQiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTog
TmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3By
b2Jlcy9zaW11bGF0ZS1pbnNuLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3By
b2Jlcy9zaW11bGF0ZS1pbnNuLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUt
aW5zbi5jCj4gaW5kZXggZDMwOTlkNjc4MTZkLi42YzE2NjAyOTA3OWMgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3NpbXVsYXRlLWluc24uYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3Byb2Jlcy9zaW11bGF0ZS1pbnNuLmMKPiBAQCAtMjQsNyArMjQsNyBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgcnZfaW5zbl9yZWdfc2V0X3ZhbChzdHJ1Y3QgcHRfcmVncyAqcmVncywg
dTMyIGluZGV4LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgdmFsKQo+ICB7Cj4gICAgICAgICBpZiAoaW5kZXggPT0gMCkKPiAtICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKQWNrZWQt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPiAgICAgICAgIGVsc2UgaWYgKGluZGV4
IDw9IDMxKQo+ICAgICAgICAgICAgICAgICAqKCh1bnNpZ25lZCBsb25nICopcmVncyArIGluZGV4
KSA9IHZhbDsKPiAgICAgICAgIGVsc2UKPiAtLQo+IDIuMzQuMQo+CgoKLS0gCkJlc3QgUmVnYXJk
cwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
