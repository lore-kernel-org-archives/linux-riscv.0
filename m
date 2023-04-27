Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9C1C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kSfg73qT0DEwOA83Mox+fN4ed6k4+YEyROXqewKwJs=; b=qj96kWYcptu2/E
	VHe6ydBbRKDAAr9+QhQDKYRKTskIhsMC+uGh2KmsegXoGaseiEGfAvQGk9wxyiepyZXgrsx3Fo3EX
	9kvnex5/mvyZGSVykfJndx+psQjP9+gu25Tx1/dpaJbT6+1ftMR0JtOOs9zgXgj7T//qD/6jSA3ow
	EfK9LRYCBrPyxmfOyM7LdhRhJtnQRhES+EI8yqdv1bfg6+OmaoTzlwlMPnkmCus//k14qQa7thx1s
	+To1eCe9bK2CY1qliSRHv3hiNi08msCEX0gzVANvb27sPB3QUl2VBpb/UXmkvLl2WgSOPVmEiduLv
	sYeWjCHKbz++G015ssSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prxvE-005ztT-0C;
	Thu, 27 Apr 2023 09:28:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prxvA-005zsP-1p
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 09:28:13 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b4960b015so6503946b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Apr 2023 02:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682587689; x=1685179689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSffrdiQPNNJd53oPjULTxIDSQd1IqHIbkRxrZQ6UwM=;
        b=F/zn3ER6A0Q+l5tyEH+ooDZjeuYDIzMGhQDb6TqHt3Pb0O13tyjs1VtHpjpkprGKJC
         /mPpOvw/3pTNKBWqGKjLEVbRI8RPP/Nj4drvC53IPKkG8ev41zKBirpKVNnXLxoMRB9x
         N4I9/LmdwNqmjEa/08JGK62+GkonSU/kkzu5F27X4ZH/dgGROBpCwQoovtDi+cmjaLnV
         0O/ST5MVcjhE++RIXI7y4d72DSrmQ4rmb5Ov98XBD3CXVd3UeFqtsk9EM2XuwNkG4PIv
         PSU/aDUj4zfNd4+hekg0hoGs4VGEhyFLpSNCfFtMQ79ep9TBZYA2xxQFsfX7PCOlSdyn
         O8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682587689; x=1685179689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSffrdiQPNNJd53oPjULTxIDSQd1IqHIbkRxrZQ6UwM=;
        b=lR27NHLBJJywuZiXfSUqmxsP76V6NavrJVmMBKxBoRfeLUZAX8x1jL8TLMXIPiV7Pq
         S0UGf4kp5D1fkJ1dkYIY3lhIyKVNl8B2UpjumlzCc6ypPW8uYRK+qLzeiUsOvwZaCAma
         UZQbvRp8wSumQHz/5mLGC40GpJMTJs1eF0GoUBeSwapDoUiFv4CL5bnV02h86gD2to3D
         EGuTfDDpmXGtXuRwUpkA8TabyX95u1//OEYyB1pZ9uGOo/Seiz2WtTlDLK3PHBxOxSQf
         7bHLorEgFMyf5oTZcouLXzmzECcn3dUFt+m5GvUoaX/3X7pZDoJdRVKP2o67pSOd7Vy1
         gVLA==
X-Gm-Message-State: AC+VfDySdeyCUfXpu6OV1/pHmpBSAK266aMGFgQuRjWEF4pd2kcAv+HW
	TR3PYnRDahrJjkjjcBOB926qNQ==
X-Google-Smtp-Source: ACHHUZ4lU97uublnhxGqgaRZ1mTY/dMxrK9u9MjTcCIsw/70eIIiihIHGNCIkmhyS4LK+caoU6p1+w==
X-Received: by 2002:a05:6a00:1515:b0:640:e12a:3a20 with SMTP id q21-20020a056a00151500b00640e12a3a20mr1786945pfu.1.1682587689567;
        Thu, 27 Apr 2023 02:28:09 -0700 (PDT)
Received: from sunil-laptop ([2409:4071:6e90:4e5:b276:2557:8da6:6c7e])
        by smtp.gmail.com with ESMTPSA id u10-20020a62d44a000000b00637ca3eada8sm12756319pfl.6.2023.04.27.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 02:28:09 -0700 (PDT)
Date: Thu, 27 Apr 2023 14:57:57 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V4 05/23] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
Message-ID: <ZEpAHfccImGsJGjk@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-6-sunilvl@ventanamicro.com>
 <87a5yua8vb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a5yua8vb.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_022812_602685_F455E4F1 
X-CRM114-Status: GOOD (  16.56  )
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

SGkgQmpvcm4sCgpPbiBXZWQsIEFwciAyNiwgMjAyMyBhdCAwNjo0NzoyMFBNICswMjAwLCBCasO2
cm4gVMO2cGVsIHdyb3RlOgo+IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3
cml0ZXM6Cj4gCj4gPiBXaXRob3V0IHRoaXMsIGlmIHRoZSB0YWJsZXMgYXJlIGxhcmdlciB0aGFu
IDRLLAo+ID4gYWNwaV9tYXAoKSB3aWxsIGZhaWwuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU3Vu
aWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBBY2tlZC1ieTogUmFmYWVsIEou
IFd5c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9hY3BpL29zbC5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvb3NsLmMgYi9k
cml2ZXJzL2FjcGkvb3NsLmMKPiA+IGluZGV4IDMyNjlhODg4ZmI3YS4uZjcyNTgxM2QwY2NlIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9hY3BpL29zbC5jCj4gPiArKysgYi9kcml2ZXJzL2FjcGkv
b3NsLmMKPiA+IEBAIC0yNzYsNyArMjc2LDcgQEAgYWNwaV9tYXBfbG9va3VwX3ZpcnQodm9pZCBf
X2lvbWVtICp2aXJ0LCBhY3BpX3NpemUgc2l6ZSkKPiA+ICAJcmV0dXJuIE5VTEw7Cj4gPiAgfQo+
ID4gIAo+ID4gLSNpZiBkZWZpbmVkKENPTkZJR19JQTY0KSB8fCBkZWZpbmVkKENPTkZJR19BUk02
NCkKPiA+ICsjaWYgZGVmaW5lZChDT05GSUdfSUE2NCkgfHwgZGVmaW5lZChDT05GSUdfQVJNNjQp
IHx8IGRlZmluZWQoQ09ORklHX1JJU0NWKQo+ID4gIC8qIGlvcmVtYXAgd2lsbCB0YWtlIGNhcmUg
b2YgY2FjaGUgYXR0cmlidXRlcyAqLwo+ID4gICNkZWZpbmUgc2hvdWxkX3VzZV9rbWFwKHBmbikg
ICAwCj4gCj4gQW4gb2JzZXJ2YXRpb24sIHdoaWNoIGNhbiBiZSBhZGRyZXNzZWQgbGF0ZXI7IFRo
ZSBhY3BpX29zX2lvcmVtYXAoKQo+IChjYWxsZWQgd2hlbiB0aGUgY29uZmlnIGFib3ZlIGlzIGVu
YWJsZWQgZm9yIFJWKSwgZG9lcyBub3QgaGF2ZSBhbiBhcmNoCj4gc3BlY2lmaWMgaW1wbGVtZW50
YXRpb24gZm9yIFJJU0MtVi4gVGhlIGdlbmVyaWMgb25lIGNhbGxzCj4gaW9yZW1hcF9jYWNoZWQo
KSwgd2hpY2ggb24gUklTQy1WIGRlZmF1bHRzIHRvIGlvcmVtYXAoKSAtLSBjYWNoaW5nCj4gZGlz
YWJsZWQvX1BBR0VfSU8uCj4gCj4gVGhhdCBpcyBwcm9iYWJseSBub3Qgd2hhdCB3ZSB3YW50LCBi
dXQgcmF0aGVyIHNvbWV0aGluZyBzaW1pbGFyIHRoYXQKPiBhcm02NCBkb2VzLgo+IApBY3R1YWxs
eSwgZm9yIFJJU0MtViBhY3BpX29zX2lvcmVtYXAoKSBpcyBjdXJyZW50bHkgYSB3cmFwcGVyIGFy
b3VuZAptZW1yZW1hcCgpLiBTdXJlLCB0aGlzIGNhbiBiZSBlbmhhbmNlZCBpbiBmdXR1cmUgaWYg
cmVxdWlyZWQuCgpUaGFua3MsClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
