Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16777C28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODjYVFK14l982Qwh+xhmCY07l5AitIu2zwHVRtf5vl8=; b=XQDuiEPx5lFwJp
	Z58EZpxUgfasb9fQMxsNKOtzjsL3ZJi9Ooz8f3QfLrBe6SqG6fX+7MQPuyWZJVxgmO0AtCSS3AJra
	OaQvb7FrrhsgauthDhjP5Cw4YJ9ocd9u9m5dd//SYts30oyMQMvqYa2pg/son3OeMJmlLm9OqvUE5
	LUzbJqzj+jG0F+OjzoF+ZwaKuSBd+zektIEACfoxH5hOnvK3DcFIEpM9f2X5838IvpxGh1B33Uc2K
	0SdDNYC5iBy4Te3Rnu/+Yj7TdgyQhWaIkskGhXsydqoqeLIoimta3jPfm1nCWcRrI/TB/Qn7xGMzM
	3oXkIEJ8DEWSa+ENZuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3SV-0000000E2iM-0yY5;
	Fri, 14 Mar 2025 11:44:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3SS-0000000E2hb-3FbH
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:44:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912c09be7dso1331103f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741952647; x=1742557447; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNXP4301/EYAJtyOh9G36QhlKo8rLTXV/iJ66ebNv0k=;
        b=SrnJvdslov4M9X11W/nFurjsrywbL9PEFIbd70LmZs+LTE5zEllj3TTFnoid6ucnkY
         7Xo1SaSjLiYENhyX2r9wRr/16bDCkmuAzg3M6qkWFRLPVx3UHyuI/FMCfVTo78CQ6RHQ
         2blwfkbhsJpq4xv9Kg/f5OlE75XSp0ECQ1o4WiYRffUSmDjt2KjhJ8eGoYk3DITDfBIW
         5sRPrgyDRSKJv39KA7J5tXNcy68hOZLOkHfHqkF/T71whyMVRwONyUfYVJnq55Th+RHq
         g2Ke5OIU8PXgorv1T6u8oOHJujzJpDrOoy742kJLr+DeD2NvMXa5tP6icLHlswYZnjA/
         uziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741952647; x=1742557447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yNXP4301/EYAJtyOh9G36QhlKo8rLTXV/iJ66ebNv0k=;
        b=esl6DmfGZt2IDfnsbwOTY7aIAQzBtbXlsh2AYMQWmLeoTigpo2rbP5ACoDsuKRlSHJ
         CFmDto4f4j/xvIjFwQBKTFwZlJeGBnQQSALycsRCDr1ZYe0v/wKUPtIKpyHTNivooOwI
         W5VQ7Fd2uddM71aEG7/D5AftWpSLrOHZYra93OPIT+XgCDHPWMiWWDJ2YghbjlWyIU6n
         YG4E9XLh/RHwaNEVBvbAraQ/Dd+8hZj4A5QVG/UyzVhKwM+tkumUyi4Uiti+0ITN3ucu
         sKOnhhk0M2XkNYO1a23qXTN/Vx9zYolYdBB5hqFO9/wxgrCTK10w+ZjNkpFNWFooy0zQ
         OIDg==
X-Forwarded-Encrypted: i=1; AJvYcCXCUUyivN8uLD0qw1eP5Go2kS2QlU81vWfgIYv6SKRSeGzKbaId/aG02IaF1p3E+hlfo4BBhW/BVNfWjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2w4Eka3cpuONLksDmAa4K6fFy3hNsfrMnSZlx12t3ZWerK043
	NLU2B3Iyf94OcGLr7k8X2Q9jzMEhJDYSEvxUBWJFX4jnlECNlvyPiFWIfU+RxFQ=
X-Gm-Gg: ASbGncuY6emKWLiWZRxbfsRo609/4Ragj1TK3v88SH9aQ5OBAYQF7i7otELSc/ruO/X
	hNT5yLc9jrV0qx7gGE8qXmAV3Hvav/zm/LTea33NHAowaqEWvoQo3WkcbQU7AhVl/wUJ4uiWcbl
	q6vvwdsqLTBaEDzhwwqsTYEf3XhWEgaEYfnAngBxbnx2P19OW9QAvqwp1mJEp4tf8/VY8SHKnuP
	ApFhdQeXp/NMbdRYwPIY9wDIlARvU+9q/EzJADInvDYTV/qftwU/UZxyEzRGT51cZa/2tW/jmgA
	wrwv7td7sMTTlmD63jG0b5o6kBfXMzTi598URiJLlO7qxgW/pKtXfXZ/mHCZUoDK2xY7qKjE2kp
	LS1ZkJR1iUScPoA==
X-Google-Smtp-Source: AGHT+IF+PcMLniUgUw+7z04HFQAwTiKLbHivzVvB0Zh2bIees9zyWsKr40uUY0pHyf5dEv8vx5Q9WQ==
X-Received: by 2002:a5d:5f49:0:b0:390:fb37:1bd with SMTP id ffacd0b85a97d-3971f7f8fccmr2700791f8f.46.1741952647046;
        Fri, 14 Mar 2025 04:44:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a32sm5420094f8f.33.2025.03.14.04.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:44:06 -0700 (PDT)
Message-ID: <1942580f-cd67-4ddd-b489-0532f95c1ef2@rivosinc.com>
Date: Fri, 14 Mar 2025 12:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/17] riscv: misaligned: use on_each_cpu() for scalar
 misaligned access probing
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-6-cleger@rivosinc.com>
 <20250313-311b94f9bafe73bcd41158a1@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-311b94f9bafe73bcd41158a1@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_044408_813799_120F8F5C 
X-CRM114-Status: GOOD (  16.48  )
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

CgpPbiAxMy8wMy8yMDI1IDEzOjU3LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMDQ6MTI6MTJQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBz
Y2hlZHVsZV9vbl9lYWNoX2NwdSgpIHdhcyB1c2VkIHdpdGhvdXQgYW55IGdvb2QgcmVhc29uIHdo
aWxlIGRvY3VtZW50ZWQKPj4gYXMgdmVyeSBzbG93LiBUaGlzIGNhbGwgd2FzIGluIHRoZSBib290
IHBhdGgsIHNvIGJldHRlciB1c2UKPj4gb25fZWFjaF9jcHUoKSBmb3Igc2NhbGFyIG1pc2FsaWdu
ZWQgY2hlY2tpbmcuIFZlY3RvciBtaXNhbGlnbmVkIGNoZWNrCj4+IHN0aWxsIG5lZWRzIHRvIHVz
ZSBzY2hlZHVsZV9vbl9lYWNoX2NwdSgpIHNpbmNlIGl0IHJlcXVpcmVzIGlycXMgdG8gYmUKPj4g
ZW5hYmxlZCBidXQgdGhhdCdzIGxlc3Mgb2YgYSBwcm9ibGVtIHNpbmNlIHRoaXMgY29kZSBpcyBy
YW4gaW4gYSBrdGhyZWFkLgo+PiBBZGQgYSBjb21tZW50IHRvIGV4cGxpY2l0IHRoYXQuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4g
LS0tCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCA5ICsrKysrKyst
LQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+PiBpbmRleCA5MGFjNzQxOTEzNTcu
LmZmYWM0MjRmYWE4OCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+
PiBAQCAtNjE2LDYgKzYxNiwxMSBAQCBib29sIGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCj4+ICAJCXJldHVybiBmYWxzZTsKPj4gIAl9Cj4+ICAK
Pj4gKwkvKgo+PiArCSAqIFdoaWxlIGJlaW5nIGRvY3VtZW50ZWQgYXMgdmVyeSBzbG93LCBzY2hl
ZHVsZV9vbl9lYWNoX2NwdSgpIGlzIHVzZWQKPj4gKwkgKiBzaW5jZSBrZXJuZWxfdmVjdG9yX2Jl
Z2luKCkgZXhwZWN0cyBpcnFzIHRvIGJlIGVuYWJsZWQgb3IgaXQgd2lsbCBwYW5pYygpLgo+IAo+
IHdoaWNoIGV4cGVjdHMKCkh1bSB0aGF0IHdvdWxkIHlpZWxkIHRoZSBmb2xsb3dpbmc6Cgoic2No
ZWR1bGVfb25fZWFjaF9jcHUoKSBpcyB1c2VkIHNpbmNlIGtlcm5lbF92ZWN0b3JfYmVnaW4oKSB0
aGF0IGlzCmNhbGxlZCBpbnNpZGUgdGhlIHZlY3RvciBjb2RlICd3aGljaCcgZXhwZWN0cyBpcnFz
IHRvIGJlIGVuYWJsZWQgb3IgaXQKd2lsbCBwYW5pYygpLiIgd2hpY2ggc2VlbXMgd3JvbmcgYXMg
d2VsbC4KCkkgZ3Vlc3Mgc29tZXRoaW5nIGxpa2UgdGhpcyB3b3VsZCBiZSBiZXR0ZXI6CgoiV2hp
bGUgYmVpbmcgZG9jdW1lbnRlZCBhcyB2ZXJ5IHNsb3csIHNjaGVkdWxlX29uX2VhY2hfY3B1KCkg
aXMgdXNlZApzaW5jZSBrZXJuZWxfdmVjdG9yX2JlZ2luKCkgZXhwZWN0cyBpcnFzIHRvIGJlIGVu
YWJsZWQgb3IgaXQgd2lsbCBwYW5pYygpIgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4+ICsJICov
Cj4+ICAJc2NoZWR1bGVfb25fZWFjaF9jcHUoY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3Nf
ZW11bGF0ZWQpOwo+PiAgCj4+ICAJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4+IEBAIC02MzYs
NyArNjQxLDcgQEAgYm9vbCBjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9h
bGxfY3B1cyh2b2lkKQo+PiAgCj4+ICBzdGF0aWMgYm9vbCB1bmFsaWduZWRfY3RsIF9fcmVhZF9t
b3N0bHk7Cj4+ICAKPj4gLXN0YXRpYyB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCkKPj4gK3N0YXRpYyB2
b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQodm9pZCAqYXJnIF9fYWx3YXlzX3Vu
dXNlZCkKPj4gIHsKPj4gIAlpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+PiAgCWxvbmcg
Km1hc19wdHIgPSBwZXJfY3B1X3B0cigmbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSk7Cj4+
IEBAIC02NzcsNyArNjgyLDcgQEAgYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVk
X2FsbF9jcHVzKHZvaWQpCj4+ICAJICogYWNjZXNzZXMgZW11bGF0ZWQgc2luY2UgdGFza3MgcmVx
dWVzdGluZyBzdWNoIGNvbnRyb2wgY2FuIHJ1biBvbiBhbnkKPj4gIAkgKiBDUFUuCj4+ICAJICov
Cj4+IC0Jc2NoZWR1bGVfb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRl
ZCk7Cj4+ICsJb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCwgTlVM
TCwgMSk7Cj4+ICAKPj4gIAlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKPj4gIAkJaWYgKHBlcl9j
cHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSkKPj4gLS0gCj4+IDIuNDcuMgo+Pgo+IAo+
IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
