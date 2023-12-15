Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58341C35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IT2IL0qG0OVGVaVEXFUcsgTnv/nLha9VRkWxghFQmGs=; b=VLLpkgW7OShv6g
	eC6opTdib7zNxaG0n7Q266A2RUY/FIG82K0iw0oYdsJGf1llNgteNT5Geay6cf5Wa6UWnTnpArAds
	rlSbQOU4LOmuQcn5r4zC8WPK9thpJBBYUHaYjPccfNYtVji02+mG8Y9uLEVar8n33smbk7OwCBQTw
	Pahdb9JuDSORAVhnvUypMPUYUFfAyk0d7SzQH8HWf0414dHGW18eJHycKqFQk4naIjqw0OHCvP5Rn
	4Ux5Yz1fqQ5h0B/7y+17beyKhjeBrN4lohXKTY2Dw8y5ZyZVFbHBQ9/8Y9PJWdsXWNx8hdl3ACGui
	wpi8xvjhdbKTpNzvm1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9yC-003iE4-0K;
	Fri, 15 Dec 2023 15:19:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9y9-003iCq-0V;
	Fri, 15 Dec 2023 15:19:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33642523623so655390f8f.2;
        Fri, 15 Dec 2023 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702653554; x=1703258354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMReaTbQ3mhpSM37nBgg+G+dvqzrCE9o1IcxtKQzbVA=;
        b=bwla7NpbfXen3TAIDPI+1LaMBvVcNiL/Gb0/FZjUMGCHx1UNn0OzLTqg4S9kw5S5Kn
         YlsC3pcJoqJXfkxUMEaR8tQcJHGnBCOxwxm9ve6J7ZPCR4TZClmOfBCr4d8HE4lJz7aa
         9wwHgttCY5Q4kwNN4dqZ6zfjIj4FN0/6q/6IybGlDxuP8dmDvZRmpOPxsCsLKYvzve1e
         yElezegLlbuFdFp8qSMmPGEeMZ7TqB1Kfv1hKIAJg6kxrukTGR56w9Co2mBtYZcay8ET
         BXN7q/G1l1QxeWg8SBFZMA+7MzPRwawdOxpEDNByEsMd3iDjtlI8RMsg6QDjAWZmkKxI
         malg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702653554; x=1703258354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMReaTbQ3mhpSM37nBgg+G+dvqzrCE9o1IcxtKQzbVA=;
        b=Euuft0NA7pRv89l/xKt7cS36Hsr8scZTEnOR4ob3VOXgiVs/a2PyBGvN7WN/3Djv7F
         1MQ/LCRoEgHu1RnTOkjQEMMEtz4+Oo89iBVtG4MjWsOIP71HEmUD4nnOvYHiM06lbcCl
         /mdpMJIoNERK48P3iEwPCZIZ11cE2m7qCYxqtz/+C/zN1WIEL32knI8hGZOmXOGHcEOX
         XaIJS1txb6dXy4NzpGeNn6e5qHd1RwbkK9gmchSrG40RJq8e39vCJ4y14ocUKdixJMWk
         SLznMi6ombP9GosFNyZ9OQQRGPKB6iDUj34QbVnHFa237uIZf/Dog53XOXUpYzBUobXQ
         vxsg==
X-Gm-Message-State: AOJu0YzzrsqGf+lGEiL/kQMUBKKubT2gUfhfM9/qU7XzWCgNiNWsSfV1
	xABtmKsetbIfUW6ibi/5itI=
X-Google-Smtp-Source: AGHT+IGKqTqBRSWdn71ojaWth20HbPUm9gy+BpxlK4y7dtRj5sPpy5aey1MFNTP111CfVFovxNGCrQ==
X-Received: by 2002:a5d:4573:0:b0:336:595d:d201 with SMTP id a19-20020a5d4573000000b00336595dd201mr291256wrc.19.1702653554178;
        Fri, 15 Dec 2023 07:19:14 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.212])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b003364360839esm5891186wrx.81.2023.12.15.07.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 07:19:13 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: jernej.skrabec@gmail.com
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	fusibrandon13@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rafael@kernel.org,
	robh+dt@kernel.org,
	samuel@sholland.org,
	tiny.windzz@gmail.com,
	viresh.kumar@linaro.org,
	wens@csie.org
Subject: Re: [PATCH 1/5] riscv: dts: allwinner: Update opp table to allow CPU frequency scaling
Date: Fri, 15 Dec 2023 16:18:35 +0100
Message-Id: <20231215151835.46492-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <2177637.Mh6RI2rZIc@archlinux>
References: <2177637.Mh6RI2rZIc@archlinux>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_071917_192214_603DEFE8 
X-CRM114-Status: GOOD (  31.88  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgNTozN+KAr1BNIEplcm5laiDFoGtyYWJlYyA8amVybmVq
LnNrcmFiZWNAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodXJzZGF5LCBEZWNlbWJlciAxNCwg
MjAyMyAyOjQ3OjE0IFBNIENFVCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBUaHUsIERlYyAx
NCwgMjAyMyBhdCAwNDo0NDo0NlBNICswNTMwLCBWaXJlc2ggS3VtYXIgd3JvdGU6Cj4gPiA+IE9u
IDE0LTEyLTIzLCAxMTozMywgQnJhbmRvbiBDaGVvIEZ1c2kgd3JvdGU6Cj4gPiA+ID4gVHdvIE9Q
UHMgYXJlIGN1cnJlbnRseSBkZWZpbmVkIGZvciB0aGUgRDEvRDFzOyBvbmUgYXQgNDA4TUh6IGFu
ZAo+ID4gPiA+IGFub3RoZXIgYXQgMS4wOEdIei4gU3dpdGNoaW5nIGJldHdlZW4gdGhlc2UgY2Fu
IGJlIGRvbmUgd2l0aCB0aGUKPiA+ID4gPiAic3VuNTBpLWNwdWZyZXEtbnZtZW0iIGRyaXZlci4g
VGhpcyBwYXRjaCBwb3B1bGF0ZXMgdGhlIG9wcCB0YWJsZQo+ID4gPiA+IGFwcHJvcHJpYXRlbHks
IHdpdGggaW5zcGlyYXRpb24gZnJvbQo+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9UaW5hLUxp
bnV4L2xpbnV4LTUuNC9ibG9iL21hc3Rlci9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N1bnhpL3N1bjIw
aXcxcDEuZHRzaQo+ID4gPiA+Cj4gPiA+ID4gVGhlIHN1cHBseSB2b2x0YWdlcyBhcmUgUFdNLWNv
bnRyb2xsZWQsIGJ1dCBzdXBwb3J0IGZvciB0aGF0IElQCj4gPiA+ID4gaXMgc3RpbGwgaW4gdGhl
IHdvcmtzLiBTbyBzdGljayB0byBhIGZpeGVkIDAuOVYgdmRkLWNwdSBzdXBwbHksCj4gPiA+ID4g
d2hpY2ggc2VlbXMgdG8gYmUgdGhlIGRlZmF1bHQgb24gbW9zdCBEMSBib2FyZHMuCj4gPiA+ID4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCcmFuZG9uIENoZW8gRnVzaSA8ZnVzaWJyYW5kb24xM0Bn
bWFpbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdp
bm5lci9zdW4yMGktZDFzLmR0c2kgfCAxOCArKysrKysrKysrKysrKystLS0KPiA+ID4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1k
MXMuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaQo+
ID4gPiA+IGluZGV4IDY0YzNjMmU2Yy4uZTIxMWZlNGM3IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaQo+ID4gPiA+ICsrKyBi
L2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaQo+ID4gPiA+IEBA
IC0zOSwxNiArMzksMjIgQEAgY3B1MF9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7Cj4gPiA+
ID4gwqAgfTsKPiA+ID4gPgo+ID4gPiA+IMKgIG9wcF90YWJsZV9jcHU6IG9wcC10YWJsZS1jcHUg
ewo+ID4gPiA+IC0gwqAgwqAgwqAgwqAgY29tcGF0aWJsZSA9ICJvcGVyYXRpbmctcG9pbnRzLXYy
IjsKPiA+ID4gPiArIMKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjIwaS1k
MS1vcGVyYXRpbmctcG9pbnRzIiwKPiA+ID4KPiA+ID4gSSBkb24ndCB0aGluayB5b3Ugc2hvdWxk
IGFkZCBhIG5ldyBjb21wYXRpYmxlIGZvciBldmVyeSBTb0MgdGhhdCBuZWVkcwo+ID4gPiB0byBi
ZSBzdXBwb3J0ZWQgYnkgYSBEVCBiaW5kaW5ncyBhbmQgY3B1ZnJlcSBkcml2ZXIuIE1heWJlIHlv
dSBzaG91bGQKPiA+ID4ganVzdCByZXVzZSAiYWxsd2lubmVyLHN1bjUwaS1oNi1vcGVyYXRpbmct
cG9pbnRzIiBhbmQgaXQgd2lsbCB3b3JrCj4gPiA+IGZpbmUgZm9yIHlvdSA/Cj4gPiA+Cj4gPiA+
IFJvYiA/Cj4gPgo+ID4gVGhlIGRyaXZlciBjYW4gZGVmaW5pdGVseSBqdXN0IHJldXNlIHN1bjUw
aS1oNiwgYnV0IHRoZSBiaW5kaW5nIGFuZAo+ID4gZGV2aWNldHJlZSBzaG91bGQgaGF2ZSBhIHNv
Yy1zcGVjaWZpYyBjb21wYXRpYmxlIGZvciB0aGUgc3VuMjBpLWQxLgo+Cj4gQ29ycmVjdC4gVGhp
cyBpcyB0byBhdm9pZCBsYXRlciByZWdyZXRzIGlmIGl0IHR1cm5zIG91dCB0aGVyZSBhcmUgc29t
ZSBzbGlnaHQKPiBkaWZmZXJlbmNlcyBvciBhZGRpdGlvbmFsIGZ1bmN0aW9uYWxpdHkuCj4KPiBC
ZXN0IHJlZ2FyZHMsCj4gSmVybmVqCj4KPiA+Cj4gPiBUaGF0IHNhaWQsIHRoZSBjb21wYXRpYmxl
IGRvZXMgbmVlZCB0byBiZSBkb2N1bWVudGVkLCB0aGVyZSdzIGEKPiA+IGR0LWJpbmRpbmdzIHBh
dGNoIG1pc3NpbmcgZnJvbSB0aGlzIHNlcmllcy4KPiA+Cj4gPiBDaGVlcnMsCj4gPiBDb25vci4K
Pgo+Cj4KPgoKVGhpcyBkdC1iaW5kaW5ncyBwYXRjaCB3aWxsIGJlIGF2YWlsYWJsZSBpbiB2MgoK
VGhhbmtzIGZvciByZXZpZXdpbmcuCkJyYW5kb24uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
