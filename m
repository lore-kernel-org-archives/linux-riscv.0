Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A519C5B543
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 11:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvC5LANHEMjnhclFmnewftfgv9Vt5XsnLNiM5q6Nu+g=; b=ZtFtp2bGTLHLm5
	4e1NMI+Xj1VBwSUFp59dCpzEKisMCsNf3sMInDeU8B3x+FfcMHwhX6rrfqS7IW7RQJuWdsgQyK6B1
	LkRCri9Inyw3r7GZ121nuL3/u7q9Gt8ZqVrcm3PnFVpTDKIiZBs7Bfx6PcO/KeJQrKAxg6ovD+s5I
	dTuWfHggqxJKDiOwoohAshC5tNoNSZrpylDskxb8+2jtp1hhAEXTFSAHIis/OEE6lefLYJgB2L36y
	gg4DWqH5OIlNnozisGXLUh/t5sQ3TAs86mhUwoHQO0mfSGkHEHJIChX/UFch56lJlGjAu3Q+I/HjZ
	2eWsWrV0C2hE0TkCAZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxcT-00000000MPy-3bIG;
	Fri, 30 May 2025 11:09:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxcQ-00000000MOM-3rHE
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 11:09:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so277730f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 May 2025 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748603385; x=1749208185; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKHlHU74s9id5ECnlxromIqBTzfUbM5l+HheDzzqFcg=;
        b=K/NIuDq71XG/rmc5YIhJVSgPT780dd2E1irmLc5qW9HGz9I1RRgPrak8Voy/puaUQc
         mYxKWXaPyNTew5V/lK6N8vjk3Setc67PmcVyWms203mCBTO4guBXMDmq4B6JZwCkWtiJ
         OWUWatd+kK4S55RfBtg/4mr1x/i9zSrIjhikCcJax544QspzVHY4I6r19HfAs7ofQM4q
         zCO0nqSu2LF9AzaDqm+nvmh3l+aCTYzS8jl4on7NRM0flamlDqyKvLMXDP4DOKVGJw76
         6zQAOvucgvbKuBuvN2JXMDaJCsUT/NjPlAOjtmAvxyENJRPPNuVe8CkJCYEMYdOkFyam
         taJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603385; x=1749208185;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nKHlHU74s9id5ECnlxromIqBTzfUbM5l+HheDzzqFcg=;
        b=PSErgczz5fw1fvaeRZDVf5J27rN6vlbZgGb1YqeAHr7C/pc2nl687IhmyWreDpP13e
         ULTHYsVp3vQZ81ywGaNQF3kCtbDuPf91zWzVjW5wwSx6pPw0bjilXZH/RdXI8LWhy476
         Mz2rz4QUGCeTsx0b8deow1YMMLC0Hn00KnPWZEFfsgPWdm58mTIY1Jca5ycIrFhzsAhy
         9ByB1Cbd4bukCjc2rpaKiE/QsJqNqIW2226I46e6mJ7ZyNyaVx1XK490A+5I9HoEI5Iw
         itXyz3WNiGbooGuReQP8FNApUhfBYoC9scpxC3O5ipMiQ03y6r6amjLycJ+ntnjthrtc
         g37w==
X-Forwarded-Encrypted: i=1; AJvYcCWeoIj82nZ8A+RgUsFdgepz73646yGjZmCtQlnl88n1/uh6MjlHcs/ierxgtp0QRdTHB0Qp240CI/DhRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaDBlUQ9lRoHZWReL0Udv597dkhzUWpON08Wx7M3qncO/dTtfP
	JWFEM/3lCA86q4OAfATG/zMK471wm0CbkUVuaUXC7gOrUc9l/2+0J7QT27rVA5gEXAU=
X-Gm-Gg: ASbGnctfiMZ1kUkUmIl+PcEPXAfXwT2Fiaqk9QoAVJxUEHfELxsr+y39bL674eH0dfV
	UbBblq8q7+Y/B7zTmHlPHm4ZDruMfQgjwnZP+ORyHPZKgIyR9QIjnNjZE/zOaAHaEjtc1TBM+nw
	VXfzrK9+92jF9/cT6Ml3iFz7DaEiYpmoHmZKyqvAEMWCetFxLtuCD0RjaD9qoV5DhcL6A5JWt9m
	RKWd1XpL5M+dodSooyGUth+xtHwNNiQY2K56F6G6Malls4gDzi5x4j4+IIHA8A+vIK9et6tK4vZ
	dy9Lt3vpSbIbtIR+j1wZuTylafPQfvBVjkSQIINVGw9Sc23WvQTcDVRcOsM=
X-Google-Smtp-Source: AGHT+IHWlRXsHj8fy3YljEwKBbucuDh540moRSz1XXe7HUhMOymhGLaK6eZjYnDZtJV/6QwPDY4NXA==
X-Received: by 2002:a05:6000:228a:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3a4f7ab6c2fmr730169f8f.14.1748603384676;
        Fri, 30 May 2025 04:09:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:23dc:ac4e:5f79:355b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972c1sm4593368f8f.68.2025.05.30.04.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:09:44 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 30 May 2025 13:09:43 +0200
Message-Id: <DA9G60UI0ZLC.1KIWBXCTX0427@ventanamicro.com>
To: "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: "Anup Patel" <anup@brainfault.org>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
 <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
In-Reply-To: <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_040946_951183_65F22435 
X-CRM114-Status: GOOD (  10.81  )
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

MjAyNS0wNS0yOVQxMTo0NDozOC0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS8yOS8yNSAzOjI0IEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+IEkg
b3JpZ2luYWxseSBnYXZlIHVwIG9uIHRoZSBpZGVhLCBidXQgSSBmZWVsIGtpbmRhIGJhZCBmb3Ig
RHJldyBub3csIHNvCj4+IHRyeWluZyBhZ2FpbjoKPgo+IEkgYW0gc29ycnkgaWYgc29tZSBvZiBt
eSByZXBsaWVzIGNhbWUgYWNyb3NzIGluIHRoZSB3cm9uZyB3YXkuIFRoYXQgd2FzIAo+IG5ldmVy
Cj4gdGhlIGludGVudGlvbi4KCkkgZGlkbid0IG1lYW4gdG8gYWNjdXNlIHlvdSwgbXkgYXBvbG9n
aWVzLiAgSSBhZ3JlZSB3aXRoIERyZXcncwpwb3NpdGlvbnMsIHNvIHRvIGV4cGFuZCBvbiBhIHF1
ZXN0aW9uIHRoYXQgd2Fzbid0IHRvdWNoZWQgaW4gaGlzIG1haWw6Cgo+PiBFdmVuIGlmIHVzZXJz
cGFjZSB3YW50cyBTQkkgZm9yIHRoZSBNLW1vZGUgaW50ZXJmYWNlLCBzZWN1cml0eSBtaW5kZWQK
PiBUaGlzIGlzIHByb2JhYmx5IGEgM3JkIG9uZSA/IFdoeSB3ZSB3YW50IE0tbW9kZSBpbnRlcmZh
Y2UgaW4gdGhlIHVzZXIgCj4gc3BhY2UgPwoKSXQgaXMgYWJvdXQgdHVybmluZyBLVk0gaW50byBh
biBJU0EgYWNjZWxlcmF0b3IuCgpBIGd1ZXN0IHRoaW5rcyBpdCBpcyBydW5uaW5nIGluIFMvSFMt
bW9kZS4KVGhlIGVjYWxsIGluc3RydWN0aW9uIHRyYXBzIHRvIE0tbW9kZS4gIFJJU0MtViBIIGV4
dGVuc2lvbiBkb2Vzbid0CmFjY2VsZXJhdGUgTS1tb2RlLCBzbyB3ZSBoYXZlIHRvIGVtdWxhdGUg
dGhlIHRyYXAgaW4gc29mdHdhcmUuCgpUaGUgSVNBIGRvZXNuJ3Qgc2F5IHRoYXQgTS1tb2RlIG1l
YW5zIFNCSS4gIFdlIHRyeSByZWFsbHkgaGFyZCB0byBoYXZlClNCSSBvbiBhbGwgUklTQy1WLCBi
dXQgSSB0aGluayBLVk0gaXMgdGFraW5nIGl0IGEgYml0IHRvbyBmYXIuCgpXZSBjYW4gZGlzY3Vz
cyBob3cgYmVzdCB0byBkZXNjcmliZSBTQkksIHNvIHVzZXJzcGFjZSBjYW4gY2hvb3NlIHRvCmFj
Y2VsZXJhdGUgdGhlIE0tbW9kZSBpbiBLVk0sIGJ1dCBJIHRoaW5rIHRoYXQgdGhlIGFiaWxpdHkg
dG8gZW11bGF0ZQpNLW1vZGUgaW4gdXNlcnNwYWNlIHNob3VsZCBiZSBwcm92aWRlZC4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
