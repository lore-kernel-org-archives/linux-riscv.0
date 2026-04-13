Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F15F531C7
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 19:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ocaxgkF9I5t/zU9hfFpAkLfblwko9BZ1HXZN2Gxh1Vo=; b=vXKP1mXdo1MHXTOnqZa0oxLf+e
	8JXNsjW3PO3SE4otU734yL1u6A6JwP047kMPw+IPW4DeGvpN4Ape4vURjlSaYJX5bcWlOFcY6WCmS
	NXwMZuYjKLIhRgl4NAMcw+AYxmBEw0P6gWbvLA8mp7XdED1kJjDl/VvAScSM1DQ8T8UcrL7/UuMGM
	CBcpwutjacdebBmhfPlvZuLb5IGV6QkZdYFUi8nYnHxw09RooQrKe8Tv6HoCF8kWKuN7wMsNSbv1+
	O7tHPJCAhMuIzAuE61qVNxjMstqYGDGOpITXKIKb+KC9v5iZve+uVlpCkCGWxLi6CEhjzqlNjd4jB
	tF87oKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCN0Z-0000000GJ6O-3ggV;
	Mon, 13 Apr 2026 19:31:43 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCN0W-0000000GJ5p-2Cr0;
	Mon, 13 Apr 2026 19:31:42 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 9BAA81380415;
	Mon, 13 Apr 2026 15:31:38 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 15:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776108698;
	 x=1776115898; bh=oF7+4SGRAImH9WMGSId2dJm+4RdrBt2YGrt25aFUZUA=; b=
	eBEb3+z4uCJ5XpVJfmMDtd+Hz4pTmn4rIKoszU8vf+435LUmCEc3EJdi4K0/oVv8
	C+yjXVYuraejFdA/rcQOSN6Zfi5pNlS43GslApllsudgHnK44npvkIwaUHWVTtuh
	Dw/4I/j/UNeqyr1LQlKmH5vdXZciz/2GPqFtFHFDNoaInKEsvm7hwh9DYdVnGoah
	lMAIbVhEjH95sryDmrUzci3AfaiCDHHYDZH3oXJ/R4+VlvsfKJPopXWx0JE7CxaE
	ognvTjwa06PAMT31z/DBGKMGBcoGUsjb6Y3k+6cm618rMbyQ7yCpT6T6pE5XH3Hf
	w2SGXNdq7Abx7TrcOF+CrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776108698; x=
	1776115898; bh=oF7+4SGRAImH9WMGSId2dJm+4RdrBt2YGrt25aFUZUA=; b=f
	K2XbJ97Y0jsbU1s6LswXOEcaT2AuIJQsZKTCiqB2bsDjsavXFxXjXN24HUjqmHPV
	30lUfZzPVJ0GZrRSLZsyTrPlhAwj+oOp7rzHIcW4Q+ggBxcGWjNT+roTWJQkS80p
	muhmPfZao8pyrAslQS6xE9YgbnnrpBmxpEViK0VuBn5kyHZfCSLFSApLiy8hZEkj
	X3o7U4xt3roWjYEf/0QsKGiNqeP3myXk/e3+BEa4KYIE59wmYsrhudiDwV46CB5d
	E8K4OFv0fHuOdK14nnUUxfff3rCPKj8vJw3X7p6M4i0BpN1E8RSwySIEaUf5sCqK
	alHtK1Rc5jgsKIF8k3s0A==
X-ME-Sender: <xms:l0TdaRMQ1ovC5UjXw9wB_riUJbJZBZQ47VcEC4ozPMlWVwTWyL-hPg>
    <xme:l0Tdaey9qAPkMkkSsq5ZowyLiVSaVZg3Aabqq1QUbhdAX-Y8VC29U600TE9HTIGWj
    W-h6ka_l-N0bKYGG_W-3bzXlHGY0ZcjcSbZR_zuoL-6Ds0X7Q55CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefledtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepthdrshgrihhlvghrsegrlhhumhhnihdrvghthhiirdgthhdprhgtph
    htthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohep
    lhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhi
    ugdrrghupdhrtghpthhtoheprhihrggsihhnihhnrdgrrdgrsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepuhhrvgiikhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhl
    vghrsehgmhigrdguvgdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprg
    hnrgdrohhrghdrrghu
X-ME-Proxy: <xmx:l0TdaTelOssYXt15-FK9p6saYLM_nmrvIO6c-_F3ZyF6_xfZywmCYA>
    <xmx:l0TdaUxOkh6ozfKMIVT4v_qdW_i5Tss0CLMqkf2F01TBmahdCnZo_w>
    <xmx:l0TdaUWn-LdWx2_7oUHRu6zzNshE3wCLw-aFKzbUUXN26D6Q-_6vLw>
    <xmx:l0TdacTwYVtUWJnf_Fdh14nt-sYvlNq7AaQbOTvOw2Uu221fQyzEjQ>
    <xmx:mkTdaTH5uGiAlbaAI17-uSN6CKxYeQsdeWCm3ruscf_j0l2LK_Chakad>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 04818700069; Mon, 13 Apr 2026 15:31:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AMdy4yCH1GcR
Date: Mon, 13 Apr 2026 21:30:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Woodhouse" <dwmw2@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, "Baolu Lu" <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev, "Michael Grzeschik" <m.grzeschik@pengutronix.de>,
 Netdev <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org,
 "Herbert Xu" <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, linux-mm@kvack.org,
 "Bernie Thompson" <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
 "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 "Marco Elver" <elver@google.com>, "Dmitry Vyukov" <dvyukov@google.com>,
 kasan-dev@googlegroups.com, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Thomas Sailer" <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Huacai Chen" <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, "Dinh Nguyen" <dinguyen@kernel.org>,
 "Jonas Bonn" <jonas@southpole.se>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "Helge Deller" <deller@gmx.de>, linux-parisc@vger.kernel.org,
 "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 "Paul Walmsley" <pjw@kernel.org>, linux-riscv@lists.infradead.org,
 "Heiko Carstens" <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Message-Id: <07df88e5-208d-4aac-9668-a3b0c65ae529@app.fastmail.com>
In-Reply-To: <7a48b636cb3146f4f7134c6d4fe42070ac2edb43.camel@infradead.org>
References: <20260410120044.031381086@kernel.org>
 <20260410120318.592237447@kernel.org>
 <7a48b636cb3146f4f7134c6d4fe42070ac2edb43.camel@infradead.org>
Subject: Re: [patch 15/38] ptp: ptp_vmclock: Replace get_cycles() usage
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_123140_934086_B52A23AA 
X-CRM114-Status: GOOD (  13.53  )
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

T24gTW9uLCBBcHIgMTMsIDIwMjYsIGF0IDE3OjMzLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4g
T24gRnJpLCAyMDI2LTA0LTEwIGF0IDE0OjE5ICswMjAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6
Cj4KPiAuLi4gZGVwZW5kIG9uIFRTQ19SRUxJQUJMRcK5LCBzaW5jZSBpZiB0aGUgZ3Vlc3QgZG9l
c24ndCBiZWxpZXZlIHRoYXQgaXQKPiBpcywgdGhlbiB0aGUgZ3Vlc3Qgc2hvdWxkbid0IGJlIHRy
eWluZyB0byB1c2UgaXQgYXMgdGhlIGJhc2lzIGZvcgo+IHByZWNpc2UgdGltaW5nLgo+Cj4gwrkg
KE9yLi4uIG9uZSBvZiB0aGUgb3RoZXIgem9vIG9mIFRTQyBmbGFncyBmb3IgdGhlIGdyYWR1YWxs
eSByZWR1Y2luZwo+IGJyb2tlbm5lc3Mgb3ZlciB0aGUgeWVhcnMuLi4pCgpJdCBsb29rcyBsaWtl
IHRoaXMgaXMgc3VmZmljaWVudGx5IGhhbmRsZWQgaW4gdGhlIGNhbGxlcjoKCnN0YXRpYyBpbnQg
dm1jbG9ja19nZXRfY3Jvc3N0c3RhbXAoc3RydWN0IHZtY2xvY2tfc3RhdGUgKnN0LAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwdHBfc3lzdGVtX3RpbWVzdGFtcCAq
c3RzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzeXN0ZW1fY291
bnRlcnZhbF90ICpzeXN0ZW1fY291bnRlciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgdGltZXNwZWM2NCAqdHNwZWMpCnsKLi4uLgojaWZkZWYgQ09ORklHX1g4Ngog
ICAgICAgIC8qCiAgICAgICAgICogV2UnZCBleHBlY3QgdGhlIGh5cGVydmlzb3IgdG8ga25vdyB0
aGlzIGFuZCB0byByZXBvcnQgdGhlIGNsb2NrCiAgICAgICAgICogc3RhdHVzIGFzIFZNQ0xPQ0tf
U1RBVFVTX1VOUkVMSUFCTEUuIEJ1dCBiZSBwYXJhbm9pZC4KICAgICAgICAgKi8KICAgICAgICBp
ZiAoY2hlY2tfdHNjX3Vuc3RhYmxlKCkpCiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
I2VuZGlmCgpXaXRoIDQ4NiBhbmQgRUxBTiBvdXQgb2YgdGhlIHdheSwgV2luY2hpcDYgc2VlbXMg
dG8gYmUgdGhlIG9ubHkKb25lIHdpdGhvdXQgWDg2X0ZFQVRVUkVfVFNDLCBzbyBJIHRoaW5rIHRo
ZSBuZXh0IGxvZ2ljYWwgc3RlcCB3b3VsZApiZSB0byB0dXJuIG9mZiBXaW5jaGlwNiBhcyB3ZWxs
IGFuZCByZW1vdmUgYWxsIFg4Nl9GRUFUVVJFX1RTQwphbmQgQ09ORklHX1g4Nl9UU0MgY2hlY2tz
LgoKICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
