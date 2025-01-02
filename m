Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1E0E77194
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0oInFLJpVlganigvYWv8fNI90AapeDNp60At3ojj7Q=; b=kFUH4aMX9m75cD
	kyd/VJPnB1xD5tz3b0y9ttmk+0diytniVtolvVgju60pjN4Srv5XdTIyjT0L/XdtaR2Yi5WwRUPeL
	L4koYREdoV0lza4KWsYkKFZxeyvhEkjEy7oUhEjiA4dxyNYjCyJKuTjFm8Ykr9asbmAnueVhiAYal
	Rgc4KjenSiyu4whq9pQuuE/HxS3OTOUODuL6kZbEqp6OHPj6M2EkevyDLVjT2j/KtuieBJdbaPZgj
	cKL+El3+u4n/hy/4ZlitZujx8SAm3i+BiUmA79Tgfb7mHqdIIlEHhqyq9MaKrkMZYvjS9bDT9jD5S
	xTdi6t0GcX62zCY/bbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTMO5-0000000Ac8S-2FYp;
	Thu, 02 Jan 2025 14:41:25 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTMO2-0000000Ac7z-3sIh
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 14:41:24 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3a9cb8460f7so85320895ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jan 2025 06:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1735828882; x=1736433682; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIJtjRBWvonrXM38aTbrfLtWCjGH25On8+kN8epdNLQ=;
        b=hsUNH145zPv9+noVkSvdKgD4xviwESRkQONSJsW8zJnSJquGp2EfzWO/cCLdl+FQ9z
         vXapTDyKcyaOdvs8L0743RjxbZvB5UFzBhwkwQaNxHa3Ge783kO8hpw52PMaFLXSoyfb
         GfTVOrD7hAtAgXP8zDWDJQDMfVXZNgptgewZrYZ0Wx0cyhnvpPoknhLiWWhzZDoU3oGj
         RUtCXDupQefC1jEUN+MaddhMSRMgSqZoRlgd9t2tJn4dDlif+kcql0n1aoEI2C8stKQ3
         rvEDYY1y6HE0owNGBxVVB/AVU7pCsKHuyhxPLO6HgQCyQoax+231Sko6xpJERhMJTanW
         aeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735828882; x=1736433682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIJtjRBWvonrXM38aTbrfLtWCjGH25On8+kN8epdNLQ=;
        b=FcT/UVJrok1tjpImwH/BtdCyZuf5mkFW+EDSJ+s92zDlFYkODioFaXDTH6kmgsKgcp
         55ADUAeU1fccgq07/8cUJu5l0UAcUqo06VAPmuLV4qowMwSlrO/ewY0KUUDsjkfU2/A8
         98L5OL+uOmLWRsQcJudTj1F1KrOQvREhiyz35U7Jhxrc8Vcr+k6hA0xvMBUfMCWvdVmo
         ZpghcimfWzYTg+Ze5YVFSRPg1UPFPfGSqGIWCx+CnQIz1i5Czepq/j2zMYtkMawZsMc3
         baljYCLO5zvC9QfJtzJqQNjcWkci2lSnQR9yLArl6xM5n51ugvuZahG5PzeZxwPocfG1
         qDHg==
X-Forwarded-Encrypted: i=1; AJvYcCWnXrkgkWJrzGWoQdBCmUDRF2EI8hhE9utOZT6UapQttKHIx5aX99nyenbR/B6rth1BITBfQGMXLVCMIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuYbrl8dHBGuLcZbt+av5bMMEHMuKF0G2QzI33upVuT5YYExWQ
	iAEmKK9Q5uMRND0sYZn/sDJqfJBcpl3knbEMt1zRLxe/Y/jBXifF3VqVNKQ/943Hem6IpiA9+Wh
	lGrkE7TgjXC628Y3wrIDr78FlZZAOKZVz8qLCog==
X-Gm-Gg: ASbGncujPnQm1BOKbRBf85agB7W0+Y+DmO0ruurGxBXjjG9b4YVdoSwEk/tEqal224R
	LT4jmgIOOIsl/Kh/wK1/kb0Zj412TEoO7udtYD2G5
X-Google-Smtp-Source: AGHT+IFp979BkAE+X1dNGl+HBEvzlTac3UCIyajzMdE02Pda6QEDweLV8cIoJNiikbzV6lGzEVrtWE30KnrKNSouyoU=
X-Received: by 2002:a05:6e02:260a:b0:3a7:81d6:c177 with SMTP id
 e9e14a558f8ab-3c2d2f4b59emr365393115ab.14.1735828881702; Thu, 02 Jan 2025
 06:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
 <CAAhSdy0cBkogjR1DbcS9-TLRbKiDqVTydrYQCihnEHDRu69CoQ@mail.gmail.com> <VI1PR09MB2333299725201F26F23A803694142@VI1PR09MB2333.eurprd09.prod.outlook.com>
In-Reply-To: <VI1PR09MB2333299725201F26F23A803694142@VI1PR09MB2333.eurprd09.prod.outlook.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Jan 2025 20:11:11 +0530
X-Gm-Features: AbW1kvZ55zQG8N_0jxPDVa4ktCs286EMNdcezG1mgVseQ8GpKzgj8igfFO9yBPc
Message-ID: <CAAhSdy2P3AQckUXaH1XY2+zK4Cx=WYDsUUciODcLbka3z9q2XQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv,aplic: support for hart indexes
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_064123_171568_F0A86685 
X-CRM114-Status: GOOD (  21.00  )
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

T24gVGh1LCBKYW4gMiwgMjAyNSBhdCA3OjMx4oCvUE0gVmxhZGltaXIgS29uZHJhdGlldgo8Vmxh
ZGltaXIuS29uZHJhdGlldkBtb2JpbGV5ZS5jb20+IHdyb3RlOgo+Cj4gPlRoZSBBUExJQyBkb21h
aW4gaW4gZGlyZWN0IG1vZGUgcmVxdWlyZXMgIkhBUlQgSW5kZXgiIHRvIGJlCj4gPmJldHdlZW4g
MCB0byBOIC0gMSB3aGVyZSBOIGlzIHRoZSBudW1iZXIgb2YgSEFSVHMgdGFyZ2V0ZWQgYnkKPiA+
dGhlIEFQTElDIGRvbWFpbiBiZWNhdXNlIHRoZSBBUExJQyBJREMgc3RydWN0dXJlcyBhcmUgcGxh
Y2VkCj4gPmNvbnNlY3V0aXZlbHkgaW4gdGhlIE1NSU8gc3BhY2UgYW5kIGxvY2F0ZWQgYmFzZWQg
b24gIkhBUlQgaW5kZXgiLgo+ID4oUmVmZXIsIGZpcnN0IHBhcmFncmFwaCBvZiB0aGUgc2VjdGlv
biAiNC44IEludGVycnVwdCBkZWxpdmVyeSBkaXJlY3RseQo+ID5ieSB0aGUgQVBMSUMiIG9mIHRo
ZSByYXRpZmllZCBSSVNDLVYgQUlBIHYxLjAgc3BlY2lmaWNhdGlvbikKPgo+IEhpIEFudXAsCj4K
PiBTb3JyeSwgcGVyaGFwcyBJIGFtIHJlYWRpbmcgc3BlYyB0aGUgd3Jvbmcgd2F5LiBJIGRvbid0
IHNlZSB3aGVyZQo+IHNwZWMgcmVxdWlyZWQgdGhpczoKPgo+ID4iSEFSVCBJbmRleCIgdG8gYmUK
PiA+YmV0d2VlbiAwIHRvIE4gLSAxIHdoZXJlIE4gaXMgdGhlIG51bWJlciBvZiBIQVJUcyB0YXJn
ZXRlZCBieQo+ID50aGUgQVBMSUMgZG9tYWluCj4KPiBJIGhhdmUgYSByZWFsIGhhcmR3YXJlIChN
SVBTIFA4NzAwKSB3aGVyZSBBUExJQyBpcyBpbiBkaXJlY3QgbW9kZQo+IGFuZCBoYXJ0IGluZGV4
ZXMgYXJlIHNhbWUgYXMgaGFydCBJRHMsIG1hc2tpbmcgb3V0IGNsdXN0ZXIgbnVtYmVyLgo+IFRo
ZXNlIGhhcnQgaW5kZXhlcyBhcyBJIG1lbnRpb25lZCwgIjB4MDAsIDB4MDEsIDB4MTAsIDB4MTEi
IGV0Yy4KPiBGb3IgZGVsaXZlcmluZyBJUlEsIGZvciBleGFtcGxlLCAgdG8gQ1BVMiBJIG5lZWQg
dG8gYWNjZXNzIGl0cyBJREMKPiBieSBoYXJ0IGluZGV4IDB4MTAuIEN1cnJlbnQgY29kZSB1c2Vz
IElEQyBhdCBpbmRleCAyIGFuZCBoYXJkd2FyZQo+IGRvbid0IHdvcmsgdGhpcyB3YXkgYmVjYXVz
ZSB0aGVyZSdzIG5vIHJlZ2lzdGVycyBhdCB0aGlzIGFkZHJlc3MuCj4KPiBJZiBzcGVjIGluZGVl
ZCByZXF1aXJlcyBoYXJ0IGluZGV4ZXMgdG8gYmUgaW4gcmFuZ2UgYXMgeW91IG1lbnRpb25lZCwK
PiBzdWNoIGhhcmR3YXJlIGlzIG5vdCBzcGVjIGNvbXBsaWFudC4gSXMgaXQgdGhlIGNhc2U/CgpI
ZXJlJ3MgdGhlIHRleHQgZnJvbSAiNC44IEludGVycnVwdCBkZWxpdmVyeSBkaXJlY3RseSBieSB0
aGUgQVBMSUMiIG9mCnRoZSBBSUEgc3BlY2lmaWNhdGlvbjoKCiJXaGVuIGFuIGludGVycnVwdCBk
b21haW4gaXMgaW4gZGlyZWN0IGRlbGl2ZXJ5IG1vZGUgKGRvbWFpbmNmZy5ETSA9IDApLAppbnRl
cnJ1cHRzIGFyZSBkZWxpdmVyZWQgZnJvbSB0aGUgQVBMSUMgdG8gaGFydHMgYnkgYSB1bmlxdWUg
c2lnbmFsIHRvIGVhY2gKaGFydCwgdXN1YWxseSBhIGRlZGljYXRlZCB3aXJlLiBJbiB0aGlzIGNh
c2UsIHRoZSBkb21haW7igJlzIG1lbW9yeS1tYXBwZWQKY29udHJvbCByZWdpb24gY29udGFpbnMg
YXQgdGhlIGVuZCBhbiBhcnJheSBvZiBpbnRlcnJ1cHQgZGVsaXZlcnkgY29udHJvbCAoSURDKQpz
dHJ1Y3R1cmVzLCBvbmUgSURDIHN0cnVjdHVyZSBwZXIgcG90ZW50aWFsIGhhcnQgaW5kZXguIFRo
ZSBmaXJzdCBJREMgc3RydWN0dXJlCmlzIGZvciB0aGUgZG9tYWlu4oCZcyBoYXJ0IHdpdGggaW5k
ZXggMDsgdGhlIHNlY29uZCBpcyBmb3IgdGhlIGhhcnQgd2l0aAppbmRleCAxOyBldGMuIgoKVGhl
IEFJQSBzcGVjIGNsZWFybHkgc2F5cyB0aGF0IGZvciBBUExJQyBpbiBkaXJlY3QgbW9kZSByZXF1
aXJlcwpzZXF1ZW50aWFsICJIQVJUIGluZGV4IiBzdGFydGluZyBmcm9tIDAgc28gdGhhdCBJREMg
c3RydWN0dXJlcyBjYW4KYmUgbG9jYXRlZCB1c2luZyB0aGUgQVBMSUMgIkhBUlQgaW5kZXgiLgoK
VGhlIG5vbi1jb250aWd1b3VzIEFQTElDICJIQVJUIGluZGV4IiBhc3NpZ25tZW50IGluIE1JUFMg
UDg3MDAKaXMgY2xlYXJseSBhIHZpb2xhdGlvbiBvZiB0aGUgQUlBIHNwZWNpZmljYXRpb24uCgo+
Cj4gSW4gYWRkaXRpb24sIGFzIHNwZWMgc2F5cywgaGFydCBpbmRleCBtYXkgYmUgZGlmZmVyZW50
IHRoYW4gaXRzIGhhcnQgSUQKPiBhbmQgSSBkb24ndCBzZWUgYW55IHByb3Zpc2lvbmluZyBpbiBj
dXJyZW50IGNvZGUgdG8gc3VwcGx5IHRoaXMKPiBoYXJ0IGluZGV4LgoKWWVzLCB0aGlzIGlzIHRy
dWUgZm9yIGJvdGggQVBMSUMgZGlyZWN0LW1vZGUgYXMgd2VsbCBiZWNhdXNlIGVhY2gKQVBMSUMg
ZG9tYWluIGluIGRpcmVjdC1tb2RlIHdpbGwgaGF2ZSBpdHMgb3duICJIQVJUIGluZGV4IiBzcGFj
ZQpzdGFydGluZyBmcm9tIDAuCgo+Cj4gV2hhdCBhbSBJIG1pc3Npbmc/CgpUbyBtZSBpdCBzZWVt
cyBNSVBTIFA4NzAwIGlzIG9ubHkgSVAgYW5kIG5vdCBhY3R1YWwgc2lsaWNvbiA/PwooaHR0cHM6
Ly9taXBzLmNvbS9wcm9kdWN0cy9oYXJkd2FyZS9wODcwMC8pCgpJZiBzbyB0aGVuIGl0IGlzIGJl
dHRlciB0byBmaXggdGhlIElQIGl0c2VsZi4gSWYgaXQgaXMgcmVhbCBzaWxpY29uIHRoZW4gSSBj
YW4KdGhpbmsgb2Ygc29tZSB3b3JrLWFyb3VuZCBmb3IgdGhlIG5vbi1jb21wbGlhbmNlLgoKUmVn
YXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
