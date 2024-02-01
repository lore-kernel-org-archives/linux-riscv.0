Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A132BC47DDF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 05:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72GtSCQ7aMffEkKJCuuuo+i8h424SfNPUpLQ18UspMY=; b=c2atPkMZPq4MyK
	f8aYYE2OSGouwdVOa7gCN2KMDCgyhaLkVQNcCk4QZJlKCS5zq/6w/TThfwdmJIJN0WDBrVZ9AFmlw
	EAiQuhrPjepM+hctu82HXPxghQi1Vm+B1W89QsBBXsxqa0uJmx6anbLx0SRGMeNwIfu+xd1mmjjIX
	eYangdNjNwDOYRl6cWUrjg41bHdKjyNG1IUul7ieylpXFKWgs4DpUBkzArmXIuoWaEcXnLoIin2g6
	jTiyMLK9RQK/chvi65VTECZpVopEZ5RAQElT5FCUu2xG0QHTLBemHaQXSvCoZPUYWoav4jPps3aPE
	kzqqYb+dtje5pFlv5qow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVQ0A-00000006gYg-1CLK;
	Thu, 01 Feb 2024 05:52:42 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVQ07-00000006gVS-03Bf
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 05:52:40 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 6154D5C00CD;
	Thu,  1 Feb 2024 00:52:32 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 01 Feb 2024 00:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1706766752;
	 x=1706853152; bh=zEgYM9ib8uGx7d/JTunm4wFeCd5N9eP8RpFnlN/mwpA=; b=
	eZ9y/iTIat4bvibXxHDOZNu8+z/foRAjW1+VrEi6mBJ0me+ew8hwvF7N0yvAZrB1
	uBVZ7wxx/MnXWORGF2Bvd/tIBNuM+15CaQLOAP6gP4+Qu7XxJo/cf+YWtQa8mX29
	nsaV8xWk6jZlqUz5R+vHNjzS6IbmCyxaPPu6fuY1tXzgchxnZJqX3D6JEwiZFATA
	R2qV9mo33w1D7TB1DtYIt+LPCOkUGx7iZ+dAWXJNjYVdqLEsahLFDCCiUs0tUR1W
	r84xxbG+OEVsP0FsrP68IqEIgfd0kfn4hLbe8a0waMaUF5XY/58bEGwhuOrfx/0y
	qpnMrff43l2O3faJa8UhYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706766752; x=
	1706853152; bh=zEgYM9ib8uGx7d/JTunm4wFeCd5N9eP8RpFnlN/mwpA=; b=a
	cM4PUYPSdqNYiCoOnCbyCcMPcJCaqjfk70ukJFUoi+P8EAwb4tn6fhn7s8pShigj
	yEug/zu/+8Ls4i4Fg5BOi60wbYh+y8Qgu76RjZCbBglrd+Jurt+TnCo6/8132io5
	IKQtROMxazV1ndOp1v670HoJgX9fR3TB6Fw9t/x0fsSoEg4VIZxlYgZgr2bVBvs8
	J8JLEDgSwPjNQIRQ6yUJELu5Do1iKEMd/BplhgRYwUFO4nsWVDgRAgM6hIHVsj/W
	Z9/WNwvpfG+Ram++QTG2eAtIkVDKozIObQKPK4/83xUBs7f01S6n/SJcJmcTm+dO
	oBWtSqVO0mzqw/OGY3K0Q==
X-ME-Sender: <xms:njG7ZW3gFFkAEClduSd1WA3yuVUi2pRf-kG1dAZ42lccSVmkoNMnAg>
    <xme:njG7ZZGY92FC9hk9ptv04xX9IhLOfxssTxcROt2rk2cchjCcDftz5MdnANR2Pe4aX
    BrD9o_y9T9THpdIsS4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedutddgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:njG7Ze6TioQfgIdzUhVynFTxGZNUYJ80nhGOc4H3Xry9oz_qyiXQBQ>
    <xmx:njG7ZX08NPgCi5esQhZfiJOQXJ9EIMkGM5io1nY5rkqE9tolAtfjjA>
    <xmx:njG7ZZHTFQLCCFJSF1P-Cqx31v8Ftxw63nzvu4LFfVD4zB6F80YHIg>
    <xmx:oDG7ZRgX3MDz0o7mz_-Hi4SELgNbYMUDEzt3Ijx_0hPL4gmIV_4yVg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BDCBAB60092; Thu,  1 Feb 2024 00:52:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <6abae3ef-fc91-4283-b6a3-20810ececfe8@app.fastmail.com>
In-Reply-To: <CAJve8okV_9qs6urESw2N-v8LT2-QP40jc1WhHYci7n-r9EoA9Q@mail.gmail.com>
References: <cover.1706603678.git.haibo1.xu@intel.com>
 <0be49d4d7d7e43933534aad6f72b35d3380519fd.1706603678.git.haibo1.xu@intel.com>
 <682f037e-0efe-4d73-b867-f1f86a244836@app.fastmail.com>
 <CAJve8okV_9qs6urESw2N-v8LT2-QP40jc1WhHYci7n-r9EoA9Q@mail.gmail.com>
Date: Thu, 01 Feb 2024 06:52:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Haibo Xu" <xiaobo55x@gmail.com>
Cc: "Haibo Xu" <haibo1.xu@intel.com>,
 "Alison Schofield" <alison.schofield@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "James Morse" <james.morse@arm.com>, linux-riscv@lists.infradead.org,
 "Ard Biesheuvel" <ardb@kernel.org>, "Baoquan He" <bhe@redhat.com>,
 acpica-devel@lists.linux.dev, "Robert Moore" <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, "Sami Tolvanen" <samitolvanen@google.com>,
 "Greentime Hu" <greentime.hu@sifive.com>, "Len Brown" <lenb@kernel.org>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Dan Williams" <dan.j.williams@intel.com>,
 "Chen Jiahao" <chenjiahao16@huawei.com>,
 "Yuntao Wang" <ytcoode@gmail.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>,
 "Anup Patel" <apatel@ventanamicro.com>,
 "Tony Luck" <tony.luck@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Evan Green" <evan@rivosinc.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Andrew Jones" <ajones@ventanamicro.com>
Subject: Re: [PATCH 4/4] ACPI: RISCV: Enable ACPI based NUMA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_215239_170042_06AA7982 
X-CRM114-Status: GOOD (  15.77  )
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

T24gVGh1LCBGZWIgMSwgMjAyNCwgYXQgMDM6NTgsIEhhaWJvIFh1IHdyb3RlOgo+IE9uIFdlZCwg
SmFuIDMxLCAyMDI0IGF0IDU6MzPigK9QTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3
cm90ZToKPj4KPj4gT24gV2VkLCBKYW4gMzEsIDIwMjQsIGF0IDAzOjMyLCBIYWlibyBYdSB3cm90
ZToKPj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL251bWEvS2NvbmZpZyBiL2RyaXZlcnMv
YWNwaS9udW1hL0tjb25maWcKPj4gPiBpbmRleCA4NDljMmJkODIwYjkuLjUyNTI5N2M0NDI1MCAx
MDA2NDQKPj4gPiAtLS0gYS9kcml2ZXJzL2FjcGkvbnVtYS9LY29uZmlnCj4+ID4gKysrIGIvZHJp
dmVycy9hY3BpL251bWEvS2NvbmZpZwo+PiA+IEBAIC0yLDcgKzIsNyBAQAo+PiA+ICBjb25maWcg
QUNQSV9OVU1BCj4+ID4gICAgICAgYm9vbCAiTlVNQSBzdXBwb3J0Igo+PiA+ICAgICAgIGRlcGVu
ZHMgb24gTlVNQQo+PiA+IC0gICAgIGRlcGVuZHMgb24gKFg4NiB8fCBBUk02NCB8fCBMT09OR0FS
Q0gpCj4+ID4gKyAgICAgZGVwZW5kcyBvbiAoWDg2IHx8IEFSTTY0IHx8IExPT05HQVJDSCB8fCBS
SVNDVikKPj4KPj4gVGhlIGRlcGVuZGVuY3kgaXMgbm8gbG9uZ2VyIG5lZWRlZCBub3cgc2luY2Ug
dGhlc2UgYXJlCj4+IHRoZSBmb3VyIGFyY2hpdGVjdHVyZXMgdGhhdCBzdXBwb3J0IEFDUEkgbm93
IHRoYXQgSUE2NAo+PiBpcyBnb25lLgo+Pgo+PiBBbGwgb2YgdGhlbSBhbHNvICdzZWxlY3QgQUNQ
SV9OVU1BJyBieSBkZWZhdWx0LCB0aG91Z2ggb24KPj4geDg2IHRoaXMgY2FuIHN0aWxsIGJlIGRp
c2FibGVkIGJ5IG1hbnVhbGx5IHR1cm5pbmcgb2ZmCj4+IENPTkZJR19YODZfNjRfQUNQSV9OVU1B
LiBJIHN1c3BlY3Qgd2UgZG9uJ3QgYWN0dWFsbHkgZXZlcgo+PiB3YW50IHRvIHR1cm4gaXQgb2Zm
IG9uIHg4NiBlaXRoZXIsIHNvIEkgZ3Vlc3MgdGhlIEtjb25maWcKPj4gb3B0aW9uIGNhbiBqdXN0
IGJlIHJlbW92ZWQgZW50aXJlbHkuCj4+Cj4KPiBHb29kIGNhdGNoISBXaWxsIHJldmVydCB0aGUg
Y2hhbmdlIGluIHRoZSBuZXh0IHZlcnNpb24uCj4KPiBUbyByZW1vdmUgdGhlIGRlcGVuZGVuY3kg
ZW50aXJlbHksIEkgdGhpbmsgd2UgbmVlZCBhIHNlcGFyYXRlIHBhdGNoIGZvciBpdC4KPiBXaGF0
J3MgeW91ciBvcGluaW9uPwoKQWdyZWVkLCB0aGF0IGxhc3QgYml0IHdvdWxkIG5lZWQgdG8gYmUg
YWNrZWQgYnkgdGhlIHg4NgptYWludGFpbmVycyB0aGVuLCBhcyBpdCBvbmx5IGFmZmVjdHMgdGhl
bSBpbiBwcmFjdGljZS4KCiAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
