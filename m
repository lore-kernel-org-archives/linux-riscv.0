Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B93EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaS1ntvXrNAbo3644Z6kxOVwYUAhDmBm7hjemM79Fpo=; b=HCBc2RMV2+Lnre
	RQ5BOkKzTBr7qsn7zV8vsBOnHn+qsBEL92qcE/8OPKiqYvaIcHgzUQdXh696b36KmMIdOWYZjBL2h
	wpnprduwSApZwKw6i3fIxVlO88mEAa2sNTHN+3sCnNv4Y/dMIuoYRarBPX36jMlMTFa2lPmylCpWy
	DvXkLtwz6PQ8DsoSbZP4P98+Aj0djkFMFwbywF4Au/iOyNx7C68qA0reGcMp6fwzP9iqc2y7sMlOg
	e1QVCPa7WeVN29cZZtWfkUl414T7OLQUEFnGjq3sISGvu632TOqcsb9XDhAePlh1oYZ/6C6tfqFi1
	4iPak7QMWvVIqArIEsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPWN-001VWl-2T;
	Thu, 22 Jun 2023 18:59:07 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPWL-001VVn-1f
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 18:59:07 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 421455C01A0;
	Thu, 22 Jun 2023 14:58:59 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute1.internal (MEProxy); Thu, 22 Jun 2023 14:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1687460339; x=1687546739; bh=2ATLxKVF7C47OWMyNOiJ4IVAUvlLTr2PQjO
	03XrYwtQ=; b=jhMw2Ska+eZgeHO3+++5OD0l49PGliWvSy8fP31gex+XeJFNm+/
	ctTOnjSUriBk3YanRaQE4vhhOiMaQdFLSZVbq6SKL891lWcfNQvVp0IficXkD3ur
	Qr6LsBzKtp72CXlpdy1mkANu2ZFlt/FRdMWOq/qOzyZN6S02AXxe6vrbu7xsBeXh
	0sofux24YHFG/IrWZxftgMTr44BZ9fIoiTNqUlkzNvzwgD4RiUrbSFsjoOBWBGcz
	y1xEFprOPhayp9Hg4sRIAIW8VPF+Ry87kroPV6PDMWmIsOEUQyZ4nxZQQSBFKiUR
	Fi6/pNoGYD4QjTHF6OEnemBdtdUrlkky7/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1687460339; x=1687546739; bh=2ATLxKVF7C47OWMyNOiJ4IVAUvlLTr2PQjO
	03XrYwtQ=; b=L2YsXMW+IEJEFtXPrtZcD1ui9pto5WQBzlhgdWm7aqGkV5DMr+L
	Ykb6/YBCH9g7WyK+vV3S3GmFMJesJA/yFMv1L5u+ewK//AT1uz434o1d54nEPdRy
	IgF4LBIOh8PP6mfURQ0dDVUA6qWHzQavq+1vtzDExzZpq7Hy+rcw1fVztuJamrwW
	wTPIDkR26/gHpqifTBS3/s+yka9npE++AlBZQdTwXHZEcVkID/qZIkfM7qIZkmM6
	cOTY0N2LRVHH8C7mAuQukgibPfTOlmWrJBtArfWg3rtZ2JbDBxYGel6PBtGoXqQq
	ouAW4Q9n0RFG7sazqT+FNMpjm0a0d4iK9VA==
X-ME-Sender: <xms:8pmUZHz-TsAhn36bFy8ivSrmfn8ofkBe4VxPTV3Otp9F3eobfVGJEg>
    <xme:8pmUZPTei0QfRD1CbHGWAmjHp1aReIB8qFPZ7_NnDlXVJ8Z6tvP8Lcki49529Wn2-
    ytkw9iJz99myc2pvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeguddgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    ufhtvghfrghnucfqkdftvggrrhdfuceoshhorhgvrghrsehfrghsthhmrghilhdrtghomh
    eqnecuggftrfgrthhtvghrnhepgedvvdegveekteduhedvkeehveekhfeuveffkeethedv
    udekgeffhfeigeefveeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepshhorhgvrghrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:8pmUZBV-LfLOyF46PVDBM9kaEZreix_cZKnto2GkDqOrz_HlA-VsPA>
    <xmx:8pmUZBj55LIctWugk_DYCmUum2agcBcJZc0hVb9c8R_1dr1PWGPjzQ>
    <xmx:8pmUZJBjrZFREGFhGDb3EsykrMNvVjWHHhAXFyl_caBsactX_m2_WA>
    <xmx:85mUZM6eDv-dO7ZEgdECxzMGeEMeyjXGo1Xf8ZbAA0LjwCZM8Vyu3Q>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7A8371700093; Thu, 22 Jun 2023 14:58:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <23381fc8-c297-46ed-9e11-a2643e18e4c9@app.fastmail.com>
In-Reply-To: <1941316.PYKUYFuaPT@diego>
References: <20230228215435.3366914-1-heiko@sntech.de>
 <20230228215435.3366914-3-heiko@sntech.de>
 <75071be8-272d-45e7-989f-5d717f313fe2@app.fastmail.com>
 <1941316.PYKUYFuaPT@diego>
Date: Thu, 22 Jun 2023 14:58:37 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Heiko Stuebner" <heiko@sntech.de>, "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, samuel@sholland.org, guoren@kernel.org,
 christoph.muellner@vrull.eu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] RISC-V: add T-Head vector errata handling
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_115905_628606_929CE255 
X-CRM114-Status: GOOD (  12.01  )
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

T24gVGh1LCBKdW4gMjIsIDIwMjMsIGF0IDE6MzkgUE0sIEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+
IEFtIERpZW5zdGFnLCAxMy4gSnVuaSAyMDIzLCAwODozNTo1MyBDRVNUIHNjaHJpZWIgU3RlZmFu
IE8nUmVhcjoKPj4gdnhybSBhbmQgdnhzYXQgYXJlIHBhcnQgb2YgZmNzciBpbiAwLjcuMSwgc28g
dGhleSBzaG91bGQgYWxyZWFkeSBoYXZlIGJlZW4KPj4gaGFuZGxlZCBieSBfX2ZzdGF0ZV9zYXZl
IGFuZCBfX2ZzdGF0ZV9yZXN0b3JlLCBhbmQgdGhpcyBjb2RlIGlzIGxpa2VseSB0bwo+PiBtaXNi
ZWhhdmUgKHNhdmluZyB0aGUgbmV3IHByb2Nlc3MncyB2eHJtL3Z4c2F0IGluIHRoZSBvbGQgcHJv
Y2VzcydzIHNhdmUgYXJlYQo+PiBiZWNhdXNlIGZsb2F0IHN0YXRlIGlzIHN3YXBwZWQgYmVmb3Jl
IHZlY3RvciBzdGF0ZSBpbiBfX3N3aXRjaF90bykuCj4KPiBJJ20gbm90IHN1cmUgSSBmb2xsb3cg
eW91ciBkZXNjcmlwdGlvbiBidXQgbWF5IGJlIG92ZXJsb29raW5nIG9yIGhhdmUKPiBtaXN1bmRl
cnN0b29kIHNvbWV0aGluZy4KPgo+IFNvbWVob3cgSSB3YXkgdG8gb2Z0ZW4gaGF2ZSB0cm91Ymxl
IHJlc29sdmluZyBDU1IgYWRkcmVzc2VzLCBidXQgYWNjb3JkaW5nCj4gdG8gb3BlblNCSSwgRkNT
UiBoYXMgdGhlIGxvY2F0aW9uIG9mIDB4Mwo+ICgjZGVmaW5lIENTUl9GQ1NSIDB4MDAzIGluIGlu
Y2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgpCj4KPiB3aGVyZSBDU1JfVlhTQVQgYW5kIENTUl9W
WFJNIGFyZSBhdCAweDkgYW5kIDB4YSByZXNwZWN0aXZlbHkuCj4gKCNkZWZpbmUgQ1NSX1ZYU0FU
IDB4OSBhbmQgICNkZWZpbmUgQ1NSX1ZYUk0gMHhhKQo+Cj4KPiBBbmQgbG9va2luZyBhdCBfX2Zz
dGF0ZV9zYXZlICsgX19mc3RhdGVfcmVzdG9yZSB0aGUgb25seSBDU1JzIGFjY2Vzc2VkIHNlZW0K
PiB0byBiZSBDU1JfU1RBVFVTIGFuZCBGQ1NSIGl0c2VsZi4KPgo+IEkgZGVmaW5pdGx5IHdvbid0
IGNsYWltIHRvIGJlIHJpZ2h0LCBidXQgZG9uJ3Qgc2VlIHRoZSBpc3N1ZSB5ZXQuCj4KPgo+IFRo
YW5rcyBmb3IgYSBoaW50Cj4gSGVpa28KCkFyZSB5b3UgYXdhcmUgb2YgIjMuNy4gVmVjdG9yIEZp
eGVkLVBvaW50IEZpZWxkcyBpbiBmY3NyIiBpbgpyaXNjdi12LXNwZWMtMC43LjEucGRmPwoKLXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
