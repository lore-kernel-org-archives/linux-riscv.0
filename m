Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3E9C5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKVMVho3Rdh1GX8c+F3aW4IWYO7FCuckbKLBRkvmIlM=; b=SznZ7ZMnDg08y9
	bjI/vKs8P9+yqsk5oQJn9HP+axPyMZ+gqnIevTdJpVLHwKyy5fR+ZVWuDaKqKds6mPQayc0FYPPQc
	C4JSw9cpT5fVENcuavnp9Lqp7VPGgpDO4f6H3wi6FT/pxwFaGYckH4pclfhhgVg9mxBM78Qt8B35F
	RYnJjgPSU19kHfsa9FzdP1CktBSb8BVmpUDqVY2vQFNhquk2RKyJECETTq741N/Y1hNU61eXMXsgr
	OcT7UYpNodYLYHx6BlfCxXjtB+/uuZ1a6WxCuF22Q+ySVpkP7liL+e5hmv0kjJr49ik4ujOWRFgHl
	pcdE9FA+TOFwFuZoL6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzVw-00000006u5X-1US3;
	Mon, 02 Jun 2025 07:23:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzSY-00000006tlL-0ghb
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 07:19:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a510432236so43160f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748848788; x=1749453588; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOxHpRhHAkShbULd5W1bUWm0AU1brFulo4kSIXRYEzo=;
        b=u2hUE61fLAvbkbaAdiWc4VHeaWnI0x44d+RY3uIQ89FsJN0EDkFXUefXb/T2zRKBjq
         oDoHSeDhAamLG4HvPrkgxJ5Ox2n7SHFsKors4rgZkhFi+kYD2SMaCFW65iP12XLrHaxJ
         +gU1cTp6P32Y4rPwoYdRoNMb2HLv6CHSsz2I2IvnsimZNk7fPopeJfEp866TlWSjMw4i
         Vsxa5k0KiQo/N+Ei2V9jhyhsawKQNiGnckKgKUokTCqZ0K7oWS1AEkIetJtudDdIqb+W
         ftxxK/EoBNnkgbn4Gj5QNN8P3ut8kGFxZ+DV05KVAhZJ5M3oHQtOoa3mWQdRnbYTp7fo
         GdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748848788; x=1749453588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOxHpRhHAkShbULd5W1bUWm0AU1brFulo4kSIXRYEzo=;
        b=Evz5LJyTWU2UrAdE8mdoww/ejfmRSgHTqlivZJxs2jaBCG//5sdfS6kKLyxaxoyBGt
         24Ur1w0UX+lvqNjpEsDP2imawfNlixcjVYEORMzhyQOGzROQ3REk4S4hZfNimUhw15dC
         Fnga54iBpTFKnheeFPl5R44jAHmoUd2n6EwA0r01sFx7bfPV9nBwK/KBxPS2Pbx7IEaA
         DQxfUOgkmJXiqxVNoYtbn9Vs2vu++b8JnVLoSAwdXP+2dGeZ4XVY/u2X57PesAK0ktCn
         pxVS43x29VehlEhGLK2WkMeVd9rTmcFR7KB4s8l9PKOpxCbPHn5/OqjTOh/t7COkjeb+
         XHig==
X-Forwarded-Encrypted: i=1; AJvYcCVkhghz5Wd1T+UDIB9iQqhWAOaSzPnfwGQQyrau1cvx2KHmF3nE2ASauaidPNQtDeXAPcPv/RkHsUe6qw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzY7Cia6KmE5+HVzaErJExT0NpYeFFGqTysVPtqzct+0bnOGWMz
	IaM+XubocimpeutD0DYeWVncQD2oHRSgJTh0jOwv0Ehqtp3U5edVw0xqYh57fvACf8s=
X-Gm-Gg: ASbGncsXcrcjB6KcM4vCDN5nJ8vS4I/diSReloNniTYJ4a3jzWrwWcPlgGS8ZRO7j0j
	oMsc7S4gfIZ1TFKDZtNh2Z4DTzLLl4hsLJFU7wvDy5bMZgCvolMhsKx0LC5Qon4Jyn0CWxTZtTm
	7I7uGpCLWUQEmAGK95w/FF3AXAuVETyNiIOXxcTkq7C54PBPu6sMJj+Qgx06lt4JkgUQaN/I0QR
	Ahz/POef+yCGQTT2a7d8BXlECGMRzbXj2/puE8/G5JnrzaWpt+XQ/DO7vw+WUxE74nbeBVmBPgu
	K+nx6LW9Ab+u6SDLpK1YjQopspT9RQEMikjFltrfZ5yy86Wv8nAVNf3yfGDUIr5DTyMNriiswh0
	16mbb60d134bR0xZ3Uwin4TbMqEXkCgo=
X-Google-Smtp-Source: AGHT+IHCNj7REvqqY8roqc3kPzLUtcFHNSZjWN6JJo9xurc0o9AVBRs0XMw1qKlgapNbrolzs4DH+w==
X-Received: by 2002:a5d:588a:0:b0:3a4:d79a:35a6 with SMTP id ffacd0b85a97d-3a4fe178e45mr5008440f8f.14.1748848787851;
        Mon, 02 Jun 2025 00:19:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb7dafsm109293255e9.25.2025.06.02.00.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 00:19:46 -0700 (PDT)
Message-ID: <01a5ab11-ed87-4d30-a162-987db34e6483@rivosinc.com>
Date: Mon, 2 Jun 2025 09:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] riscv: misaligned: fix misaligned accesses handling
 in put/get_user()
To: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <1aefb8dc-9145-4cee-b262-7d4212159444@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <1aefb8dc-9145-4cee-b262-7d4212159444@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_001950_291221_1C1F81B1 
X-CRM114-Status: GOOD (  19.15  )
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

CgpPbiAzMS8wNS8yMDI1IDE1OjMyLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gT24gNS8zMC8y
NSAyMjo1NiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBXaGlsZSBkZWJ1Z2dpbmcgYSBmZXcg
cHJvYmxlbXMgd2l0aCB0aGUgbWlzYWxpZ25lZCBhY2Nlc3Mga3NlbGZ0ZXN0LAo+PiBBbGV4YW5k
cmUgZGlzY292ZXJlZCBzb21lIGNyYXNoIHdpdGggdGhlIGN1cnJlbnQgY29kZS4gSW5kZWVkLCBz
b21lCj4+IG1pc2FsaWduZWQgYWNjZXNzIHdhcyBkb25lIGJ5IHRoZSBrZXJuZWwgdXNpbmcgcHV0
X3VzZXIoKS4gVGhpcwo+PiB3YXMgcmVzdWx0aW5nIGluIHRyYXAgYW5kIGEga2VybmVsIGNyYXNo
IHNpbmNlLiBUaGUgcGF0aCB3YXMgdGhlCj4+IGZvbGxvd2luZzoKPj4gdXNlciAtPiBrZXJuZWwg
LT4gYWNjZXNzIHRvIHVzZXIgbWVtb3J5IC0+IG1pc2FsaWduZWQgdHJhcCAtPiB0cmFwIC0+Cj4+
IGtlcm5lbCAtPiBtaXNhbGlnbmVkIGhhbmRsaW5nIC0+IG1lbWNweSAtPiBjcmFzaCBkdWUgdG8g
ZmFpbGVkIHBhZ2UgZmF1bHQKPj4gd2hpbGUgaW4gaW50ZXJydXB0IGRpc2FibGVkIHNlY3Rpb24u
Cj4+Cj4+IExhc3QgZGlzY3Vzc2lvbiBhYm91dCBrZXJuZWwgbWlzYWxpZ25lZCBoYW5kbGluZyBh
bmQgaW50ZXJydXB0IHJlZW5hYmxpbmcKPj4gd2VyZSBhY3R1YWxseSBub3QgdG8gcmVlbmFibGUg
aW50ZXJydXB0IHdoZW4gaGFuZGxpbmcgbWlzYWxpZ25lZCBhY2Nlc3MKPj4gYmVpbmcgZG9uZSBi
eSBrZXJuZWwuIFRoZSBiZXN0IHNvbHV0aW9uIGJlaW5nIG5vdCB0byBkbyBhbnkgbWlzYWxpZ25l
ZAo+PiBhY2Nlc3NlcyB0byB1c2Vyc3BhY2UgbWVtb3J5LCB3ZSBjb25zaWRlcmVkIGEgZmV3IG9w
dGlvbnM6Cj4+Cj4+IC0gUmVtb3ZlIGFueSBjYWxsIHRvIHB1dC9nZXRfdXNlcigpIHBvdGllbnRh
bGx5IGRvaW5nIG1pc2FsaWduZWQKPj4gwqDCoCBhY2Nlc3Nlcwo+PiAtIERvIG5vdCBkbyBhbnkg
bWlzYWxpZ25lZCBhY2Nlc3NlcyBpbiBwdXQvZ2V0X3VzZXIoKSBpdHNlbGYKPj4KPj4gVGhlIHNl
Y29uZCBzb2x1dGlvbiB3YXMgdGhlIG9uZSBjaG9zZW4gYXMgdGhlcmUgYXJlIHRvbyBtYW55IGNh
bGxzaXRlIHRvCj4+IHB1dC9nZXRfdXNlcigpIHRoYXQgY291bGQgcG90ZW50aWFsbHkgZG8gbWlz
YWxpZ25lZCBhY2Nlc3Nlcy4gV2UgdHJpZWQKPj4gdHdvIGFwcHJvYWNoZXMgZm9yIHRoYXQsIGVp
dGhlciBzcGxpdCBhY2Nlc3MgaW4gdHdvIGFsaWduZWQgYWNjZXNzZXMKPj4gKGFuZCBkbyBSTVcg
Zm9yIHB1dF91c2VyKCkpIG9yIGNhbGwgY29weV9mcm9tL3RvX3VzZXIoKSB3aGljaCBkb2VzIG5v
dAo+PiBkbyBhbnkgbWlzYWxpZ25lZCBhY2Nlc3Nlcy4gVGhlIGxhdGVyIG9uZSB3YXMgdGhlIHNp
bXBsZXIgdG8gaW1wbGVtZW50Cj4+IChhbHRob3VnaCB0aGUgcGVyZm9ybWFuY2VzIGFyZSBwcm9i
YWJseSBsb3dlciB0aGFuIHNwbGl0IGFsaWduZWQKPj4gYWNjZXNzZXMgYnV0IHN0aWxsIHdheSBi
ZXR0ZXIgdGhhbiBkb2luZyBtaXNhbGlnbmVkIGFjY2VzcyBlbXVsYXRpb24pCj4+IGFuZCBhbGxv
d3MgdG8gc3VwcG9ydCB3aGF0IHdlIHdhbnRlZC4KPj4KPj4gVGhlc2UgY29tbWl0cyBhcmUgYmFz
ZWQgb24gdG9wIG9mIEFsZXggZGV2L2FsZXgvZ2V0X3VzZXJfbWlzYWxpZ25lZF92MQo+PiBicmFu
Y2guCj4+Cj4+IENsw6ltZW50IEzDqWdlciAoMik6Cj4+IMKgwqAgcmlzY3Y6IHByb2Nlc3M6IHVz
ZSB1bnNpZ25lZCBpbnQgaW5zdGVhZCBvZiB1bnNpZ25lZCBsb25nIGZvcgo+PiDCoMKgwqDCoCBw
dXRfdXNlcigpCj4+IMKgwqAgcmlzY3Y6IHVhY2Nlc3M6IGRvIG5vdCBkbyBtaXNhbGlnbmVkIGFj
Y2Vzc2VzIGluIGdldC9wdXRfdXNlcigpCj4+Cj4+IMKgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oIHwgMjggKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+PiDCoCBhcmNoL3Jp
c2N2L2tlcm5lbC9wcm9jZXNzLmPCoMKgwqDCoMKgIHzCoCAyICstCj4+IMKgIDIgZmlsZXMgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiAKPiBXZSBhbHNvIG5l
ZWQgdG8gcHJldmVudCB1bnNhZmUgcm91dGluZXMgdG8gdHJpZ2dlciBtaXNhbGlnbmVkIGFjY2Vz
c2VzLAo+IEkgaGF2ZSBhIHBhdGNoIGZvciB0aGlzIGhlcmUgaHR0cHM6Ly9naXRodWIuY29tL2xp
bnV4LXJpc2N2L2xpbnV4Lwo+IGNvbW1pdC83YzE3MjEyMWFlYjIzNWRlZGViNmY1ZTA2NzQwNTI3
NTMwZWRkNmFmCj4gCj4gQ2zDqW1lbnQsIGNhbiB5b3UgYWRkIHRoaXMgb25lIHRvIHRoZSBzZXJp
ZXMgcGxlYXNlPwoKWWVwIHN1cmUuCgo+IAo+IEkgaGF2ZSBqdXN0wqAgdHJpZ2dlcmVkIGEgQ0kg
d2l0aCB0aG9zZSBmaXhlcyBvbiB0b3Agb2YgbXkgc2JpIDMuMCBicmFuY2guCj4gCj4gVGhhbmtz
LAo+IAo+IEFsZXgKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
