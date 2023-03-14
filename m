Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317BAC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ScOSb2DJvXXKh6J6+hAc3mhtYbgNf6Mx7UMchMWUxI=; b=hQFpj0LqMaSODq
	S6iON/8AsX8yi2kCkEm03mE3pEtVcAujPi8aWLrYTCB9/kJjNgevZoCYES31A+yxXX9MX3YT23cJl
	Z99Qu7OF3ugmuh5mnZi5tNn9F7MloQ9L859xcH3BdZtmoIh9fbLpcvDFW+8wYbuRASCxX2uOSrQR4
	7S5xtRHXV042g6m/mwj12k/n/Uh0X76o2OdayIql64QhOEHCRDr6e5f1TxjBTR+OEPBC9xf/5l3oj
	H4XRit3Ml6vAUju/JQ3djR/CIYh63a7f4UxYQNmu+sfHLprURLK9T75oLm/SUCryaxvpiQbIsgBC/
	5jhpo9Sh9qsIBHdR4LvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5IH-00AOui-01;
	Tue, 14 Mar 2023 14:06:25 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5ID-00AOrS-2F
	for linux-riscv@lists.infradead.org;
	Tue, 14 Mar 2023 14:06:23 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 66EE23200915;
	Tue, 14 Mar 2023 10:06:11 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 14 Mar 2023 10:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678802771; x=1678889171; bh=PdfK+KgXqfYYyNRjIkKag7bPoiI2QGHeotH
	fnMzy5uI=; b=lRjz8gAgTrnap6Tbsvg1QVgqc6mc+U8iR/rghiWBlGt/3PSldo2
	3ql0zJOXGWB2/0ZN0eEx1f4AP/dNiI3z3A++CfYn8kwNS4ymO+mr8aV6DeVLUpTS
	445AvFcrlT+6uy86y1LzK3YOI8xWXRuAkZ4V0UB8KNbBgkpTl7ETQ+uX8ar0AKHJ
	fwcVOMblHvKo1Htob+9okttczpE2sU94IbGqQ7kmN4rRK+ulGKtmrAull99iGETA
	PJcAbnygwCwMjm2836O3HtmBhTpVkesIARFkuCPRpX57fBCSxIcSWdrSuEv+MMBC
	HiYsOJ9svTIaYKvh7EuJLN0KAmjfP+Fcl9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1678802771; x=1678889171; bh=PdfK+KgXqfYYyNRjIkKag7bPoiI2QGHeotH
	fnMzy5uI=; b=teK+0BSFRYPnnWLZwAeeKsUTiOEAx1eqXoC0ysADEH9WTuH2KBf
	GiYQN6UJLPyxoeMlKYLyEucj3rDazxlXMV4bBmPoQBfj7pyLJuxz7g08lwcIafIA
	tZyk1ACiXmaCEXgUDpKsNtkT4lU1isMv4WP69/BrK7VNHqUHWPaYzzNaLxcAKbuZ
	2koPei5dWjJ79aOL7rCUhBvbqYVmzDEkVyxnh2EzwZp7xjZwoGdRMzXAhyRXfEqE
	ZL8u74wvvq6lujkAMU9U1nY4kM8IDBnizVwZECeIEZBO4P8Dlyv1NmkR+7MkRgO4
	a72UqmHTz2q/jN36pvUp05p4V882tH0rilw==
X-ME-Sender: <xms:Un8QZIkjSHHLJpVH5Zp66upFpggui2u4cvFIloxFbiduiQD_1zOHSA>
    <xme:Un8QZH1T5uPhAVcwLGNXS7kzuaX_pxK4AqoAdZyf4ZkFrdEMldlosU60fF24IVnej
    Fu2dwI4pheeUy7FaSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddviedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Un8QZGoysEz2YYLAuFxIn3qw_uL8BE9ISoqiu09qN1ur0bDRTVU96g>
    <xmx:Un8QZEkf7J6Kga513TZD4j7g_Sxp-UpTacfl_UZun_wygq3wqGByHQ>
    <xmx:Un8QZG2sNDBg_IUTM2oRGjnHoBZHMPRWbE14qlI8f6uIHoCx2nGpwQ>
    <xmx:U38QZAM8V-fIt2la_6MojocqWRthSshF5NQ8bZQTAyvWB3JfEIKVRg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2464CB60086; Tue, 14 Mar 2023 10:06:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <7ec48487-8565-4a1d-963b-5092eb5f4d15@app.fastmail.com>
In-Reply-To: <20230314121216.413434-1-schnelle@linux.ibm.com>
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
Date: Tue, 14 Mar 2023 15:05:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Richard Cochran" <richardcochran@gmail.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Alan Stern" <stern@rowland.harvard.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-pci@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 00/38] Kconfig: Introduce HAS_IOPORT config option
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_070621_766457_A66CBE1C 
X-CRM114-Status: GOOD (  19.07  )
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

T24gVHVlLCBNYXIgMTQsIDIwMjMsIGF0IDEzOjExLCBOaWtsYXMgU2NobmVsbGUgd3JvdGU6Cj4g
SGVsbG8gS2VybmVsIEhhY2tlcnMsCj4KPiBTb21lIHBsYXRmb3JtcyBzdWNoIGFzIHMzOTAgZG8g
bm90IHN1cHBvcnQgUENJIEkvTyBzcGFjZXMuIE9uIHN1Y2ggcGxhdGZvcm1zCj4gSS9PIHNwYWNl
IGFjY2Vzc29ycyBsaWtlIGluYigpL291dGIoKSBhcmUgc3R1YnMgdGhhdCBjYW4gbmV2ZXIgYWN0
dWFsbHkgd29yay4KPiBUaGUgd2F5IHRoZXNlIHN0dWJzIGFyZSBpbXBsZW1lbnRlZCBpbiBhc20t
Z2VuZXJpYy9pby5oIGxlYWRzIHRvIGNvbXBpbGVyCj4gd2FybmluZ3MgYmVjYXVzZSBhbnkgdXNl
IHdpbGwgYmUgYSBOVUxMIHBvaW50ZXIgYWNjZXNzIG9uIHRoZXNlIHBsYXRmb3Jtcy4gSW4KPiBh
IHByZXZpb3VzIHBhdGNoIHdlIHRyaWVkIGhhbmRsaW5nIHRoaXMgd2l0aCBhIHJ1bi10aW1lIHdh
cm5pbmcgb24gYWNjZXNzLiBUaGlzCj4gYXBwcm9hY2ggaG93ZXZlciB3YXMgcmVqZWN0ZWQgYnkg
TGludXNbMF0gd2l0aCB0aGUgYXJndW1lbnQgdGhhdCB0aGlzIHJlYWxseQo+IHNob3VsZCBiZSBh
IGNvbXBpbGUtdGltZSBjaGVjayBhbmQsIHRob3VnaCBhIG11Y2ggbW9yZSBpbnZhc2l2ZSBjaGFu
Z2UsIHdlCj4gYmVsaWV2ZSB0aGF0IGlzIGluZGVlZCB0aGUgcmlnaHQgYXBwcm9hY2guCj4KPiBU
aGlzIHBhdGNoIHNlcmllcyBhaW1zIHRvIGRvIGV4YWN0bHkgdGhhdCBieSBpbnRyb2R1Y2luZyBh
IEhBU19JT1BPUlQgY29uZmlnCj4gb3B0aW9uIGFraW4gdG8gdGhlIGV4aXN0aW5nIEhBU19JT01F
TS4gV2hlbiB0aGlzIGlzIHVuc2V0IGluYigpL291dGIoKSBhbmQKPiBmcmllbmRzIG1heSBub3Qg
YmUgZGVmaW5lZC4gVGhpcyBpcyBhbHNvIHRoZSBzYW1lIGFwcHJvYWNoIG9yaWdpbmFsbHkgcGxh
bm5lZCBieQo+IFV3ZSBLbGVpbmUtS8O2bmlnIGFzIG1lbnRpb25lZCBpbiBjb21taXQgY2U4MTZm
YTg4Y2NhICgiS2NvbmZpZzogcmVuYW1lCj4gSEFTX0lPUE9SVCB0byBIQVNfSU9QT1JUX01BUCIp
Lgo+Cj4gVGhpcyBzZXJpZXMgYnVpbGRzIGhlYXZpbHkgb24gYW4gb3JpZ2luYWwgcGF0Y2ggZm9y
IGRlbW9uc3RhdGluZyB0aGUgY29uY2VwdCBieQo+IEFybmQgQmVyZ21hbm5bMV0gYW5kIGluY29w
b3JhdGVzIGZlZWRiYWNrIG9mIHByZXZpb3VzIFJGQyB2ZXJzaW9ucyBbMl0gYW5kIFszXS4KPgo+
IFRoaXMgdmVyc2lvbiBpcyBiYXNlZCBvbiB2Ni4zLXJjMSBhbmQgaXMgYWxzbyBhdmFpbGFibGUg
b24gbXkga2VybmVsLm9yZyB0cmVlCj4gaW4gdGhlIGhhc19pb3BvcnRfdjMgYnJhbmNoIHdpdGgg
dGhlIFBHUCBzaWduZWQgdGFnIGhhc19pb3BvcnRfdjNfc2lnbmVkOgo+Cj4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmlrcy9saW51eC5naXQKClRoYW5r
cyBhIGxvdCBmb3IgdGhlIHJlYmFzZSwgaG9wZWZ1bGx5IHdlIGNhbiBmaW5hbGx5IGdldCB0aGlz
IG1lcmdlZC4KSSdsbCBnbyB0aHJvdWdoIGFsbCBwYXRjaGVzIGFuZCBub3RlIGV2ZXJ5dGhpbmcg
SSBzcG90IHRoYXQgc2hvdWxkCmJlIGltcHJvdmVkLiBJJ2QgbGlrZSB0byBtYWtlIHN1cmUgdGhh
dCBhdCBsZWFzdCB0aGUgZmlyc3QgcGF0Y2gKY2FuIGdldCBtZXJnZWQgcXVpY2tseSBzbyB3ZSBj
YW4gY29udGludWUgb24gdGhlIHJlc3QuCgpTaW5jZSB0aGlzIGlzIGFsbCByZWxhdGVkIHRvIGFz
bS1nZW5lcmljL2lvLmggYW5kIGNyb3NzLWFyY2hpdGVjdHVyZQp3b3JrLCBJIGNhbiBwaWNrIHVw
IGFueXRoaW5nIHRoYXQgaGFzIG5vYm9keSBlbHNlIG1haW50YWluaW5nIGl0CnRocm91Z2ggdGhl
IGFzbS1nZW5lcmljIHRyZWUuCgogICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
