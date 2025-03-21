Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A781C36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVHG87ySuv/OAPePm8aknpRJX4HfO3j6LNz7sMYuKEg=; b=LDdR2QoJ7s7dfq
	QsfyxC9b72q0MaC4ikilFALDlCKPpah/yYlLq7W+vwDvYGtCU2kp4fXC/2I9H9UiDvA52b/EH/ctf
	R8gDWytDw5vtiecWJB21jT8nHjIxHamAcGDSzAlzwyyBiCFV88gBjEyknl98tgxuwm9kqrcoCjoSq
	VXA2pgAlOY09yG1K4zDKw5Ov1SO4d+caIvdjbGLCHR4Ix23w39kpP1XWsSkWNJiponhZTLPBNwKb3
	7W78vh3C7FSqCkanO8rMMawRzJDHMM7DK5gvCM6kWR+NTICoOLiaFw30NNCzbGlBPvNbs2FH3H2ck
	BXy9ELDhiRGURhzgkIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhp8-0000000FzRN-0xrY;
	Fri, 21 Mar 2025 19:14:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhoi-0000000FzKp-3T0j
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Mar 2025 19:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IuZZ1c6pfeMUYzSCc2NncoPGK60qkvSILYq+w9aYkTE=; b=oGKPZE3oPQivFlViziVtUKCQ4G
	z/TKbiuIU+XIYNbYtJGRuIeIIQ+8tb8DJzdKO1FNkleSow0T2cmyeYJbgrQPmvoMurIyOaNaa8rBF
	TAK7TOPIU2ZYmr/QI0UmPvC/yOjGw0EMvDBWn5xZScDxCIUocw2ieqAkDt+lnV6i8DBHWhYENHeI0
	IumHlNTl8Th6yL1RjEPZNJu3XpWgalmsiuzDZduCbdRCrWK7aOWOoxLbCdxbnMwT6BLFObg17YMpN
	CEnd/5OGwvC4j181HHpdPn4Av4HyABT6v80iq0aF3QG5c9IWDt1tIu/VlLdvjUaCLv9VYGQtV9i4r
	D5klA+PQ==;
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhof-00000004VmE-2ztO
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 19:14:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D215344551;
	Fri, 21 Mar 2025 19:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IuZZ1c6pfeMUYzSCc2NncoPGK60qkvSILYq+w9aYkTE=;
	b=hwPN6zqjrifTQtFg0tzBTL/P6yepJ4OWg2zrll4M2vwWlDEyESdpFSwFJgNyB8IGmIRyTB
	9dsSSrLg8UitTnXlV809wNVRtnYHhDV7nB1HgE9PceOBPsp43EZ+dr+ulQbbXiDOqiQHh9
	J1flOeKER6aXXkzABmZC9FHtwuJqmamXLe4JOYT05OPl65tFMPZ/ey+c/KYDmrG5Xd/+Bo
	f9zS4HY74/h908abnI2bp1Kk4tnNLD4YIhHaOFJ9K/Dw5mRCMzMvclu+FyaOa7oiELUXqC
	vjWEzOOmMEOZ0m/axPJkvJr4XHGfFOzJsAgQDugvV85bOVeFXNr07BbAowqXNQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:32 +0100
Subject: [PATCH net-next 01/13] dt-bindings: net: cdns,macb: add Mobileye
 EyeQ5 ethernet interface
MIME-Version: 1.0
Message-Id: <20250321-macb-v1-1-537b7e37971d@bootlin.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
In-Reply-To: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplgduledvrdduieekrddurdeftdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehkuhgsrgesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_191401_892074_6F4F5AD4 
X-CRM114-Status: UNSURE (   7.55  )
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

QWRkIGNkbnMsZXllcTUtZ2VtIGFzIGNvbXBhdGlibGUgZm9yIHRoZSBpbnRlZ3JhdGVkIEdFTSBi
bG9jayBpbnNpZGUKTW9iaWxleWUgRXllUTUgU29Dcy4gQWRkIGEgcGhhbmRsZSAoYW5kIHR3byBv
ZmZzZXQgYXJndW1lbnRzKSBmb3IKYWNjZXNzaW5nIHN5c2NvbiByZWdpc3RlcnMuCgpTaWduZWQt
b2ZmLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgotLS0KIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jZG5zLG1hY2IueWFtbCAgICAgICAgICB8IDIxICsrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMsbWFjYi55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9jZG5zLG1hY2IueWFt
bAppbmRleCAzYzMwZGQyM2NkNGVmYTE3ZTE0YjE3YmZiNDFjNTRkZTRlYmFkY2FhLi4zMDZkMTQ5
NTg3NzhkZjFhODBhMTVlMjRkOGVkNTQwOTcwNDYxM2JlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2NkbnMsbWFjYi55YW1sCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2RucyxtYWNiLnlhbWwKQEAgLTUxLDYgKzUx
LDcgQEAgcHJvcGVydGllczoKICAgICAgICAgICAtIGF0bWVsLHNhbWE1ZDItZ2VtICAgICAgICAg
IyBHRU0gSVAgKDEwLzEwMCkgb24gQXRtZWwgc2FtYTVkMiBTb0NzCiAgICAgICAgICAgLSBhdG1l
bCxzYW1hNWQzLWdlbSAgICAgICAgICMgR2lnYWJpdCBJUCBvbiBBdG1lbCBzYW1hNWQzIFNvQ3MK
ICAgICAgICAgICAtIGF0bWVsLHNhbWE1ZDQtZ2VtICAgICAgICAgIyBHRU0gSVAgKDEwLzEwMCkg
b24gQXRtZWwgc2FtYTVkNCBTb0NzCisgICAgICAgICAgLSBtb2JpbGV5ZSxleWVxNS1nZW0gICAg
ICAgICMgTW9iaWxleWUgRXllUTUgU29DcwogICAgICAgICAgIC0gY2RucyxucDQtbWFjYiAgICAg
ICAgICAgICAjIE5QNCBTb0MgZGV2aWNlcwogICAgICAgICAgIC0gbWljcm9jaGlwLHNhbWE3ZzUt
ZW1hYyAgICAjIE1pY3JvY2hpcCBTQU1BN0c1IGV0aGVybmV0IGludGVyZmFjZQogICAgICAgICAg
IC0gbWljcm9jaGlwLHNhbWE3ZzUtZ2VtICAgICAjIE1pY3JvY2hpcCBTQU1BN0c1IGdpZ2FiaXQg
ZXRoZXJuZXQgaW50ZXJmYWNlCkBAIC0xMzYsNiArMTM3LDE0IEBAIHByb3BlcnRpZXM6CiAgICAg
ICBOb2RlIGNvbnRhaW5pbmcgUEhZIGNoaWxkcmVuLiBJZiB0aGlzIG5vZGUgaXMgbm90IHByZXNl
bnQsIHRoZW4gUEhZcyB3aWxsCiAgICAgICBiZSBkaXJlY3QgY2hpbGRyZW4uCiAKKyAgbW9iaWxl
eWUsb2xiOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5k
bGUtYXJyYXkKKyAgICBpdGVtczoKKyAgICAgIC0gaXRlbXM6CisgICAgICAgICAgLSBkZXNjcmlw
dGlvbjogcGhhbmRsZSB0byBPTEIgbm9kZQorICAgICAgICAgIC0gZGVzY3JpcHRpb246IE1BQyBH
ZW5lcmFsLVB1cnBvc2UgcmVnaXN0ZXIgb2Zmc2V0CisgICAgICAgICAgLSBkZXNjcmlwdGlvbjog
TUFDIFNHTUlJIHJlZ2lzdGVyIG9mZnNldAorCiBwYXR0ZXJuUHJvcGVydGllczoKICAgIl5ldGhl
cm5ldC1waHlAWzAtOWEtZl0kIjoKICAgICB0eXBlOiBvYmplY3QKQEAgLTE3NCw2ICsxODMsMTgg
QEAgYWxsT2Y6CiAgICAgICAgIHJlZzoKICAgICAgICAgICBtYXhJdGVtczogMQogCisgIC0gaWY6
CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRpYmxlOgorICAgICAgICAgIGNvbnRh
aW5zOgorICAgICAgICAgICAgY29uc3Q6IG1vYmlsZXllLGV5ZXE1LWdlbQorICAgIHRoZW46Cisg
ICAgICByZXF1aXJlZDoKKyAgICAgICAgLSBtb2JpbGV5ZSxvbGIKKyAgICBlbHNlOgorICAgICAg
cHJvcGVydGllczoKKyAgICAgICAgbW9iaWxleWUsb2xiOiBmYWxzZQorCiB1bmV2YWx1YXRlZFBy
b3BlcnRpZXM6IGZhbHNlCiAKIGV4YW1wbGVzOgoKLS0gCjIuNDguMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
