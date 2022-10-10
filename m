Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E33C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8BmmjvaOT/MFaH02MLc+4Yl8J5IAPh043JoKby/8/OA=; b=2B1m+iJsmK5lye
	cAjMd+B0A9IP7ppxSpHNkQVSFN5kl27D34sdK/U0E2/OKcxeQX34FZYC0R+DXMvciScgp2g/dgyz8
	wpBzbB930+HPZq3WNmRsLQpjGCY1zb96tD8519b66r9g3picaaJIvDosqR6pVZ7bJkktQ7XUXK8UG
	02TUjRtdbFfx9obWqpN7TchR07MS9qQaMuGuSlzXE60zGh0hMa+KUUyB22p7OCRVzV13B6kkMw+g2
	hQwT8HKBb4j1AibKoQg+6ARYa7MyWsaFVyiU+XE28VW2A1DPOPXiSFJKtpNWfK7dHrSgK3Gk4Zcp7
	uwhc7L5zh5LGiR/ummow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohwyW-001iDY-Oa; Mon, 10 Oct 2022 17:54:00 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohwyT-001iD6-II
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 17:53:58 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 89B8D2B06F48;
	Mon, 10 Oct 2022 13:53:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 10 Oct 2022 13:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1665424436; x=
	1665428036; bh=Ed2ASF/NFpiraeYoybZuexHQtuPhqdf7I3GtBVFIK0Y=; b=V
	8GmQKa6hFqTJyhmpF9mv7V9gCo7mI3EOCfT4I5BypjGcTkYZiobVy2WfuBihVRxI
	3zadBMALcnD3TxuTgiNc77FdbmfBuECPfmZcCXW7TNpI403JghsLf+lD+z9Sq13y
	rX04MEmANgnhyfKE9vSc7YL3Ncf7gqGwd9yNGgiQgA+c4jphLm/Gggz0aC+zieeN
	4UM4bK+XgIKkolM2sZp7Y/8FFYtnY5uXgACvTrPFNtcEyGpgCTG1EpQ/2pDf0l5n
	Q+wJu2mq/vuJuW4nkEr90NP2g7o6AWK+kHqGoH/dODtwxHSyXdjzJcrb2UcvZ8d+
	KHZUFZeKC4T3mlz1kxm5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665424436; x=
	1665428036; bh=Ed2ASF/NFpiraeYoybZuexHQtuPhqdf7I3GtBVFIK0Y=; b=e
	98jZJ1FWeqxdOgYit9DI591DJ7FQvGAUPPy6cpmRR5IshfQ62gcvDmJZD2JLFPgt
	JF0m09aROwuCf0/XvmNh8Ng566PYlTaZmvnirgaK2MO4m8IARou9sC+pBOOxb5xR
	wOnI5Zz2gsFkNRH6GGVAPOQDKV2QPUMFUfenJEH4883xhz/tCcpoX1ihVq1jXm/J
	Dre7L3bRwS7L0SOI5zrfQHkGAX4man15OHQlBHFckM9S6H2GCc0quuATLLG61qnr
	whZ6xFYP0O9HI60pNvsL28uJNX1HsqB3Zf7nLnBa8q42ggNwgfwUYl/ziV3E+0Yc
	1d5cnQ/2XXKq8XpkTzcYQ==
X-ME-Sender: <xms:M1xEYzbtiK2XMO9M6mRQ6KI8PlW1X8txVe0bgfBwGIVzYSvNgFRUwg>
    <xme:M1xEYyagKbKAhtD73TfWc2vZOKkqxqZRwouvSrpIVl1k2GBdVmQi-WdVDoW0F_5wg
    49F_wSkxGNdAoUr5_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:M1xEY1-sA9C-oJQ7ys5cVQ_jvt_0YxzcFjgvNeoltguxM4Ms20tRjQ>
    <xmx:M1xEY5oq5Wy_L-OwfFSuia-MJMkE38nszR02s-DlOBA2K8A5PXAEoA>
    <xmx:M1xEY-pDFVBpTMomYkbcFaBCRmfFRun6DBHGziXSakWknCyUSxUPuA>
    <xmx:NFxEY3mdiyFPvTxbIpuiRq3QUw7c_D3mLCUn3AVbfTPcwdaxysy995EyAaQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C37CDB60086; Mon, 10 Oct 2022 13:53:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1015-gaf7d526680-fm-20220929.001-gaf7d5266
Mime-Version: 1.0
Message-Id: <83dd6d9e-10f4-422f-8d8d-b18ceb9dfcb5@app.fastmail.com>
In-Reply-To:  <878rlnk7no.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
References: <alpine.DEB.2.21.2209220223080.29493@angie.orcam.me.uk>
 <c4ee195a-cf1f-44f6-b3b6-241d04e01fb9@www.fastmail.com>
 <alpine.DEB.2.21.2209231211350.29493@angie.orcam.me.uk>
 <878rlnk7no.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
Date: Mon, 10 Oct 2022 19:53:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Make port I/O string accessors actually work
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_105357_893792_B49D95E6 
X-CRM114-Status: UNSURE (   6.98  )
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

T24gTW9uLCBPY3QgMTAsIDIwMjIsIGF0IDU6NDEgUE0sIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4g
Ik1hY2llaiBXLiBSb3p5Y2tpIiA8bWFjcm9Ab3JjYW0ubWUudWs+IHdyaXRlczoKPgo+PiBPbiBG
cmksIDIzIFNlcCAyMDIyLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+Pgo+IFsuLi5dCj4+ICBUaGFu
a3MgZm9yIHlvdXIgcmV2aWV3IQo+Pgo+Cj4gQ2hhc2luZyBzdGFsZSB0aHJlYWRzISA7LSkKPgo+
IEFybmQsIHdvdWxkIHlvdSBiZSBPSyBhZGRpbmcgeW91ciBSZXZpZXdlZC1ieSB0YWcgdG8gdGhl
IHBhdGNoPwoKWWVzLCBwbGVhc2UgZG8uCgpSZXZpZXdlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
