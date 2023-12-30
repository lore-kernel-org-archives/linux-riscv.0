Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18427C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLinMiY8vyKIVIkAf56FVhBEbwQuAIb9K6OSGmM1Oyw=; b=V5u/pkoCeY2N8X
	Y6DlE2MuZmvhrDfq05qbUvjgmODS7525pMi0Dx2u7M9sF0/cB4IlY62UY+8Bdl2kgdVF3pnk2qGAp
	mf95ks+eTcTVFrk6KfGMlcVhazQjUbvirFSTV02IC4QbHyVMIQM5swFMHd+uxdaEw2HGhEciSja7C
	qNzbjvYKOE8S641JbT7XjVu70HGh7A/L2BcW+e4bhd0mL4d5YbN/PKZWAD0GVSUFSLkJptP+Cqcto
	a82t0xkOu5u3BCY9j8AmL244QL0cNwfEqGayAtFWTNw1p+EiLC0Cte98YSUqCdKT9bXSzwbubpHgr
	EWI2uE9Eg5VVW9LqgC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJUI2-002NNG-1n;
	Sat, 30 Dec 2023 08:01:50 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJUHz-002NLz-2u
	for linux-riscv@lists.infradead.org;
	Sat, 30 Dec 2023 08:01:49 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7b7d55d7717so352468139f.2
        for <linux-riscv@lists.infradead.org>; Sat, 30 Dec 2023 00:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1703923306; x=1704528106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPf6Z8tNoGfk9MBYZ1RUJvDaaG9qPZRvtU/U6N7KNnE=;
        b=YV5pbylOStbWr0WCGOiNHXdQHFedU7u6vJND6fvDqaCzZPAKl2WYb9GPjYaTDrqQY4
         Whp0ii5CE1uVpMcaZ/2blcCnHiAT8HWWdl0R2OIi3tc2O5Y8J59CrUNIjAf6qAlQWsqH
         Fxq4/888y6PHQI++d/bE5ateOHCuc7r0de8kJ1NS1GZdiHLT4ET08xrFzwYqCgP69GlZ
         AyXP/S9QGL9Vd8Kqrub1xVNslbmMQnw/OVqLmmJEBMQh/Znru5AQMd3HdMmDqTG3FWi9
         p9TjwA3GJ2wk0YE0MMxYJjzvCU6YlFwewWGbL8cMBCUhoEs2qxccZEurQ81p4ZRgJc1/
         xgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703923306; x=1704528106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPf6Z8tNoGfk9MBYZ1RUJvDaaG9qPZRvtU/U6N7KNnE=;
        b=p6Lz1YN8JBrxZZL2j9Fz6RbJoxKHj42LlsiiCEOHs2T7gzngswr2tuRU1f760sgX3L
         lkneUF5y0OnglQAhQxY+zHpVIDpCE93a7mKe3+qtJqS+F1BPQ3T7LB+fI/LF6I5+x8Kk
         2l4t0f1WN8CsrLUS4VA+EBPHmNtI2e+zeuXdG48d8vX+Ot9NU6piB8EPwRL8RYQXMJJC
         6+mlLetUL2XHIoaVKXusmlL3fx2Q8ug5XnpR6ZGxLTo9pKs30PtUBMY/s8g+pzvUHoio
         vUfl/TUu5ziMvkjwQzi57grkCarNw/qfNjXWO5t7xo3R+391m15hWZpMbQM64iS9a2dO
         KQ0A==
X-Gm-Message-State: AOJu0Yzhv9qgKNoLFZ+SZUrM8k1I/maF3OPC50hDepVZ57V96nYYTTXJ
	goHUv+Tdna9/hbWVxVMnXnAsTLfF57fl8aNaWaH9a8HsObdD7Q==
X-Google-Smtp-Source: AGHT+IG8kNEDveFHvGFklktInOSrh1sA+fL4mwRG4OISbyge3JZk+7FM4QwNXRHrKqUNcK01OLVK5yRqEEzfirj8O3E=
X-Received: by 2002:a92:c549:0:b0:35f:ee15:742c with SMTP id
 a9-20020a92c549000000b0035fee15742cmr11876530ilj.7.1703923306083; Sat, 30 Dec
 2023 00:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20231229214950.4061381-1-atishp@rivosinc.com> <20231229214950.4061381-8-atishp@rivosinc.com>
In-Reply-To: <20231229214950.4061381-8-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Dec 2023 13:31:36 +0530
Message-ID: <CAAhSdy1cb_bEuE+pHusEoumhteu=Y87+WXpE=Eox1k2ng4pdZg@mail.gmail.com>
Subject: Re: [v2 07/10] RISC-V: KVM: No need to exit to the user space if perf
 event failed
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231230_000147_940439_A1D94E72 
X-CRM114-Status: GOOD (  21.47  )
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

T24gU2F0LCBEZWMgMzAsIDIwMjMgYXQgMzoyMOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgd2UgcmV0dXJuIGEgbGludXggZXJyb3Ig
Y29kZSBpZiBjcmVhdGluZyBhIHBlcmYgZXZlbnQgZmFpbGVkCj4gaW4ga3ZtLiBUaGF0IHNob3Vs
ZG4ndCBiZSBuZWNlc3NhcnkgYXMgZ3Vlc3QgY2FuIGNvbnRpbnVlIHRvIG9wZXJhdGUKPiB3aXRo
b3V0IHBlcmYgcHJvZmlsaW5nIG9yIHByb2ZpbGluZyB3aXRoIGZpcm13YXJlIGNvdW50ZXJzLgo+
Cj4gUmV0dXJuIGFwcHJvcHJpYXRlIFNCSSBlcnJvciBjb2RlIHRvIGluZGljYXRlIHRoYXQgUE1V
IGNvbmZpZ3VyYXRpb24KPiBmYWlsZWQuIEFuIGVycm9yIG1lc3NhZ2UgaW4ga3ZtIGFscmVhZHkg
ZGVzY3JpYmVzIHRoZSByZWFzb24gZm9yIGZhaWx1cmUuCj4KPiBGaXhlczogMGNiNzRiNjVkMmU1
ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBwZXJmIHN1cHBvcnQgd2l0aG91dCBzYW1wbGluZyIp
Cj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgpMR1RN
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRz
LApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jICAgICB8IDE0ICsrKysr
KysrKy0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5jIHwgIDYgKysrLS0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNw
dV9wbXUuYwo+IGluZGV4IDhjNDRmMjZlNzU0ZC4uMDhmNTYxOTk4NjExIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Bt
dS5jCj4gQEAgLTIyOSw4ICsyMjksOSBAQCBzdGF0aWMgaW50IGt2bV9wbXVfdmFsaWRhdGVfY291
bnRlcl9tYXNrKHN0cnVjdCBrdm1fcG11ICprdnBtdSwgdW5zaWduZWQgbG9uZyBjdAo+ICAgICAg
ICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC1zdGF0aWMgaW50IGt2bV9wbXVfY3JlYXRlX3BlcmZfZXZl
bnQoc3RydWN0IGt2bV9wbWMgKnBtYywgc3RydWN0IHBlcmZfZXZlbnRfYXR0ciAqYXR0ciwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFncywg
dW5zaWduZWQgbG9uZyBlaWR4LCB1bnNpZ25lZCBsb25nIGV2dGRhdGEpCj4gK3N0YXRpYyBsb25n
IGt2bV9wbXVfY3JlYXRlX3BlcmZfZXZlbnQoc3RydWN0IGt2bV9wbWMgKnBtYywgc3RydWN0IHBl
cmZfZXZlbnRfYXR0ciAqYXR0ciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIHVuc2lnbmVkIGxvbmcgZWlkeCwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZXZ0ZGF0YSkKPiAgewo+
ICAgICAgICAgc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50Owo+Cj4gQEAgLTQ1NSw3ICs0NTYsOCBA
QCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9jZmdfbWF0Y2goc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9iYQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGVpZHgsIHU2NCBldnRkYXRhLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX3JldHVybiAqcmV0ZGF0
YSkKPiAgewo+IC0gICAgICAgaW50IGN0cl9pZHgsIHJldCwgc2JpcmV0ID0gMDsKPiArICAgICAg
IGludCBjdHJfaWR4LCBzYmlyZXQgPSAwOwo+ICsgICAgICAgbG9uZyByZXQ7Cj4gICAgICAgICBi
b29sIGlzX2ZldmVudDsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZXZlbnRfY29kZTsKPiAgICAg
ICAgIHUzMiBldHlwZSA9IGt2bV9wbXVfZ2V0X3BlcmZfZXZlbnRfdHlwZShlaWR4KTsKPiBAQCAt
NTE0LDggKzUxNiwxMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9jZmdfbWF0Y2goc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9iYQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGt2cG11LT5md19ldmVudFtldmVudF9jb2RlXS5zdGFydGVkID0gdHJ1ZTsKPiAg
ICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgIHJldCA9IGt2bV9wbXVfY3JlYXRlX3Bl
cmZfZXZlbnQocG1jLCAmYXR0ciwgZmxhZ3MsIGVpZHgsIGV2dGRhdGEpOwo+IC0gICAgICAgICAg
ICAgICBpZiAocmV0KQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAg
ICAgICAgICAgICAgIGlmIChyZXQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlyZXQg
PSBTQklfRVJSX05PVF9TVVBQT1JURUQ7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+ICAgICAgICAgc2V0X2JpdChj
dHJfaWR4LCBrdnBtdS0+cG1jX2luX3VzZSk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfc2JpX3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmMKPiBpbmRleCA3
ZWNhNzJkZjJjYmQuLmI3MDE3OWU5ZTg3NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9wbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5jCj4gQEAg
LTQyLDkgKzQyLDkgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlcihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gICNlbmRpZgo+ICAgICAgICAg
ICAgICAgICAvKgo+ICAgICAgICAgICAgICAgICAgKiBUaGlzIGNhbiBmYWlsIGlmIHBlcmYgY29y
ZSBmcmFtZXdvcmsgZmFpbHMgdG8gY3JlYXRlIGFuIGV2ZW50Lgo+IC0gICAgICAgICAgICAgICAg
KiBGb3J3YXJkIHRoZSBlcnJvciB0byB1c2Vyc3BhY2UgYmVjYXVzZSBpdCdzIGFuIGVycm9yIHdo
aWNoCj4gLSAgICAgICAgICAgICAgICAqIGhhcHBlbmVkIHdpdGhpbiB0aGUgaG9zdCBrZXJuZWwu
IFRoZSBvdGhlciBvcHRpb24gd291bGQgYmUKPiAtICAgICAgICAgICAgICAgICogdG8gY29udmVy
dCB0byBhbiBTQkkgZXJyb3IgYW5kIGZvcndhcmQgdG8gdGhlIGd1ZXN0Lgo+ICsgICAgICAgICAg
ICAgICAgKiBObyBuZWVkIHRvIGZvcndhcmQgdGhlIGVycm9yIHRvIHVzZXJzcGFjZSBhbmQgZXhp
dCB0aGUgZ3Vlc3QKPiArICAgICAgICAgICAgICAgICogb3BlcmF0aW9uIGNhbiBjb250aW51ZSB3
aXRob3V0IHByb2ZpbGluZy4gRm9yd2FyZCB0aGUKPiArICAgICAgICAgICAgICAgICogYXBwcm9w
cmlhdGUgU0JJIGVycm9yIHRvIHRoZSBndWVzdC4KPiAgICAgICAgICAgICAgICAgICovCj4gICAg
ICAgICAgICAgICAgIHJldCA9IGt2bV9yaXNjdl92Y3B1X3BtdV9jdHJfY2ZnX21hdGNoKHZjcHUs
IGNwLT5hMCwgY3AtPmExLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjcC0+YTIsIGNwLT5hMywgdGVtcCwgcmV0ZGF0YSk7Cj4gLS0KPiAy
LjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
