Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08F9CE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 07:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAMvRS9LthKDZ0s82EOUvZyTq3NjgBiXbuJfPLOkBA4=; b=ou4SL/tHgBnZqU
	ZxjZ75j7OMCNJ+fnWrRedKSozes4Je3NSKjvcLx4jBeAa1ypyLALg1FsfPjIWdKNf3OWMqr9F+LWd
	97O14iyovcyxXoacgt8yTXZuXCI3qYnwhmbT6l7wOI/9XjwDsfVPCHeWruAMbFPo4S5V5pXJ+IyDi
	9z6GJZDzQ4guE52UocvhHSk//NK4PYtuDmxtcL8u4vTiYHM3xo7nSRj8lSJOfdHjj55PRfQLGrQ8n
	ctvbHYv8cEM6slPI0a01dhdwoDJW1t/pl56JgtUlohdQiJ2+KSbbe6X6lKCbpuwihmtDCEXKjrZXT
	FxRhFKWbdTtmNQWiNEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtIy-0000000FZTP-0p3k;
	Mon, 17 Nov 2025 07:05:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtIv-0000000FZSL-05Ox;
	Mon, 17 Nov 2025 07:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 525E843F19;
	Mon, 17 Nov 2025 07:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765EBC4CEF5;
	Mon, 17 Nov 2025 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763363136;
	bh=iU8ROMk83jPncCljG0G/Fsoi2HDIAUbVt2VmcnD6plU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zmf+GQm0pAZ6z6C3arkzoxE5KbyOToef7Sp5DndQnxXr8JmQ3033UwODfZZpK7eMG
	 hNH2jlwIuNUC5NnJDZINgZJkjsQJmjVDQrUIWEvPazC8bT+gOyaYKNFP8Uis24UXEt
	 mU5oJ0PrmJNp25ZaImcMpp9pIDc8xskK7aEelL5VGWSuUeOnhVqU2YCiwbVsYM36cB
	 +17Rqg5eybYkDTX3XKBekgImKsuhhWCgQs0k0isOYITGYUfeEsHwvLyJGwVn6IGefN
	 4doh0ptX0oiLvP/wADeR//qwwzH01kT6exkg/8xtX7yON6lMV/FrtXhlnhvW0RUQWm
	 qytLrxDJMjTIQ==
Date: Mon, 17 Nov 2025 08:05:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuba =?utf-8?Q?Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
Subject: Re: [PATCH v3 4/6] dt-bindings: display: sun4i: Add D1s/T113 combo
 D-PHY bindings
Message-ID: <20251117-faithful-unique-millipede-d8bae5@kuoka>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134943.447443-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251116134943.447443-1-kuba@szczodrzynski.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_230537_083387_608C1A3A 
X-CRM114-Status: GOOD (  13.14  )
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

T24gU3VuLCBOb3YgMTYsIDIwMjUgYXQgMDI6NDk6NDNQTSArMDEwMCwgS3ViYSBTemN6b2RyennF
hHNraSB3cm90ZToKPiBUaGUgc3VuNGkgVENPTiBuZWVkcyBhIHJlZmVyZW5jZSB0byB0aGUgRC1Q
SFkgaW4gb3JkZXIgdG8gc3VwcG9ydCBMVkRTCj4gb24gQWxsd2lubmVyIEQxcy9UMTEzLgo+IAo+
IEFkZCBwaHlzIGFuZCBwaHktbmFtZXMgdG8gRFQgYmluZGluZ3MuCgpEbyBub3QgYXR0YWNoICh0
aHJlYWQpIHlvdXIgcGF0Y2hzZXRzIHRvIHNvbWUgb3RoZXIgdGhyZWFkcyAodW5yZWxhdGVkCm9y
IG9sZGVyIHZlcnNpb25zKS4gVGhpcyBidXJpZXMgdGhlbSBkZWVwIGluIHRoZSBtYWlsYm94IGFu
ZCBtaWdodAppbnRlcmZlcmUgd2l0aCBhcHBseWluZyBlbnRpcmUgc2V0cy4gU2VlIGFsc286Cmh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE2LXJjMi9zb3VyY2UvRG9jdW1lbnRh
dGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDgzMAoKCj4gCj4gU2lnbmVkLW9m
Zi1ieTogS3ViYSBTemN6b2RyennFhHNraSA8a3ViYUBzemN6b2Ryenluc2tpLnBsPgo+IC0tLQo+
ICAuLi4vYmluZGluZ3MvZGlzcGxheS9hbGx3aW5uZXIsc3VuNGktYTEwLXRjb24ueWFtbCAgICAg
ICAgICB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxs
d2lubmVyLHN1bjRpLWExMC10Y29uLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9hbGx3aW5uZXIsc3VuNGktYTEwLXRjb24ueWFtbAo+IGluZGV4IDcyNGQ5
M2I5MS4uNTI1ODkzNDFmIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2FsbHdpbm5lcixzdW40aS1hMTAtdGNvbi55YW1sCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1bjRpLWEx
MC10Y29uLnlhbWwKPiBAQCAtMTE1LDYgKzExNSwxMiBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAg
ICAgLSBjb25zdDogZWRwCj4gICAgICAgICAgICAtIGNvbnN0OiBsdmRzCj4gIAo+ICsgIHBoeXM6
Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBwaHktbmFtZXM6Cj4gKyAgICBjb25zdDogY29t
Ym8tcGh5CgpEcm9wIHBoeSBzdWZmaXguIENhbiBhICJwaHkiIHByb3BlcnR5IGhvbGQgcmVmZXJl
bmNlIHRvIHNvbWV0aGluZyBlbHNlCnRoYW4gcGh5PyBZb3UgZG9uJ3QgbmVlZCBuYW1lcyBpbiB0
aGUgZmlyc3QgcGxhY2UsIHlvdSBoYXZlIG9ubHkgb25lCmVudHJ5LgoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
