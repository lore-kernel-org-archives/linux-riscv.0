Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50623E6748B
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Dec 2025 00:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsIWfQ8vgO3PI6KvU/tvbbQUgSFDKhHqdEfO+e65cXo=; b=AVKLjT2VYhTAnE
	eEAbknn5I3izhW000RLc9VPB/YKdMTzja6dW2ja0qV2es5YyjQfQ4BGYsnF1pQMecosdi/XMcTH82
	+xgBL6VDvxmH3wPLmepPmqJwua1nrxyRUNhroePC29byhHcxGpfKAYpz8Nxx3/qOidufS2XC/1IKC
	TO2Y4zUJ+TEOtd+/oKz/6I2Ezk+ZSp6HKOiIun1EZ31GdK1xUwMUd6JjhPbzPlcct7XoeUz3zTvo/
	Fnfd/+cqXfCMBEfZQD30HErwch+AeAbLOajyHb2GvK5rswDBzEpD8ZlmMRzr8J6n9KiT7bLdyp3YC
	rYXTmrpdcvDq3gV+bgLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX71q-0000000C0HM-06I8;
	Sun, 21 Dec 2025 00:10:30 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX71k-0000000C0Gs-32yq
	for linux-riscv@lists.infradead.org;
	Sun, 21 Dec 2025 00:10:28 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CFEF240191
	for <linux-riscv@lists.infradead.org>; Sun, 21 Dec 2025 00:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1766275819;
	bh=EQ5RLiXnHo1F0yqQLHlxodf/GRaWJlOplqUmCNv4d9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=IbYPLoRlao1vOAWV7vcl5QrTFAHk4wh7xZftuEeW9j+xS3mwR9BQCIsRKLPA0WqW2
	 c0lZkbxB1dwxUbisqtcTbwU1Y6G6UcQvb2NaJ5JYwSLIYQkQexWnjQWOMDzrlthnWl
	 tngNFVGTz0Wrc5rWHB3X5XRjREqJNuEa6p6BuGF+nCpIomPKT26LfCqotQ/Wea8dnt
	 QjmBGkq/+fmbIuWlE7NWcR7ehLjdOAtIiCNpCFlSnAS1KYHskxBKv2Qa2Mjdki70Wg
	 Iy2eJjYx9SgnJaTUa74H0Z7O3uXkkaJ5+HaDOKoQtCnM1alDOeHmCX73E54V7xhxIV
	 LXbxRjqIIp/yjRhkmAy1kUAP1ooxeKdGnT8AeodXtZzE+NXwXhqThVfjKnaQpB0zm6
	 7TgbzQsNapBe5tMU24C1vj0/9QMqXydT3pxDXsAO9QjVR9OE6p6nxiqHFUgdNAyXvn
	 mgewoo1hQbhFgrdwFhxH6Fuke9SnjtdKlUniatGRHR2n3qUJcLPVV42jQp46ybpHT7
	 yQhtqhVVw8Bg3TilJTk2u9QyzhMacdf6X7VnDYwphkH4kV7Dk9NAIPatOJ/hvAuskp
	 fW5nzOfYBqFQcBiDFAQCJP6JQAAPbp3RQ6KZHpboFnuBWcMC+Yr1irALonEmtQCJdx
	 RrIdUwOPFBRA6NchlzBdz2M4=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b802843b0bbso241003166b.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Dec 2025 16:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766275819; x=1766880619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQ5RLiXnHo1F0yqQLHlxodf/GRaWJlOplqUmCNv4d9U=;
        b=PydYt8TzYb3tk1ejlwjKWxEMS83tIugHCOajJbRFT6qs1XKyWlx0NamBicgPPsMIvN
         NXi339l5RxruZDhyoxczbx0zIXE5QylzHll+NIihW/CPSviImVN6fY6yzbmeQOVen19g
         wcpuidIg1H3QahZpDiLIC4S7KT+TKqGqsVa2X1J/hmBrcErxxalQsR6rADaJJJDGC1iA
         zlaMHCimiRqs7X1WkIfzSBjQ1m2mxpn8mCkp6vn28s0aRJOAGY8KdeVgtLNeh+UAeK6U
         K8AZcAlCBmylHZVAnk4yI7nKtdDspOeBw3qaE2n8E5iivVZEAFsZeJaoGV6OvFyZcNZ0
         +yCA==
X-Forwarded-Encrypted: i=1; AJvYcCUuPj7wlHKLPFnghDDj3Q8HZogGgDCB6o2jHnfNA4eE39VUs+ORB/wAsinyiXSIpJOJh7AWAyOEEpcqCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Gll5fDyuAx00SjWzGjeChJCOkXhVwJPL5u0lf9Eo3ps9zrMz
	UjSAiOsG7CXyqt+wXfH5TaCHGJsFTbBaIUQblpqGq2HSPozl8qRXFnVyoiy4D3KSsi+SmNcH/vp
	OPssyserNzLsHEv2expdcQuAMoJi9acUR5wazjqWs5/RGHDlas3pU6WF4ZeXRkTExQCKASqmlEk
	6iku/g0y7hKw==
X-Gm-Gg: AY/fxX43lHj4/BZKJwYi9ju1GsUV3t7hI9UvVPSZ2x7+zqi5I0GnEDQ4K5Fk2ThrB8j
	hfgJh/c0l44fMSErRU0tRkg/kV1Z6XQGywJ6lXpMhnWI3L6fSAZd+AWzz9WLycp+kLf+BrS7NRa
	t3++HyGcjHhrBCHezxwTmVxjArxP+Gs78lGFbSwR2C97YJEjKN7iIfGIbQs2sKKh+nvD2OT3jz0
	oLVwNp9//tUWk8UhCWLUol78H4SduNJL7K0JtBaSRGKtIDSywtGlXKi3gMo5cdj9w3GjzGzkvMF
	Td3EufCWFSsg8uKCEqbvgYXF65BCxvqGnl7haVzJjktHq0ccBFXdgD3iQmsMiHINXx8N5IG53Xp
	g6xQ21h3W/65bDSWOySHhBGviLqTJsGxbjTbDHybh9pbUEpr/NT5FTkpRIodrX/VEjGi/f/qqvD
	UsPA==
X-Received: by 2002:a17:907:1b0f:b0:b72:6ace:e5b6 with SMTP id a640c23a62f3a-b8036eba993mr656863666b.10.1766275819275;
        Sat, 20 Dec 2025 16:10:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjDNV981RWKgeVrEVOLEEbudUqo1wYPVxXW39PfSBF57U8UaF/sswqkvNfymrxCDZi7QfOUw==
X-Received: by 2002:a17:907:1b0f:b0:b72:6ace:e5b6 with SMTP id a640c23a62f3a-b8036eba993mr656860466b.10.1766275818725;
        Sat, 20 Dec 2025 16:10:18 -0800 (PST)
Received: from ?IPV6:2a02:3037:6e1:c5c5:8b4c:2e28:afe4:1483? ([2a02:3037:6e1:c5c5:8b4c:2e28:afe4:1483])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8044f4acdbsm455456466b.22.2025.12.20.16.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Dec 2025 16:10:18 -0800 (PST)
Message-ID: <4e4c9e7b-d95c-4157-94c3-b06002f94a48@canonical.com>
Date: Sun, 21 Dec 2025 01:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Conor Dooley <conor@kernel.org>, Guodong Xu <guodong@riscstar.com>
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
 <20251220-repacking-football-c79e660e788a@spud>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20251220-repacking-football-c79e660e788a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_161025_050316_3B2B5B3A 
X-CRM114-Status: GOOD (  27.77  )
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

T24gMTIvMjEvMjUgMDA6MjMsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBGcmksIERlYyAxOSwg
MjAyNSBhdCAxMDowMzoyNEFNICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+PiBIaSwgQ29ub3Ig
YW5kIEhlaW5yaWNoCj4+Cj4+IE9uIFRodSwgRGVjIDE4LCAyMDI1IGF0IDg6NTbigK9BTSBDb25v
ciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIFdlZCwgRGVjIDE3
LCAyMDI1IGF0IDA5OjA3OjE0QU0gKzAxMDAsIEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4+
Pj4gT24gMTIvMTcvMjUgMDg6MTEsIEd1b2RvbmcgWHUgd3JvdGU6Cj4+Pgo+Pj4+PiBTcGVjaWZp
Y2FsbHksIEkgbXVzdCBhZGhlcmUgdG8KPj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCAoYW5kIGNwdXMueWFtbCBmb3IKPj4+Pj4gcHJv
cGVydGllcyBsaWtlICdyaXNjdixzdjM5JyB3aGljaCBzdGFuZHMgZm9yIHRoZSBleHRlbnNpb24g
U3YzOSkuIElmIEkKPj4+Pj4gYWRkIGV4dGVuc2lvbiBzdHJpbmdzIHRoYXQgYXJlIG5vdCB5ZXQg
ZGVmaW5lZCBpbiB0aGVzZSBzY2hlbWFzLCBzdWNoIGFzCj4+Pj4+IHN1cG0sIHJ1bm5pbmcgJ21h
a2UgZHRic19jaGVjayBXPTMnIGZhaWxzIHdpdGg6ICdzdXBtJyBpcyBub3Qgb25lIG9mCj4+Pj4+
IFsnaScsICdtJywgJ2EnLCAuLi5dLCBmb2xsb3dlZCBieSAiVW5ldmFsdWF0ZWQgcHJvcGVydGll
cyBhcmUgbm90IGFsbG93ZWQuIgo+Pj4+Cj4+Pj4gSWYgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBpcyBpbmNvbXBsZXRlCj4+Pj4gd2l0aCBy
ZXNwZWN0IHRvIHJhdGlmaWVkIGV4dGVuc2lvbnMsIEkgZ3Vlc3MgdGhlIHJpZ2h0IGFwcHJvYWNo
IGlzIHRvIGFtZW5kCj4+Pj4gaXQgYW5kIG5vdCB0byBjdXJ0YWlsIHRoZSBDUFUgZGVzY3JpcHRp
b24uCj4+Pgo+Pj4gQWJzb2x1dGVseS4gSWYgdGhlIGNwdSBzdXBwb3J0cyBzb21ldGhpbmcgdGhh
dCBpcyBub3QgZG9jdW1lbnRlZCwgdGhlbgo+Pj4gcGxlYXNlIGRvY3VtZW50IGl0IHJhdGhlciB0
aGFuIG9taXQgZnJvbSB0aGUgZGV2aWNldHJlZS4KPj4KPj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3
LiBNYXkgSSBjbGFyaWZ5IG9uZSB0aGluZz8gQm90aCBvZiB5b3UgbWVudGlvbmVkCj4+IGRvY3Vt
ZW50IHRoZW0sIGdpdmVuIHRoZSBhbW91bnQgb2YgbWlzc2luZyBleHRlbnNpb25zLCBpcyBpdCBh
Y2NlcHRhYmxlIGlmCj4+IEkgc3VibWl0IGEgcHJlcmVxdWlzaXRlIHBhdGNoIHRoYXQgb25seSBk
b2N1bWVudHMgdGhlc2Ugc3RyaW5ncyBpbgo+PiByaXNjdi9leHRlbnNpb25zLnlhbWwgcGx1cyB0
aGUgbmVjZXNzYXJ5IGh3cHJvYmUgZXhwb3J0PyBMZWF2aW5nIHRoZSBhY3R1YWwKPj4gdXNhZ2Ug
b2YgdGhlc2UgZXh0ZW5zaW9ucyAobmFtZWQgZmVhdHVyZXMpIHRvIHRoZSBmdXR1cmUgcGF0Y2hl
cy4KPj4KPj4gVG8gcHJvdmlkZSBzb21lIGNvbnRleHQgb24gd2h5IEkgYXNrOiBJJ3ZlIGludmVz
dGlnYXRlZCB0aGUgY29tbWl0cyAmIGxrbWwKPj4gaGlzdG9yeSBvZiBSSVNDLVYgZXh0ZW5zaW9u
cyBzaW5jZSB2Ni41LCBhbmQgSSBzdW1tYXJpemVkIHRoZSBjdXJyZW50IHN0YXR1cwo+PiByZWdh
cmRpbmcgdGhlIFJWQTIzIHByb2ZpbGUgaGVyZToKPj4gWzFdIHN0YXR1cyBpbiB2Ni4xOCAoaW5j
LiB2Ni4xOS1yYzEpOgo+PiBodHRwczovL2RvY3VsYXJ4dS5naXRodWIuaW8vcnZhMjMvbGludXgt
a2VybmVsLWNvdmVyYWdlLmh0bWwKPj4gWzJdIHN1cHBvcnQgZXZvbHV0aW9uIHNpbmNlIHY2LjU6
Cj4+IGh0dHBzOi8vZG9jdWxhcnh1LmdpdGh1Yi5pby9ydmEyMy9ydmEyMy1rZXJuZWwtc3VwcG9y
dC1ldm9sdXRpb24uaHRtbAo+Pgo+PiBTdHJpY3RseSBkZXNjcmliaW5nIHRoZSBTcGFjZW1pVCBY
MTAwL0szIChvciBhbnkgY29yZSkgYXMgUlZBMjMtY29tcGxpYW50Cj4+IHJlcXVpcmVzIGFkZGlu
ZyB0aGVzZSBleHRlbnNpb25zIHRoYXQgYXJlIGN1cnJlbnRseSBtaXNzaW5nIGZyb20KPj4gdGhl
IGtlcm5lbCBiaW5kaW5nczoKPj4gUlZBMjNVNjQ6IFppY2NpZiwgWmljY2Ftb2EsIFppY2Nsc20s
IFphNjRycwo+PiBSVkEyM1M2NDogU3MxcDEzLCBTc2NjcHRyLCBTc3R2ZWNkLCBTc3R2YWxhLCBT
c2NvdW50ZXJlbncsIFNzdTY0eGwsCj4+ICAgICAgICAgICAgU2hhLCBTaGNvdW50ZXJlbncsIFNo
dnN0dmFsYSwgU2h0dmFsYSwgU2h2c3R2ZWNkLCBTaHZzYXRwYSwgU2hnYXRwYQo+IAo+IAo+PiBQ
bHVzICdTdXBtJywgJ1ppYzY0YicsICdTc3N0YXRlZW4nLCAnQicgd2hlcmUgdGhlIGtlcm5lbCBz
dXBwb3J0cyB0aGVtIGJ1dAo+PiB0aGV5IGFyZSBub3QgbGl0ZXJhbGx5IGRvY3VtZW50ZWQgaW4g
eWFtbC4KPiAKPiBJIGRvbid0IHRoaW5rIFN1cG0gaXMgc3VpdGFibGUgZm9yIGRldmljZXRyZWUs
IGRvZXNuJ3QgaXQgZGVzY3JpYmUKPiB3aGF0IHRoZSBrZXJuZWwvdXNlcnNwYWNlIGFyZSBjYXBh
YmxlIG9mIHJhdGhlciB0aGFuIGhhcmR3YXJlPwo+IFppYzY0YiBkb2Vzbid0IHNvdW5kIGxpa2Ug
aGFyZHdhcmUgZGVzY3JpcHRpb24gKHNvIG5vdCByZWFsbHkgc3VpdGFibGUKPiBmb3IgZGV2aWNl
dHJlZSBlaXRoZXIpIGJ1dCBibG9jayBzaXplIGluZm9ybWF0aW9uIGlzIGFscmVhZHkgcmVwcmVz
ZW50ZWQKPiBieSBzb21lIGV4aXN0aW5nIHByb3BlcnRpZXMgKHNlZSByaXNjdixjYm8qLWJsb2Nr
LXNpemUgaW4gcmlzY3YvY3B1cy55YW1sKQo+IGFuZCBkdXBsaWNhdGluZyB0aGF0IGluZm9ybWF0
aW9uIGlzIG5vdCByZWFsbHkgYSBncmVhdCBpZGVhLgo+IAo+IEknbGwgYWRtaXQgdGhhdCBJIGRv
IG5vdCByZWFsbHkgdW5kZXJzdGFuZCBTeHN0YXRlZW4gYW5kIGhvdyB0aGV5IHdvcmssCj4gYnV0
IG15IHVuZGVyc3RhbmRpbmcgd2FzIHRoYXQga25vd2luZyBhYm91dCBTbXN0YXRlZW4gaXMgc3Vm
ZmljaWVudCBhbmQKPiBpbXBsaWVkIFNzdGF0ZWVuLCBidXQgaGF2aW5nIFNzc3RhdGVlbiBkZWZp
bmVkIHNlZW1zIGhhcm1sZXNzIGFuZAo+IHBvc3NpYmxlLiBJIHRoaW5rIGt2bSBpcyB0aGUgb25s
eSB1c2VyIG9mIHRoaXMgYXQgdGhlIG1vbWVudCwgc28KPiBwcm9iYWJseSB3b3J0aCBDQ2luZyBB
bnVwIGFuZCBtYXliZSBEcmV3IEpvbmVzIG9uIHRoZSBwYXRjaCBhZGRpbmcKPiBTc3N0YXRlZW4g
dG8gbWFrZSBzdXJlIGl0IG1ha2VzIHNlbnNlLgoKU3VwbSBpcyBkZXNjcmliZWQgaW4KClJJU0Mt
ViBQb2ludGVyIE1hc2tpbmcKVmVyc2lvbiAxLjAsIDEwLzIwMjQ6IFJhdGlmaWVkCmh0dHBzOi8v
cmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9yaXNjdi9yaXNjdi1qLWV4dGVuc2lvbi9tYXN0ZXIv
empwbS1zcGVjLnBkZgoKVGhlIGludGVycHJldGF0aW9uIHRha2VuIGJ5IFFFTVUgaGFzIGJlZW46
CgoqIFN1cG0gaW1wbGllcyBTc25wbSBhbmQgU21ucG0KKiBSVkEyMyBjYXBhYmxlIG1hY2hpbmUg
bW9kZWxzIGRpc3BsYXkgaXQgaW4gdGhlIGRldmljZS10cmVlCgpJZiBTdXBtIGlzIG5vdCBzaG93
biBpbiB0aGUgZGV2aWNlLXRyZWUsIHNvZnR3YXJlIG1pZ2h0IGFzc3VtZSB0aGF0IHRoZSAKc3lz
dGVtIGRvZXMgbm90IHN1cHBvcnQgcG9pbnRlciBtYXNraW5nIGluIHVzZXIgbW9kZSBhbmQgaXMg
bm90IFJWQTIzIApjb21wbGlhbnQuCgpIZW5jZSBJIHdvdWxkIHN1Z2dlc3Q6CgpJZiB0aGUgWDEw
MCBjb3JlcyBoYXZlIFNzbnBtIGFuZCBTbW5wbSwgYWRkIFN1cG0gdG8gdGhlIGRldmljZS10cmVl
LgoKSWYgdGhlIGtlcm5lbCBkb2VzIG5vdCBzdXBwb3J0IHVzZXIgc3BhY2UgcG9pbnRlciBtYXNr
aW5nLCB0aGUga2VybmVsIApzaG91bGQgZmlsdGVyIG91dCBTdXBtIGFuZCBub3QgYW5ub3VuY2Ug
aXQsIG5laXRoZXIgaW4gL3Byb2MvY3B1aW5mbyBub3IgCnZpYSBod3Byb2JlLgoKQmVzdCByZWdh
cmRzCgpIZWlucmljaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
