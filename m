Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0F4C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2gT/ldPzkcL/GzctYnhuvcAsf2md4i4ktWRdBkFbHg=; b=vnK2Oo7r+BhSKT
	eR2PrvCujv0VLP/JnQOXJK+M1s2X+UPi1bQaHnNxO9wq3eaOclSrj63crjK5f52agTG3McNHY9rsw
	BFYHQ5FlH3qVH60WC18WXiOQZwrXkBAHMqV/qeuAV760jweko9I0eFSX9LI8YZ6yP8mZwPJJ3QqzA
	NF2vYgG2KvR1kH/fmyxxlgxPKMinIJWkvIkWiWjf2JgqAyv8KDmQWlGdO1+26QwL/XPa3Mbt8CgMZ
	EN6zXVfQt/SY1nl8G/COQQXJJEZGdMdZwIOFGE0MmcCY19RvsO6cxA2PjiBe4Hpy8Pq/7ZvHlFjJo
	lzrF2ev8/D5ONwf0cD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNYR-0000000GZpA-0Boz;
	Thu, 18 Jul 2024 09:36:03 +0000
Received: from flow4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNYO-0000000GZoO-008D
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 09:36:01 +0000
Received: from compute8.internal (compute8.nyi.internal [10.202.2.227])
	by mailflow.nyi.internal (Postfix) with ESMTP id C6660200379;
	Thu, 18 Jul 2024 05:35:55 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute8.internal (MEProxy); Thu, 18 Jul 2024 05:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721295355;
	 x=1721302555; bh=N6nNE9JphcqfhA9xYmwmZhMShW3TQ025Yd0UOM/gNrs=; b=
	gU4B0fXCqkX23adCeJk85Axa5jUwIyl2PAu5Ak58NhKTY5MGrxcxHywaBGqjlaGB
	EHsmg/15YoGQfdmZCYVXT+LjUEdSD0uzfnnd5L5TbEG5Dhu+w0ZOVwK2HlMoAlCI
	j8KXiOBnjIj2EeW9VRecxF8+AeBiM1JW7reYXEc+/zkwWcl4uB1vB3uJkEEWVkiR
	1IrFONzrwTmHIic+SnrFRljnryEgjhlferPDCLuxNkIOEVMoSZll3T4YpenCZN1W
	NmHG9cdqmsX9jyksmjDXS4sLQXMnkHU7Pn8Cuyq2UK2R3G2omcVxTpdZ3vitrwuN
	QuU2zVwT9e5Je1uubi5v8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1721295355; x=
	1721302555; bh=N6nNE9JphcqfhA9xYmwmZhMShW3TQ025Yd0UOM/gNrs=; b=Y
	qCwNVUWArrKsuH3XSXEL2at8TMuVuiHdG97DnqrCWM5CsyjiTDjYeWySKzCM9a5X
	c6QinnvARAcLFd9hZoPUtGyw9+/LI3lIq6Qbe48MRe7dNQljWbQMes+JIfYvvo7m
	oYJIBfsRNqGhzu911wZlNVVbLtMd4Kn4Xxah8gF4tKfjZ44KVMYbTaoxoldx8fc+
	LsMudcXvuyR9pqoPxoBFQDrdyg9EAxzzLRufov5ld9hAaBICevK2Shfq1SSAnDdg
	JvuABd0B9MNYzLb5SHPS6eF+Zs0dPYz57j0fivAhapFnnI7u7WZ7Ok1b20wnyvNy
	stFA93tV2c6Szw8SMC7mQ==
X-ME-Sender: <xms:-eGYZobX7watBK66SlOkFWX8j2mli9VQrXnkc79BfMDLam_kc43OJw>
    <xme:-eGYZjZEP5tNQKPr4sPK1teVhX24U_OMpdGSDSKsn_bNGpC06EFRzx9cCzJK3ybiP
    -_9sFU52xvoYZvTiX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeelgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:-uGYZi_nYJ6l6x5T5whB92TMlTXEZQkzD86YnoaUEbG3NR0qXVQM4w>
    <xmx:-uGYZioVLqWSaVJ4ihMviX4Gt7w3sTkp7IigwP8e_XQ3MJVeSZ8KMQ>
    <xmx:-uGYZjqDnuZAVNTLENuotI0unpAmAdj7Bc7vorLX-THOTr66pD32dQ>
    <xmx:-uGYZgSYwmHS_csi4cZb8qGiLFRlYGRXTw11ai_V_m4MnFO748FyNQ>
    <xmx:--GYZqe5KPCggtd0FZfIGawTHeZsKcprciCM8oF5gq8PvHD_NuuwKu_C>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BADAB19C0062; Thu, 18 Jul 2024 05:35:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <da057e38-a3e1-42d8-8b7d-4e2dfed6d7b7@app.fastmail.com>
In-Reply-To: <20240718-stammer-envy-f77637a8d039@wendy>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-6-alexghiti@rivosinc.com>
 <20240717-94b49fbac3c6bf97a0f96281@orel>
 <CAHVXubi33T-5y9g1cqa+meM7q7b=0M54o+wrBeYmwfYpWAgAmQ@mail.gmail.com>
 <20240718-stammer-envy-f77637a8d039@wendy>
Date: Thu, 18 Jul 2024 11:35:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor.Dooley" <conor.dooley@microchip.com>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>
Cc: "Andrew Jones" <ajones@ventanamicro.com>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Andrea Parri" <parri.andrea@gmail.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Leonardo Bras" <leobras@redhat.com>,
 guoren <guoren@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Linux-Arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v3 05/11] riscv: Implement arch_cmpxchg128() using Zacas
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_023600_248592_F89CA04E 
X-CRM114-Status: GOOD (  16.04  )
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

T24gVGh1LCBKdWwgMTgsIDIwMjQsIGF0IDEwOjMzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24g
VGh1LCBKdWwgMTgsIDIwMjQgYXQgMDk6NDg6NDJBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdy
b3RlOgo+PiBPbiBXZWQsIEp1bCAxNywgMjAyNCBhdCAxMDozNOKAr1BNIEFuZHJldyBKb25lcyA8
YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiA+IE9uIFdlZCwgSnVsIDE3LCAyMDI0
IGF0IDA4OjE5OjUxQU0gR01ULCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+ID4gPiArCj4+ID4g
PiArdW5pb24gX191MTI4X2hhbHZlcyB7Cj4+ID4gPiArICAgICB1MTI4IGZ1bGw7Cj4+ID4gPiAr
ICAgICBzdHJ1Y3Qgewo+PiA+ID4gKyAgICAgICAgICAgICB1NjQgbG93LCBoaWdoOwo+PiA+Cj4+
ID4gU2hvdWxkIHdlIGNvbnNpZGVyIGJpZyBlbmRpYW4gdG9vPwo+PiAKPj4gU2hvdWxkIHdlIGNh
cmUgYWJvdXQgYmlnIGVuZGlhbj8gV2UgZG9uJ3QgZGVhbCB3aXRoIGJpZyBlbmRpYW4KPj4gYW55
d2hlcmUgaW4gb3VyIGtlcm5lbCByaWdodCBub3cuCj4KPiBUaGVyZSdzIG9uZSBvciB0d28gcGxh
Y2VzIEkgdGhpbmsgdGhhdCB3ZSBkbyBhY3R1YWxseSBoYXZlIHNvbWUKPiBjb25kaXRpb25hbCBz
dHVmZiBmb3IgQkUuIFRoZSBaYmIgc3RyaW5nIHJvdXRpbmVzIEkgYmVsaWV2ZSBpcyBvbmUgc3Vj
aAo+IHBsYWNlLCBhbmQgbWF5YmUgdGhlcmUgYXJlIG9uZSBvciB0d28gb3RoZXJzLiBJbiBnZW5l
cmFsIEknbSBub3Qgb2YgdGhlCj4gb3BpbmlvbiB0aGF0IGl0IGlzIHdvcnRoIGFkZGluZyBjb21w
bGV4aXR5IGZvciBCRSB1bnRpbCB0aGVyZSdzCj4gbGludXgtY2FwYWJsZSBoYXJkd2FyZSB0aGF0
IHN1cHBvcnRzIGl0IChzbyBub3QgUUVNVSBvciBwZW9wbGUncyB0b3kKPiBpbXBsZW1lbnRhdGlv
bnMpLCB1bmxlc3MgaXQncyBzb21ldGhpbmcgdGhhdCB1c2Vyc3BhY2UgaXMgYWJsZSB0byBzZWUu
CgpJIGRvbid0IHRoaW5rIHlvdSB3YW50IHRvIGdvIHRoZXJlIGF0IGFsbDogbWFpbnRhaW5pbmcg
YW4KZXh0cmEgdXNlciBzcGFjZSBBQkkgKG9yIHR3byBpZiB5b3UgYWRkIDMyLWJpdCBCRSBhcyB3
ZWxsKQpoYXMgYSBodWdlIGxvbmctdGVybSBjb3N0LCBhbmQgdGhlcmUgaXMgcHJldHR5IG11Y2gg
emVybwpiZW5lZml0IGZvciBhIEJFIEFCSSB0aGVzZSBkYXlzLgoKQWRkaW5nIGl0IHRvIGFybTY0
IHR1cm5lZCBvdXQgdG8gYmUgYSBtaXN0YWtlLiBXZSBkaWQgaGF2ZQphIGhhbmRmdWwgb2YgdXNl
cnMgaW4gdGhlIGZpcnN0IHllYXIsIGFuZCBpdCB0ZWNobmljYWxseQpzdGlsbCB3b3JrcywgYnV0
IEkgZG9uJ3QgdGhpbmsgdGhlcmUgYXJlIGFueSB1c2VycyBsZWZ0CmFmdGVyIHRoZXkgbWFuYWdl
ZCB0byBmaXggdGhlaXIgbm9ucG9ydGFibGUgbGVnYWN5CnVzZXJzcGFjZSBmcm9tIHRoYXQgd2Fz
IHBvcnRlZCBmcm9tIGJpZy1lbmRpYW4gbWlwcyBvcgpwb3dlcnBjLgoKICAgICBBcm5kCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
