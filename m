Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE7CC0219D
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 11:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4CAQ4nsacII5GnoXloFRhAdstQV0bIcgHgEuhmlhnU=; b=v3yHkWdj/RdRJV
	fTeFpg4idtFO7D/6Wdy512akROMV8quVaA4aicELmaW9ALsDFPJu3Z4pFXdNw76vZf03peBI+nW1k
	+ODWKQ/bUZdYdwOip7SjuOXs6H6Ft76k3poAt5fSSKq3RkhcFNHBTZnwPVlVQe6gomUpDxs/dCQ9T
	FOdwESM3uPmfr1YS+SwCjsz8ljwCuagVh7M4zUIQrlZSwL9yS5ytJzO3+wMt1XF/ZDDwgqD+0kjl/
	O7XM8i4caun5FpcU5lwAlI8I6WaRseaDn9deEGr4QD0dmW50QiqbQUjLzoYdSgBiI2d0NysDH52Zd
	DyB5kePbT5Q9YPYok+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRxy-0000000HDUe-1vyl;
	Mon, 10 Feb 2025 11:28:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRdf-0000000H9RS-2qLr
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 11:07:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43944181e68so8053845e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 03:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739185662; x=1739790462; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RcHB73ffT5s0AE0xa0QGrDN1xMNzDUaF8xFJ8U3Bt3g=;
        b=xHHONXoIWDbzyI7AZ8q94gQGJh+YcQTccL9EaC+IAaUY8s/Ol5apiKHVi+eClLZUTr
         L2qQtj6zSoPOoJ1pZYKx3nGRZXtl8ckg882gjLimO7AQ3LTkLk6uXAQHpXAeDy4RtsLT
         mMTCgNyUQFdGCmZ0i0ywiiSJCCEZzKcvgseMX7dgmHdZ9DxuFL9oZxgEvm89qBk5CrIG
         00YP35jug4LcSw4wE37EumWqeFzzD2qAfpW/Af+xaI7Z8NIUpnKByqsG07iH+XEmN8hH
         DQzH0cDmP5GOs7JekmK0e3aGMjJdpAYEfYop1aZCu0y7AdKeRcg4LTQh23GB5Gd94srv
         Nahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185662; x=1739790462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RcHB73ffT5s0AE0xa0QGrDN1xMNzDUaF8xFJ8U3Bt3g=;
        b=r/RNac3pIhnBZfV2x3L+dOWMT+hO57icKDBHyJX2VpXP7ceaUiogNYsMIu9AHpBybD
         P2wxVWJnBwWA5twD7qq8cyg+eQ3wE/Z99asAcC1gtTqhYKbU/snlVSsHmDTyyqVgQ8DA
         iqgI1GGyeK3aEfqnozHdIXJ4E2oz35mejtxfPIvCFhfXTUMXgkxux7nDYQtsGYTpiqTt
         YhnLDQIXkRwx9odLLQKUApZf1gznPbX+Q7ekM8MWnL2OV5RM46ngm/jn+HNN26rByxiw
         kIM4uxUAF2X6spycX51DLjkaGy2EaLluGFK9SSp4fakzR1laa2irzs4P8B55S/FI3ItI
         zAzA==
X-Forwarded-Encrypted: i=1; AJvYcCX7DtykgFDdjam1crrr26PTBxI7B/AtTCavbxi//HT81CoinOCiypXYLPo9iYDxEieQytBPCfKsKLRI1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzduCjjtkOQbesGfzxGo7Zxo8LwqiNlaYrpO1FhJw1iSAD24bLl
	vXJ6VuZpn5UOXdV/OytpfUTwKcfzjsmeKi3ZqAUzaiQwfAyKckv85qwUFchRUrU=
X-Gm-Gg: ASbGnctgcMxXhCYHXFdObXf+Vxm9mONYLxtLnyVGyeuV6Mm7Xp1GtBTn8ZODBaJn5H6
	XIb6Now/xliVDoq/0NP37o5DEQZoYWNhIkk0FycvA911QGgJvRe/1n4xikNyW9+7UnyBZM26Box
	nZQDxXv7ekQ0otcJR2WWqBD88yaWSIZ2yIjFMmBC7dngMRVIuJsfGvt/YAm2hbvFbTPEQ7OCUfK
	D/NLbjzgHf+wcKsoDSrpT/bmcCOzt+HN6Hmw7ZuCJwgVVAJEtTNrdZexvQMfBUeCn2fFuDyILCc
	h72LgBRiorqExlnOz+jLc2RA6gS7YmRlG2BhbvWEI69jjUNP+/sg6KbHGZv7
X-Google-Smtp-Source: AGHT+IFC+YE4NfL8WdwV1YYtkpdynkF0lQfZMpH3kydIXjZHR6BEayTNuzPgvcEU43pEpA5bptugNQ==
X-Received: by 2002:a05:600c:3503:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-439249cddf9mr123818595e9.31.1739185662164;
        Mon, 10 Feb 2025 03:07:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d96530fsm174550235e9.19.2025.02.10.03.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 03:07:41 -0800 (PST)
Message-ID: <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
Date: Mon, 10 Feb 2025 12:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
To: Anup Patel <anup@brainfault.org>, Charlie Jenkins <charlie@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_030743_981985_D025571D 
X-CRM114-Status: GOOD (  19.62  )
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

CgpPbiAxMC8wMi8yMDI1IDExOjE2LCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIFNhdCwgRmViIDgs
IDIwMjUgYXQgNjo1M+KAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+PiBPbiBGcmksIEZlYiAwNywgMjAyNSBhdCAwNToxOTo0N1BNICswMTAwLCBB
bmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBQcm9iaW5nIHVuYWxpZ25lZCBhY2Nlc3NlcyBvbiBib290
IGlzIHRpbWUgY29uc3VtaW5nLiBQcm92aWRlIGEKPj4+IGZ1bmN0aW9uIHdoaWNoIHdpbGwgYmUg
dXNlZCB0byBsb29rIHVwIHRoZSBhY2Nlc3MgdHlwZSBpbiBhIHRhYmxlCj4+PiBieSBpZCByZWdp
c3RlcnMuIFZlbmRvcnMgd2hpY2ggcHJvdmlkZSB0YWJsZSBlbnRyaWVzIGNhbiB0aGVuIHNraXAK
Pj4+IHRoZSBwcm9iaW5nLgo+Pgo+PiBUaGUgYWNjZXNzIGNoZWNrZXIgaW4gbXkgZXhwZXJpZW5j
ZSBpcyBvbmx5IHRpbWUgY29uc3VtaW5nIG9uIHNsb3cKPj4gaGFyZHdhcmUuIEhhcmR3YXJlIHRo
YXQgc3VwcG9ydHMgZmFzdCB1bmFsaWduZWQgYWNjZXNzZXMgaXNuJ3QgcmVhbGx5Cj4+IGltcGFj
dGVkIGJ5IHRoaXM/IEF2b2lkaW5nIGEgbGlzdCBvZiBoYXJkd2FyZSB0aGF0IGhhcyBzbG93L2Zh
c3QKPj4gdW5hbGlnbmVkIGFjY2Vzc2VzIGluIHRoZSBrZXJuZWwgd2FzIHRoZSBtYWluIHJlYXNv
biBmb3IgZHluYW1pY2FsbHkKPj4gY2hlY2tpbmcuIFdlIGRpZCBpbnRyb2R1Y2UgdGhlIGNvbmZp
ZyBvcHRpb24gdG8gY29tcGlsZSB0aGUga2VybmVsIHdpdGgKPj4gYXNzdW1lZCBzbG93L2Zhc3Qg
YWNjZXNzZXMsIHdoaWNoIG9mIGNvdXJzZSBoYXMgdGhlIGRvd25zaWRlIG9mCj4+IHJlY29tcGls
aW5nIHRoZSBrZXJuZWwgYW5kIEkgYXNzdW1lIHRoYXQgeW91IGFscmVhZHkgY29uc2lkZXJlZCB0
aGF0Lgo+IAo+IFRoZSBrY29uZmlnIG9wdGlvbiBkb2VzIG5vdCBhbGlnbiB3aXRoIHRoZSB2aXNp
b24gb2YgcnVubmluZyB0aGUgc2FtZQo+IGtlcm5lbCBpbWFnZSBhY3Jvc3MgcGxhdGZvcm1zLgoK
SSdkIHdvdWxkIGJlIGFkdm9jYXRpbmcgdG8gcmVtb3ZlIGNvbXBpbGUgdGltZSBvcHRpb25zIGFz
IHdlbGwgYW5kIHVzZQphbm90aGVyIHdheSB0byBza2lwIHRoZSBwcm9iZSAoc2VlIGJlbG93KS4K
Cj4gCj4+Cj4+IEluc3RlYWQgb2YgaGF2aW5nIGEgdGFibGUgaW4gdGhlIGtlcm5lbCwgc29tZXRo
aW5nIHRoYXQgd291bGQgYmUgbW9yZQo+PiBwbGF0Zm9ybSBhZ25vc3RpYyB3b3VsZCBiZSB0byBo
YXZlIGFuIGV4dGVuc2lvbiB0aGF0IHNpZ25hbHMgdGhpcwo+PiBpbmZvcm1hdGlvbi4gVGhhdCBz
ZWVtcyBsaWtlIGl0IHdvdWxkIGFjY29tcGxpc2ggdGhlIHNhbWUgZ29hbCBhbmQKPj4gbGV2ZXJh
Z2UgdGhlIGV4aXN0aW5nIGluZnJhc3RydWN0dXJlIGluIHRoZSBrZXJuZWwsIGFsYmVpdCB3aXRo
IHRoZSBuZWVkCj4+IHRvIG1ha2UgYSBuZXcgZXh0ZW5zaW9uLgo+Pgo+IAo+IElNTywgZXhwZWN0
aW5nIGFuIElTQSBleHRlbnNpb24gdG8gYmUgZGVmaW5lZCBmb3IgYWxsIHBvc3NpYmxlCj4gbWlj
cm9hcmNoaXRlY3R1cmFsIGNob2ljZXMgaXMgbm90IGdvaW5nIHRvIHNjYWxlIHNvIGl0IGlzIGJl
dHRlcgo+IHRvIGhhdmUgaW5mcmFzdHJ1Y3R1cmUgaW4ga2VybmVsIGl0c2VsZiB0byBpbmZlciBt
aWNyb2FyY2hpdGVjdHVyYWwKPiBjaG9pY2VzIGJhc2VkIG9uIFJJU0MtViBpbXBsZW1lbnRhdGlv
biBJRC4KClNpbmNlIGFkZGluZyBhbiBleHRlbnNpb24gc2VlbXMgcXVpdGUgdW5saWtlbHksIGFu
ZCB0aGF0IGEgZGV2aWNlLXRyZWUKcHJvcGVydHkgaXMgbGlrZWx5IERUIGNlbnRyaWMgYW5kIG5v
dCBhcHBsaWNhYmxlIHRvIEFDUEkgYXMgd2VsbCwgd2FzIGEKY29tbWFuZCBsaW5lIGFyZ3VtZW50
IGNvbnNpZGVyZWQgPwoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gUmVnYXJkcywKPiBBbnVwCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
