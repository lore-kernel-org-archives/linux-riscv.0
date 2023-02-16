Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DEEC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 13:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9x0OScep5NpzLep3vCQEXXVgh5lAPHCfnkn43Nw6J/M=; b=Clkn8COh33YSz3
	o2eeKaVfPHStukpmjPbU9lafHuwEbG1gtvVT8W0k6HhJSEqkrLC9BNVwT5TaPx8+0SVn1wfU+bTjj
	W4u19FqGXsLWcHI7Hk5cSRozYyX3INb5qTJE2kYzb23GsZtOUOWS4IRnsyaWWNH3XsGOH/33yvE/X
	0nc7w2yWZ8k48lqV9tL4iYxjGHYTC/YMpncv3PCnv9YHodnxD3cFKyqSwyHdugcvzihVi220wygby
	+B1dHrNckOJHbzhciiFbmeqNOZZFUAqHtX4ocQ+igkoDEKmhOxOpvaSlRrZvP7IQhkRARgEa+Tu7V
	IUpys2PggQWyPFZrvQWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeKu-00ALC7-NJ; Thu, 16 Feb 2023 13:30:08 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeKr-00ALAh-Lj
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 13:30:07 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 227DE5C00E8;
	Thu, 16 Feb 2023 08:30:03 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 16 Feb 2023 08:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1676554203; x=
	1676640603; bh=VCwTn+DX7FOgrcyFSBKKl8KsdUvf32MRmMRF7YLkRhM=; b=B
	sZH3c3ea5agVWQzOugGWGW7D5w0wFVgE6VuNx4xeJUYYqRfp877LWS2FekXXo6+a
	lJFdAHXAr5jgbITO8SSbgtkTPvlb8PlDKUmltrRc53w0DtU1ku3NFmbJNH/E39uP
	wvU/y6vw/1eq/hDtv1RuH6gr1meC+YVFPkRb5LUZ2fDobS6viyOiLVojZLIkSnMm
	caLZ0JE5mHnKyKrTRiu1/0iQjuNUmgiGUkGiBfH7dRLpAdzHzubX6jQF00w6AqMi
	u8H2R47OgRBSCFK+QQiJ85CDpHNNBYhLqPR7DWqHJE/Zw2BgOfSNazWNbC/u1nEI
	VwEwIJFCbr2cOp9PI01Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676554203; x=
	1676640603; bh=VCwTn+DX7FOgrcyFSBKKl8KsdUvf32MRmMRF7YLkRhM=; b=Q
	6FGDKyxwrrW6LXonsCMsPD2K25PFqayi8xC0nLhaS+N3k2vUoJRZx3vLiqlNglVk
	1H1LN8vu9EbFuEn8IDC4eIShG1TXmsU/hJJNU8rymWq+OqQHytiX70+ijt0lSzdC
	ULm0e0B180iREwMOmLC1smbGsJMUY+QfwfLM1td1ggIHp4vNb2oxnEHWcmStp6mw
	FNRtZVAgdzxaYu+LGk237T+s+b82CSmALGrZ/mOfQPEfDCpahq+cnxSOK5v1sfQh
	/iOlpNIGblX1YBo8A0qj1JefjNIlfzoGERBbaGzjdW+U2goTnrLe5Bkb1qy1x5Jk
	6E56DR369x/aCU7h5HFzQ==
X-ME-Sender: <xms:2i_uY2bv-usC1z81ka94KEVxFAEV49Xxj77dVYlxA4lITAKT81BYWw>
    <xme:2i_uY5au61qE4B5P_xJTLCuxSdLybijeeiamQGycBYM2BHFDSnsrnBktBGAEVfWSm
    PLtzULCfwxf_Eu-VpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:2i_uYw9y3HKMjHJMEVvbeMsN8wR1ZgSuy_p7I-fIxiikYWgNC5hOSg>
    <xmx:2i_uY4p2DWN1_lgH-argnXHwdGYTdjldRPSD8ZOBch7RFa8jbJb3SA>
    <xmx:2i_uYxo5t3Sy3Ek5-MAyb5kVaaonaFFLjmlRDfbf4LRwOM-4NnYx4A>
    <xmx:2y_uY46hCTyh8A9QQPc9k8r4-YFgSVoEfyyC46PO2X8rwg_sHGXKjg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 454F5B60086; Thu, 16 Feb 2023 08:30:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <ed5133d1-5592-4367-8919-4416be506455@app.fastmail.com>
In-Reply-To: <6FA7F803-1B4A-418E-9368-E205F3A6CF27@jrtc27.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com>
 <ded4018d-c90f-41c7-9e54-da954bdef49e@app.fastmail.com>
 <CALs-HsuwOqR+y-GriKOiRx068bgOv3qTOpsJTaA02htiiynWmw@mail.gmail.com>
 <6FA7F803-1B4A-418E-9368-E205F3A6CF27@jrtc27.com>
Date: Thu, 16 Feb 2023 14:28:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jessica Clarke" <jrtc27@jrtc27.com>, "Evan Green" <evan@rivosinc.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-doc@vger.kernel.org, "Andrew Bresticker" <abrestic@rivosinc.com>,
 "Atish Patra" <atishp@rivosinc.com>, "Palmer Dabbelt" <palmer@rivosinc.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Celeste Liu" <coelacanthus@outlook.com>, slewis@rivosinc.com,
 "Bagas Sanjaya" <bagasdotme@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Tobias Klauser" <tklauser@distanz.ch>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Vineet Gupta" <vineetg@rivosinc.com>,
 "Dao Lu" <daolu@rivosinc.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Ruizhe Pan" <c141028@gmail.com>, "Anup Patel" <apatel@ventanamicro.com>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Conor Dooley" <conor@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 guoren <guoren@kernel.org>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_053005_995086_93ACC0E1 
X-CRM114-Status: GOOD (  16.88  )
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

T24gV2VkLCBGZWIgMTUsIDIwMjMsIGF0IDIzOjQzLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiBP
biAxNSBGZWIgMjAyMywgYXQgMjE6MTQsIEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPiB3
cm90ZToKPj4gT24gV2VkLCBGZWIgMTUsIDIwMjMgYXQgMTo1NyBBTSBBcm5kIEJlcmdtYW5uIDxh
cm5kQGFybmRiLmRlPiB3cm90ZToKPj4gUGFsbWVyIGNhbiBwcm9iYWJseSBzcGVhayB0byB0aGlz
IHdpdGggbW9yZSBhdXRob3JpdHksIGJ1dCBteQo+PiB1bmRlcnN0YW5kaW5nIGFib3V0IHRoZSBt
b3RpdmF0aW9uIGZvciBhbiBhcHByb2FjaCBsaWtlIHRoaXMgZ29lcwo+PiBzb21ldGhpbmcgbGlr
ZToKPj4gKiBXaXRoIHRoZSBuYXR1cmUgb2YgUklTQy1WLCB3ZSBleHBlY3QgYSBsb3Qgb2YgdGhl
c2UgdHlwZXMgb2YgYml0cwo+PiBhbmQgYm9icywgbWFueSBtb3JlIHRoYW4gd2UndmUgc2VlbiB3
aXRoIHRoZSBsaWtlcyBvZiB4ODYgYW5kIEFSTS4KPgo+IFdl4oCZcmUgYWxyZWFkeSBhdCAoSSB0
aGluaykgNTEgc3RhbmRhcmQgdXNlci1sZXZlbCBleHRlbnNpb25zIHRoYXQgTExWTQo+IGtub3dz
IGFib3V0LgoKRG8geW91IGhhdmUgYW4gZXN0aW1hdGUgb2YgaG93IG1hbnkgb2YgdGhlc2UgcmVx
dWlyZSBrZXJuZWwgc3VwcG9ydApiZXlvbmQgaWRlbnRpZnlpbmcgdGhlIGV4dGVuc2lvbnM/Cgo+
PiAqIFdlIGFsc28gZXhwZWN0IGluIHNvbWUgY2FzZXMgdGhlc2UgdmFsdWVzIHRvIGJlIGluY29u
c2lzdGVudCBhY3Jvc3MgQ1BVcy4KPgo+IFRoYXTigJlzIGFsc28gdHJ1ZSBvZiBzb21lIEFybSBT
b0NzLgoKUmlnaHQsIGJ1dCBpdCdzIGFsc28gc29tZXRoaW5nIHRoYXQgd2Ugc2hvdWxkIG5vdCBl
bmNvdXJhZ2UsIG9yCm5lZWQgdG8gbWFrZSBlYXN5IHRvIHVzZS4gT24gYXJtNjQsIHRoZSBrZXJu
ZWwgc3VwcG9ydCBmb3IgaGF2aW5nCmFzeW1tZXRyaWMgYWFyY2gzMiBtb2RlIHdhcyBrZXB0IHRv
IGFuIGFic29sdXRlIG1pbmltdW0sIGFuZCBhbgphcHBsaWNhdGlvbiBpcyBleHBlY3RlZCB0byBn
ZXQgdGhlIGluZm9ybWF0aW9uIGZyb20gL3Byb2MvY3B1aW5mbwpiZWZvcmUgcGlubmluZyBkb3du
IGEgdGFzayB0byB0aGUgY29ycmVjdCBzdWJzZXQgb2YgYWxsIENQVXMuCgo+PiAqIFNvLCBhIHN5
c2NhbGwgd2l0aCBhIHZEU08gZnVuY3Rpb24gaW4gZnJvbnQgb2YgaXQgc2VlbWVkIGxpa2UgYQo+
PiBnb29kIGNvbWJpbmF0aW9uIG9mIHNwZWVkIGFuZCBmbGV4aWJpbGl0eS4KPj4gCj4+IFlvdSdy
ZSBjZXJ0YWlubHkgcmlnaHQgdGhhdCBIV0NBUG4gd291bGQgd29yayBmb3Igd2hhdCB3ZSdyZSBl
eHBvc2luZwo+PiB0b2RheSwgc28gdGhlIHF1ZXN0aW9uIHByb2JhYmx5IGNvbWVzIGRvd24gdG8g
b3VyIHJlbGF0aXZlIHByZWRpY3Rpb25zCj4+IG9mIGhvdyB0aGlzIGRhdGEgd2lsbCBncm93Lgo+
Cj4gVGhlIG90aGVyIGJpZyBwcm9ibGVtIGlzIHZlbmRvciBleHRlbnNpb25zLgoKTXkgYmlnZ2Vz
dCBjb25jZXJuIGlzIGhvdyB0aGlzIHdvdWxkIGJlIHN5bmNocm9uaXplZCBiZXR3ZWVuIHRoZQpp
bnRlcmZhY2VzIHRoYXQgYXJlIGF2YWlsYWJsZSB0byB1c2Vycy4gV2hhdCB3ZSBoYXZlIG9uIG90
aGVyIGFyY2hpdGVjdHVyZXMKaXMgYSBzZXQgb2Ygc3RyaW5nIGlkZW50aWZpZXJzIGluIC9wcm9j
L2NwdWluZm8gYW5kIGEgYml0bWFzayBpbiBIV0NBUC4KSWRlYWxseSB0aGVzZSBhcmUgYWRkZWQg
aW4gcGFpcnMgc28gdGhlIGluZm9ybWF0aW9uIGF2YWlsYWJsZSB0byBzaGVsbApzY3JpcHRzIGlu
IGh1bWFuIHJlYWRlcnMgaXMgdGhlIHNhbWUgdGhhdCBpcyBhdmFpbGFibGUgaW4gdGhlIGF1eHZl
YwpkYXRhLgoKQWRkaW5nIGEgdGhpcmQgaW50ZXJmYWNlIHdpdGggdGhlIHNhbWUgaW5mb3JtYXRp
b24gb3IgYSBzdXBlcnNldApyZXF1aXJlcyBtb3JlIHdvcmsgaW4gZW5zdXJpbmcgdGhhdCBlYWNo
IGV4dGVuc2lvbiBpcyBhdmFpbGFibGUKaW4gZXhhY3RseSB0aGUgcmlnaHQgcGxhY2VzLiBJZGVh
bGx5IEkgdGhpbmsgdGhlcmUgc2hvdWxkIGJlIG9ubHkKb25lIHRhYmxlIG9mIHBvc3NpYmxlIENQ
VSBmZWF0dXJlcyBzbyBub2JvZHkgaGFzIHRvIG1ha2UgdGhlCmRlY2lzaW9uIGFib3V0IHdoaWNo
IG9uZXMgYXJlIGltcG9ydGFudCBlbm91Z2ggdG8gYWRkIHRvIG9uZQppbnRlcmZhY2Ugb3IgYW5v
dGhlci4KCiAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
