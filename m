Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DB5D1D486
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 19:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0f0JLc/cRmgqFMg1tTmvAtKfVfxIcemUKem0vKS7b90=; b=fbDT+9LvedT0Jz
	hS9ekUBtVomMrlTVkfM7ECpqRXkw1mEhpMLqyM86Q4i3XzrTIfUFWnMES/9kfTGTge5hK21UD2shf
	0YKjXx17OBQFDfBdfTc8VHOA4lzbAaqzcDvU7rEHhCKu6ja53TAPYWftD4DVknv+P04PdGDTznW4d
	rEP7TPowpl8JTkpHQOjSYQUt07OitfM20msJk7cvMz8cgPDSxuTSBpmcGGCnVKUppDCMtMGFu//9F
	GdibUX82bZCBTuiiy4LHTfLMrmJhO1zoVUJntTPFfJLPv+FdEIwllWHOQEsSURkSNy4K7D0StXnI2
	Dv5FmIVhMzNXuvr1hToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvbf-00000000kx2-27nl;
	Thu, 08 Jan 2026 19:23:39 +0000
Received: from mail-oa1-x42.google.com ([2001:4860:4864:20::42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvbd-00000000kwL-048y
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 19:23:38 +0000
Received: by mail-oa1-x42.google.com with SMTP id 586e51a60fabf-3fa139e5d90so1308096fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 11:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767900215; x=1768505015; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hjqd0wbUL/0gATLT7Jr3bq/fYYzs5CcoqUGsadwzmFw=;
        b=d0XE/e699/kn/8L2UuFd1rFvqoaHljwWttPO5iRKKW1NuYKPU1qHmKyhXajMI+bY6m
         Q9MCcxXEBDUvp+ljzVrm52Gb5tW4E0iAJh7kBdluwrX3dgyciM5v9Ed6k7nAOeOsDSq3
         n6s89BYIcTf7ggVgkcVC6dl24jb9Gb93SOuS3OLcDHLBT6oypBl3XoI/cuK4FvIMMe4v
         1UnqjiEx0ugfCmnYO/PqX4yvNJaK0nxIy38eHxagmffR6p433uXKbOXW+Y9rtcFipdV7
         t/dnxB/4Ee+RVuHblkZMBbaJ66/H2daDpMv2y0CVhdhNMzqjN3stdSQZeYIUQrywMpPf
         Bdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767900215; x=1768505015;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjqd0wbUL/0gATLT7Jr3bq/fYYzs5CcoqUGsadwzmFw=;
        b=lP56diiUF1OHRNiqHEQgv4uZmjxYExWtq79bsSH7SL+SvBtTmrjvcMVamXMtGSvzba
         oJSXtX4ZUJJi+kn1ZigL3uDdEMbPLpLgmB3MCd/Sqoedh3U9Re5F29iEReUaprq4Po/8
         mCGUYQNb8I+Vk7L9uiin2vYRMx0fAzj9/Be1XfZTJ4pM9wr0u0uXv/I6L425XF3mXrxe
         XNcKILXhxxF6DuNSM44nM2oQPFTH61Ota7ha5PV/h1NHq6MHOT20tbH6+fcu1PPrRpso
         w3yKiYF/u4r2TIVF0ibgBP+PBV1hDGEkUNLp7WTJBiR2m4LWpeSxE2Ik2foIk5dETrXa
         YEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR0c15P9oGnqQw3UZTZla4ZN01JV3Y0yspaEI5+H26l/X0a1YBuRyb9875Bc85tvfrwW458N2kgC6NjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6DYYveclEgiUSsusJOHDweTME+C7FdxHnzktelS/5JCkHypqu
	neiyeJKyxG8Iiy1G0phdQgaD5aveB5keJ++tnJqCVpFI+Qgbt1Lh+k+1A6JLwr3VSIo=
X-Gm-Gg: AY/fxX7fEpwpX61/glLOugKDATVCn2bc1e3vsNamtSkkjOGq3Ld65fxJPn1PUPVRf36
	/qXGbZFMk1+p/YupgtYm0gjHswCYDL1pRDoBDYTCZENowhaRLFDuAzdhR+LxweIokM67AEmcRhV
	+LmABDscNmGFDTNQ/o6gUP137fW+ZrHWgzbqi725Cj3K7begx3Tg+jIJ8LVeOjms8zBywzW+w6c
	BlAMy3rug6MOQBoEBoXSQILBj8/EwsEZ/Pw7gyEIMUznM607563fMj0fEl+cVsunWTx7m/fS/5D
	1dFP+uqaZTz2VmlB9+G5rNAzYIdXs18LyMLyZLh/DCpTHF1ygPUyVSrePgqH0rSP6K7UiwGhYJW
	Mu9T6UEfK6Vb/IrKJr/T8ZYalgTL4wYggrlLbFEqZgH1EcL9km3mLDH8OKx/ip6ev4bmEOGCNrG
	aPoAYjIUAqNDWHY3uyNjzlcFbspFk=
X-Google-Smtp-Source: AGHT+IHKLUgghrPd29RErvBws0kQ87awrcNfi7vgU0Zf7ngrlTJY/amh5n0uvlMoYU4vmYrjhXLVGQ==
X-Received: by 2002:a05:6870:c243:b0:3e8:95d2:389d with SMTP id 586e51a60fabf-3ffc0c02c95mr3135629fac.43.1767900214837;
        Thu, 08 Jan 2026 11:23:34 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.86])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4de40bfsm5357385fac.5.2026.01.08.11.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 11:23:34 -0800 (PST)
Message-ID: <9504b2f6-12f5-46c2-ac74-826dba3fb530@sifive.com>
Date: Thu, 8 Jan 2026 13:23:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Conor Dooley <conor@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Guodong Xu <guodong@riscstar.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@sifive.com>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
 <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com>
 <20251218-basil-quantum-225ce16e4699@spud>
 <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
 <20251220-repacking-football-c79e660e788a@spud>
 <4e4c9e7b-d95c-4157-94c3-b06002f94a48@canonical.com>
 <20251222-dimmer-wooing-db29fe925498@spud>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251222-dimmer-wooing-db29fe925498@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_112337_084599_D18C7A2B 
X-CRM114-Status: GOOD (  34.45  )
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

SGkgYWxsLAoKU29ycnksIEkgd2Fzbid0IGZvbGxvd2luZyB0aGlzIHRocmVhZC4KCk9uIDIwMjUt
MTItMjIgMjozNiBQTSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFN1biwgRGVjIDIxLCAyMDI1
IGF0IDAxOjEwOjE1QU0gKzAxMDAsIEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4+IE9uIDEy
LzIxLzI1IDAwOjIzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBGcmksIERlYyAxOSwgMjAy
NSBhdCAxMDowMzoyNEFNICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+Pj4+IEhpLCBDb25vciBh
bmQgSGVpbnJpY2gKPj4+Pgo+Pj4+IE9uIFRodSwgRGVjIDE4LCAyMDI1IGF0IDg6NTbigK9BTSBD
b25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiBXZWQs
IERlYyAxNywgMjAyNSBhdCAwOTowNzoxNEFNICswMTAwLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdy
b3RlOgo+Pj4+Pj4gT24gMTIvMTcvMjUgMDg6MTEsIEd1b2RvbmcgWHUgd3JvdGU6Cj4+Pj4+Cj4+
Pj4+Pj4gU3BlY2lmaWNhbGx5LCBJIG11c3QgYWRoZXJlIHRvCj4+Pj4+Pj4gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCAoYW5kIGNwdXMueWFt
bCBmb3IKPj4+Pj4+PiBwcm9wZXJ0aWVzIGxpa2UgJ3Jpc2N2LHN2MzknIHdoaWNoIHN0YW5kcyBm
b3IgdGhlIGV4dGVuc2lvbiBTdjM5KS4gSWYgSQo+Pj4+Pj4+IGFkZCBleHRlbnNpb24gc3RyaW5n
cyB0aGF0IGFyZSBub3QgeWV0IGRlZmluZWQgaW4gdGhlc2Ugc2NoZW1hcywgc3VjaCBhcwo+Pj4+
Pj4+IHN1cG0sIHJ1bm5pbmcgJ21ha2UgZHRic19jaGVjayBXPTMnIGZhaWxzIHdpdGg6ICdzdXBt
JyBpcyBub3Qgb25lIG9mCj4+Pj4+Pj4gWydpJywgJ20nLCAnYScsIC4uLl0sIGZvbGxvd2VkIGJ5
ICJVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZC4iCj4+Pj4+Pgo+Pj4+Pj4g
SWYgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFt
bCBpcyBpbmNvbXBsZXRlCj4+Pj4+PiB3aXRoIHJlc3BlY3QgdG8gcmF0aWZpZWQgZXh0ZW5zaW9u
cywgSSBndWVzcyB0aGUgcmlnaHQgYXBwcm9hY2ggaXMgdG8gYW1lbmQKPj4+Pj4+IGl0IGFuZCBu
b3QgdG8gY3VydGFpbCB0aGUgQ1BVIGRlc2NyaXB0aW9uLgo+Pj4+Pgo+Pj4+PiBBYnNvbHV0ZWx5
LiBJZiB0aGUgY3B1IHN1cHBvcnRzIHNvbWV0aGluZyB0aGF0IGlzIG5vdCBkb2N1bWVudGVkLCB0
aGVuCj4+Pj4+IHBsZWFzZSBkb2N1bWVudCBpdCByYXRoZXIgdGhhbiBvbWl0IGZyb20gdGhlIGRl
dmljZXRyZWUuCj4+Pj4KPj4+PiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIE1heSBJIGNsYXJpZnkg
b25lIHRoaW5nPyBCb3RoIG9mIHlvdSBtZW50aW9uZWQKPj4+PiBkb2N1bWVudCB0aGVtLCBnaXZl
biB0aGUgYW1vdW50IG9mIG1pc3NpbmcgZXh0ZW5zaW9ucywgaXMgaXQgYWNjZXB0YWJsZSBpZgo+
Pj4+IEkgc3VibWl0IGEgcHJlcmVxdWlzaXRlIHBhdGNoIHRoYXQgb25seSBkb2N1bWVudHMgdGhl
c2Ugc3RyaW5ncyBpbgo+Pj4+IHJpc2N2L2V4dGVuc2lvbnMueWFtbCBwbHVzIHRoZSBuZWNlc3Nh
cnkgaHdwcm9iZSBleHBvcnQ/IExlYXZpbmcgdGhlIGFjdHVhbAo+Pj4+IHVzYWdlIG9mIHRoZXNl
IGV4dGVuc2lvbnMgKG5hbWVkIGZlYXR1cmVzKSB0byB0aGUgZnV0dXJlIHBhdGNoZXMuCj4+Pj4K
Pj4+PiBUbyBwcm92aWRlIHNvbWUgY29udGV4dCBvbiB3aHkgSSBhc2s6IEkndmUgaW52ZXN0aWdh
dGVkIHRoZSBjb21taXRzICYgbGttbAo+Pj4+IGhpc3Rvcnkgb2YgUklTQy1WIGV4dGVuc2lvbnMg
c2luY2UgdjYuNSwgYW5kIEkgc3VtbWFyaXplZCB0aGUgY3VycmVudCBzdGF0dXMKPj4+PiByZWdh
cmRpbmcgdGhlIFJWQTIzIHByb2ZpbGUgaGVyZToKPj4+PiBbMV0gc3RhdHVzIGluIHY2LjE4IChp
bmMuIHY2LjE5LXJjMSk6Cj4+Pj4gaHR0cHM6Ly9kb2N1bGFyeHUuZ2l0aHViLmlvL3J2YTIzL2xp
bnV4LWtlcm5lbC1jb3ZlcmFnZS5odG1sCj4+Pj4gWzJdIHN1cHBvcnQgZXZvbHV0aW9uIHNpbmNl
IHY2LjU6Cj4+Pj4gaHR0cHM6Ly9kb2N1bGFyeHUuZ2l0aHViLmlvL3J2YTIzL3J2YTIzLWtlcm5l
bC1zdXBwb3J0LWV2b2x1dGlvbi5odG1sCj4+Pj4KPj4+PiBTdHJpY3RseSBkZXNjcmliaW5nIHRo
ZSBTcGFjZW1pVCBYMTAwL0szIChvciBhbnkgY29yZSkgYXMgUlZBMjMtY29tcGxpYW50Cj4+Pj4g
cmVxdWlyZXMgYWRkaW5nIHRoZXNlIGV4dGVuc2lvbnMgdGhhdCBhcmUgY3VycmVudGx5IG1pc3Np
bmcgZnJvbQo+Pj4+IHRoZSBrZXJuZWwgYmluZGluZ3M6Cj4+Pj4gUlZBMjNVNjQ6IFppY2NpZiwg
WmljY2Ftb2EsIFppY2Nsc20sIFphNjRycwo+Pj4+IFJWQTIzUzY0OiBTczFwMTMsIFNzY2NwdHIs
IFNzdHZlY2QsIFNzdHZhbGEsIFNzY291bnRlcmVudywgU3N1NjR4bCwKPj4+PiAgICAgICAgICAg
IFNoYSwgU2hjb3VudGVyZW53LCBTaHZzdHZhbGEsIFNodHZhbGEsIFNodnN0dmVjZCwgU2h2c2F0
cGEsIFNoZ2F0cGEKPj4+Cj4+Pgo+Pj4+IFBsdXMgJ1N1cG0nLCAnWmljNjRiJywgJ1Nzc3RhdGVl
bicsICdCJyB3aGVyZSB0aGUga2VybmVsIHN1cHBvcnRzIHRoZW0gYnV0Cj4+Pj4gdGhleSBhcmUg
bm90IGxpdGVyYWxseSBkb2N1bWVudGVkIGluIHlhbWwuCj4+Pgo+Pj4gSSBkb24ndCB0aGluayBT
dXBtIGlzIHN1aXRhYmxlIGZvciBkZXZpY2V0cmVlLCBkb2Vzbid0IGl0IGRlc2NyaWJlCj4+PiB3
aGF0IHRoZSBrZXJuZWwvdXNlcnNwYWNlIGFyZSBjYXBhYmxlIG9mIHJhdGhlciB0aGFuIGhhcmR3
YXJlPwo+Pj4gWmljNjRiIGRvZXNuJ3Qgc291bmQgbGlrZSBoYXJkd2FyZSBkZXNjcmlwdGlvbiAo
c28gbm90IHJlYWxseSBzdWl0YWJsZQo+Pj4gZm9yIGRldmljZXRyZWUgZWl0aGVyKSBidXQgYmxv
Y2sgc2l6ZSBpbmZvcm1hdGlvbiBpcyBhbHJlYWR5IHJlcHJlc2VudGVkCj4+PiBieSBzb21lIGV4
aXN0aW5nIHByb3BlcnRpZXMgKHNlZSByaXNjdixjYm8qLWJsb2NrLXNpemUgaW4gcmlzY3YvY3B1
cy55YW1sKQo+Pj4gYW5kIGR1cGxpY2F0aW5nIHRoYXQgaW5mb3JtYXRpb24gaXMgbm90IHJlYWxs
eSBhIGdyZWF0IGlkZWEuCj4+Pgo+Pj4gSSdsbCBhZG1pdCB0aGF0IEkgZG8gbm90IHJlYWxseSB1
bmRlcnN0YW5kIFN4c3RhdGVlbiBhbmQgaG93IHRoZXkgd29yaywKPj4+IGJ1dCBteSB1bmRlcnN0
YW5kaW5nIHdhcyB0aGF0IGtub3dpbmcgYWJvdXQgU21zdGF0ZWVuIGlzIHN1ZmZpY2llbnQgYW5k
Cj4+PiBpbXBsaWVkIFNzdGF0ZWVuLCBidXQgaGF2aW5nIFNzc3RhdGVlbiBkZWZpbmVkIHNlZW1z
IGhhcm1sZXNzIGFuZAo+Pj4gcG9zc2libGUuIEkgdGhpbmsga3ZtIGlzIHRoZSBvbmx5IHVzZXIg
b2YgdGhpcyBhdCB0aGUgbW9tZW50LCBzbwo+Pj4gcHJvYmFibHkgd29ydGggQ0NpbmcgQW51cCBh
bmQgbWF5YmUgRHJldyBKb25lcyBvbiB0aGUgcGF0Y2ggYWRkaW5nCj4+PiBTc3N0YXRlZW4gdG8g
bWFrZSBzdXJlIGl0IG1ha2VzIHNlbnNlLgo+Pgo+PiBTdXBtIGlzIGRlc2NyaWJlZCBpbgo+Pgo+
PiBSSVNDLVYgUG9pbnRlciBNYXNraW5nCj4+IFZlcnNpb24gMS4wLCAxMC8yMDI0OiBSYXRpZmll
ZAo+PiBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vcmlzY3YvcmlzY3Ytai1leHRl
bnNpb24vbWFzdGVyL3pqcG0tc3BlYy5wZGYKPj4KPj4gVGhlIGludGVycHJldGF0aW9uIHRha2Vu
IGJ5IFFFTVUgaGFzIGJlZW46Cj4+Cj4+ICogU3VwbSBpbXBsaWVzIFNzbnBtIGFuZCBTbW5wbQoK
VGhpcyBpcyBub3QgY29ycmVjdCBmb3Igc3lzdGVtIGVtdWxhdGlvbi4gU3VwbSAocG9pbnRlciBt
YXNraW5nIHZpc2libGUgaW4gdGhlClUtbW9kZSBleGVjdXRpb24gZW52aXJvbm1lbnQpIHJlcXVp
cmVzIGV4YWN0bHkgKFMgPyBTc25wbSA6IFNtbnBtKSwgbm90IGJvdGggb2YKdGhlbS4KCj4+ICog
UlZBMjMgY2FwYWJsZSBtYWNoaW5lIG1vZGVscyBkaXNwbGF5IGl0IGluIHRoZSBkZXZpY2UtdHJl
ZQoKVGhpcyBpcyBhbHNvIG5vdCBjb3JyZWN0IGZvciBzeXN0ZW0gZW11bGF0aW9uLiBJdCBpcyBp
bXBvc3NpYmxlIGZvciBRRU1VIHRvIGtub3cKaWYgcG9pbnRlciBtYXNraW5nIGlzIHZpc2libGUg
dG8gdGhlIFUtbW9kZSBleGVjdXRpb24gZW52aXJvbm1lbnQsIGJlY2F1c2UgUUVNVQpkb2VzIG5v
dCBwcm92aWRlIHRoZSBVLW1vZGUgZXhlY3V0aW9uIGVudmlyb25tZW50LiBTb2Z0d2FyZSBpbnNp
ZGUgdGhlIFZNIGRvZXMuCgo+PiBJZiBTdXBtIGlzIG5vdCBzaG93biBpbiB0aGUgZGV2aWNlLXRy
ZWUsIHNvZnR3YXJlIG1pZ2h0IGFzc3VtZSB0aGF0IHRoZQo+PiBzeXN0ZW0gZG9lcyBub3Qgc3Vw
cG9ydCBwb2ludGVyIG1hc2tpbmcgaW4gdXNlciBtb2RlIGFuZCBpcyBub3QgUlZBMjMKPj4gY29t
cGxpYW50LgoKU29mdHdhcmUgc2hvdWxkbid0IGJlIGxvb2tpbmcgZm9yIFN1cG0gaW4gdGhlIGRl
dmljZXRyZWUsIGJlY2F1c2UgdGhlIGRldmljZXRyZWUKZG9lcyBub3QgZGVzY3JpYmUgdGhlIHBy
b3BlcnRpZXMgb2YgdGhlIFUtbW9kZSBleGVjdXRpb24gZW52aXJvbm1lbnQuCgo+PiBIZW5jZSBJ
IHdvdWxkIHN1Z2dlc3Q6Cj4+Cj4+IElmIHRoZSBYMTAwIGNvcmVzIGhhdmUgU3NucG0gYW5kIFNt
bnBtLCBhZGQgU3VwbSB0byB0aGUgZGV2aWNlLXRyZWUuCj4+Cj4+IElmIHRoZSBrZXJuZWwgZG9l
cyBub3Qgc3VwcG9ydCB1c2VyIHNwYWNlIHBvaW50ZXIgbWFza2luZywgdGhlIGtlcm5lbCBzaG91
bGQKPj4gZmlsdGVyIG91dCBTdXBtIGFuZCBub3QgYW5ub3VuY2UgaXQsIG5laXRoZXIgaW4gL3By
b2MvY3B1aW5mbyBub3IgdmlhCj4+IGh3cHJvYmUuCj4gCj4gU2FtdWVsIHNlZW1zIHRvIGhhdmUg
c29tZSBzcGVjaWZpYyB0aG91Z2h0cyBvbiBob3cgdGhpcyB3b3JrcywgZ2l2ZW4gaGUKPiBkaWRu
J3QgYmxpbmRseSBpbXBsZW1lbnQgc3NucG0gYW5kIHNtbnBtLCBidXQgaGFzIG1hZGUgc3VwbSBi
ZSBtb2RlCj4gZGVwZW5kZW50IGFuZCBub3QgcGVybWl0dGVkIGluIGR0LCBob3BlZnVsbHkgaGUg
c2VlcyB0aGlzLgo+IAo+IFBlcnNvbmFsbHkgSSdtIG5vdCBjb252aW5jZWQgdGhhdCBwdXR0aW5n
IHN1cG0gaW4gZHQgbWFrZXMgc2Vuc2UsIGJ1dAo+IGluc3RlYWQgdGhlIGtlcm5lbCBzaG91bGQg
aW1wbHkgaXQgaWYgdGhlIHN4bnBtIGV4dGVuc2lvbiBtYXRjaGluZyB0aGUKPiBtb2RlIHRoZSBr
ZXJuZWwgaXMgb3BlcmF0aW5nIGluIGlzIHByZXNlbnQgYW5kIFJJU0NWX0lTQV9TVVBNIGlzIHNl
dCBpbgo+IEtjb25maWcuIFRoYXQncyBlZmZlY3RpdmVseSBob3cgaXQgd29ya3MgYXQgcHJlc2Vu
dCwgZXhjZXB0IGl0J2QgaW52b2x2ZQo+IHByb21vdGluZyBSSVNDVl9JU0FfU1VQTSB0byBhICJy
ZWFsIiBleHRlbnNpb24gaW5zdGVhZCBvZiBiZWluZyBhIG1hY3JvLgo+IEEgdmFsaWRhdGUgY2Fs
bGJhY2sgc2hvdWxkIGVhc2lseSBiZSBhYmxlIHRvIGhhbmRsZSBjaGVja2luZyB0aGUKPiBtb2Rl
IGFuZCB3aGV0aGVyIHRoZSBLY29uZmlnIG9wdGlvbiBpcyBzZXQuCj4gVGhhdCB3YXkgaXQgd291
bGQgZ2V0IGV4cG9zZWQgdG8gdXNlcnNwYWNlIHVzaW5nIHRoZSBhY3R1YWwgbWVjaGFuaXNtcywK
PiByZWFkaW5nIHRoZSBkZXZpY2V0cmVlIGl0c2VsZiBmcm9tIHVzZXJzcGFjZSBpcyBub3QgYSB2
YWxpZCB3YXkgb2YKPiBjaGVja2luZyB3aGF0IGV4dGVuc2lvbnMgYXJlIHVzYWJsZSBhZnRlciBh
bGwuCgpXZSBhbHJlYWR5IGRvIHRoaXMgZm9yIGh3cHJvYmUoKSwgc28gdGhlIG9ubHkgZGlmZmVy
ZW5jZSBpcyB0aGF0IFN1cG0gd291bGQgYmUKYWRkZWQgdG8gL3Byb2MvY3B1aW5mby4gSSBkb24n
dCB0aGluayBJIGhhdmUgYSBwcm9ibGVtIHdpdGggdGhpcy4KClJlZ2FyZHMsClNhbXVlbAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
