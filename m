Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B406CFA74F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ziMKMNSagHd7oJHPY9i+IjS6RoPG68GwDHUHyYPJeOc=; b=wsbXtG/90Is8ux
	ajWrN7/YVfXyvtwt6PjLBmKIvL0c1biXGHx81DSovDjlpS1IflQR7XDVFcsG8bXMimC5Rs4JfS5zy
	QSUdVDem86P0IOai1+FbZzB91iZK/5UI+5DWfiR7SChYS3InmIk3+Je1mJJnO+lmm7V48ZwW6nb8i
	51Ow3dN4X8MWccaAR27J2l76Xn5YeUBstTPcdxMkCDfZxzN1RzI+TQM1ESChmLPCKbalxOyh6rc9m
	e2NpiI8khv5A9ko7pErpyATYEWoWeU5VG8Ek6UcaNvsYjWCCAPwgMoeMjsd4g2g9qpvNexX3xRIuL
	w7tFmY7m9yNsufGe62IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMrH-00000008681-1ta6;
	Fri, 21 Nov 2025 08:51:11 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMrD-0000000867E-2XcB
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 08:51:09 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-298144fb9bcso19470025ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 00:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763715066; x=1764319866; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Zl49bFVQ8HXNASEX2XzPWaAJ5IL+RSr8MjMD86xJZI=;
        b=VDMrOqsqwxvvdWrtwWBtRkjZ0r7cXtLRhF6Om3/Q8KSI05ALvH/2dmM8ecFtJiQwma
         4w5lRykzVSSsA+rjO/nvzbQlf/28n5lYhezyYZJ87HfGHRfZTeeZsk1JsA0/81eRjRLi
         1j926vFq9K/LPTgQ6ALcxZ9ml6qw7BXiPGYj+cchr0gSv0AjoldUryhfvZYTiV4bTvoh
         KwG5fIaztP9U1mJLcpHGLU7pKgYHiI0GzwveGoJo5KLEXgaiH/TNFvotoNOA8hKSIHw7
         82+nSZWMjyCE6hHgMtJ390tQPHizpD5vVdLwCbVCdlgS65qMRB1FpQDDv3phOw2DOW0v
         HKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763715066; x=1764319866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Zl49bFVQ8HXNASEX2XzPWaAJ5IL+RSr8MjMD86xJZI=;
        b=Som1knLYGWsZJNECzYjukdfnZFw1DRgh0lxAqtMlkjTu3TpAlTRAxccKROscJ4HB0Y
         ky0HIeMTDrAR/qAz4X1FGYx1mkpPlVkCjkQaTGyO3xocvHRglLl8kyYwM+G93qrLWjRu
         Gs8rcDTTILWWacGM58IU4oyc+eDV883fkD4zdQnc5VlSBB0SmPVE8PNX6HrQ1bDWNAwN
         0raqJFuPXhn+rXEXP9AScJABiqz2pa0czyTmPSVkkpWKXC0vH63XqjDGYUVjPMS4/TdV
         2G924AmGNmsaVcV5slgjDzaxBtccsY1JfvFM29aP0leOasyw7c7fSf041JBopkVXPNIJ
         R/7g==
X-Forwarded-Encrypted: i=1; AJvYcCWEeC29Yqa5RE1xbaq7QY2HbqPA7DMyBV+7+zfk+ZipEJ1D/Q/6I38HofTn54hFlN4kTURmXtARz7BD3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB/uGIEbAQrjDtdPCEwXFdmU1bIhiwWgH8IUcXa2zP6DkjNvcv
	bbUcefCvm5wM1mdRygx8fBXGoRmpUqy4L/0YkCPL5yMNY/KOjo2qj+TaGdtDu4Zxr/M=
X-Gm-Gg: ASbGnctwR68WUDBk5BXk6HTzdi0sCF1/SvqV4kZoeUa8agn29kiV5Usje0dWDvUtg11
	HnqIeVUHUXHtZL2QZNLS0ZyQnh6Y6ix+3uW9scPvY35hEMA9CshQJ90sNKUW/Bj+VtFEQnMHQKg
	LZ25MJXDTy7qo2Gvlq8D8QnGlvgZFk9SmGzRzMGlpeHeIFWqWb5FyspawfjAc35tUyfbWjDnthR
	AzdRrKbsWPBdOi4TpcIv5pngfyRB9oFTC+9nAE0E3SmWBo/aVsciiAmjXwiihgIX18tTgsEF38o
	xxtL+8rqBYUmylk6kdvuMsIAKUUtcZHaCobnuPD+aSHeiwDHy4+sfFx2/3c2kQ8sNCtWwjFOMxK
	WXenK86MjzAbkdu7T4JcQA0f5YIrvZNuw8E/RzM9/y05kXlPHkQEz5wReVvhMAQB+zPhdXFzEC9
	1GVHxBQjveVkTUG8+3
X-Google-Smtp-Source: AGHT+IForle4Voi5B250DXGCJPKzmYnRrMuv4VZwFpXmqKqn4IMqRvfMy2WJ1GWndhzWr/EzoK5qvQ==
X-Received: by 2002:a17:90b:35cc:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-34733f19c00mr2066526a91.24.1763715066040;
        Fri, 21 Nov 2025 00:51:06 -0800 (PST)
Received: from sunil-laptop ([106.51.195.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b036a282sm5593927a91.4.2025.11.21.00.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:51:05 -0800 (PST)
Date: Fri, 21 Nov 2025 14:20:56 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: niliqiang <ni_liqiang@126.com>
Cc: apatel@ventanamicro.com, ajones@ventanamicro.com, anup@brainfault.org,
	atishp@atishpatra.org, bjorn@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, frowand.list@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, maz@kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org, saravanak@google.com,
	tglx@linutronix.de, hu.yuye@zte.com.cn, deng.weixian@zte.com.cn,
	ni.liqiang@zte.com.cn
Subject: Re: [PATCH v16 6/9] irqchip: Add RISC-V advanced PLIC driver for
 direct-mode
Message-ID: <aSAn8DdQVBBzenlJ@sunil-laptop>
References: <20240307140307.646078-7-apatel@ventanamicro.com>
 <20251120144311.5083-1-ni_liqiang@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120144311.5083-1-ni_liqiang@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_005107_652368_1C6F143A 
X-CRM114-Status: GOOD (  24.10  )
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

SGkgTGlxaWFuZywKCk9uIFRodSwgTm92IDIwLCAyMDI1IGF0IDEwOjQzOjExUE0gKzA4MDAsIG5p
bGlxaWFuZyB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWFwbGljLW1haW4uYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jCj4g
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXBsaWNfbWF0Y2hbXSA9IHsKPiA+
ICsgeyAuY29tcGF0aWJsZSA9ICJyaXNjdixhcGxpYyIgfSwKPiA+ICsge30KPiA+ICt9Owo+ID4g
Kwo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGFwbGljX2RyaXZlciA9IHsKPiA+
ICsgLmRyaXZlciA9IHsKPiA+ICsgIC5uYW1lICA9ICJyaXNjdi1hcGxpYyIsCj4gPiArICAub2Zf
bWF0Y2hfdGFibGUgPSBhcGxpY19tYXRjaCwKPiA+ICsgfSwKPiA+ICsgLnByb2JlID0gYXBsaWNf
cHJvYmUsCj4gPiArfTsKPiA+ICtidWlsdGluX3BsYXRmb3JtX2RyaXZlcihhcGxpY19kcml2ZXIp
Owo+IAo+IERlYXIgQW51cCBQYXRlbCBhbmQgYWxsIGNvbmNlcm5lZCwKPiAKPiBJIGFtIHdyaXRp
bmcgdG8gaW5xdWlyZSBhYm91dCB0aGUgaGlzdG9yaWNhbCByYXRpb25hbGUgYmVoaW5kIGRlZmlu
aW5nIHRoZSBBUExJQyBkcml2ZXIncwo+IGluaXRpYWxpemF0aW9uIHByaW9yaXR5IHVzaW5nIGJ1
aWx0aW5fcGxhdGZvcm1fZHJpdmVyIGluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLgo+IAo+
IEluIG91ciBlbnZpcm9ubWVudCwgd2UgYXJlIGVuY291bnRlcmluZyBhbiBpc3N1ZSB3aGVyZSB0
aGlzIHByaW9yaXR5IGxldmVsIGNhdXNlcyBBQ1BJLWJhc2VkIFBDSWUKPiBlbnVtZXJhdGlvbiB0
byBiZSBleGVjdXRlZCBpbiB0aGUgc3lzdGVtX3VuYm91bmRfd3Egd29yayBxdWV1ZS4gVGhpcyBw
YXJhbGxlbCBleGVjdXRpb24gbW9kZWwKPiByZXN1bHRzIGluIFBDSWUgZGV2aWNlcyBiZWluZyBl
bnVtZXJhdGVkIGluIGFuIGFyYml0cmFyeSBvcmRlciByYXRoZXIgdGhhbiBzdHJpY3RseSBmb2xs
b3dpbmcgdGhlCj4gc2VxdWVuY2UgZGVmaW5lZCBpbiB0aGUgQUNQSSBEU0RUIHRhYmxlLgo+IAo+
IFRoZSByYW5kb20gZW51bWVyYXRpb24gb3JkZXIgaXMgYWR2ZXJzZWx5IGFmZmVjdGluZyBjdXN0
b21lciBleHBlcmllbmNlLCBwYXJ0aWN1bGFybHkgaW4gc2NlbmFyaW9zCj4gd2hlcmUgZGV2aWNl
IG9yZGVyaW5nIGlzIGNyaXRpY2FsIGZvciBwcm9wZXIgc3lzdGVtIG9wZXJhdGlvbiBvciBhcHBs
aWNhdGlvbiBjb21wYXRpYmlsaXR5Lgo+IAo+IFdlIGFyZSBjb25zaWRlcmluZyBtb2RpZnlpbmcg
dGhlIEFQTElDIGRyaXZlcidzIGluaXRpYWxpemF0aW9uIHByaW9yaXR5IHRvIGVuc3VyZSBQQ0ll
IGVudW1lcmF0aW9uCj4gb2NjdXJzIHNlcXVlbnRpYWxseSBhY2NvcmRpbmcgdG8gdGhlIERTRFQg
c3BlY2lmaWNhdGlvbi4gSG93ZXZlciwgYmVmb3JlIHByb2NlZWRpbmcgd2l0aCBzdWNoCj4gY2hh
bmdlcywgd2Ugd2FudGVkIHRvIGNvbnN1bHQgd2l0aCB5b3UgcmVnYXJkaW5nOgo+IAo+IDEuIFdl
cmUgdGhlcmUgc3BlY2lmaWMgdGVjaG5pY2FsIGNvbnNpZGVyYXRpb25zIHRoYXQgbGVkIHRvIHRo
ZSBjdXJyZW50IHByaW9yaXR5IHNlbGVjdGlvbj8KPiAyLiBBcmUgdGhlcmUgYW55IHBvdGVudGlh
bCBzaWRlIGVmZmVjdHMgb3IgYnJvYWRlciBpbXBhY3RzIHRoYXQgd2UgbWlnaHQgaGF2ZSBvdmVy
bG9va2VkPwo+IDMuIFdvdWxkIHlvdSBzdXBwb3J0IHN1Y2ggYSBwcmlvcml0eSBhZGp1c3RtZW50
LCBvciBkbyB5b3UgaGF2ZSBhbHRlcm5hdGl2ZSBzdWdnZXN0aW9ucyB0byAKPiBhZGRyZXNzIHRo
ZSBlbnVtZXJhdGlvbiBvcmRlciBpc3N1ZT8KPiAKPiBXZSBncmVhdGx5IGFwcHJlY2lhdGUgeW91
ciBpbnNpZ2h0cyBhbmQgZXhwZXJ0aXNlIG9uIHRoaXMgbWF0dGVyLCBhcyBpdCB3aWxsIGhlbHAg
dXMgbWFrZSBhbgo+IGluZm9ybWVkIGRlY2lzaW9uIHdoaWxlIG1haW50YWluaW5nIHN5c3RlbSBz
dGFiaWxpdHkgYW5kIGNvbXBhdGliaWxpdHkuCj4gCj4gVGhhbmsgeW91IGZvciB5b3VyIHRpbWUg
YW5kIGNvbnNpZGVyYXRpb24uCj4gCgpJUlEgc3Vic3lzdGVtIG1haW50YWluZXJzIHJlamVjdGVk
IHRoZSBpZGVhIG9mIHJlbHlpbmcgb24gaW5pdGNhbGxzIHRvCmVuZm9yY2UgcHJvYmUgb3JkZXIg
YmVjYXVzZSBpbml0Y2FsbHMgZG8gbm90IGd1YXJhbnRlZSBvcmRlcmluZy4gVGhlCkxpbnV4IGRy
aXZlciBtb2RlbCBpbnN0ZWFkIGVuc3VyZXMgcHJvYmUgb3JkZXIgdGhyb3VnaCBkZXZpY2UKZGVw
ZW5kZW5jaWVzLiBTaW5jZSBQQ0kgSU5UeCBkZXBlbmRzIG9uIHRoZSBBUExJQyBiZWluZyBwcm9i
ZWQgZmlyc3QsCnRoZSBQQ0kgaG9zdCBicmlkZ2UgcHJvYmUgY2Fubm90IG9jY3VyIHVudGlsIGFm
dGVyIHRoZSBBUExJQyBwcm9iZQpjb21wbGV0ZXMuIFRoaXMgcmVxdWlyZW1lbnQgYW5kIGJlaGF2
aW9yIGFyZSB0aGUgc2FtZSBmb3IgYm90aCBEVCBhbmQKQUNQSS4gSW4gRFQsIHRoZSBkcml2ZXIg
bW9kZWwgdXNlcyBmd19kZXZsaW5rIHRvIGVzdGFibGlzaCBwcm9iZQpvcmRlcmluZywgd2hpbGUg
aW4gQUNQSSB0aGlzIGlzIGhhbmRsZWQgdGhyb3VnaCBlaXRoZXIgYW4gZXhwbGljaXQgX0RFUApv
ciwgb24gUklTQy1WLCB0aGUgR1NJIG1hcHBpbmcuCgpUeXBpY2FsbHksIHRoaXMgZGVwZW5kZW5j
eSBhcHBlYXJzIGluIHRoZSBEU0RUIG9ubHkgZm9yIHRoZSBQQ0kgaG9zdApicmlkZ2UuIEluZGl2
aWR1YWwgUENJZSBkZXZpY2VzIGFyZSBlbnVtZXJhdGVkIHRocm91Z2ggdGhlIHN0YW5kYXJkIFBD
SQpzY2FuIG9uY2UgdGhlIGhvc3QgYnJpZGdlIGhhcyBiZWVuIHByb2JlZC4gVGhlcmVmb3JlLCBJ
4oCZbSBub3Qgc3VyZSB3aGF0CnlvdSBtZWFudCBieSBhIHByb2JlIHNlcXVlbmNlIGRlZmluZWQg
aW4gdGhlIERTRFQgZm9yIFBDSWUgZGV2aWNlcy4KClJlZ2FyZHMsClN1bmlsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
