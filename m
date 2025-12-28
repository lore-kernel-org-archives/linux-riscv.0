Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A45E8FDBE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 23:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJL4UYpEu64b23jxDDW05QJAHl2QUtHDCgWwUpO00Oc=; b=axkJGu7IYYkUFU
	saf1P7VImJGag6VoRGrMN0hw1SR4dJnwJqtSHfRZlNCiW4ugN986mIu0J0OBF1/t60ivCy5AJuHif
	/0vkDYyzZVG87uMkBwQ1rO5e+ps8llKFxiFoza5sQW1VfkBMgJfCHvvQ62rUCOwxaWkzq3v3JGGuL
	HKtY+VciTtZe6zD4WbEcYeksiP3Ynza2RCJ4nFkX0oa13EBrxG5SO24O+74ssIpS2rVn6rLZisIfY
	BA3yopbGZQsQbyia2lUFL0vS7rG/ew5XN5Qaw36Gpm8+mAX3igeaIkiJtBLfr++Byvmu41g5Hb4km
	2WeKP+3SAwG7eR+phZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0Wq-0000000378e-0QaX;
	Sun, 28 Dec 2025 23:50:28 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0Wn-00000003781-1d52
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 23:50:26 +0000
Received: by mail-qk1-x744.google.com with SMTP id af79cd13be357-8b23b6d9f11so966960985a.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 15:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766965824; x=1767570624; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGg9TVkzSyLOYk8NKjbUBxoiYn1jq6nqqC2B9vxuQ20=;
        b=cqyVR3jZhPAviscDTicO1lO8MC2n345DQDWNX1c3ZmlafVs3RL83WmzL+0rRTRA+rn
         I4YFzkILb6Swd4QA/jWBYu4GNDsEAf2Ah9dUY2zlqAQwsDDv0jyGu/lAzPKctAejw5IE
         86NWF8nMMKxCBddGFSwdVA26I4hRkaBtM0oKrUHkn/dqGQ0RSGgk+X3AmqgSX+1aRPxJ
         rnE0UPrcqhEmuiyXh/mm+q8OKbf+pgcEpCrm9yZund4xjU9Lq2QtFNmI+pDyE5xCd4ss
         N+Ifu8PBE3BVYtavrS0dYqkFkpZ0ZJGoAMA1P6k9HKGbsIom9iu723s6x07FGMqkqNEZ
         bKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766965824; x=1767570624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGg9TVkzSyLOYk8NKjbUBxoiYn1jq6nqqC2B9vxuQ20=;
        b=OciAYzhdlrwXVjzCJdEKV0UNlcBQN5ULmFFBf2eR84w22/Lup7AH/n+O+qno4eFjaZ
         tI3lOEWLT1ejhQpy6r/4t/Udd36buXtqO14eFjB1YwmuUPWm+TtnZ3ntzB0EuVnn3E+T
         C2J5+NoR68L4iU1LzfJBzif1QZiIcR/ZGYRbP6+PnZFdLsNtdrZl0TOAMT1ngQSsjawt
         gj9jwQ0jx7M4L5AZIyEVImXahf0DkUPUfk8WKKH2gebj8eoTKx6qu8H7p2jP0FytrJpy
         9T01256gqJU/SyPY7+QxqOUZonGIZhIz3UDAmNV+JnX+zBgPidbbl3vaEPMqu+oCPlTS
         kqRA==
X-Forwarded-Encrypted: i=1; AJvYcCWxPdxUBMDMcnZOIk3j8AN81ytD4rrkXB7lg/zbbk8ojZZwu3qh5YKEtlSyrxgJVW83gm8iXGXTJ8w+8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlTljIobpOHjd1E+1GEQBltFaH0g5C/S/JWqvk9YlNmploZ9/8
	lYNHd9hdLYXeCgbZvCvVLXOVQ+LZI7tVszHHfVUdBHHym8D8XinLoF0cnMnBkbdz9i4=
X-Gm-Gg: AY/fxX6N+xeB36rBm4L1CWWuhSkL+aDTuyCNG+0ZEtRudUM9AHMuqjoFEj//h/D1Jn8
	zKDEtTMSb1tNKOJdlapfCbpiV+Zmofr7Uqxmf3zExF/VDau+f5yg9lTcuskAkBnk1OpXQyxpjiF
	pO6eTJqK0dc905FEEyKeg/VSWhnnNg647F4rHnezWmmS3JipdFEpwm6e96jaDyYidK93tc5gBnE
	k0PPipe67E/rV6s0ZyndVFHezLsF4/hBl8HY9M0KHre6DNBLtMC0+xNV5q2I7/Kgs9g13j9RORu
	fQN+VpMHNUVrhdV1d/mWRRvSyuP/Y+K9fUUbpVH5vyj3xMoWyKV5pjdCmJYmMnX417mKuALopjA
	5bBeVWXIXWY1O6Dgq3/0dHkR1tF92b41VAgkjhlOan7MsaESJovMAOQmcrOaoQX409Ex3Wh5F0R
	Ki7jCr7JnHvYwmxi10+9zHgeGFVpUAeyIdqkLudDpEZs2Qf0Z7oDs=
X-Google-Smtp-Source: AGHT+IENo+4b0smC8TFEGHw2t77Y1hDrYcgaOhQgijSCe33rGID/qLKQXVh9HVX2zWXUPOmu52A9pQ==
X-Received: by 2002:a05:620a:2906:b0:8b2:e1bc:f27c with SMTP id af79cd13be357-8c08fabf900mr4212673585a.68.1766965824320;
        Sun, 28 Dec 2025 15:50:24 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f28e3sm2406423185a.45.2025.12.28.15.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 15:50:23 -0800 (PST)
Message-ID: <50559ab9-c537-4796-9538-495bf3d14069@riscstar.com>
Date: Sun, 28 Dec 2025 17:50:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] dt-bindings: riscv: Add descriptions for Za64rs,
 Ziccamoa, Ziccif, and Zicclsm
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-8-3af3f3cd0f8a@riscstar.com>
 <8851c155-300a-4241-a5be-5163ba54e47c@riscstar.com>
 <CAH1PCMatKR4rHuBdw0fih5P8naE=KU4Vp5-KNjeDeO-LsEe81g@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMatKR4rHuBdw0fih5P8naE=KU4Vp5-KNjeDeO-LsEe81g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_155025_481179_E70B55D0 
X-CRM114-Status: GOOD (  38.64  )
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

T24gMTIvMjcvMjUgMTA6MTAgUE0sIEd1b2RvbmcgWHUgd3JvdGU6Cj4gSGksIEFsZXgsIENvbm9y
Cj4gCj4gT24gU2F0LCBEZWMgMjcsIDIwMjUgYXQgNToyOOKAr0FNIEFsZXggRWxkZXIgPGVsZGVy
QHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDEyLzIyLzI1IDc6MDQgQU0sIEd1b2Rvbmcg
WHUgd3JvdGU6Cj4+PiBBZGQgZGVzY3JpcHRpb25zIGZvciBmb3VyIGV4dGVuc2lvbnM6IFphNjRy
cywgWmljY2Ftb2EsIFppY2NpZiwgYW5kCj4+PiBaaWNjbHNtLiBUaGVzZSBleHRlbnNpb25zIGFy
ZSByYXRpZmllZCBpbiBSSVNDLVYgUHJvZmlsZXMgVmVyc2lvbiAxLjAKPj4+IChjb21taXQgYjFk
ODA2NjA1Zjg3ICJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIpLgo+Pgo+PiBJIHRoaW5rIHN0
YXRpbmcgdGhlIFJJU0MtViBwcm9maWxlcyBjb21taXQgSUQgaGVyZSAoaW4gdGhlIGNvbW1pdAo+
PiBoZWFkZXIpIGlzIGdvb2QuCj4+Cj4+IEkgZG8gKm5vdCogdGhpbmsgaXQncyBuZWNlc3Nhcnkg
dG8gaW5jbHVkZSBpdCBpbiB0aGUgZGVzY3JpcHRpb25zCj4+IGZvciB0aGUgZXh0ZW5zaW9ucywg
YmVsb3csIGJ1dCBJIHNlZW0gdG8gYmUgbGF0ZSB0byB0aGUgcGFydHkgaW4KPj4gZXhwcmVzc2lu
ZyB0aGlzIG9waW5pb24uLi4KPj4KPj4gVGhhdCBjb21taXQgSUQgaXMgcmVsYXRlZCB0byB0aGlz
IHJlcG9zaXRvcnk6Cj4+ICAgICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtcHJvZmls
ZXMuZ2l0Cj4+Cj4+IEkgaGF2ZSBhIGZldyBvdGhlciBjb21tZW50cyBiZWxvdyBidXQgZ2VuZXJh
bGx5IEkgdGhpbmsgd2hhdCB5b3UKPj4gZGlkIGxvb2tzIGdvb2QuICBJIGhhdmUgb25lIG92ZXJh
bGwgcXVlc3Rpb24gdGhvdWdoLgo+Pgo+Pj4gVGhleSBhcmUgaW50cm9kdWNlZCBhcyBuZXcgZXh0
ZW5zaW9uIG5hbWVzIGZvciBleGlzdGluZyBmZWF0dXJlcyBhbmQKPj4+IHJlZ3VsYXRlIGltcGxl
bWVudGF0aW9uIGRldGFpbHMgZm9yIFJJU0MtViBQcm9maWxlIGNvbXBsaWFuY2UuIEFjY29yZGlu
Zwo+Pj4gdG8gUklTQy1WIFByb2ZpbGVzIFZlcnNpb24gMS4wIGFuZCBSVkEyMyBQcm9maWxlcyBW
ZXJzaW9uIDEuMCwgdGhleSBhcmUKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCj4gCj4g
VG9nZXRoZXIgd2l0aCB0aGUgZmlsZW5hbWVzLCBJIGFsc28gbGlzdGVkIHRoZSBWZXJzaW9uIG51
bWJlcnMuCj4gCj4gVGhlc2UgYXJlIG9mZmljaWFsbHkgcmVsZWFzZWQgdmVyc2lvbnMgb2YgcHJv
ZmlsZSBkb2N1bWVudHMuIEkgbWVhbiB0aGV5Cj4gd29uJ3QgYmUgY2hhbmdlZCB3aXRob3V0IG1v
ZGlmeWluZyB0aGUgdmVyc2lvbiBudW1iZXIuCj4gCj4+PiBtYW5kYXRvcnkgZm9yIHRoZSBmb2xs
b3dpbmcgcHJvZmlsZXM6Cj4+Pgo+Pj4gICAgLSB6YTY0cnM6IE1hbmRhdG9yeSBpbiBSVkEyMlU2
NCwgUlZBMjNVNjQKPj4+ICAgIC0gemljY2Ftb2E6IE1hbmRhdG9yeSBpbiBSVkEyMFU2NCwgUlZB
MjJVNjQsIFJWQTIzVTY0Cj4+PiAgICAtIHppY2NpZjogTWFuZGF0b3J5IGluIFJWQTIwVTY0LCBS
VkEyMlU2NCwgUlZBMjNVNjQKPj4+ICAgIC0gemljY2xzbTogTWFuZGF0b3J5IGluIFJWQTIwVTY0
LCBSVkEyMlU2NCwgUlZBMjNVNjQKPj4KPj4gSSBkaWQgbm90IHZlcmlmeSB5b3VyIHN0YXRlbWVu
dHMgYWJvdXQgd2hlcmUgdGhlc2UgYXJlCj4+IG9wdGlvbmFsIGFuZCBtYW5kYXRvcnksIGJ1dCBJ
IGFzc3VtZSB0aGV5J3JlIGNvcnJlY3QuCj4gCj4gWWVzIHRoZXkgYXJlIGNvcnJlY3QuIEFzIGZh
ciBhcyB3aGF0IHN0YXRlZCBpbiB0aGUgdHdvIHByb2ZpbGUgZG9jdW1lbnRzLgo+IAo+Pgo+Pj4g
U2luY2UgWmljY2Ftb2EgZGVwZW5kcyBvbiB0aGUgJ0EnIGV4dGVuc2lvbiwgYWRkIGEgc2NoZW1h
IGNoZWNrIHRvCj4+PiBlbmZvcmNlIHRoaXMgZGVwZW5kZW5jeS4KPj4KPj4gQWxsIG9mIHRoZXNl
IGV4dGVuc2lvbnMgYXJlIHJlbGF0ZWQgdG8gYXRvbWljIG9wZXJhdGlvbnMsIHJpZ2h0Pwo+PiBE
b24ndCAqYWxsKiBvZiB0aGVtIChub3QganVzdCBaaWNjYW1vYSkgZGVwZW5kIG9uIHRoZSBBIGV4
dGVuc2lvbj8KPiAKPiAKPiBaYTY0cnMgYW5kIFppY2Nsc206IG5vLCB0aGV5IGFyZSBub3QgJ0En
LiBUaGV5IGFyZSBjYWNoZSByZWxhdGVkLgoKSXNuJ3QgYSBaYTY0cnMgcmVzZXJ2YXRpb24gc2V0
IHJlbGF0ZWQgdG8gYXRvbWljIG9wZXJhdGlvbnMsCnRob3VnaD8gIFRoZXkgYXJlIHJlbGF0ZWQg
dG8gbG9hZC1yZXNlcnZlZC9zdG9yZSBjb25kaXRpb25hbAppbnN0cnVjdGlvbnMsIHdoaWNoIGFy
ZSBpbnRyb2R1Y2VkIGluIHRoZSBhdG9taWMgaW5zdHJ1Y3Rpb25zCnNlY3Rpb24uCgpJIHdhcyBt
aXN0YWtlbiBhYm91dCBaaWNjbHNtLCB0aGF0J3MgcmVsYXRlZCB0byB1bmFsaWduZWQKYWNjZXNz
ZXMsIGJ1dCBkb2VzIG5vdCBhcHBseSB0byBhdG9taWMgb3BlcmF0aW9ucy4KCj4gWmljY3JzZSBh
bmQgWmljY2Ftb2E6IHllcywgdGhleSBhcmUgJ0EnIHJlbGF0ZWQuCj4gCj4gWmljY3JzZSBzcGVj
aWZpZXMgdGhlIG1haW4gbWVtb3J5IG11c3Qgc3VwcG9ydCAiUnNydkV2ZW50dWFsIiwgd2hpY2gg
aXMgb25lCj4gKHRvdGFsbHkgdGhlcmUgYXJlIGZvdXIpIG9mIHRoZSBzdXBwb3J0IGxldmVsIGZv
ciBMb2FkLVJlc2VydmVkLwo+IFN0b3JlLUNvbmRpdGlvbmFsIChMUi9TQykgYXRvbWljIGluc3Ry
dWN0aW9ucy4KPiAKPiBBbmQgaW4gUlZBIHByb2ZpbGVzLCB0d28gbmFtZWQgZmVhdHVyZXMgKGV4
dHMpIGFyZSBhZGRlZDoKPiBaaWNjcnNlOiB3aGljaCBmdXJ0aGVyIGRlZmluZSB0aGUgbGV2ZWwg
b2YgTFIvU0Mgb3BlcmF0aW9ucyBiZWluZyBzdXBwb3J0ZWQuCj4gWmljY2Ftb2E6IHdoaWNoIGZ1
cnRoZXIgZGVmaW5lIHRoZSBsZXZlbCBvZiBBTU9zIGluc3RydWN0aW9ucyBiZWluZyBzdXBwb3J0
ZWQuCj4gCj4gCj4gV2UgYWxyZWFkeSBrbm93IHRoYXQgIkEiID0gWmFhbW8gKyBaYWxyc2M7Cj4g
Cj4gSW4gc3VtbWFyeSwgdGhlIGRlcGVuZGVuY2llcyBhbW9uZyB0aGVzZSBleHRlbnNpb25zIGFy
ZToKPiBaaWNjcnNlIC0+IFphbHJzYyAtPiBBOwo+IFppY2NhbW9hIC0+IFphYW1vIC0+IEE7Cj4g
Cj4+IEZ1cnRoZXJtb3JlLCB0aGUgQSBleHRlbnNpb24gaXMgYWxyZWFkeSBtYW5kYXRlZCBieSBS
VkEyM1U2NCwgc28KPj4gaXMgaXQgcmVhbGx5IG5lY2Vzc2FyeSB0byBhZGQgdGhpcyBsb2dpYz8K
PiAKPiBIaSwgQ29ub3IKPiAKPiBXaGF0IGRvIHlvdSB0aGluaz8gSSBhbSBraW5kIG9mIGFncmVl
IHdpdGggQWxleCB0byByZW1vdmUgdGhlIHNjaGVtYQo+IGNoZWNraW5nIGxvZ2ljLgo+IAo+IExl
YXZpbmcgdGhlIGRlcGVuZGVuY3kgY2hlY2sgdG8gcmlzY3YvY3B1ZmVhdHVyZS5jLCBsZXQgdGhl
IC52YWxpZGF0ZSBjYWxsCj4gZG8gdGhlIGpvYi4gSWYgeW91IGFncmVlLCBJIGNhbiByZW1vdmUg
dGhlIHNjaGVtYSBjaGVja2luZyBsb2dpYyBvbiBaaWNjYW1vYQo+IGFuZCBBIGluIG15IG5leHQg
dmVyc2lvbi4KClllcyBJIHRoaW5rIHRoaXMgaXMgYSBiZXR0ZXIgd2F5IHRvIGhhbmRsZSBpdC4g
IENvbm9yPwoKPiBCdHcsIGNwdWZlYXR1cmUuYyB2YWxpZGF0ZSgpIGRlc2VydmVzIGFub3RoZXIg
cGF0Y2gvcGF0Y2hzZXQuCj4gSSdsbCBiZSBoYXBweSB0byBhZGQgdGhhdCBpZiB3ZSByZWFjaCBh
IGNvbnNlbnN1cyBoZXJlLgoKWWVzIEkgdGhpbmsgeW91IHNob3VsZCBkbyB0aGlzIG9uY2UgdGhl
cmUgaXMgY29uY2Vuc3VzLgoKCgo+IAo+Pgo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBY
dSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4+PiAtLS0KPj4+IHYyOiBOZXcgcGF0Y2guCj4+PiAt
LS0KPj4+ICAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCAg
ICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDM0
IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPj4+IGluZGV4IDM4NWUxZGViMjM5
OTZkMjk0ZTc2NjI2OTNmMTI1N2Y5MTBhNmUxMjkuLmE2YjlkN2UzZWRmODZlY2ZiMTE3YmE3MmUy
OTVlZjA5N2JkYzk4MzEgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+PiBAQCAtMjM3LDYgKzIz
NywxMiBAQCBwcm9wZXJ0aWVzOgo+Pj4gICAgICAgICAgICAgICAgYXMgcmF0aWZpZWQgYXQgY29t
bWl0IDRhNjkxOTdlNTYxNyAoIlVwZGF0ZSB0byByYXRpZmllZCBzdGF0ZSIpIG9mCj4+PiAgICAg
ICAgICAgICAgICByaXNjdi1zdnZwdGMuCj4+Pgo+Pj4gKyAgICAgICAgLSBjb25zdDogemE2NHJz
Cj4+PiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+Pj4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFy
ZCBaYTY0cnMgZXh0ZW5zaW9uIGZvciByZXNlcnZhdGlvbiBzZXQgc2l6ZSBvZiBhdCBtb3N0Cj4+
PiArICAgICAgICAgICAgNjQgYnl0ZXMsIGFzIHJhdGlmaWVkIGluIFJJU0MtViBQcm9maWxlcyBW
ZXJzaW9uIDEuMCwgd2l0aCBjb21taXQKPj4+ICsgICAgICAgICAgICBiMWQ4MDY2MDVmODcgKCJV
cGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIpCj4+Cj4+IFRoZSBtb3JlIGNvbXBsZXRlIGRlc2Ny
aXB0aW9uIHNheXM6Cj4+Cj4+ICAgICAgIFJlc2VydmF0aW9uIHNldHMgYXJlIGNvbnRpZ3VvdXMs
IG5hdHVyYWxseSBhbGlnbmVkLCBhbmQgYSBtYXhpbXVtCj4+ICAgICAgIG9mIDY0IGJ5dGVzLgo+
Pgo+PiBCdXQgYXMgSSByZWFkIG9uIChiZWxvdykgSSBzdXBwb3NlIHVzaW5nIHRoZSBtb3JlIHN1
Y2NpbmN0IGRlc2NyaXB0aW9uCj4+IGZyb20gdGhlIGdsb3NzYXJ5IG1pZ2h0IGJlIGJlc3QsIGZv
cmNpbmcgcGVvcGxlIHdobyBjYXJlIHRvIGdvIGxvb2sKPiAKPiBUaGF0IGlzIGV4YWN0bHkgd2hh
dCBJIGFtIGRvaW5nLgo+IAo+PiBhdCB0aGUgcmVmZXJlbmNlIGRvY3VtZW50cy4KPj4KPj4+ICsK
Pj4+ICAgICAgICAgICAgLSBjb25zdDogemFhbW8KPj4+ICAgICAgICAgICAgICBkZXNjcmlwdGlv
bjogfAo+Pj4gICAgICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFphYW1vIGV4dGVuc2lvbiBmb3Ig
YXRvbWljIG1lbW9yeSBvcGVyYXRpb25zIGFzCj4+PiBAQCAtMzc4LDYgKzM4NCwyNyBAQCBwcm9w
ZXJ0aWVzOgo+Pj4gICAgICAgICAgICAgICAgaW4gY29tbWl0IDY0MDc0YmMgKCJVcGRhdGUgdmVy
c2lvbiBudW1iZXJzIGZvciBaZmgvWmZpbngiKSBvZgo+Pj4gICAgICAgICAgICAgICAgcmlzY3Yt
aXNhLW1hbnVhbC4KPj4+Cj4+PiArICAgICAgICAtIGNvbnN0OiB6aWNjYW1vYQo+Pj4gKyAgICAg
ICAgICBkZXNjcmlwdGlvbjoKPj4+ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgWmljY2Ftb2Eg
ZXh0ZW5zaW9uIGZvciBtYWluIG1lbW9yeSAoY2FjaGVhYmlsaXR5IGFuZAo+Pj4gKyAgICAgICAg
ICAgIGNvaGVyZW5jZSkgbXVzdCBzdXBwb3J0IGFsbCBhdG9taWNzIGluIEEsIGFzIHJhdGlmaWVk
IGluIFJJU0MtVgo+Pj4gKyAgICAgICAgICAgIFByb2ZpbGVzIFZlcnNpb24gMS4wLCB3aXRoIGNv
bW1pdCBiMWQ4MDY2MDVmODcgKCJVcGRhdGVkIHRvCj4+PiArICAgICAgICAgICAgcmF0aWZpZWQg
c3RhdGUuIikKPj4KPj4gU2ltaWxhciBjb21tZW50IGhlcmUgKGJ1dCBhbHNvIHdpdGggYSBzaW1p
bGFyIGNhdmVhdCk6Cj4+Cj4gCj4gSSBhbSB1c2luZyB3aGF0IHRoZSBSVkEyMyBQcm9maWxlIGRl
ZmluZXM6Cj4gIlppY2NhbW9hOiBNYWluIG1lbW9yeSBzdXBwb3J0cyBhbGwgYXRvbWljcyBpbiBB
Igo+IAo+IEkgcHJlZmVyIHRvIGtlZXAgaXQgYXMgaXMuCgpUaGF0J3MgZmluZS4gIEkgZG9uJ3Qg
dGhpbmsgSSBmZWx0IHN0cm9uZ2x5IGFib3V0IGFueSBvZiB0aGUgdGhpbmdzCkkgc2FpZCBhYm91
dCB0aGUgZXhhY3Qgd29yZGluZyB1c2VkIGhlcmUuCgpUaGFua3MuCgoJCQkJCS1BbGV4Cgo+IEJS
LAo+IEd1b2RvbmcKPiAKPj4gICAgIE1haW4gbWVtb3J5IHJlZ2lvbnMgd2l0aCBib3RoIHRoZSBj
YWNoZWFiaWxpdHkgYW5kIGNvaGVyZW5jZSBQTUFzCj4+ICAgICBtdXN0IHN1cHBvcnQgYWxsIGF0
b21pY3MgaW4gQS4KPj4KPj4gQW5kIEkgbWlnaHQgc2F5ICJ0aGUgQSBleHRlbnNpb24iLCBidXQg
bWF5YmUgdGhhdCdzIGEgYmFkIGlkZWEuCj4+Cj4+PiArCj4+PiArICAgICAgICAtIGNvbnN0OiB6
aWNjaWYKPj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246Cj4+PiArICAgICAgICAgICAgVGhlIHN0
YW5kYXJkIFppY2NpZiBleHRlbnNpb24gZm9yIG1haW4gbWVtb3J5IChjYWNoZWFiaWxpdHkgYW5k
Cj4+PiArICAgICAgICAgICAgY29oZXJlbmNlKSBpbnN0cnVjdGlvbiBmZXRjaCBhdG9taWNpdHks
IGFzIHJhdGlmaWVkIGluIFJJU0MtVgo+Pj4gKyAgICAgICAgICAgIFByb2ZpbGVzIFZlcnNpb24g
MS4wLCB3aXRoIGNvbW1pdCBiMWQ4MDY2MDVmODcgKCJVcGRhdGVkIHRvCj4+PiArICAgICAgICAg
ICAgcmF0aWZpZWQgc3RhdGUuIikKPj4+ICsKPj4+ICsgICAgICAgIC0gY29uc3Q6IHppY2Nsc20K
Pj4+ICsgICAgICAgICAgZGVzY3JpcHRpb246Cj4+PiArICAgICAgICAgICAgVGhlIHN0YW5kYXJk
IFppY2Nsc20gZXh0ZW5zaW9uIGZvciBtYWluIG1lbW9yeSAoY2FjaGVhYmlsaXR5IGFuZAo+Pj4g
KyAgICAgICAgICAgIGNvaGVyZW5jZSkgbXVzdCBzdXBwb3J0IG1pc2FsaWduZWQgbG9hZHMgYW5k
IHN0b3JlcywgYXMgcmF0aWZpZWQKPj4+ICsgICAgICAgICAgICBpbiBSSVNDLVYgUHJvZmlsZXMg
VmVyc2lvbiAxLjAsIHdpdGggY29tbWl0IGIxZDgwNjYwNWY4NyAoIlVwZGF0ZWQKPj4+ICsgICAg
ICAgICAgICB0byByYXRpZmllZCBzdGF0ZS4iKQo+Pj4gKwo+Pj4gICAgICAgICAgICAtIGNvbnN0
OiB6aWNjcnNlCj4+PiAgICAgICAgICAgICAgZGVzY3JpcHRpb246Cj4+PiAgICAgICAgICAgICAg
ICBUaGUgc3RhbmRhcmQgWmljY3JzZSBleHRlbnNpb24gd2hpY2ggcHJvdmlkZXMgZm9yd2FyZCBw
cm9ncmVzcwo+Pj4gQEAgLTc5NSw2ICs4MjIsMTMgQEAgcHJvcGVydGllczoKPj4+ICAgICAgICAg
ICAgdGhlbjoKPj4+ICAgICAgICAgICAgICBjb250YWluczoKPj4+ICAgICAgICAgICAgICAgIGNv
bnN0OiBmCj4+PiArICAgICAgIyBaaWNjYW1vYSBkZXBlbmRzIG9uIEEKPj4KPj4gTWF5YmUgbW9y
ZSB0aGFuIGp1c3QgZGVwZW5kcyBvbiB0aGUgQSBleHRlbnNpb24uCj4+Cj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLUFsZXgKPj4KPj4+ICsgICAgICAtIGlmOgo+
Pj4gKyAgICAgICAgICBjb250YWluczoKPj4+ICsgICAgICAgICAgICBjb25zdDogemljY2Ftb2EK
Pj4+ICsgICAgICAgIHRoZW46Cj4+PiArICAgICAgICAgIGNvbnRhaW5zOgo+Pj4gKyAgICAgICAg
ICAgIGNvbnN0OiBhCj4+PiAgICAgICAgICAjIFp2ZmJmbWluIGRlcGVuZHMgb24gViBvciBadmUz
MmYKPj4+ICAgICAgICAgIC0gaWY6Cj4+PiAgICAgICAgICAgICAgY29udGFpbnM6Cj4+Pgo+PgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
