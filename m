Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE23C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 18:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlfHtaHll//irc9bvhOzfAF2MhA3cN2JIoUl8MgPgD8=; b=3jq66h6SPkE+Mg
	XFit07ASfiqYZMCTaXKBgHNZM6Ex1t5umvoBpPrWOWJ0oD1XZrjxq/gPLbEcohwY7BHDyoe/5VHK6
	pq5Wv06+OFwTUBhb/0gNDOd6oRQdiA7gjALcXbVuAa/Wd+yPhjqcNS5Bagwk3kyeV7DCGGJ2cyXIm
	mOEh+2sA88K7krFDZisCFZtFYJZXlXECw+oKw7KcBKrMiZcbfz7P7P9qAej5fOHkbP+VSbZg1PWGc
	w4q17aosP4kth9/qBu7i5u/OxbCxdZNXt/gvyCxknwOA2yA8P7Rs4GoRibC3BzhvyyHIxa1QF4B++
	hu8468XuN5IwSNPIHxVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paKrY-00BXOi-1S; Thu, 09 Mar 2023 18:19:36 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paKrU-00BXMx-1K
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 18:19:33 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 35C123F75E
	for <linux-riscv@lists.infradead.org>; Thu,  9 Mar 2023 18:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678385964;
	bh=SxKX8lAWQsQ9FTwiM9BPGc+zhxP/zhLFmNPZpha4eWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ecyeGCqldqraTAGFgFoseL6HI4/9PAZL1FPHimV2PbCsORDAxyChOAFUPzJo22RgI
	 XlG6HgWIVvRk3in0k3ii3i21D1keLbdPxghEl4Ur9xbQ8vgtdS08gEColuj+u+BDB2
	 Q8fesuzEPn1cMJcPsQrDDEl2TcASVeSsQlzzQxSZgbsUWd/Z9w+wmc/66x8WY6REcl
	 nFVGh8KZofYUvxrekoaIrq+AkT+91GUGdJvGxi4ahJHD5rkoq/UEvusEynaOmjMalT
	 sGHyHctbNX0po8Jyu1IU2ToZDvkD/Qg8OMw1BfKGP7DPRgzI5l58JLUTX6wurMBVBL
	 hZtL+TuuTp8CQ==
Received: by mail-qk1-f197.google.com with SMTP id z23-20020a05620a101700b0073b328e7d17so1652914qkj.9
        for <linux-riscv@lists.infradead.org>; Thu, 09 Mar 2023 10:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678385963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxKX8lAWQsQ9FTwiM9BPGc+zhxP/zhLFmNPZpha4eWo=;
        b=LHVcElV3LcMijIKLO0ZYaT5nTeAhSt7tyS6WH7Q2CDq1UTcNtUEZ0sWyAfoSi9kj1f
         u3DVpUK73YYZRAjtIzHu4wbIbDW1cXY05B380EbZpz0J5uJYPsRffd1cvPKkLmJRvtep
         jR3G1/SroHJ+7Msew7PJKjgmJyEZNalFJt4vhk83/GVlgNoEATuvgQe4RvEnn3WWH4X4
         o0ouph7pql2SsDOQjOWZYevlZ92p2H9QzuqBE5/FPuhlJ3MQi981uMqNuvQemPlu9fdp
         vEpVKjlfRdWUx14UeDlfD5pB459Ar5SURtgSdiVSfLZtQe3ooSJWMm8t55yDjOsONm+d
         hWBg==
X-Gm-Message-State: AO0yUKUL86FNNflmGomr+qu08lOE91QeN1+MVWI4+pPS86JBsa6s6Vi8
	2Ef6e8WPu4f0IfSSg3wfBVqxCYaktHsEq05VQfjQM2HR3JWlBLyIvRpUAREsRQe/7Nn6pgqbdT5
	2uEyiCqsqGZplWXWZ8yMsaoAUGQoz4y81gkN60yaAArI1aT5XQGVIk4ae2RUmOA==
X-Received: by 2002:ac8:429a:0:b0:3bf:bba8:69b0 with SMTP id o26-20020ac8429a000000b003bfbba869b0mr6074838qtl.5.1678385963011;
        Thu, 09 Mar 2023 10:19:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9OHYCSEuIKRx9FxuLcExe2yb6O6D1LT6790n4D4PIp0zTs0FgzUhcs4O8DexM+HqsfP/U+EGkFQOY6RIH4J0w=
X-Received: by 2002:ac8:429a:0:b0:3bf:bba8:69b0 with SMTP id
 o26-20020ac8429a000000b003bfbba869b0mr6074830qtl.5.1678385962760; Thu, 09 Mar
 2023 10:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-13-hal.feng@starfivetech.com> <CAJM55Z8H4qmy_BiD0SHW-w5ifzhzokdO-QxpUUz9aeUd+htrZg@mail.gmail.com>
 <8c30220a-abef-7518-cb44-abcea91408e2@starfivetech.com> <49ab1072-98ba-f364-9b66-68658566e732@starfivetech.com>
 <CAJM55Z9YGjD+1haWcXEZNkHnWNRZckdBmTTykTt7QZV_LUohgQ@mail.gmail.com> <032f9254-482a-4b97-8e7e-4afb1f78eb21@spud>
In-Reply-To: <032f9254-482a-4b97-8e7e-4afb1f78eb21@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 9 Mar 2023 19:19:06 +0100
Message-ID: <CAJM55Z_HGt3iu=trv0v_VzyO3NkVo+aiEaT9vxRURz-MvrbCOg@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] clk: starfive: Add StarFive JH7110 always-on
 clock driver
To: Conor Dooley <conor@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_101932_458699_82EC4B41 
X-CRM114-Status: GOOD (  28.58  )
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

T24gVGh1LCA5IE1hciAyMDIzIGF0IDE5OjExLCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXIgMDksIDIwMjMgYXQgMDM6MDY6MTNQTSArMDEwMCwg
RW1pbCBSZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4gPiAgT24gVGh1LCA5IE1hciAyMDIzIGF0IDEw
OjQ0LCBIYWwgRmVuZyA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cj4KPiA+ID4g
VGhlIEFPTiBjbG9jayBkcml2ZXIgcHJvdmlkZXMgY2xvY2tzIGZvciBnbWFjMCB3aGljaCBpcyB1
c2VkIGZyZXF1ZW50bHkuCj4gPiA+IFNvIEkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBjb252ZW5p
ZW50IGlmIHdlIHNldCAiZGVmYXVsdCB5IiBoZXJlLgo+Cj4gPiBZb3UncmUgcmlnaHQgdGhhdCBp
ZiB3ZSBkZWZhdWx0IHkgZm9yIHRoZSBldGhlcm5ldCBkcml2ZXIgdGhlbiB0aGUgYW9uCj4gPiBj
bG9jay9yZXNldCBzaG91bGQgYWxzbyBkZWZhdWx0IHkuIFBlcnNvbmFsbHkgSSBkb24ndCB0aGlu
ayB3ZSBzaG91bGQKPiA+IGRlZmF1bHQgeSBmb3IgZXZlcnkgZXRoZXJuZXQgZHJpdmVyIHRoYXQg
bWlnaHQgYmUgdXNlZCBvbiBzb21lCj4gPiBzdXBwb3J0ZWQgcmlzYy12IHBsYXRmb3JtLCBidXQg
SSBzZWUgbm93IHRoYXQKPiA+IGFyY2gvcmlzY3YvY29uZmlnL2RlZmNvbmZpZyBhbHJlYWR5IGNv
bnRhaW5zIENPTkZJR19NQUNCPXksCj4gPiBDT05GSUdfRTEwMDBFPXksIENPTkZJR19SODE2OT15
IGFuZCBDT05GSUdfTUlDUk9TRU1JX1BIWT15LCBzbyBtYXliZQo+ID4gSSdtIHdyb25nIG9yIGp1
c3QgdG9vIGxhdGUuCj4KPiBUaGUgZGVmY29uZmlnIHJlYWxseSBuZWVkcyBhIGdvb2QgYml0IG9m
IGNsZWFudXAgKG9uZSBvZiB0aGUgbWFueSB0aGluZ3MKPiB0aGF0IEkgYW0gdGVsbGluZyBteXNl
bGYgSSB3aWxsIGRvIGFzIHBhcnQgb2Yga2NvbmZpZy5zb2NzIGNsZWFudXApLgo+Cj4gdy5yLnQg
ZGVmY29uZmlnIFBhbG1lciBzYWlkIGl0IHByZXR0eSB3ZWxsIGVhcmxpZXIgb24gSVJDOiAiZGVm
Y29uZmlnCj4gc2hvdWxkIGJlIHVzZWZ1bCBmb3Iga2VybmVsIGRldnMsIHdoaWNoIG1lYW5zIGl0
IHNob3VsZCBib290IG9uIHRoZQo+IGNvbW1vbiBkZXYgYm9hcmRzIi4KPgo+IElNTywgdGhhdCBt
ZWFucyBlbm91Z2ggdG8gYm9vdCBhbiBpbml0cmFtZnMgYW5kIHBva2UgdGhlIHRoaW5nIHRvIHNl
ZQo+IHRoYXQgaXQgaXMgYWxpdmUsIHNvOiBldGhlcm5ldCAmIHNlcmlhbCwgYW5kIHRoZSBjbG9j
a3MvcmVzZXRzL3BpbmN0cmwKPiBzdHVmZiByZXF1aXJlZCB0byBnZXQgdGhvc2UgZ29pbmcgY2Fu
IGFsbCBiZSBzZXQgdG8geSBpbiBkZWZjb25maWcuCj4KPiBJbiB0aGUgZHJpdmVyIEtjb25maWcg
ZW50cmllcywgdG8gbWUsIGl0J3MgbW9yZSBvciBsZXNzIHRoZSBzYW1lLgo+IEkgZ3Vlc3MsIGFu
c3dlciB0aGUgcXVlc3Rpb24gIldpbGwgeW91ciBjdXN0b21lcidzIGJvYXJkIGdldCB0byB0aGUK
PiBwb2ludCB3aGVyZSBpdCBjYW4gbG9hZCBhIG1vZHVsZSBpdGhvdXQgYnVpbGRpbmcgdGhpcyBp
bnRvIHRoZSBrZXJuZWw/Ii4KPiBJZiB0aGUgYW5zd2VyIHRvIHRoYXQgcXVlc3Rpb24gaXMgeWVz
LCB0aGVuIGRvbid0IG1ha2UgaXQgZGVmYXVsdCB5Lgo+Cj4gVGhhdCdzIG15IOKCrDAuMDIhCgpD
b29sLiBEZWZhdWx0aW5nIHRvIG0gaW4gdGhlIEtjb25maWcgZm9yIGFueXRoaW5nIHRoYXQgY2Fu
IGJlIGxvYWRlZApsYXRlciBpcyBleGFjdGx5IHdoYXQgSSB3YXMgdHJ5aW5nIHRvIHNheSwgZXhj
ZXB0IEkgbWl4ZWQgaW4gdGhlCmRlZmNvbmZpZyBmb3Igbm8gZ29vZCByZWFzb24uIFRoYXQgbWVh
bnMgYm90aCB0aGUgYW9uIGNsb2NrcyBhbmQKZHdtYWMtc3RhcmZpdmUgc2hvdWxkIGRlZmF1bHQg
dG8gbSBpbiBLY29uZmlnLiBUaGUgSkg3MTEwIChWaXNpb25GaXZlCjIpIGJvb3RzIGp1c3QgZmlu
ZSBsaWtlIHRoYXQgYW5kIGJyaW5ncyB1cCBhb24gY2xvY2tzIGFuZCBldGhlcm5ldAphZnRlciBs
b2FkaW5nIHRoZSBtb2R1bGVzLgoKL0VtaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
