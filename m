Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F77EC2BA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 13:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhcdiBO2pG09M5TSIxVOIUxx1qdomCcdQ2IKcqpy6Ng=; b=d5k4AYNZjpmbc+
	Ltj4FYpXYu3q1MmV4RV/Nlh7j78Wc91snY9MA1XEuY3VqDPMq7R7wggtCWlrylRbdNbtdJgWN+vGo
	Syud5G4pq66rYMdyFn21yxFZqnJrPSCq5pEaMBaYvScfSaXSmNTPbDRCD0WMqLILSTndSnH64VS0j
	lJ1gEgOjelRyf8B76t6MWk0Ty4c1v3AZyV2cYIo4ravoG2DFXh4xsYp/bhPghXtQpCrPAchl6VRan
	Ko8buHt/1KL/2VKgbdREQAGnrvm2i4vgbaM9iRsLu8aZVJ8Ur2EvaWmatyzJqaG1KLsGxuzysmD+9
	fLTbQWPVBlIVHDuioPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJv5j-00000001Hf1-1U28;
	Wed, 19 Jun 2024 13:11:11 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJv5g-00000001Hdm-2sbT
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 13:11:10 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-795569eedcaso328089685a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718802667; x=1719407467; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kf9r27RNSYH+M0vPwe+rDP3evgG93CXIjp23HZ8WnCY=;
        b=ZSpK+oIbLNkFCRsbMkVVWAdWQWC6dLdw9CTSrW2gjrXyU/g5HmzOWIjsMtE8XlqhCB
         kIPusoZYpk1KW45DrAD9tnbraks7gcotPvk7LHOCpEAF//tutMyAXGBPuLQHYoPovWYE
         IztW4cYsFO+M63cuAZiloByiZLch3pP2uxVeMsr9ScgGNmbTYB9klIMD1Wi+ovJFe19N
         vNGYVkmzWlMPDO0ViimqA7d1Cxz+pa1yYIWd+tB0ZdKvDGGqHmxiOvnmCKPRVJDBZbhx
         FvoO2RwByfgjyyICr1zgUJZRCYPcY7KvrN84qAI68y0URpFOl8C3dkM22w00Xs2ziU16
         YmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718802667; x=1719407467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kf9r27RNSYH+M0vPwe+rDP3evgG93CXIjp23HZ8WnCY=;
        b=RM4knWWR4/hZ4d4HOiPom+JDrKfj/58h4n1NsJ3oJJFW6XclpBrBUTl8dCwiA16r2D
         YkcR9INScxMvxW0VhCeJYSY+8hcwCjAFeVNnE8d3d718aw44td8wGMn5YjR3Cso85mHQ
         B8mMBZLafB4QLgkhiVcWpb+Vt1bTcV1LdkcMWPOHvy0QsISnfLxSn7SARiShDYqI2LLP
         I9sSeAuNJhEaS3WmBd41NEInQVwPQRo14I8LicSfz65EannD5bSdjWRUew2qgOL5z8jU
         ee2uN1U0BL5VO28jff6C8N0DcnTeCW2Ki0PkeRnhiwzC42YhDVh4xqYRZ3/PaVuvkBLh
         cv6g==
X-Forwarded-Encrypted: i=1; AJvYcCXHhyyocU/p0vqSCHEHPzKwITvuMGabuuCjNVG1ba3yijcDNGfL97wehzsdxu3nODaXzod6t50X/cT6sJJUERFyy7m9KvI0LqS1d7wjtLwj
X-Gm-Message-State: AOJu0YyZbJI5kNKxfGjbd1U3FkmP3kyT+CO5TzCx7neuf9XUknUsAx0v
	WX0i+ghkbLd6DWWBmQ4CS22uuouOg1i4F0ervAKKOX2JzNEvmidowCjNriTfIDs=
X-Google-Smtp-Source: AGHT+IFE11ASRWf4WYTH0x6XxeEds9PyEcIqeUwSrbCnNFW+6zWifwS2t6Yt+SRC48O2ptbYQuGPdQ==
X-Received: by 2002:a05:620a:4308:b0:795:4e35:ea9c with SMTP id af79cd13be357-79bb3e2f4b6mr277089185a.29.1718802666926;
        Wed, 19 Jun 2024 06:11:06 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaee575fsm605502085a.40.2024.06.19.06.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:11:06 -0700 (PDT)
Date: Wed, 19 Jun 2024 18:40:54 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, bhelgaas@google.com,
	james.morse@arm.com, jeremy.linton@arm.com,
	Jonathan.Cameron@huawei.com, pierre.gondois@arm.com,
	sudeep.holla@arm.com, tiantao6@huawei.com
Subject: Re: [PATCH v6 3/3] RISC-V: Select ACPI PPTT drivers
Message-ID: <ZnLY3mNxyv9QOmGn@sunil-laptop>
References: <20240617131425.7526-1-cuiyunhui@bytedance.com>
 <20240617131425.7526-3-cuiyunhui@bytedance.com>
 <CAEEQ3wnkQsfmLbyMrG_YBvWvhHJdSTg7dG5W_mxv_wxCjatgCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wnkQsfmLbyMrG_YBvWvhHJdSTg7dG5W_mxv_wxCjatgCA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_061108_750733_170984DC 
X-CRM114-Status: GOOD (  14.82  )
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgMDc6MzI6MThQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBTdW5pbCwKPiAKPiBPbiBNb24sIEp1biAxNywgMjAyNCBhdCA5OjE04oCvUE0gWXVu
aHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IEFmdGVyIGFk
ZGluZyBBQ1BJIHN1cHBvcnQgdG8gcG9wdWxhdGVfY2FjaGVfbGVhdmVzKCksIFJJU0MtViBjYW4g
YnVpbGQKPiA+IGNhY2hlaW5mbyB0aHJvdWdoIHRoZSBBQ1BJIFBQVFQgdGFibGUsIHRodXMgZW5h
YmxpbmcgdGhlIEFDUElfUFBUVAo+ID4gY29uZmlndXJhdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IFJldmlld2VkLWJ5
OiBKZXJlbXkgTGludG9uIDxqZXJlbXkubGludG9uQGFybS5jb20+Cj4gPiBSZXZpZXdlZC1ieTog
U3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBTdW5p
bCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yv
S2NvbmZpZyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+
IGluZGV4IDlmMzhhNWVjYmVlMy4uMWI0YzMxMGE1OWZiIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC0xMyw2ICsx
Myw3IEBAIGNvbmZpZyAzMkJJVAo+ID4gIGNvbmZpZyBSSVNDVgo+ID4gICAgICAgICBkZWZfYm9v
bCB5Cj4gPiAgICAgICAgIHNlbGVjdCBBQ1BJX0dFTkVSSUNfR1NJIGlmIEFDUEkKPiA+ICsgICAg
ICAgc2VsZWN0IEFDUElfUFBUVCBpZiBBQ1BJCj4gPiAgICAgICAgIHNlbGVjdCBBQ1BJX1JFRFVD
RURfSEFSRFdBUkVfT05MWSBpZiBBQ1BJCj4gPiAgICAgICAgIHNlbGVjdCBBUkNIX0RNQV9ERUZB
VUxUX0NPSEVSRU5UCj4gPiAgICAgICAgIHNlbGVjdCBBUkNIX0VOQUJMRV9IVUdFUEFHRV9NSUdS
QVRJT04gaWYgSFVHRVRMQl9QQUdFICYmIE1JR1JBVElPTgo+ID4gLS0KPiA+IDIuMjAuMQo+ID4K
PiAKPiBHZW50bGUgcGluZy4KPiAKQWN0dWFsbHksIG15IFJCIGlzIHN0aWxsIHZhbGlkLiBBbnl3
YXksIGhlcmUgYWdhaW4uCgpSZXZpZXdlZC1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFt
aWNyby5jb20+CgpUaGFua3MsClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
