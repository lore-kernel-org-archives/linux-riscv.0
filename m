Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE65C77B73
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAZFxTmMwx8XJrliKn5Opbf2wAykpEBCnLfmxQaHcdo=; b=FbLam3V6yAxaHo
	ZfzIwV/wGcG6VtYp7K+MXLztH5rDdW3hZP3HM+1zrp/n0YZL5sNhhjQ6v4YbHvsVgitbNVEn/gU9u
	46ddG/q4FDVZ5f0aI8Aj/C1N0v+J0zrgcSIiWZDKDSKl/amMu7KJMhI2UqVZ+pEyJA3zonvYhNIhx
	VS5bERjeHgs3/sQf6FrYu4Akv3cgrzC3izEUSjiX/XXKOinP5xCaGNP1CoDHOdWpU8KbFuhfrEl8q
	oo3VPmcKSso8Pl4bHffRTK7PSM1jHHOrhOXF3oXke11Mc1iSA3yUO4bvPF+beGGMDW+6v4v0C3tRb
	2oa6AskaytWS1IQoMomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5m4h-00C381-1W;
	Sun, 04 Jun 2023 11:39:07 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5m4e-00C37L-2Q
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 11:39:06 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id E72555C00F5;
	Sun,  4 Jun 2023 07:39:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sun, 04 Jun 2023 07:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1685878740; x=1685965140; bh=DE
	Q24KaCgZ4/pEUSv8IkC2IlBgiOfkfs8fsUXXMnOhs=; b=O13GmFivotkhY/CCsM
	kQ1Jrf5MmMFSE8POyLnqrnysH1lWvf5kcc9FOhAOJCd2w7+i2fLDtgnKnvQ2h3K6
	+vw/Oce3ODUC4VXzS3fp3vNO6xdxTU/YLZ16LH2Yp2XoMbnddwzUIBt+mlayzaF8
	MDpUM03/GvC4U2x2/baCB09tmp6jwcMpJTjn4WjF+450F6mvzn0LzNMSfMTB5p0/
	tOY9X6H5mvCX9xgnbcCDP6NkkR+smQgIe7TIWX9w8BYCr4NqrO+BVTUZGymhbtAq
	/Gqh+iF2fCI5jKckvc5Xu5zAx6DcvVq03iGPOzrvvgZ6T9DYKBY0Z50NwtTmi5cA
	F7uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685878740; x=1685965140; bh=DEQ24KaCgZ4/p
	EUSv8IkC2IlBgiOfkfs8fsUXXMnOhs=; b=zn8g6WPW+s68N+nwbcsnTobAjgL6q
	bVJ1ymrzhsmcx9OPlVor6CPkp/OYvlCIRlFA964UNAD7U7EX942TVX8RCnhcKsXi
	KkN97cz9B5cQMTSYVluX0gAaF2jbSOf/aB+piI6KOU7K7IQ2sw1jkpIr4UtSV7Pn
	jeyP87Z5VBMYTNC+pPPhkaOho4j5/la0avjLK3GOw95VVtqRS/MPjIKIOYXxDRuN
	4J4RiqGLe3x/tbasqp4tfg0FUhkR92h/F0L2hbqI/0lrBrddS3FXnlerDlCk4D8e
	9j8oeWADcMXK578Jy3al5WlB6sRN3GHwyE7n7z2wXX5HzqhREKJsuFdjQ==
X-ME-Sender: <xms:1Hd8ZBLt4IW7vdclxPXDMgCe2tn0rUu0ZkhVs8QVHeRFsICgAKvYCg>
    <xme:1Hd8ZNI4UYaVKb1iR-9mI-TQYXImdC_5L6-uWoWxdLFtxbQRvtcHofyILPGEtdBg4
    ZUAmxTl3TWGxcjIQQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeljedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:1Hd8ZJs1mp7itbAdgrucjR-Akjxp8C4m0uRTzJ9QM7eGgtK_i0btKQ>
    <xmx:1Hd8ZCaBmS1343W9HbMuVvsrXh47ncFAIfLRSe5IrCyoVba85n9VTQ>
    <xmx:1Hd8ZIblr5OKicbkwZarrfjoW5apzW7ov9WTKXgdoijsArewIrMCcg>
    <xmx:1Hd8ZAEMCwjTgHVdLtkztAq1nkyfdf8TbqxqdXsWtTWOBQ3KMX7-4g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 55000B60086; Sun,  4 Jun 2023 07:39:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <54edae1f-0c1c-4beb-b6ac-fcd61fc81de8@app.fastmail.com>
In-Reply-To: <ZHx1OliMqHx9U1Lw@1wt.eu>
References: <cover.1685777982.git.falcon@tinylab.org>
 <68dace9e2532316ff454894697ecfd99e419a523.1685777982.git.falcon@tinylab.org>
 <2fccaff5-2354-4ac0-8389-1004d47d8dc9@t-8ch.de>
 <tencent_4668A50A08C3D31E7531619E@qq.com>
 <51e1db37-3981-4ea5-9348-b6f6b31ecc8a@app.fastmail.com>
 <ZHx1OliMqHx9U1Lw@1wt.eu>
Date: Sun, 04 Jun 2023 13:38:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Willy Tarreau" <w@1wt.eu>
Cc: "Zhangjin Wu" <falcon@tinylab.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-kselftest <linux-kselftest@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 11/12] selftests/nolibc: add new gettimeofday test cases
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_043905_218217_F32E03FE 
X-CRM114-Status: GOOD (  10.06  )
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

On Sun, Jun 4, 2023, at 13:27, Willy Tarreau wrote:
> On Sun, Jun 04, 2023 at 11:24:39AM +0200, Arnd Bergmann wrote:
>> 
>> For user supplied non-normalized timeval values, it's not obvious
>> whether we need the full 64-bit division
>
> We don't have to care about these here for the microsecond part,
> because for decades these were exclusively 32-bit. Also the only
> one consuming this field would have been settimeofday() and it's
> already documented as returning EINVAL if tv_usec is not within
> the expected 0..999999 range.

Right

> Over time we managed
> to make simple code compile with both glibc and nolibc, but when it
> comes at the cost of adding size and burden for the developers, such
> as forcing them to add libgcc, I prefer that we slightly limit the
> domain of application instead.

Good point. This also reminds me that the compilers I build for
https://mirrors.edge.kernel.org/pub/tools/crosstool/ don't always
have every version of libgcc that may be needed, for instance
the mips compilers only provide a big-endian libgcc and the
arm compilers only provide a little-endian one, even though
the compilers can build code both ways with the right flags.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
