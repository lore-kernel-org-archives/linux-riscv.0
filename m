Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11539C7EE43
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VA1XXC9cpi9VM5+E+AKH9J0wgwDZKs8FeJe36+zlGrQ=; b=y0Xk7JbDXKkGID
	GXSUT8dN57jnMtknp3YWHk+NWMS3qFcvVXKC4EzeWLLQIDXw1OFrw9mfkIqTmKk7x0DX87xeWELbU
	JbWVNFsvcmfib9cTgLCLw5YoyliNPMrWO3z5YSVHEAJKfQ+rEA68Urd989ogAYVATU+ZkaReWG9hl
	ut/+daLiksixOZpJNRXiwXBB7e+jWoNIAu7n20b9Fc/52LtGGcHhKvIatI6wkLXQhgEJR4yuPEAAP
	hqoIQGkdt+J7hF1U3zu5PXMsYLidSst6JahaXQlWoVjXuXZo5f/BKRRRhRSpShhqSuOMTMTFfLJJc
	7oGBaHpNTf/lL5Xy5OUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fWS-003VSB-0E;
	Tue, 06 Jun 2023 22:51:28 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fWP-003VPT-19
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 22:51:26 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f62cf9755eso3102412e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 15:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1686091882; x=1688683882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al2xYZY6FuJQFCBLak3ruv1N1e9teyj7OXYSWGcgwcw=;
        b=IlZg3LPKMvnqdPS95MLiEtwIA9fkPdZLI+EHS9NT4CcYqHVUSrUQWKd6aQJe4yGWUl
         HjpSLRG9/plGyS7+pYr94ES4c0SGqs/U3FSrsZ7Nr3c3NIgi7Cp9yGNnUgO/wI3pUUoL
         hC7zQMJDcv5xuTdb2ajzR5ziWjC5YqaJw7rTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686091882; x=1688683882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Al2xYZY6FuJQFCBLak3ruv1N1e9teyj7OXYSWGcgwcw=;
        b=NEp9vXDYUpYdCnkas8LxY6fVmxe7VDGqlJRAL5EdWIXJZFzak6k/LuuKOFI2qVZeOA
         tR6pdUj7km82CigHCHrDFEzMYP71ApD+I13SY/WThnG5UIJzhJfdEdwR+dNLmzkhBDWj
         PhfQDVs+CMAsR6OCdPT4KGtFkUPsaZZ7X6mBVFN+QFb8EjYgOEicEYMvRF3VceeGi8Hw
         7lVu2EUotwO6djv+P3AWy0V0ziYzD0BwWE5QSIer51/Dns05Ng1EfmbPxezIxcq/Hvok
         aomvq/Vq6GYdwGTAk4bgLtC9On65XBawdOY0uIDOxSxy0yKPr1Mq5hMqwq4FE3xZMngo
         IgUA==
X-Gm-Message-State: AC+VfDwbgXY4IsjLlxTlQ9JQEc3yHyL2CEWLcyWTpFiu0JR1xaRVdz84
	XfOLsGYXDnZyUnqHr6s/RNfspQW3xd+WBplYJKYs
X-Google-Smtp-Source: ACHHUZ7muC261tDsIzo2VNiUIe7XqgqfmkAeGrI6jWPs9hugC3KM1trP+B7MVyMAtiPvnUMgrQTLz5pj82HRU4BjHWE=
X-Received: by 2002:a2e:a0cd:0:b0:2b1:e648:f355 with SMTP id
 f13-20020a2ea0cd000000b002b1e648f355mr1975523ljm.3.1686091881950; Tue, 06 Jun
 2023 15:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230517105135.1871868-1-apatel@ventanamicro.com> <20230517105135.1871868-3-apatel@ventanamicro.com>
In-Reply-To: <20230517105135.1871868-3-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 6 Jun 2023 15:51:10 -0700
Message-ID: <CAOnJCU+OS+6izzM0SEBjnzSEs=HNYkbX556vTw95gwB+SvHx_A@mail.gmail.com>
Subject: Re: [PATCH 02/10] RISC-V: KVM: Add IMSIC related defines
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_155125_403141_4F86BDDA 
X-CRM114-Status: GOOD (  19.01  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMzo1MeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdlIGFkZCBJTVNJQyByZWxhdGVkIGRlZmluZXMgaW4g
YSBzZXBhcmF0ZSBoZWFkZXIgc28gdGhhdCBkaWZmZXJlbnQKPiBwYXJ0cyBvZiBLVk0gY29kZSBj
YW4gc2hhcmUgaXQuIE9uY2UgQUlBIGRyaXZlcnMgYXJlIG1lcmdlZCB3aWxsCj4gaGF2ZSBhIGNv
bW1vbiBJTVNJQyBoZWFkZXIgc2hhcmVkIGJ5IGJvdGggS1ZNIGFuZCBJUlFDSElQIGRyaXZlci4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWFfaW1zaWMuaCB8IDM4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAg
ICAgICAgIHwgIDMgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1fYWlhX2ltc2ljLmgKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV9haWFfaW1zaWMuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYV9pbXNpYy5oCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmRhNTg4MWQyYmRlMAo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWFfaW1z
aWMuaAo+IEBAIC0wLDAgKzEsMzggQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seSAqLwo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgV2VzdGVybiBEaWdp
dGFsIENvcnBvcmF0aW9uIG9yIGl0cyBhZmZpbGlhdGVzLgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIw
MjIgVmVudGFuYSBNaWNybyBTeXN0ZW1zIEluYy4KPiArICovCj4gKyNpZm5kZWYgX19LVk1fUklT
Q1ZfQUlBX0lNU0lDX0gKPiArI2RlZmluZSBfX0tWTV9SSVNDVl9BSUFfSU1TSUNfSAo+ICsKPiAr
I2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gKyNpbmNsdWRlIDxhc20vY3NyLmg+Cj4gKwo+ICsj
ZGVmaW5lIElNU0lDX01NSU9fUEFHRV9TSElGVCAgICAgICAgICAxMgo+ICsjZGVmaW5lIElNU0lD
X01NSU9fUEFHRV9TWiAgICAgICAgICAgICAoMVVMIDw8IElNU0lDX01NSU9fUEFHRV9TSElGVCkK
PiArI2RlZmluZSBJTVNJQ19NTUlPX1BBR0VfTEUgICAgICAgICAgICAgMHgwMAo+ICsjZGVmaW5l
IElNU0lDX01NSU9fUEFHRV9CRSAgICAgICAgICAgICAweDA0Cj4gKwo+ICsjZGVmaW5lIElNU0lD
X01JTl9JRCAgICAgICAgICAgICAgICAgICA2Mwo+ICsjZGVmaW5lIElNU0lDX01BWF9JRCAgICAg
ICAgICAgICAgICAgICAyMDQ4Cj4gKwo+ICsjZGVmaW5lIElNU0lDX0VJREVMSVZFUlkgICAgICAg
ICAgICAgICAweDcwCj4gKwo+ICsjZGVmaW5lIElNU0lDX0VJVEhSRVNIT0xEICAgICAgICAgICAg
ICAweDcyCj4gKwo+ICsjZGVmaW5lIElNU0lDX0VJUDAgICAgICAgICAgICAgICAgICAgICAweDgw
Cj4gKyNkZWZpbmUgSU1TSUNfRUlQNjMgICAgICAgICAgICAgICAgICAgIDB4YmYKPiArI2RlZmlu
ZSBJTVNJQ19FSVB4X0JJVFMgICAgICAgICAgICAgICAgICAgICAgICAzMgo+ICsKPiArI2RlZmlu
ZSBJTVNJQ19FSUUwICAgICAgICAgICAgICAgICAgICAgMHhjMAo+ICsjZGVmaW5lIElNU0lDX0VJ
RTYzICAgICAgICAgICAgICAgICAgICAweGZmCj4gKyNkZWZpbmUgSU1TSUNfRUlFeF9CSVRTICAg
ICAgICAgICAgICAgICAgICAgICAgMzIKPiArCj4gKyNkZWZpbmUgSU1TSUNfRklSU1QgICAgICAg
ICAgICAgICAgICAgIElNU0lDX0VJREVMSVZFUlkKPiArI2RlZmluZSBJTVNJQ19MQVNUICAgICAg
ICAgICAgICAgICAgICAgSU1TSUNfRUlFNjMKPiArCj4gKyNkZWZpbmUgSU1TSUNfTU1JT19TRVRJ
UE5VTV9MRSAgICAgICAgIDB4MDAKPiArI2RlZmluZSBJTVNJQ19NTUlPX1NFVElQTlVNX0JFICAg
ICAgICAgMHgwNAo+ICsKPiArI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2Fp
YS5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBpbmRleCAxY2VlNzVhOGM4ODMuLmM3OGMwNmQ5
OWUzOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva3ZtL2FpYS5jCj4gQEAgLTE1LDYgKzE1LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3BlcmNw
dS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KPiAgI2luY2x1ZGUgPGFzbS9od2Nh
cC5oPgo+ICsjaW5jbHVkZSA8YXNtL2t2bV9haWFfaW1zaWMuaD4KPgo+ICBzdHJ1Y3QgYWlhX2hn
ZWlfY29udHJvbCB7Cj4gICAgICAgICByYXdfc3BpbmxvY2tfdCBsb2NrOwo+IEBAIC0zNjQsOCAr
MzY1LDYgQEAgc3RhdGljIGludCBhaWFfcm13X2lwcmlvKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
dW5zaWduZWQgaW50IGlzZWwsCj4gICAgICAgICByZXR1cm4gS1ZNX0lOU05fQ09OVElOVUVfTkVY
VF9TRVBDOwo+ICB9Cj4KPiAtI2RlZmluZSBJTVNJQ19GSVJTVCAgICAweDcwCj4gLSNkZWZpbmUg
SU1TSUNfTEFTVCAgICAgMHhmZgo+ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX3Jtd19pcmVnKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgaW50IGNzcl9udW0sCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICp2YWwsIHVuc2lnbmVkIGxvbmcgbmV3
X3ZhbCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgd3Jf
bWFzaykKPiAtLQo+IDIuMzQuMQo+CgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBA
cml2b3NpbmMuY29tPgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
