Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67EAE77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0wZ6W2GT33+zp4/aHxnqjPAzKpEJ6eXDn3MvHLVpxCY=; b=3/VXneER2T3v300yfnjl5YZIjI
	/iwuOGu/HEaDbhpibC+74QwD9QGcucY0kEZD6cKlUy5OQn2wG9UK1wJSjIHKBmY3gqAZ9r5lu9nbm
	1svQ6101mmNHjhiXGZiFTXHR/KSINFLSGO+8KHuhZKTzixOTXHhzSdchbQGJDixLXOqOfRWNTpUhi
	ixKtj40ZbYa1Qw41sgJC/UVZcjZN2CkdwuuJrPTmEpS+liuGnbAmDeATOc7RKfXL7+B9CcSp+mm+L
	jyupTU8QyVqFfjE8Z9gR2fVu04nA7mSLBagIJVl+dm91Aseg85S+wSmX4E7dDUOSR2kHugwQC/gEM
	0GccwtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx3t-0000000HCrn-1s2U;
	Wed, 18 Dec 2024 16:38:13 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNx2N-0000000HCZd-0nPL;
	Wed, 18 Dec 2024 16:36:41 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.stl.internal (Postfix) with ESMTP id 604441D40442;
	Wed, 18 Dec 2024 11:36:36 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 18 Dec 2024 11:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734539796;
	 x=1734546996; bh=nfvIer0zFabb2CSH4FYG5+b3Q6Xz7yeeSWmQEgNJheM=; b=
	ZBQAOqwWg2K05L5uK2bYuwdACrxkLsoc2PIgD0cQgiEZ7YYzhpCxLlGgVZW3DVx6
	RnHtDGYZacvkFOApE5i8PpEKXJJGSLMPZi1/7zYeCxngLwFiuC9mIs0r1MfRf1d7
	ljvkEfr+wDzKKBBc+aurNSqkpq8ZRtQDdq0HUTxnfOR5XzEt97aJE7dwOdFVZ/hQ
	G7NwA6xY0dgZ+/xg4YILY7/7WbCEybiUYNzp0z8/igRlYf8NVwKiJsF4kOTG+iqu
	JyrXPLjrjW44Sllz4+cRSo0lIJniQhepEl9dIW9Ha7JzvHs7+IVaGL96wRRmTQVz
	/xIay+l60aHEAef4QHVc4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734539796; x=
	1734546996; bh=nfvIer0zFabb2CSH4FYG5+b3Q6Xz7yeeSWmQEgNJheM=; b=K
	qJZWQVI8dLKjsLZD5P9G0J1qUuKhEEsdqq+hKLVZma8PcO0rePXvzMeh3Gx+vBOD
	4nrPDtjhBHF33PiCb2oLKtLN8BuhIxgjeQHXotN9690yJVqb/PXCqLhFT2gY2knP
	SHOoAC5zDrv2o7AYcQSL9H9AgGMdlkVSHmV5ZjLFwBX52jgdNDzgyVppGNX1wod9
	7ttZ7ZLraiTYPJxQ1MR/SR1x3wO/EGPAqJ0WFhEdeVI7D2KnDKbbNvBechT+mDuz
	cpPDpxvu0YbekmHfrUlPuFeXsXgCSELupq6HK7beqkIp0QrURFeBQbSN0zMiN8me
	L7v+l+rQqTjKGKfPI+cXQ==
X-ME-Sender: <xms:EPpiZ2PhewnaDdeTezsY7UHZ-8MZHheQgg2o6m05zEshehzpenow1A>
    <xme:EPpiZ08FeD-PHv9DfxkMbyU44Z2agIt5ndVb5bJvAT7p7tClm27qKJ2TH4eLJ14WB
    FQJfPGZ_sMFiMW81M0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleekgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeej
    vdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegiedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtg
    hpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphht
    thhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepvh
    hinhgtvghniihordhfrhgrshgtihhnohesrghrmhdrtghomhdprhgtphhtthhopehlihhn
    uhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhishhtohhphh
    gvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehprghlmhgvrhesuggr
    sggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrd
    gvughupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghu
X-ME-Proxy: <xmx:EPpiZ9SUEzmB8m4BWTnSvNTtSXRoY8pckW1eK5W5rKnWC0lS5naOKQ>
    <xmx:EPpiZ2tCYDXsXEJFpJcBW2DlzBqmukOXYouat3DqxhmhFciRrpQLMQ>
    <xmx:EPpiZ-ctkHakbRRswX0-1x3fLnbcgCLh6ogHHQVM_Yz1HDnHdPdaLw>
    <xmx:EPpiZ62xeygOoJZVhzcxu1Lkfiip8AzfGhxGF4meBhl3PD_5MD0-1Q>
    <xmx:FPpiZ3eUuVl_kIXn3EabUXk14dEdg5IU1747WEAAdir6NevQA5VhmJtW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5B4AC2220075; Wed, 18 Dec 2024 11:36:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 17:35:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Conor Dooley" <conor@kernel.org>
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Russell King" <linux@armlinux.org.uk>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Linux-Arch <linux-arch@vger.kernel.org>,
 "Nam Cao" <namcao@linutronix.de>
Message-Id: <137c0594-e178-4c91-bc8b-5f99b3ddb2f0@app.fastmail.com>
In-Reply-To: <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
 <20241218-action-matchbook-571b597b7f55@spud>
 <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage implementation
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_083639_890642_FA9EF485 
X-CRM114-Status: GOOD (  17.38  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQsIGF0IDE2OjQ2LCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToK
PiBPbiBXZWQsIERlYyAxOCwgMjAyNCBhdCAwMzowODoyOFBNICswMDAwLCBDb25vciBEb29sZXkg
d3JvdGU6Cj4+IE9uIE1vbiwgRGVjIDE2LCAyMDI0IGF0IDAzOjEwOjAzUE0gKzAxMDAsIFRob21h
cyBXZWnDn3NjaHVoIHdyb3RlOgoKPj4gTWlnaHQgYmUgYSBjbGFuZyB0aGluZywgYWxsbW9kY29u
ZmlnIHdpdGggY2xhbmcgZG9lc24ndCBidWlsZCBlaXRoZXIuCj4KPiBUaGUgcHJvcG9zZWQgZ2Vu
ZXJpYyBzdG9yYWdlIGluZnJhc3RydWN0dXJlIGN1cnJlbnRseSBleHBlY3RzIHRoYXQgYWxsCj4g
aXRzIHVzZXJzIGFsc28gdXNlIEhBVkVfR0VORVJJQ19WRFNPLgo+IEkgbWlzc2VkIHJ2MzIgd2hl
biBjaGVja2luZyB0aGlzIGFzc3VtcHRpb24uCj4KPiBJIGNhbiBhZGQgYSBidW5jaCBvZiBpZmRl
ZnMgaW50byB0aGUgc3RvcmFnZSBjb2RlIHRvIGhhbmRsZSB0aGlzLgo+Cj4gT3Igd2UgcmUtYWRk
IHRoZSB0aW1lIHZEU08gZnVuY3Rpb25zIHdoaWNoIHdlcmUgcmVtb3ZlZCBpbiBjb21taXQKPiBk
NGMwOGI5Nzc2YjMgKCJyaXNjdjogVXNlIGxhdGVzdCBzeXN0ZW0gY2FsbCBBQkkiKS4KPiBUb2Rh
eSB0aGVyZSBhcmUgdXBzdHJlYW0gcG9ydHMgb2YgbXVzbCBhbmQgZ2xpYmMgd2hpY2ggY2FuIHVz
ZSB0aGVtLgo+IChjdXJyZW50bHkgbXVzbCBldmVuIHRyaWVzIHRvIHVzZSBfX3Zkc29fY2xvY2tf
Z2V0dGltZSgpIGFzIDY0LWJpdCBvbmx5Cj4gb24gcnYzMiBkdWUgdG8gYSBjb3B5LWFuZC1wYXN0
ZSBlcnJvciBmcm9tIGl0cyBydjY0IGNvZGUpCgpBZGRpbmcgYmFjayBfX3Zkc29fY2xvY2tfZ2V0
dGltZSgpIHdvdWxkbid0IHdvcmsgb24gcnYzMiBiZWNhdXNlIHRoZXJlCmlzIG5vIGZhbGxiYWNr
IHN5c2NhbGwgZm9yIGl0LCBhbmQgaXQgd291bGRuJ3QgcmVhbGx5IGhlbHAgc2luY2UKdGhlcmUg
aXMgbm8gZXhpc3RpbmcgdXNlcnNwYWNlIHRoYXQgdXNlcyB0aW1lMzIgc3RydWN0dXJlcy4KCj4g
VGhlcmUgaXMgcHJlY2VkZW5jZSBpbiBwcm92aWRpbmcgNjRiaXQgb25seSB2RFNPIGZ1bmN0aW9u
cywgZm9yIGV4YW1wbGUKPiBfX3Zkc29fY2xvY2tfZ2V0dGltZTY0KCkgaW4gYXJtLgo+IEkgZG8g
aGF2ZSBhIHNtYWxsLCBzbyBmYXIgdW50ZXN0ZWQsIHByb29mLW9mLWNvbmNlcHQgcGF0Y2ggZm9y
IGl0Lgo+IFRoaXMgd291bGQgZXZlbiBiZSBsZXNzIGNvZGUgdGhhbiB0aGUgaWZkZWZzLgo+Cj4g
V2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgaXQ/CgpZZXMsIHNpbXBseSBleHBvc2luZyB0aGUgbm9y
bWFsIHRpbWU2NCBzeXNjYWxscyB0aHJvdWdoIHZkc28Kc2hvdWxkIGJlIGZpbmUuIEkgdGhpbmsg
dGhpcyBjdXJyZW50bHkgd29ya3Mgb24gZXZlcnl0aGluZyBleGNlcHQKcnYzMiBhbmQgc3BhcmMz
MiwgcHJvYmFibHkgYmVjYXVzZSBuZWl0aGVyIG9mIHRoZW0gaGF2ZSBhY3R1YWwKdXNlcnMgdGhh
dCBhcmUgYWJsZSB0byB0ZXN0LgoKICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
