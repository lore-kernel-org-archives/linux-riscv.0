Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4E3EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CD404fwCn6aFxI6HGZWzqYP671IY2BIT5u/LlKTCmc=; b=LWucTw6oURaFhF
	wgGBMbFAsBmp5MIH6HZ7Z/aT6TBg6JERPL4JJgQPbc5cbWCTjpQUUgj53BPyHGCRCTOfJVp+MzCpm
	57S1UKVMHlZoA7t2rHnw8MC80ynE367XuXko9ydzg44vwEDfvV8zAC0/YobYaVMolOy3Lc7U32tGE
	MluI3Nx2s+JMo738WkINAOLnEOor7pk5wpLIfwzt+FbDNk9KPd3mPCXns1+hoQP7V5eYvfLazXpLs
	LVj9scCPWqKYGXFaV1P140wl2vGVEiu3NoQwb2X4Jyg7VyEshn9UapDkM+GS3z4tpR3BqKx2LGEAa
	O/7kJLzUW7iV5emapenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVu0-00H08y-12;
	Wed, 12 Jul 2023 09:12:52 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVtx-00H07e-06
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 09:12:50 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-577412111f0so79668847b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 02:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689153163; x=1691745163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9F/x6582lk37reIeB18SnK4WCkuUe1D9J8p4xQoxLk=;
        b=j5ixt3POd2Md+GuoKCGrvJO85694UH5Ci1mqVXXSzQ3DoNMV6VxB0fkPAwEh5eRFU7
         Cp6D0IrjlETJMgtTlOk8zaelWVXgG42btyApYANHkRcv91vZpcizFswdvbhUwA7he8+T
         VjmTHn8zrFw7gq5YvaqjACl00dBk0U9jBHBTqJo/V1NDNBCqPnRuOJTqlQRbkM1iMwj2
         YZlrFvWuvpFot6IpQo9d7fEBPzvF/wecSEAvdUvJ867ZLgCP4PmzfeDDPVAdVVN+BhB4
         g8QSCppC7OPBbXwNC4MFMNWmldm0BH5nJN2quBp3F4epNHrf5qnpm9LWT6x05Tyx1irE
         VIyQ==
X-Gm-Message-State: ABy/qLakVz5S8ddvB0fO8SNmPQ8HxPGq71sAjwuMZTNuHqUCgpkXPuV2
	JZBaVYHDS/kszZdgBvJuoT60qfeosOU7bQ==
X-Google-Smtp-Source: APBJJlHcbkCS4W+uy83k5gi7dy3YK/AVOg6RDJpzXm17geAAXcw5IALJBP0VSqKIj7efxRxw4oVN0A==
X-Received: by 2002:a81:7d57:0:b0:56c:e706:2e04 with SMTP id y84-20020a817d57000000b0056ce7062e04mr19992166ywc.0.1689153163190;
        Wed, 12 Jul 2023 02:12:43 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id v2-20020a0dd302000000b005707fb5110bsm1070386ywd.58.2023.07.12.02.12.42
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 02:12:42 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-57712d00cc1so79560287b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 02:12:42 -0700 (PDT)
X-Received: by 2002:a25:4c85:0:b0:c24:4536:1723 with SMTP id
 z127-20020a254c85000000b00c2445361723mr17223170yba.26.1689153162357; Wed, 12
 Jul 2023 02:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-squealer-walmart-9587342ddec1@wendy>
In-Reply-To: <20230712-squealer-walmart-9587342ddec1@wendy>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2023 11:12:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzHSPRjJRyj0BWEBD6t6MMmRSzkbu9coGZS4bcd8yEjA@mail.gmail.com>
Message-ID: <CAMuHMdWzHSPRjJRyj0BWEBD6t6MMmRSzkbu9coGZS4bcd8yEjA@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: renesas: clean up dtbs_check W=1 warning
 due to empty phy node
To: Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_021249_070479_C6AB2E2C 
X-CRM114-Status: GOOD (  17.65  )
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

T24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgMTA6MTXigK9BTSBDb25vciBEb29sZXkKPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiBkdGJzX2NoZWNrIHcvIFc9MSBjb21wbGFpbnM6
Cj4gV2FybmluZyAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IC9zb2MvZXRoZXJuZXRAMTFjMjAwMDAv
ZXRoZXJuZXQtcGh5QDc6IG5vZGUgaGFzIGEgdW5pdCBuYW1lLCBidXQgbm8gcmVnIG9yIHJhbmdl
cyBwcm9wZXJ0eQo+IFdhcm5pbmcgKGF2b2lkX3VubmVjZXNzYXJ5X2FkZHJfc2l6ZSk6IC9zb2Mv
ZXRoZXJuZXRAMTFjMjAwMDA6IHVubmVjZXNzYXJ5ICNhZGRyZXNzLWNlbGxzLyNzaXplLWNlbGxz
IHdpdGhvdXQgInJhbmdlcyIgb3IgY2hpbGQgInJlZyIgcHJvcGVydHkKPgo+IFRoZSBldGhlcm5l
dEAxMWMyMDAwMCBub2RlIGlzIGd1YXJkZWQgYnkgYW4gYCNpZiAoIVNXX0VUMF9FTl9OKWAgaW4K
PiByemcydWwtc21hcmMtc29tLmR0c2ksIHdoZXJlIHRoZSBwaHkgY2hpbGQgbm9kZSBpcyBhZGRl
ZC4gSW4KPiByemZpdmUtc21hcmMtc29tLmR0c2ksIHRoZSBldGhlcm5ldCBub2RlIGlzIG1hcmtl
ZCBkaXNhYmxlZCAmIHRoZQo+IGludGVycnVwdCBwcm9wZXJ0aWVzIGFyZSBkZWxldGVkIGZyb20g
dGhlIHBoeSBjaGlsZCBub2RlLiBBcyBhIHJlc3VsdCwKPiB0aGUgcHJvZHVjZWQgZHRzIGxvb2tz
IGxpa2U6Cj4gICAgICAgICBldGhlcm5ldEAxMWMyMDAwMCB7Cj4gICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAicmVuZXNhcyxyOWEwN2cwNDMtZ2JldGhcMHJlbmVzYXMscnpnMmwtZ2JldGgi
Owo+ICAgICAgICAgICAgICAgICAvKiBzbmlwICovCj4gICAgICAgICAgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDB4MDE+Owo+ICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDAwPjsK
PiAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPgo+ICAgICAgICAgICAgICAg
ICBldGhlcm5ldC1waHlANyB7Cj4gICAgICAgICAgICAgICAgIH07Cj4gICAgICAgICB9Owo+Cj4g
QWRkaW5nIGEgY29ycmVzcG9uZGluZyBgI2lmICghU1dfRVQwX0VOX04pYCBhcm91bmQgdGhlIG5v
ZGUgaW4KPiByemZpdmUtc21hcmMtc29tLmR0c2kgYXZvaWRzIHRoZSBjb21wbGFpbnQsIGFzIHRo
ZSBlbXB0eSBjaGlsZCBub2RlIGlzCj4gbm90IGFkZGVkOgo+ICAgICAgICAgZXRoZXJuZXRAMTFj
MjAwMDAgewo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjlhMDdnMDQz
LWdiZXRoXDByZW5lc2FzLHJ6ZzJsLWdiZXRoIjsKPiAgICAgICAgICAgICAgICAgLyogc25pcCAq
Lwo+ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwweDAxPjsKPiAgICAgICAgICAg
ICAgICAgI3NpemUtY2VsbHMgPSA8MHgwMD47Cj4gICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJk
aXNhYmxlZCI7Cj4gICAgICAgICB9Owo+Cj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgppLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1k
ZXZlbCBmb3IgdjYuNi4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4
IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0
CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIg
b3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
