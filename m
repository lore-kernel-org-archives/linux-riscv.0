Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E9CC3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lx2HUTrvi+Ii1l5YlzT4Jd9U3uvQBUCn/z7QfhBQqDY=; b=b50knyKrKcl6zD
	DKNKbmFaRWCnoKEz/UVk2BuGn76sxlrcbwTvXndTOKsSzcK4osltuYEZjt+MTNYaEou9X4tVG7I6V
	RPZjh/1u88Psywwn/sC4XXEyhUds6t2i62xHrROdXANCQCQzMmIfJfRrJK9WjLXUGPFmKG1CzS1nK
	CmIhZg9uNNZvKP+8GaJgYJ328NNPQNXkZUFO10YTpepvzd5zoI9Ag2SA+uM+MVkTYWbHMurjNV6xx
	7RpSsYTRZ0ZTvqJInCToH5YkPhFC+HtAuBgGbxr+wF6WJD1moao4eN/4v66fK6fELnsE25V/maOqY
	gjZw4In8oXYGhY315YZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQkYZ-00000003G9H-49My;
	Mon, 08 Jul 2024 09:21:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQkYW-00000003G7P-29Ol
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 09:21:10 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70b1e536c4dso38799b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jul 2024 02:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720430467; x=1721035267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yONsKyON4CTbcJqehjyTd+ofNBjy0v+0whVPKelNE4U=;
        b=ZVxUmyqmKo2G6rC9bcIw6V4pt0PhMR3y3oaEwl7QiHUVYzpvndKDaRMX/4Y9AZvNWd
         RIMb9ezneo0Tg1Qska9B4NkdEMzaY22pzwl5vzp5v1St0iZDp3LMuQQRP014GZLe3/b3
         2lKo61FugSRpKGvZW00Gj9Em3k6Q+NL1+l4sAyX8T8TSXjaQU9r4z5We9KCVDJCxxq47
         M0lM8BBmvKklyzGgclOnH5ihBwowNRV1htu514lQXV5RFQquItJDziIdpAFwYpE5Xh6u
         m2yckEmk9EE93e95Wpq7D9PceIB+b4EibvmOm9B99uQz6jCzcElXdGgm9hQM8cqnBL0l
         QSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720430467; x=1721035267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yONsKyON4CTbcJqehjyTd+ofNBjy0v+0whVPKelNE4U=;
        b=HYglbXTQJhwwF+JxeeFsLHjEVfS9sozSYgF3BiEd9V6GFIJjQqs0Z/l+9yPxMpYMRr
         3Qd6q5IyksI9dWGt59MUrVjftpB/EiMWAP9zCTJ8+GJyG7Q8v50lsSzOLBJ8rNSUZckZ
         HwyWsfAE7lLb4oIGCAKYpBTlJi+3vZPCf/LHwJQ3hwXx+IncBUo/TUrOe9e8eyQfjeyJ
         xBwQg3o3OrBPa5aVmGHlXSd8PT+TeBeAQGDcIV79LWpWwtd8vq9X2hikWTith7I02aYa
         rPL0o4a1aKxTB6f8ecxPpDFHyi8y/g3ExC9gy98J7LeGdWJ0fYLigMXd0d0CMVhlBi8k
         XaLg==
X-Gm-Message-State: AOJu0YwV8bPXWptFD2rTGAtcjTuPwhdK17GjFyrbbVNwve8DO7d6OOUx
	yCTjX8IhYnwJfLXlmXrip7wnnVwAYWScTih1Fzyt7+7FwMFiwhwK1GpKa1AT/Eg=
X-Google-Smtp-Source: AGHT+IE6l+fF5Oib8luYdfU/tlpPhpXd/IrKtwSiDAdNpn8c69VDxJXQmjGu+WqyNfzAosOJpvap2g==
X-Received: by 2002:a62:e402:0:b0:706:aadc:b0a7 with SMTP id d2e1a72fcca58-70b00918545mr11587876b3a.1.1720430466875;
        Mon, 08 Jul 2024 02:21:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b1086d32dsm5681597b3a.46.2024.07.08.02.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 02:21:06 -0700 (PDT)
Message-ID: <beb8a766-8143-40ad-912b-b04f7937d4a4@rivosinc.com>
Date: Mon, 8 Jul 2024 11:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: select ARCH_USE_SYM_ANNOTATIONS
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240705132308.1469-1-jszhang@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240705132308.1469-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_022108_783832_32CB3385 
X-CRM114-Status: GOOD (  12.70  )
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

CgpPbiAwNS8wNy8yMDI0IDE1OjIzLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+IEFmdGVyIGNvbW1p
dCA3NjMyOWM2OTM5MjQgKCJyaXNjdjogVXNlIFNZTV8qKCkgYXNzZW1ibHkgbWFjcm9zIGluc3Rl
YWQKPiBvZiBkZXByZWNhdGVkIG9uZXMiKSwgcmlzY3YgaGFzIGJlZW4gdG8gdGhlIG5ldyBzdHls
ZSBTWU1fIGFzc2VtYmxlcgo+IGFubm90YXRpb25zLiBTbyBzZWxlY3QgQVJDSF9VU0VfU1lNX0FO
Tk9UQVRJT05TIHRvIGVuc3VyZSB0aGUKPiBkZXByZWNhdGVkIG1hY3JvcyBzdWNoIGFzIEVOVFJZ
KCksIEVORCgpLCBXRUFLKCkgYW5kIHNvIG9uIGFyZSBub3QKPiBhdmFpbGFibGUgYW5kIHdlIGRv
bid0IHJlZ3Jlc3MuCgpIaSBKaXNoZW5nLAoKT24gd2hpY2ggYnJhbmNoL3NlcmllcyBpcyBpdCBi
YXNlZCA/IEkgdHJpZWQgaXQgYW5kIGl0IGZhaWxzIG9uCmVycmF0YV9jaXAtNDM1LnMgd2hpY2gg
c3RpbGwgY29udGFpbnMgc29tZSB1c2VzIG9mIEVOVFJZKCk6CgpFTlRSWShzaWZpdmVfY2lwXzQ1
M19wYWdlX2ZhdWx0X3RycCkKClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9yaXNjdi9L
Y29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCAw
NTI1ZWUyZDYzYzcuLmM1MWIzMmE4ZGRmZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25m
aWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtNjIsNiArNjIsNyBAQCBjb25maWcg
UklTQ1YKPiAgCXNlbGVjdCBBUkNIX1VTRV9DTVBYQ0hHX0xPQ0tSRUYgaWYgNjRCSVQKPiAgCXNl
bGVjdCBBUkNIX1VTRV9NRU1URVNUCj4gIAlzZWxlY3QgQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1MK
PiArCXNlbGVjdCBBUkNIX1VTRV9TWU1fQU5OT1RBVElPTlMKPiAgCXNlbGVjdCBBUkNIX1VTRVNf
Q0ZJX1RSQVBTIGlmIENGSV9DTEFORwo+ICAJc2VsZWN0IEFSQ0hfV0FOVF9CQVRDSEVEX1VOTUFQ
X1RMQl9GTFVTSCBpZiBNTVUKPiAgCXNlbGVjdCBBUkNIX1dBTlRfREVGQVVMVF9UT1BET1dOX01N
QVBfTEFZT1VUIGlmIE1NVQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
