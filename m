Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BFBD711D6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iif6SJ55HxxnLKmhQtOAcskaN7x8pOiHDJiI2ljBipI=; b=lQHuztU+hXd2hr
	+IoudMKXGSWjcllaUUPz3wnwK2Rm0UapRdcgQZ/TVF5sCxZbEb46oHZxdNdfuQMpPNi830E9BwdKx
	juKeiKjkKYLMsj9dPt801LYQj/jWQfk+Z9v8zZnuZp/rdSvKx/pfOh/c/09MIgTIZ/dMnBs61IGzM
	UurYS/LT8rTq5RfvSNoQNGyjTiKxVdC0/6xtMA2jwVv3gALv2VZFUyy1pF8YEdlnGZ+LZEnFd/zPQ
	bhqmq23GOimpVLnQeh919Cgs/lzOu2Wyk3k4qxX1pgLq95eSN4/ZQURYE03/fDIS3uatUziw2DDxA
	Ybm2uHJKGdOc1FffHCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVX8-00000009ntj-3OWr;
	Fri, 19 Dec 2025 08:08:18 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVX4-00000009nsZ-0kyM
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:08:17 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 677743F85A
	for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1766131690;
	bh=EaxKPv8EzMQw4Q+d/tnNq9TX6lEJW/rr1OxXypt8e2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=lMO9chE9CcnVozxEYLHoj4xFpT1kl3IskAJ3/7366fiBllXxh85PbwM5l0L21nAxi
	 kveo6QHHrBaaNckQ9Bi8YvvjL8P9o+j793sFO3xmBJbT59h86Z+VDZq+ElTmgcJfuz
	 68tR5M1xM5GiUqaXs277UbQkeWZfb1/qJCrkQJXSvGBFJLP7dSqQ/pHx6FJM0j8RP+
	 /+WmTHSF844Wh7jvZxoUDTHq5E43NVLDyHYl/0epFZmfS9bcH+HvQxWPTIa/Bv1kEB
	 ZmPudXl3Of8tNNpQ4DfmeygGGuidzoUl/Gk57i0o62qRxymPATEqaQ7Irgoe3oXziE
	 8MCss7G3kAQ7B5FiinJt62iv+RWAOVmeedSFHfhifI/Vn9eLBgWuRRuaKx7P4v/xf7
	 lveNktI8e0G8AyZJMbU+djvve4d6KXQmeIMEHEuYfDD6fAhqQB1O57JhAgb8h6jsWJ
	 44ZVR2GxTTl0jWh1YakMkXlxgAQDw+iFL3vd0EvBmzNNSfNYD5SfD9o0jll/LgCIR+
	 Ne4ZbQ++AsjXQ05i+ooBqv4i6ENQ9D7o9Ra8nmkCKeffO/IsXmSzKDCpoTXu9mKZhf
	 Aeie9E8yHXg6uBmx69uN2jtnDu1PjhPicgX4OJfE5O5WSeMnkx1lNKtIAKVGMKLy/+
	 sDa+8XYzY1uiRoa5xUabefr4=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-430fd96b440so725015f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 00:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131690; x=1766736490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EaxKPv8EzMQw4Q+d/tnNq9TX6lEJW/rr1OxXypt8e2A=;
        b=TikoiVMQa7VqKpdOBTHaaKzMViuZlHpOkouo6qZPbLI1CoWkqfmcHw4icKrqQnQU8U
         TpxIHcx25i0rsfRhP29wGu8QXdWa1GzndZf3bJHOxNeuzcdNK7QMTRywRPZrdWUDHdLv
         5lT8PAu9Nz9Tuo0CnehdOMIkFsnCAA2GeLxCzaT+9PJiByaHQSNMmCz0QsducTxJ+xaV
         JyuTJ/U4JuVKrZLeG/Z++1Cy3A3DRD1xD03GlYj8YsX2KzUaNrOAJ6wU4txiVrZOH3Dv
         xYkK0Fn7AhT+2CZh96AKjQ7E7C2kdNiGQrMeCGVsDLZ+dhXnvZMIHrbjFk+pbCrUFPsO
         VJUA==
X-Forwarded-Encrypted: i=1; AJvYcCX8qZrF/HD4WK5+Rrp+ygyjGMzs0ULrhpd2BXYm1TBw7Zo+eLXgi0eLPFTkPfmLjIXVtSAeyliBgvasgw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+HX4eP3OFTYfI77msYNkqn6H/ABrr9jEHQT6krgMUHJOPFAew
	GcLLT2vrRS8ykq9HUQMvNewYo+DUQSaUrbG26YttdQTcRhm+ZjAcIi/Pfce404I9ldKU+pU0cI1
	yRUxFuR0HhY+sFasptXGGrHzKceAGTKno9yW8/FeaoADc4ctMaagBZWya4yw6Orc/qs5QX4MdBH
	BDNdSDI2SmhQ==
X-Gm-Gg: AY/fxX5PAuDuk1z7ogxm1NXCITa6GHzuGDiLQlqvWiw6Bh6RyxdmQpixfyZCbg+gfDH
	vOvJJfLQTxchJv7jrWXoT/1EOuiRYBxUWJmOGYFJ3t0HVO1J8lJj9nOZ7idLCIqEusTM4w7UW9j
	QzFwyAEQRvjpcrWaNLkqPCKTNRtWf0j5RfgOD9SNiOJqPnKjWC98/lKlb7VnALQuUWNNFrMaKy+
	Xg6ecAZLIiuEDFGJt26l+ZtDxMUXn7YLpN8pu9ZqNjE9bPpF1VM0+TBjQj9u1UivvMwGH6cDHrs
	1xVPWiTCfddsEyhxPMfougPs2ToppGnP2FBLeb9kq+j4+kUQRYehhoYk0wranOAyKFeBGfOOb/I
	u+9ALHSwyu73J7rx8uQ2DkJqrDCNa4d+DPs4bAp3NugGXN/mZnRrjfvwPLGnnNg/U9zdKZl9hjT
	5iymUbVyA=
X-Received: by 2002:a05:6000:1a8d:b0:430:f6ad:1814 with SMTP id ffacd0b85a97d-4324e7045eemr2091891f8f.58.1766131689899;
        Fri, 19 Dec 2025 00:08:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+g+eItW+D6N0t8wn4CUhhQAlan/FWbDAzi/nwqnnLL5ClhWb3g9EwyncInKQ4MUzOoaMdTA==
X-Received: by 2002:a05:6000:1a8d:b0:430:f6ad:1814 with SMTP id ffacd0b85a97d-4324e7045eemr2091855f8f.58.1766131689463;
        Fri, 19 Dec 2025 00:08:09 -0800 (PST)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea2267fsm3416457f8f.12.2025.12.19.00.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 00:08:08 -0800 (PST)
Message-ID: <212e6371-245e-4f44-98a0-5e1db47222a1@canonical.com>
Date: Fri, 19 Dec 2025 09:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Guodong Xu <guodong@riscstar.com>, Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
 <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com>
 <20251218-basil-quantum-225ce16e4699@spud>
 <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_000814_604027_2DEFB96D 
X-CRM114-Status: GOOD (  26.16  )
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

T24gMTIvMTkvMjUgMDM6MDMsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gSGksIENvbm9yIGFuZCBIZWlu
cmljaAo+IAo+IE9uIFRodSwgRGVjIDE4LCAyMDI1IGF0IDg6NTbigK9BTSBDb25vciBEb29sZXkg
PGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIERlYyAxNywgMjAyNSBhdCAw
OTowNzoxNEFNICswMTAwLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+Pj4gT24gMTIvMTcv
MjUgMDg6MTEsIEd1b2RvbmcgWHUgd3JvdGU6Cj4+Cj4+Pj4gU3BlY2lmaWNhbGx5LCBJIG11c3Qg
YWRoZXJlIHRvCj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbCAoYW5kIGNwdXMueWFtbCBmb3IKPj4+PiBwcm9wZXJ0aWVzIGxpa2UgJ3Jp
c2N2LHN2MzknIHdoaWNoIHN0YW5kcyBmb3IgdGhlIGV4dGVuc2lvbiBTdjM5KS4gSWYgSQo+Pj4+
IGFkZCBleHRlbnNpb24gc3RyaW5ncyB0aGF0IGFyZSBub3QgeWV0IGRlZmluZWQgaW4gdGhlc2Ug
c2NoZW1hcywgc3VjaCBhcwo+Pj4+IHN1cG0sIHJ1bm5pbmcgJ21ha2UgZHRic19jaGVjayBXPTMn
IGZhaWxzIHdpdGg6ICdzdXBtJyBpcyBub3Qgb25lIG9mCj4+Pj4gWydpJywgJ20nLCAnYScsIC4u
Ll0sIGZvbGxvd2VkIGJ5ICJVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZC4i
Cj4+Pgo+Pj4gSWYgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbCBpcyBpbmNvbXBsZXRlCj4+PiB3aXRoIHJlc3BlY3QgdG8gcmF0aWZpZWQgZXh0
ZW5zaW9ucywgSSBndWVzcyB0aGUgcmlnaHQgYXBwcm9hY2ggaXMgdG8gYW1lbmQKPj4+IGl0IGFu
ZCBub3QgdG8gY3VydGFpbCB0aGUgQ1BVIGRlc2NyaXB0aW9uLgo+Pgo+PiBBYnNvbHV0ZWx5LiBJ
ZiB0aGUgY3B1IHN1cHBvcnRzIHNvbWV0aGluZyB0aGF0IGlzIG5vdCBkb2N1bWVudGVkLCB0aGVu
Cj4+IHBsZWFzZSBkb2N1bWVudCBpdCByYXRoZXIgdGhhbiBvbWl0IGZyb20gdGhlIGRldmljZXRy
ZWUuCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBNYXkgSSBjbGFyaWZ5IG9uZSB0aGluZz8g
Qm90aCBvZiB5b3UgbWVudGlvbmVkCj4gZG9jdW1lbnQgdGhlbSwgZ2l2ZW4gdGhlIGFtb3VudCBv
ZiBtaXNzaW5nIGV4dGVuc2lvbnMsIGlzIGl0IGFjY2VwdGFibGUgaWYKPiBJIHN1Ym1pdCBhIHBy
ZXJlcXVpc2l0ZSBwYXRjaCB0aGF0IG9ubHkgZG9jdW1lbnRzIHRoZXNlIHN0cmluZ3MgaW4KPiBy
aXNjdi9leHRlbnNpb25zLnlhbWwgcGx1cyB0aGUgbmVjZXNzYXJ5IGh3cHJvYmUgZXhwb3J0PyBM
ZWF2aW5nIHRoZSBhY3R1YWwKPiB1c2FnZSBvZiB0aGVzZSBleHRlbnNpb25zIChuYW1lZCBmZWF0
dXJlcykgdG8gdGhlIGZ1dHVyZSBwYXRjaGVzLgoKQWRkaW5nIHRoZSBtaXNzaW5nIGV4dGVuc2lv
bnMgdG8KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbAppcyB3aGF0IGl0IHRha2VzIHRvIGRlc2NyaWJlIHRoZSBLMTAwIGNvcmVzIGluIHRoZSBk
ZXZpY2UtdHJlZS4KCkRpc2NvdmVyaW5nIHRoZSBuZXcgZXh0ZW5zaW9ucyBhcyBDUFUgZmVhdHVy
ZXMgYW5kIGV4cG9zaW5nIHRoZW0gdmlhIApod3Byb2JlIGlzIHByb2JhYmx5IGJlc3QgaGFuZGxl
ZCBpbiBhIHNlcGFyYXRlIHBhdGNoIHNlcmllcy4KCkJlc3QgcmVnYXJkcwoKSGVpbnJpY2gKCj4g
Cj4gVG8gcHJvdmlkZSBzb21lIGNvbnRleHQgb24gd2h5IEkgYXNrOiBJJ3ZlIGludmVzdGlnYXRl
ZCB0aGUgY29tbWl0cyAmIGxrbWwKPiBoaXN0b3J5IG9mIFJJU0MtViBleHRlbnNpb25zIHNpbmNl
IHY2LjUsIGFuZCBJIHN1bW1hcml6ZWQgdGhlIGN1cnJlbnQgc3RhdHVzCj4gcmVnYXJkaW5nIHRo
ZSBSVkEyMyBwcm9maWxlIGhlcmU6Cj4gWzFdIHN0YXR1cyBpbiB2Ni4xOCAoaW5jLiB2Ni4xOS1y
YzEpOgo+IGh0dHBzOi8vZG9jdWxhcnh1LmdpdGh1Yi5pby9ydmEyMy9saW51eC1rZXJuZWwtY292
ZXJhZ2UuaHRtbAo+IFsyXSBzdXBwb3J0IGV2b2x1dGlvbiBzaW5jZSB2Ni41Ogo+IGh0dHBzOi8v
ZG9jdWxhcnh1LmdpdGh1Yi5pby9ydmEyMy9ydmEyMy1rZXJuZWwtc3VwcG9ydC1ldm9sdXRpb24u
aHRtbAo+IAo+IFN0cmljdGx5IGRlc2NyaWJpbmcgdGhlIFNwYWNlbWlUIFgxMDAvSzMgKG9yIGFu
eSBjb3JlKSBhcyBSVkEyMy1jb21wbGlhbnQKPiByZXF1aXJlcyBhZGRpbmcgdGhlc2UgZXh0ZW5z
aW9ucyB0aGF0IGFyZSBjdXJyZW50bHkgbWlzc2luZyBmcm9tCj4gdGhlIGtlcm5lbCBiaW5kaW5n
czoKPiBSVkEyM1U2NDogWmljY2lmLCBaaWNjYW1vYSwgWmljY2xzbSwgWmE2NHJzCj4gUlZBMjNT
NjQ6IFNzMXAxMywgU3NjY3B0ciwgU3N0dmVjZCwgU3N0dmFsYSwgU3Njb3VudGVyZW53LCBTc3U2
NHhsLAo+ICAgICAgICAgICAgU2hhLCBTaGNvdW50ZXJlbncsIFNodnN0dmFsYSwgU2h0dmFsYSwg
U2h2c3R2ZWNkLCBTaHZzYXRwYSwgU2hnYXRwYQo+IFBsdXMgJ1N1cG0nLCAnWmljNjRiJywgJ1Nz
c3RhdGVlbicsICdCJyB3aGVyZSB0aGUga2VybmVsIHN1cHBvcnRzIHRoZW0gYnV0Cj4gdGhleSBh
cmUgbm90IGxpdGVyYWxseSBkb2N1bWVudGVkIGluIHlhbWwuCj4gCj4gSXMgdGhpcyBhcHByb2Fj
aCBhY2NlcHRhYmxlIHRvIHlvdT8gSWYgc28sIEkgd2lsbCBwcm9jZWVkIHdpdGggc3VibWl0dGlu
ZyB0aGVtLgo+IAo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2guCj4gCj4gQmVzdCByZWdhcmRzLAo+IEd1
b2RvbmcgWHUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
