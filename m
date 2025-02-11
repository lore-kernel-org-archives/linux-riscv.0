Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35F2C021A1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oC+7uKmtYiLcO04IAcUwpAELRJ9lPjC3yuaLGMm1c0I=; b=Zeodo/WlgtfeEQ
	1rlIheYnkqNFrHoZYzVFCXAJQuabSjY2CgCK83n7EGCllZh9x9hrwm9MtF/SNtUMtAhQwhXBCfddc
	Vczw5PihqZfpcxZ1x1uVubjumGjhKU9VM+4sQDQf6feY1e5bOlW7sD7pquO5okEmUNnRw3avmjU3c
	NCfh8dM+fV3FGLzWj1qqlai5K79l2nhjK6MzaU1UDh56MnBsS5qVeJyXtmUW7KTYZBb+d6HmAj+cJ
	JRqAIpztUWmK9FdGTLMH7jpGmJ5CD2xnKk/I1HtvmxXQJvz8zVVw3zuCcsl7L4s8wXnbGNlQVaclk
	Mt5UrfjiqOggg5doFENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlSC-00000002xvt-0rwn;
	Tue, 11 Feb 2025 08:17:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlQi-00000002xe7-2dqc
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 08:15:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43618283dedso52224495e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 00:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739261738; x=1739866538; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3IGe4OcFv6FI23HlHP/OAtXBHpwlZj9qeTFPSe5VqM=;
        b=X5HrH2KVlc2Dfmmtqdd+rBegKJ4BnCmSyPAlHNl3rXYbBWM+SVM62VmAxsdagS3d0T
         xH82pumhwh1FOqWRqZzKXZKtwBQP37lG+OsGoL/UiPCJni5e33lzip+fCGNePM0mB3HX
         NitJnumpX3xkcMz2tczUaTzhmat2NSUV/yhd9y35FQly3NTufYq3ne80TgxZxwgBfQx5
         rJrr+Qj+lc5lLkb7dO2OlXjPy4of/XD6i+izkKSuMGD+bB1VG3dw6Howi4lLtkHvCW2c
         jadZNEfCSBnw5C5SZlupW+lm4ZO7YgEtVD+rRydHiVpysxHY3W0rPIOpce0nCGO0Dq8T
         EaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261738; x=1739866538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3IGe4OcFv6FI23HlHP/OAtXBHpwlZj9qeTFPSe5VqM=;
        b=FTe/+OWzf+nxQOPh3WsQ6FPYbDnw0o0wXOw/wfv66t9HcaLJo/CKceVk33sWt+epoc
         6pIYd9QAHkhOThOeyN3dqgAIAjXFZkOkGWzktqkN7+d4saQgJHeQ7BRV0k0i1pCYoqyp
         mmG9Y1WouqWakZGHH5qYW73C0RKH+bWDYWCWJ4e/Kj9jE3wt2rvISDYOYMAf99tTzlMa
         W3BmV21Tf2nyu1kFsRW1hvGC7BH934QueYM4nrKan5EjDd/yelU+Vn9oI3LpzrZ1y1n+
         wTNS8F+kN+OY2e7xiEkhZH8wYs1IEiGv8m9uTctQOhiavq5I6Gs3J5B9hyMd9XC3k1tx
         lH0A==
X-Forwarded-Encrypted: i=1; AJvYcCUdrdyqgXrSYKXslV3m9qlnmN6UHAJClqX8wLd1aBgWLttnFGbvvtVCQ//aWBRwf15H1EyyFNy3Dm5Wbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGt+KOFjkweW+mip2kpN2nOfPuCYuB4EXNjMKEjfmTTL4lhl3x
	CqNndX2BS7ecWCwDJXN8AWNVabAXmCPPTPM8LwQlybMxdFb2xRLjMUeuWOkEjwI73I8ztywAYgi
	m1Mo=
X-Gm-Gg: ASbGncsJVsCN7IEl8OnTx3XWBOROJta7yiOCw9lHLHVA2w9bQkKRuq7u1SLypzUog8i
	401BXo9M1+u0CSB2LeCwbD2+AtmNsVvcUpzAggu03v4Noxieffg1emC8RtSTSdPadiDLA1Fovjl
	Cc/1nV4QWU55NgRbBiYWN8/3biw+k4qU+ng55+E3ZGTe2T9gXsRsCHEwZBHG+Rt1cMBbfD4cyFj
	8h0F4M6CvlM1IRsBmtFpmg9mY/3Hzlfpbjra1Fss4lxGKIH8/TgigewuWLeVJMHdO0qMD/zG+Dt
	H6Oyo5JEo+DPTnYi89a/7hysQmqXEdtuaSmF1J5mYLrHxetKv+ew+4gql2pt
X-Google-Smtp-Source: AGHT+IH+5QrN1U/95DO6o4UiF6FvG8maAzowDO/GoyJnqUeyjwX0zNb5nUEP64Igjir4Mqu4zYfDmw==
X-Received: by 2002:a05:600c:1d02:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-439249a8276mr125068715e9.20.1739261738429;
        Tue, 11 Feb 2025 00:15:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dce18d6f9sm10586921f8f.29.2025.02.11.00.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:15:38 -0800 (PST)
Message-ID: <56d2e34f-56cf-4141-b85f-1b11f560feaa@rivosinc.com>
Date: Tue, 11 Feb 2025 09:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: cpufeature: use bitmap_equal() instead of memcmp()
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250210155615.1545738-1-cleger@rivosinc.com>
 <968ff88f-ae77-43b4-a5b4-1a4b0bf61098@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <968ff88f-ae77-43b4-a5b4-1a4b0bf61098@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_001540_861068_6D052345 
X-CRM114-Status: GOOD (  17.78  )
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

CgpPbiAxMS8wMi8yMDI1IDA4OjQxLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gSGkgQ2zDqW1l
bnQsCj4gCj4gT24gMTAvMDIvMjAyNSAxNjo1NiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBD
b21wYXJpc29uIG9mIGJpdG1hcHMgc2hvdWxkIGJlIGRvbmUgdXNpbmcgYml0bWFwX2VxdWFsKCks
IG5vdCBtZW1jbXAoKSwKPj4gdXNlIHRoZSBmb3JtZXIgb25lIHRvIGNvbXBhcmUgaXNhIGJpdG1h
cHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIgKy0K
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC8KPj4gY3B1ZmVhdHVyZS5jCj4+IGluZGV4IGM2YmE3NTA1MzZjMy4uNDBhYzcyZTQw
N2I2IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+IEBAIC00NzksNyArNDc5LDcgQEAg
c3RhdGljIHZvaWQgX19pbml0IHJpc2N2X3Jlc29sdmVfaXNhKHVuc2lnbmVkIGxvbmcKPj4gKnNv
dXJjZV9pc2EsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChiaXQgPCBSSVNDVl9J
U0FfRVhUX0JBU0UpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKnRoaXNf
aHdjYXAgfD0gaXNhMmh3Y2FwW2JpdF07Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IC3CoMKg
wqAgfSB3aGlsZSAobG9vcCAmJiBtZW1jbXAocHJldl9yZXNvbHZlZF9pc2EsIHJlc29sdmVkX2lz
YSwKPj4gc2l6ZW9mKHByZXZfcmVzb2x2ZWRfaXNhKSkpOwo+PiArwqDCoMKgIH0gd2hpbGUgKGxv
b3AgJiYgIWJpdG1hcF9lcXVhbChwcmV2X3Jlc29sdmVkX2lzYSwgcmVzb2x2ZWRfaXNhLAo+PiBS
SVNDVl9JU0FfRVhUX01BWCkpOwo+PiDCoCB9Cj4+IMKgIMKgIHN0YXRpYyB2b2lkIF9faW5pdCBt
YXRjaF9pc2FfZXh0KGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIKPj4gKm5hbWVfZW5kLCB1
bnNpZ25lZCBsb25nICpiaXRtYXApCj4gCj4gCj4gU2luY2UgYml0bWFwIGRvZXMgbm90IGd1YXJh
bnRlZSB0aGUgdmFsdWUgb2YgdGhlICdleHRyYScgYml0cyAoaHR0cHM6Ly8KPiBlbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjYuMTMuMS9zb3VyY2UvbGliL2JpdG1hcC5jI0wyNCksIHRoaXMgaXMg
YSBmaXgKPiBzbyBJIHdvdWxkIGFkZCBhIEZpeGVzIHRhZzoKPiAKPiBGaXhlczogNjI1MDM0YWJk
NTJhOGMgKCJyaXNjdjogYWRkIElTQSBleHRlbnNpb25zIHZhbGlkYXRpb24gY2FsbGJhY2siKQoK
WWVhaCwgSSB3YXNuJ3Qgc3VyZSBzaW5jZSBpdCBkb2VzIG5vdCBmaXggYW55dGhpbmcgcGVyIHNl
LiBXZSBhbGlnbmVkCnRoZSBJU0Egc2l6ZSB0byBhIG11bHRpcGxlIG9mIDY0ICgxMjgpIHNvIHdl
IGFjdHVhbGx5IGRvIG5vdCBoYXZlIGFueQpleHRyYSB1bmRlZmluZWQgYml0cy4gQnV0IEkgYWdy
ZWUgdGhhdCBpdCdzIGJldHRlciB0byB0cmFjayBpdCBjb3JyZWN0bHkKYXMgYSBmaXguCgpUaGF0
IG1ha2VzIG1lIHRoaW5rIHRoYXQgd2UgY291bGQgYWN0dWFsbHkgc2l6ZSBSSVNDVl9JU0FfRVhU
X01BWCB0byBiZQpleGFjdGx5IHRoZSBudW1iZXIgb2YgSVNBIGV4dGVuc2lvbnMgd2Ugc3VwcG9y
dCByYXRoZXIgdGhhbiBhIGxhcmdlcgphcmJpdHJhcnkgdmFsdWUuCgo+IAo+IFlvdSBjYW4gYWxz
byBhZGQ6Cj4gCj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4KClRoYW5rcyAhCgpDbMOpbWVudAoKPiAKPiBUaGFua3MsCj4gCj4gQWxleAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
