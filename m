Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDADC5B549
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 07:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olviFrFbdAqgJ0JBK8FJZVP6UBj/YZc0P5llT28MJuM=; b=LWt821fCKuYCC2
	UfwTfSVN1Xt3rWmFRo3kZienuhJye+ThznYpDOMp6cBWgBTeuOHDqS4PDBhqfiWsFbQzRHZhLh9nV
	JNgtbtgcZZ31y7AACA6JtmjOyRSSWvt9AD52nJZyqVEzty9iiLMbaUknz3FO7nW7kMogmtmvcUJXM
	n+ke6FCHeCpJHubkLvWgud5gBxPT4gMVs90mmIPj4VgQg6RyXJR198KfRxUmKV2C4W0lt4N4jNrd6
	EXsAb4Al3V3UjP9sWI3ieUKHq1GF893pc3q1R5EArf7smFmZwUfNA7XdroELfB3i3z0R/bOaMQn5W
	4CXzwMwZeGVKOJbw90bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzho-00000006v0k-2lyc;
	Mon, 02 Jun 2025 07:35:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzhm-00000006v04-0QYN
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 07:35:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so46908115e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 00:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748849732; x=1749454532; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cumGIXMNgc0u7pbGPIyAxyyCYSUeC1bHYbz8p+dQZP8=;
        b=EE6y52IOcJRmu6HGYsOz9dON/lfTEi6qaxlfdrDRQo4qLz8LVGBkN9LjAZJxn8aB2K
         mBdcVM0f70MGUd5aN/PK2Dw7U6SrUhgJUv3zyrpw14vG5E6P/Zd0Yqe8FqZE77a3nIwt
         NRMsuGkhATM3ujabYRdBCawb9cn0GrhYoygOPDocjw0W2eK8ojuILlK5B3wzLYwC+s3P
         r9v+P0bmMh0ZzrWzJPe4TDaecG7+SgTNePlM8j6glaKdOKyxTRCX0ProeXSMs6B97DKs
         xVNCeTPs4X0KlDXDaqFKFh+psLSyoUSSgzSMo8Be0ouppxzN7IZRys6sO/36mRC557kp
         zyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849732; x=1749454532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cumGIXMNgc0u7pbGPIyAxyyCYSUeC1bHYbz8p+dQZP8=;
        b=a7dz8wEp11CfQQ2hT3Y+YeTg57r8Bs2trj3r+QvcsDo6tY292G0U68nJ5LMJ+DvQrY
         ewq+dCYgDYFr+dvVMXLNYEMWBP2zwsbhHj2JpeA6tvPLVDUWfbSmcn/Zu9LJuqe2ETdz
         fMlp0aKz82ljy5FSPqHn24B9C9EOsE6Whsurxkx4dpTG6Ese4G5JLkFRlJFG7tPscq8e
         Kau9xhgzsExo7BKfQ0sTTIO7AnbFgrT2DgIGyxcZCWHpcM6rU8av7GyR4iYLMh7EO7Lb
         LqpfMkd6tpqTwRPSK5uCgUQegsY7HzF9MTrjitulvnpGrhk3qaLQTi6Lpcx8VbX9Hye2
         8nJA==
X-Gm-Message-State: AOJu0YySMkqwdRq3dbWv2TcBRCkdyi9Th4oCp+ZhreXUD4Np28pEp7Tl
	hZCl2POMKQtTkaA8fJnK9+6ULzp8J/S27k3NQ3s5iepdCAisxw/kIViLeTt8r0dj4Yc=
X-Gm-Gg: ASbGncu15r9OqQVGkYhJC1HFbnD6SIjrr5ZIqFURJgVh+hns1G0Fp9g5i0GSGG9xkFK
	WIvMooRQsJOPw2Pulbk1CHD+7kQso24pJ9TxF6Jam5j01O08I905e+4MVBIOmWBTc9cvHrDNqfj
	CBd0QcLNwPm8WhY7AKat/mfZBPXOscqzckTOj1UtkB70l0cWeuA65T1/CwD2jqLXIi0I8kAgVuK
	0R/CmWW+S9lmhbmDz7yV7LE20kFgCOrLxDFBreBMRE7m85uooixXfIhSWN7FMo/foVI5mFbEBUp
	Po1gpWha/i4n8KGuFRpPYO/4jSMo8Pwxw1p6tFUQnvHGCwV6MyFdTdyqj/AxihDJMc5zccrytsi
	zSDphlE08yuENw5GZKH06+yk4AgH8dyo=
X-Google-Smtp-Source: AGHT+IF6XBbjDeoqa8ITCmT2RHP8cD671wm4VZYXi7RTv3p6ZxGMEf7YXAkUXpSnyVYCGdL9bcgGPQ==
X-Received: by 2002:a05:600c:1914:b0:450:cf42:7565 with SMTP id 5b1f17b1804b1-45121fb93a2mr53090255e9.23.1748849732335;
        Mon, 02 Jun 2025 00:35:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c842sm13689674f8f.29.2025.06.02.00.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 00:35:31 -0700 (PDT)
Message-ID: <ff60e791-7305-4ea8-8048-ff33316bf8f1@rivosinc.com>
Date: Mon, 2 Jun 2025 09:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <20250530205658.624195-3-cleger@rivosinc.com>
 <20250531192801.5d6329c3@pumpkin>
 <alpine.DEB.2.21.2506011830130.28395@angie.orcam.me.uk>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <alpine.DEB.2.21.2506011830130.28395@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_003534_147608_569CC377 
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

CgpPbiAwMS8wNi8yMDI1IDE5OjM1LCBNYWNpZWogVy4gUm96eWNraSB3cm90ZToKPiBPbiBTYXQs
IDMxIE1heSAyMDI1LCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4gCj4+PiBTdWNoIGJlaGF2aW9yIHdh
cyBkZXRlY3RlZCB3aXRoIEdFVF9VTkFMSUdOX0NUTCgpIHRoYXQgd2FzIGRvaW5nCj4+PiBhIHB1
dF91c2VyKCkgd2l0aCBhbiB1bnNpZ25lZCBsb25nKiBhZGRyZXNzIHRoYXQgc2hvdWxkIGhhdmUg
YmVlbiBhbgo+Pj4gdW5zaWduZWQgaW50Ki4gUmVlbmFibGluZyBrZXJuZWwgbWlzYWxpZ25lZCBh
Y2Nlc3MgZW11bGF0aW9uIGlzIGEgYml0Cj4+PiByaXNreSBhbmQgaXQgd291bGQgYWxzbyBkZWdy
YWRlIHBlcmZvcm1hbmNlcy4gUmF0aGVyIHRoYW4gZG9pbmcgdGhhdCwKPj4+IHdlIHdpbGwgdHJ5
IHRvIGF2b2lkIGFueSBtaXNhbGlnbmVkIGFjY2Vzc2VkIGJ5IHVzaW5nIGNvcHlfZnJvbS90b191
c2VyKCkKPj4+IHdoaWNoIGRvZXMgbm90IGRvIGFueSBtaXNhbGlnbmVkIGFjY2Vzc2VzLiBUaGlz
IGNhbiBiZSBkb25lIG9ubHkgZm9yCj4+PiAhQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05F
RF9BQ0NFU1MgYW5kIHRodXMgYWxsb3dzIHRvIG9ubHkgZ2VuZXJhdGUKPj4+IGEgYml0IG1vcmUg
Y29kZSBmb3IgdGhpcyBjb25maWcuCj4+Cj4+IEZvciBnZXRfdXNlcigpIHlvdSBhcmUgbXVjaCBi
ZXR0ZXIgb2ZmIHJlYWRpbmcgdGhlIHR3byB3b3JkcyB0aGF0IGNvbnRhaW4KPj4gdGhlIHZhbHVl
IGFuZCB0aGVuIGRvaW5nICdzaGlmdCcgYW5kICdvcicgdG8gZ2V0IHRoZSBjb3JyZWN0IHZhbHVl
Lgo+Pgo+PiBFdmVuIGZvciBwdXRfdXNlcigpIGRvaW5nIHRoZSBleHBsaWNpdCBieXRlIGFjY2Vz
c2VzIHdpbGwgYmUgZmFzdGVyIHRoYW4KPj4gZ29pbmcgdGhvdWdoIHRoZSBnZW5lcmljIGNvcHlf
dG8vZnJvbV91c2VyKCkgZnVuY3Rpb24uCj4gCj4gIEZXSVcgSSB0aGluayBvcHRpbWlzaW5nIGNv
cHlfdG8vZnJvbV91c2VyIGZvciBzdWNoIGNhc2VzIHdvdWxkIGJlIGEgbW9yZSAKPiByb2J1c3Qg
YXBwcm9hY2ggbW92aW5nIGZvcndhcmQgdGhhbiBzcHJpbmtsaW5nIG9wZW4tY29kZWQgaW1wbGVt
ZW50YXRpb25zIAo+IGFjcm9zcyBjb2RlLgoKSGkgTWFjaWVqLAoKSW5kZWVkLCB0aGF0J3MgYSBn
b29kIGlkZWEsIHdlIGNvdWxkIG9wdGltaXplIHNtYWxsIGNvcHkgaW4KY29weV9mcm9tL3RvX3Vz
ZXIgc28gdGhhdCB3aWxsIGJlbmVmaXQgYWxsIHRoZSB1c2VycyBhcyB3ZWxsLgoKVGhhbmtzLAoK
Q2zDqW1lbnQKCj4gCj4gICBNYWNpZWoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
