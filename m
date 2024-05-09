Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16739C04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 00:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40UkWTXWjZ4ing7GtVk+lDInO1pExE2KOMJfxDk0bC4=; b=Awyjo03kxMhu3V
	ZcSryLEAyyCvhls3JPfoP+IILj1RgTWu1uC7O5skxESaSQtMe5UleQV8vFle30MeFh0SvdXallv1M
	LtxzAbHjcErtZk5j9HRgX9ddv2s/acrZffQhgfbPSgHEkxNWVlM53mVk2GlDist7LjoRjF9A2HosR
	Oz7AUJANRh80K6CN9z4hIxrTpFLAWicLGztCrO4FBQq4j5hIXhI1Lr8eGLVYdrnXHwl50xl96KXQ9
	0Nio/Qc/umtQ3EXYDicvhCcO/vekFknHmUOZnbaTZ49SsU24f99pjMiCyRnqMdt0CbmimBTAYY2Un
	060Rzjnrpr3rQj9tYj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4rDu-0000000HKza-3VBD;
	Thu, 09 May 2024 00:01:22 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4rDr-0000000HKyf-0gOa
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 00:01:20 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-61804067da0so3185907b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 17:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715212877; x=1715817677; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMhzkytFcegfpjEh/i5eDjwDl8WcfrhpZN4TsMsNhbA=;
        b=KzOd6tGaGL2TMz6ixmHMDaSqMD+WDKD3Zl0TfuEWabFSloVGKgLNcw/K7Ej+0OGL9t
         5OqCQVApnDFOZ65WO4XKrt6E5RaeqLsxaw1Cj+UN+96ezksYbox0hKq0mQ2J4noG3LqB
         yKq9Edh7+l0Jv+ryyr8fyL1a7Tsr7NwPl/fJFsrf4VxPDSWcRm/h17xj6SjXqntmPA4h
         0I1zAqOAgW/O8PioidfEtP33u/vsaXJv9WV0XjpWx9yIn2XbQwnuYd4dxKM7znsp9v5S
         fsU8xs+EIuCSDWlXZ4RM19iSlZsskzqeIWsZRrkdbxARcpSZ3tQSdppXEA8Iv2u3eE34
         8zWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715212877; x=1715817677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMhzkytFcegfpjEh/i5eDjwDl8WcfrhpZN4TsMsNhbA=;
        b=TtPkz6g2yUJ7x+drL+qTDMZyaTVvtyGINiunW9ouK8jEZsm3Ny+uWIECIZYYas1x2W
         VqbjGJ7f2TXGW70E5NhZrKSwfbBVu1fwsvpbi7VovI3PbbdGdLOjXS5QG2S8eGnFGFjV
         2+E4knv5uFVpq10js/kLvgO689t0KMLxHdpMPcOY/1sWXcTpvS9++1QR0ABND82wZfcP
         ad5ptp+fi6MwSQ5V8mCrUrD+lEonzCnSX4kemCH1Ia6bU3OKclHj2GksRUZFdIzlnqzs
         HbIVjGSrNrUf40nQZ3P3TL/vcqIRLuLM5Mk82O5QYxSoUObAR6A29W1z+PigY9biYbvw
         i3BA==
X-Forwarded-Encrypted: i=1; AJvYcCXaQUEaL6MOFFN4l4UklfMVXSsVlR2pgrtzzhdRmMSi7ey+cHbrzeRePZrPHbHCGMqcEAG72fXDdJFim9Sg3hEY7Wo8HAzLrfzYd++nDw/Z
X-Gm-Message-State: AOJu0Yyo9Hw1UNxfRlPSQcWpSfM60WY7IDkSoY+a+KDBWl0EFU7u4Iat
	wt1MOGHxVKsvl64Ug1i7LHO/8X/hYNW1Z9GyXHWdscwT1fs/v5QNb225snXob792h5kr5rbF+Ex
	XZVd61v/uKMC870oQC+uKEPLVByg5SVfpF3QJtA==
X-Google-Smtp-Source: AGHT+IHmVt3D1f9M2NJWrIBfKS+ywa2zQiwLNnWOiwr78hl/9CSscWihllGTFRw/No9gJ2WWzeLcgCWgz+43efCBLuQ=
X-Received: by 2002:a05:690c:6902:b0:61b:df5:7871 with SMTP id
 00721157ae682-62085c7bd51mr46770797b3.16.1715212877458; Wed, 08 May 2024
 17:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240403234054.2020347-1-debug@rivosinc.com> <20240403234054.2020347-6-debug@rivosinc.com>
In-Reply-To: <20240403234054.2020347-6-debug@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 9 May 2024 08:00:00 +0800
Message-ID: <CABgGipX3vXeJ_RKnV17pE-NH6=L0XUF2sdKea7hZHbuq4skh_A@mail.gmail.com>
Subject: Re: [PATCH v3 05/29] riscv: zicfiss / zicfilp enumeration
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com, broonie@kernel.org, 
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org, 
	ajones@ventanamicro.com, conor.dooley@microchip.com, cleger@rivosinc.com, 
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, corbet@lwn.net, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com, akpm@linux-foundation.org, 
	arnd@arndb.de, ebiederm@xmission.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	lstoakes@gmail.com, shuah@kernel.org, brauner@kernel.org, 
	jerry.shih@sifive.com, hankuan.chen@sifive.com, greentime.hu@sifive.com, 
	evan@rivosinc.com, xiao.w.wang@intel.com, charlie@rivosinc.com, 
	apatel@ventanamicro.com, mchitale@ventanamicro.com, dbarboza@ventanamicro.com, 
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org, 
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com, 
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de, bhe@redhat.com, 
	jeeheng.sia@starfivetech.com, cyy@cyyself.name, maskray@google.com, 
	ancientmodern4@gmail.com, mathis.salmen@matsal.de, cuiyunhui@bytedance.com, 
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, 
	david@redhat.com, catalin.marinas@arm.com, revest@chromium.org, 
	josh@joshtriplett.org, shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, 
	ojeda@kernel.org, jhubbard@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_170119_492254_F5AF500A 
X-CRM114-Status: GOOD (  19.10  )
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

SGkgRGVlcGFrLAoKT24gVGh1LCBBcHIgNCwgMjAyNCBhdCA3OjQx4oCvQU0gRGVlcGFrIEd1cHRh
IDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQg
Zm9yIGRldGVjdGluZyB6aWNmaXNzIGFuZCB6aWNmaWxwLiB6aWNmaXNzIGFuZAo+IHppY2ZpbHAg
c3RhbmRzIGZvciB1bnByaXZsZWdlZCBpbnRlZ2VyIHNwZWMgZXh0ZW5zaW9uIGZvciBzaGFkb3cg
c3RhY2sKPiBhbmQgYnJhbmNoIHRyYWNraW5nIG9uIGluZGlyZWN0IGJyYW5jaGVzLCByZXNwZWN0
aXZlbHkuCj4KPiBUaGlzIHBhdGNoIGxvb2tzIGZvciB6aWNmaXNzIGFuZCB6aWNmaWxwIGluIGRl
dmljZSB0cmVlIGFuZCBhY2NvcmRpbmxneQo+IGxpZ2h0cyB1cCBiaXQgaW4gY3B1IGZlYXR1cmUg
Yml0bWFwLiBGdXJ0aGVybW9yZSB0aGlzIHBhdGNoIGFkZHMgZGV0ZWN0aW9uCj4gdXRpbGl0eSBm
dW5jdGlvbnMgdG8gcmV0dXJuIHdoZXRoZXIgc2hhZG93IHN0YWNrIG9yIGxhbmRpbmcgcGFkcyBh
cmUKPiBzdXBwb3J0ZWQgYnkgY3B1Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxk
ZWJ1Z0ByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVh
dHVyZS5oIHwgMTMgKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmggICAgICB8ICAyICsrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggIHwg
IDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICB8ICAyICsrCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVm
ZWF0dXJlLmgKPiBpbmRleCAwYmQxMTg2MmI3NjAuLmYwZmI4ZDhhZTI3MyAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gQEAgLTgsNiArOCw3IEBACj4KPiAgI2luY2x1ZGUg
PGxpbnV4L2JpdG1hcC5oPgo+ICAjaW5jbHVkZSA8bGludXgvanVtcF9sYWJlbC5oPgo+ICsjaW5j
bHVkZSA8bGludXgvc21wLmg+Cj4gICNpbmNsdWRlIDxhc20vaHdjYXAuaD4KPiAgI2luY2x1ZGUg
PGFzbS9hbHRlcm5hdGl2ZS1tYWNyb3MuaD4KPiAgI2luY2x1ZGUgPGFzbS9lcnJuby5oPgo+IEBA
IC0xMzcsNCArMTM4LDE2IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl9jcHVf
aGFzX2V4dGVuc2lvbl91bmxpa2VseShpbnQgY3B1LCBjb25zdCB1bnNpCj4KPiAgREVDTEFSRV9T
VEFUSUNfS0VZX0ZBTFNFKGZhc3RfbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfa2V5KTsKPgo+ICtz
dGF0aWMgaW5saW5lIGJvb2wgY3B1X3N1cHBvcnRzX3NoYWRvd19zdGFjayh2b2lkKQo+ICt7Cj4g
KyAgICAgICByZXR1cm4gKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX1VTRVJfQ0ZJKSAmJgo+ICsg
ICAgICAgICAgICAgICAgICAgcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoc21wX3By
b2Nlc3Nvcl9pZCgpLCBSSVNDVl9JU0FfRVhUX1pJQ0ZJU1MpKTsKPiArfQo+ICsKPiArc3RhdGlj
IGlubGluZSBib29sIGNwdV9zdXBwb3J0c19pbmRpcmVjdF9icl9scF9pbnN0cih2b2lkKQo+ICt7
Cj4gKyAgICAgICByZXR1cm4gKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX1VTRVJfQ0ZJKSAmJgo+
ICsgICAgICAgICAgICAgICAgICAgcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoc21w
X3Byb2Nlc3Nvcl9pZCgpLCBSSVNDVl9JU0FfRVhUX1pJQ0ZJTFApKTsKPiArfQo+ICsKPiAgI2Vu
ZGlmCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+IGluZGV4IDFmMmQyNTk5YzY1NS4uNzRiNmM3Mjdm
NTQ1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+IEBAIC04MCw2ICs4MCw4IEBACj4gICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkEgICAgICAgICAgICAgIDcxCj4gICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aVFNPICAgICAgICAgICAgIDcyCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQUNB
UyAgICAgICAgICAgIDczCm5pdDogdHdvIHRhYnMgZm9yIGFsaWdubWVudAoKCj4gKyNkZWZpbmUg
UklTQ1ZfSVNBX0VYVF9aSUNGSUxQICA3NAo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklDRklT
UyAgNzUKPgo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHICAgICAxMjcKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+IGluZGV4IGE4NTA5Y2MzMWFiMi4uNmM1YjNk
OTI4YjEyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gQEAgLTEzLDYgKzEz
LDcgQEAKPiAgI2luY2x1ZGUgPHZkc28vcHJvY2Vzc29yLmg+Cj4KPiAgI2luY2x1ZGUgPGFzbS9w
dHJhY2UuaD4KPiArI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+Cj4gICNpZmRlZiBDT05GSUdfNjRC
SVQKPiAgI2RlZmluZSBERUZBVUxUX01BUF9XSU5ET1cgICAgIChVTCgxKSA8PCAoTU1BUF9WQV9C
SVRTIC0gMSkpCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IGluZGV4IDc5YTVhMzVmYWI5Ni4uZDA1
MmNhZDViODJmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IEBAIC0yNjMsNiArMjYzLDgg
QEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4g
ICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShoLCBSSVNDVl9JU0FfRVhUX2gpLAo+ICAgICAg
ICAgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHppY2JvbSwgUklTQ1ZfSVNBX0VYVF9aSUNCT00s
IHJpc2N2X3hsaW51eGVudmNmZ19leHRzKSwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBF
UlNFVCh6aWNib3osIFJJU0NWX0lTQV9FWFRfWklDQk9aLCByaXNjdl94bGludXhlbnZjZmdfZXh0
cyksCj4gKyAgICAgICBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoemljZmlscCwgUklTQ1ZfSVNB
X0VYVF9aSUNGSUxQLCByaXNjdl94bGludXhlbnZjZmdfZXh0cyksCj4gKyAgICAgICBfX1JJU0NW
X0lTQV9FWFRfU1VQRVJTRVQoemljZmlzcywgUklTQ1ZfSVNBX0VYVF9aSUNGSVNTLCByaXNjdl94
bGludXhlbnZjZmdfZXh0cyksCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNudHIs
IFJJU0NWX0lTQV9FWFRfWklDTlRSKSwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpp
Y29uZCwgUklTQ1ZfSVNBX0VYVF9aSUNPTkQpLAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RB
VEEoemljc3IsIFJJU0NWX0lTQV9FWFRfWklDU1IpLAo+IC0tCj4gMi40My4yCj4KClRoYW5rcywK
QW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
