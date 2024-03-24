Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA6C47DD9
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2024 22:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TS86UIZus7xgcnuv+20BEHCmpV9fQaRsH+9rtcpeqn4=; b=DQJ07C18rq1cgr
	MNy/l+kGVMoxrj1hrpj8Hwfl8RwtUBZbbhstmccYBqgEewkCus+O8rofd78P/c/TwaF/iw/L04bZF
	0xVuKDWKYYvkjne/+pmmCxdauaPkFb2gSGbDOACymsNzzk1XB1rUYLRFSIwyynROKd+ta6hXDsN5o
	8KyEVE8LR9M2m841daCEKLyZW4Gokj9E00VHPt7EAqL266IVCSox8UtEnSX2/85k/2sEB4WVAkjfV
	yksrOKBA4itD+J8kq/AeaL7iza+pix3Cd8GcIPQ3AoPSBUqKaiDEgnEekNTtOrcNUNK00wl/nvxHe
	fmvyLfb2FwJqtf8dMesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roVz1-0000000DYe8-0TP7;
	Sun, 24 Mar 2024 22:06:27 +0000
Received: from wfhigh1-smtp.messagingengine.com ([64.147.123.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roVyx-0000000DYd5-2B7d
	for linux-riscv@lists.infradead.org;
	Sun, 24 Mar 2024 22:06:25 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 6B2221800089;
	Sun, 24 Mar 2024 18:06:14 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Sun, 24 Mar 2024 18:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1711317973;
	 x=1711404373; bh=GRJdMDLcsCv605YDty6b0aLIc6c6sh50+KXqZZugJ/I=; b=
	ExwTFkCOFpIo38KY7iJTosSFyXZAOHlKjwtxVcy1uBg+lHq5z7viRERmRyORuZHc
	J7rfXpEJb7+tkkUhPScyQ5jBPF1C1yHaDIFmucrqsPkL6O3sW2sR+rQ/h7sKrVbl
	XcAa9z3ReV1LMAspEwmUFwGy8taTCtcwICz1s7MnUB1NZPJNsK/iWoG43iImsjh2
	Iz3D25ulblIYetZhPHIE2Q5Mnkb/iS1sg56twYE8i5a9148aB+LCtAIVUq10O8nr
	o1pyALAQlaToMrmVK/b3IgarpWhY8/F/Zoj9GLXWg/nuC8G8ZinXPEDNbhGy+BXb
	fVZDDqPmckEmwoqx3JrwMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711317973; x=
	1711404373; bh=GRJdMDLcsCv605YDty6b0aLIc6c6sh50+KXqZZugJ/I=; b=d
	3ta/uNLxM2d/dUh5PPLdRhACAzMKKtdvv8yUG0NX1RIPTovWNJSBu9myOqusORUG
	NaiyR50yKBMBMQKRi05keIU1vbbFDTVZ3Z+12esJyOQnIyQzvIQfvX7eEvLOEIYa
	PH3XMUICS43foQFAaVyfCo7O9gDBP9YsDneIqtTWDHrcuHiEfACea7pSWYg637/P
	Ia/hpR6WKRIMv3+U+ewhAE9VI7VZCGZ5+F4JZMAE+zSW85DjOQlh/kiw1eRFHE3x
	y+eR3dTJQyCcwSSTKxbDu2GBHGYGRdnXgrY1GI+4Q6estGI0aDUQUxdq2TULoNgI
	mSH/3AZAtoSzrvMv8eUGw==
X-ME-Sender: <xms:1KMAZtvCDd1cmAZ6YkyDkrtsg9fQrgNW-oIu-V0AfSdf-Eb_ffQrmQ>
    <xme:1KMAZmfVxk-ZxU0_YjW6Ar5Xq4HhO1eFlVmBe_0wmb-VZkgX1ZsX3XBxWMoBrxi0H
    Z3KZqdF66_0Uq1Smio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtjedgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepfffhvdejieelteeljeekgeegieevheelueehieehkeehgeekhfdtleek
    teevtefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:1KMAZgy_t59OkKPA6aDjPt0kZ-izfepHB2wJ0xjHi8H6yh_yvI1nAw>
    <xmx:1KMAZkOM1OIxnJa-LU_65bl7I4Eia0SerNrvx8mOeOIN8jTFPBfpIw>
    <xmx:1KMAZt-uiy68wNs75EB4nqbKLnmPoAJx43sgy7eUh1yGUNST5aFhdQ>
    <xmx:1KMAZkVrEGm1QXVnjDhaAqIkawvmm7MkMv0XUp1sQFN-dHYjcUubjA>
    <xmx:1aMAZigScsf2mFxkRIGxd95EHsuB_g64nRP0WLfBJUuCkU1Y2DNIbOi4IiU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 97D01B6008D; Sun, 24 Mar 2024 18:06:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-332-gdeb4194079-fm-20240319.002-gdeb41940
MIME-Version: 1.0
Message-Id: <b0a07878-a9f1-40aa-b177-423b05137d2e@app.fastmail.com>
In-Reply-To: <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
Date: Sun, 24 Mar 2024 23:05:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Ghiti" <alex@ghiti.fr>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Charlie Jenkins" <charlie@rivosinc.com>, guoren <guoren@kernel.org>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Kemeng Shi" <shikemeng@huaweicloud.com>,
 "Matthew Wilcox" <willy@infradead.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Xiao W Wang" <xiao.w.wang@intel.com>, "Yangyu Chen" <cyy@cyyself.name>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_150623_793473_0357E147 
X-CRM114-Status: GOOD (  18.36  )
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

T24gVHVlLCBNYXIgMTksIDIwMjQsIGF0IDE3OjUxLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4g
T24gMTgvMDMvMjAyNCAyMjoyOSwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+IE9uIDIwMjQtMDMt
MTggMzo1MCBQTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+Pj4gT24gV2VkLCBNYXIgMTMsIDIw
MjQgYXQgNzowMOKAr1BNIFNhbXVlbCBIb2xsYW5kCj4+IEl0IGxvb2tzIGxpa2UgdGhlIGNhbGwg
dG8gZml4dXBfZXhjZXB0aW9uKCkgW2FkZGVkCj4+IGluIDQxNjcyMWZmMDVmZCAoInJpc2N2LCBt
bTogUGVyZm9ybSBCUEYgZXhoYW5kbGVyIGZpeHVwIG9uIHBhZ2UgZmF1bHQiKV0gaXMKPj4gb25s
eSBpbnRlbmRlZCB0byBjYXRjaCBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2VzLiBTbyBtYWtpbmcg
dGhlIGNoYW5nZSB3b3VsZG4ndAo+PiBoYXZlIGFueSBmdW5jdGlvbmFsIGltcGFjdCwgYnV0IGl0
IHdvdWxkIHN0aWxsIGJlIGEgdmFsaWQgb3B0aW1pemF0aW9uLgo+Pgo+Pj4gT3IgSSB3YXMgd29u
ZGVyaW5nIGlmIGl0IHdvdWxkIG5vdCBiZSBiZXR0ZXIgdG8gZG8gbGlrZSB4ODYgYW5kIHVzZSBh
bgo+Pj4gYWx0ZXJuYXRpdmUsIGl0IHdvdWxkIGJlIG1vcmUgY29ycmVjdCAoZXZlbiB0aG91Z2gg
SSBiZWxpZXZlIHlvdXIKPj4+IHNvbHV0aW9uIHdvcmtzKQo+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYWdlXzY0
LmgjTDgyLgo+PiBXaGF0IHdvdWxkIGJlIHRoZSBiZW5lZml0IG9mIHVzaW5nIGFuIGFsdGVybmF0
aXZlPyBBbnkgYWNjZXNzIHRvIGFuIGFkZHJlc3MKPj4gYmV0d2VlbiBUQVNLX1NJWkUgYW5kIFRB
U0tfU0laRV9NQVggaXMgZ3VhcmFudGVlZCB0byBnZW5lcmF0ZSBhIHBhZ2UgZmF1bHQsIHNvCj4+
IHRoZSBvbmx5IGJlbmVmaXQgSSBzZWUgaXMgcmV0dXJuaW5nIC1FRkFVTFQgc2xpZ2h0bHkgZmFz
dGVyIGF0IHRoZSBjb3N0IG9mCj4+IGFwcGx5aW5nIGEgZmV3IGh1bmRyZWQgYWx0ZXJuYXRpdmVz
IGF0IGJvb3QuIEJ1dCBpdCdzIHBvc3NpYmxlIEknbSBtaXNzaW5nCj4+IHNvbWV0aGluZy4KPgo+
Cj4gVGhlIHVzZSBvZiBhbHRlcm5hdGl2ZXMgYWxsb3dzIHRvIHJldHVybiByaWdodCBhd2F5IGlm
IHRoZSBidWZmZXIgaXMgCj4gYmV5b25kIHRoZSB1c2FibGUgdXNlciBhZGRyZXNzIHNwYWNlLCBh
bmQgaXQncyBub3QganVzdCAic2xpZ2h0bHkgCj4gZmFzdGVyIiBmb3Igc29tZSBjYXNlcyAoYSB2
ZXJ5IGxhcmdlIGJ1ZmZlciB3aXRoIG9ubHkgYSBmZXcgYnl0ZXMgYmVpbmcgCj4gYmV5b25kIHRo
ZSBsaW1pdCBvciBzb21lb25lIGNvdWxkIGZhdWx0LWluIGFsbCB0aGUgdXNlciBwYWdlcyBhbmQg
ZmFpbCAKPiB2ZXJ5IGxhdGUuLi5ldGMpLiBhY2Nlc3Nfb2soKSBpcyBoZXJlIHRvIGd1YXJhbnRl
ZSB0aGF0IHN1Y2ggc2l0dWF0aW9ucyAKPiBkb24ndCBoYXBwZW4sIHNvIGFjdHVhbGx5IGl0IG1h
a2VzIG1vcmUgc2Vuc2UgdG8gdXNlIGFuIGFsdGVybmF0aXZlIHRvIAo+IGF2b2lkIHRoYXQuCgpU
aGUgYWNjZXNzX29rKCkgZnVuY3Rpb24gcmVhbGx5IHdhbnRzIGEgY29tcGlsZS10aW1lIGNvbnN0
YW50CnZhbHVlIGZvciBUQVNLX1NJWkVfTUFYIHNvIGl0IGNhbiBkbyBjb25zdGFudCBmb2xkaW5n
IGZvcgpyZXBlYXRlZCBjYWxscyBpbnNpZGUgb2Ygb25lIGZ1bmN0aW9uLCBzbyBmb3IgY29uZmln
dXJhdGlvbnMKd2l0aCBhIGJvb3QtdGltZSBzZWxlY3RlZCBUQVNLX1NJWkVfNjQgaXQncyBhbHJl
YWR5IG5vdCBpZGVhbCwKd2l0aCBvciB3aXRob3V0IGFsdGVybmF0aXZlcy4KCklmIEkgcmVhZCB0
aGUgY3VycmVudCBjb2RlIGNvcnJlY3RseSwgcmlzY3YgZG9lc24ndCBldmVuCmhhdmUgYSB3YXkg
dG8gYnVpbGQgd2l0aCBhIGNvbXBpbGUtdGltZSBzZWxlY3RlZApWQV9CSVRTL1BHRElSX1NJWkUs
IHdoaWNoIGlzIHByb2JhYmx5IGEgYmV0dGVyIHBsYWNlIHRvCnN0YXJ0IG9wdGltaXppbmcsIHNp
bmNlIHRoaXMgcmFyZWx5IG5lZWRzIHRvIGJlIHNlbGVjdGVkCmR5bmFtaWNhbGx5LgoKICAgICAg
QXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
