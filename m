Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CABC4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbb5ME871Ag0NigvruACBxK7btlJw6MWKgIv4ngQG28=; b=N8fdvYmn8CHy1s
	89KP6AFjXrRzzE1+/YhYv8uj7QvHoVNn+8dOpOCy16P5Q99JZCXJLSOW6YrvNWWu4fkvjPAsU6FR+
	NwHYyucoA8jcySv0FGMCLQwTLbopO/nZmIRdzu0nrmKvkLCXrTgPu6vjOJkujnAyJgn6vsu5o46gm
	JVkcmc/A5/KXXKmmYm9MuAqwpRdDX2GKnCaimVjbb5lrqjjNVX9IBHq4EhtQf5Hg32r9bJbaFZJbu
	Px2Du+4rTyxRh1MuKirxK0R9H9q95irZSL2r+XhTTMwwKqrCZjCKDc9BaGxiwo9iZspK9wFWTqccB
	/Pz/QpM3PlWD0UicYQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Bre-003g19-WB; Mon, 05 Dec 2022 13:50:35 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BrW-003fta-Rc
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 13:50:32 +0000
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3F4983F120
	for <linux-riscv@lists.infradead.org>; Mon,  5 Dec 2022 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1670248216;
	bh=lDFKXKvJN0XrlcubPN8uKD86PQNw4+8sbbVe0b01rSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=DILNgyuuQRvaC8t9x9TLhrnGXXjAkckN7H1xGpyNotp6aw65VCC0kNYaHjnLohYId
	 PiO2fKrTpNEk6EVLl7Asy0HmUw4019IyNJxujQFObIPw1n04RhtM7V5cZwzja6rPfU
	 MxHfYZX0YJljh4+cn6CBQOWcgeXSGn6DnIBBonMDGlzIyT3X9Kg98V/3E9Nu5SASZm
	 eFD0wych0LxQf4DpxrD7teTOPE1liz50zPPu6d2wsUyCyMt/sXVxBy/EPpjYLatig6
	 emRbWxvAivoMSM7IRubvC3RuqCEB4666EdhHU8VqKgFsV/t9DNxcE1w4flIqrzkjvv
	 +XZi6GnaxMHvg==
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-3dddef6adb6so107520607b3.11
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 05:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDFKXKvJN0XrlcubPN8uKD86PQNw4+8sbbVe0b01rSk=;
        b=T/Vx1+yjy0KFdycsd3HTs5Ou1LkPYaavzIHCwyok6h8i2LJLGSX0cfz9hWmHLp0bFw
         /F5d6MRh0ltimGVv0O9jhK0vQuXlbfv6WaNcwkzMELEApWaF/xViVquwXcQX1mdaFGzW
         2qp5/cwffoOxOeG9KYV1M26kn0HRSeSXgaC0Z+BC0X/d9IqXicy09LHEQ8pkpcvmkki8
         yYY+1pZksQAALCHCF7FtdkueQBuADesCiJvh5PErLDlAj395Z52k6tgJPwVkHESsSOjI
         e39ko6WyMP5lj5QMwKZ+yiqZQVllJzamx/Eho9A33Wc1PGITi7KYOlaWQ1f2oiO5KXAC
         msLg==
X-Gm-Message-State: ANoB5plhWLEKv9kNZqZpCz9o3s6Y2QhACve41t+Sigv2G8xgrvR0raHT
	Uh+WXumpz4VvSjc8oIdN7dsdD235w3vv72FsKo5sPAgtQ2Strf3IfWNB3HhsxpFScCbBRfQrtLl
	RktTOocmtc6bWDOSrP34OuJ2rnuphDS7cajAzsoXdOpKyEi+pOsdydPSx48TyAQ==
X-Received: by 2002:a25:3f85:0:b0:6f4:61ff:6624 with SMTP id m127-20020a253f85000000b006f461ff6624mr41754930yba.551.1670248215359;
        Mon, 05 Dec 2022 05:50:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4uZUQRlKpVtuE0cNmf6AqSIUjpeENW9bCW8inMdZpCAxHmA3XNmIDthwa0clmQpWAhhZ5bpkGSUQtylakwnSU=
X-Received: by 2002:a25:3f85:0:b0:6f4:61ff:6624 with SMTP id
 m127-20020a253f85000000b006f461ff6624mr41754914yba.551.1670248215182; Mon, 05
 Dec 2022 05:50:15 -0800 (PST)
MIME-Version: 1.0
References: <20221109113724.519021-1-emil.renner.berthing@canonical.com>
 <20221109120102.ylnseq2w33rvt7fz@pengutronix.de> <CAJM55Z-EVXB6FTWwh_vY_B3LoVv+b7TCQCE7asB8G8wkEwui_g@mail.gmail.com>
 <20221109153311.cszr7fgfmyelwra3@pengutronix.de> <CAJM55Z8vpJ0XtQqnsFMLE4rkyV11ePbNjtYx0u4pgM9-MT=Kvg@mail.gmail.com>
 <20221128082441.wsqcpuxqk6cynako@pengutronix.de>
In-Reply-To: <20221128082441.wsqcpuxqk6cynako@pengutronix.de>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 5 Dec 2022 14:49:58 +0100
Message-ID: <CAJM55Z8eGCL9LyPBzgV3JW+qEZAoMLn3v7nkwwoMVGTjEg6vjA@mail.gmail.com>
Subject: Re: [PATCH v2] pwm: sifive: Always let the first pwm_apply_state succeed
To: Thierry Reding <thierry.reding@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, "Wesley W. Terpstra" <wesley@sifive.com>, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_055027_358024_C6BF5C9E 
X-CRM114-Status: GOOD (  22.47  )
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

T24gTW9uLCAyOCBOb3YgMjAyMiBhdCAwOToyNCwgVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gSGVsbG8sCj4KPiBPbiBXZWQsIE5vdiAx
NiwgMjAyMiBhdCAwNjo0MTowNlBNICswMTAwLCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToK
PiA+IE9uIFdlZCwgOSBOb3YgMjAyMiBhdCAxNjozMywgVXdlIEtsZWluZS1Lw7ZuaWcKPiA+IDx1
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gPiBPbiBXZWQsIE5vdiAw
OSwgMjAyMiBhdCAwMTo0NTo0M1BNICswMTAwLCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToK
PiA+ID4gPiBIb3cgYWJvdXQgd2UgbWVyZ2UgdGhpcyBidWcgZml4IHRoYXQgY2FuIGVhc2lseSBi
ZSBiYWNrcG9ydGVkIGZpcnN0Cj4gPiA+ID4gYW5kIHRoZW4gbG9vayBhdCBob3cgaXQgc2hvdWxk
IGJlIGhhbmRsZWQgcHJvcGVybHk/Cj4gPiA+Cj4gPiA+IEkgdGhvdWdodCBpdCB3b3VsZG4ndCBi
ZSB0aGF0IGhhcmQgdG8gZG8gaXQgcmlnaHQgZnJvbSB0aGUgc3RhcnQsCj4gPiA+IGJ1dCBJIGFk
bWl0IGl0J3MgaGFyZGVyIHRoYW4gSSBleHBlY3RlZCB0byBnZXQgcmlnaHQuIE15IHByb3RvdHlw
ZSBsb29rcwo+ID4gPiBhcyBmb2xsb3dzOgo+ID4KPiA+IFRoaXMgd29ya3MgZm9yIG1lIChtb2R1
bG8gdGhlIHR3byBleHRyYSB7J3MpLiBJJ2Qgc3RpbGwgcHJlZmVyIG1lcmdpbmcKPgo+IFllYWgs
IGRpZG4ndCBldmVuIHRyeSB0byBjb21waWxlIGl0Lgo+Cj4gPiB0aGUgc2ltcGxlciB2ZXJzaW9u
IGFuZCB0aGVuIHRoaXMgb24gdG9wIGZvciBlYXNlIG9mIGJhY2twb3J0aW5nLCBidXQKPiA+IGFz
IGxvbmcgYXMgdGhlIHJhY2UgaXMgZml4ZWQgSSdtIGZpbmUuIFdpbGwgeW91IHNlbmQgYSBjbGVh
bmVkIHVwCj4gPiB2ZXJzaW9uIG9mIHRoaXM/Cj4KPiBJJ2QgbGV0IFRoaWVycnkgZGVjaWRlIHdo
YXQgaGUgd2FudCBoZXJlLiBEZXBlbmRpbmcgb24gaGlzIGNob2ljZSBJIGNhbgo+IGNsZWFuIHVw
IG15IHN1Z2dlc3Rpb24gKGluY2x1c2l2ZSBjb21waWxlIHRlc3QpIG9uIHRoZSB0aGVuIHJlbGV2
YW50Cj4gc3RhdGUgb2YgdGhlIGRyaXZlci4KCkBUaGllcnJ5LCBpdCBzZWVtcyB0aGlzIGlzIHN0
dWNrIG9uIHNvbWUgb3BpbmlvbiBmcm9tIHlvdS4KCi9FbWlsCj4gQmVzdCByZWdhcmRzCj4gVXdl
Cj4KPiAtLQo+IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3
ZSBLbGVpbmUtS8O2bmlnICAgICAgICAgICAgfAo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25z
ICAgICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlLyB8CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
