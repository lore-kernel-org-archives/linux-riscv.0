Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9827CC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/jLioMJoMcTxDsRCCxsTPep1lsY++vwhgSHUvY2iXA=; b=XmEbC1G2yVBYUu
	Yf3WuttDAPclxK7FNTRXQZJ54I5bUugw38unQghSpuf6jS/WidE/vOsR7t7Zq34CFHx+giCVmaKAe
	GhTgTM6Ep9/H85EZHrVYin9PsyEPGdXof5LZQgyDmExIS1zeeb5ib3ZmOI8Yst5cP+Pk+akOYUYSR
	Q9jUHkCyUq3Rx0ze75QjqlWnFpg+B/D11k799jLRnU7Uh9aaF4KyPoiSlbIhgU6unLw/h4n+h9iFw
	wTkMnoU1kY/XQZpVuUg0u6dlf8O0bKAU+OkovSF8eCr9KdqkUc4FNeTIRb/Q8/rPtrUEexZvhu/2E
	RmCTZuQh9JnXhjO712lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9y7-00000003q6R-3ihS;
	Thu, 07 Mar 2024 09:23:15 +0000
Received: from wfhigh5-smtp.messagingengine.com ([64.147.123.156])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri9y4-00000003q4T-3Wg8
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 09:23:14 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id BBC131800074;
	Thu,  7 Mar 2024 04:23:08 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 07 Mar 2024 04:23:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1709803388;
	 x=1709889788; bh=b8dqhcTxKZ9VbDJ6yCA8cOVtdng1Ns/2TjCpfA+5TMA=; b=
	eEcZYZ3oQRvDwwFDQzbCXrNyw3JXGZlhgCXdOB0znCNsJKasmf2Ok0narPXtnvxa
	VBxxLIFOtjiPP5/i5vSp7IyNA1AQdyzD8eLqQ1Ff9SvA4WC94Z4vrieeW/3D/b5b
	59Log8gln+y557JIDFz4RmHgEEp/HTlJZtQOd+uca01XmgjZ2TYU+xZLDTkP+LAC
	PN7dwRyWZIfhQVT6X75LvphDyniIdw0+LJtHzRkpSUkhfinyN/iZmWevEW+gMNjv
	g8WbTxwli1Wk6tKfGWminNfa7Tsvy9MuQ9X+fgL3KJDA06F02x8r0Wbb3BkhSYp0
	lcNYdn1EyvEHKeR6S7cyMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709803388; x=
	1709889788; bh=b8dqhcTxKZ9VbDJ6yCA8cOVtdng1Ns/2TjCpfA+5TMA=; b=F
	RvFEZ0xF59wCqKc+3rY/C1wQub3zs5gS9qGyW0X8O0y8SEowD5h7zYBNUeATNvHS
	yOu1mJg1cIJor2v/mYi700DuRz3y6bBUOD/8Hdyhb3MA+cS71GZGDc+gmSVGAxIm
	6Ipy8ddG2KwMVFuvx7g52I9Fx99bPojfIskustnnKHtDeu3UWe7pWINc49MwE3xk
	lol9nUmVpOm6UTtbDKL1jW9vhLXiAIXgnehFi8pe/DabFhPxImmmS3byLO2Fr0H0
	hqemK0o4EAJwEM37sZzFih6DWJkM9DAmJbVmQe4OsYlVwy/EfE3TMRnb8LwtlLCO
	QrSZJRl5wru1BhtgDKckg==
X-ME-Sender: <xms:e4fpZXcvNxkKTJenlqbtXXyXS-rJosiAa_nj0Nh7fvnlgGhVXVcHCw>
    <xme:e4fpZdM7zoxOOx6z37xZflQsqFmIMhovCFfc34UIiz9rEJLw5AM8o6jqAFbbPp_Pc
    JnKWI002GpD-Ps32mE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieefgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:e4fpZQhjc1WoowlWg9_Ml5V5esr4KWpAhIqrigyKu81UuMf0qNJfYA>
    <xmx:e4fpZY_GXY35KwaoPB8nXvxbq0tPI4tM6gqGj5uKehRUMdZHtJAeOw>
    <xmx:e4fpZTvJabv0y2jewleUSMJMY9hTydj4p2n2hBuwtTd_wnO7B3KoRA>
    <xmx:fIfpZWj-p7ESsHu5dwSilyZkE19s0tcj4dR2q5CcAMHb1JeEdS7f73WcdYY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7637FB6008D; Thu,  7 Mar 2024 04:23:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
MIME-Version: 1.0
Message-Id: <460338ee-c8d5-4f43-9bab-4c35e417e4ad@app.fastmail.com>
In-Reply-To: <CAJve8o=BsR1SG0k_7mb61Jj1fb+9rc4V9Y=MMX004fpAWE4vjg@mail.gmail.com>
References: <cover.1709780590.git.haibo1.xu@intel.com>
 <f23da383a8fdbee15acd41fdcd38ef3a89045a43.1709780590.git.haibo1.xu@intel.com>
 <c9e9da9f-ff81-48eb-beec-4f54921cd268@app.fastmail.com>
 <CAJve8o=BsR1SG0k_7mb61Jj1fb+9rc4V9Y=MMX004fpAWE4vjg@mail.gmail.com>
Date: Thu, 07 Mar 2024 10:22:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Haibo Xu" <xiaobo55x@gmail.com>
Cc: "Haibo Xu" <haibo1.xu@intel.com>,
 "Alison Schofield" <alison.schofield@intel.com>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>,
 "Zong Li" <zong.li@sifive.com>, "James Morse" <james.morse@arm.com>,
 linux-riscv@lists.infradead.org, "Ard Biesheuvel" <ardb@kernel.org>,
 "Baoquan He" <bhe@redhat.com>, acpica-devel@lists.linux.dev,
 "Robert Moore" <robert.moore@intel.com>, linux-acpi@vger.kernel.org,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Greentime Hu" <greentime.hu@sifive.com>,
 "Dan Williams" <dan.j.williams@intel.com>, "Len Brown" <lenb@kernel.org>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Charlie Jenkins" <charlie@rivosinc.com>,
 "Chen Jiahao" <chenjiahao16@huawei.com>,
 "Yuntao Wang" <ytcoode@gmail.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>,
 "Anup Patel" <apatel@ventanamicro.com>,
 "Tony Luck" <tony.luck@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Evan Green" <evan@rivosinc.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Andrew Jones" <ajones@ventanamicro.com>
Subject: Re: [PATCH v2 5/6] ACPI: NUMA: Remove ARCH depends option in ACPI_NUMA Kconfig
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_012312_931007_B09D986F 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBNYXIgNywgMjAyNCwgYXQgMTA6MTksIEhhaWJvIFh1IHdyb3RlOgo+IE9uIFRodSwg
TWFyIDcsIDIwMjQgYXQgNDo0NOKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdy
b3RlOgo+PiBPbiBUaHUsIE1hciA3LCAyMDI0LCBhdCAwOTo0NywgSGFpYm8gWHUgd3JvdGU6Cgo+
PiBJZiB3ZSBtYWtlIGl0Cj4+Cj4+ICAgICAgIGRlZl9ib29sIE5VTUEgJiYgIVg4Ngo+Pgo+PiB0
aGVuIHRoZSBzZWxlY3Qgc3RhdGVtZW50cyBleGNlcHQgZm9yIHRoZSBYODZfNjRfQUNQSV9OVU1B
Cj4+IGNhbiBhbHNvIGdvIGF3YXkuCj4+Cj4KPiBHb29kIGlkZWEhCj4gU2hhbGwgd2UgaW5jbHVk
ZSB0aGUgQUNQSSBpbiB0aGUgZGVmX2Jvb2wgZGVmaW5pdGlvbj8KPgoKTm8gbmVlZCwgYmVjYXVz
ZSB0aGlzIGlzIGluc2lkZSBvZiBhbiAnaWYgQUNQSScgYmxvY2suCgogICAgICAgQXJuZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
