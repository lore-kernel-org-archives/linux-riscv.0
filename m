Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9729DC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldk/YvkbmGYT7ScuqjGy/ckumyq09hZLS/Z8ipN/PAc=; b=zRZqDq/vfulbqF
	IXFCSwTr9UMfVTJ7kx049HRubVdLEMzZCA1okkIfrRaMVIYPgXgeQ3AXhcqEotlqvcrvrjYbgOUPu
	25TTqUGUXqKNe/bUUHpzuQaQJ3/deNDz4jE88NAQcQ83wABgGOLuUN2oao6cy5rdJWKa3SVY8vu7N
	C6/9XVW7Vrnp3AD59xp1lmJ6pV46hwHauc4i0Ojot3sS4u4IVG7UBIkajPRik8fEES1W8DUuzDyQA
	rfU9YfnptV35opV99lTqy4OfllgkEwoxbDDn4xg1aDTP84nawtRPfdlwJ9Bx5dOw+JtI3Zc1Mv0FW
	XK8wrNcrU8gQ/X9uDwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKCoS-000000045La-3VfN;
	Thu, 20 Jun 2024 08:06:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKCoP-000000045KL-2QBy
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 08:06:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f98cd743b0so96755ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 01:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718870788; x=1719475588; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exxCmNisYIiHsonIuEmQnhq8929ewEgsNh/K3XrANwA=;
        b=Ph7eS1H8YbsbULi3QbznP7/E8XV8RdAbga1z6UW+OT6yoQuUk0cDi/WKw0p4FtVNbL
         I2XHufi9uqGmFlKDPGgGMC9g+RAVbqA5egbfK8K7TmCDmw/PC3ONRjRaLbMX196/Tg7y
         2oYhmzE4kWznH56Jv3yeRBu0AL06MCHccnLkw6bXkbkUHiD5ha+b6ZaXWuV2ivzsxMkn
         mk3SGdBfu2xlr8fWIYvh5kgEzUJ3mJKfjsCR8Lwr3XK9UzF9XmEzimkImyAfaFuxSBE5
         yO5qpS6hI5ZAatRCMm0fsIt6oQrYotKoP1av8t2Wf6ms6BrC+6lT3Li4kGcw8hc9fUPZ
         MjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718870788; x=1719475588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exxCmNisYIiHsonIuEmQnhq8929ewEgsNh/K3XrANwA=;
        b=bMv0AXgEzmTo0PqrCBM66Sa2ZGypUuMzhw5GlRCqDZyE/nn4AbqoIr9w1bfOrAUxtL
         t1M/kfq8q5ECnaFCDuhvYdoz3IXN734imJVvYf4xrrANm7e6IC4+KgHrgxnl569ci9kR
         jR5z3kvp41kzetQu6a+fyFoYJS3Ddx+fmqSsNI7sA8TfQcbtSrCzgpvvmVeVVhrrumS2
         Qsdn8ahCgbeIllIlbkzVNQrVZRWG21nI5mrYZ9BW0PzT+8BL0nlEf+kTwx4hEixJgxOC
         dkjjvhsmM5m4sFUn57LWUqdVlIf/jSLpFlp2VCAhxHgjm7+jOJV85WNLN/M4Ro8QMl3V
         /GiA==
X-Forwarded-Encrypted: i=1; AJvYcCVfDHsjh1UbKpreQXAm2NAjhUdxHrvS7To8DyLHP3kMMfxy5lbyrKCB44O0puAGM4p4plC0K5NMtewqR3OgU4JB2ldeNnRFR1g1lgq4dbPD
X-Gm-Message-State: AOJu0Ywst+V49zHDiTBDN+w4CScnjiyo/pN9T8MDNWRl7P9wZ2Vh9pFF
	dCAV1kqcPhLFpQ+WF7CuIqWpabEHuQ/wQPy0DXiljX6nnb4zbcD2HnbSJHh92qQ=
X-Google-Smtp-Source: AGHT+IHNixGnAOroozEEVABH50xx3qDhURAPZcq/Ej7yCRxPjsGlm6bITccu4Lo4UqUle+I5x6nCaA==
X-Received: by 2002:a17:903:2291:b0:1f6:ee76:1b35 with SMTP id d9443c01a7336-1f9aad7d3ddmr47193385ad.5.1718870787905;
        Thu, 20 Jun 2024 01:06:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6944:2115:e2ed:b038? ([2a01:e0a:999:a3a0:6944:2115:e2ed:b038])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9d6b45389sm4079855ad.216.2024.06.20.01.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 01:06:27 -0700 (PDT)
Message-ID: <95a081a9-2307-4e5b-8ae2-082be16b327e@rivosinc.com>
Date: Thu, 20 Jun 2024 10:06:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] riscv: convert bottom half of exception handling to C
To: Cyril Bur <cyrilbur@tenstorrent.com>, Deepak Gupta <debug@rivosinc.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240616170553.2832-1-jszhang@kernel.org>
 <20240616170553.2832-4-jszhang@kernel.org>
 <ZnMPhcaTKFRbbE1i@debug.ba.rivosinc.com>
 <CANtDSipXbYSuz6NakbXw-8k0_ZN5hdT7VWMushXvQ5VB0Am_Ng@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CANtDSipXbYSuz6NakbXw-8k0_ZN5hdT7VWMushXvQ5VB0Am_Ng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_010629_717865_48920EA1 
X-CRM114-Status: GOOD (  16.19  )
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

CgpPbiAyMC8wNi8yMDI0IDAyOjAyLCBDeXJpbCBCdXIgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMjAs
IDIwMjQgYXQgMzowNOKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPiB3cm90
ZToKPj4KPj4gT24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMDE6MDU6NTBBTSArMDgwMCwgSmlzaGVu
ZyBaaGFuZyB3cm90ZToKPj4+IEZvciByZWFkYWJpbGl0eSwgbWFpbnRhaW5hYmlsaXR5IGFuZCBm
dXR1cmUgc2NhbGFiaWxpdHksIGNvbnZlcnQgdGhlCj4+PiBib3R0b20gaGFsZiBvZiB0aGUgZXhj
ZXB0aW9uIGhhbmRsaW5nIHRvIEMuCj4+Pgo+Pj4gTW9zdGx5IHRoZSBhc3NlbWJseSBjb2RlIGlz
IGNvbnZlcnRlZCB0byBDIGluIGEgcmVsYXRpdmVseQo+Pj4gc3RyYWlnaHRmb3J3YXJkIG1hbm5l
ci4KPj4+Cj4+PiBIb3dldmVyLCB0aGVyZSBhcmUgdHdvIG1vZGlmaWNhdGlvbnMgSSBuZWVkIHRv
IG1lbnRpb246Cj4+Pgo+Pj4gMS4gdGhlIENTUl9DQVVTRSByZWcgcmVhZGluZyBhbmQgc2F2aW5n
IGlzIG1vdmVkIHRvIHRoZSBDIGNvZGUKPj4+IGJlY2F1c2Ugd2UgbmVlZCB0aGUgY2F1c2UgdG8g
ZGlzcGF0Y2ggdGhlIGV4Y2VwdGlvbiBoYW5kbGluZywKPj4+IGlmIHdlIGtlZXAgdGhlIGNhdXNl
IHJlYWRpbmcgYW5kIHNhdmluZywgd2UgZWl0aGVyIHBhc3MgaXQgdG8KPj4+IGRvX3RyYXBzKCkg
dmlhLiAybmQgcGFyYW0gb3IgZ2V0IGl0IGZyb20gcHRfcmVncyB3aGljaCBhbiBleHRyYQo+Pj4g
bWVtb3J5IGxvYWQgaXMgbmVlZGVkLCBJIGRvbid0IGxpa2UgYW55IG9mIHRoZSB0d28gc29sdXRp
b25zIGJlY2FzZQo+Pj4gdGhlIGV4Y2VwdGlvbiBoYW5kbGluZyBzaXRzIGluIGhvdCBjb2RlIHBh
dGgsIGV2ZXJ5IGluc3RydWN0aW9uCj4+PiBtYXR0ZXJzLgo+Pgo+PiBDQzogQ2xlbWVudC4KPj4K
Pj4gSSB0aGluayBpdHMgYmV0dGVyIHRvIHNhdmUgYXdheSBjYXVzZSBpbiBwdF9yZWdzIHByaW9y
IHRvIGNhbGxpbmcKPj4gYGRvX3RyYXBzYC4gT25jZSBjb250cm9sIGlzIHRyYW5zZmVycmVkIHRv
IEMgY29kZSBpbiBgZG9fdHJhcHNgLAo+PiBhbm90aGVyIHRyYXAgY2FuIGhhcHBlbi4gSXQncyBh
IHByb2JsZW0gYW55d2F5cyB0b2RheSB3aXRob3V0IENQVSBzdXBwb3J0Lgo+Pgo+PiBBbHRob3Vn
aCB3aXRoIFNzZGJsdHJwIFsxXSBleHRlbnNpb24gYW5kIGl0IGtlcm5lbCBzdXBwb3J0IFsyXSBm
b3IgaXQsCj4+IEkgZXhwZWN0IGFzbSBjb2RlIHdvdWxkIGNsZWFyIHVwIGBTRFRgIGJpdCBpbiBt
c3RhdHVzLiBXaGVuZXZlciBgU3NkYmx0cnBgIGxhbmRzLAo+PiBJIHRoaW5rIGBkb190cmFwc2Ag
c2hvdWxkIGV4cGVjdCBuZXN0aW5nIG9mIHRyYXBzIGFuZCB0aHVzIGNhdXNlIHNob3VsZCBiZSBz
YXZlZAo+PiBhd2F5IGJlZm9yZSBpdCBnZXRzIGNvbnRyb2wgc28gdGhhdCBzYWZlbHkgdHJhcHMg
Y2FuIGJlIG5lc3RlZC4KCkhpLAoKSW5kZWVkLCBldmVyeSByZWdpc3RlciB0aGF0IGlzICJ1bmlx
dWUiIHRvIGEgdHJhcCBhbmQgdGhhbiBjYW4gYmUKb3ZlcndyaXR0ZW4gYnkgYSBzZWNvbmQgdHJh
cCBzaG91bGQgYmUgc2F2ZWQgYmVmb3JlIHJlZW5hYmxpbmcgdGhlbSB3aGVuCnVzaW5nIFNzZGJs
dHJwLiBTbyB0aGF0IHdvdWxkIGJlIG5pY2UgdG8gcHJlc2VydmUgdGhhdC4KCj4+Cj4gCj4gSXMg
YSBwb3NzaWJsZSBzb2x1dGlvbiB0byBkbyBib3RoIG9wdGlvbnMgSmlzaGVuZyBzdWdnZXN0ZWQ/
IFNhdmUgdGhlCj4gY2F1c2UgYmVmb3JlCj4gY2FsbGluZyBkb190cmFwcyBidXQgYWxzbyBwYXNz
IGl0IHZpYSBzZWNvbmQgcGFyYW0/CgpJIGd1ZXNzIHNvIGlmIGl0IGZpdHMgeW91ciBwZXJmb3Jt
YW5jZSByZXF1aXJlbWVudHMuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPj4gWzFdIC0gaHR0cHM6
Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWRvdWJsZS10cmFwL3JlbGVhc2VzL2Rvd25sb2FkL3Yx
LjAtcmMxL3Jpc2N2LWRvdWJsZS10cmFwLnBkZgo+PiBbMl0gLSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNDA0MTgxMzM5MTYuMTQ0MjQ3MS0xLWNsZWdlckByaXZvc2luYy5jb20vCj4+
Cj4+Pgo+Pj4gMi5UbyBjb3BlIHdpdGggU0lGSVZFX0NJUF80NTMgZXJyYXRhLCBpdCBsb29rcyBs
aWtlIHdlIGRvbid0IG5lZWQKPj4+IGFsdGVybmF0aXZlIG1lY2hhbmlzbSBhbnkgbW9yZSBhZnRl
ciB0aGUgYXNtLT5jIGNvbnZlcnRpb24uIEp1c3QKPj4+IHJlcGxhY2UgdGhlIGV4Y3BfdmVjdF90
YWJsZSB0d28gZW50cmllcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxq
c3poYW5nQGtlcm5lbC5vcmc+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
