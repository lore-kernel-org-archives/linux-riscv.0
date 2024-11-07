Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D89DD5D67D
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJwP9Otg9rBshrGUoBL8Kp7Oz0Zgv17u6+kEPd2UJDY=; b=hdVPWx5tQThgNi
	Ds6kGXdaTF0ZTH0jImLXlP9/IbO6tB9+VFQRZrGyrBWe9Yfw+czr8E+jfkNA4BKLBhvlA/PhW5QfB
	WlFkrsNNWqq4akWw6gvlErJST1gKExw5ombRudYL6TJUB+Y/UwSOuBYcOUBeulltgm9ZpQ3GsSO8g
	lY0PHJO6yHuinCBSvIvxMPmlAO5GFJJlP1duEeTgGIURdI0UFu9qdpRtH3ECaOEKvnnqloJ3zQF0Z
	nOkFn3PfUoGCkAZ8EL/YN1WlgeD9S6CPUBOdLjUUr/OW/xxN+9zDIveyjVVPpL4KF5H8z7fbEvft6
	/lThW4lY3UwFZCFnvUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96pC-00000007t0u-0IVH;
	Thu, 07 Nov 2024 18:01:42 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95Tf-00000007fV7-0vMt
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 16:35:24 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cec8c4e2f6so1368046a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 08:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1730997321; x=1731602121; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JmDtn4eHHwzfqsO66Tv5ritJL4qD/TpJe1GQgggVHNw=;
        b=cAvRUgIdpQVJm/BEL0NGKKMcLWLI46N0esXxQ1kqGu1G82kuTRrB7T7bAs9artY3ic
         GzKbxRP8QoBNUmxDRvobSvblBtsS7tO3IlhxeWsfl/Cd5ZsHHsB3KwFukk4RJit10OG7
         WrwBfNOXje690rqnoWoB7+8nbx+jENSqYAkKEoajr2pVOjTAt3CUGpP7KSxr7azJFm2C
         jopaZRVzuCE+mm16ziZAqk0xFccAKAC06g5JZt21yYbndjMrMXTjupeyVAUEs5LeQ6UU
         hprC5RKxrPKAOE0YynUeTNCm8Lxa+/DVR7QvLZpLdA6zGHBi1GvMMgiWYzjgpJVXQ6Vu
         Y5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730997321; x=1731602121;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmDtn4eHHwzfqsO66Tv5ritJL4qD/TpJe1GQgggVHNw=;
        b=ZFV3cTcDsEoaM3UeQONvUCwBIaI0w4tW/3XyiqjOyKh2928+qaPipkcIYecHZGeQcg
         EizCfRDFQ6Jm6EhA2LGws2BKbzE+0EtD+s4WZFCmpKh/VqBUnfBEUiqhbne/hk7fXMbw
         DgQ/B/e/jTuRrCYd7XcVlfSn/xgsrs7SXWIqhDRJRZd9Je/NQ6N0uek6dAF3U8WfVrn1
         Dd8kgdFdoaURhblrQpStgxaazEE9mQQXq0SNb9pMbLbCOgL2VeLc5vuRqYBRCMQ162BB
         Ww/EIwwl4rpvmZxv3nN/J0tHFAt0TTt212ZbK/ey95awllV8EbBxU8VbW20ZK74nvyv/
         pb8w==
X-Forwarded-Encrypted: i=1; AJvYcCUX3FWen1vbl6UgRr6iYZUErhyTduAlkEADR0yr928onDImokzmgNieGlwlcBjj9PKaI2wsiN77CAVasw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxA0tlT85F9axvyHL6bIvS3cu2H1q4b2fakEkYmkvI11nE7b1+N
	MDY0Pbv65lXPoU11NyLCP9vbE3Fapr/EnFuTtI/yD5F3rElo/znoBaqHLgjwmDY=
X-Google-Smtp-Source: AGHT+IFtmxkLlGT8OxA9KTMenPWNAzzstmI7WJwkpa92ObcSE8IEPgx11H+XPafWA5cenT2npaB1EA==
X-Received: by 2002:a05:6402:27c8:b0:5cb:7877:a633 with SMTP id 4fb4d7f45d1cf-5cf098cdc8amr23197a12.33.1730997320658;
        Thu, 07 Nov 2024 08:35:20 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4ed68sm951155a12.63.2024.11.07.08.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 08:35:20 -0800 (PST)
Date: Thu, 7 Nov 2024 17:35:19 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH 1/2] iommu/riscv: Free irq vectors on pci remove
Message-ID: <20241107-4570ae5b32599c6ff96b5241@orel>
References: <20241106175102.219923-4-ajones@ventanamicro.com>
 <20241106175102.219923-5-ajones@ventanamicro.com>
 <CAH2o1u5ttY+0d4v8U=H-PwLUHZo5uMxxCQ5NAXudOQvUUMcpfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u5ttY+0d4v8U=H-PwLUHZo5uMxxCQ5NAXudOQvUUMcpfA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_083523_308080_374E107B 
X-CRM114-Status: GOOD (  21.14  )
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

T24gV2VkLCBOb3YgMDYsIDIwMjQgYXQgMTE6MDA6NTVBTSAtMDgwMCwgVG9tYXN6IEplem5hY2gg
d3JvdGU6Cj4gT24gV2VkLCBOb3YgNiwgMjAyNCBhdCA5OjUx4oCvQU0gQW5kcmV3IEpvbmVzIDxh
am9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gcmlzY3ZfaW9tbXVfcGNpX3By
b2JlKCkgY2FsbHMgcGNpX2FsbG9jX2lycV92ZWN0b3JzKCkgd2hpY2gKPiA+IHN0YXRlcyBwY2lf
ZnJlZV9pcnFfdmVjdG9ycygpIG11c3QgYmUgY2FsbGVkIG9uIGNsZWFudXAuCj4gPgo+ID4gRml4
ZXM6IDY4NjgyZTk1NzhmYiAoImlvbW11L3Jpc2N2OiBBZGQgUklTQy1WIElPTU1VIFBDSWUgZGV2
aWNlIGRyaXZlciIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wY2ku
YyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jIGIvZHJpdmVycy9pb21tdS9y
aXNjdi9pb21tdS1wY2kuYwo+ID4gaW5kZXggYzdhODkxNDMwMTRjLi4yNWEyN2U2MjdhMGUgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jCj4gPiArKysgYi9k
cml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jCj4gPiBAQCAtOTksNiArOTksNyBAQCBzdGF0
aWMgdm9pZCByaXNjdl9pb21tdV9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ID4g
ICAgICAgICBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSA9IGRldl9nZXRfZHJ2ZGF0
YSgmcGRldi0+ZGV2KTsKPiA+Cj4gPiAgICAgICAgIHJpc2N2X2lvbW11X3JlbW92ZShpb21tdSk7
Cj4gPiArICAgICAgIHBjaV9mcmVlX2lycV92ZWN0b3JzKHBkZXYpOwo+ID4gIH0KPiA+Cj4gPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHJpc2N2X2lvbW11X3BjaV90YmxbXSA9
IHsKPiA+IC0tCj4gPiAyLjQ3LjAKPiA+Cj4gCj4gQW5kcmV3LCBpbnRlcnJ1cHQgcmVsZWFzZSBj
YWxsIHBjaV9mcmVlX2lycV92ZWN0b3JzKCkgc2hvdWxkIGFscmVhZHkKPiBiZSBjYWxsZWQgYnkg
ZGV2aWNlCj4gbWFuYWdlZCByZXNvdXJjZXMgZnJhbWV3b3JrLCB3aXRoIHVud2luZCBhY3Rpb24g
Y2FsbGJhY2sgcGNpbV9tc2lfcmVsZWFzZSgpLgo+IAo+IENhbGxiYWNrIGlzIHJlZ2lzdGVyZWQg
ZHVyaW5nIHZlY3RvcnMgYWxsb2NhdGlvbjoKPiAgcGNpX2FsbG9jX2lycV92ZWN0b3JzX2FmZmlu
aXR5KCkKPiAgIF9fcGNpX2VuYWJsZV9tc2l4X3JhbmdlKCkKPiAgICBwY2lfc2V0dXBfbXNpX2Nv
bnRleHQoKQo+ICAgICBwY2ltX3NldHVwX21zaV9yZWxlYXNlKCkKPiAKPiBUaGlzIGRyaXZlciBl
bmFibGVzIGRldmljZSByZXNvdXJjZXMgbWFuYWdlbWVudCB3aXRoIGluaXRpYWwgY2FsbCB0bwo+
IHBjaW1fZW5hYmxlX2RldmljZSgpLgoKQWgsIHRoYW5rIHlvdSBmb3IgdGhlIGVkdWNhdGlvbiBh
bmQgaW5zcGlyYXRpb24gdG8gbG9vayBjbG9zZXIgYXQgaG93IHRoaXMKd29ya3MuIEl0IHdhcyBl
YXN5IHRvIGNvbmZpcm0gd2l0aCBhIFdBUk4gaW4gcGNpX2ZyZWVfaXJxX3ZlY3RvcnMoKSBhbmQg
YW4KZWNobyAxIHRvIHRoZSBJT01NVSBkZXZpY2UncyByZW1vdmUgc3lzZnMgbm9kZS4KCj4gCj4g
QXJlIHRoZXJlIGFueSBjb25kaXRpb25zIC8gdGVzdGluZyBzZXF1ZW5jZSB0aGUgcmVsZWFzZSBm
dW5jdGlvbiBpcyBub3QgY2FsbGVkPwoKTm8sIG5vdCB0aGF0IEkga25vdyBvZiwgdGhpcyB3YXMg
anVzdCBteSBrbmVlIGplcmsgZGVjaXNpb24gdG8gbWltaWMgdGhlCmNhbGwgcGFpcmluZyBJIHdh
cyBkb2luZyBvbiB0aGUgcGxhdGZvcm0gc2lkZSB0byB0aGUgcGNpIHNpZGUuIFNvcnJ5IGZvcgp0
aGUgbm9pc2UsIHRoaXMgcGF0Y2ggY2FuIGJlIGRyb3BwZWQuCgpUaGFua3MsCmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
