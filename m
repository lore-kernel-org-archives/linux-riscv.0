Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5F6C0218A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 19:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6pqVRnHA7jK7fb+/XIRsFXaHGA4+7FmYyd85pJYuVno=; b=gR6gXX9Fb5O4Bjez+hi/UHdoe8
	Qf1sk7D1XECH2U/d/8HLgr76ePOLiZ3cJMEoq/O/xl7XCnP+RR2B5wiRLb+R4S9FI4lFP1ee4w0XM
	Jz5dYMpc8YjZS/qBbEV2xGKYJf26zBN2m8L2P/fn7tGmmdUzbfGkSq6g6blKCv6w37axDDSj2mxtJ
	u5h9FDtJ2cedYwp6jbNX2il4Jh+oraT+wf9QShRizvYJqcrkic9Ua+Ws/nEh/oKGaeM5xEB/UpneI
	j3ZI395Pfr25+GSdtepwMv9EkH8HIUmH6rr1djxKBn5hcWaMNR+s3lCFGHQOrxtjndqDPwzRipcvt
	a1d70/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUTk-000000035hl-2ptP;
	Mon, 27 Jan 2025 19:09:00 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUT4-000000035eX-35LW
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 19:08:20 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id E5C2713801E4;
	Mon, 27 Jan 2025 14:08:16 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 27 Jan 2025 14:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738004896;
	 x=1738091296; bh=aNIlcLxpP3HWGgVehSuZiQmwJIwQ6YhjQD/tEwRT0VU=; b=
	dsMJ+KQ1UObgJ/MqTs6J1bx7Zk5D7BtD15QjgB3rOgdSuSyGaYhhdbFxFwv8QirE
	NxdQXgnphOH28kQ+qXKYYt9oDKjJcV56JEkPFzFxqcrBfmxRzOm3a48ZlFXgojpA
	0FTlu0VVL7Qn5qXxJtQBS89kvKq7uSApb2vUVMNR9J3ZR6/uqhc1hGXebITv6fBM
	T4hRpg2VQZgwp1P4m49YFrZ2jkJeNL9PmzkSKPX+meIlY75CaSnLRAzFWHgKahCX
	ByRk8MGU6w4L+RZilyLWnuQffEMQo3B4pgodVoCulsVwDTQl4wKKtQ/X1zthqJAc
	SSQZiPISlHd79v1tUMsrQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738004896; x=
	1738091296; bh=aNIlcLxpP3HWGgVehSuZiQmwJIwQ6YhjQD/tEwRT0VU=; b=f
	T0W1VcRMmcAHXraqwVfvh929Ww/zPRoaoHfE+7R5VZ7ddGfTsBuAd8pQmahKcMEl
	swVqrXtRYnIonWlBnOCIJxeV+YMdZRY1Nwu07rycBNihQ40rtQ56zdu+ZHw+c4Q/
	AjVir+jkLlb1RhEzuYs9TVQq+75Vt+jc6bDb6unGggYRW0fYuJwMm+qnUbK87U4o
	nZhuAUl/ghRlUMRPfeHHdA6cK5TozE5VguUkL7jvcG0ZGxhKZj256MHZipMCuoFA
	dfXBm0cbwJUkEM8jI8QzH6hBFFVyyI0Osn9I710TKtchTV1iKUFwa5kfG5ZJp9lo
	RVcuWV5Ir+cSVpE+3So/g==
X-ME-Sender: <xms:n9mXZ_lfKGikE4lJBF-uYRdg2t-bULtu2WETsiuUtpWC1hn-vH3H0Q>
    <xme:n9mXZy2v7E7hiJlkKZkH0oaco-50Oe6-u3AQjyV6pt1xWL4unHNky9d4ZcmQ7_2WI
    sFz9i_yzbifnkl5HMM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudefleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhuphessghrrghinhhfrg
    hulhhtrdhorhhgpdhrtghpthhtoheplhhihhgrnhhgjhhinhhgsegshihtvggurghntggv
    rdgtohhmpdhrtghpthhtoheplhhugihurdhkvghrnhgvlhessgihthgvuggrnhgtvgdrtg
    homhdprhgtphhtthhopeigihgvhihonhhgjhhisegshihtvggurghntggvrdgtohhmpdhr
    tghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepthhglh
    igsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugidqrhhishgtvhes
    lhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegthhgrrhhlihgvse
    hrihhvohhsihhntgdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehs
    ihhfihhvvgdrtghomh
X-ME-Proxy: <xmx:oNmXZ1pcBbvQP_YLVXRapoEe6QCFga525K-P1v5DkawpCl6TO9nvoQ>
    <xmx:oNmXZ3maHOZ_k2EoJ_B2gV3irJ4wLuzUhGqqYs9ZMC95eJh3qDWtyg>
    <xmx:oNmXZ90_xj5ZCdbEdh_BpKZhjp253ER2LDdhip5qODo988MBEi3erw>
    <xmx:oNmXZ2tbbN4Xdpvuly8lkM4bPBdDsclta7GOQO9IXvxxUbo4MuoD2w>
    <xmx:oNmXZ3xLYSI2LugRJS8wYNMH8JPMwM3AU-G5ZobeLz4rL3g9REbDhJQs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E1A532220072; Mon, 27 Jan 2025 14:08:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 20:07:55 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Xu Lu" <luxu.kernel@bytedance.com>
Cc: "Thomas Gleixner" <tglx@linutronix.de>,
 "Anup Patel" <anup@brainfault.org>, "Charlie Jenkins" <charlie@rivosinc.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, lihangjing@bytedance.com,
 "Xie Yongji" <xieyongji@bytedance.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <7811b481-0227-42bb-a5ce-1d9794f5a196@app.fastmail.com>
In-Reply-To: <CAPYmKFtx6GNE5r-R33aiHeF-qgFESH0sbsorttjJ88wTL8yr9w@mail.gmail.com>
References: <20250127093846.98625-1-luxu.kernel@bytedance.com>
 <a7d9b0e5-7ef6-457e-ace6-c56e745c3150@app.fastmail.com>
 <CAPYmKFtx6GNE5r-R33aiHeF-qgFESH0sbsorttjJ88wTL8yr9w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RESEND] irqchip: riscv: Order normal writes and IPI
 writes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_110819_652916_551BE72A 
X-CRM114-Status: GOOD (  12.89  )
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

T24gTW9uLCBKYW4gMjcsIDIwMjUsIGF0IDE3OjM3LCBYdSBMdSB3cm90ZToKPiBPbiBUdWUsIEph
biAyOCwgMjAyNSBhdCAxMjoyM+KAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdy
b3RlOgo+PiBPbiBNb24sIEphbiAyNywgMjAyNSwgYXQgMTA6MzgsIFh1IEx1IHdyb3RlOgo+Pgo+
PiB0aGVhZF9hY2xpbnRfc3N3aV9pcGlfY2xlYXIoKSBzZWVtcyB0byBoYXZlIHRoZSBzYW1lIGJ1
ZywKPj4gaXQgYWxzbyB1c2VzIHRoZSBfcmVsYXhlZCgpIHZlcnNpb24gZm9yIG5vIGFwcGFyZW50
IHJlYXNvbi4KPgo+Cj4gVGhlcmUgc2VlbXMgbm8gbmVlZCB0byBtb2RpZnkgdGhlYWRfYWNsaW50
X3Nzd2lfaXBpX2NsZWFyKCkgYXMgaXQgb25seQo+IGNsZWFycyBwZW5kaW5nIElQSSBvbiBjdXJy
ZW50IGhhcnQuIE5vIG90aGVyIGhhcnRzIHJlcXVpcmUgdG8gc2VlCj4gc3RyaWN0IG9yZGVyIGJl
dHdlZW4gcHJlY2VkaW5nIG1lbW9yeSB3cml0ZXMgYW5kIHRoaXMgQUNMSU5UIE1NSU8KPiB3cml0
ZS4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBtaXNzZWQgYW55dGhpbmcuCgpNeSBwb2ludCB3YXMg
dGhhdCB5b3Ugc2hvdWxkIGFsd2F5cyBkZWZhdWx0IHRvIHRoZSBub3JtYWwgb3BlcmF0aW9ucywK
c2luY2UgdGhlIHJlbGF4ZWQgb25lcyBrZWVwIGNhdXNpbmcgcHJvYmxlbXMuIElmIHlvdSBzdGls
bCB0aGluayBpdCdzCmltcG9ydGFudCB0byB1c2Ugd3JpdGVsX3JlbGF4ZWQoKSBpbiB0aGVhZF9h
Y2xpbnRfc3N3aV9pcGlfY2xlYXIoKSwKcGxlYXNlIGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyBo
b3cgeW91IGhhdmUgc2hvd24gdGhhdCBpdCdzIGNvcnJlY3QKYW5kIHdoeSBpdCBtYXR0ZXJzLCBv
dGhlcndpc2UgY29udmVydCB0aGVtIGJvdGguCgogICAgICBBcm5kCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
