Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76BCC36007
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 20:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vRmZFP5BfHKqPBl9xZGxETp8r/8pSwo0gNjql1K8xT0=; b=oi3MNPcVgaNRLP9d0ZBYm/mS2p
	uFgW+yGf2aeTG/KkwuFfZjD1fTLmITE2MLiX+sLuuxuiFbcB8pu6EmOf/RyufqcVaQ+hqvBgwkPmG
	KTf4wRyJe3BqsvSDJv7f81R66z3Mf1txkvs96B2j4GQcL44oi4Hjjk0z6EVVJqp4IrwYS2ZnDQuT8
	ufGC3Qqo93VdlYnUiUJGlCBO1M/zqgQF2hXK8YozTvQZYmTKYkcB/UqfOzOao2n2JjMjyskvSS8nn
	fV8T2ktusPCHFFjhV7s/wdbxcJse0z58ftByVkn4PQxS9fdaRABAzqzoVgFHyhNtxByDY5ShPfMLA
	7hfV4xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvj7p-0000000GDIz-0S7d;
	Fri, 21 Mar 2025 20:37:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvj7l-0000000GDGf-3W3J
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 20:37:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3663E5C6EAD;
	Fri, 21 Mar 2025 20:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6B7C4CEE3;
	Fri, 21 Mar 2025 20:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742589468;
	bh=HO7nlKXbMubdBKs5dA8F12zWcr0vHn01ammSIHUzW1E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ImfJjb51Y/I05j7ropG1vHwEmVkLdCHI/NDFhBHgDVkZ4Pj14dzRN/qxXjF42bUml
	 BEFmXzbwqaUdb97JSLUTfP72S1rEy7dSG4d5KLyojowobIln3NrY/gA+ANtdqBttC5
	 SWY7+IvvjgDva+PkzhY9Q4ulm3xoik68NkZuGi1Q3hrOPX9WoeyU7I1Am2j9LNQEiJ
	 vDk6sz/JoXErERhcL6NXKA6lcD9NQZj9eRn2W2neaYeEZ0Y7T0fCFaDreTlkCDNNOl
	 LcjwQ82/8oqpEN7zYt0bm7P72VQ4G+8v/tt/RtqzH77B97DzAwIJ2KzOJXoiH1pOOf
	 EIBNR+1YXHG7Q==
Date: Fri, 21 Mar 2025 15:37:47 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mips@vger.kernel.org, 
 Albert Ou <aou@eecs.berkeley.edu>, Jakub Kicinski <kuba@kernel.org>, 
 devicetree@vger.kernel.org
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
In-Reply-To: <20250321-macb-v1-1-537b7e37971d@bootlin.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-1-537b7e37971d@bootlin.com>
Message-Id: <174258946794.3905655.14862807255896065162.robh@kernel.org>
Subject: Re: [PATCH net-next 01/13] dt-bindings: net: cdns,macb: add
 Mobileye EyeQ5 ethernet interface
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_133749_957367_CB75C1CF 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Ck9uIEZyaSwgMjEgTWFyIDIwMjUgMjA6MDk6MzIgKzAxMDAsIFRow6lvIExlYnJ1biB3cm90ZToK
PiBBZGQgY2RucyxleWVxNS1nZW0gYXMgY29tcGF0aWJsZSBmb3IgdGhlIGludGVncmF0ZWQgR0VN
IGJsb2NrIGluc2lkZQo+IE1vYmlsZXllIEV5ZVE1IFNvQ3MuIEFkZCBhIHBoYW5kbGUgKGFuZCB0
d28gb2Zmc2V0IGFyZ3VtZW50cykgZm9yCj4gYWNjZXNzaW5nIHN5c2NvbiByZWdpc3RlcnMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4K
PiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMsbWFjYi55YW1sICAgICAg
ICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNl
cnRpb25zKCspCj4gCgpNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGlu
Z19jaGVjaycgb24geW91ciBwYXRjaDoKCnlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoKCmR0c2No
ZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6Ci9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kv
bGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jZG5zLG1hY2IueWFt
bDogcHJvcGVydGllczptb2JpbGV5ZSxvbGI6ICdhbnlPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBv
bmUgbXVzdCBiZSBmaXhlZDoKCSdkZXNjcmlwdGlvbicgaXMgYSBkZXBlbmRlbmN5IG9mICckcmVm
JwoJJy9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUtYXJyYXknIGRvZXMg
bm90IG1hdGNoICdeIy8oZGVmaW5pdGlvbnN8XFwkZGVmcykvJwoJCWhpbnQ6IEEgdmVuZG9yIHBy
b3BlcnR5IGNhbiBoYXZlIGEgJHJlZiB0byBhIGEgJGRlZnMgc2NoZW1hCgloaW50OiBWZW5kb3Ig
c3BlY2lmaWMgcHJvcGVydGllcyBtdXN0IGhhdmUgYSB0eXBlIGFuZCBkZXNjcmlwdGlvbiB1bmxl
c3MgdGhleSBoYXZlIGEgZGVmaW5lZCwgY29tbW9uIHN1ZmZpeC4KCWZyb20gc2NoZW1hICRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy92ZW5kb3ItcHJvcHMueWFtbCMKCmRv
YyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6CgpTZWUgaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGluZ3MvcGF0Y2gvMjAyNTAz
MjEtbWFjYi12MS0xLTUzN2I3ZTM3OTcxZEBib290bGluLmNvbQoKVGhlIGJhc2UgZm9yIHRoZSBz
ZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5
CnNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guCgpJZiB5b3UgYWxyZWFkeSByYW4gJ21h
a2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlCmVycm9yKHMpLCB0
aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVw
IHRvCmRhdGU6CgpwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCgpQbGVhc2UgY2hlY2sg
YW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBO
b3RlCnRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0
byBzcGVlZCB1cCBjaGVja2luZwp5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNl
dCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
