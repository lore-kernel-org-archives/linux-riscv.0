Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948FFC0219C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTJ7lUby1n4GUgnpgdMucL4hVHFPcIMI26uhcAMbliQ=; b=zN4rSQaKkDxnB2
	x4SYV3sfudL0MwdMTsC5qkSv/nG9KlqH4fAwMVC+kqY+vf6ZpLiwpxMgw4tFAb1dP6m2BTMckvlP0
	2Nk/5iLeFqqsMbimzjW4nm01o9kaKjMCbsvpJT3zwvwMv/yfh0ft/i+oNAkwbRxIUlCdmst407B1N
	sItu43mf7tDepBGaHofuP7RtS9m0R9Q6JLAH/GSgREArKy+RPEVyCibwODM/3cODdSE/sYDP/m6tt
	MXfmJdJ8ElJWAqriGtna+udHblLe7nYOZ/MMHutEZXDW64Jc06Wdt8oV+h+ooZbzzBgAIxpIk7D/h
	XyGndG1MjS1NeRxLP6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRr3-0000000AQwM-0Ct3;
	Fri, 07 Feb 2025 17:09:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRVq-0000000ALjZ-3L6z
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:47:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso15737405e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738946849; x=1739551649; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mObKPDrgbbB2sa+ai7pN9n6YG7DdsbUbGGmSesxPMyI=;
        b=dhemjpe5+/0pcLVVJXSSAoQdxw+I4OIEo/SGmEMEFbSEPqqNaASH7MhlNqBs0JGp7y
         PH7X/cpwqLPgA0WXuml+FUssRUARM+QWTG2pNo/gk7ES7BozoMCX6guOl8/avNNDPTaS
         QefURUoSVhxYvKNGXONDnRMb+qHwR90x4+j9JpMEkCugTtMVNFxBqurjUV9a2exuL2+c
         gqvEINTulj1riGv+41rhQZJAuzaRPEOEThOjZihkW3TyWbrNfgIj7EA7pY4AwW68X0Uo
         t1NE76i/NZUqitrazC5B4RUV295n+gYB4+VcZRQBFgiSQEO454u1b+G3ESCTPBILAfJD
         lFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946849; x=1739551649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mObKPDrgbbB2sa+ai7pN9n6YG7DdsbUbGGmSesxPMyI=;
        b=mVkxhLOKOSlqNJbAjhhZfmtoXbIeOKLwZECR4lLQ2nkepCsDTQbMeApyZwLXWIwAY0
         K391bOSCcx6WPyzQI+Yh4CxFwOm0w1R0x7B38d2thjT30HZ5ApvdCTxx6vViHaWRdiHP
         hVQ+f5NQmoyuQvQWwRXVrBWbKrRBRo+/jmT1rPaZDSWPLRESjEvfqDj4r780HWManZ9W
         +h0t5H1QtS2U40zOgQWZZky+uej24cvhmLGy/K3A/a8sv7kweXVSdbJfkEJ1lzRDbkms
         eToSqGst0uuMzUpMzbgr1jE3P3b0+ENxX395PPqR0y+PXLl+xSkbIUOzV5gsTLK+M0GP
         C0iw==
X-Forwarded-Encrypted: i=1; AJvYcCVnA3bczdYIT1EAXypCHQzbp3kiW/nUJG9wVJwx26bDokXh5mr4qE9jb4hl3u+uxaTTp3DMcAhoIxmJMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvtV4y8Fr0jy46D30iua90kni5N0yx/ax39HcIdMy5SflsLhdY
	LKm+mZY6/fAYRxJ0T/116aXCe2IjK6s4FHdZTOlcVr3eFOszG2/y2pFO6Na+qw8=
X-Gm-Gg: ASbGncsp2AaUgtRI9z2Fl0w8X9bEgdlv4NyW7/8bX+T0YcV9bw4goGsh1EEpXR66F31
	xLbLALruaYI6c1MgD3i2krcILOy9JRb3bHxQFWgaRaUKuXonpEQcMfnj0kkgMnIstSuHgIXStt6
	dINBYa89DXigpVGqD7zlpgzaZXVV73KSaNRSDSmX6ar9oGo6Ej1WHb74Vs00txCNNkDDWvCGyQh
	4UiX57u5xaKMNNLI0b+lPmflC6yz0kUtjkr9g76/L0iwdcpnLlIKtXAmy0FHccdiUPUOPcsvtL9
	B+fQ9TdsW2xBUxgHd+iu6/vc27t1EMl4BJrrgOY/RpoDY+YaNZ7QDeJ9ok50
X-Google-Smtp-Source: AGHT+IHbSBzgrshza944qaKfsddsDEGNt8e8obbQqx/m7m5MFlSaV3zdt5K9iS7U+vNir5tVLD9iTw==
X-Received: by 2002:a05:600c:1c07:b0:434:a315:19c with SMTP id 5b1f17b1804b1-4392497db5fmr36624035e9.3.1738946849155;
        Fri, 07 Feb 2025 08:47:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fd00sm4952013f8f.78.2025.02.07.08.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:47:28 -0800 (PST)
Message-ID: <1a4de5bb-913d-489a-ac96-3f4dec48cb2d@rivosinc.com>
Date: Fri, 7 Feb 2025 17:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] riscv: Fix riscv_online_cpu_vec
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-13-ajones@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250207161939.46139-13-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_084730_834596_07139912 
X-CRM114-Status: GOOD (  15.92  )
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

CgpPbiAwNy8wMi8yMDI1IDE3OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gV2Ugc2hvdWxkbid0
IHByb2JlIHdoZW4gd2UgYWxyZWFkeSBrbm93IHZlY3RvciBpcyB1bnN1cHBvcnRlZCBhbmQKPiB3
ZSBzaG91bGQgcHJvYmUgd2hlbiB3ZSBzZWUgd2UgZG9uJ3QgeWV0IGtub3cgd2hldGhlciBpdCdz
IHN1cHBvcnRlZC4KPiBGdXJ0aGVybW9yZSwgd2Ugc2hvdWxkIGVuc3VyZSB3ZSd2ZSBzZXQgdGhl
IGFjY2VzcyB0eXBlIHRvCj4gdW5zdXBwb3J0ZWQgd2hlbiB3ZSBkb24ndCBoYXZlIHZlY3RvciBh
dCBhbGwuCj4gCj4gRml4ZXM6IGU3YzlkNjZlMzEzYiAoIlJJU0MtVjogUmVwb3J0IHZlY3RvciB1
bmFsaWduZWQgYWNjZXNzIHNwZWVkIGh3cHJvYmUiKQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVs
L3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Vu
YWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwo+IGluZGV4IGI3YThmZjdiYTZkZi4uMTYxOTY0Y2YyYWJj
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQu
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwo+IEBA
IC0zNjcsMTAgKzM2NywxMiBAQCBzdGF0aWMgdm9pZCBjaGVja192ZWN0b3JfdW5hbGlnbmVkX2Fj
Y2VzcyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51cwo+ICAKPiAgc3RhdGlj
IGludCByaXNjdl9vbmxpbmVfY3B1X3ZlYyh1bnNpZ25lZCBpbnQgY3B1KQo+ICB7Cj4gLQlpZiAo
IWhhc192ZWN0b3IoKSkKPiArCWlmICghaGFzX3ZlY3RvcigpKSB7Cj4gKwkJcGVyX2NwdSh2ZWN0
b3JfbWlzYWxpZ25lZF9hY2Nlc3MsIGNwdSkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVD
VE9SX1VOU1VQUE9SVEVEOwo+ICAJCXJldHVybiAwOwo+ICsJfQo+ICAKPiAtCWlmIChwZXJfY3B1
KHZlY3Rvcl9taXNhbGlnbmVkX2FjY2VzcywgY3B1KSAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdO
RURfVkVDVE9SX1VOU1VQUE9SVEVEKQo+ICsJaWYgKHBlcl9jcHUodmVjdG9yX21pc2FsaWduZWRf
YWNjZXNzLCBjcHUpICE9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9WRUNUT1JfVU5LTk9XTikK
PiAgCQlyZXR1cm4gMDsKPiAgCj4gIAljaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZChOVUxMKTsKCkhpIEFuZHJldywKCldvdWxkbid0IGl0IGJlIGVhc2llciBqdXN0IG5vdCB0
byByZWdpc3RlciB0aGUgaG90cGx1ZyBjYWxsYmFjayBpbiBjYXNlCiFoYXNfdmVjdG9yKCkgPyBJ
biB3aGljaCBjYXNlIGp1c3Qgc2V0IGFsbCBwb3NzaWJsZSBjcHVzCnZlY3Rvcl9taXNhbGlnbmVk
X2FjY2VzcyB0byBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVkVDVE9SX1VOU1VQUE9SVEVECmF0
IHN0YXJ0dXAuCgpUaGFua3MsCgpDbMOpbWVudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
