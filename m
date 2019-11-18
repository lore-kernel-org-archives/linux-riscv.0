Return-Path: <SRS0=Rdmy=ZK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A18C432C3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2019 10:15:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5164020730
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2019 10:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nmlzuE/v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YcPvVBOv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5164020730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2BOP7v5hUWbnIUaw0xcMifg2eG54YBtu8C34PGbcNw=; b=nmlzuE/vswfWnG
	ZJJJ0WKMAFjLvFR/Cc2NjGeGccDROLvol35U/NWK3v64hDUoYO+3TZGRMUqk23crXzE0uW35e783f
	XaoOAFP3lYjhEzjHgbC0qtLd45aJe7rOoyhQUeFCUFN30U2a/qfHcq2MZUAlSd4XpFDpc0qLzJIbg
	1GYeQQITpmCoAMZeuOWaBwJ+KxfOPm0kbZ5O2UZsaKAv4TjAASn7RZ2+XGnOlCZElBazb+6NW8+zD
	DbzDSkHXtNw4ZMT1U2ZQoa7JYl5wCBpe+OC+PWFnpVOZr5yqcLk/WnOIHDLYoCNYpBPlrmm3kmOdR
	TLG2dzoCiJCNt8N1B3Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWe3y-0004cK-HR; Mon, 18 Nov 2019 10:15:18 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWe3u-0004Wd-GM
 for linux-riscv@lists.infradead.org; Mon, 18 Nov 2019 10:15:16 +0000
Received: by mail-oi1-x242.google.com with SMTP id a14so14793992oid.5
 for <linux-riscv@lists.infradead.org>; Mon, 18 Nov 2019 02:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tONkO/6YMzJOt8aiznrydIU/ZcI9lGyQc6MwqJrMzxc=;
 b=YcPvVBOvikiGOQURsy9tI3jr/nkJ869/omy6aXRoCfnhCoMhPn1o8P+291G+XehKQC
 pDT7IIGNNdmSTEY6mWazFlfvPEEYSmz2PPi1MExhAnSc3STM5ZoDPMmBQVIF8uF5aeTI
 ADwKSbTbdJtTompjsvItCN3/lt5ncz1C2+T6eoHHVpNdzMbAfdhBtIP2QAepmmnmCIir
 aPtIKn7UfyMs/bvbobz4s3Lq9H+SHTaVm8xvcwCq/EeuNOIEzqvDjjRlp1ntppj2hKZc
 JuSODOmPJXDJWpH0sgc6nbbbZom7LSHs4d+P27+53culoDX27541mNNoCkKhVNTcbVey
 WlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tONkO/6YMzJOt8aiznrydIU/ZcI9lGyQc6MwqJrMzxc=;
 b=Ov9bc0PdumUSiWMhjIdSdeAuuCLi0w/GJacU1NqwC5uJQAaVT5QiCnVKu9i1/7hQFx
 3D8c4smSSZT3XNrfuMWfdKlqYCbXJbZill82nVo2tg/5yu6CJzUf5uiNaVykW5uDI3di
 3uV8ieLyz0jbXHzQ0GTUwR3b+87DGckLEPxSzS2P6+Uguwbs0u/1MeY00RCHPpVsKvMy
 81QiPkfjLO3ORj9p7TyK8/3Vq6ZF+MfW8IyWtmVivmTMRtGOhXAWSKgkHOVFFC6mCMm8
 r/3zEOFbmqYE+R4h49t9UpUCtWs2ycEFD2UfWKRRADVQ+OMDDFzAKidvCrG3rQYWUTIu
 VPKA==
X-Gm-Message-State: APjAAAW8h4CbvAr3TZgSk2yxDMhXY6lkqJtaCX1265U5/hcHStax7Zkm
 e32aVl2mdml+3SSmXPuIW1mRVcY8ZnhNxG9K5t/lyg==
X-Google-Smtp-Source: APXvYqziykcLRuw/aYXL+prNr+7LzJN2LtOQs3Yll15tPMmVUWaMlygbY4DBkRQRMCACl8yhuYbwinIWhF2JPDRTjZQ=
X-Received: by 2002:aca:d904:: with SMTP id q4mr19738694oig.21.1574072112940; 
 Mon, 18 Nov 2019 02:15:12 -0800 (PST)
MIME-Version: 1.0
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-4-git-send-email-yash.shah@sifive.com>
 <CAMpxmJWcuV7goPWxOWv_Og9GwzGrioF62SfS1LCiHf9eDX=vdw@mail.gmail.com>
 <CH2PR13MB33680443C101511E66ECADF08C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
In-Reply-To: <CH2PR13MB33680443C101511E66ECADF08C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 18 Nov 2019 11:15:01 +0100
Message-ID: <CAMpxmJU+P=nWe9fpp45Jw=GwX3+V0sVVshRcE7AD1Kyz_F0qJQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
To: Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_021514_556254_04B6DEB0 
X-CRM114-Status: GOOD (  18.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "maz@kernel.org" <maz@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "atish.patra@wdc.com" <atish.patra@wdc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

cG9uLiwgMTggbGlzIDIwMTkgbyAxMTowMyBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29t
PiBuYXBpc2HFgihhKToKPgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206
IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPiBTZW50
OiAxMyBOb3ZlbWJlciAyMDE5IDE4OjQxCj4gPiBUbzogWWFzaCBTaGFoIDx5YXNoLnNoYWhAc2lm
aXZlLmNvbT4KPiA+IENjOiBsaW51cy53YWxsZWlqQGxpbmFyby5vcmc7IHJvYmgrZHRAa2VybmVs
Lm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207Cj4gPiBwYWxtZXJAZGFiYmVsdC5jb207IFBhdWwg
V2FsbXNsZXkgKCBTaWZpdmUpIDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Owo+ID4gYW91QGVl
Y3MuYmVya2VsZXkuZWR1OyB0Z2x4QGxpbnV0cm9uaXguZGU7IGphc29uQGxha2VkYWVtb24ubmV0
Owo+ID4gbWF6QGtlcm5lbC5vcmc7IGJtZW5nLmNuQGdtYWlsLmNvbTsgYXRpc2gucGF0cmFAd2Rj
LmNvbTsgU2FnYXIgS2FkYW0KPiA+IDxzYWdhci5rYWRhbUBzaWZpdmUuY29tPjsgbGludXgtZ3Bp
b0B2Z2VyLmtlcm5lbC5vcmc7Cj4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtCj4gPiBrZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBTYWNoaW4gR2hhZGkgPHNhY2hpbi5naGFkaUBzaWZpdmUuY29tPgo+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCAzLzRdIGdwaW86IHNpZml2ZTogQWRkIEdQSU8gZHJpdmVyIGZvciBTaUZpdmUg
U29Dcwo+ID4KPiA+IHd0LiwgMTIgbGlzIDIwMTkgbyAxMzoxMiBZYXNoIFNoYWggPHlhc2guc2hh
aEBzaWZpdmUuY29tPiBuYXBpc2HFgihhKToKPiA+ID4KPiA+ID4gQWRkcyB0aGUgR1BJTyBkcml2
ZXIgZm9yIFNpRml2ZSBSSVNDLVYgU29Dcy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogV2Vz
bGV5IFcuIFRlcnBzdHJhIDx3ZXNsZXlAc2lmaXZlLmNvbT4KPiA+ID4gW0F0aXNoOiBWYXJpb3Vz
IGZpeGVzIGFuZCBjb2RlIGNsZWFudXBdCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJh
IDxhdGlzaC5wYXRyYUB3ZGMuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZYXNoIFNoYWggPHlh
c2guc2hhaEBzaWZpdmUuY29tPgo+Cj4gWy4uLl0KPgo+ID4gPiArCj4gPiA+ICtzdGF0aWMgaW50
IHNpZml2ZV9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsKPiA+ID4g
KyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ID4gPiArICAgICAgIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOwo+ID4gPiArICAgICAg
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqaXJxX3BhcmVudDsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgaXJx
X2RvbWFpbiAqcGFyZW50Owo+ID4gPiArICAgICAgIHN0cnVjdCBncGlvX2lycV9jaGlwICpnaXJx
Owo+ID4gPiArICAgICAgIHN0cnVjdCBzaWZpdmVfZ3BpbyAqY2hpcDsKPiA+ID4gKyAgICAgICBz
dHJ1Y3QgcmVzb3VyY2UgKnJlczsKPiA+ID4gKyAgICAgICBpbnQgcmV0LCBuZ3BpbzsKPiA+ID4g
Kwo+ID4gPiArICAgICAgIGNoaXAgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmNoaXApLCBH
RlBfS0VSTkVMKTsKPiA+ID4gKyAgICAgICBpZiAoIWNoaXApCj4gPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsKPiA+ID4gKwo+ID4gPiArICAgICAgIHJlcyA9IHBsYXRmb3JtX2dl
dF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4gPiA+ICsgICAgICAgY2hpcC0+
YmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7Cj4gPgo+ID4gVXNlIGRldm1f
cGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIGFuZCBkcm9wIHRoZSByZXMgdmFyaWFibGUuCj4g
Pgo+Cj4gU3VyZSwgd2lsbCBkbyB0aGF0Lgo+Cj4gPiA+ICsgICAgICAgaWYgKElTX0VSUihjaGlw
LT5iYXNlKSkgewo+ID4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8g
YWxsb2NhdGUgZGV2aWNlIG1lbW9yeVxuIik7Cj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
UFRSX0VSUihjaGlwLT5iYXNlKTsKPiA+ID4gKyAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAg
ICBjaGlwLT5yZWdzID0gZGV2bV9yZWdtYXBfaW5pdF9tbWlvKGRldiwgY2hpcC0+YmFzZSwKPiA+
ID4gKwo+ID4gPiArICZzaWZpdmVfZ3Bpb19yZWdtYXBfY29uZmlnKTsKPiA+Cj4gPiBXaHkgZG8g
eW91IG5lZWQgdGhpcyByZWdtYXAgaGVyZT8gWW91IGluaXRpYWxpemUgYSBuZXcgcmVnbWFwLCB0
aGVuIHVzZQo+ID4geW91ciBvd24gbG9ja2luZyBkZXNwaXRlIG5vdCBoYXZpbmcgZGlzYWJsZWQg
dGhlIGludGVybmFsIGxvY2tpbmcgaW4gcmVnbWFwLAo+ID4gYW5kIHRoZW4geW91IGluaXRpYWxp
emUgdGhlIG1taW8gZ2VuZXJpYyBHUElPIGNvZGUgd2hpY2ggd2lsbCB1c2UgeWV0Cj4gPiBhbm90
aGVyIGxvY2sgdG8gb3BlcmF0ZSBvbiB0aGUgc2FtZSByZWdpc3RlcnMgYW5kIGluIHRoZSBlbmQg
eW91IHdyaXRlIHRvCj4gPiB0aG9zZSByZWdpc3RlcnMgd2l0aG91dCB0YWtpbmcgYW55IGxvY2sg
YW55d2F5Lgo+ID4gRG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UgdG8gbWUuCj4gPgo+Cj4gQXMgc3Vn
Z2VzdGVkIGluIHRoZSBjb21tZW50cyByZWNlaXZlZCBvbiB0aGUgUkZDIHZlcnNpb24gb2YgdGhp
cyBwYXRjaFswXSwgSSBhbSB0cnlpbmcgdG8gdXNlIHJlZ21hcCBNTUlPIGJ5IGxvb2tpbmcgYXQg
Z3Bpby1tdmVidS5jLiBJIGdvdCB5b3VyIHBvaW50IHJlZ2FyZGluZyB0aGUgdXNhZ2Ugb2Ygb3du
IGxvY2tzIGlzIG5vdCBtYWtpbmcgYW55IHNlbnNlLgo+IEhlcmUgaXMgd2hhdCBJIHdpbGwgZG8g
aW4gdjI6Cj4gMS4gZHJvcCB0aGUgdXNhZ2Ugb2Ygb3duIGxvY2tzCj4gMi4gY29uc2lzdGVudGx5
IHVzZSByZWdtYXBfKiBhcGlzIGZvciByZWdpc3RlciBhY2Nlc3MgKHJlcGxhY2UgYWxsIGlvd3Jp
dGVzKS4KPiBEb2VzIHRoaXMgbWFrZSBzZW5zZSBub3c/CgpUaGUgdGhpbmcgaXM6IHRoZSBncGlv
LW1taW8gY29kZSB5b3UncmUgKGNvcnJlY3RseSkgcmV1c2luZyB1c2VzIGEKZGlmZmVyZW50IGxv
Y2sgLSBuYW1lbHk6IGJncGlvX2xvY2sgaW4gc3RydWN0IGdwaW9fY2hpcC4gSWYgeW91IHdhbnQK
dG8gdXNlIHJlZ21hcCBmb3IgcmVnaXN0ZXIgb3BlcmF0aW9ucywgdGhlbiB5b3UgbmVlZCB0byBz
ZXQKZGlzYWJsZV9sb2NraW5nIGluIHJlZ21hcF9jb25maWcgdG8gdHJ1ZSBhbmQgdGhlbiB0YWtl
IHRoaXMgbG9jawptYW51YWxseSBvbiBldmVyeSBhY2Nlc3MuCgpCYXJ0Cgo+Cj4gPiA+ICsgICAg
ICAgaWYgKElTX0VSUihjaGlwLT5yZWdzKSkKPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBQ
VFJfRVJSKGNoaXAtPnJlZ3MpOwo+ID4gPiArCj4KPiBbLi4uXQo+Cj4gPiA+ICsKPiA+ID4gKyAg
ICAgICByZXQgPSBncGlvY2hpcF9hZGRfZGF0YSgmY2hpcC0+Z2MsIGNoaXApOwo+ID4gPiArICAg
ICAgIGlmIChyZXQpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiArCj4g
PiA+ICsgICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgY2hpcCk7Cj4gPiA+ICsgICAg
ICAgZGV2X2luZm8oZGV2LCAiU2lGaXZlIEdQSU8gY2hpcCByZWdpc3RlcmVkICVkIEdQSU9zXG4i
LAo+ID4gPiArIG5ncGlvKTsKPiA+Cj4gPiBDb3JlIGdwaW8gbGlicmFyeSBlbWl0cyBhIHZlcnkg
c2ltaWxhciBkZWJ1ZyBtZXNzYWdlIGZyb20KPiA+IGdwaW9jaGlwX3NldHVwX2RldigpLCBJIHRo
aW5rIHlvdSBjYW4gZHJvcCBpdCBhbmQgZGlyZWN0bHkgcmV0dXJuCj4gPiBncGlvY2hpcF9hZGRf
ZGF0YSgpLgo+ID4KPiA+IEJhcnRvc3oKPgo+IE9rLiBXaWxsIGRpcmVjdGx5IHJldHVybiBncGlv
Y2hpcF9hZGRfZGF0YSgpLgo+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cyEKPgo+IC0gWWFzaAo+
Cj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMTgxMDEwMTIzNTE5
LlJWZXhEcHBhUEZwSVdsN1FVX2hwUDh0YzVxcVdQSmdldUxZbjBGYUdiZVFAei8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
