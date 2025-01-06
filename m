Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2F9E77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 17:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMkK0cplA1osR9aLB5E8Mv1fsvkoAWP0TiJDa1ONf/M=; b=VXVoO3pxI5kPfM
	znrLzNF9EV2TGUQyyCqvny9x/6/u0FAO2prPI1agC3XYl4azObVbXUf/g2wcZEPfeOQcJvgEh+enJ
	4cABXjua5iBT/e7YoC8sKnUxGZfAKxrjvKjw+9GcW4I8r4nxTOfc4n+Tn3VGXhYQ7PJUuTSn2ZQNQ
	pL52OITYsGkIiQjGL6VEne69A9g3Pl9cT8DBX9ggeOe7qBg9VrmV9xqocJzgmS5qKI60OqASoYSSP
	71KaUzEAR4GaeMBBapSDQYjy8/f7voM9bcJjf19KjPwNeRv5USlfwJMQCCneEepK/57yGEx01qhrW
	/75KCxQlgSZ56G0pfesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUrCY-00000002AiQ-0iId;
	Mon, 06 Jan 2025 17:47:42 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUrCV-00000002Ai1-1ZKi
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 17:47:40 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-84cb9c4aab6so50009239f.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736185657; x=1736790457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+OIAvhGznZ4LhzgR7qEdmgYN2V+vMWzwyMlZdaLlu8=;
        b=HhPJyfovplI1YX9nFjlfbAV2E4MOWasXMSo1dDkULsxRNdWANTRZAgSnILHySzySXY
         2v2M0wDjJob1XiW435N+MMzR7/NQ48jG13YelNMyu00mD9hHk9HWOw8jnTqj0g499WRU
         WP30Qm/iBUIn2gCbPEv6TbDO28nSabcDMdCOeixAMctHKITng0X4YbT0QXLkExPuGsmK
         XIfyKtciXWvi5pq4h8MYHEWqSQ+XZQg2rZjkoNjB2nzBwAuU++/IIINFr9CMfT9i1Vpf
         +1tSfGdPOYpJ/SKQiscRLgiby0c3npgpIMelL/3t9k36He5mLOZSBpSMUA1ZmHGCrs97
         T9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736185657; x=1736790457;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+OIAvhGznZ4LhzgR7qEdmgYN2V+vMWzwyMlZdaLlu8=;
        b=h79p5B57PZb/dsGVxgHfq7/9R93WlFRKdks2YPANtW4yPdT0wG1MqbGpin5sQzGpuI
         TG8gI9fjXdJC1Q+dii+CMsXQiEupYLAhIruS4vPbyIzJWL0GpYUoY8yYxBDwPguVHMEh
         F6jtoHIH0lYpYVRfFKJFP97iJtnLeDZMIklD1cWHK4bB9kvPp88FRci68A/ZnKTWmuau
         C1kWCfyYd96S4QA+fm4RafBCOtHS3rGBm9RUJIztGLW7W6McxnXlgZQ01sTMYvfjKzi/
         iGXBB9poiK8bYQxUqmz6cLfI6ACiBoWn8yEqKh5VBHKtb6c/H1o4ppLtvZxOtll5kwnC
         gNrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW81eC6sVHzmi0dr6k4YAGaRVgCE3V4teCKi56Ed2SvmJO9HgS/RXr48wOnBob3lMWmbL5DwL04F5CEiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9QSc9IdOn3exf8h7aoTKe7DsHyUE+qdT4ji3+BXuwQiae+usQ
	hWm20Bdvfb6WIR6zVIySJYaHQoxDcgz14uxUWgKMP+wSe1yybh02dacJSJ2NznA=
X-Gm-Gg: ASbGncvU31VswDkUKPIGp5xHDAgH3j4PfLQkJuU+s+4eRY+rzzmFplgwQIAk41rq9pV
	2s+FYB40InmViM4IlZ8mHT2PZvjMPnqnUcqNJTRXk7dgCR0JdtWg9Vm5WyffG+yhN72tVP6cXBj
	YT1VkqDYKBuv0a2eBFKdMnvWxcBrduJSKoSDL5H52NO5Y7jE1/hLju1S0WqyW0awqqdhftBAqCw
	4vxR2fCle2GVr9z2HcKo9V7elSOyeZPL/EP+5aIMtSigiyLRfmDJu5FNxCaIm/BbxPtGzhw4JVj
	UE7y
X-Google-Smtp-Source: AGHT+IF5QHH5dwNqH02ne6UcU8UgGBcFcqL5QVA97gSzeddMqTHh+4YCSY3Twcuawu3Fpq8gAFo5PQ==
X-Received: by 2002:a05:6e02:216b:b0:3a7:a553:72f with SMTP id e9e14a558f8ab-3c2d51501d1mr460047345ab.18.1736185657580;
        Mon, 06 Jan 2025 09:47:37 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c22176fsm9113793173.153.2025.01.06.09.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 09:47:37 -0800 (PST)
Message-ID: <92eb2691-3b40-4549-83cf-fbdd0e98bf63@sifive.com>
Date: Mon, 6 Jan 2025 11:47:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/riscv: Fixup compile warning
To: Alexandre Ghiti <alex@ghiti.fr>, guoren@kernel.org, tjeznach@rivosinc.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, baolu.lu@linux.intel.com,
 zong.li@sifive.com, iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
References: <20250103024616.3359159-1-guoren@kernel.org>
 <a110be11-923e-4943-8741-43b5513c9691@ghiti.fr>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <a110be11-923e-4943-8741-43b5513c9691@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_094739_425321_08C4E54B 
X-CRM114-Status: GOOD (  12.29  )
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

SGkgQWxleCwKCk9uIDIwMjUtMDEtMDYgNDozMSBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+
IE9uIDAzLzAxLzIwMjUgMDM6NDYsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+PiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4+Cj4+IFdoZW4gX19CSVRTX1BFUl9M
T05HID09IDMyLCBzaXplX3QgaXMgZGVmaW5lZCBhcyB1bnNpZ25lZCBpbnQgcmF0aGVyCj4gCj4g
Cj4gUklTQ1ZfSU9NTVUgZGVwZW5kcyBvbiA2NEJJVCBzbyBob3cgZG8geW91IGdldCBfX0JJVFNf
UEVSX0xPTkcgPT0gMzI/CgpJIGFtIGd1ZXNzaW5nIHRoaXMgaXMgZnJvbSBzb21lIGRvd25zdHJl
YW0gZWZmb3J0IHRvIGNvbXBpbGUgYSA2NC1iaXQga2VybmVsCndpdGggYW4gSUxQMzIgQUJJLiBI
b3dldmVyIHVuc3VwcG9ydGVkIHRoYXQgbWF5IGJlLCBzaXplX3QgaXMgdGhlIG5vbWluYWwgdHlw
ZQp1c2VkIGluIGJvdGggcmlzY3ZfaW9tbXVfcHRlX2ZldGNoKCkgYW5kIGFib3ZlIGluIGlvbW11
X2lvdGxiX2dhdGhlcl9hZGRfcGFnZSgpLApzbyB0aGUgY2hhbmdlIGRvZXMgbWFrZSBzZW5zZS4K
ClJlZ2FyZHMsClNhbXVlbAoKPj4gdGhhbiB1bnNpZ25lZCBsb25nLiBUaGVyZWZvcmUsIHdlIHNo
b3VsZCB1c2Ugc2l6ZV90IHRvIGF2b2lkCj4+IHR5cGUtY2hlY2tpbmcgZXJyb3JzLgo+Pgo+PiBG
aXhlczogNDg4ZmZiZjE4MTcxICgiaW9tbXUvcmlzY3Y6IFBhZ2luZyBkb21haW4gc3VwcG9ydCIp
Cj4+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+IENjOiBUb21hc3og
SmV6bmFjaCA8dGplem5hY2hAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9pb21t
dS9yaXNjdi9pb21tdS5jIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3Yv
aW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+PiBpbmRleCA4YTA1ZGVmNzc0
YmQuLjM4ZDM4MTE2NDM4NSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21t
dS5jCj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+PiBAQCAtMTI3MCw3ICsx
MjcwLDcgQEAgc3RhdGljIHBoeXNfYWRkcl90IHJpc2N2X2lvbW11X2lvdmFfdG9fcGh5cyhzdHJ1
Y3QKPj4gaW9tbXVfZG9tYWluICppb21tdV9kb21haW4sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9hZGRyX3QgaW92YSkKPj4gwqAgewo+
PiDCoMKgwqDCoMKgIHN0cnVjdCByaXNjdl9pb21tdV9kb21haW4gKmRvbWFpbiA9IGlvbW11X2Rv
bWFpbl90b19yaXNjdihpb21tdV9kb21haW4pOwo+PiAtwqDCoMKgIHVuc2lnbmVkIGxvbmcgcHRl
X3NpemU7Cj4+ICvCoMKgwqAgc2l6ZV90IHB0ZV9zaXplOwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVk
IGxvbmcgKnB0cjsKPj4gwqAgwqDCoMKgwqDCoCBwdHIgPSByaXNjdl9pb21tdV9wdGVfZmV0Y2go
ZG9tYWluLCBpb3ZhLCAmcHRlX3NpemUpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
