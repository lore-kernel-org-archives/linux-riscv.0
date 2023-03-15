Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F0FC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 04:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=O1H8MByuGXghZZeEYkM5i0S2whHaTBLw9yZwD4Y16rQ=; b=Ui1BNkBvBIRT75OksiFfvRJVob
	TzvuCyYoX2cf1aLytTy5CoZsXzYK/lsylB4KBAzorwMjL5No0/lGzGo/HUb/97qqZgKROZaWMIcY1
	peLjpl051OlG0ALiH33LXCerfc+sojNxmXKZg5WyuhYh5C/gjBUlTpx62/MBfoDtxVQ7tKoQgzP2Q
	dA+xoLp+GslHOg45CaRoypiRk/0CKWfmz1XQew1mahOj3T8ZOE8wv6KmeSMq4XBsMoYCw6eT65ybh
	x85xxOYHvtzkaB38YFlFZ79q6JmnRpcg+QFmYtcodE7kxYYkl14ZvjkZdBjtDyPyy1Qq/ip9AYw/G
	0Phr+NLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIr4-00CI8s-0H;
	Wed, 15 Mar 2023 04:35:14 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIqz-00CI7U-1T
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 04:35:13 +0000
Received: by mail-pl1-x62b.google.com with SMTP id x11so18759635pln.12
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 21:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678854908;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbfbwOiNBWRMx8mRBgRsuWX5GjlinRdWrXTIrF4JL7Q=;
        b=X61/F2Jy/0W7dFMU4s2vienWCEh+kyljOHSXGdaWOe5p3E8Hdae4U6hyze+go96YrB
         BDhAZFgYpCLbCs3NbWabIQNny36QHRDOuFy9plcMnnfmI7ophEYi6zlLx6i++koalKj1
         Mfln7PT7EFZcO9rN5th6pVdBZ2cjpCPFXPKRqwIcAjBjx3zN3R4LfZGXV+ZyShjzdoDc
         QYteAk/cfpjrKxrDNKRTY9WRnHEZkK2DNejpwhlPKqGkj6GvSyIN1ssMHplDTIBfRcIu
         TAvFEmb7Tym0NDXRlGHqnKfOvXDFoNX2D6W3DTv0S11CG6b8Wg5bM1FORVptrmDfNWSE
         FiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678854908;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbfbwOiNBWRMx8mRBgRsuWX5GjlinRdWrXTIrF4JL7Q=;
        b=oopq1Zg83FKeLE0djq1xhz/p5zGK29WskV0SDZSNpDeifTIQU2QKWuZgOlpSHXDt4P
         KWK5qtXkgkL0mrPOY7lzzTDyljBIXpRjKzSx0yGunQhwK9n+4/xNJSoduIeqILF25epJ
         Z74sBdnYxBAXjrtjKdvbDD4AEVcKZZaXBzHAOED9rLQdOt3a9G1Hwbt15o2mDxOFV0SU
         BbRJtie+wEPBsk8woAyswZhSKqpBlTpqAqVfLf5jWCmRAK5ufS3AZilvst1QDWzUc6NO
         xnzhmCRBbB/bFx6B6+nYyJjJVdj/CPtOGrdx7/9onzgh9o8IPvNg32s9VWPkGwVDbYuT
         HPog==
X-Gm-Message-State: AO0yUKWHxE1fdjp7mD52t3RUmvfhwhfeCUWCr9ICvsvDZrgF2XD3Cn2k
	KgFteMu5amrEcjTWmZrF+IvwHg==
X-Google-Smtp-Source: AK7set/irCrSaIX1krepKm820dgBhlvISnuBsaJcBQ7xkSAlFUwvtd7McBhZ6ehLjaoej63+5rdmUQ==
X-Received: by 2002:a17:902:e542:b0:1a0:42c0:b2a5 with SMTP id n2-20020a170902e54200b001a042c0b2a5mr1509051plf.24.1678854908615;
        Tue, 14 Mar 2023 21:35:08 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p15-20020a170902ebcf00b00198e03c3ad4sm2511293plg.278.2023.03.14.21.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 21:35:08 -0700 (PDT)
Date: Tue, 14 Mar 2023 21:35:08 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Mar 2023 21:30:14 PDT (-0700)
Subject: Re: [PATCH v2 2/6] riscv: Rename Kconfig.erratas to Kconfig.errata
In-Reply-To: <ce498465-ad63-e8dc-43a9-e007e2cb1a41@codethink.co.uk>
CC: ajones@ventanamicro.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, jszhang@kernel.org, heiko@sntech.de, Conor Dooley <conor.dooley@microchip.com>,
  aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben.dooks@codethink.co.uk
Message-ID: <mhng-08138171-8e8a-4539-804c-edc87b573ffb@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_213509_716561_9615967D 
X-CRM114-Status: GOOD (  11.77  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyNCBGZWIgMjAyMyAwNzo1Mzo0OCBQU1QgKC0wODAwKSwgYmVuLmRvb2tzQGNvZGV0
aGluay5jby51ayB3cm90ZToKPiBPbiAyNC8wMi8yMDIzIDE1OjQ1LCBBbmRyZXcgSm9uZXMgd3Jv
dGU6Cj4+IEVycmF0YSBpcyBhbHJlYWR5IHBsdXJhbCBmb3IgZXJyYXR1bS4gUmVuYW1lIGl0IHRv
IG1ha2UgdGhlCj4+IGdyYW1tYXIgZ29vZGVyLgo+Cj4gZ29vZGVyIG9fbwoKVGhhbmtzLCB0aGlz
IG9uZSBidWdnZWQgbWUgZXZlcnkgdGltZSBJIHNhdyBpdC4KCj4KPiBsZXQncyBqdXN0IGdvIGVt
am9pICjila/CsOKWocKw77yJ4pWv77i1IOKUu+KUgeKUuwo+Cj4gLS0gCj4gQmVuIERvb2tzCQkJ
CWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwo+IFNlbmlvciBFbmdpbmVlcgkJCQlDb2RldGhp
bmsgLSBQcm92aWRpbmcgR2VuaXVzCj4KPiBodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvcHJp
dmFjeS5odG1sCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
