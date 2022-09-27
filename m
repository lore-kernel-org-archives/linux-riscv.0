Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A5CC07E9D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 06:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CxymGN9YkDqKabttwagQ0l8boMhVa136963y1iDThg=; b=g6xhl7qDhtuHXO
	UwHxWZm9gVEMJM87T7jv0Ho9lRmIDWNWfxBolDOHhtv3rPnzVs7GmFoWDFlY/l1sFIqGheA82JfMF
	0d8IA6Wg/Om0dFF1Cp/4jBghggG+C8YUKrwzsnGxpe9ypzHYY6zpdrWd2qtnNdLegA6qh7BnEoY1j
	FRzH67ssntpXvElUI9yPHmhdZDsgRLXJVY1FzNZ/X1ibf9Gr3ea9Lythzuzj2d9wSXViERmVR6vmM
	B7Wm6Ern+U1XugwYUIgiJOlluTQiraaiDlSJFE2bfo75Uwph4nlYsUMm7prkEKLGsMXFeXgvEpW4a
	VXXtJMDjs4LYLnbLM+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4OT-008eXV-Nr; Tue, 27 Sep 2022 06:48:37 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4ON-008eVT-Bq
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 06:48:36 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 61995580786;
	Tue, 27 Sep 2022 02:48:21 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 27 Sep 2022 02:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1664261301; x=1664264901; bh=PrWsUmhs4O
	pBOF0cIBIyNqk5DrlwTwBRgaN011d4mfw=; b=rbdGTZQR5r1NPd/QJ5ConCma2F
	oOPfjzQyBQsnwduCe4Ow15nQorOpxCjGQtE1e+0ESL/i0N4RWFNA5MMwfBY8ArlT
	Uv3y+8ZIh0J4QzYGFtcVy9FIHHuUefOgeZ+qn1L6okBC1jZA7rVsjpgECv1LUOOj
	JtLLeuRiEWecjgmK6KCz268NcByytTuVvXLvCQlIgc46RI0mPvPgPqOdMcXxnxNw
	XQ/YB0/wfmQvW1wFEFm4f4oL17goXTI3TZ0nJN5c83HTD60ylN8ZxO7+Z/qiE2Z+
	sWbpI7iHSW+Amdd6flPBS+arndLkH6dXxzckUpwX1XoI79T1EkedmlgegTOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664261301; x=1664264901; bh=PrWsUmhs4OpBOF0cIBIyNqk5Drlw
	TwBRgaN011d4mfw=; b=kmJGa9JX0fo0VOplDpe6XHR5eogm0+dgaQhQjgak9Uid
	uSW9jdxXhwyhpsEjNEBLDdPBMfeh+ndQPGSXs+HvmXkJRY/+Ts1xSdVOmfatVtyN
	U5VSbZuACAEQhgOd3lN7qGoBQ0PU+f5+yZYG/Ih+NGnSqT5tJdYD2hrechYOiAxK
	s8lRXf75D5rfwoPUZjnMMiegMeH3UcBfPtMMGYJ1xVTmrRcK88rvnIJFNfOQaHZb
	e8ULRPd3cJYSAWQwd3zV4QkECMtg3q1VBb/e//oQDgxj+D5ra00qSneTw5Aauv+r
	nKROURm9Zoq4vgO9YlmqVvkUlehOzMYOGfOF0/H2Zg==
X-ME-Sender: <xms:tJwyY78zweSPdtCgv3peVu9ZRe7dsrkDmw7uZrPi8LQgTyxTviXrKQ>
    <xme:tJwyY3u-ypiEjWdR9kgS8zEW-uz3bFfJn-GBAQhPVLG25AGGKZQyBaivOxeo1mhuC
    Q2y80QK1xtgeaOCU0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:tJwyY5D0OXDiRnDQEHF1dIEyInrn3z-xP1p5YGMN2V8KhJIZxatttw>
    <xmx:tJwyY3ftCXSS9pmO_esdcRAOhFnlmLSCXu9_MkV4heArbj83p3jEOw>
    <xmx:tJwyYwPKiqsb-HsBlxOjKPV6Q5ssBN5sYgOia2G-2TC3w3SkzdRjqQ>
    <xmx:tZwyY_2UdjpPo79x0Y1qM_GC3fgVFctPuHQuUK4IclVsEXtZKMYMaQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B3EB3B60086; Tue, 27 Sep 2022 02:48:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <689a9a66-9086-4944-ba08-d0a63d6602fd@www.fastmail.com>
In-Reply-To: <YzKZYoaAbwtLcsSY@wendy>
References: <20220923185605.1900083-1-conor@kernel.org>
 <CAMuHMdVxx7_im2wtb_Hszf2P6EuxEDjA95sJtkM9Jf9KV3xO4Q@mail.gmail.com>
 <YzKZYoaAbwtLcsSY@wendy>
Date: Tue, 27 Sep 2022 08:48:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor.Dooley" <conor.dooley@microchip.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Conor Dooley" <conor@kernel.org>, linux-riscv@lists.infradead.org,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, kernel@esmil.dk
Subject: Re: [RFC 00/27] RISC-V: Convert SOC_FOO symbols to ARCH_FOO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_234834_999908_18BB34C2 
X-CRM114-Status: UNSURE (   9.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 27, 2022, at 8:34 AM, Conor Dooley wrote:
> On Mon, Sep 26, 2022 at 11:04:58AM +0200, Geert Uytterhoeven wrote:
>
>> and (b) you take this through the RISC-V tree, you will miss all newly
>> introduced users in other subsystem trees.
>
> Aye, your suggested timing makes sense, but there are quite a few
> subsystems involved here, so maybe doing it at the very end of the
> window rather than asking everyone to stall until rc2 may be more
> feasible?

Since there is no rush here, maybe stage this out over two releases?
At first, just introduce the new symbols as aliases like

config ARCH_FOO
      def_bool SOC_FOO

then change all the drivers in the following cycle after the syumbol
exists, and finally rename the user-visible symbols and remove the
old version.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
