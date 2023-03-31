Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB42C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 13:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VG9izDKTRqCIZuqhvg9CJ5c86ztCfXTZNriHxG6Tj/g=; b=fh4NXvXE0yFy6A
	5zqhLJzwZoXgOZSpzaSfSn72sRJXT6e2DCDV/qRHuR1Ha35ivPS7NGys9W8N/diD0sqpHfXTd7k+n
	/6UeS0sRkV0WVHe4Eo/M5cXf95oRHbXJPoSoxltSa/hHDfOxbvbThTdUMWihf+ArKFVfFqNiz1KjK
	clJBoLP4vBluaHeY0YPMQXFaryGe6/raCEKwI/IcPvp8avB/xzCK7dwEN3xT4bwCyO6sx9LXke5jY
	q/8kCMQrZR+CDpkbZVZNhB1si7Vw74CLbytkknuFzMwcWf482jhcJMNlE0qTgQ171ntElngykd1o3
	LI2cE4dTCj7n5c5UCZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEhJ-007VnE-1i;
	Fri, 31 Mar 2023 13:21:41 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEhG-007Vm3-0E
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 13:21:39 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C023A5C00DE;
	Fri, 31 Mar 2023 09:21:36 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 09:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1680268896; x=1680355296; bh=ovGzLmCRYBV+Fk+VtkV1DusgbzUNCjhBOgu
	eGJt1E/8=; b=khLHOepKtLXil1QvVmBA3JXD9wtQsSf0cBJ+mrHf5oL9PmEAjL/
	WVpQtfOzsR6aPxknWPv7ZE89f9qTiqEQg3ZgXBsH+1fmldBU0syAtomPeQ/M8KtF
	y8ydHdDN1zLNOQhzBz7fx7Wj981ct9AW6eLp9b5a51p3EMyTNkLPIfNJg1fppGuX
	zsbAgJ3UrB14XKDY5U9Y9Mr22wbGERxxla/oc5vDsUkGrAuh4U6PHLpGvow5oWe1
	LC9vG06Wj6bTUZ6hv/cRtHK79mhPfo2CwBUFM1kwr+oLLQ6ruSQ5U92dWbvBALGW
	r7CVi3SBYGvnAcypzGT9inr4OiWiUIgZRHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680268896; x=1680355296; bh=ovGzLmCRYBV+Fk+VtkV1DusgbzUNCjhBOgu
	eGJt1E/8=; b=CQvWK84Fn9nouXU6aTYtwXulujSysorotuAgKWMuGaXNXStqH1v
	rFYE0q7n5U4dGAlaF6kjDlC08vnB+PDDJxUzIXjcEe1SH4ZYVb3uJ1rY/DM+2fLZ
	l8QnbtPU5ULRi/ru+USclnnFwOiPYsvBO9rhZoLXJd7UZCsD3mHqfZUshItFmpYi
	ZVS7vmXKe9Q92UmHHnTy9xcAg1QQT9NmRr3USK2ziMtw/STs0bZcH0KsvDqkEjf6
	xZCA0KCtEtrgnFrRO23CtsCS0aDDbJ+b+FM5ZJWO/b+kKH99/g+h+QuJrUoRjGJB
	AJ2Ex/w1lXMsCiKzMUBGpvEMqB2F3B2dSyA==
X-ME-Sender: <xms:X94mZL9Ym39WBSyBfh1g0SRjLRCalx4op-MAUh9U5roJn_FeYGL04A>
    <xme:X94mZHt_6qAJQXsydcD34NHf98IjjOENci7qtPwPQ4Oq3FQ2-GqR9wuj59Ei-E_cS
    Cu-38MmxdCxJHqDKvM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:YN4mZJAhJVnAYtZTUN7-g0dZBBkGLUtNRIo0LNaxWgM7ytI00Rr7hA>
    <xmx:YN4mZHcWmmZEHu4IUF6Kt_RAEPLeZ3uSl-DukPDi8kcp0iJFd3LCHw>
    <xmx:YN4mZAM_wkOeO78T2JwfrQyPgjpulPVsbxPm8ZNUM4ukuPTh8zvASA>
    <xmx:YN4mZPPIw38AtrfICw7dFjCEq6HTcgeaZevW3fEznSQbBcI2Me8mhg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E38FFB6008D; Fri, 31 Mar 2023 09:21:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <d91ffb1e-261b-4b2f-a78f-f2846600a3e7@app.fastmail.com>
In-Reply-To:  <CALs-HstAKtvORKwRWeh97SuAuYR61aiR-3jA2_0JCZGAJXVHbg@mail.gmail.com>
References: <20230221190858.3159617-1-evan@rivosinc.com>
 <20230221190858.3159617-3-evan@rivosinc.com>
 <605fb2fd-bda2-4922-92bf-e3e416d54398@app.fastmail.com>
 <CALs-HstAKtvORKwRWeh97SuAuYR61aiR-3jA2_0JCZGAJXVHbg@mail.gmail.com>
Date: Fri, 31 Mar 2023 15:21:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Evan Green" <evan@rivosinc.com>
Subject: Re: [PATCH v3 2/7] RISC-V: Add a syscall for HW probing
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_062138_177917_4B9B687A 
X-CRM114-Status: GOOD (  24.24  )
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, "Conor.Dooley" <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Vineet Gupta <vineetg@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, guoren <guoren@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXIgMzAsIDIwMjMsIGF0IDIwOjMwLCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFRo
dSwgRmViIDIzLCAyMDIzIGF0IDI6MDbigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
PiB3cm90ZToKPj4gPiArICAgIGxvbmcgc3lzX3Jpc2N2X2h3cHJvYmUoc3RydWN0IHJpc2N2X2h3
cHJvYmUgKnBhaXJzLCBzaXplX3QKPj4gPiBwYWlyX2NvdW50LAo+PiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzaXplX3QgY3B1X2NvdW50LCBjcHVfc2V0X3QgKmNwdXMsCj4+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MpOwo+Pgo+PiBUaGUg
Y3B1IHNldCBhcmd1bWVudCB3b3JyaWVzIG1lIG1vcmU6IHRoZXJlIHNob3VsZCBuZXZlciBiZSBh
Cj4+IG5lZWQgdG8gb3B0aW1pemUgZm9yIGJyb2tlbiBoYXJkd2FyZSB0aGF0IGhhcyBhbiBhc3lt
bWV0cmljIHNldAo+PiBvZiBmZWF0dXJlcy4gSnVzdCBsZXQgdGhlIGtlcm5lbCBmaWd1cmUgb3V0
IHRoZSBtaW5pbXVtIHNldAo+PiBvZiBmZWF0dXJlcyB0aGF0IHdvcmtzIGFjcm9zcyBhbGwgQ1BV
cyBhbmQgcmVwb3J0IHRoYXQgbGlrZSB3ZQo+PiBkbyB3aXRoIEhXQ0FQLiBJZiB0aGVyZSBpcyBh
IFNvQyB0aGF0IGlzIHNvIGJyb2tlbiB0aGF0IGl0IGhhcwo+PiBpbXBvcnRhbnQgZmVhdHVyZXMg
b24gYSBzdWJzZXQgb2YgY29yZXMgdGhhdCBzb21lIHVzZXIgbWlnaHQKPj4gYWN0dWFsbHkgd2Fu
dCB0byByZWx5IG9uLCB0aGVuIGhhdmUgdGhlbSBnbyB0aHJvdWdoIHRoZSBzbG93Cj4+IHN5c2Zz
IGludGVyZmFjZSBmb3IgcHJvYmluZyB0aGUgQ1BVcyBpbmRpZHVhbGx5LCBidXQgZG9uJ3QgbWFr
ZQo+PiB0aGUgYnJva2VuIGNhc2UgZWFzaWVyIGF0IHRoZSBleHBlbnNlIG9mIG5vcm1hbCB1c2Vy
cyB0aGF0Cj4+IHJ1biBvbiB3b3JraW5nIGhhcmR3YXJlLgo+Cj4gSSdtIG5vdCBzbyBzdXJlLiBX
aGlsZSBJIGFncmVlIHdpdGggeW91IGZvciBtYWpvciBjbGFzc2VzIG9mIGZlYXR1cmVzCj4gKGVn
IG9uZSBDUFUgaGFzIGZsb2F0aW5nIHBvaW50IHN1cHBvcnQgYnV0IGFub3RoZXIgZG9lcyBub3Qp
LCBJIGV4cGVjdAo+IHRoZXNlIGJpdHMgdG8gY29udGFpbiBtb3JlIHN1YnRsZSBkZXRhaWxzIGFz
IHdlbGwsIHdoaWNoIG1pZ2h0IHZhcnkKPiBhY3Jvc3MgYXN5bW1ldHJpYyBpbXBsZW1lbnRhdGlv
bnMgd2l0aG91dCBicmVha2luZyBBQkkgY29tcGF0aWJpbGl0eQo+IHBlci1zZS4gTWF5YmUgc29t
ZSB2ZW5kb3IgaGFzIGltcGxlbWVudGVkIGV4b3RpYyB2aWRlbyBkZWNvZGluZwo+IGFjY2VsZXJh
dGlvbiBpbnN0cnVjdGlvbnMgdGhhdCBvbmx5IHdvcmsgb24gdGhlIGJpZyBjb3JlLiBPciBtYXli
ZSB0aGUKPiBiaWcgY29yZXMgc3VwcG9ydCB2My4xIG9mIHNvbWUgZXh0ZW5zaW9uICh3aGVyZSBj
ZXJ0YWluIHRoaW5ncyBydW4KPiBmYXN0ZXIpLCBidXQgdGhlIGxpdHRsZSBjb3JlcyBvbmx5IGhh
dmUgdjMuMCwgd2hlcmUgaXQncyBhIGxpdHRsZQo+IHNsb3dlci4gQ2VydGFpbiBhcHBzIHdvdWxk
IGxpa2VseSB3YW50IHRvIGtub3cgdGhlc2UgdGhpbmdzIHNvIHRoZXkKPiBjYW4gYWxsb2NhdGUg
dGhlaXIgd29yayBvcHRpbWFsbHkgYWNyb3NzIGNvcmVzLgoKRG8geW91IGhhdmUgYSBzcGVjaWZp
YyBmZWF0dXJlIGluIG1pbmQgd2hlcmUgaGFyZHdhcmUgd291bGQgYmUKaW50ZW50aW9uYWxseSBk
ZXNpZ25lZCB0aGlzIHdheT8gSSBzdGlsbCBjYW4ndCBjb21lIHVwIHdpdGggYQpzY2VuYXJpbyB3
aGVyZSB0aGlzIHdvdWxkIGFjdHVhbGx5IHdvcmsgaW4gcHJhY3RpY2UsIGFzIGhhdmluZwphc3lt
bWV0cmljIGZlYXR1cmVzIGlzIGluY29tcGF0aWJsZSB3aXRoIHNvIG1hbnkgb3RoZXIgdGhpbmdz
CndlIG5vcm1hbGx5IGRvLgoKLSBJbiBhIHZpcnR1YWwgbWFjaGluZSwgdGhlIFZDUFUgdGVudHMg
dG8gZ2V0IHNjaGVkdWxlZCBhcmJpdHJhcmlseQogIHRvIHBoeXNpY2FsIENQVXMsIHNvIHNldHRp
bmcgYWZmaW5pdHkgaW4gYSBndWVzdCB3b24ndCBhY3R1YWxseQogIGd1YXJhbnRlZSB0aGF0IHRo
ZSBmZWF0dXJlIGlzIHN0aWxsIHRoZXJlLgoKLSBVc2luZyBhIENQVSBmZWF0dXJlIGZyb20gbGli
cmFyeSBjb2RlIGlzIHByYWN0aWNhbGx5IGltcG9zc2libGUKICBpZiBpdCByZXF1aXJlcyBzcGVj
aWFsIENQVSBhZmZpbml0eSwgYXMgdGhlIGFwcGxpY2F0aW9uIG1heQogIGFscmVhZHkgYmUgc3Rh
cnRlZCBvbiBzcGVjaWZpYyBDUFVzIGZvciBhbm90aGVyIHJlYXNvbiwgYW5kCiAgaGF2aW5nIGEg
bGlicmFyeSBjYWxsIHNjaGVkX3NldGFmZmluaXR5IHdpbGwgY29uZmxpY3Qgd2l0aCB0aG9zZS4K
Ci0gRXZlbiBpbiB0aGUgc2ltcGxlc3QgY2FzZSBvZiBoYXZpbmcgYSBzdGFuZGFsb25lIGFwcGxp
Y2F0aW9uCiAgd2l0aG91dCBhbnkgc2hhcmVkIGxpYnJhcmllcyB0cnkgdG8gcGljayBhIHNlbnNp
YmxlIENQVSB0bwogIHJ1biBvbiBpcyBoYXJkIHRvIGRvIGluIGEgZ2VuZXJpYyB3YXksIGFzIGl0
IHdvdWxkIG5lZWQgdG8KICB3ZWlnaCBhdmFpbGFiaWx0eSBvZiBmZWF0dXJlcyBvbiBjZXJ0YWlu
IGNvcmVzIGFnYWluc3QgdGhlCiAgbnVtYmVyIG9mIGNvcmVzIHdpdGggb3Igd2l0aG91dCB0aGUg
ZmVhdHVyZSBhbmQgdGhlaXIgY3VycmVudAogIGFuZCBleHBlY3RlZCBzeXN0ZW0gbG9hZC4KCkFz
IGxvbmcgYXMgdGhlcmUgaXNuJ3QgYSBzcGVjaWZpYyByZXF1aXJlbWVudCwgSSB0aGluayBpdCdz
IGJldHRlcgp0byBub3QgYWN0dWFsbHkgZW5jb3VyYWdlIGhhcmR3YXJlIHZlbmRvcnMgdG8gaW1w
bGVtZW50IGRlc2lnbnMKbGlrZSB0aGF0LCBvciBhdCBsZWFzdCBub3QgZGVzaWduaW5nIGFuIGlu
dGVyZmFjZSB0byBtYWtlIGdldHRpbmcKdGhpcyBpbmZvcm1hdGlvbiBhIGZldyBtaWNyb3NlY29u
ZHMgZmFzdGVyIHRoYXQgd2hhdCBhbHJlYWR5CmV4aXN0cy4KCiAgICAgIEFybmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
