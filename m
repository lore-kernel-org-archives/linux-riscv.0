Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FBCC7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDexp7hSx5gs/OuThPNyD7LeENS47GdPXpN9KuqL3Ng=; b=Aj4WVFoDpeUScJ
	yeW3T76/nmUq8Vx9NDAkyRFlIZNYXK/aoaEDRaoewoy2op6AuSyEkLMfRm9rkOjbKXRHeqQxZrING
	xeodgTrQhJmEYuwksMW4/1pfT+41i2bQm8BkwOil4I5dcirUQ2C4U5/fQWsYA8iLUdOMYi+C5lahE
	8fIr3Kh8S8rbzi+ngWBhx5pN6y3FbOIMPUlrw4p6Ez413P0nwCw4g+oL2SdYkoOaIuxhjalDmgMa1
	eAK4cR8QuvLh6R6sFf+hh2rFNjGAcEOZhfVftpuAasBERvVul7fHHX/y8rosRe35yAxraiBtgRcaE
	fb7UFfukTCtEsE7eRonw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mkO-0051QD-2d;
	Mon, 12 Jun 2023 18:58:36 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mkL-0051PC-27;
	Mon, 12 Jun 2023 18:58:34 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9786fc23505so687982166b.2;
        Mon, 12 Jun 2023 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686596311; x=1689188311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mUonJgToHCgnd4NYbM2VauxjgcAH9HX59bsPeQrQF8=;
        b=BKUK/UGgH4F6ItSoTC+5ps+xppzuLOpyrcR53EjxUGgzeHXMBcF6vsGuNsjG7ZivrH
         LekCx1Km0THyBN8bIKbqbWDqyZxhiTiOdOercO6BylOYa6hpuFOEehSonUcrZcsSt4kQ
         OjKHo+W0jG1y6wc9o1xvg0NnMlkwpFFY2v1CL3/aXF9Pq/LuoKawFzAgzg5GwHG1nmn3
         TKPo9zygdYCWnn64A1xNjn8TkxybrmhOKvGnV+x1gUDxIzPYSDGMpjx3eNStBTt2qGEQ
         VeFKtYmpTEBAzrieyZVHGaTgJwjQHQ5JBDDasJH6TmES73QcPhRkEDd5pxYeIRWIpmBW
         eNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686596311; x=1689188311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mUonJgToHCgnd4NYbM2VauxjgcAH9HX59bsPeQrQF8=;
        b=ji5o3AywugZHymmfsu51UcYX5vcYCO882aTOU9vsQxpQeEx4B1RbSIax1+n8MLOLux
         2UKEjPCkVYghODkXhVV37VCGhIU7yaP/DCbsmyYu/CwepPtI7vqMOTw1Itp5vRIZpimT
         VMuEh77yPy42wNUz0AQa04XuWOhfAcnWbrS1pgEYOgiFQ8PsNH8tVrP/40gu58ZOiOIV
         vBJOez0X/7vhRIi2HBvgbljn6fFpMqU+T4wt2qEhgP+fOiAowM5PneBVgCI9hVaoKnzn
         GZyzKPDQiNSjTCY7hXrxO3czfcSfF8RbqjDDuIH7V6cEqvtntHohoJWsyKjl7jbi2YlC
         iQPw==
X-Gm-Message-State: AC+VfDwIHxyvcs66QYwjvqfcsHWfNh1yut0TxzZEFtluGtsTJD8v1nUJ
	d276ewZHFfD186j1NRLVUfxU/5MvPAXUoG4NO3k=
X-Google-Smtp-Source: ACHHUZ72gaCwCv6ASH5Fi/IBsI0MrQyJpEiRZoZuE7BfM5lJamwPMGfN+SlUgNamlTwETDeAHAdCKuU7RSaB2DGEdcI=
X-Received: by 2002:a17:907:3f82:b0:97a:e496:c121 with SMTP id
 hr2-20020a1709073f8200b0097ae496c121mr10409439ejc.69.1686596310880; Mon, 12
 Jun 2023 11:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
 <20230612063429.3343061-4-bigunclemax@gmail.com> <20230612-wriggle-remindful-89d5105c94ee@wendy>
 <CALHCpMjxboLn2eTjOJkE2JAzH3S8OB3v9fWqDOdeipAmLvLx2Q@mail.gmail.com> <20230612-manhole-awoke-599b8ff72edb@spud>
In-Reply-To: <20230612-manhole-awoke-599b8ff72edb@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 12 Jun 2023 21:58:18 +0300
Message-ID: <CALHCpMjY8urNAVFhnBaK1Png1yY3UAQOG8u=W4-v=GiJ8TjZEw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add thermal sensor and
 thermal zone
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_115833_720223_BAC53BE2 
X-CRM114-Status: GOOD (  17.70  )
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

0L/QvSwgMTIg0LjRjtC9LiAyMDIz4oCv0LMuINCyIDIwOjI3LCBDb25vciBEb29sZXkgPGNvbm9y
QGtlcm5lbC5vcmc+Ogo+Cj4gT24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMTE6MTc6MjBBTSArMDMw
MCwgTWF4aW0gS2lzZWxldiB3cm90ZToKPiA+IEhpLCBDb25vcgo+ID4KPiA+INC/0L0sIDEyINC4
0Y7QvS4gMjAyM+KAr9CzLiDQsiAxMDo1NSwgQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT46Cj4gPgo+ID4gLi4uCj4gPgo+ID4gPiBUaGUgUklTQy1WIHBhdGNod29yayBh
dXRvbWF0aW9uIGlzIGNvbXBsYWluaW5nIGFib3V0IHRoaXMgcGF0Y2ggd2hpbGUKPiA+ID4gcnVu
bmluZyBkdGJzX2NoZWNrOgo+ID4gPiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4y
MGktZDFzLW1hbmdvcGktbXEuZHRiOiB0aGVybWFsLXpvbmVzOiBjcHUtdGhlcm1hbDogJ3RyaXBz
JyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5Cj4gPiA+ICAgICAgICAgRnJvbSBzY2hlbWE6IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3RoZXJtYWwtem9uZXMueWFtbAo+
ID4KPiA+IEkgZGlkbid0IGFkZCAndHJpcHMnIGJlY2F1c2UgSSdtIG5vdCBzdXJlIGlmIHRoZXkg
c2hvdWxkIGJlIHRoZSBzYW1lCj4gPiBmb3IgdGhlIEQxIGFuZCB0aGUgVDExM3MuCj4KPiBJJ20g
c29ycnksIGJ1dCBJIGFtIG9mIG5vIGhlbHAgdGhlcmUuIFBlcmhhcHMgc29tZSBvZiB0aGUgQWxs
d2lubmVyIGRldnMKPiBjYW4gaGVscCB5b3Ugb24gdGhhdCBmcm9udC4KPgo+ID4gTWF5YmUgaXQn
cyBiZXR0ZXIgdG8gZHJvcCAndGhlcm1hbC16b25lcycgZnJvbSB0aGlzIHBhdGNoIGFuZCBhZGQg
dGhlbQo+ID4gbGF0ZXIgaW4gc2VwYXJhdGUgcGF0Y2hlcwo+ID4gZm9yIFQxMTNzIGFuZCBEMT8K
Pgo+IERvZXMgaXQgcGFzcyBkdGJzX2NoZWNrIHdpdGggdGhlIHRoZXJtYWwtem9uZXMgcmVtb3Zl
ZD8KClllcywgaXQgcGFzc2VzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
