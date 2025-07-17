Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92C3C83F34
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yz7bCnQLyXqtej/m64SofbdVr4VDTEQERFjJYwmRhfU=; b=3dYedi+nrjdaec
	EBIz6dQxbBwDFTfyszwrTxY+mcfAtOQ/JyW3bbnZ7yMCmezcwwJ3tT08zguxBapJv8V0EjxYApdQb
	n2HKKPOPQNe1IbGAKcka17gczKcHm7yv//mz09qqt4+Sg8T5DQBRPNjG29O20RlcGbRrgznJXJNna
	Je7x20s2rc4RsOSAvOQKiP37Z+eU/ym6IAxF0on3yHOtwtoD7GCrZ7ZhxaJSp6E4BkaFEIyc3lqch
	6pLVxT2FMTR1q+bPlEOd7WWXECuKwaskNIxw3oxN5R0QnYfluDoxENJaPQkrOiufO7ejZGuBd+jaK
	M98FJBnc0S+kvI00ITeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRO5-0000000AdEz-3jeQ;
	Thu, 17 Jul 2025 16:23:13 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR6I-0000000AZwJ-0tmj
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 16:04:53 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3e058c64a76so4335715ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752768289; x=1753373089; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF4ZzdU4KPm05DxQhuE3nJR3OBuoI7+D+aCP85HQkvI=;
        b=YTHRvd+/Ubt7pJnutr266FMgRsrOUY0GqG9RvFoGhbuTNH6FpeBFtjDjgmqIXvnTcH
         1fcASD/QE5Bs4k3an31Q3yDC0aYUlr6pxLXv3jyHJSV2xyGn8oofeFe4SNSiLiK0pHMr
         zQh/KVvq2NhLHSJK8t0QzjpNAha3Kw+RTo6vha9yOBoY+fCB5FYiiv8ye6OOMld+o2aR
         GGTmYDRSL5tZx818w8Md4zNVU+9p+F0BDoKc7dbRA2K5kD33ih79+STnjKGV/OKrUt+y
         tUsytYmoXGTx9OwABnh0GzPlzfVC67jLpBJJa7TySbdZRfhL92WP2eBD1tHvfCccoaDt
         v8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752768289; x=1753373089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mF4ZzdU4KPm05DxQhuE3nJR3OBuoI7+D+aCP85HQkvI=;
        b=sUvC987iv4QdkwlWGHF3ldyVEVTdEPraUUbZi4jErm+MEF8j7BM537iDhF0eiPHQPK
         zXFbHvXHc8HDXnNcD1sSrsCpK5Gl7ywSWIPIyx/ot+/LPApmABe+i1oaS18L9RHlMmbU
         Fy9oiH1NQdg0KuTegn43wtYjxT6gJ3cLFfnMVSbPdvr2omxAv2Futrz8oaOcCiPJCO4l
         QIBf6AqblhQgKIy7lfnM9t0JlDUoWskf8qNwchLdKcuRVCDUFjFkqQBLeWfcRUoMXX+s
         q9MXEALfc+V7RUly/cur0W+iruOFRJB7vnbPl2v2E2GdFUgI6qxuAQRjc1ZM4LBaGJXv
         e4yA==
X-Forwarded-Encrypted: i=1; AJvYcCVKr4T1Q+FOG88xCPKnHtBltsWhzhl8mh2MuWQnECzNUBjWdYF+5igqyPP6WwRH+ls7NnDrZ1qhdzxweQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7xW9ed3+Zv5InKlBJiJufzj5lPh8pPFs3RkisgHPZYExjbFct
	7CbESjUtMjynTGea7An9R8mJhWX9RmkGdmHlkmXv1R9FIyDTY+yMLljTm9brMErOyCJuKfpEXhH
	LZmfp2mN+85sk+aiF2vVgQtv6+ueRU51c6ICFwcR7gAg4m8hcMqNj88M=
X-Gm-Gg: ASbGnctTJf8yRXejsTFBN5yST5UXQJjr157rMVc/3YRAiVtl0Y+A3PF40qMmUgfMyXX
	xprIo3adGBINtvDd8b5tCq4z3+H8KylPdLVfwZo7Ml8wX5DO+BM0j5iyWWpoVLeJWMB3uIIHPkZ
	/n7jIx/6qIwZuz4JXoVn+acLEjKdxv3gB5uCbA1TBUMDAg7sLH0unEEcUI9U0mctCicDDs2t6hS
	KtzgPH5M/zDSCOpm1U=
X-Google-Smtp-Source: AGHT+IFAG3wYGrY4xyVVSnggyKQ8Fmk+ZxX7eQXMdYOvL6ZpVVrOgjCMEp0iGPnFH5D2j6kt83DD42IjPEeujKO5F/Q=
X-Received: by 2002:a05:6e02:3e07:b0:3df:3598:7688 with SMTP id
 e9e14a558f8ab-3e28307abacmr89850255ab.21.1752768287054; Thu, 17 Jul 2025
 09:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 21:34:36 +0530
X-Gm-Features: Ac12FXxSVTcSMonhmD8rqZBxMoPIHtsKSpNyakGFXvSyptDFl2Kq_s4PkOsoVXE
Message-ID: <CAAhSdy2v4FSpekE6QNwsP8vVAH3NxW01cZOgECV2tcAOjgXD+A@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] KVM: Add a helper function to validate vcpu gpa range
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_090450_259383_8A5CB664 
X-CRM114-Status: GOOD (  20.70  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgYXJjaCBzcGVjaWZpYyBjb2RlIG1heSBuZWVkIHRv
IHZhbGlkYXRlIGEgZ3BhIHJhbmdlIGlmIGl0IGlzIGEgc2hhcmVkCj4gbWVtb3J5IGJldHdlZW4g
dGhlIGhvc3QgYW5kIHRoZSBndWVzdC4gQ3VycmVudGx5LCB0aGVyZSBhcmUgZmV3IHBsYWNlcwo+
IHdoZXJlIGl0IGlzIHVzZWQgaW4gUklTQy1WIGltcGxlbWVudGF0aW9uLiBHaXZlbiB0aGUgbmF0
dXJlIG9mIHRoZSBmdW5jdGlvbgo+IGl0IG1heSBiZSB1c2VkIGZvciBvdGhlciBhcmNoaXRlY3R1
cmVzLiBIZW5jZSwgYSBjb21tb24gaGVscGVyIGZ1bmN0aW9uCj4gaXMgYWRkZWQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgaW5j
bHVkZS9saW51eC9rdm1faG9zdC5oIHwgIDIgKysKPiAgdmlydC9rdm0va3ZtX21haW4uYyAgICAg
IHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1
ZGUvbGludXgva3ZtX2hvc3QuaAo+IGluZGV4IDI5MWQ0OWI5YmYwNS4uYWRkYTYxY2M0MDcyIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgva3ZtX2hvc3QuaAo+IEBAIC0xMzgzLDYgKzEzODMsOCBAQCBzdGF0aWMgaW5saW5lIGludCBr
dm1fdmNwdV9tYXBfcmVhZG9ubHkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsCj4K
PiAgdW5zaWduZWQgbG9uZyBrdm1fdmNwdV9nZm5fdG9faHZhKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgZ2ZuX3QgZ2ZuKTsKPiAgdW5zaWduZWQgbG9uZyBrdm1fdmNwdV9nZm5fdG9faHZhX3Byb3Qo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sIGJvb2wgKndyaXRhYmxlKTsKPiAraW50
IGt2bV92Y3B1X3ZhbGlkYXRlX2dwYV9yYW5nZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90
IGdwYSwgdW5zaWduZWQgbG9uZyBsZW4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIHdyaXRlX2FjY2Vzcyk7Cj4gIGludCBrdm1fdmNwdV9yZWFkX2d1ZXN0X3BhZ2Uoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sIHZvaWQgKmRhdGEsIGludCBvZmZzZXQsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgbGVuKTsKPiAgaW50IGt2bV92Y3B1X3Jl
YWRfZ3Vlc3RfYXRvbWljKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCB2b2lkICpk
YXRhLAo+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21h
aW4uYwo+IGluZGV4IGU4NWIzM2E5MjYyNC4uM2Y1MmY1NTcxZmE2IDEwMDY0NAo+IC0tLSBhL3Zp
cnQva3ZtL2t2bV9tYWluLmMKPiArKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gQEAgLTMzMDEs
NiArMzMwMSwyNyBAQCBpbnQga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3Qoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBncGFfdCBncGEsIGNvbnN0IHZvaWQgKmRhdGEsCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9H
UEwoa3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QpOwo+Cj4gK2ludCBrdm1fdmNwdV92YWxpZGF0ZV9ncGFf
cmFuZ2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIHVuc2lnbmVkIGxvbmcgbGVu
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCB3cml0ZV9hY2Nlc3MpCj4g
K3sKPiArICAgICAgIGdmbl90IGdmbiA9IGdwYSA+PiBQQUdFX1NISUZUOwo+ICsgICAgICAgaW50
IHNlZzsKPiArICAgICAgIGludCBvZmZzZXQgPSBvZmZzZXRfaW5fcGFnZShncGEpOwo+ICsgICAg
ICAgYm9vbCB3cml0YWJsZSA9IGZhbHNlOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBodmE7CgpO
aXQ6IHJlYXJyYW5nZSB0aGUgdmFyaWFibGVzIGluIGEgaW52ZXJ0ZWQgcHlyYW1pZCBzaGFwZS4K
Cj4gKwo+ICsgICAgICAgd2hpbGUgKChzZWcgPSBuZXh0X3NlZ21lbnQobGVuLCBvZmZzZXQpKSAh
PSAwKSB7Cj4gKyAgICAgICAgICAgICAgIGh2YSA9IGt2bV92Y3B1X2dmbl90b19odmFfcHJvdCh2
Y3B1LCBnZm4sICZ3cml0YWJsZSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChrdm1faXNfZXJyb3Jf
aHZhKGh2YSkgfHwgKHdyaXRhYmxlIF4gd3JpdGVfYWNjZXNzKSkKPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVQRVJNOwo+ICsgICAgICAgICAgICAgICBvZmZzZXQgPSAwOwo+ICsg
ICAgICAgICAgICAgICBsZW4gLT0gc2VnOwo+ICsgICAgICAgICAgICAgICArK2dmbjsKPiArICAg
ICAgIH0KPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKGt2bV92
Y3B1X3ZhbGlkYXRlX2dwYV9yYW5nZSk7Cj4gKwo+ICBzdGF0aWMgaW50IF9fa3ZtX2dmbl90b19o
dmFfY2FjaGVfaW5pdChzdHJ1Y3Qga3ZtX21lbXNsb3RzICpzbG90cywKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZ2ZuX3RvX2h2YV9jYWNoZSAqZ2hjLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwYV90IGdwYSwgdW5zaWdu
ZWQgbG9uZyBsZW4pCj4KPiAtLQo+IDIuNDMuMAo+CgpPdGhlcndpc2UsIGxvb2tzIGdvb2QgdG8g
bWUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
