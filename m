Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D16CDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9v/1Q+7TRRG26yZz7pbsi9n26dj4mZW4Lo8rZ1KJYQ=; b=wLWwQcJgBF7QbL
	GpcGHn49R4nslVPSEgj/LcPrg+s2WZ5+zz6/2HVLMp/UB3a/DaB5g/+XfMEMJOeCu+BEm34sOtdoY
	5D/5gKWYWlpTOzzQC64ouit3fU4jZdFibe0RRHuHqKD7PE4xAiI3HGmEtiWe/88FxDzBdNAxdbsxr
	T5DyP2bFtu7zzhFsEawr+MnpPli/eH42n/a4v7yZNDGDMhj2rwWy34qvohcrV+isaaodyMny4a0J2
	Sfaiu2FUp21HJkeZVaRk4/UbbMqCByyIpIQYLWGCJgJYlyAZ+2r8qAKb9bTABFE4a8JzIrki35h+i
	iWQ0IVENyT5NCEOn589g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPRn-00GrTU-1Q;
	Thu, 19 Oct 2023 09:36:07 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPRj-00GrT6-0n
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 09:36:05 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c506d1798eso16731751fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697708160; x=1698312960; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXtOjy9+9/ljOELmDfLKz1lWgHdhVIaF8pXBW5zYs/s=;
        b=ap1ZWhsz2N0RSvjpC5i36Qsw5x+YJdDcd2Dbbp/5LcmA9vVq8WOO+alFsgqlbPL39V
         IaIRgY1R/pwEYhKJsD6H/TTR4sUu319LU4cNgvlpQGYTIS4HIvy1jO+QsYhr39a6rBMs
         YinlQp2t+omYRUM+XkdPyLiZe05J1KqveJ+ka02n/4b8GXWcSwT0nwRvtjBjqUjj5qnK
         gP5s3e0IsJTAk+9uYtaDJ5CYyM1pV/bjncZG56hiOZ8P2Gk/+IckdnL9gTcY9NpRMC/E
         JIaYSabpB+pUHECuofWdAs3ZyAB5w3f1oFBbw/VgMR8D+p+0SBtkhAduUL+DiIWVTrcg
         SqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697708160; x=1698312960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXtOjy9+9/ljOELmDfLKz1lWgHdhVIaF8pXBW5zYs/s=;
        b=bA2AJHVe8K3kjWXo0zoAivKExo2ZnnxgXF4AWKJyUXjUgNkD6zcX3tFiK9c3pDN0bG
         MgBsQmJ7o2v9vfwbVBkSyHyen5v4ofs9m/oVAUwPoUWae994UplWY3GTGWtGp8l21C71
         zZNilvqd62RKTtz6q31ToKjGm/9jcYAawBVNb7oGCS4SA/850fVP90D2g9zi26IcpGrb
         jjcIYeOcH/WmjbdID+ll5YpMcFGUF6NSXiyOxRVy9ECNRIIj7FhXUoMrEfIwWRdY0rf9
         ZUOmJ1H3NjEHUiON3kcP5yBdEdmMlxuMQGikc8KJJXbx7b2QqQxnl7ForAoLT3pVihoZ
         fGzA==
X-Gm-Message-State: AOJu0YztvOzJB9DoI86SvKfBExke+CYPPxi92xCT0joF7qXIdpjMwduR
	xDgQt7ICOzXua1Y83ayyyR6YzA==
X-Google-Smtp-Source: AGHT+IHnVJ8IiqADjeQ3LxKx1Ukua4jK0Ptqq3ZvF/WqcvhbLHTG8YG8di0DRwfklBmQFqYLZG0FEA==
X-Received: by 2002:a2e:8909:0:b0:2c5:d49:ee9f with SMTP id d9-20020a2e8909000000b002c50d49ee9fmr1049022lji.1.1697708160439;
        Thu, 19 Oct 2023 02:36:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6933:1fe3:b858:3dde? ([2a01:e0a:999:a3a0:6933:1fe3:b858:3dde])
        by smtp.gmail.com with ESMTPSA id g11-20020a05600c310b00b003fe1fe56202sm4024816wmo.33.2023.10.19.02.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 02:35:59 -0700 (PDT)
Message-ID: <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com>
Date: Thu, 19 Oct 2023 11:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
Content-Language: en-US
To: Evan Green <evan@rivosinc.com>
Cc: Jerry Shih <jerry.shih@sifive.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
 <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
 <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_023603_306676_D748767E 
X-CRM114-Status: GOOD (  21.62  )
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

CgpPbiAxOC8xMC8yMDIzIDE5OjI2LCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFdlZCwgT2N0IDE4
LCAyMDIzIGF0IDU6NTPigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiAxOC8xMC8yMDIzIDAzOjQ1LCBKZXJyeSBTaGloIHdyb3Rl
Ogo+Pj4gT24gT2N0IDE3LCAyMDIzLCBhdCAyMToxNCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPj4+PiBAQCAtMjIxLDYgKzI2MSwyMiBAQCBjb25zdCBzdHJ1
Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPj4+PiAgICAgIF9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHprdCwgUklTQ1ZfSVNBX0VYVF9aS1QpLAo+Pj4+ICAgICAgX19SSVND
Vl9JU0FfRVhUX0RBVEEoemtzZWQsIFJJU0NWX0lTQV9FWFRfWktTRUQpLAo+Pj4+ICAgICAgX19S
SVNDVl9JU0FfRVhUX0RBVEEoemtzaCwgUklTQ1ZfSVNBX0VYVF9aS1NIKSwKPj4+PiArICAgIF9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmIsIFJJU0NWX0lTQV9FWFRfWlZCQiksCj4+Pj4gKyAgICBf
X1JJU0NWX0lTQV9FWFRfREFUQSh6dmJjLCBSSVNDVl9JU0FfRVhUX1pWQkMpLAo+Pj4+ICsgICAg
X19SSVNDVl9JU0FfRVhUX0RBVEEoenZrYiwgUklTQ1ZfSVNBX0VYVF9aVktCKSwKPj4+Cj4+PiBU
aGUgYFp2a2JgIGlzIHRoZSBzdWJzZXQgb2YgYFp2YmJgWzFdLiBTbywgdGhlIGBadmtiYCBzaG91
bGQgYmUgYnVuZGxlZCB3aXRoIGBadmJiYC4KPj4KPj4gSGkgSmVycnksCj4+Cj4+IFRoYW5rcyBm
b3IgY2F0Y2hpbmcgdGhpcywgSSB0aGluayBzb21lIG90aGVyIGV4dGVuc2lvbnMgd2lsbCBmYWxs
IGluCj4+IHRoaXMgY2F0ZWdvcnkgYXMgd2VsbCB0aGVuIChadmtuaGEvWnZrbmhiKS4gSSB3aWxs
IHZlcmlmeSB0aGF0Lgo+IAo+IFRoZSBidW5kbGluZyBtZWNoYW5pc20gd29ya3Mgd2VsbCB3aGVu
IGFuIGV4dGVuc2lvbiBpcyBhIHB1cmUgbGFzc28KPiBhcm91bmQgb3RoZXIgZXh0ZW5zaW9ucy4g
V2UnZCBoYXZlIHRvIHR3ZWFrIHRoYXQgY29kZSBpZiB3ZSB3YW50ZWQgdG8KPiBzdXBwb3J0IGNh
c2VzIGxpa2UgdGhpcywgd2hlcmUgdGhlIGV4dGVuc2lvbiBpcyBhIHN1cGVyc2V0IG9mIG90aGVy
cywKPiBidXQgYWxzbyBjb250YWlucyBsb29zZSBjaGFuZ2Ugbm90IHByZXNlbnQgYW55d2hlcmUg
ZWxzZSAoYW5kCj4gdGhlcmVmb3JlIGFsc28gbmVlZHMgdG8gc3RhbmQgYXMgYSBzZXBhcmF0ZSBi
aXQpLgoKRm9yIFp2YmIgYW5kIFp2a25oYiwgSSB1c2VkIHRoZSBmb2xsb3dpbmcgY29kZToKCnN0
YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZiYl9idW5kbGVkX2V4dHNbXSA9IHsKCVJJ
U0NWX0lTQV9FWFRfWlZLQiwKCVJJU0NWX0lTQV9FWFRfWlZCQgp9OwoKc3RhdGljIGNvbnN0IHVu
c2lnbmVkIGludCByaXNjdl96dmtuaGJfYnVuZGxlZF9leHRzW10gPSB7CglSSVNDVl9JU0FfRVhU
X1pWS05IQSwKCVJJU0NWX0lTQV9FWFRfWlZLTkhCCn07CgpXaGljaCBjb3JyZWN0bHkgcmVzdWx0
cyBpbiBib3RoIGV4dGVuc2lvbiAoc3VwZXJzZXQgKyBiYXNlIHNldCkgYmVpbmcKZW5hYmxlZCB3
aGVuIG9ubHkgb25lIGlzIHNldC4gSXMgdGhlcmUgc29tZXRoaW5nIHRoYXQgSSdtIG1pc3Npbmcg
PwoKPiAKPiBJTU8sIGRlY29tcG9zaW5nICJwdXJlIiBidW5kbGVzIG1ha2VzIHNlbnNlIHNpbmNl
IG90aGVyd2lzZSB1c2VybW9kZQo+IHdvdWxkIGhhdmUgdG8gcXVlcnkgbXVsdGlwbGUgZGlzdGlu
Y3QgYml0bWFwcyB0aGF0IG1lYW50IHRoZSBzYW1lCj4gdGhpbmcgKGVnIGNoZWNrIHRoZSBaayBi
aXQsIG9yIG1heWJlIGNoZWNrIHRoZSBaa24vWmtyL1prdCBiaXRzLCBvcgo+IG1heWJlIGNoZWNr
IHRoZSBaYmtiL1pia2MuLi4gYml0cywgYW5kIHRoZXkncmUgYWxsIGVxdWl2YWxlbnQpLiBCdXQK
PiB3aGVuIGFuIGV4dGVuc2lvbiBpcyBhIHN1cGVyc2V0IHRoYXQgYWxzbyBjb250YWlucyBsb29z
ZSBjaGFuZ2UsIHRoZXJlCj4gcmVhbGx5IGFyZW4ndCB0d28gZXF1aXZhbGVudCBiaXRtYXNrcywg
ZWFjaCBiaXQgYWRkcyBzb21ldGhpbmcgbmV3LgoKQWdyZWVkIGJ1dCBpZiBhIHN5c3RlbSBvbmx5
IHJlcG9ydCBaVkJCIGZvciBpbnN0YW5jZSBhbmQgdGhlIHVzZXIgd2FudHMKWlZLQiwgdGhlbiBp
dCBpcyBjbGVhciB0aGF0IFpWS0Igc2hvdWxkIGJlIHJlcG9ydGVkIGFzIHdlbGwgSSBndWVzcy4g
U28KaW4gdGhlIGVuZCwgaXQgd29ya3MgbXVjaCBsaWtlICJidW5kbGUiIGV4dGVuc2lvbiwganVz
dCB0aGF0IHRoZSBidW5kbGUKaXMgYWN0dWFsbHkgYSAicmVhbCIgSVNBIGV4dGVuc2lvbiBieSBp
dHNlbGYuCgpDbMOpbWVudAoKPiAKPiBUaGVyZSdzIGFuIGFyZ3VtZW50IHRvIGJlIG1hZGUgZm9y
IHN0aWxsIHR1cm5pbmcgb24gdGhlIGNvbnRhaW5pbmcKPiBleHRlbnNpb25zIHRvIGNvdmVyIGZv
ciBzaWxseSBJU0Egc3RyaW5ncyAoZWcgSVNBIHN0cmluZ3MgdGhhdAo+IGFkdmVydGlzZSB0aGUg
c3VwZXJzZXQgYnV0IGZhaWwgdG8gYWR2ZXJ0aXNlIHRoZSBjb250YWluaW5nCj4gZXh0ZW5zaW9u
cykuIFdlIGNhbiBkZWNpZGUgaWYgd2Ugd2FudCB0byB3b3JrIHRoYXQgaGFyZCB0byBjb3Zlcgo+
IGh5cG90aGV0aWNhbCBicm9rZW4gSVNBIHN0cmluZ3Mgbm93LCBvciB3YWl0IHVudGlsIHRoZXkg
c2hvdyB1cC4KPiBQZXJzb25hbGx5IEkgd291bGQgd2FpdCB1bnRpbCBzb21ldGhpbmcgYnJva2Vu
IHNob3dzIHVwLiBCdXQgb3RoZXJzCj4gbWF5IGZlZWwgZGlmZmVyZW50bHkuCj4gCj4gLUV2YW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
