Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38226CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 08:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebaqtT91vNtHeVBAibLKDvhR4tIWcMhdA3kHrHdjhrE=; b=14h5rIvil4gd/g
	IdM9hJjUA4Vc78rHcHMkA2Mjn+mkdn2N4vGDq3b1y1oCSub6ANrJ2XsKJsFFgfCXG5Z53ckGA74VI
	uN3MtpU370X40kt5OfKNSI/55JiOrMRhyOOAqGXa5CIoTW1jkt3YcPNev/6krD/9HFBzuaFUcbeut
	z+0Ze9HdoUpfcdkr3JgpuIsCFutRfXCpfz6+xsBMMh0RAw1SIgR1zDXC952xS0QoDU1a1R7gqaUnl
	bE6xZ/KiwilwYXh03p1+3+smmXnkKrYwSE07EYw2Lf1Z3rwslmoqrnWoy8T5RhWCCU3QrX7DroHKP
	tisfalNP6je+K46XoK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Prf-00000003VZf-21gZ;
	Wed, 08 Oct 2025 08:49:39 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Prd-00000003VZ1-0kqP
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 08:49:38 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b551b040930so4741417a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759913376; x=1760518176; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v063PFHSc1gjQVRPTuEMNoZ9lB106FcvcJqBcKcRy2Y=;
        b=DOPTNtulp7CVNuHzVWwJNMLhaDve3TBlIOQ5sQ1sZOh2vdiiKCS468jzoG3OyVG/e1
         97doBDYajOFiUdn3GaSkgTwRonP8sCP7fZw3M3kMEStxTmK051dFQrjx17M8GKTW3IZ1
         oDITqOZuDMhDZqVacbLbnPAmL0mgxBjSF0Qqwk8INyXPdIwuLrWz1ea1EHGu922fhmjj
         l51UfkWLW79ynvhd1u5prw3jtt3ZqtsW3RptGSAt2et9b5CZxeZIVqUO29CdMeRuPovY
         hIQTk/mMTdDASzlvgSvCb0qhB03O2zB1bOw0ZO+JL6bKYgOx/70BAS6tWRyYon3N+fva
         OHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913376; x=1760518176;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v063PFHSc1gjQVRPTuEMNoZ9lB106FcvcJqBcKcRy2Y=;
        b=RmD5eOZw0ZoY2NP7H4FgFgd78p7JczuAlwIbxhtl0TwMAwF1SHxSlWeZ8/1cvNXDCX
         di2wQOueEbakd2fsUwZfkQ02Y0EQ8OGJZ/3PwJAJ+Ud1Hu+ETMxAxEYQby3HQEfQtShD
         nAzHAfYgrqIhYTUoRM5MQSCYl6wZPuyH4Tj5eOGRrYmkmu/KFBJrQrnODZVPPU+PFhok
         RcrTrraxQ/i4bo+aTCa6x2c0/rsYwOMKFeMJDLdt6t1taESO+2Bs/fQeX/xvUZ+4UW1N
         Nk+/rKwdQFDWiMvCRjiKHny8mv6g0i7jJX/L3e8TfYHBmYdozcHzUmxEWvmn2Dmf6SLm
         Jc9A==
X-Forwarded-Encrypted: i=1; AJvYcCXUFuXs1V8qhto5p98oa8QzNTPej80/gc5cOUqBBrSeSZ4A56E2aPJ2bHt4uICl/Ps8aR2hIIlt64D6mQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVgCo7oSYeT+MFkhY5u0qr9YcDcvj2k01T896GEuWT75NCHp6w
	iBWdDAtUr2JCTGfXP6sGeA5H8g/tabW5dCRgHJmyFn2NZ+w+HcqXpfi9
X-Gm-Gg: ASbGncvT8UqGQg1g/rAtH89fjJiyXc2OGek7aXTEOKwV0EtxYfPcg43UX0G8Y4jG7tL
	0IdphBt9PBsqjYTGDZvRg/nIhvyGdb8Ov29E+n0kG9sJEbndPf0k6b9Ax6DhQj1SLP0vRZlgeU6
	yrIwspizEKIfD+LFBicWwEmThWyxekCkUlGfcWS6MbDnJvFBCIzFr+NEVDb4U3mJq/Oevul7cOc
	IXr0C5fSMqn4MyveEdksx1aYf0VrDPcOA+kTHclmWFciIyMrffGtH4yZMnNgIpv9YQpyHlppWEO
	+/IZO9GLKQXxwfQMwj+Bd1WWdGTc8lxGwic/PNX9rxzN3fkB9ffMsqkxdEHigab0R0bDr0EszHA
	7wR2TZ+EM70AWkD0y5hcins7ObNwKYnH3SIs/zGjO7RwZbAFP
X-Google-Smtp-Source: AGHT+IEn4dr9WPi2dRHtbGX/nSAXQJpfA4KLTasMB6vT0AgR33JypLI3Jn8Z0xOPQzZtBHvu86ojaQ==
X-Received: by 2002:a17:90b:4b04:b0:32e:8c14:5d09 with SMTP id 98e67ed59e1d1-33b51105bbfmr3466478a91.7.1759913375457;
        Wed, 08 Oct 2025 01:49:35 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510e91d4sm2540549a91.1.2025.10.08.01.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:49:34 -0700 (PDT)
Message-ID: <6c7dfe6b-8cc0-4cde-945b-c423ef517be8@gmail.com>
Date: Wed, 8 Oct 2025 01:48:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] rvtrace: Add trace encoder driver
From: Bo Gan <ganboing@gmail.com>
To: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>, Ingo Molnar
 <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>,
 Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>,
 Liang Kan <kan.liang@linux.intel.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <20251002060732.100213-6-apatel@ventanamicro.com>
 <793a00d6-a1ae-4928-a326-3d276a30bdbd@gmail.com>
Content-Language: en-US
In-Reply-To: <793a00d6-a1ae-4928-a326-3d276a30bdbd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014937_224536_3A5FB548 
X-CRM114-Status: GOOD (  23.34  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvNy8yNSAwMDowOSwgQm8gR2FuIHdyb3RlOgo+IE9uIDEwLzEvMjUgMjM6MDcsIEFudXAg
UGF0ZWwgd3JvdGU6Cj4+IEZyb206IE1heXVyZXNoIENoaXRhbGUgPG1jaGl0YWxlQHZlbnRhbmFt
aWNyby5jb20+Cj4+Cj4+IEFkZCBpbml0aWFsIGltcGxlbWVudGF0aW9uIG9mIFJJU0MtViB0cmFj
ZSBlbmNvZGVyIGRyaXZlci4gVGhlIGVuY29kZXIKPj4gaXMgZGVmaW5lZCBpbiB0aGUgUklTQy1W
IFRyYWNlIENvbnRyb2wgSW50ZXJmYWNlIHNwZWNpZmljYXRpb24uCj4+Cj4+IENvLWRldmVsb3Bl
ZC1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBNYXl1cmVzaCBDaGl0YWxlIDxtY2hpdGFsZUB2ZW50YW5hbWljcm8uY29tPgo+PiAtLS0KPj4g
wqAgZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFjZS9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgNyArKwo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL01ha2VmaWxlwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+PiDCoCBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2
dHJhY2UtZW5jb2Rlci5jIHwgMTA3ICsrKysrKysrKysrKysrKysrKysrCj4+IMKgIDMgZmlsZXMg
Y2hhbmdlZCwgMTE1IGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvaHd0cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1lbmNvZGVyLmMKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaHd0cmFjaW5nL3J2dHJhY2UvS2NvbmZpZyBiL2RyaXZlcnMvaHd0cmFjaW5nL3J2
dHJhY2UvS2NvbmZpZwo+PiBpbmRleCBmOGY2ZmVlYTE5NTMuLmJhMzVjMDVmM2Y1NCAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFjZS9LY29uZmlnCj4+ICsrKyBiL2RyaXZl
cnMvaHd0cmFjaW5nL3J2dHJhY2UvS2NvbmZpZwo+PiBAQCAtMTQsMyArMTQsMTAgQEAgbWVudWNv
bmZpZyBSVlRSQUNFCj4+IMKgwqDCoMKgwqDCoMKgIFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMg
YSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZSBtb2R1bGUKPj4gwqDCoMKgwqDCoMKgwqAgd2ls
bCBiZSBjYWxsZWQgcnZ0cmFjZS4KPj4gKwo+PiArY29uZmlnIFJWVFJBQ0VfRU5DT0RFUgo+PiAr
wqDCoMKgIHRyaXN0YXRlICJSSVNDLVYgVHJhY2UgRW5jb2RlciBkcml2ZXIiCj4+ICvCoMKgwqAg
ZGVwZW5kcyBvbiBSVlRSQUNFCj4+ICvCoMKgwqAgZGVmYXVsdCB5Cj4+ICvCoMKgwqAgaGVscAo+
PiArwqDCoMKgwqDCoCBUaGlzIGRyaXZlciBwcm92aWRlcyBzdXBwb3J0IGZvciBSSVNDLVYgVHJh
Y2UgRW5jb2RlciBjb21wb25lbnQuCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9y
dnRyYWNlL01ha2VmaWxlIGIvZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFjZS9NYWtlZmlsZQo+PiBp
bmRleCA5ODg1MjVhMzc5Y2YuLmYzMjA2OTNhMWZjNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9o
d3RyYWNpbmcvcnZ0cmFjZS9NYWtlZmlsZQo+PiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9ydnRy
YWNlL01ha2VmaWxlCj4+IEBAIC0yLDMgKzIsNCBAQAo+PiDCoCBvYmotJChDT05GSUdfUlZUUkFD
RSkgKz0gcnZ0cmFjZS5vCj4+IMKgIHJ2dHJhY2UteSA6PSBydnRyYWNlLWNvcmUubyBydnRyYWNl
LXBsYXRmb3JtLm8KPj4gK29iai0kKENPTkZJR19SVlRSQUNFX0VOQ09ERVIpICs9IHJ2dHJhY2Ut
ZW5jb2Rlci5vCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2dHJh
Y2UtZW5jb2Rlci5jIGIvZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFjZS9ydnRyYWNlLWVuY29kZXIu
Ywo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjQ1ZDFjNWIx
MmM1MQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5nL3J2dHJhY2Uv
cnZ0cmFjZS1lbmNvZGVyLmMKPj4gQEAgLTAsMCArMSwxMDcgQEAKPj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChjKSAyMDI1IFZl
bnRhbmEgTWljcm8gU3lzdGVtcyBJbmMuCj4+ICsgKi8KPj4gKwo+PiArI2luY2x1ZGUgPGxpbnV4
L2RldmljZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgv
b2YuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4
L3BsYXRmb3JtX2RldmljZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+Cj4+ICsj
aW5jbHVkZSA8bGludXgvcnZ0cmFjZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+
ICsKPj4gKyNkZWZpbmUgUlZUUkFDRV9DT01QT05FTlRfQ1RSTF9JVFJBQ0VfTUFTS8KgwqDCoCAw
eDEKPj4gKyNkZWZpbmUgUlZUUkFDRV9DT01QT05FTlRfQ1RSTF9JVFJBQ0VfU0hJRlTCoMKgwqAg
Mgo+PiArI2RlZmluZSBSVlRSQUNFX0NPTVBPTkVOVF9DVFJMX0lOU1RNT0RFX01BU0vCoMKgwqAg
MHg3Cj4+ICsjZGVmaW5lIFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfSU5TVE1PREVfU0hJRlTCoMKg
wqAgNAo+PiArCj4+ICtzdGF0aWMgaW50IHJ2dHJhY2VfZW5jb2Rlcl9zdGFydChzdHJ1Y3QgcnZ0
cmFjZV9jb21wb25lbnQgKmNvbXApCj4+ICt7Cj4+ICvCoMKgwqAgdTMyIHZhbDsKPj4gKwo+PiAr
wqDCoMKgIHZhbCA9IHJ2dHJhY2VfcmVhZDMyKGNvbXAtPnBkYXRhLCBSVlRSQUNFX0NPTVBPTkVO
VF9DVFJMX09GRlNFVCk7Cj4+ICvCoMKgwqAgdmFsIHw9IEJJVChSVlRSQUNFX0NPTVBPTkVOVF9D
VFJMX0lUUkFDRV9TSElGVCk7Cj4+ICvCoMKgwqAgcnZ0cmFjZV93cml0ZTMyKGNvbXAtPnBkYXRh
LCB2YWwsIFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfT0ZGU0VUKTsKPj4gK8KgwqDCoCByZXR1cm4g
cnZ0cmFjZV9wb2xsX2JpdChjb21wLT5wZGF0YSwgUlZUUkFDRV9DT01QT05FTlRfQ1RSTF9PRkZT
RVQsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUlZUUkFDRV9DT01QT05FTlRf
Q1RSTF9JVFJBQ0VfU0hJRlQsIDEsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29tcC0+cGRhdGEtPmNvbnRyb2xfcG9sbF90aW1lb3V0X3VzZWNzKTsKPj4gK30KPj4gKwo+PiAr
c3RhdGljIGludCBydnRyYWNlX2VuY29kZXJfc3RvcChzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQg
KmNvbXApCj4+ICt7Cj4+ICvCoMKgwqAgdTMyIHZhbDsKPj4gKwo+PiArwqDCoMKgIHZhbCA9IHJ2
dHJhY2VfcmVhZDMyKGNvbXAtPnBkYXRhLCBSVlRSQUNFX0NPTVBPTkVOVF9DVFJMX09GRlNFVCk7
Cj4+ICvCoMKgwqAgdmFsICY9IH5CSVQoUlZUUkFDRV9DT01QT05FTlRfQ1RSTF9JVFJBQ0VfU0hJ
RlQpOwo+PiArwqDCoMKgIHJ2dHJhY2Vfd3JpdGUzMihjb21wLT5wZGF0YSwgdmFsLCBSVlRSQUNF
X0NPTVBPTkVOVF9DVFJMX09GRlNFVCk7Cj4+ICvCoMKgwqAgcmV0dXJuIHJ2dHJhY2VfcG9sbF9i
aXQoY29tcC0+cGRhdGEsIFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfT0ZGU0VULAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfSVRSQUNFX1NI
SUZULCAwLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXAtPnBkYXRhLT5j
b250cm9sX3BvbGxfdGltZW91dF91c2Vjcyk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHJ2
dHJhY2VfZW5jb2Rlcl9zZXRtb2RlKHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudCAqY29tcCwgdTMy
IG1vZGUpCj4+ICt7Cj4+ICvCoMKgwqAgdTMyIHZhbDsKPj4gKwo+PiArwqDCoMKgIHZhbCA9IHJ2
dHJhY2VfcmVhZDMyKGNvbXAtPnBkYXRhLCBSVlRSQUNFX0NPTVBPTkVOVF9DVFJMX09GRlNFVCk7
Cj4+ICvCoMKgwqAgdmFsIHw9IChtb2RlIDw8IFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfSU5TVE1P
REVfU0hJRlQpOwo+PiArwqDCoMKgIHJ2dHJhY2Vfd3JpdGUzMihjb21wLT5wZGF0YSwgdmFsLCBS
VlRSQUNFX0NPTVBPTkVOVF9DVFJMX09GRlNFVCk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQg
cnZ0cmFjZV9lbmNvZGVyX3Byb2JlKHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudCAqY29tcCkKPj4g
K3sKPj4gK8KgwqDCoCBpbnQgcmV0Owo+PiArCj4+ICvCoMKgwqAgcnZ0cmFjZV9lbmNvZGVyX3Nl
dG1vZGUoY29tcCwgMHg2KTsKPj4gK8KgwqDCoCByZXQgPSBydnRyYWNlX2VuYWJsZV9jb21wb25l
bnQoY29tcCk7Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBk
ZXZfZXJyX3Byb2JlKCZjb21wLT5kZXYsIHJldCwgImZhaWxlZCB0byBlbmFibGUgZW5jb2Rlci5c
biIpOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4gVHJhY2UgY29tcG9uZW50cyBu
ZWVkcyBwcm9wZXIgcHJvYmluZyBiZWZvcmUgdXNlLiBSZWZlciB0byBDb250cm9sIEludGVyZmFj
ZQo+IFNwZWM6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3RnLW5leHVzLXRyYWNl
L3JlbGVhc2VzL2Rvd25sb2FkLzEuMF9SYXRpZmllZC9SSVNDLVYtVHJhY2UtQ29udHJvbC1JbnRl
cmZhY2UucGRmCj4gQ2hhcHRlciA1LiBUaGlzIHZlcnNpb25pbmcgYXBwbGllcyB0byBhbGwgY29t
cG9uZW50cywgZS5nLiwgc2lua3MvZnVubmVscy4uLgo+IFRoZSBkcml2ZXIgc2hvdWxkIGNoZWNr
IHRoZSBIVyBpbXBsIHZlcnNpb24gd2l0aCB3aGF0IGl0IHN1cHBvcnRzLCBhbmQKPiByZWplY3Rz
IHJlZ2lzdGVyaW5nIHRoZSBjb21wb25lbnQocykgaWYgbm90IHN1cHBvcnRlZC4gQ2hhcHRlciA1
LiBoYXMgbW9yZQo+IGRldGFpbHMuCj4gCkZvcmdvdCB0byBtZW50aW9uIGFub3RoZXIgdGhpbmc6
IHlvdSBhbHNvIG5lZWQgdG8gZm9sbG93IENvbnRyb2wgSW50ZXJmYWNlClNwZWMgQ2hhcHRlciAx
MS4yIFJlc2V0IGFuZCBEaXNjb3ZlcnkgdG8gdG9nZ2xlIHRyPz9BY3RpdmUuIERvIG5vdCBhY2Nl
c3MKYW55IG90aGVyIHJlZ2lzdGVycyBvciBzZXQgYW55IG90aGVyIGJpdHMgaW4gdHI/P0NvbnRy
b2wgYmVmb3JlIHByb3Blcmx5CmVuYWJsZSB0cj8/QWN0aXZlLiBNeSB1c2Vyc3BhY2UgZHJpdmVy
IGRvZXMgdGhlIHJlc2V0IGFzOgpodHRwczovL2dpdGh1Yi5jb20vZ2FuYm9pbmcvcmlzY3YtdHJh
Y2UtdW1kL2Jsb2IvbWFzdGVyL3J2dHJhY2UvZGV2aWNlLnB5I0w1NwoKWW91ciBIVyBJUCBtaWdo
dCBpZ25vcmUgdHI/P0FjdGl2ZSBiaXQgYW5kIHRoZSB0cmFjZSBjb21wb25lbnRzIGFyZSBhbHdh
eXMKY2xvY2tlZCwgYW5kIHRoYXQncyBwcm9iYWJseSB3aHkgeW91IGRvbid0IHNlZSBhbnkgaXNz
dWUgd2l0aG91dCBwcm9wZXIKcmVzZXR0aW5nLiBIb3dldmVyLCBvbiBteSBwNTUwIChFSUM3NzAw
KSwgSSBhZG9wdGVkIHlvdXIgY29kZSB0byBhIHY2LjYKdHJlZSwgYm9vdCwgYW5kIGxvYWQgaXQg
YXMgbW9kdWxlLiBUaGUgY29yZSBpbW1lZGlhdGVseSBoYW5ncywgdmVyeSBsaWtlbHkKZHVlIHRv
IGl0IHRyaWVzIHRvIHNldCB0cj8/Q29udHJvbCBiaXRzIHdpdGhvdXQgcHJvcGVyIHJlc2V0dGlu
Zy4gWW91CnNob3VsZCBleHBlY3Qgb3RoZXIgSVBzIHRoYXQgaW1wbGVtZW50IGNsb2NrIGdhdGlu
ZyBhbmQgc3RyaWN0bHkgZm9sbG93CnRoZSBTcGVjLiBUaGFua3MuCgo+PiArCj4+ICtzdGF0aWMg
dm9pZCBydnRyYWNlX2VuY29kZXJfcmVtb3ZlKHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudCAqY29t
cCkKPj4gK3sKPj4gK8KgwqDCoCBpbnQgcmV0Owo+PiArCj4+ICvCoMKgwqAgcmV0ID0gcnZ0cmFj
ZV9kaXNhYmxlX2NvbXBvbmVudChjb21wKTsKPj4gK8KgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKg
wqDCoMKgwqAgZGV2X2VycigmY29tcC0+ZGV2LCAiZmFpbGVkIHRvIGRpc2FibGUgZW5jb2Rlci5c
biIpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50X2lkIHJ2
dHJhY2VfZW5jb2Rlcl9pZHNbXSA9IHsKPj4gK8KgwqDCoCB7IC50eXBlID0gUlZUUkFDRV9DT01Q
T05FTlRfVFlQRV9FTkNPREVSLAo+PiArwqDCoMKgwqDCoCAudmVyc2lvbiA9IHJ2dHJhY2VfY29t
cG9uZW50X21rdmVyc2lvbigxLCAwKSwgfSwKPj4gK8KgwqDCoCB7fSwKPj4gK307Cj4+ICsKPj4g
K3N0YXRpYyBzdHJ1Y3QgcnZ0cmFjZV9kcml2ZXIgcnZ0cmFjZV9lbmNvZGVyX2RyaXZlciA9IHsK
Pj4gK8KgwqDCoCAuaWRfdGFibGUgPSBydnRyYWNlX2VuY29kZXJfaWRzLAo+PiArwqDCoMKgIC5z
dGFydCA9IHJ2dHJhY2VfZW5jb2Rlcl9zdGFydCwKPj4gK8KgwqDCoCAuc3RvcCA9IHJ2dHJhY2Vf
ZW5jb2Rlcl9zdG9wLAo+PiArwqDCoMKgIC5wcm9iZSA9IHJ2dHJhY2VfZW5jb2Rlcl9wcm9iZSwK
Pj4gK8KgwqDCoCAucmVtb3ZlID0gcnZ0cmFjZV9lbmNvZGVyX3JlbW92ZSwKPj4gK8KgwqDCoCAu
ZHJpdmVyID0gewo+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAicnZ0cmFjZS1lbmNvZGVyIiwK
Pj4gK8KgwqDCoCB9LAo+PiArfTsKPj4gKwo+PiArc3RhdGljIGludCBfX2luaXQgcnZ0cmFjZV9l
bmNvZGVyX2luaXQodm9pZCkKPj4gK3sKPj4gK8KgwqDCoCByZXR1cm4gcnZ0cmFjZV9yZWdpc3Rl
cl9kcml2ZXIoJnJ2dHJhY2VfZW5jb2Rlcl9kcml2ZXIpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMg
dm9pZCBfX2V4aXQgcnZ0cmFjZV9lbmNvZGVyX2V4aXQodm9pZCkKPj4gK3sKPj4gK8KgwqDCoCBy
dnRyYWNlX3VucmVnaXN0ZXJfZHJpdmVyKCZydnRyYWNlX2VuY29kZXJfZHJpdmVyKTsKPj4gK30K
Pj4gKwo+PiArbW9kdWxlX2luaXQocnZ0cmFjZV9lbmNvZGVyX2luaXQpOwo+PiArbW9kdWxlX2V4
aXQocnZ0cmFjZV9lbmNvZGVyX2V4aXQpOwo+PiArCj4+ICsvKiBNb2R1bGUgaW5mb3JtYXRpb24g
Ki8KPj4gK01PRFVMRV9BVVRIT1IoIk1heXVyZXNoIENoaXRhbGUgPG1jaGl0YWxlQHZlbnRhbmFt
aWNyby5jb20+Iik7Cj4+ICtNT0RVTEVfREVTQ1JJUFRJT04oIlJJU0MtViBUcmFjZSBFbmNvZGVy
IERyaXZlciIpOwo+PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+IAo+IEJvCgpCbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
