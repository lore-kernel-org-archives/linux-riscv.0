Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C8AC46CD3
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 02:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rFTYAFnVX14NZHYUBpVMzFNt6iiPOUqs+vpTtE5b1U=; b=qGZ/2Lb+7xApLv
	Y+Tf4GB1haY2nh8Q3McoWy1oM507b/3X34C11wiq4krtzrUF3gbo69LTe+fbhg6t0c0k4sM9sdsN+
	b6QJvOXNuNHX+wAmrfooWHOa+03Ju2FWV11qRGD98FMEIFw+bXl3IKH05lIVCQ+woabd68WEgI4cf
	W0LsoJG8CoIub6eF857xnyVFyxf66kuR1izH9if2OiwKUqhat/xhgyqh5j8wBApgMsm8+VauVB3/a
	OFQYau6QVFtIic4zqSaXFdqZcDc1QD5YmCGK5BN3sNGxSPEVf1MsCdSt5+o3TYxM95rtiTTBPwOlm
	nQ4RGqKt0+PBttTmzSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFmo8-00G0nn-3A;
	Wed, 20 Dec 2023 02:59:40 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFmo6-00G0kC-2F
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 02:59:40 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1eb39505ba4so3096726fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 18:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1703041174; x=1703645974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apsQTMh+wzleRxg4vNWLqcpSsKcn0wPXDH5u/impo2s=;
        b=h0BDntddKKHujE7Uwvp33XPZY6Rf3a8f/vf2Zsr9I89zWTelvs6H4siQ7ijoawxRNr
         71naH2rTaic/fj5rncFR2xyJtkSGLypeRnwAMSN7ZB5VnEv5QFVAwE+9BQSNre0qMx/l
         oDqr5jtAwSHOLjwXvemt1m19tJBqxERuE/VWReHOsT8HVUbkRBdgjJx7b+i5VNBfblJv
         MxBQlLoGgVoQi2/cW6EGeo4ck1K1JxktWxkz+Rw+JRhYSB44uHxzIGxAcyizwLyEarTw
         Wz49BMC/Vli7zSLcy7Rg2/c6r04IEx6GVhG9XLmPFqAjHI7oFB06Nvdb/e6kNXJlGJSD
         wWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703041174; x=1703645974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apsQTMh+wzleRxg4vNWLqcpSsKcn0wPXDH5u/impo2s=;
        b=gmsuuDILpzAPz/3EzYRg9V4YdUNn3+TzvAS4yCpWVwC8RJ+/EluInMsHVLrl2auwkz
         gOpPMYN+a1mMkXP69pvdLI164rrdNQoFJPWSUgjXSr2XNe0v7FTyhG1AWF13l5uYCa83
         vy6KCPOeuejbGfep4PVntB6ao9/6/NW/zAgAOyQC4LrhdIe37ZEssQcbmnSazkJsEkId
         o87+SJy1Ha77UJnv/uiPWfCMZoBGm0KlZG9ahGV0U3cneC66mGd7kAqXI4XcB/IiOkL7
         giQuvsi1vYuCtDQ8+ByoCnz2i8udTjMqm20I5VfSlBzJJrG/aJTATTxsMcqvHNfnAKRV
         zqaA==
X-Gm-Message-State: AOJu0YzH3GEynWS8IyhLRLhqcCqWIAteT2+TR/IRLygejXYeXcI6J9lZ
	Ck4JKheQ2E/XBZ2XXBjt7FZPADl+4gvcvzwJAbOeKA==
X-Google-Smtp-Source: AGHT+IHkJO5ZOUzVzVAm0OW2c+XOHReGlsuOrQcjDbsf2O8ij6x/MrBLjV3275c/hmg9Ct7seUt4KRT1EBT+KWFvojQ=
X-Received: by 2002:a05:6870:3929:b0:204:20b:2de with SMTP id
 b41-20020a056870392900b00204020b02demr1067684oap.35.1703041173827; Tue, 19
 Dec 2023 18:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20231219175046.2496-1-jszhang@kernel.org> <20231219175046.2496-3-jszhang@kernel.org>
In-Reply-To: <20231219175046.2496-3-jszhang@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 20 Dec 2023 10:59:22 +0800
Message-ID: <CAEEQ3wn6j0N-NSQjEqE8Ee9dGzGMJJ4CW2Yhw_njAaOgR8G_eQ@mail.gmail.com>
Subject: Re: [External] [PATCH 2/4] riscv: tlb: convert __p*d_free_tlb() to
 inline functions
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_185938_735430_D3B8809F 
X-CRM114-Status: GOOD (  15.88  )
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

SGkgSmlzaGVuZywKCk9uIFdlZCwgRGVjIDIwLCAyMDIzIGF0IDI6MDTigK9BTSBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBpcyB0byBwcmVwYXJlIGZv
ciBlbmFibGluZyBNTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFLgo+IE5vIGZ1bmN0aW9uYWxpdHkg
Y2hhbmdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVs
Lm9yZz4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ2FsbG9jLmggfCA1NCArKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0
aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ2FsbG9jLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+IGlu
ZGV4IGExMmZiODNmYTFmNS4uM2M1ZTNiZDE1ZjQ2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGdhbGxvYy5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ2Fs
bG9jLmgKPiBAQCAtOTUsMTMgKzk1LDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwdWRfZnJlZShz
dHJ1Y3QgbW1fc3RydWN0ICptbSwgcHVkX3QgKnB1ZCkKPiAgICAgICAgICAgICAgICAgX19wdWRf
ZnJlZShtbSwgcHVkKTsKPiAgfQo+Cj4gLSNkZWZpbmUgX19wdWRfZnJlZV90bGIodGxiLCBwdWQs
IGFkZHIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC1kbyB7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiAtICAgICAgIGlmIChwZ3RhYmxlX2w0X2VuYWJsZWQpIHsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICAgICAgICAgICAgIHBhZ2V0YWJsZV9wdWRfZHRv
cih2aXJ0X3RvX3B0ZGVzYyhwdWQpKTsgICAgICAgICAgICAgICAgXAo+IC0gICAgICAgICAgICAg
ICB0bGJfcmVtb3ZlX3BhZ2VfcHRkZXNjKCh0bGIpLCB2aXJ0X3RvX3B0ZGVzYyhwdWQpKTsgICAg
IFwKPiAtICAgICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gLX0gd2hpbGUgKDApCj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBfX3B1ZF9mcmVlX3RsYihzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBwdWRfdCAqcHVkLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIpCj4gK3sK
PiArICAgICAgIGlmIChwZ3RhYmxlX2w0X2VuYWJsZWQpIHsKPiArICAgICAgICAgICAgICAgc3Ry
dWN0IHB0ZGVzYyAqcHRkZXNjID0gdmlydF90b19wdGRlc2MocHVkKTsKPiArCj4gKyAgICAgICAg
ICAgICAgIHBhZ2V0YWJsZV9wdWRfZHRvcihwdGRlc2MpOwo+ICsgICAgICAgICAgICAgICB0bGJf
cmVtb3ZlX3BhZ2VfcHRkZXNjKHRsYiwgcHRkZXNjKTsKPiArICAgICAgIH0KPiArfQo+Cj4gICNk
ZWZpbmUgcDRkX2FsbG9jX29uZSBwNGRfYWxsb2Nfb25lCj4gIHN0YXRpYyBpbmxpbmUgcDRkX3Qg
KnA0ZF9hbGxvY19vbmUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkcikK
PiBAQCAtMTMwLDExICsxMzMsMTIgQEAgc3RhdGljIGlubGluZSB2b2lkIHA0ZF9mcmVlKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCBwNGRfdCAqcDRkKQo+ICAgICAgICAgICAgICAgICBfX3A0ZF9mcmVl
KG1tLCBwNGQpOwo+ICB9Cj4KPiAtI2RlZmluZSBfX3A0ZF9mcmVlX3RsYih0bGIsIHA0ZCwgYWRk
cikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLWRvIHsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
IC0gICAgICAgaWYgKHBndGFibGVfbDVfZW5hYmxlZCkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAgdGxiX3JlbW92ZV9wYWdlX3B0ZGVz
YygodGxiKSwgdmlydF90b19wdGRlc2MocDRkKSk7ICAgICBcCj4gLX0gd2hpbGUgKDApCj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBfX3A0ZF9mcmVlX3RsYihzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBw
NGRfdCAqcDRkLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIGFkZHIpCj4gK3sKPiArICAgICAgIGlmIChwZ3RhYmxlX2w1X2VuYWJsZWQpCj4gKyAgICAg
ICAgICAgICAgIHRsYl9yZW1vdmVfcGFnZV9wdGRlc2ModGxiLCB2aXJ0X3RvX3B0ZGVzYyhwNGQp
KTsKPiArfQo+ICAjZW5kaWYgLyogX19QQUdFVEFCTEVfUE1EX0ZPTERFRCAqLwo+Cj4gIHN0YXRp
YyBpbmxpbmUgdm9pZCBzeW5jX2tlcm5lbF9tYXBwaW5ncyhwZ2RfdCAqcGdkKQo+IEBAIC0xNTks
MTkgKzE2MywyNSBAQCBzdGF0aWMgaW5saW5lIHBnZF90ICpwZ2RfYWxsb2Moc3RydWN0IG1tX3N0
cnVjdCAqbW0pCj4KPiAgI2lmbmRlZiBfX1BBR0VUQUJMRV9QTURfRk9MREVECj4KPiAtI2RlZmlu
ZSBfX3BtZF9mcmVlX3RsYih0bGIsIHBtZCwgYWRkcikgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+IC1kbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gLSAgICAgICBwYWdldGFibGVfcG1kX2R0b3IodmlydF90b19wdGRlc2Mo
cG1kKSk7ICAgICAgICAgICAgICAgIFwKPiAtICAgICAgIHRsYl9yZW1vdmVfcGFnZV9wdGRlc2Mo
KHRsYiksIHZpcnRfdG9fcHRkZXNjKHBtZCkpOyAgICAgXAo+IC19IHdoaWxlICgwKQo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgX19wbWRfZnJlZV90bGIoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgcG1k
X3QgKnBtZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBhZGRyKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgcHRkZXNjICpwdGRlc2MgPSB2aXJ0X3RvX3B0
ZGVzYyhwbWQpOwo+ICsKPiArICAgICAgIHBhZ2V0YWJsZV9wbWRfZHRvcihwdGRlc2MpOwo+ICsg
ICAgICAgdGxiX3JlbW92ZV9wYWdlX3B0ZGVzYyh0bGIsIHB0ZGVzYyk7Cj4gK30KPgo+ICAjZW5k
aWYgLyogX19QQUdFVEFCTEVfUE1EX0ZPTERFRCAqLwo+Cj4gLSNkZWZpbmUgX19wdGVfZnJlZV90
bGIodGxiLCBwdGUsIGJ1ZikgICAgICAgICAgICAgICAgICBcCj4gLWRvIHsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICAgICBwYWdldGFi
bGVfcHRlX2R0b3IocGFnZV9wdGRlc2MocHRlKSk7ICAgICAgICAgICBcCj4gLSAgICAgICB0bGJf
cmVtb3ZlX3BhZ2VfcHRkZXNjKCh0bGIpLCBwYWdlX3B0ZGVzYyhwdGUpKTtcCj4gLX0gd2hpbGUg
KDApCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3B0ZV9mcmVlX3RsYihzdHJ1Y3QgbW11X2dhdGhl
ciAqdGxiLCBwZ3RhYmxlX3QgcHRlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGFkZHIpCj4gK3sKPiArICAgICAgIHN0cnVjdCBwdGRlc2MgKnB0ZGVz
YyA9IHBhZ2VfcHRkZXNjKHB0ZSk7Cj4gKwo+ICsgICAgICAgcGFnZXRhYmxlX3B0ZV9kdG9yKHB0
ZGVzYyk7Cj4gKyAgICAgICB0bGJfcmVtb3ZlX3BhZ2VfcHRkZXNjKHRsYiwgcHRkZXNjKTsKPiAr
fQo+ICAjZW5kaWYgLyogQ09ORklHX01NVSAqLwo+Cj4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX1BH
QUxMT0NfSCAqLwo+IC0tCj4gMi40MC4wCj4KCldoeSBpcyBpdCBuZWNlc3NhcnkgdG8gY29udmVy
dCB0byBpbmxpbmUgZnVuY3Rpb25zPwoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
