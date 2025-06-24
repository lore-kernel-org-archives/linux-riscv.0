Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562E5C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Khao4kNCcASWYUKhWZTkSllQa0Knn+AH1b/Uj+ZJEz0=; b=fVOT3NmfYFKh+Y
	vZQ9PxMHhph9syPQ6h/Fsc5KtGT9kdo1yU/7z3qbxABweTY7bkEDLy90IufGdfFlDBL0vt/s3cYi3
	4Sbs2gxBHSeUG0p7Qkui6WoijD9v1mcgU680vL1096VxBUWZZkLsbftkUK9U99dtkTDMh/dwuMiw4
	3fG4PB9+F6Jq89d12gVLqC+i0BWtoR3/wHGt8k8a2JLvqVNu00pzokkx4i/fImRY0JToZ4nMv1CgE
	LVVaOrYW2hOm6Gh3Fq53gb6+2z8d8sOZaYPSRjJ66bUaO2odvhuGaZjHuYiNNu02BJWHN6e6IhVU3
	nhmVQ4nPh5foF8/aHgsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2c0-00000005XT2-2t3h;
	Tue, 24 Jun 2025 12:18:52 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1xu-00000005RfQ-1Q5g
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 11:37:27 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-747ef5996edso3946124b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 04:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750765045; x=1751369845; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1BS57X/WG0jVySO8QMdoFZrcIzR1oh7Qce1t6ebg7Q=;
        b=Q9x4b4g7rxcsX0q3A58WgzaytoXe+jXUmcUFaMdIRWayz1TrTBwf0E3sd0a5++2KEB
         fuvMmAZFO+7OlSDsYSfAgni3xee0sJTQTjw8n7qw0aNc/rh50Gg8Ruw4HRb3+rLh1L5s
         +HrYgWAS86YqG7Enp40fFe6awXEXWt4C+kCoituV85fzJCi1DZ3eujfXp9ZVApbnq1oD
         S5c9/axZYDAdPSbATntebdWshkQewCHjEKt7dJqJbBbWGWLtMivaupD6ni5WTx6UJBLN
         gEFTF7+uBCX3D2nZx2jx7FWu0UY1kX1SVe3W6nYEMIDHKYA9/t4mlIIwjq+Z4WwI5N8d
         Fzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750765045; x=1751369845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1BS57X/WG0jVySO8QMdoFZrcIzR1oh7Qce1t6ebg7Q=;
        b=YFDletVX6r+QI1U/ezXEuHDdLxIynu4AqiMt9CHTkV6UUWo7L1hyMX5iJkHbNEtqYX
         JxeL8ndoSDXURn9VV6hxwgeoA8eDm630m73apAq1ZLI9dqxkWMQk1as2Cv8KfyoUrvzv
         zraQ6dCMp42VDD5Nn66i5AGmLJ6VQIw008jlvjO3ppZyL8j5JtO2WdfhGu1+C4IArtu4
         z3RWSpj4W+cNQkBCD1bCJOqRcy3/VzTuPQvUIYYZot+L1RMhHYlgSgkfW4PJUqG/07e1
         AQmqf63MYrkbUwJT6+JoifFPUh5q3oebxGtEGm6HPlahKTpLauDYx6lZIK2fOT0ZiPq+
         F+fA==
X-Forwarded-Encrypted: i=1; AJvYcCWsXpfMR69k/oNlPFdTTN5GoZSR0j+/lvJEPloGkXc8aGo78kP31v2DFHfeKfzhzeYBQkOOmbGBJKAvtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUiftHCCyPBehjj0WJVylhhmjLOBGteFdBn+8Bd+9495nBsN9+
	ZGCMMc6zmJJo0nru+2W+4aZNMwQScadLligR8IdikJq6yrdUm9fWnvl+x+ykElNpyDPONwEEEkx
	xHrT5t1k=
X-Gm-Gg: ASbGncuvcvHeeoIbQ/y6HFtV/lSINFi+DbNrbmah4QFM4+ACd3Hu1Im3D/dvLaFFjQK
	Awv2Jyz074u4P9bWRXr+Xah1kuM+F2waEN3ib/hmspaHSMjJrK4+KvRSjGtKRmpehaoGZhLpVeX
	W9FVfS9jXiAgywqmRk/8AzynYd+oCV5du5N6+SQTdbj7ys+8g8rrNt5vAsAfU7cLe13/bh9HAuP
	rJslaUEl4B3YkSDcl/eG6NMUzr94wsQn6sejAt8YLBKiZPsj28KcUJHwaSAYlBPeHw4X8/dtdRJ
	JfLBJIQYL0ONWWJaAEbFVidGxiEzU4hQCHlr0OMdG2aJDLCC4zRao2UGOxreBzdXvZfvn5sYhMJ
	Brgy4CjeTpR+8kVzsBqJEe6LiZ3XFAio=
X-Google-Smtp-Source: AGHT+IFNZ2hsCqwSWuixPSJ5R8AD8UK1jdLvj9vYQYk6LtP/Xb8JEeiD65LE64qqMpZvResIz21jAw==
X-Received: by 2002:a05:6a00:140f:b0:742:a111:ee6f with SMTP id d2e1a72fcca58-7490d6dc413mr17698045b3a.10.1750765044971;
        Tue, 24 Jun 2025 04:37:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8871954sm1651063b3a.149.2025.06.24.04.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 04:37:24 -0700 (PDT)
Message-ID: <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
Date: Tue, 24 Jun 2025 13:37:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: namcao@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 linux-rt-devel@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_043726_467724_FB2D03B0 
X-CRM114-Status: GOOD (  12.57  )
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

CgpPbiAyNC8wNi8yMDI1IDA0OjA5LCBNYWNpZWogVy4gUm96eWNraSB3cm90ZToKPiBPbiBNb24s
IDIzIEp1biAyMDI1LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiAKPj4gSSdtIGtpbmQgb2Ygc3Bs
aXQgb24gYSBGaXhlcyB0YWcgaGVyZS4gIE9uZSBjb3VsZCBhcmd1ZSBpdCdzIGEgcmVncmVzc2lv
biwgYXMKPj4gaGF2aW5nIGludGVycnVwdHMgZGlzYWJsZWQgZHVyaW5nIGV4Y2VwdGlvbnMgaXMg
Z29pbmcgdG8gY2F1c2UgYWxsIHNvcnRzIG9mCj4+IHBlcmZvcm1hbmNlIGlzc3VlcyBmb3IgdXNl
cnMuICBTZWVtcyBhIGJpdCByaXNrIHRvIGp1c3QgYmFja3BvcnQsIHRob3VnaC4uLgo+Pgo+PiBU
aGF0IHNhaWQsIGlmIG5vYm9keSBub3RpY2VkIHRoZW4gaXQncyBwcm9iYWJseSBhIGdvb2Qgc2ln
biBub2JvZHkgaXMgcmVhbGx5Cj4+IHBheWluZyBhdHRlbnRpb24gYW5kIHdlIHNob3VsZCBqdXN0
IGJhY2twb3J0IGl0IGJlZm9yZSBhbnlvbmUgbm90aWNlcy4uLgo+IAo+ICBPaCwgc29tZW9uZSBk
aWQgbm90aWNlIGFuZCBpdCdzIG5vdCBvbmx5IHBlcmZvcm1hbmNlLCBjZi4gCj4gPGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvYWxwaW5lLkRFQi4yLjIxLjI1MDEwNzAxNDMyNTAuMTg4ODlAYW5n
aWUub3JjYW0ubWUudWsvPi4KCkkgYWxzbyBoYWQgYSBzZXJpZXMgd2hpY2ggd2FzIGRvaW5nIHNv
IGZvciBtaXNhbGlnbmVkIGFjY2Vzc2VzIGhhbmRsaW5nLApidXQgYWZ0ZXIgZGlzY3Vzc2lvbiwg
aXQgd2FzIG5vdCBvayB0byBkbyBzby46CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDI1MDQyMjA5NDQxOS5HQzE0MTcwQG5vaXN5LnByb2dyYW1taW5nLmtpY2tzLWFzcy5u
ZXQvCgpTbyB0aGlzIHNlcmllcyBzaG91bGQgcHJvYmFibHkgYmUgbW9kaWZpZWQgdG8gb25seSBy
ZWVuYWJsZSBpbnRlcnJ1cHRzCndoZW4gZXhwbGljaXRseSBuZWVkZWQsIGllIHBhZ2UgZmF1bHRz
IGFuZCBmb3IgZm9yY2Vfc2lnX2ZhdWx0KCkuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiAgIE1h
Y2llago+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
