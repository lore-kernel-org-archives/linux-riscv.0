Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEF8C61CE7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 22:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjJWtmo2HsKIHdDpsh19ypBt01F+RuXQqImXHcZG4nI=; b=nocPWovM5Ta1RH
	NBN7L/a6zSR1qNKN1nLVzLX3jAiT8McvpBWT5XVjDxCaxnh7rYlmkapnc5sJj0r6aUjWc9/Tjtv39
	K3pnr8e7PL5vzEv+yL/BpR9/q51Q2E/LwrPbj1WW79pUqewJhWl9w8x3ULCsk0u3rndof5dT9xj9e
	jy9Gcq9ILzqehjqaRXIQG3G/54CNdMeSTiXysq/xUhllyHvIjkrgZUHrL77HcV5yGfMB38ghVJ1ej
	mBv9WK14YHCH49YAXAJIFzGbaKTh6omUC43IStWfHPOTG3tThqfe/pmFi8mxUdKkR9jiLrChL2fS1
	y8HJcYl+PDwNgvRh687Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNf81-000000013Qq-3QmB;
	Fri, 06 Jun 2025 22:01:33 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNf7z-000000013QR-0jCL
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 22:01:32 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so2027587b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 15:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749247290; x=1749852090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ttz69yCGjmx1eoS6euDZxmboEjtbtLBmCyAJgWTUfxI=;
        b=Og/mwNTETcO8reAWf1k8ppkg3MtelEDKo/NWbB/XI/4ivlaOS3wDT3gFXXiuAV/ap1
         YQPYmq6w3zCsBKNGr8RQGzEBX8ZZzhZPUzruK7zzBRTGpld5ig0ctOJYPgh1aJFOLtXp
         FERY0Sl0OtDrjajBX5Tp4ctfT50hoXM7CXBEpnJthS4pxh8pHg6iNaOFidlhor07zlUk
         tUIbxO0l00MpbBEP29l17Rj73KRdihbL7UUoxHFvHDi8wTxPvIfesUiXs1XaBouus44p
         ft+9dMDX1Ls9kNM5aOZkSCQQnuIqyP25OG7uvVRV1JgGod9RZy5pygk2a3avmT1snCtw
         nx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749247290; x=1749852090;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttz69yCGjmx1eoS6euDZxmboEjtbtLBmCyAJgWTUfxI=;
        b=uYHvi9vCewxs2qPqmoEwd353Q+xQFQhvX/1DP3I3SAAne07VFhgf8r3K+ce3UVa1LW
         Kht/XFPJqZkpEHpuib4RQzxNvE3n8DyZ59JQcnVP2L2n4lhhvDfPp+romCYVYcRcVDKS
         kNWL0UHt9cui1xbUmw5fyfZvbxq36N+zKgJyiKmjdkI3m0zmv4odsY9Djx2IH+uFh+GS
         VCKqsTeyGSUxAPE9JT6/6pSRClv/WoJNNlZ5BB0bc05ay8JORlIpEqxWpCpUF2IpYuJJ
         jCVeD4Ot6Lrw83wrYygwzl+OGQVxc1UwUJtdUPjdoCSh5bKASDotdp2rTNFULUmV7dm+
         rRyA==
X-Forwarded-Encrypted: i=1; AJvYcCXrFYTvyBmPo0LKtqoFFVRNokxac5JSyjV44o8snpqNGsI5WGoOcFny+jEDoRvPmkMOPvBP7jB+0tttGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxniAfpqa7+UMB5cJl+puf5plkiKObPiJa6dzH0nABkJN1ZLY4+
	NbM2MWDPaSK52N7JW7Ma0hS4SBF+ruzCIeqLD4p5mNUYI4p5CbheafTFBUiIX5NFpDg=
X-Gm-Gg: ASbGncuk0z/rKgmmNKwI8P2YLAdSIxJeGGvpFVA80prMgYQgVPhz6MXszzMaVOC0TMc
	NV7esoY/BfIX5BuM9xnnhUlcJNr6mhv+VuhaJeoHjxC/DJqool6yThtsop2NUs+2X0g3wXYOKI5
	V+JPcjret74EgBw6OdT6NjhMHX+0jJFbzcAFXJ2gzkTSFBDoH8qZmDGKAP7qw4FrsR4p0QnMiQi
	EFYpHje/djBA88WrwRMvntTrxk6zJjnLMYq3httW//DxNGWBdBk4+YKMusdVsTus5VSpEPpfiI8
	13zWyQRlBBvEwSfTFl+YueIh6hjXbWBsxlUdk4KCjRy16vrxxAcN
X-Google-Smtp-Source: AGHT+IEj0bI/X4A5eYGCGK7otcSqbGkj9CDQTq42iS/whU8gXRUwR+/Nu3j77R8mBiu+iyqv60iFhw==
X-Received: by 2002:a05:6a20:430c:b0:21a:de8e:44b4 with SMTP id adf61e73a8af0-21ee25555eamr6427245637.16.1749247289679;
        Fri, 06 Jun 2025 15:01:29 -0700 (PDT)
Received: from [10.0.16.165] ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ed58e9bsm1632595a12.10.2025.06.06.15.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 15:01:29 -0700 (PDT)
Message-ID: <94f9af73-0b2d-484c-ba1d-d4435908336b@rivosinc.com>
Date: Fri, 6 Jun 2025 15:01:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the getrandom syscall wrapper
To: Xi Ruoyao <xry111@xry111.site>, Alexandre Ghiti <alex@ghiti.fr>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
 <20250606092443.73650-2-xry111@xry111.site>
From: Vineet Gupta <vineetg@rivosinc.com>
Content-Language: en-US
In-Reply-To: <20250606092443.73650-2-xry111@xry111.site>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_150131_455335_4352609A 
X-CRM114-Status: GOOD (  18.07  )
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

T24gNi82LzI1IDAyOjI0LCBYaSBSdW95YW8gd3JvdGU6Cj4gQXMgcmVjZW50bHkgcG9pbnRlZCBv
dXQgYnkgVGhvbWFzLCBpZiBhIHJlZ2lzdGVyIGlzIGZvcmNlZCBmb3IgdHdvCj4gZGlmZmVyZW50
IHJlZ2lzdGVyIHZhcmlhYmxlcywgYW1vbmcgdGhlbSBvbmUgaXMgdXNlZCBhcyAiKyIgKGJvdGgg
aW5wdXQKPiBhbmQgb3V0cHV0KSBhbmQgYW5vdGhlciBpcyBvbmx5IHVzZWQgYXMgaW5wdXQsIENs
YW5nIHdvdWxkIHRyZWF0IHRoZQo+IGNvbmZsaWN0aW5nIGlucHV0IHBhcmFtZXRlcnMgYXMgdW5k
ZWZpbmVkIGJlaGF2aW91ciBhbmQgb3B0aW1pemUgYXdheQo+IHRoZSBhcmd1bWVudCBhc3NpZ25t
ZW50Lgo+Cj4gUGVyIGFuIGV4YW1wbGUgaW4gdGhlIEdDQyBkb2N1bWVudGF0aW9uLCBmb3IgdGhp
cyBwdXJwb3NlIHdlIGNhbiB1c2UgIj0iCj4gKG9ubHkgb3V0cHV0KSBmb3IgdGhlIG91dHB1dCwg
YW5kICIwIiBmb3IgdGhlIGlucHV0IGZvciB0aGF0IHdlIG11c3QKPiByZXVzZSB0aGUgc2FtZSBy
ZWdpc3RlciBhcyB0aGUgb3V0cHV0LiAgQW5kIEdDQyBkZXZlbG9wZXJzIGhhdmUKPiBjb25maXJt
ZWQgdXNpbmcgYSBzaW1wbGUgInIiICh0aGF0IHdlIHVzZSBmb3IgbW9zdCB2RFNPIGltcGxlbWVu
dGF0aW9ucykKPiBpbnN0ZWFkIG9mICIwIiBpcyBhbHNvIGZpbmUuCj4KPiBMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA2MDMtbG9vbmdhcmNoLXZkc28tc3lzY2FsbC12MS0x
LTZkMTJkNmRmYmRkMEBsaW51dHJvbml4LmRlLwo+IExpbms6IGh0dHBzOi8vZ2NjLmdudS5vcmcv
b25saW5lZG9jcy9nY2MtMTUuMS4wL2djYy9Mb2NhbC1SZWdpc3Rlci1WYXJpYWJsZXMuaHRtbAo+
IExpbms6IGh0dHBzOi8vZ2NjLmdudS5vcmcvcGlwZXJtYWlsL2djYy1oZWxwLzIwMjUtSnVuZS8x
NDQyNjYuaHRtbAo+IENjOiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGlu
dXRyb25peC5kZT4KPiBDYzogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgo+
IFNpZ25lZC1vZmYtYnk6IFhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPgo+IC0tLQo+Cj4g
djEgLT4gdjI6IEtlZXAgdXNpbmcgInIiIGZvciBidWZmZXIgdG8gZm9sbG93IHRoZSBleGlzdGlu
ZyBjb252ZW50aW9uCj4gKHRoYXQgdGhlIEdDQyBkZXZlbG9wZXJzIGhhdmUgY29uZmlybWVkIGZp
bmUpLgo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaCB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oCj4gaW5kZXggOGRjOTI0NDE3MDJhLi5j
NmQ2Njg5NWMxZjUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dl
dHJhbmRvbS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5o
Cj4gQEAgLTE4LDcgKzE4LDcgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBzc2l6ZV90IGdldHJh
bmRvbV9zeXNjYWxsKHZvaWQgKl9idWZmZXIsIHNpemVfdCBfbGVuLCB1bnMKPiAgCXJlZ2lzdGVy
IHVuc2lnbmVkIGludCBmbGFncyBhc20oImEyIikgPSBfZmxhZ3M7Cj4gIAo+ICAJYXNtIHZvbGF0
aWxlICgiZWNhbGxcbiIKPiAtCQkgICAgICA6ICIrciIgKHJldCkKPiArCQkgICAgICA6ICI9ciIg
KHJldCkKPiAgCQkgICAgICA6ICJyIiAobnIpLCAiciIgKGJ1ZmZlciksICJyIiAobGVuKSwgInIi
IChmbGFncykKPiAgCQkgICAgICA6ICJtZW1vcnkiKTsKCk15IDIgY2VudHMgYXMgSSd2ZSBkYWJi
bGVkIGludG8gdGhpcyBmb3IgQVJDIGdsaWJjIHN5c2NhbGwgbWFjcm9zIFsxXSB3aGVyZSByMApp
cyBib3RoIHRoZSBmaXJzdCBzeXNjYWxsL2Z1bmN0aW9uIGFyZyBhbmQgYWxzbyB0aGUgZnVuY3Rp
b24vc3lzY2FsbCByZXR1cm4uCgpUaGUgdjIgYXBwcm9hY2ggc3RpbGwga2VlcHMgMiBkaWZmZXJl
bnQgdmFyaWFibGVzIGluIHNhbWUgbG9jYWwgcmVnIHdoaWNoIGhhcwpwb3RlbnRpYWwgZm9yIGFu
eSBmdXR1cmUgY29tcGlsZXIgc2hlbmFuaWdhbnMuClNlZ2hlcidzIGV4YW1wbGUgYXZvaWRlZCBz
cGVjaWZ5aW5nIHRoZSBzYW1lIHJlZy4KV2hhdCBhYm91dCBzb21ldGhpbmcgbGlrZSB0aGUgZm9s
bG93aW5nOiBzZWVtcyB0byBnZW5lcmF0ZSB0aGUgcmlnaHQgY29kZSAod2l0aApnY2MgMTUpCgrC
oMKgwqDCoMKgwqAgcmVnaXN0ZXIgbG9uZyByZXQgYXNtKCJhMCIpOwrCoMKgwqDCoMKgwqAgcmVn
aXN0ZXIgbG9uZyBuciBhc20oImE3IikgPSBfX05SX2dldHJhbmRvbTsKwqDCoMKgwqDCoMKgIHJl
Z2lzdGVyIHNpemVfdCBsZW4gYXNtKCJhMSIpID0gX2xlbjsKwqDCoMKgwqDCoMKgIHJlZ2lzdGVy
IHVuc2lnbmVkIGludCBmbGFncyBhc20oImEyIikgPSBfZmxhZ3M7CsKgwqDCoMKgwqDCoCByZXQg
PSAodW5zaWduZWQgbG9uZykgX2J1ZmZlcjsKCsKgwqDCoMKgwqDCoCBhc20gdm9sYXRpbGUgKCJl
Y2FsbFxuIgrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogIityIiAo
cmV0KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLy8ga2VlcCAiK3IiCmZvciBpbnB1dCBfYnVmZmVyIC8gb3V0cHV0IHJldArC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogInIiIChuciksICJyIiAo
bGVuKSwgInIiIChmbGFncykKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA6ICJtZW1vcnkiKTsKCsKgwqDCoMKgwqDCoCByZXR1cm4gcmV0OwoKVGh4LAotVmluZWV0Cgpb
MV0gaHR0cHM6Ly9naXRodWIuY29tL2JtaW5vci9nbGliYy9ibG9iL21hc3Rlci9zeXNkZXBzL3Vu
aXgvc3lzdi9saW51eC9hcmMvc3lzZGVwLmgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
