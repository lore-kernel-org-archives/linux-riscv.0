Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10397C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmQ/LZm3g6RxZQ823YA99uuUiyDX7MpdcLXBy3wj9vY=; b=Kr3Y/Al97w8fPk
	iVAd7D51XCemDKV3NWwrtYfaDznq+vd+LXBNUagD3f2UiYsM0ROWfc+QoEZBHKS8urBEgWXDCMg3Y
	B035dozfrorF009chQFBLKO1MVs+lGVih7vIr7LhwUqW0vR8lIbd+/Q1gqrrgpP1l4/g+yW1zqm8A
	kdjc17iCQE84K7ZaaI8xS8dLIg3KhIzgZvM7psBCK+j8pyRv0BkfvUhYsq2y2Vg0A0neHN6gevYGF
	k0qCTHzBKJBnRVu8BOpkHZdcTJhG8qG27jAVjlE4Wi0rF50DuI8eupDWE34D3NvkXH01uuz3eLrpZ
	DIhS479TNexDVwpOW9Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmww3-0000000HRYS-14Al;
	Wed, 20 Mar 2024 14:28:55 +0000
Received: from mail-yb1-f170.google.com ([209.85.219.170])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmww0-0000000HRX7-0j6s
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 14:28:53 +0000
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so6221731276.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 07:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710944929; x=1711549729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNEkSKkVWT+9MCxMbsjwWRjuZvzej3VkUeX2qsKaTBc=;
        b=Gy91IJE4JpJBKr/Lsf4orJZ4DpU4gz8llxrgEiYTWfy2/ukRQycvxN82uxtxyl7ws1
         Q/gew0V6LpVO+k/SZa8fIqN9gbK/txhQgwKuxxpK+QCAvD8UJkCRZD9tVEqVCQtfKTGF
         86OA/mbmtDOiaQLIyPYZPWlVn9Gm9J9w5jXssm8j+Zv3UriAJsMTa1LA2Oj7R97Z4AZQ
         uwLRAVHbLKdUl9E9fafV5T0FPXHRBx7WIQmiXCIFWaf8w/SsM+JEOI8IADKqm7c4/LDl
         yuT0h5urjzcYir5212lCNVl/6gs9sJiMifksIBPgKBMje39JrPYLHILz6hd9A4NrkzVw
         LUDg==
X-Forwarded-Encrypted: i=1; AJvYcCW1zzGkk5rp/NZKrnhrofx21DTtI8bt96HXAgEL5TWDX9gCEGzWToK+J/a50D5ZrvPCCN42H6ItdVyWPanDFbYFzaCOJQpuzqoEPrCQKQfW
X-Gm-Message-State: AOJu0YyHhnoIqUmAq5v/cGLBT/JK1ucvEyA+DjneoZTYaGZ5VWJQQeC4
	sw2L6grAfhPDmOdzcgFubw12sccKIqwgQPyAH2v57UVysGxEj4hCDPoAfNaOKUo=
X-Google-Smtp-Source: AGHT+IHNQ8tXFtWPL49N2sqJcg/FODHFFnIibFwPP2/zHDn/RcSDgBl/PT7FL1sjmG1UdzLtsLJydQ==
X-Received: by 2002:a25:68c1:0:b0:dcd:2d3a:b528 with SMTP id d184-20020a2568c1000000b00dcd2d3ab528mr15753397ybc.9.1710944929491;
        Wed, 20 Mar 2024 07:28:49 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id a12-20020a25870c000000b00dc74258241fsm2548019ybl.45.2024.03.20.07.28.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 07:28:48 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-610e3f906acso21963847b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 07:28:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRnZg4gwoHl6t4JfINWGpb63o4PwSud/Mk5YqUBwWLYuBL6kEB0mQkLn8P/NgdRPyZrfB2fI85e4rV56dM5t+KLaVhIq0X1GAv10hgzCcY
X-Received: by 2002:a25:68c1:0:b0:dcd:2d3a:b528 with SMTP id
 d184-20020a2568c1000000b00dcd2d3ab528mr15753354ybc.9.1710944928665; Wed, 20
 Mar 2024 07:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <beb746c7538a4ff720a25fd8f309da20d8d854ef.1710933713.git.geert@linux-m68k.org>
 <47bddec7-953d-4ea4-84f1-b0dcf0641baa@sifive.com>
In-Reply-To: <47bddec7-953d-4ea4-84f1-b0dcf0641baa@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Mar 2024 15:28:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWP4R6Y6G0qzhMKJy1zJEeHE8a0XEK+Hs_D4wXB2i2BFA@mail.gmail.com>
Message-ID: <CAMuHMdWP4R6Y6G0qzhMKJy1zJEeHE8a0XEK+Hs_D4wXB2i2BFA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: starfive: jh7100: Use clk_hw for external input clocks
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_072852_245442_774E7BCC 
X-CRM114-Status: GOOD (  24.58  )
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

SGkgU2FtdWVsLAoKT24gV2VkLCBNYXIgMjAsIDIwMjQgYXQgMjozMeKAr1BNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPiBPbiAyMDI0LTAzLTIwIDY6
MjQgQU0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IFRoZSBTdGFyZml2ZSBKSDcxMDAg
Y2xvY2sgZHJpdmVyIGRvZXMgbm90IHVzZSB0aGUgRFQgImNsb2NrcyIgcHJvcGVydHkKPiA+IHRv
IGZpbmQgdGhlIGV4dGVybmFsIG1haW4gaW5wdXQgY2xvY2ssIGJ1dCBpbnN0ZWFkIHJlbGllcyBv
biB0aGUgbmFtZSBvZgo+ID4gdGhlIGFjdHVhbCBjbG9jayBwcm92aWRlciAoIm9zY19zeXMiKS4g
IFRoaXMgaXMgZnJhZ2lsZSwgYW5kIGNhdXNlZAo+ID4gYnJlYWthZ2Ugd2hlbiBzYW5pdGl6aW5n
IGNsb2NrIG5vZGUgbmFtZXMgaW4gRFRTLgo+ID4KPiA+IEZpeCB0aGlzIGJ5IG9idGFpbmluZyB0
aGUgZXh0ZXJuYWwgbWFpbiBpbnB1dCBjbG9jayB1c2luZwo+ID4gZGV2bV9jbGtfZ2V0KCksIGFu
ZCBwYXNzaW5nIHRoZSByZXR1cm5lZCBjbGtfaHcgb2JqZWN0IHRvCj4gPiBkZXZtX2Nsa19od19y
ZWdpc3Rlcl9maXhlZF9mYWN0b3JfcGFyZW50X2h3KCkuCj4gPgo+ID4gV2hpbGUgbmFtZS1iYXNl
ZCBsb29rLXVwIG9mIHRoZSBvdGhlciBleHRlcm5hbCBpbnB1dCBjbG9ja3Mgd29ya3MgYXMtaXMs
Cj4gPiBjb252ZXJ0IHRoZW0gdG8gYSBzaW1pbGFyIGNsa19ody1iYXNlZCBzY2hlbWUgdG8gaW5j
cmVhc2UgdW5pZm9ybWl0eSwKPiA+IGFuZCB0byBkZWNyZWFzZSB0aGUgbnVtYmVyIG9mIG5hbWUt
YmFzZWQgbG9vay11cHMuCj4gPgo+ID4gRml4ZXM6IGYwMzYwNjQ3MDg4NiAoInJpc2N2OiBkdHM6
IHN0YXJmaXZlOiByZXBsYWNlIHVuZGVyc2NvcmVzIGluIG5vZGUgbmFtZXMiKQo+ID4gRml4ZXM6
IDQyMTBiZTY2OGEwOWVlMjAgKCJjbGs6IHN0YXJmaXZlOiBBZGQgSkg3MTAwIGNsb2NrIGdlbmVy
YXRvciBkcml2ZXIiKQo+ID4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4KCgo+ID4gLS0tIGEvZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0
YXJmaXZlLWpoNzEwMC5jCj4gPiArKysgYi9kcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZp
dmUtamg3MTAwLmMKCj4gPiBAQCAtMjg0LDggKzI5MywxMSBAQCBzdGF0aWMgc3RydWN0IGNsa19o
dyAqamg3MTAwX2Nsa19nZXQoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqY2xrc3BlYywgdm9pZCAq
ZGF0YQo+ID4KPiA+ICBzdGF0aWMgaW50IF9faW5pdCBjbGtfc3RhcmZpdmVfamg3MTAwX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgewo+ID4gKyAgICAgc3RhdGljIGNv
bnN0IGNoYXIgKmpoNzEwMF9leHRfY2xrW0VYVF9OVU1fQ0xLU10gPQo+ID4gKyAgICAgICAgICAg
ICB7ICJvc2Nfc3lzIiwgIm9zY19hdWQiLCAiZ21hY19ybWlpX3JlZiIsICJnbWFjX2dyX21paV9y
eGNsayIgfTsKPgo+IFRoaXMgc2hvdWxkIGJlIF9faW5pdGNvbnN0LiBPdGhlcndpc2U6CgpXaXRo
CgogICAgLSAgICAgICBzdGF0aWMgY29uc3QgY2hhciAqamg3MTAwX2V4dF9jbGtbRVhUX05VTV9D
TEtTXSA9CiAgICArICAgICAgIHN0YXRpYyBjb25zdCBjaGFyICpqaDcxMDBfZXh0X2Nsa1tFWFRf
TlVNX0NMS1NdIF9faW5pdGNvbnN0ID0KCkkgZ2V0OgoKICAgIGRyaXZlcnMvY2xrL3N0YXJmaXZl
L2Nsay1zdGFyZml2ZS1qaDcxMDAuYzogSW4gZnVuY3Rpb24K4oCYY2xrX3N0YXJmaXZlX2poNzEw
MF9wcm9iZeKAmToKICAgIGRyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaDcxMDAu
YzozNTozNzogZXJyb3I6CuKAmGpoNzEwMF9jbGtfZGF0YeKAmSBjYXVzZXMgYSBzZWN0aW9uIHR5
cGUgY29uZmxpY3Qgd2l0aCDigJhqaDcxMDBfZXh0X2Nsa+KAmQogICAgICAgMzUgfCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGpoNzF4MF9jbGtfZGF0YSBqaDcxMDBfY2xrX2RhdGFbXQpfX2luaXRjb25z
dCA9IHsKICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+CiAgICBkcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamg3MTAw
LmM6Mjk2OjI4OiBub3RlOgrigJhqaDcxMDBfZXh0X2Nsa+KAmSB3YXMgZGVjbGFyZWQgaGVyZQog
ICAgICAyOTYgfCAgICAgICAgIHN0YXRpYyBjb25zdCBjaGFyICpqaDcxMDBfZXh0X2Nsa1tFWFRf
TlVNX0NMS1NdCl9faW5pdGNvbnN0ID0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn4KCndoaWNoIGlzIGEgYml0IHN0cmFuZ2UuLi4KV2hhdCBhbSBJ
IG1pc3Npbmc/Cgo+IFJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KClRoYW5rcyEKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
