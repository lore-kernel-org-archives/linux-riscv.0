Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38521C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 03:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeHBN6sJtNqUSMT4XqXrTYGSVlSf9WtTtHzcSi0gxgg=; b=va6pMcKhJ1eWgN
	73fy9KDI79KrLiM4LyY+m2GXCPA6gRw8jBrwpdYXRPvD6Xu1iJIzwFwIIk3mtiYpu33rICE4pV8Yq
	PPYAdq9KHm95o00k3326Em9/kXhEQaboRYddlo+8AOdpghqMxbLNu2AsUqJtu84XARV2gRDE5vQLI
	DA6xlPVirFpXdrbHLw2D/9Fu3NLf6mk/hhvkbZtVJf1P5Qyt6lxRriKGLFngXqUdFh9XafF9S6/IF
	w1mvCLh91J9d+zNmcHpHQzgsxNlWndMYYNaC0mMvSiuKSAgUPwwKLhHTeJZRaddY2A+XKpKXuXnsz
	jiE/+RdWqmN5tkBAT+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1dyu-00000004sNn-3VxV;
	Tue, 30 Apr 2024 03:16:36 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1dyr-00000004sMV-3tK0
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 03:16:36 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-23cd15209fdso656646fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 20:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1714446987; x=1715051787; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewLuAUPPP39X0HCkRHtN2NHvevZusHejI+aydV0tNX4=;
        b=JF/4qhihIr3dOoWd61rT950qwBr1HO7quxIQjAykc6Vd4GFxv97hRcCXpcQAPaKM7Z
         cizMAtp9K3Cu0FRbz8n+9DMRsyP/mrmJSdxDFmP34gBcjFgtA2vaGm3x4tIqegiwEt+d
         mqw5eTtA9kbpeYUmpiVB9yHjhQT0b2TKYQfa6gfsn//YJnz7ICqk4EjERW+evgltJuLc
         6XXl+NJShEo1dn9rUJwgka8LtL55ziNF7zV7pT/V498e1+Jvh/QeIzPEwsMpHP2jmwr5
         1jAungChS+KYv7Z1ggAtBpXQUMCiAfXnKh5OnBdzRjyDg1+AMjteKaL9MuXvNxdEORuc
         b1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714446987; x=1715051787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewLuAUPPP39X0HCkRHtN2NHvevZusHejI+aydV0tNX4=;
        b=UTznq0DGEsiRcDAqyYHuxWT9bGBAzb835U6+pk0tkm0XPFC8UGZMK3tJL4JFotRz7q
         mOkLM24emoCGvhee3mce5XhH2fpSeTaHnZEDgwpWt+OCO9714nk7Ln4YytnrAB8ob44n
         rWb0I0tKuvNftLmOXAoWjZYzGCxPmhPWEydxGh7iuMHxxxPhMV1hUTR2sDWQjRWvQtFx
         cncLSfZbPUYqtMZeFmG1b2emBzEdjAogEVc1B4cJscnwRhymQuwjXdWdZuZX8BXKE1a7
         fJAW1pjBEghFuY56pmhsZ2OxzXnGin1VOrPaXFaoRVF7Na/qlSLGii5QA2MiSfe4lDP6
         FOBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXaSxC1k5iSCpeckAG9/o7MZ2PqLM3Uf1vhv7hREvpnZXeZZfPXXZrj1xe8o95BN1sTImY1slC1PcB3uh+sKc0WlXuTI5ssVIx9mv25Sgm
X-Gm-Message-State: AOJu0YzXTu0dKKsvXKBg00gWuMAUn6/uaEBdgAFgsoZB2TJXbVURjgP4
	6XkBxpFLk6Gao1k/0Hf5vsuT+88ZKZqCheeAPGITcPUK89waz8IszIiu5I+Romu/6oOB4GhYbol
	Rl7VLsFrQPLxeHCX2u2eplem1sApterePrHUIVw==
X-Google-Smtp-Source: AGHT+IHQZKM1ZIvOzc0BTAWTiBchrFVz/jaxMvcm4J0YS/D7nzOQrjehDvNXZEDRtLipEVRhqNLnJGXaHB+hLjHZ7EU=
X-Received: by 2002:a05:6871:8912:b0:23c:2554:d8b7 with SMTP id
 ti18-20020a056871891200b0023c2554d8b7mr8543686oab.20.1714446986897; Mon, 29
 Apr 2024 20:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
 <20240418034330.84721-2-cuiyunhui@bytedance.com> <d143cd11-26ea-42e3-8f32-700a34b3705e@arm.com>
 <CAEEQ3wkDMuu+jh56YB3G0vY_ENdUjDL6byMsJXd0C9aQu1FZKw@mail.gmail.com>
In-Reply-To: <CAEEQ3wkDMuu+jh56YB3G0vY_ENdUjDL6byMsJXd0C9aQu1FZKw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 30 Apr 2024 11:16:15 +0800
Message-ID: <CAEEQ3w=FJMzkL3_if1rQcHCUu0C9PVJzL3D3yytNLr-y3YS5nw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Jeremy Linton <jeremy.linton@arm.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, bhelgaas@google.com, james.morse@arm.com, 
	john.garry@huawei.com, Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, 
	sudeep.holla@arm.com, tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_201634_153369_368DEC95 
X-CRM114-Status: GOOD (  22.52  )
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

SGkgUGFsbWVyLAoKR2VudGxlIHBpbmcuLi4KCk9uIFR1ZSwgQXByIDIzLCAyMDI0IGF0IDc6MDPi
gK9QTSB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBQ
YWxtZXIsCj4KPiBPbiBGcmksIEFwciAxOSwgMjAyNCBhdCAxMToyOeKAr1BNIEplcmVteSBMaW50
b24gPGplcmVteS5saW50b25AYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+ID4gT24g
NC8xNy8yNCAyMjo0MywgWXVuaHVpIEN1aSB3cm90ZToKPiA+ID4gQmVmb3JlIGNhY2hlaW5mbyBj
YW4gYmUgYnVpbHQgY29ycmVjdGx5LCB3ZSBuZWVkIHRvIGluaXRpYWxpemUgbGV2ZWwKPiA+ID4g
YW5kIHR5cGUuIFNpbmNlIFJTSUMtViBjdXJyZW50bHkgZG9lcyBub3QgaGF2ZSBhIHJlZ2lzdGVy
IGdyb3VwIHRoYXQKPiA+ID4gZGVzY3JpYmVzIGNhY2hlLXJlbGF0ZWQgYXR0cmlidXRlcyBsaWtl
IEFSTTY0LCB3ZSBjYW5ub3Qgb2J0YWluIHRoZW0KPiA+ID4gZGlyZWN0bHksIHNvIG5vdyB3ZSBv
YnRhaW4gY2FjaGUgbGVhdmVzIGZyb20gdGhlIEFDUEkgUFBUVCB0YWJsZQo+ID4gPiAoYWNwaV9n
ZXRfY2FjaGVfaW5mbygpKSBhbmQgc2V0IHRoZSBjYWNoZSB0eXBlIHRocm91Z2ggc3BsaXRfbGV2
ZWxzLgo+ID4gPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IEplcmVteSBMaW50b24gPGplcmVteS5saW50
b25AYXJtLmNvbT4KPiA+ID4gU3VnZ2VzdGVkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xs
YUBhcm0uY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0
ZWRhbmNlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZv
LmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIy
IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2NhY2hlaW5mby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPiA+ID4gaW5kZXgg
MzBhNjg3ODI4N2FkLi5lNDdhMWU2YmQzZmUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL2NhY2hlaW5mby5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5m
by5jCj4gPiA+IEBAIC02LDYgKzYsNyBAQAo+ID4gPiAgICNpbmNsdWRlIDxsaW51eC9jcHUuaD4K
PiA+ID4gICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiA+ID4gICAjaW5jbHVkZSA8YXNtL2NhY2hl
aW5mby5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPiA+ID4KPiA+ID4gICBzdGF0
aWMgc3RydWN0IHJpc2N2X2NhY2hlaW5mb19vcHMgKnJ2X2NhY2hlX29wczsKPiA+ID4KPiA+ID4g
QEAgLTc4LDYgKzc5LDI3IEBAIGludCBwb3B1bGF0ZV9jYWNoZV9sZWF2ZXModW5zaWduZWQgaW50
IGNwdSkKPiA+ID4gICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwcmV2ID0gTlVMTDsKPiA+ID4g
ICAgICAgaW50IGxldmVscyA9IDEsIGxldmVsID0gMTsKPiA+ID4KPiA+ID4gKyAgICAgaWYgKCFh
Y3BpX2Rpc2FibGVkKSB7Cj4gPiA+ICsgICAgICAgICAgICAgaW50IHJldCwgZndfbGV2ZWxzLCBz
cGxpdF9sZXZlbHM7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICByZXQgPSBhY3BpX2dldF9j
YWNoZV9pbmZvKGNwdSwgJmZ3X2xldmVscywgJnNwbGl0X2xldmVscyk7Cj4gPiA+ICsgICAgICAg
ICAgICAgaWYgKHJldCkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
PiA+ICsKPiA+ID4gKyAgICAgICAgICAgICBCVUdfT04oKHNwbGl0X2xldmVscyA+IGZ3X2xldmVs
cykgfHwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgKHNwbGl0X2xldmVscyArIGZ3X2xldmVs
cyA+IHRoaXNfY3B1X2NpLT5udW1fbGVhdmVzKSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAg
ICBmb3IgKDsgbGV2ZWwgPD0gdGhpc19jcHVfY2ktPm51bV9sZXZlbHM7IGxldmVsKyspIHsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChsZXZlbCA8PSBzcGxpdF9sZXZlbHMpIHsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2lfbGVhZl9pbml0KHRoaXNfbGVhZisr
LCBDQUNIRV9UWVBFX0RBVEEsIGxldmVsKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX0lOU1QsIGxldmVsKTsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNpX2xlYWZfaW5pdCh0aGlzX2xlYWYrKywgQ0FDSEVfVFlQRV9VTklG
SUVELCBsZXZlbCk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ICsgICAgICAg
ICAgICAgfQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gPiArICAgICB9Cj4gPiA+
ICsKPiA+ID4gICAgICAgaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImNhY2hlLXNpemUi
KSkKPiA+ID4gICAgICAgICAgICAgICBjaV9sZWFmX2luaXQodGhpc19sZWFmKyssIENBQ0hFX1RZ
UEVfVU5JRklFRCwgbGV2ZWwpOwo+ID4gPiAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29s
KG5wLCAiaS1jYWNoZS1zaXplIikpCj4gPgo+ID4gWWVzLCBsb29rcyBnb29kLgo+ID4KPiA+IFJl
dmlld2VkLWJ5OiBKZXJlbXkgTGludG9uIDxqZXJlbXkubGludG9uQGFybS5jb20+Cj4gPgo+ID4K
PiA+Cj4gPiBUaGFua3MsCj4KPiBDb3VsZCB5b3UgaGVscCByZXZpZXcgdGhpcyBwYXRjaHNldD8g
VGhhbmtzLgo+Cj4gVGhhbmtzLAo+IFl1bmh1aQoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
