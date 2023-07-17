Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0407BEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rin38snxT1B8hJ2wr91IWifYX6xDoGxFgkogLAkUY7k=; b=YrtsfhTAyXM9GU
	/1eaSeGgzgkdHH7FAu4+4+RogsPuBay9KAgvg08JXWn1t5ck9n42eqQwYmEVdBUPN4jeVJQCtSE4p
	6Lb3aN+Axq/IhCP5UPMr3pjGJIYOAUiNIGnPe00BGMrA187GC3COQfDfCnClOvrAaHV4XOTcQeH/F
	efsf3YT+tLbFJHnl+hcRNToQEtooP9rxYjSFHNOvPkmfnvIEgQykOwBGKCdphwxgeJD7y0E+9obwD
	0nuvVH8i07NVRZqZ0TOireZEplZyR0DLt90AAWjKScZ73hnojdaG+k0S9bgx4BoH6o7juVqVhgp/X
	qtlJsc2+4plTfJ2wfsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRxY-004ez7-0L;
	Mon, 17 Jul 2023 17:24:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRxT-004ewh-0i;
	Mon, 17 Jul 2023 17:24:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E24B61018;
	Mon, 17 Jul 2023 17:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26824C433C9;
	Mon, 17 Jul 2023 17:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689614665;
	bh=o+WgjDKzf9AD9b+kUzQGRClRYLlDB82OkTDYfv6a3Yk=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=U55TcGyi7YmJyhzLOTZnjrFVWw0H3+af918Yjk8mPHfHD/clSDnn9R44JznF10IRH
	 Z8KK+n6r0jSrVIOFXY3K9zEUwgWJJmDl6U+xcWuKBgzWtStxy8DJ8vdgvW6lkDoW7B
	 HjBUxuU9UxtzkC9l5ApN5DKkzBCr1VsqK7wmYWuXqa2OawFE6M2Oq9WP6fcTzeqAS1
	 oQr1aLD/6waYS1NoUdY5C7XFt1xXn2X7vRDexou/Ye3pmNVTURfyjeGdd/9YrFIH9l
	 MqvAuz5uF3yGQhNR2S/bV8TY4Zn4vPj0wIo0nVHW6MMTPN4UGDgaMVOo3Hl1Lknk4t
	 QarZtUu8s3ucw==
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id 0594A27C0054;
	Mon, 17 Jul 2023 13:24:22 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
  by compute3.internal (MEProxy); Mon, 17 Jul 2023 13:24:23 -0400
X-ME-Sender: <xms:RXm1ZG1tVKd235OTAKjb7YgspTMPR-qImOZNagZiOwv_r996Wpl_EA>
    <xme:RXm1ZJGhtMeEyJx0NHmpmxK7orhG2xuLUV7eaWrGF_5mvemHNiGzAxoeoH8wHPKOx
    Be-_jfsguKQ7NGLhQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedvgdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhguhicunfhuthhomhhirhhskhhifdcuoehluhhtoheskhgvrhhnvghlrdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeduveffvdegvdefhfegjeejlefgtdffueekudfgkeduvdetvddu
    ieeluefgjeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhguhidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudduiedu
    keehieefvddqvdeifeduieeitdekqdhluhhtoheppehkvghrnhgvlhdrohhrgheslhhinh
    hugidrlhhuthhordhush
X-ME-Proxy: <xmx:RXm1ZO5oHfgOl5d-JsrWsEmT0wZ8c7lpn-wGY1Pk1MKOwuxnVn3prQ>
    <xmx:RXm1ZH3tFnXsbSmPTR9ONplP-mkjz9Tn9-KQt1DQXW36vSF4M5jnmA>
    <xmx:RXm1ZJEwoQUXW2HC-hvtBktlwQpPz6VjPtqSmOfmC010d9JGpLVfQw>
    <xmx:Rnm1ZFKtTGUhG1K7QB02N33IARC_1h22efMRZVMJvVFaIkzEJg1UPw>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D060531A0064; Mon, 17 Jul 2023 13:24:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <d305b437-9eef-42da-821e-67365aad520b@app.fastmail.com>
In-Reply-To: <CAPhsuW4pDkd7rCWRM6938ve36rfhGxyu=8t1-GjcKnNajofpQA@mail.gmail.com>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
 <20230625161417.GK52412@kernel.org> <ZJmFFmexl_1GUhIL@FVFF77S0Q05N>
 <CAPhsuW4pDkd7rCWRM6938ve36rfhGxyu=8t1-GjcKnNajofpQA@mail.gmail.com>
Date: Mon, 17 Jul 2023 10:23:56 -0700
From: "Andy Lutomirski" <luto@kernel.org>
To: "Song Liu" <song@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>
Cc: "Mike Rapoport" <rppt@kernel.org>, "Kees Cook" <keescook@chromium.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Helge Deller" <deller@gmx.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Kent Overstreet" <kent.overstreet@linux.dev>,
 "Luis Chamberlain" <mcgrof@kernel.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nadav Amit" <nadav.amit@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Puranjay Mohan" <puranjay12@gmail.com>,
 "Rick P Edgecombe" <rick.p.edgecombe@intel.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Will Deacon" <will@kernel.org>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, "the arch/x86 maintainers" <x86@kernel.org>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_102427_361667_8F208FB7 
X-CRM114-Status: GOOD (  17.37  )
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

CgpPbiBNb24sIEp1biAyNiwgMjAyMywgYXQgMTA6NDggQU0sIFNvbmcgTGl1IHdyb3RlOgo+IE9u
IE1vbiwgSnVuIDI2LCAyMDIzIGF0IDU6MzHigK9BTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFu
ZEBhcm0uY29tPiB3cm90ZToKPj4KPiBbLi4uXQo+PiA+Cj4+ID4gU28gdGhlIGlkZWEgd2FzIHRo
YXQgaml0X3RleHRfYWxsb2MoKSB3aWxsIGhhdmUgYSBjYWNoZSBvZiBsYXJnZSBwYWdlcwo+PiA+
IG1hcHBlZCBST1gsIHdpbGwgYWxsb2NhdGUgbWVtb3J5IGZyb20gdGhvc2UgY2FjaGVzIGFuZCB0
aGVyZSB3aWxsIGJlCj4+ID4gaml0X3VwZGF0ZSgpIHRoYXQgdXNlcyB0ZXh0IHBva2luZyBmb3Ig
d3JpdGluZyB0byB0aGF0IG1lbW9yeS4KPj4gPgo+PiA+IFVwb24gYWxsb2NhdGlvbiBvZiBhIGxh
cmdlIHBhZ2UgdG8gaW5jcmVhc2UgdGhlIGNhY2hlLCB0aGF0IGxhcmdlIHBhZ2Ugd2lsbAo+PiA+
IGJlICJpbnZhbGlkYXRlZCIgYnkgZmlsbGluZyBpdCB3aXRoIGJyZWFrcG9pbnQgaW5zdHJ1Y3Rp
b25zIChlLmcgaW50MyBvbgo+PiA+IHg4NikKPj4KPj4gRG9lcyB0aGF0IHdvcmsgb24geDg2Pwo+
Pgo+PiBUaGF0IGlzIGluIG5vIHdheSBnYXVyYW50ZWVkIGZvciBvdGhlciBhcmNoaXRlY3R1cmVz
OyBvbiBhcm02NCB5b3UgbmVlZAo+PiBleHBsaWNpdCBjYWNoZSBtYWludGVuYW5jZSAod2l0aCBJ
LWNhY2hlIG1haW50ZW5hbmNlIGF0IHRoZSBWQSB0byBiZSBleGVjdXRlZAo+PiBmcm9tKSBmb2xs
b3dlZCBieSBjb250ZXh0LXN5bmNocm9uaXphdGlvbi1ldmVudHMgKGUuZy4gdmlhIElTQiBpbnN0
cnVjdGlvbnMsIG9yCj4+IElQSXMpLgo+Cj4gSSBndWVzcyB3ZSBuZWVkOgo+IDEpIEludmFsaWRh
dGUgdW51c2VkIHBhcnQgb2YgdGhlIGh1Z2UgUk9YIHBhZ2VzOwo+IDIpIERvIG5vdCBwdXQgdHdv
IGppdCB1c2VycyAoaW5jbHVkaW5nIG1vZHVsZSB0ZXh0LCBicGYsIGV0Yy4pIGluIHRoZQo+IHNh
bWUgY2FjaGUgbGluZTsKPiAzKSBFeHBsaWNpdCBjYWNoZSBtYWludGVuYW5jZTsKPiA0KSBjb250
ZXh0LXN5bmNocm9uaXphdGlvbi1ldmVudHMuCj4KPiBXb3VsZCB0aGVzZSAob3IgYSBzdWJzZXQg
b2YgdGhlbSkgYmUgc3VmZmljaWVudCB0byBwcm90ZWN0IHVzIGZyb20gdG9ybiByZWFkPwoKTWF5
YmU/ICAjNCBpcyBzdWZmaWNpZW50bHkgdmFndWUgdGhhdCBJIGNhbid0IHJlYWxseSBpbnRlcnBy
ZXQgaXQuCgpJIGhhdmUgYSBoYWxmLWRyYWZ0ZWQgZW1haWwgYXNraW5nIGZvciBvZmZpY2lhbCBj
bGFyaWZpY2F0aW9uIG9uIHRoZSBydWxlcyB0aGF0IG1pZ2h0IGhlbHAgc2hlZCBsaWdodCBvbiB0
aGlzLiAgSSBmaW5kIHRoYXQgdGhpcyB0eXBlIG9mIHJlcXVlc3Qgd29ya3MgYmVzdCB3aGVuIGl0
J3MgcmVhbGx5IHdlbGwgd3JpdHRlbiA6KQoKPgo+IFRoYW5rcywKPiBTb25nCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
