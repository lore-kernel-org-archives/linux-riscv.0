Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CB3C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 21:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diAAEIT+0rZ/bhP55PftWU3E4pBjrk6J2RuixjFuC5M=; b=2wGzdNTcCYiTup
	J/FKfyUANB3uoh0irW4bQBIgqEdJmaOcr1GKAyMw/4X3aKd9/2jzibbWub/l8yr2Xjl6ifgrmdnuo
	8rbaT4ei3Y09XFA7GADlVLXXJOV0LShFlGU/u8d611+dAj2f8M1irHyH7sAJ4vXs2naq4IiiulYRd
	jZJulJx6HvJFoh+GhOwyqh//SK7GodVq87E5jOCH2QYtKx/O4QojXURI/xpWvujr6umsg2ZejJL8M
	UuI0Rw/oS6ECUE7utA/9WGMPbkhgbSpHfNlMszCn3Q8i7EIog1mJMB/xdvlkRziNyIB/ilA9lwatF
	kN0WwUPwFeWeUn1f6+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuety-00000007BAJ-207C;
	Tue, 18 Mar 2025 21:55:10 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuetv-00000007B9s-49QS
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 21:55:09 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3ce87d31480so33329365ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 14:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742334906; x=1742939706; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BriU7gJk74pNPNWavKZMoPDwkWz3I9HqTPL00tnATHc=;
        b=vfjE1TJMHP/AjcRhUWtaUA85Qp+Z91XLOIu/YM1BVLKWC7HJpbFFvzFXKtwp1vAsAl
         1G4cldR5BVvDuqHuXvsbyvjnGs7Oby5a3ZLUZ9YYibWOElsoYnwJkMC33ZUZbe494ubf
         i7VxuJ3wvfoSS4vOBlUz5Ib8DY7jRhTEyzCI6wEmXDMaJh4HeobOjrrg1QN0FxMIipsk
         gyB9TUNvY3NLKMq2XoBpwPRisvkBxJ3CeghLr6kZE4nSJZdDycPOuShif1vIILAPUTN1
         nYFbnHE0rc1EkRHSk+9cfmKIVTdDakBqe2eMS1DKH05N89ltAVVHj/ATQUkBcPHs83g5
         z0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742334906; x=1742939706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BriU7gJk74pNPNWavKZMoPDwkWz3I9HqTPL00tnATHc=;
        b=nWNdqNeW2/0X06e/ZTS3PB3PqoEfujqO1nn44RGiY2dMJa0mLFScSB5YpzDD6uFRBp
         efosMy36nqkxFKIRUAYPp6Gl4QXS0s9ZnSCrzfdL4qrDlRH7EN3oSAybhauDxXlVmxeA
         55RTCCOa+cT81gNuohFw1nW6wYyv5GYK+SvrQaO976NmKcy1kT50ZeetcWgN9KLB27K9
         5bpUcqXCNgfb0CV8xxsuMPZeAKmxpi8Jd2NBzZjl19tqLb2oU50W6yp2W6MDLAVphj69
         X5kXjivHqRbNecIXBHTXWjtlabbJTH09pgQsNsvZ+PdxtavZwklPT+NvUWa5vp8MKroQ
         P8qg==
X-Forwarded-Encrypted: i=1; AJvYcCXlr3I1NSjarfPSZizvn7XqSJzsAi6xuOiAmDCeNGRwSLUslzbZMPhGCXRqYcxAENuRfd7q4GcDJje75Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFEsF15lZ11sv9eQKFCHz7Y2YBp/KsQHaaRu+bhiBiVfH7XCY3
	QzCWkEcNPXPDgI/oRVkVIFOWYR0QMzEfGM7CKwcVtFHGyTJrQOUvzp7hGwWtMctlNOs+YUVAQt1
	jo1QCoA==
X-Gm-Gg: ASbGncuOkH5q2cozpdeN/lcS1vyeVZNA1r/ZA/hxlMD8GjbOAo7IY2JFe8ZxMxcc314
	wj3O+dqQcx5vfM1ZVB+3IISawsHeRiDy43p1rLzxEQR7PDwmMBXLSgdZ6uv+zZna6QfeMREQwwL
	foj+bdmxeC3bKSxgznBW/VLjNCbjuEWiSsH1nco5cdQUdSi/CeXrHv+eJzv4dWtpnF4of/yUpFl
	10pKp9Xz7K6uX1nGFS9z0wXvsGR/3CM93KO/IPLCZ2A1awYE1wTFQDohwRt16QSFTHf2Vo8qG3D
	DH+8ai21zMAQ2znCN5Im3BqGnrtqbetw8BbBYaDeeamCpCzeq7KR2s9XKyxZpPIqrNz2U9HMUeS
	SK0DgUMjBsFGBAQ1jgYQ=
X-Google-Smtp-Source: AGHT+IGVf9GbYQhaKGZToeaVO4iSrNen2V8aeAO2lkOMP+96+7ao9O222hC69zg9XeGwmJ/p4dFgUg==
X-Received: by 2002:a05:6e02:2221:b0:3d3:faad:7c6f with SMTP id e9e14a558f8ab-3d586b2ab4cmr5124855ab.5.1742334906077;
        Tue, 18 Mar 2025 14:55:06 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a668e6asm35193745ab.28.2025.03.18.14.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 14:55:05 -0700 (PDT)
Message-ID: <c8cf2e21-ae1b-4e72-bdec-d7bd1b2bc9c7@riscstar.com>
Date: Tue, 18 Mar 2025 16:55:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@ieee.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
 <c7dc26a0-7cbc-4909-b2ac-582d108fc5e7@gmail.com>
 <a7862a8b-4d81-4b1b-90d9-3cedde0699a5@riscstar.com>
 <lvwiyxitkuzi57cbbcvuanqpvhaihafarwqhkflxbctzs6j4o7@ev45pe3yuzj3>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <lvwiyxitkuzi57cbbcvuanqpvhaihafarwqhkflxbctzs6j4o7@ev45pe3yuzj3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_145508_295914_1A3958AD 
X-CRM114-Status: GOOD (  15.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMy8xOC8yNSA0OjQxIFBNLCBBbmRpIFNoeXRpIHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDE4LCAy
MDI1IGF0IDA3OjA0OjE5QU0gLTA1MDAsIEFsZXggRWxkZXIgd3JvdGU6Cj4+IE9uIDMvMTgvMjUg
MTI6NDQgQU0sIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4+Pj4gSSdsbCBsZWF2ZSBpdCB1cCB0byB0
aGUgbWFpbnRhaW5lciB0byBkZWNpZGUgd2hldGhlciB0aGVzZQo+Pj4+IGNvbW1lbnRzIGNhbiBq
dXN0IGJlIGlnbm9yZWQtLW15IFJldmlld2VkLWJ5IGlzIGZpbmUsIGV2ZW4KPj4+PiBpZiB5b3Ug
ZG9uJ3QgY2hhbmdlIHRoZXNlLgo+Pj4+Cj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtQWxleAo+Pj4gSSBrbm93IGl0J3MgcmlnaHQgd2hhdCB5b3Ugc2FpZC4K
Pj4+IEJ1dCBJIGRvbid0IGtub3cgaWYgaXQncyB3b3J0aCB0byBzZW5kIHY4Pwo+Pj4gTWF5YmUg
SSBjYW4gZml4IGl0IHdoZW4gSSBhZGQgRklGTyBmdW5jdGlvbj8KPj4+IElmIEknbSB3cm9uZywg
bGV0IG1lIGtub3cuCj4+Cj4+IFVubGVzcyB0aGUgbWFpbnRhaW5lciB3YW50cyB5b3UgZG8gZG8g
djgsIHBsZWFzZSBqdXN0Cj4+IGFkZHJlc3MgdGhlc2Ugc3VnZ2VzdGlvbnMgbGF0ZXIuICBUaGFu
ayB5b3UuCj4gCj4gaXQncyBlYXNpZXIgdG8ganVzdCBzZW5kIGl0IHJhdGhlciB0aGFuIGFza2lu
ZyBmb3IgYSB2OCA6LSkuCgpZb3UgbWVhbiBlYXNpZXIgZm9yIFRyb3kgdG8ganVzdCBzZW5kIGFu
IHVwZGF0ZT8gIEkgYWdyZWUKd2l0aCB0aGF0LiAgQnV0IEkgaGF2ZSBubyBpZGVhIHdoYXQgVHJv
eSdzIHNjaGVkdWxlIGxvb2tzCmxpa2UuLi4KCj4gV2hhdCBJIGNhcmUgbW9yZSBpcyBpZiB5b3Ug
d291bGQgZ2l2ZSBhbiByLWIgaWYgeW91ciBsYXN0Cj4gY29tbWVudCB3YXMgYWRkcmVzc2VkLiBJ
ZiBzbyBUcm95IHN0aWxsIGhhcyB0aW1lIHRvIHNlbmQgYSB2OCB0bwo+IGdldCB0aGUgc2VyaWVz
IGluIHRoaXMgY3ljbGUsIG90aGVyd2lzZSBJIGNhbiBjaGFuZ2UgdGhpbmdzCj4gbXlzZWxmIGJl
Zm9yZSBtZXJnaW5nLgoKSXQgd291bGQgYmUgZ3JlYXQgdG8gZ2V0IHRoaXMgbWVyZ2VkIHRoaXMg
d2Vlay4gIEVhc2llc3QsCnF1aWNrZXN0LCBhbmQgbW9zdCB1bmFtYmlndW91cyAoaWYgeW91J3Jl
IHdpbGxpbmcpIHdvdWxkIGJlCmZvciB5b3UgdG8gZG8gdGhlc2UgdHdlYWtzIGFuZCBtZXJnZSBp
dC4KCk9yIGp1c3QgbWVyZ2UgdjcgYXMtaXMuICBJIGRvbid0IHJlYWxseSBjYXJlIGF0IHRoaXMg
cG9pbnQuCgpZZXMsIG15IFItQiBzdGFuZHMgd2l0aCBvciB3aXRob3V0IG15IHN1Z2dlc3Rpb25z
IGhlcmUuCgpSZXZpZXdlZC1ieTogQWxleCBFbGRlciA8ZWxkZXJAcmlzY3N0YXIuY29tPgoKVGhh
bmsgeW91LgoKCQkJCQktQWxleAoKPiBBbmRpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
