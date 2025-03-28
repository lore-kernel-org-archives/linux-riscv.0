Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E2AC28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 13:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbogELY8q+0BG7DD3THvSEWuRAgraGjRyushD253cqg=; b=XD53S9znJjzrN2
	WBtfL20H1JffYKf06VolBHLbBarefX82r/P3a4Umi0gK+JnLVrbacwxqUdlKblKdE3eWtRAGytBeO
	H3ZAL735usLhx+v82I94gIaJsax4aktdEiOK5Df6LXTQ1Uwsfojmn9ICyTcgQ81FfG19EmdGhb2N+
	T8GM5ueaVcNSduuNvxh/g2ErocxRBQP8rwrgCDCwrh/DCxA8xRE00/zgop2dtRtB6wICoOiKxKAA/
	nKUbdl/e/467Idx+uEx6xUVxgggjz8n+HoDt0ECsFhZoXbp+wJdcYdJBxNcfm26//iR32pGsYQD6M
	fd45hzR/kbY/sT5aNsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9Ln-0000000DMxL-1GQD;
	Fri, 28 Mar 2025 13:02:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9Lk-0000000DMws-2lP0
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 13:02:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2241053582dso1808055ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743166936; x=1743771736; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TW7rcmweIlsrSC+6IbMmik/ob6BAUTJ219vwGjKT9mM=;
        b=LPG5UwUdQyc/XA3kgg7EUM+L5HWdRB3Zh3lCiSMGl+zprj1cOYJLmwLZWrG8RaFDF7
         0q68sw9VyJ3gASeRaMB/4zT60gtF/R63UPGP4tEKJkRgmiGd8a2m7e8dHqUIHgMSxFRY
         hSH7wOkeuRJssYUNTX5cCdtmrXxZnylmcZCegTrHqz00lDK3M8IE6C+tdsYV2rYK14rU
         MqlwnDgVOzg99zmN/nFn1WeNUgT/nadZTsNWcW/5ueu3PsEmQTZ6QGwkx5aeRMnq0MH6
         0+sCOkD9JKpMaO3VIE74uSWP323fjngFn9Kvnomk9aTpYsxrXYF6Tvztn0W6iEN/pAnL
         V3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743166936; x=1743771736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TW7rcmweIlsrSC+6IbMmik/ob6BAUTJ219vwGjKT9mM=;
        b=VgaC/JyGEkO48wc+Hdcce4sshflCKPGO9TUwmG/Zl29HmXWTu+ln7JEOVfjiqEp0L5
         +/jYeWyqF44pMXtBPRz5eCAcjnNEAm+fNkoyaZrhRtw94FCvmBMhCBQ9T0mj8IDGPR4l
         85rjc2GT2jivo+V4BBlS9Cof0JQxBOOKWl5fuQhMNMCzsOz0Zz3Ts2vyTYLF/nXy2Hw3
         O6Rde/6m5n1AgnNiF510VKXWk+gNGMYVLFbmKWdgkO382FYDAWTNevWUlUQ2lc9kihuv
         kzXiaKuib8YaSjrXbT2nEvLaIv5jArP9Ed6kEcubGrClGigWy7s7Vr1Ke6zv3e96OAGz
         Zcjg==
X-Forwarded-Encrypted: i=1; AJvYcCWYMlki5+3XIInf3FTSk3Vq3DxGww/tJybjJXdbE4OuA6RMhmDgCguzr+N9N4JXkbmq92nsHQYeigWkXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL/+iQtWUJ1f/A+3kAyPFQfEW4jt2hio2Vz/4b+s2CoDh0r60n
	noXKLdGWTUeyvJDTEz1O2R/Y7O+nKf6PHpeVTd64VLx9v+4DgUPvw1pa12xw0IY=
X-Gm-Gg: ASbGncvdyhDB92Z8cLg8e8R/Lcliie77Oor4hdk42eRgypjy+Q0IwrYIGHHGQmBkq92
	PVMbYSncBepPVrPpsFgm9fgr6r0PfVDPxfMyfJaloctEM+tMPNybXnvSO81ifomwaNkOAUnbsnJ
	yLimyqzp00uBonX3MVkyH/dm7I7s9sB3b9eEdqjhQu4JkdFoE0mLHL/YH53YOfXbS66lZ2t9rI9
	0PWTj+PtmYZ1gIIhPdVl2R19a7Bw1ocH8lVw1mAzXT5oje/Fi9gh0ywXzzTHDV9+KQSfxly/LYv
	F4Lo9fbosd3iMpZfC76vYjsmKPkLgXOt9gCMY5oJfZoliWIdp35ZQgwA1YnWL2/yjLhmm4ISIyW
	uErXdEoqo1EEUJw==
X-Google-Smtp-Source: AGHT+IH1GOqGgr7ayswYiJhPbU/AHZRTKtdQ78gPezC52OtNfXU679qlT5nrGGQooRauw8nPfoeTGQ==
X-Received: by 2002:a05:6a00:852:b0:736:46b4:bef2 with SMTP id d2e1a72fcca58-73960e2cfe9mr11451684b3a.6.1743166935461;
        Fri, 28 Mar 2025 06:02:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deef04sm1642170b3a.1.2025.03.28.06.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 06:02:14 -0700 (PDT)
Message-ID: <c0f425ec-6c76-45b2-b1bc-8d9be028a878@rivosinc.com>
Date: Fri, 28 Mar 2025 14:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Make sure toolchain supports zba before using zba
 instructions
To: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: kernel test robot <lkp@intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>
References: <20250328115422.253670-1-alexghiti@rivosinc.com>
 <7352dfbf-51e0-47b0-81e2-264f30989bf1@rivosinc.com>
 <26afad1a-bee0-498b-8213-aea87167dedd@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <26afad1a-bee0-498b-8213-aea87167dedd@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_060216_895793_95986372 
X-CRM114-Status: GOOD (  17.57  )
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

CgpPbiAyOC8wMy8yMDI1IDE0OjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gT24gMjgvMDMv
MjAyNSAxMzo1MSwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+PiBPbiAyOC8wMy8yMDI1IDEy
OjU0LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+PiBPbGQgdG9vbGNoYWluIGxpa2UgZ2NjIDgu
NS4wIGRvZXMgbm90IHN1cHBvcnQgemJhLCBzbyB3ZSBtdXN0IGNoZWNrIHRoYXQKPj4+IHRoZSB0
b29sY2hhaW4gc3VwcG9ydHMgdGhpcyBleHRlbnNpb24gYmVmb3JlIHVzaW5nIGl0IGluIHRoZSBr
ZXJuZWwuCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwu
Y29tPgo+Pj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIw
MjUwMzI4MTgzNi44cG50SG02SS0KPj4+IGxrcEBpbnRlbC5jb20vCj4+PiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4+PiAtLS0KPj4+IMKg
IGFyY2gvcmlzY3YvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCA4ICsrKysrKysrCj4+PiDCoCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3J1bnRpbWUtY29u
c3QuaCB8IDUgKysrLS0KPj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4+PiBpbmRleCAwZDhkZWY5NjhhN2UuLmFlNjMwM2YxNWIyOCAx
MDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCj4+PiBAQCAtNzM1LDYgKzczNSwxNCBAQCBjb25maWcgVE9PTENIQUlOX0hBU19WRUNU
T1JfQ1JZUFRPCj4+PiDCoMKgwqDCoMKgIGRlZl9ib29sICQoYXMtaW5zdHIsIC5vcHRpb24gYXJj
aCQoY29tbWEpICt2JChjb21tYSkgK3p2a2IpCj4+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQVNf
SEFTX09QVElPTl9BUkNICj4+PiDCoCArY29uZmlnIFRPT0xDSEFJTl9IQVNfWkJBCj4+PiArwqDC
oMKgIGJvb2wKPj4+ICvCoMKgwqAgZGVmYXVsdCB5Cj4+PiArwqDCoMKgIGRlcGVuZHMgb24gITY0
QklUIHx8ICQoY2Mtb3B0aW9uLC1tYWJpPWxwNjQgLW1hcmNoPXJ2NjRpbWFfemJhKQo+Pj4gK8Kg
wqDCoCBkZXBlbmRzIG9uICEzMkJJVCB8fCAkKGNjLW9wdGlvbiwtbWFiaT1pbHAzMiAtbWFyY2g9
cnYzMmltYV96YmEpCj4+PiArwqDCoMKgIGRlcGVuZHMgb24gTExEX1ZFUlNJT04gPj0gMTUwMDAw
IHx8IExEX1ZFUlNJT04gPj0gMjM5MDAKPj4+ICvCoMKgwqAgZGVwZW5kcyBvbiBBU19IQVNfT1BU
SU9OX0FSQ0gKPj4+ICsKPj4+IMKgIGNvbmZpZyBSSVNDVl9JU0FfWkJBCj4+IEhpIEFsZXgsCj4+
Cj4+IFdoeSBub3QgYWRkIGEgImRlcGVuZHMgb24gVE9PTENIQUlOX0hBU19aQkEiIGhlcmUgc28g
eW91IGRvbid0IGhhdmUgdG8KPj4gY2hlY2sgZm9yIHRoYXQgY29uZmlnIG9wdGlvbiB3aGVuIHVz
aW5nIENPTkZJR19SSVNDVl9JU0FfWkJBID8gVGhpcyBpcwo+PiBkb25lIGxpa2UgdGhhdCBmb3Ig
WkJCIGFuZCBaQkMuCj4gCj4gCj4gQWN0dWFsbHkgQ29ub3IgY2hhbmdlZCB0aGF0IGZvciBaYmIg
aW4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvCj4gbGttbC8yMDI0MTAyNC1hc3BpcmUtcmVjdGlm
eS05OTgyZGE2OTQzZTVAc3B1ZC9ULwo+ICNtODlkNDViYTNjYmM2YzJmOTUzNTE2YzBlOTk3N2Zl
Y2YzOTc4MDliMCB3aGljaCBpcyBxdWV1ZWQgZm9yIDYuMTUuCj4gCj4gWmJhIGlzIGFsc28gdXNl
ZCBpbiBCUEYsIHNvIHdlIHNob3VsZCBub3QgcmVxdWlyZSB0aGF0IHRoZSB0b29sY2hhaW4KPiBz
dXBwb3J0cyB6YmEgYnV0IGluc3RlYWQganVzdCB0aGF0IHRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBp
dC4KCkluZGVlZCwgbWFrZXMgc2Vuc2UgIQoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gVGhhbmtz
LAo+IAo+IEFsZXgKPiAKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+PiBDbMOpbWVudAo+Pgo+Pj4gwqDC
oMKgwqDCoCBib29sICJaYmEgZXh0ZW5zaW9uIHN1cHBvcnQgZm9yIGJpdCBtYW5pcHVsYXRpb24g
aW5zdHJ1Y3Rpb25zIgo+Pj4gwqDCoMKgwqDCoCBkZWZhdWx0IHkKPj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3J1bnRpbWUtY29uc3QuaCBiL2FyY2gvcmlzY3YvCj4+PiBp
bmNsdWRlL2FzbS9ydW50aW1lLWNvbnN0LmgKPj4+IGluZGV4IGVhMmU0OWM3MTQ5Yy4uYzA3ZDA0
OWZkZDVkIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9ydW50aW1lLWNv
bnN0LmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcnVudGltZS1jb25zdC5oCj4+
PiBAQCAtNzcsNyArNzcsOCBAQAo+Pj4gwqDCoMKgwqDCoCAiLmxvbmcgMWIgLSAuXG5cdCLCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+PiDCoMKgwqDCoMKgICIucG9w
c2VjdGlvbiLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwK
Pj4+IMKgIC0jaWYgZGVmaW5lZChDT05GSUdfUklTQ1ZfSVNBX1pCQSkgJiYgZGVmaW5lZChDT05G
SUdfUklTQ1ZfSVNBX1pCS0IpCj4+PiArI2lmIGRlZmluZWQoQ09ORklHX1JJU0NWX0lTQV9aQkEp
ICYmCj4+PiBkZWZpbmVkKENPTkZJR19UT09MQ0hBSU5fSEFTX1pCQSnCoMKgwqAgXAo+Pj4gK8Kg
wqDCoCAmJiBkZWZpbmVkKENPTkZJR19SSVNDVl9JU0FfWkJLQikKPj4KPj4+IMKgICNkZWZpbmUg
cnVudGltZV9jb25zdF9wdHIoc3ltKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+Pj4gwqAgKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+IMKgwqDCoMKgwqAgdHlw
ZW9mKHN5bSkgX19yZXQsIF9fdG1wO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPj4+IEBAIC05Myw3ICs5NCw3IEBACj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgOiBbX19y
ZXRdICI9ciIgKF9fcmV0KSwgW19fdG1wXSAiPXIiIChfX3RtcCkpO8KgwqDCoMKgwqDCoMKgIFwK
Pj4+IMKgwqDCoMKgwqAgX19yZXQ7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gwqAgfSkKPj4+IC0jZWxpZiBkZWZpbmVk
KENPTkZJR19SSVNDVl9JU0FfWkJBKQo+Pj4gKyNlbGlmIGRlZmluZWQoQ09ORklHX1JJU0NWX0lT
QV9aQkEpICYmCj4+PiBkZWZpbmVkKENPTkZJR19UT09MQ0hBSU5fSEFTX1pCQSkKPj4+IMKgICNk
ZWZpbmUgcnVudGltZV9jb25zdF9wdHIoc3ltKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gwqAgKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+IMKgwqDCoMKg
wqAgdHlwZW9mKHN5bSkgX19yZXQsIF9fdG1wO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
