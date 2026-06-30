Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B3CC43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 10:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYG0CZr/xreEk4Cbq7F57RPofnvE5C7BeWLTRJLsLyQ=; b=SBBaUnsWLnXjRN
	8VQVXN5xUgG8JHz7PJULCJDI0O8uOsQuJkGgOvKowm4P486/CKzDrZ0wzNA7m9UtiIpDwTAPYtsif
	YTwC+RZTyo0hZ+7+E2pOFUn5z1QJSEiV25oFeWocvFsxb3qoKXc9ZPjCVrJSu+VV5IyOVsNnB9ucr
	rZGNSvpRWff7UGdhp6X4h8AnSonxOM5T8R5eywotR3jDHgE/SPYbEa6dxWvVubG5gIrGfrAV5wGci
	RN0dEM6G3WbecIsNDfHdXsQkQGq3WTh2qGoW0B7QtDyI+sU8qB+WqeklWhCCjn4SykYajXVLIN6i7
	1pd/fQTbimHNoD+nCQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weW7h-0000000Gj0Y-1zQE;
	Tue, 30 Jun 2026 10:55:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weW7f-0000000Gizm-2HA7
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 10:55:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EB4D600DA
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 10:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CA81F00ADB
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782816921;
	bh=QS02Y4ZTkCaY+8KNH+aFUHWmz4C6FfgfF/SB6ePyOlU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a4sK+8R1ugLnIFAsbH0lz8AUe7kRH/N+y63uSUgrKVXOkND+PCeWRv4/rDdnx5VZ+
	 HEAYjfubry0IAxUVqH2gtygSX54hRtbd/gji/L+InYJsudr4Mq4+w3C/W5mBNbGXx4
	 O2MNTIAnfTm5czNImtNraZW8xQckJeYL1T0zG7bKSDuNCJOq/ctejSZHbwXJIqGslK
	 WRjP4Fgozdg17w9FwGA/HUZGQgBnsWcPGAdsV4Ey491dOrvLqSomra9Ra4V4mHcEC5
	 7fIMRI53Jkdc6trZxUuojgL6mR2wNEErxGEK/kNeaeCG6Mw0YBLSt0Wi/WKsA/T4KK
	 tY1hYwLOS2ZSw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b293079d1so91101fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 03:55:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr53Xl4JZlKdnNBduxFiGJ+0A9wTBU4QKNbdo8Se4DN0OHzjmtzYR69Ail1EioIlmz0eCn8JN960AhxBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5EJLCR6nYILd+HOnMwnJpK+51+HrFPlSMKhoUKSmTMGxAOYTg
	ci5f98w0iS91UK/fwgBq0cQ867s/lxbpfzSLWGUcJL8Dm/cuGbPQUK0knLqHvSK1FtbiYQLUh15
	laVNMBzorEDfbmBj5Mm0dV9m4yPscmWE=
X-Received: by 2002:a05:651c:41d1:b0:399:b07e:daa7 with SMTP id
 38308e7fff4ca-39b1df87889mr5327631fa.24.1782816919764; Tue, 30 Jun 2026
 03:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-6-23ffa16b6ebb@kernel.org>
 <CAJZ5v0ibZKfzJwGyUb92-K1N9C_ab0QujpAKCrvMdyygquS1Vw@mail.gmail.com> <akOfu2EIQq3CJgqw@lpieralisi>
In-Reply-To: <akOfu2EIQq3CJgqw@lpieralisi>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 30 Jun 2026 12:55:05 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hUUz0TPKEdn5Z-4My2R59YeJPenU6ksF6Y6mvXoxQsSw@mail.gmail.com>
X-Gm-Features: AVVi8CckYFzmEyQcHXV6OSl_5EYAouUcgCGftnfBtVwhGCqpemZWNGkMfRNVdZQ
Message-ID: <CAJZ5v0hUUz0TPKEdn5Z-4My2R59YeJPenU6ksF6Y6mvXoxQsSw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] irqchip/gic-v5: Enable GICv5 IWB ACPI probe
 ordering detection
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMTI6NTHigK9QTSBMb3JlbnpvIFBpZXJhbGlzaQo8bHBp
ZXJhbGlzaUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDA4LCAyMDI2IGF0IDA3
OjE4OjE1UE0gKzAyMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+Cj4gWy4uLl0KPgo+ID4g
PiArI2lmZGVmIENPTkZJR19BQ1BJCj4gPiA+ICsgICAgICAgaWYgKGhhc19hY3BpX2NvbXBhbmlv
bigmcGRldi0+ZGV2KSkKPiA+ID4gKyAgICAgICAgICAgICAgIGFjcGlfZGV2X2NsZWFyX2RlcGVu
ZGVuY2llcyhBQ1BJX0NPTVBBTklPTigmcGRldi0+ZGV2KSk7Cj4gPiA+ICsjZW5kaWYKPiA+Cj4g
PiBJIHdvdWxkIHJhdGhlciBhZGQgYSB3cmFwcGVyIGZvciB0aGlzLCBhbG9uZyB3aXRoIGFuIGVt
cHR5IHN0dWIgZm9yCj4gPiB0aGUgIUNPTkZJR19BQ1BJIGNhc2UuCj4KPiAjaWZkZWYgQ09ORklH
X0FDUEkKPiBzdGF0aWMgaW5saW5lIHZvaWQgYWNwaV9kZXZpY2VfY2xlYXJfZGVwKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiB7Cj4gICAgICAgICBpZiAoaGFzX2FjcGlfY29tcGFuaW9uKGRldikpCj4g
ICAgICAgICAgICAgICAgIGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcyhBQ1BJX0NPTVBBTklP
TihkZXYpKTsKPgo+IH0KPiAjZWxzZQo+IHN0YXRpYyBpbmxpbmUgdm9pZCBhY3BpX2RldmljZV9j
bGVhcl9kZXAoc3RydWN0IGRldmljZSAqZGV2KSB7fQo+ICNlbmRpZgo+Cj4gU29tZXRoaW5nIGxp
a2UgdGhhdCA/CgpZdXAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
