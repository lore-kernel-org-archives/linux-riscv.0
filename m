Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0921FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 18:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkqzXIdnsDkd/jxacHTphftwRTteJcBj8a8Vpa6Y2+M=; b=mu9Sw2FizQGDyy
	Hp/WGdLqkL2kHi9U18UkNa8rhtf9rCxi4rIgBEZnur3Un0kBOrRiDP6idm4yOMDRBtQdFd8WmEp8W
	XO6LUttXICfERid+eEYmiKcsOhyOAxSLb+cNkvErsUC58M8N7GwY/PsCV53opRIzha0xyLxOlWaof
	rJlKCZXfSBHkcgQ/DeJkDfvu8mafP/yb7TaCeg8xzwF8uGzzE8O9no3T1wFkufjYodDmf4knRVtPv
	GitSIiZyeGnrYUnHv1/A48KGVhF7KVon0tm55CInHI55Ru3qGKfVhh3ZvJP8UV0jLV4R38XDRvyeE
	vAJNx7g8nAlwVmvz1VIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oydlG-001La4-9r; Fri, 25 Nov 2022 18:49:18 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oydlD-001LX6-FK
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 18:49:17 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 7EDDF5C00AC;
	Fri, 25 Nov 2022 13:49:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 25 Nov 2022 13:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1669402150; x=
	1669488550; bh=lGBLZWw4I2IVEe7ioPYHs0ee4vEFUgD9+nW1n+RmPgk=; b=G
	w+QGLTLVvemFW/nXuipobMMHYB//cFx3yZejaTLWzL2a36xdVO85aPXyky4FMg//
	sDuV2BVseU7w6m7dK0CYtkMjtu5OlsRMoM+Eyc0P9j97a/3nuZAXHvsCpooefpXp
	BiPCbuCX5oJh+yQMejb77bbsFAGFr0O39G0ihKCK6jP4gLLjxC0D2ahU/Ixz5Zae
	EyGUzILyFOavr7Xx9eL2XUk+jrK21AM1dwGaea9paWoFcFlUhCE7Bgp/ZirmzR8o
	Hu8mT7z+WxLDya9ShoQdUrFjX49EZ5jGTaITu6oQ0oAB+7BMAc/DPn2mm307IOuj
	iiorbpmTWdDRBXQgOcWfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669402150; x=
	1669488550; bh=lGBLZWw4I2IVEe7ioPYHs0ee4vEFUgD9+nW1n+RmPgk=; b=s
	iP+d+1Cr9xX7hOx+9Nc+jE4O6lyv8hSRtb0gW2577XvBoyRR3eqjhq/oHZ7gkdL+
	2+MpPZaV6x3LIQKZC0dumsU+N+6XzzJDQ+Ik90TlLWQf7XXKb+LrR0vuV6djCqz6
	cCnR8UI/3OgJYpL+N4bE/lOc+FsWHYUgrbtG5vwooKrJzqzHAdGCiZJua644ebWn
	I4RwD0pTUmypO0J+T+n6+V+iiIy2n89NThL8VkEbdxIWAQB6WOSAqMnJpy81mUgp
	94qbnaJEYhv2b21GAB6XZ3IqJHDzmr8RxrUMIapCbAV+yW4iyNS+A+Ue9Z0jyxHH
	mY2z9wPABwamp7g+z7yoQ==
X-ME-Sender: <xms:JQ6BY4iv4RHmiA62fny5yI9YDI9TCsMDw_rYpsq613baazuFDo3TSA>
    <xme:JQ6BYxAJImrvGcnnvCBuSdUYANgJ7ZQCjHg69Qnt_4wz3VfKTy3o-cWUOPsnZEkbr
    9og8GdHmNJFU2qFRw>
X-ME-Received: <xmr:JQ6BYwGUwvadsg3zElasU1qN12IWedU9XyMga9Z79VVbWbCPLqXYrraBRdUPHSpB9OOFoN7zfEEl4VeX7ONvY8pQMdVTXIrmc1Gois8tTb83Ud4w1H_vv1xHog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeegieekueefvddvueetiedviefftdfgtdefjefgteeffeegfffg
    vdffheejvdeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:JQ6BY5RWoXXEr60Vwh2k712uxx4d3ja3R-gyIL-v2nbXaeH-gD-5mg>
    <xmx:JQ6BY1yZLm5nZ93cdF7ABIVVJGLxVu7VxkVq8Z46B1VhUiuHeQQbfg>
    <xmx:JQ6BY36QVnGO8gGm8cPyaMLEcwOm0GuJPpzvwwOnmsXD7e-Ro3jmJA>
    <xmx:Jg6BY7rMqmoHaIqQt1SqANX6uylPyxd0Lj-MBa1nq1PVbP6ia9dWLA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Nov 2022 13:49:07 -0500 (EST)
Message-ID: <3b5e52c5-7a1c-8bdd-b076-0c5e13463274@sholland.org>
Date: Fri, 25 Nov 2022 12:49:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <3689906.Lt9SDvczpP@diego>
 <CA+V-a8uQh=q8ksTe8ttHkJThcoYtggSU-AXUqPGYnam0CiqZWw@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 5/7] riscv: mm: dma-noncoherent: Pass direction and
 operation to ALT_CMO_OP()
In-Reply-To: <CA+V-a8uQh=q8ksTe8ttHkJThcoYtggSU-AXUqPGYnam0CiqZWw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_104916_063448_501CFAEE 
X-CRM114-Status: GOOD (  12.16  )
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

T24gMTEvMjQvMjIgMTM6MTgsIExhZCwgUHJhYmhha2FyIHdyb3RlOgo+IEhpIEhlaWtvLAo+IAo+
IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KPiAKPiBPbiBUaHUsIE5vdiAyNCwgMjAyMiBhdCA2
OjI5IFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+Pgo+PiBBbSBE
b25uZXJzdGFnLCAyNC4gTm92ZW1iZXIgMjAyMiwgMTg6MjI6MDUgQ0VUIHNjaHJpZWIgUHJhYmhh
a2FyOgo+Pj4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJw
LnJlbmVzYXMuY29tPgo+Pj4KPj4+IFBhc3MgZGlyZWN0aW9uIGFuZCBvcGVyYXRpb24gdG8gQUxU
X0NNT19PUCgpIG1hY3JvLgo+Pj4KPj4+IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gZm9yIGFkZGlu
ZyBlcnJhdGEgZm9yIHRoZSBBbmRlcyBDUFUgY29yZS4KPj4KPj4gY2FuIHlvdSBwcm92aWRlIG1v
cmUgZXhwbGFuYXRpb24gd2h5IHRoYXQgaXMgbmVjZXNzYXJ5IHBsZWFzZT8KPj4gSSBndWVzcyB5
b3Ugd2FudCB0byB1c2UgZGlmZmVyZW50IGNhY2hlIG9wZXJhdGlvbnMgZm9yIHNvbWUgY2FzZXM/
Cj4+Cj4gWWVzIGJhc2ljYWxseSB0byBjYWxsIGRpZmZlcmVudCBjYWNoZSBvcGVyYXRpb25zIGJh
c2VkIG9uIHRoZSBkaXIgYW5kCj4gb3BlcmF0aW9ucyAoYW5kIGFsc28gdGhpcyBhbGxvd3MgdG8g
ZXhwb3J0IGp1c3Qgb25lIGZ1bmN0aW9uIHRvIGhhbmRsZQo+IHRoZSBlcnJhdGEpLiBJJ2xsIHVw
ZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gdGhlIG5leHQgdmVyc2lvbi4KClRoaXMgbWFrZXMg
dGhpbmdzIGxlc3MgZWZmaWNpZW50LCBiZWNhdXNlIGl0IHJlcXVpcmVzIG1vcmUgaW5zdHJ1Y3Rp
b25zCmFuZCByZWdpc3RlcnMgaW5zaWRlIHRoZSBhbHRlcm5hdGl2ZSBzZWN0aW9uLCBhbmQgeW91
ciBmdW5jdGlvbgpkdXBsaWNhdGVzIHRoZSBsb2dpYyBmcm9tIGFyY2hfc3luY19kbWFfZm9yX2Rl
dmljZSgpLiBUaGUgYWx0ZXJuYXRpdmUgaXMKYWxyZWFkeSBwYXNzZWQgdGhlIG9wZXJhdGlvbiAo
Y2xlYW4vZmx1c2gvaW52YWxpZGF0ZSkgYXMgYSB0b2tlbiwgc28geW91CmNhbiBjb25zdHJ1Y3Qg
dGhlIGZ1bmN0aW9uIG5hbWUgd2l0aCB0b2tlbiBwYXN0aW5nLgoKUmVnYXJkcywKU2FtdWVsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
