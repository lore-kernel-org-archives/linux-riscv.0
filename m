Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB32DEFB7E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 02:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkJvVcuRc0RYy7UOrUmUTVTvlaBfa09hoxzJ3nRFSjA=; b=kW77in99tFcOWM
	twMVDuAml3bZl/6BkZVDHV4EuW1Z3DonpcaVIQx/lP1VB3+HFszKYvdryIC8euOR4591Kb3V0YzXV
	pdKWEhzzgTBJBYTcrQvbMVM70Bu8Zcz2elWhOrdsOYgubp8DHvcwEuUDK5o2TsJ5yAEZYTUWe9uJl
	LdkCWBykz89wHn59n9Qq79X9pGunwBwr4Mjod9WjgDxPhj0df9Iw7ixyEFmyf8mzH4TmxZ0HNyenA
	GFdfGka3013Yv/DRRzmfZVy+2S+yMiwfUPt5Bt7rO3Xy+vNMAMzHx2wXfiw2+exJefoKKovSIMYTJ
	z9gaAVrNWD4gLuW9Jx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhkb-00000001KOc-0SBE;
	Tue, 24 Feb 2026 02:02:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhka-00000001KOH-1rNr
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 02:02:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9081160142
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 02:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DBDC2BC87
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 02:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771898531;
	bh=HI15qPZpODUUYmT3koZ5s3kfYeK07PPTFU7DvVv4qdc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GjSAE+Gzvl7MTKyXrXtFonZmUs9umZp2h+IMq3fABO4JJCL1aoEZElxco7fD7vQRn
	 fGUnZwCnZAujrJY8Czuc1Meo7Mo/EDCH9oysx1oTesTFcA4hg9hJXUqfz3UfFujXXk
	 3DZbodxSpPhUywtjZ8xtXY7ik3H5N2dcgpQGY/2diAtPqtp/W+ajXsF2CPkKnRK9lG
	 tC/1KhyBGXh9nKWRSC3AnogrQsvf/c6r0MvKOpQbgE8zGHb0+/jntXgRIsayK2iqJh
	 zjjbPgkyhAijWs0ICN+FAEGdrgwoX+DopxZ1wyxAszLPv5JcT/NZIhQP5Z69haxY0u
	 IotkJQWZUIPSg==
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-436234ef0f0so3209009f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 18:02:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXuvfFRdeQQIrK7BemPLzMchwHoaMEGwqj19XOutikqeFHrJrWfEgek4LNp36R15havLJu2yCXOtmBCeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3JK6Wf7BZ3QQK1Fr5o0n8KanR6LJtO8naYawQEFYFnSnP9rfA
	lndzI1DSbxhr7n5BB74fFPvDaymyLxDg8604catudtgeUD6pptzbvX1zs9c/pPx06sCJr9JksLb
	21ahk3yejy+xzIzojed/cyp3ayGZfCFU=
X-Received: by 2002:a05:6000:4201:b0:3ec:db87:e5f4 with SMTP id
 ffacd0b85a97d-4396f15d10cmr18428515f8f.7.1771898529711; Mon, 23 Feb 2026
 18:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20260220090922.1506-1-jszhang@kernel.org> <20260220090922.1506-2-jszhang@kernel.org>
In-Reply-To: <20260220090922.1506-2-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 24 Feb 2026 10:01:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRq+Pp0AC4jFDQdSsQv8x_XWV4o1UrRGcrkAJD2238MSg@mail.gmail.com>
X-Gm-Features: AaiRm51r629qqEXKS58ilHPH1EHwU6F6qXM6VgeaCXkG7tSCgEZ_ZRupW9dwMWo
Message-ID: <CAJF2gTRq+Pp0AC4jFDQdSsQv8x_XWV4o1UrRGcrkAJD2238MSg@mail.gmail.com>
Subject: Re: [PATCH 1/3] vmlinux.lds.h: add _handle_arch_irq RUNTIME_CONST section
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgYXQgNToyN+KAr1BNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBXZSB3aWxsIHVzZSB0aGUgcnVudGltZSBjb25zdGFudCB0
byBvcHRpbWl6ZSB0aGUgaGFuZGxlX2FyY2hfaXJxCj4gYWNjZXNzaW5nLiBUaGlzIGlzIHByZXBh
cmF0aW9uIHBhdGNoLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPgo+IC0tLQo+ICBpbmNsdWRlL2FzbS1nZW5lcmljL3ZtbGludXgubGRzLmggfCAz
ICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy92bWxpbnV4Lmxkcy5oIGIvaW5jbHVk
ZS9hc20tZ2VuZXJpYy92bWxpbnV4Lmxkcy5oCj4gaW5kZXggZWViMDcwZjMzMGJkLi5jNGFmMmM3
ZDBlZWQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy92bWxpbnV4Lmxkcy5oCj4g
KysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy92bWxpbnV4Lmxkcy5oCj4gQEAgLTk3Myw3ICs5NzMs
OCBAQAo+ICAgICAgICAgICAgICAgICBSVU5USU1FX0NPTlNUKHNoaWZ0LCBkX2hhc2hfc2hpZnQp
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgUlVOVElNRV9DT05TVChw
dHIsIGRlbnRyeV9oYXNodGFibGUpICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAg
ICAgIFJVTlRJTUVfQ09OU1QocHRyLCBfX2RlbnRyeV9jYWNoZSkgICAgICAgICAgICAgICAgICAg
ICAgXAo+IC0gICAgICAgICAgICAgICBSVU5USU1FX0NPTlNUKHB0ciwgX19uYW1lc19jYWNoZSkK
PiArICAgICAgICAgICAgICAgUlVOVElNRV9DT05TVChwdHIsIF9fbmFtZXNfY2FjaGUpICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIFJVTlRJTUVfQ09OU1QocHRyLCBf
aGFuZGxlX2FyY2hfaXJxKQo+Cj4gIC8qIEFsaWdubWVudCBtdXN0IGJlIGNvbnNpc3RlbnQgd2l0
aCAoa3VuaXRfc3VpdGUgKikgaW4gaW5jbHVkZS9rdW5pdC90ZXN0LmggKi8KPiAgI2RlZmluZSBL
VU5JVF9UQUJMRSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gLS0KPiAyLjUxLjAKPgpSZXZpZXdlZCBieTogR3VvIFJlbiAoQWxpYmFiYSBEYW1v
IEFjYWRlbXkpIDxndW9yZW5Aa2VybmVsLm9yZz4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
