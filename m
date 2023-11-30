Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391C0C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oeQRwCgsCEeMV0EuER0KGjQ4vmc0wW0gsschD+UP3g=; b=h755nr9IdObA9b
	1Zs8s5/WofIfPoXcafUOVUbk/EykkOwijGPpnaoLhSaRgpaliOoEaJubpk9qs4jdX0+JdIIFOltPY
	fU+s5Lqkxyr0dEA1LMO0RI52+BPEEJWR/givvqU/VqTEYhWToOkbpEEs8iFyIMNpcjzERP666JrrB
	pZ1mNWLr+OlnWYVIHIOZkJRvHSSsYc08WMN+lJ42z0cVxf7VWh2nybavVvSQZjX70qLllg2OF1SCY
	jlA3Q6lF+e9NpAeCueE0kq7rq/UvkZFCWF5G5hLNt/AZaygJ8MEKDkWYZrAhbjiuu7vjDZSR3tlQ8
	kHk6eL0T3lJDxPxmjoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cjB-00AFfW-2R;
	Thu, 30 Nov 2023 08:48:57 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cj8-00AFex-2j
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 08:48:56 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4b2870c9c75so203962e0c.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 00:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701334132; x=1701938932; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF7XvGuHSm4q9cnkGKHl6GS7PieI8sIUSAiGVDbmtsI=;
        b=Lv16oHbij4WUVvy46xQW+n2CID4pUXB7/gbCG61mmbsjnEcK1bg+//7Iio5+kiVJ5g
         J8sT1Vz0du39M7Lmkx3aebLFVctKjecgo9Vym/txMYxjCdtCFtbpln4z+YCx/H8txYcB
         yohTADX1dhVIqacngHfeTuRfJ1joTo0LSJLU20VkmuIqYCtGBcFA2KdQQoa/gE2bDBMw
         MJDyXF0Ch48i+zj/n//oCBFSCbL+EEGAxH6XaH1nPJVNEfW3t+SlfI+rx1JL9DjR+u6o
         JdxVgeE/mtIZ9HuurFlw8Tr/9lyvZB8BI18enFEADmq2VarUbHf9tEuRUrueVvSf8BDX
         mlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701334132; x=1701938932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DF7XvGuHSm4q9cnkGKHl6GS7PieI8sIUSAiGVDbmtsI=;
        b=rMI8ILFzZr1bkaHS0wFlgeSNbDDQNlzHwp5aVlN/eh/931mfk9IpAkjLwc15nYGntL
         LkRzSFFJpdj3+2gSFOxVWEKSbXfncfMAoNLc/o0L1abdt5WVLfn87CiM252GNfs9sE5w
         1ncON4vKrXKi6zP9qzgUK1ZK5+FXzkdQqe1cdfK+n/EydBgcfHhccnQBwXryreJNhkD3
         bLM3WPc50+mEnVyhMpb6AeA8Oz+Y3WCSCKISJUDUWiw83tOfwn7rR13wqNYvSQJsLqTF
         dV98debvZTBuh3JCK0P7ggqhYkWmxSXQ20+aUKhKi6wnX3gznaD4qsOqBV5/C+/uep6T
         Tp1w==
X-Gm-Message-State: AOJu0Yw2sILGTZKzv1A5kANwPranNq3lo15xigZH4sXPGRnIHfTiVZ5B
	p8eFTn1J85mbjKJBA4ZZKjR1AoaU3arEB5RW7IE=
X-Google-Smtp-Source: AGHT+IENbhoxvWJXvzBWw3lpE7WMLLrRbOa+oWZ/Vdtiq/Pa8Et2KtxYJnJpx4cNfg1W2UKBvV/KXrZi8TIXFysK/FA=
X-Received: by 2002:ac5:c245:0:b0:4b2:83ab:7ebd with SMTP id
 n5-20020ac5c245000000b004b283ab7ebdmr4968715vkk.11.1701334132657; Thu, 30 Nov
 2023 00:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20231017104638.201260-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8t3sGn83vpgjECf5dw=bbz2yPXpnn+v2Dx2q3yJRPsKgA@mail.gmail.com> <CAMuHMdXMRj4quvO87LbLHCCLr14EK2AXsvr_muTDrBrA8+BMjg@mail.gmail.com>
In-Reply-To: <CAMuHMdXMRj4quvO87LbLHCCLr14EK2AXsvr_muTDrBrA8+BMjg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Nov 2023 08:48:26 +0000
Message-ID: <CA+V-a8tjy2Ttp_TbZT63PC_UY12J8FLcziCtef-D-jgw_CmKaA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add missing port pins for RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_004854_882353_39A2F5D6 
X-CRM114-Status: GOOD (  17.89  )
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

SGkgR2VlcnQsCgpPbiBXZWQsIE5vdiAyOSwgMjAyMyBhdCAzOjMy4oCvUE0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4K
PiBPbiBXZWQsIE5vdiAyOSwgMjAyMyBhdCAzOjQ04oCvUE0gTGFkLCBQcmFiaGFrYXIKPiA8cHJh
Ymhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gT24gVHVlLCBPY3QgMTcsIDIwMjMg
YXQgMTE6NDfigK9BTSBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90
ZToKPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW50ZW5kcyB0byBpbmNvcnBvcmF0ZSB0aGUgYWJz
ZW50IHBvcnQgcGlucyBQMTkgdG8gUDI4LAo+ID4gPiB3aGljaCBhcmUgZXhjbHVzaXZlbHkgYXZh
aWxhYmxlIG9uIHRoZSBSWi9GaXZlIFNvQy4KPiA+ID4KPiA+ID4gQ2hlZXJzLAo+ID4gPiBQcmFi
aGFrYXIKPiA+ID4KPiA+ID4gUkZDIC0+IHYyOgo+ID4gPiAqIEZpeGVkIHJldmlldyBjb21tZW50
cyBwb2ludGVkIGJ5IEdlZXJ0ICYgQmlqdQo+ID4gPgo+ID4gPiBSRkM6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyMzA2MzAxMjA0MzMuNDk1MjktMy1wcmFiaGFrYXIubWFoYWRldi1s
YWQucmpAYnAucmVuZXNhcy5jb20vVC8KPiA+ID4KPiA+ID4gTGFkIFByYWJoYWthciAoMyk6Cj4g
PiA+ICAgcGluY3RybDogcmVuZXNhczogcnpnMmw6IEluY2x1ZGUgcGlubWFwIGluIFJaRzJMX0dQ
SU9fUE9SVF9QQUNLKCkKPiA+ID4gICAgIG1hY3JvCj4gPiA+ICAgcGluY3RybDogcmVuZXNhczog
cGluY3RybC1yemcybDogQWRkIHRoZSBtaXNzaW5nIHBvcnQgcGlucyBQMTkgdG8gUDI4Cj4gPiA+
ICAgcmlzY3Y6IGR0czogcmVuZXNhczogcjlhMDdnMDQzZjogVXBkYXRlIGdwaW8tcmFuZ2VzIHBy
b3BlcnR5Cj4gPiA+Cj4gPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQz
Zi5kdHNpIHwgICA0ICsKPiA+ID4gIGRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpn
MmwuYyAgICAgfCAyNjMgKysrKysrKysrKysrKysrKysrLS0KPiA+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMjQyIGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gR2VudGxlIHBp
bmcuCj4KPiBBcyB0aGUga2VybmVsIHRlc3Qgcm9ib3QgcmVwb3J0ZWQgYSBidWlsZCBpc3N1ZSBm
b3IgUEFUQ0ggMS8zLCBJIGhhZAo+IHJlbW92ZWQgdGhpcyBzZXJpZXMgZnJvbSBteSByZXZpZXcg
cXVldWUuClN0cmFuZ2UgcGF0Y2h3b3JrIHN0YXR1cyBkaWRudCBtZW50aW9uIGl0IGFzICJyZWpl
Y3RlZCIuCgo+IERvIHlvdSBzdGlsbCB3YW50IG1lIHRvIHJldmlldyB2Miwgb3IgZG8geW91IHdh
bnQgdG8gc2VuZCBhIHYzIGZpcnN0Pwo+Ck5vIHdvcnJpZXMsIEknbGwgc2VuZCBhIHYzIGFuZCB3
ZSBjYW4gZ28gZnJvbSB0aGVyZS4KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
