Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BBDC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 06:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+UnQHUrZT/QPn1V/pyCNsDFQH+JTDu0uEpvpHOZv9E=; b=pS0d/2oqd+vIUQ
	VUOlYv5lC7Nf2kW1K9OAA2q+1SL450ka7YtXml8T3npSosO/UKMHFjRtbZCZmyxObWt2UG15xZEZC
	b0DtwyiobIUko/Ds9Q0mWoT1f/c92yfipxfD17Be1lLSs70yULyPOQzUXfFbcYv/78Bu3spbURVFk
	x7ZBn3NBIJg8ARMBbRTI5f8zQfgY0cWHS3Vwdx30JAJiNgxFg1WTph3ppRLIZJuTaRvXGO3A9mYUC
	3XFwrojxqzQjrZsnYnrkq4EGd6bkyo6sgHM+fDMqOVRxEcXsRORo9y+h2/t1ayOTq01jU5sCvkdfi
	egAQeTAdFvppMAjZg9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxhj6-00000004cQl-0Te8;
	Fri, 19 Apr 2024 06:28:00 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxhiz-00000004cPr-0RPx
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 06:27:57 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6eb7500abe3so1209263a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 23:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713508071; x=1714112871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6YFkKyn5/BuCOc0JMepcoAMu+9H+aV4NIJoWyR8Zmo=;
        b=BQ2viLn1ifwVqDs7D9WbsQm/lv66I+rvthMc8+AgJ2IoT3b1n4BO4Hr8JJ/QPSbe82
         +NiilM/JJCNhZgtv5/pEbm4+DjTyf+V4zp7IuJ16Y6rb80fOeu2Y7JvDXiW7E0B27bRt
         KXDP92FOBje4EDEF+DKH2R5lR/seBXIB3MaEbYNF2dkL2awFpTwkAzSXSXb8zwkpfD7d
         tXKltuB3LHZyBwC/d+9AxzQ/s9Paz93q9tmvQUtcejtCxYaYI+emF8e+UcSOR/Sn8XZO
         nG2bLxv63InMqmduumgQJmHuBs/Muv0wDTO/u3O+z4ayUYm1HDu/UHlZVkEwgsXRUPdw
         Arow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713508071; x=1714112871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6YFkKyn5/BuCOc0JMepcoAMu+9H+aV4NIJoWyR8Zmo=;
        b=e1tRGMH1HuDuEBY5iEszIj2HRrYqZ2DcR+Wl/50jX+riNoz9OTl//x3np6Y8F6p0LH
         vcaYKTrg6AHTLjvWZc8vWIh/e/eAdjgDyE1KlOlu9NsFGA205ybxKvWexPLg/uSuMZFM
         5J4K4ZJGWNNb2G7AUEspeme/YrA3ojduuvZJLvZ4dU0n2lulGrgXj05eC2CcSmLYDZ03
         SNmSOQAibs3vsccs+tB8Cs51kmSSIFFAtMY6+pBF0hehlzEZh6EBUTnW7n7NzCYwKaC/
         vJg3+h61wM7vg4mPbPfmJHLwFqxcEqo8/4YrrGexawPAvxMOcxJ5Wc3QXMqwxxk+lELH
         sgpg==
X-Forwarded-Encrypted: i=1; AJvYcCXvvLS+BBoUCbGU0n4jgVreYCOnEisdi6kz5SQA4oDEuCcz7RJJW/0If4PNZOxSZXx3IuwHwXHMiX2fJPeE8CtEVRvC3c0Zo8xCrKDMs5E9
X-Gm-Message-State: AOJu0YzCgc1yAM76ZLFM4CZ39UElyFGBwM9Qq2MqlaoKUIr04YlKDqQY
	zPCaw0gC44T2YxFSBjPyNCrdjtihOwq/AkAWOfxkGadGE8bAzSoJvCVLUo6wecbpoo3oLHKrkyp
	eksWIpv72iRr6wzE/8C6RY+H4pWLQp4poeoNFRA==
X-Google-Smtp-Source: AGHT+IGf8SONi2t4Gq3O9Mc0MZ15L3EcbK72rX/+CNgR7DC3KTPhm36jDoIozEgIKj5ptE6BCWlUi4kFxG6WxMLgMps=
X-Received: by 2002:a05:6870:b14c:b0:22e:a7a1:6e56 with SMTP id
 a12-20020a056870b14c00b0022ea7a16e56mr1339830oal.29.1713508071026; Thu, 18
 Apr 2024 23:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
 <20240418034330.84721-2-cuiyunhui@bytedance.com> <20240418084144.go3zk5yycsg6e2k2@bogus>
In-Reply-To: <20240418084144.go3zk5yycsg6e2k2@bogus>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 19 Apr 2024 14:27:39 +0800
Message-ID: <CAEEQ3wm-t1DM+5d4ugr+dM+g4oBLwpOtLM=C2f=NAfOF_u0bUw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com, 
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com, 
	john.garry@huawei.com, Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, 
	tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_232753_223778_379B2330 
X-CRM114-Status: GOOD (  21.02  )
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

SGkgcGFsbWVyLAoKT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgNDo0MuKAr1BNIFN1ZGVlcCBIb2xs
YSA8c3VkZWVwLmhvbGxhQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMTgsIDIwMjQg
YXQgMTE6NDM6MjlBTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IEJlZm9yZSBjYWNoZWlu
Zm8gY2FuIGJlIGJ1aWx0IGNvcnJlY3RseSwgd2UgbmVlZCB0byBpbml0aWFsaXplIGxldmVsCj4g
PiBhbmQgdHlwZS4gU2luY2UgUlNJQy1WIGN1cnJlbnRseSBkb2VzIG5vdCBoYXZlIGEgcmVnaXN0
ZXIgZ3JvdXAgdGhhdAo+ID4gZGVzY3JpYmVzIGNhY2hlLXJlbGF0ZWQgYXR0cmlidXRlcyBsaWtl
IEFSTTY0LCB3ZSBjYW5ub3Qgb2J0YWluIHRoZW0KPiA+IGRpcmVjdGx5LCBzbyBub3cgd2Ugb2J0
YWluIGNhY2hlIGxlYXZlcyBmcm9tIHRoZSBBQ1BJIFBQVFQgdGFibGUKPiA+IChhY3BpX2dldF9j
YWNoZV9pbmZvKCkpIGFuZCBzZXQgdGhlIGNhY2hlIHR5cGUgdGhyb3VnaCBzcGxpdF9sZXZlbHMu
Cj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBKZXJlbXkgTGludG9uIDxqZXJlbXkubGludG9uQGFybS5j
b20+Cj4gPiBTdWdnZXN0ZWQtYnk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4K
PiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIHwgMjIgKysrKysrKysr
KysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvY2FjaGVpbmZvLmMKPiA+IGluZGV4IDMwYTY4NzgyODdhZC4uZTQ3YTFlNmJkM2Zl
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPiA+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4gPiBAQCAtNiw2ICs2LDcgQEAKPiA+ICAj
aW5jbHVkZSA8bGludXgvY3B1Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGFzbS9jYWNoZWluZm8uaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvYWNwaS5oPgo+ID4K
PiA+ICBzdGF0aWMgc3RydWN0IHJpc2N2X2NhY2hlaW5mb19vcHMgKnJ2X2NhY2hlX29wczsKPiA+
Cj4gPiBAQCAtNzgsNiArNzksMjcgQEAgaW50IHBvcHVsYXRlX2NhY2hlX2xlYXZlcyh1bnNpZ25l
ZCBpbnQgY3B1KQo+ID4gICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwcmV2ID0gTlVMTDsKPiA+
ICAgICAgIGludCBsZXZlbHMgPSAxLCBsZXZlbCA9IDE7Cj4gPgo+ID4gKyAgICAgaWYgKCFhY3Bp
X2Rpc2FibGVkKSB7Cj4gPiArICAgICAgICAgICAgIGludCByZXQsIGZ3X2xldmVscywgc3BsaXRf
bGV2ZWxzOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICByZXQgPSBhY3BpX2dldF9jYWNoZV9pbmZv
KGNwdSwgJmZ3X2xldmVscywgJnNwbGl0X2xldmVscyk7Cj4gPiArICAgICAgICAgICAgIGlmIChy
ZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsgICAg
ICAgICAgICAgQlVHX09OKChzcGxpdF9sZXZlbHMgPiBmd19sZXZlbHMpIHx8Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAoc3BsaXRfbGV2ZWxzICsgZndfbGV2ZWxzID4gdGhpc19jcHVfY2ktPm51
bV9sZWF2ZXMpKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgZm9yICg7IGxldmVsIDw9IHRoaXNf
Y3B1X2NpLT5udW1fbGV2ZWxzOyBsZXZlbCsrKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
aWYgKGxldmVsIDw9IHNwbGl0X2xldmVscykgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX0RBVEEsIGxldmVsKTsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNpX2xlYWZfaW5pdCh0aGlzX2xlYWYr
KywgQ0FDSEVfVFlQRV9JTlNULCBsZXZlbCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgfSBl
bHNlIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNpX2xlYWZfaW5pdCh0aGlz
X2xlYWYrKywgQ0FDSEVfVFlQRV9VTklGSUVELCBsZXZlbCk7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgfQo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+
ID4gKyAgICAgfQo+ID4gKwo+Cj4gTXVjaCBiZXR0ZXIsIHNvIG15IHJldmlldyBzdGlsbCBzdGFu
ZHMg8J+YhAo+Cj4gUmV2aWV3ZWQtYnk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5j
b20+Cj4KPiA+ICAgICAgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJjYWNoZS1zaXpl
IikpCj4gPiAgICAgICAgICAgICAgIGNpX2xlYWZfaW5pdCh0aGlzX2xlYWYrKywgQ0FDSEVfVFlQ
RV9VTklGSUVELCBsZXZlbCk7Cj4gPiAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5w
LCAiaS1jYWNoZS1zaXplIikpCj4gPiAtLQo+ID4gMi4yMC4xCj4gPgo+Cj4gLS0KPiBSZWdhcmRz
LAo+IFN1ZGVlcAoKRG8geW91IGhhdmUgYW55IGNvbW1lbnRzIGFib3V0IHRoaXMgcGF0Y2ggc2Vy
aWVzPwoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
