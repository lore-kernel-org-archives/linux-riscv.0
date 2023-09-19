Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4180FCE79A8
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 18:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzQWhs4iO9A18gm3HMTlXvFxgTOtVfvDu1caYqu7xio=; b=tkhDShaCp0o76r
	lLrq6d8vhENQuIpkktZWpMYtLvzXJUgCR+6KgTdP6CV7f+CX1IoqWkdI6Zp6uh++JNGzQxjZ2ATwX
	R4DMQR02A6+9QxfRL+hjQlYxUyGhcCFFnqwtvu2ageC7gD+l2Jqc7RgaB4xn928olkcskHiWv49bz
	KHUZHRfsWHtDaI86fCtbTpgJLMACDXHPS8en37hM48rqze+w5vmkTLFrdPi/tJh8J3jZL3a3d5WYB
	ewrCb8w5pKnNZgEszbQdrUi2LGaw1qSeuxDyYznxWTrdHKo89JvHYSHL4togAvb3uiU07WeIBk57R
	LUofRqLSVcnlYwTGuWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qifv2-0016zX-2o;
	Tue, 19 Sep 2023 18:57:56 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qifuz-0016ye-2x
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 18:57:55 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50098cc8967so9802957e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1695149871; x=1695754671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhVTmCY18AAwuZtx0mwKmmrwAcWS17iU82Rcu9KB1Uo=;
        b=baHX9SlfXDMS0o8zoMANqaRArHIqR97CMFWzmKNGLdzFWwNp2AVyYFxVUJpvCK3C7q
         wBRJzRSP3XYZdTLTSDAdL5FSPKtd+/EUyv7KnZH8YvvqztaOabLgViTLJhuAETprjKUT
         1Rnw36Fe6BCm806Rgoj7hCFyeJAIYIccSQfCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149871; x=1695754671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhVTmCY18AAwuZtx0mwKmmrwAcWS17iU82Rcu9KB1Uo=;
        b=orgA2XWKKmd8Ifp9ukyM7cOpTW6vm6/JimzG+jho0/zgUACi1sPLYyp4faM1l+sCNp
         XZ27OE68s5NSg4ZkcwrSEhjA87Xe4ZtkVNXb2CIzjAxUKrQPSuS39xxS3VQRdACOHhUp
         BBBSi982bXVbyNgr9u6jrzhNFvyr6pevnhCOfVuza63KcWCc1wdY0DVKwynf1dNapmAK
         nMlbpMJtfPqz9wiFAH45nbh4GtHzJjH5PoR/+0zFD2NH6NqCcKdoNVP2JpiA+mL92qlF
         fXL92PfUThuu0Dh+4cGwRBEgbbxYsdOZUb1WJKTsyJMhs9enJyMTwG7FOrA045e5dQRs
         Yyow==
X-Gm-Message-State: AOJu0YygyB0zToWLyph14CgtxUBQD+7lPXUpXQJqRxqaBdbWrwpJQgG2
	pXEJLiRTMAJw+qfzCMdr/yrCv4SQU+7k3Q9NDKm1
X-Google-Smtp-Source: AGHT+IGzgFUkeaLucDDy+VjfOLYnjbzLxksr6Bjjy8m/XEtgrZyisbaxP5h6+A9hOORSOeSpaVrcf+At/pha0PYjcCA=
X-Received: by 2002:ac2:5b1c:0:b0:503:314f:affe with SMTP id
 v28-20020ac25b1c000000b00503314faffemr498289lfn.17.1695149870227; Tue, 19 Sep
 2023 11:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230918180646.1398384-1-apatel@ventanamicro.com> <20230918180646.1398384-2-apatel@ventanamicro.com>
In-Reply-To: <20230918180646.1398384-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Sep 2023 11:57:38 -0700
Message-ID: <CAOnJCULNPvZzWH5bAFW+zKL_kM15Du+qV50atfqUsB1pzp0dmA@mail.gmail.com>
Subject: Re: [PATCH 1/4] RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT registers
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_115754_224954_C63AD8A2 
X-CRM114-Status: GOOD (  17.32  )
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

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTE6MDfigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBUaGUgSVNBX0VYVCByZWdpc3RlcnMgdG8gZW5hYmxl
ZC9kaXNhYmxlIElTQSBleHRlbnNpb25zIGZvciBWQ1BVCj4gYXJlIGFsd2F5cyBhdmFpbGFibGUg
d2hlbiB1bmRlcmx5aW5nIGhvc3QgaGFzIHRoZSBjb3JyZXNwb25kaW5nCj4gSVNBIGV4dGVuc2lv
bi4gVGhlIGNvcHlfaXNhX2V4dF9yZWdfaW5kaWNlcygpIGNhbGxlZCBieSB0aGUKPiBLVk1fR0VU
X1JFR19MSVNUIEFQSSBkb2VzIG5vdCBhbGlnbiB3aXRoIHRoaXMgZXhwZWN0YXRpb24gc28KPiBs
ZXQncyBmaXggaXQuCj4KPiBGaXhlczogMDMxZjllZmFmYzA4ICgiS1ZNOiByaXNjdjogQWRkIEtW
TV9HRVRfUkVHX0xJU1QgQVBJIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwg
PGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IGluZGV4IDFiN2U5ZmEyNjVjYi4uZTdlODMzY2Vk
OTFiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiArKysgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gQEAgLTg0Miw3ICs4NDIsNyBAQCBzdGF0aWMg
aW50IGNvcHlfaXNhX2V4dF9yZWdfaW5kaWNlcyhjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
Cj4gICAgICAgICAgICAgICAgIHU2NCByZWcgPSBLVk1fUkVHX1JJU0NWIHwgc2l6ZSB8IEtWTV9S
RUdfUklTQ1ZfSVNBX0VYVCB8IGk7Cj4KPiAgICAgICAgICAgICAgICAgaXNhX2V4dCA9IGt2bV9p
c2FfZXh0X2FycltpXTsKPiAtICAgICAgICAgICAgICAgaWYgKCFfX3Jpc2N2X2lzYV9leHRlbnNp
b25fYXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBpc2FfZXh0KSkKPiArICAgICAgICAgICAgICAg
aWYgKCFfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIGlzYV9leHQpKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Cj4gICAgICAgICAgICAgICAgIGlmICh1
aW5kaWNlcykgewo+IC0tCj4gMi4zNC4xCj4KCgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0
aXNocEByaXZvc2luYy5jb20+Ci0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
