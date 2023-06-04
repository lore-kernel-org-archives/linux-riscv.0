Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31F8C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5OElSGXqfTY2cU4K0RORgx68xJ2z+qiqGI2xLmQcMo=; b=0v9OWZGAAfD7jh
	z6C+5eOrirav7QGZlfcg8CGNEl9tZevxnsR059wcs02ybdZ74lB1F0z/DILrNH0LJc6reAb6U6hVw
	N9Ck+NHJdV/aaYUV/wc0xMYvpeAQvHz5Ortjr9qaRP21KcGXlscRedqDbCCpdTw4Bjpn999YIj57t
	M16tdvdXGVYiFIXE/eHckToMqq7UEQIWOhXxIGkecLoGnUzCrFeOLzMmm3lGCE6a4bhKLpbQmYwox
	tvGj9k/bKO+4uQ5t6qzj/v23g8Hd2SUo8fxcbbZGYXv6gh8iNneVnwRDaolCyuG5+hZkNMuHSjc5y
	z9D0E0gtqPc3rHEa1OUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5jz6-00Bipo-0U;
	Sun, 04 Jun 2023 09:25:12 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5jz3-00Biom-2w
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 09:25:11 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 6173F5C00EC;
	Sun,  4 Jun 2023 05:25:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sun, 04 Jun 2023 05:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1685870705; x=1685957105; bh=XfcdNIb0iKDc88JTEvQZP3mryRBy0lricuJ
	YjJH51q8=; b=fV8hohYurmAXdy7NIRl2Iih+PmBfQOdum7I1ekGoQwAnkIF7wtP
	jE2wStOMgmyyFZwj2X0jUux5KkkST4/TFfRBpO3xVqnR1RMI64NX8cyZom82x6TP
	ZH64fXxv2uiNh5CKvR/ZOueQunPdYgXb2dUkMCWgtgconnL8F4Z7k1lV3GfDBG60
	C3ecL2Mf5bD2pLHT6RHPxbr4LmSy2HbikUo1Ua0ZY09wtRH0cbuzuQz5W8cGLGot
	D0cTu9umThZtsu9C/VIKEpMIA+3uiATn+aYZnShXbMmwPXVZZzk/k1gWcHm1U3gj
	DyVjd61XGY4k/DR4Hqnb7JilGP7r7BcnxIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1685870705; x=1685957105; bh=XfcdNIb0iKDc88JTEvQZP3mryRBy0lricuJ
	YjJH51q8=; b=mZkmWbDvU3WZBsJ4N17WIaevXWee0F4bGB5O+xJ7V+hOeQuLvbf
	j3yvNn22dRxDNJGVUUkFRQ3CL6d/N/pXaRnkLzX0hGAvzYWCsytQ76SNvrxGBl3I
	c0PxUkjm4J5q1lSXD8Z7t0VXnwFLll1FyDb4/ptP/Ady1ffDykXSTn5n17Qchd80
	oY040w+i2YaQIy86KkzSXNlFjSRMPjyN6oFCCIg4aTwxIO1A3/949PrWkSdSJOGH
	sJAVjaSUNX6kMCsnuKgDl4yg6IrayHWc+kA6ElRm0NIBQ/DjBCT7yRWPZEP0n3Uo
	xAmzP/VbIHWA858SM4JHZCmBglw/ns204og==
X-ME-Sender: <xms:cFh8ZDsi772J3rLmhqkiafqbZkp92fewh2ldBc7ZQk83djUQnb_MIA>
    <xme:cFh8ZEex7Le44KnbYYiWu9IuR0LAcfnrTDRV5e6Kg2_qec8MGyprb565lNubz3kjF
    Uj8Rx7p05yr7R_51gI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeljedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:cFh8ZGyd4e0FaIFWo1-GtkqXOS66OWeMTjxHYwKlVk9GffWggrm_7g>
    <xmx:cFh8ZCN78gjlSaYc2zRKtDH1pLGG5d2bmQ_8ROvlqyZoZuKwj62oeA>
    <xmx:cFh8ZD-kZ8Q9ml3KMfmmNJth7F0_xTL_ruCiew5ufLpE9eqnQdF1Iw>
    <xmx:cVh8ZGYqRMrysLw4vMlis8bYI8CJmPzB2dpxf_RRHPG2Q0zBHp3-TA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8932EB60086; Sun,  4 Jun 2023 05:25:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <51e1db37-3981-4ea5-9348-b6f6b31ecc8a@app.fastmail.com>
In-Reply-To: <tencent_4668A50A08C3D31E7531619E@qq.com>
References: <cover.1685777982.git.falcon@tinylab.org>
 <68dace9e2532316ff454894697ecfd99e419a523.1685777982.git.falcon@tinylab.org>
 <2fccaff5-2354-4ac0-8389-1004d47d8dc9@t-8ch.de>
 <tencent_4668A50A08C3D31E7531619E@qq.com>
Date: Sun, 04 Jun 2023 11:24:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: "Willy Tarreau" <w@1wt.eu>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-kselftest <linux-kselftest@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 11/12] selftests/nolibc: add new gettimeofday test cases
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_022510_415140_259A4921 
X-CRM114-Status: GOOD (  11.22  )
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

T24gU3VuLCBKdW4gNCwgMjAyMywgYXQgMTA6MjksIOWQtOeroOmHkSB3cm90ZToKPgo+IFNvcnJ5
IGZvciBtaXNzaW5nIHBhcnQgb2YgeW91ciBmZWVkYmFja3MsIEkgd2lsbCBjaGVjayBpZiAtbm9z
dGRsaWIgCj4gc3RvcHMgdGhlIGxpbmtpbmcgb2YgbGliZ2NjX3Mgb3IgbXkgb3duIHNlcGFyYXRl
ZCB0ZXN0IHNjcmlwdCBmb3Jnb3QgCj4gbGlua2luZyB0aGUgbGliZ2NjX3MgbWFudWFsbHkuCgpB
Y2NvcmRpbmcgdG8gdGhlIGdjYyBkb2N1bWVudGF0aW9uLCAtbm9zdGRsaWIgZHJvcHMgbGliZ2Nj
LmEsIGJ1dAphZGRpbmcgLWxnY2MgaXMgdGhlIHJlY29tbWVuZGVkIHdheSB0byBicmluZyBpdCBi
YWNrLgoKPiBBbmQgYXMgc3VnZ2VzdGlvbiBmcm9tIFRob21hcycgcmVwbHksCj4KPj4+IFBlcmhh
cHMgd2UgcmVhbGx5IG5lZWQgdG8gYWRkIHRoZSBtaXNzaW5nIF9fZGl2ZGkzIGFuZCBfX2FlYWJp
X2xkaXZtb2QgYW5kIHRoZQo+Pj4gb25lcyBmb3IgdGhlIG90aGVyIGFyY2hpdGVjdHVyZXMsIG9y
IGdldCBvbmUgZnJvbSBsaWIvbWF0aC9kaXY2NC5jLgo+Cj4+Tm8sIHRoZXNlIG9uZXMgY29tZSBm
cm9tIHRoZSBjb21waWxlciB2aWEgbGliZ2NjX3MsIHdlIG11c3Qgbm90IHRyeSB0bwo+IHJlaW1w
bGVtZW50IHRoZW0uIEFuZCB3ZSBzaG91bGQgZG8gb3VyIGJlc3QgdG8gYXZvaWQgZGVwZW5kaW5n
IG9uIHRoZW0KPiB0byBhdm9pZCB0aGUgZXJyb3IgeW91IGdvdCBhYm92ZS4KPgo+IFNvLCB0aGUg
ZXhwbGljaXQgY29udmVyc2lvbiBpcyB1c2VkIGluc3RlYWQgaW4gdGhlIHBhdGNoLgoKSSB0aGlu
ayBhIGNhc3QgdG8gYSAzMi1iaXQgdHlwZSBpcyBpZGVhbCB3aGVuIGNvbnZlcnRpbmcgdGhlCmNs
b2NrX2dldHRpbWUoKSByZXN1bHQgaW50byBtaWNyb3NlY29uZHMsIHNpbmNlIHRoZSBrZXJuZWwg
Z3VhcmFudGVlcwp0aGF0IHRoZSB0aW1lc3BlYyB2YWx1ZSBpcyBub3JtYWxpemVkLCB3aXRoIGFs
bCB6ZXJvZXMgaW4gdGhlCnVwcGVyIDM0IGJpdHMuIEdvaW5nIHRocm91Z2ggX19hZWFiaV9sZGl2
bW9kIHdvdWxkIG1ha2UgdGhlCmNvbnZlcnNpb24gbXVjaCBzbG93ZXIuCgpGb3IgdXNlciBzdXBw
bGllZCBub24tbm9ybWFsaXplZCB0aW1ldmFsIHZhbHVlcywgaXQncyBub3Qgb2J2aW91cwp3aGV0
aGVyIHdlIG5lZWQgdGhlIGZ1bGwgNjQtYml0IGRpdmlzaW9uCgogICAgIEFybmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
