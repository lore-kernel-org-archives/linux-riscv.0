Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73856C87FD3
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YMmYgUP4/rS9hLUf/QFvMs4wCyxr/yClW4KSGzc8Qk=; b=eFRhanv1Ra3CWp
	WUEedj82U0ra9vlJ495G0DLFKvB8Bk7kcjVr6j6w5WM9SW5Up+1HqFfBIHCCjpXeAXDMXq9h/0HhN
	W7k/PVXy6Yq9BAKk/k/PV+R/frt/as1wSq2YGwr10/qmr4SLe+oXy7d3N9/InBvTObkefpuK+dKf1
	mK5+FWxDGVRbVKXaj0P4SZkK7545G1pEA6O+JSNi1+GLH8ODiyj9S50ziRyPC0y7gAuX/tMEy2163
	VLmevye9MdGzow1H6BSqEGL9gWBG4pIA4oT3ylQ40W0ciTj6Sdp2s8QUDmZ2UhFuggzrGsJD05Qow
	kCMA9jz4smyrlzh5MyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiprw-00000009qbD-1nNK;
	Mon, 04 Aug 2025 07:44:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipru-00000009qZV-02Ov
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 07:44:27 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b7823559a5so2394886f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Aug 2025 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754293464; x=1754898264; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1qE5bqfc6/gRoBQGgH93Iqh8i5yh90xnviBWYEKgsbs=;
        b=OJrQbS9sGZTRruMKRUdDkIZ/h7p2XYq871oO/FDyB4oDT6RxiNM/3sE1TNxKHliy47
         BA6Kz6s5wJl8ZksDbuBxTSLU1/AIxbfayktaV7aJ5kKuLVnX2k8pGVtO8GFZGEsdvshe
         E99VwQwPbpju7ypAhIZYx8nebwWjbr9+vjrgP8YQKeUEClkoBmSpgJlqI7+iJRgDa+rW
         +jBqh7/hmQh+vAUeNX+dNEwRBYcSST/7eF8msQyfRBQCEOMfF+JFaS4ZVEmQl3DQn8Xi
         eRqpVHdSi3hmw9+n+Xyr6Zdz4TijZeggX/E3Nc2P1EZg8r7ebyyTNBE29LtKL/wo/E6q
         kjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754293464; x=1754898264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qE5bqfc6/gRoBQGgH93Iqh8i5yh90xnviBWYEKgsbs=;
        b=YpLOFTJSmVi8sxRdqJnXrWs3+Q5s2Q4JT9blcYkdrksk/SqLVqGzfqaqr82QFaXlOO
         iZ/6IeqYQOmaHDTiPWzM0RmZ8gT5QPSDr0ciH6ucVdLCL+lRYbjNXczc6upsywjQwpBc
         tpZfKFUWZpHbPZvU/oeQVAKAPK3aVtaV845LWkPPwB6BtTHf+iMpOgusb6/3QmRPh7Wy
         OtZsnL294KNamvyNO9AYzVYX8627qky657/c1GILnATh4e6V6EAGsDJ0qHohOPabYthS
         hO+RagoIDnbFCODCRuCfqGZs6JgLsHKWBtrWga9lXqSTv45R0BkVSNUZ7LLuKLXYWyVf
         d1Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWAoCxk1j9TpOWV9CFRK+9Y3mus7ySr9oSpDT8X4KHLCXzT0LaVQTcLoneOEjRY+YcSm8cTWmVedrmHxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpKBiajY/+TeqrODQd19QRfLWsSyC8uNvp40yFPi93cGoZK4T+
	PAtLc2shyz2wPcCZWh/2f8C+BjNs7tNdklejxG6lCjVhkei8eXl0idJlPMYjBGepGpU=
X-Gm-Gg: ASbGnctrolIWgz2ArrHOleTqy8VxmGvAMwzw6o6HSN72VyG0Gt/t9hi0MFnkgnO/EUG
	O7eITSKnRSW8qpi0UwyaFdhPgNpG1dCIlD5AxOlhHOWYc7CkJo6v2qxYOpLy6+5FqXI0ejL6jQA
	3/Hfp2nAqJEIXdlp4XTBP8RBmO6O/rnlzzXv2ij57bWN1KGRuI2oBbrYy8p3uSOgLS2cP88dS8F
	TIbN6enH/JBPin3OKmeQJN6CLwdnErC3hovu0emBZtrZ6sxJIFAV3+pIKcpdR6Zu8Oo2LWXtjhg
	7nf6B8asUTHqeGqS+x5YL/WirLGqWrB/2xfpPzSvqX7VwvhRmh5Wv2f98VjMgPrudpedLmffTy6
	2810xHB1z7yCHSLh77HUQsBtm2bX7oxZeoqG2b8N2JdSiEFtSIRjsPc233LjecniCBDU=
X-Google-Smtp-Source: AGHT+IFu/5KFA9iys+eaVKF/vIlZ7l/B2LAyHVQTO16tEiAUvJUct9VjWAPHuEIdPHc9SqHTzkTI1g==
X-Received: by 2002:a05:6000:24c6:b0:3b7:9214:6d70 with SMTP id ffacd0b85a97d-3b8d94728c4mr5701816f8f.15.1754293463896;
        Mon, 04 Aug 2025 00:44:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4818c1sm14399230f8f.65.2025.08.04.00.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 00:44:23 -0700 (PDT)
Message-ID: <9f37a8b5-7c88-427c-810e-56c0b1c7acf5@rivosinc.com>
Date: Mon, 4 Aug 2025 09:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/6] riscv: insn: __read_insn use copy_from_X_nofault
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta
 <debug@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>, WangYuli
 <wangyuli@uniontech.com>, Huacai Chen <chenhuacai@kernel.org>,
 Nam Cao <namcao@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>,
 Joel Granados <joel.granados@kernel.org>,
 Celeste Liu <coelacanthushex@gmail.com>, Evan Green <evan@rivosinc.com>,
 Nylon Chen <nylon.chen@sifive.com>
References: <20250722173829.984082-1-jesse@rivosinc.com>
 <20250722173829.984082-4-jesse@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250722173829.984082-4-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_004426_109838_D611470D 
X-CRM114-Status: GOOD (  17.45  )
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

CgpPbiAyMi8wNy8yMDI1IDE5OjM4LCBKZXNzZSBUYXViZSB3cm90ZToKPiBfX3JlYWRfaW5zbiB3
YXMgdXNpbmcgZ2V0X3VzZXIgZm9yIHVzZXIgc3BhY2UgcmVhZHMgYW5kIGRpcmVjdAo+IGRlcmVm
ZXJlbmNpbmcgZm9yIGtlcm5lbCBzcGFjZSByZWFkcy4KPiBVcGRhdGUgdG8gdXNlIGNvcHlfZnJv
bV91c2VyX25vZmF1bHQsIGNvcHlfZnJvbV9rZXJuZWxfbm9mYXVsdCBmb3IgdGhpcwo+IGFzIGdl
dF91c2VyIGlzIHVzZXIgY29udGV4dCBvbmx5IGFuZCBtYXkgc2xlZXAuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBTcXVhc2ggd2l0
aCBwcmV2aW91cyBjb21taXQgYXMgaXQncyBicmVha3MgYmlzZWN0YWJpbGl0eS4KPiBTZXBhcmF0
ZWQgYXMgaSdtIHVuc3VyZSBpZiBjb3B5X2Zyb21fdXNlcl9ub2ZhdWx0IGlzIGFuIGFjY2VwdGFi
bGUKPiByZXBsYWNlbWVudC4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvaW5zbi5jIHwgOCAr
KysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9pbnNuLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9pbnNuLmMKPiBpbmRleCBkZDJhNmVmOWZkMjUuLmI4ZTUyMDJkZGNlZCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9pbnNuLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9pbnNuLmMKPiBAQCAtMiw2ICsyLDkgQEAKPiAgLyoKPiAgICogQ29weXJpZ2h0IDIwMjUgUml2
b3MsIEluYwo+ICAgKi8KPiArCj4gKyNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gKwo+ICAj
aW5jbHVkZSA8YXNtL2luc24uaD4KPiAgI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KPiAgI2luY2x1
ZGUgPGFzbS91YWNjZXNzLmg+Cj4gQEAgLTExLDEwICsxNCw5IEBACj4gIAlpbnQgX19yZXQ7CQkJ
CQlcCj4gIAkJCQkJCQlcCj4gIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7CQkJCVwKPiAtCQlfX3Jl
dCA9IGdldF91c2VyKGluc24sICh0eXBlIF9fdXNlciAqKSBpbnNuX2FkZHIpOyBcCj4gKwkJX19y
ZXQgPSBjb3B5X2Zyb21fdXNlcl9ub2ZhdWx0KCZpbnNuLCAoY29uc3QgdHlwZSBfX3VzZXIgKikg
aW5zbl9hZGRyLCBzaXplb2YodHlwZSkpOyBcCj4gIAl9IGVsc2UgewkJCQkJXAo+IC0JCWluc24g
PSAqKHR5cGUgKilpbnNuX2FkZHI7CQlcCj4gLQkJX19yZXQgPSAwOwkJCQlcCj4gKwkJX19yZXQg
PSBjb3B5X2Zyb21fa2VybmVsX25vZmF1bHQoJmluc24sIChjb25zdCB0eXBlICopIGluc25fYWRk
ciwgc2l6ZW9mKHR5cGUpKTsgXAo+ICAJfQkJCQkJCVwKCkhpIEplc3NlLAoKVGhpcyBjYW4gbm90
IGJlIHVzZWQgZm9yIG1pc2FsaWduZWQgYWNjZXNzZXMgaGFuZGxpbmcuIEFzIHBvaW50ZWQgb3V0
IGJ5ClNhbXVlbCBpbiBhIHByZXZpb3VzIG1pc2FsaWduZWQgYWNjZXNzIGhhbmRsaW5nIHBhdGNo
LCB1c2luZyB0aGUKbm9fZmF1bHQoKSB2ZXJzaW9uIHdvdWxkIGxlYWQgdG8gYWNjZXNzIGZhaWx1
cmUgaWYgdGhlIHVzZXIgbWVtb3J5IGlzCnN3YXBwZWQgb3V0LiBGb3IgdGhhdCByZWFzb24gaXQg
d2FzIHN3YXBwZWQgZnJvbSB0aGUgbm9fZmF1bHQoKSB2ZXJzaW9uCnRvIHRoZSBzdGFuZGFyZCB2
ZXJzaW9uLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gIAkJCQkJCQlcCj4gIAlfX3JldDsJCQkJCQlc
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
