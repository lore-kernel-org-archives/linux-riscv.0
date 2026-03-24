Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6C6F532C0
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 00:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bx0bhKxxCzAp//JlM9wNhIb00q4M6HsxFBuygsnZBmA=; b=rqoQQP648RKe41
	s3fY1+TvdB5kSMm6M5ryjCohBVyBC1gH7tzwOBRdJ/RewNhI/A1TLr/AziwiS0sL8epExlqBqvsNe
	NlgjOj8ohFr5mhhTNydUy7OvVSV/5l+SmHwcxBiO/angCCNix2TkN2YrEb49HtfvsksklqtKJpUWP
	L9L2Pfzo61m6mxYbt7XvfUuyj6b8J5Gcrr/RHEeOHz6z0erKQjQeltX4aMqQNYsee5gJzDnYs8qrr
	zL9LAEcIWuHbA3RM7iVPNyjp2QgJiptD90+P5jNnMrIsZUo1+bxHJRc0I57OdNRXY46NL+nsaMQGc
	/dMb+IbhVbm19l3Opr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pme-00000000FEi-01zd;
	Tue, 24 Mar 2026 00:38:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pmc-00000000FEV-1jzi
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 00:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 799C9600AC;
	Tue, 24 Mar 2026 00:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA89C4CEF7;
	Tue, 24 Mar 2026 00:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774312689;
	bh=b57pKLm7yugh5thJ+wTcgduPJVooziPx23RU5AvPusw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NBzq9HS3Tb7UH4uHwNBJgdtAJbQZNzvf2EYEuttR2ocZLI2seG5dzsEwrm9Eu2vhJ
	 GF+o3riis28tr1qjEczmf+ShPLcFDrm4s1hlT+0IdLBviQ94ZPLXySkcEYj9nfwByI
	 ad4twx/EV3s+FW0PBfOoNpPPjuXfH8OJM5RqPnoOmdNHGproikCgD47FwLcZpRS4d+
	 Jxstl0WB4NXXfYTAKzDPuzQqdOxJuAWp0mU/OEUbpY1r+LzSwsKbYo/5SEcUJ1IzXw
	 aKcpXfBb+3XV5nk5WeWzez+9CxScI1/7atOfMSt7L/j6DaNNfOt1L4lpJCOptRPy1v
	 Fa6de13OsIywA==
MIME-Version: 1.0
In-Reply-To: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
References: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
Subject: Re: [PATCH v5 00/10] Add clock and reset support for Mobileye EyeQ7H
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sari Khoury <sari.khoury@mobileye.com>, Brian Masney <bmasney@redhat.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Mar 2026 17:38:07 -0700
Message-ID: <177431268711.5403.12519723172593766522@lazor>
User-Agent: alot/0.12
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

UXVvdGluZyBCZW5vw650IE1vbmluICgyMDI2LTAzLTE3IDA2OjMzOjAyKQo+IFRoaXMgcGF0Y2hz
ZXQgYnJpbmdzIHRoZSBzdXBwb3J0IG9mIHRoZSBPdGhlciBMb2dpYyBCbG9ja3MgKE9MQikKPiBm
b3VuZCBpbiB0aGUgZmlyc3QgTW9iaWxleWUgU29DIGJhc2VkIG9uIHRoZSBSSVNDLVYgYXJjaGl0
ZWN0dXJlLCB0aGUKPiBFeWVRN0guIERlc3BpdGUgdGhlIGNoYW5nZSBmcm9tIE1JUFMgdG8gUklT
Qy1WLCB0aGUgT3RoZXIgTG9naWMgQmxvY2tzCj4gcHJvdmlkZSBzaW1pbGFyIGNsb2NrIGFuZCBy
ZXNldCBmdW5jdGlvbnMgdG8gdGhlIGNvbnRyb2xsZXJzIG9mIHRoZQo+IGNoaXAuIFRoaXMgc2Vy
aWVzIGludHJvZHVjZXMgdGhlIGRldmljZSB0cmVlIGJpbmRpbmdzIG9mIHRoZSBTb0MgYW5kCj4g
dGhlIG5lY2Vzc2FyeSBjaGFuZ2VzIHRvIHRoZSBjbG9jayBhbmQgcmVzZXQgZXllcSBkcml2ZXJz
Lgo+ClsuLi5dCj4gCj4gVGhpcyBzZXJpZXMgZGVwZW5kcyBvbiB0aGUgRXllUTZMcGx1cyBzdXBw
b3J0IHBhdGNoc2V0IHBvc3RlZAo+IHByZXZpb3VzbHlbMV0sIHdoaWNoIGluIHR1cm4gZGVwZW5k
cyBvbiBUaMOpbydzIHNlcmllc1syXS4gSW4gcGFydGljdWxhciwKPiB0aGUgY2hhbmdlcyBtYWRl
IHRvIHRoZSBjbGstZXllcSBkcml2ZXIgaW4gdGhpcyBwYXRjaHNldCBkZXBlbmQgb24gdGhlCj4g
Y2hhbmdlcyBkb25lIGluIHRoZXNlIHR3byBzZXJpZXMuCgpJcyBpdCBhIGJ1aWxkIHRpbWUgZGVw
ZW5kZW5jeSBvciBhIHJ1biB0aW1lIGRlcGVuZGVuY3k/IEFyZSB5b3UKZXhwZWN0aW5nIG1lIHRv
IGFwcGx5IGFsbCB0aHJlZSBzZXJpZXMgdG8gdGhlIGNsayB0cmVlPwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
