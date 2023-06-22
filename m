Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40500EB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kz5LF0zHMvIfMjwcFn1UI+0b2ClwcZKTBtXsADP8yCg=; b=0WaSio6BXvsp4A
	uu6lsRHlv9eAnQ0GFJgZU+byPN51zmW1GlMGIoSaqLXWZUssJ+ts692e9nvonxyXWNxFO1zBQfqrB
	EBZtMDLo6KP++R2UTwtIqN3Dix90VrFY0bJodfGmVvvXAIdRnWmlG6FIoBCWIK9AWrQkPl1jFoAya
	t6yN0elck6vIdnOJrlfXyVsB7lrYR4KDoHmJDuevFGi11bPA4htfYXO/vkN58IkkqxymTTtpt3O9R
	YjU74a/4/UQm2X1oIV1T7s+jamtoQT2e2ZnFhzxtHHwcCH/eh3c2XrSH8tVueGEJXDi8CNjYoRJFa
	O9QHQgBaSQOC15vyyBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLwk-0015bs-2Q;
	Thu, 22 Jun 2023 15:10:06 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLwg-0015Zt-2v;
	Thu, 22 Jun 2023 15:10:04 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 7B1773200258;
	Thu, 22 Jun 2023 11:09:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 22 Jun 2023 11:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1687446596; x=1687532996; bh=UF
	Ik7GqKMTQQbMewPZ3JZd1cKUV2IvhZU7QLYY4nLQk=; b=VqXzuiAnU40BIyTBrS
	9/SRN8hrv7scO6zI3Wgs3SMHosS7t3TIJr1SBen8U4HVEj75R1HMftaR11UagFuI
	dQDwOO6WznyWPpjHfiZA/qhgUCvAGQy5BbZaxLT8/yzptS5v9ubV79kwpAGGxQuM
	DE1SwgGx2/ZH4LHcTmR8+ATYG4+1ChyqonunUcwENZ8WIemWrIms+PVug0q2eEMY
	TSR/0Lv+VsDmf75Ax2ZUYJHD9iEFh1NOs/D996wZlKS3iocCzmdyaCf0ugaZ8754
	mkrP5Erd8AZHVvjwPj+SwlMzINCbTf+N7Ax13yVW7pywBRzZV7toq41p/Zg6HRml
	8+aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687446596; x=1687532996; bh=UFIk7GqKMTQQb
	MewPZ3JZd1cKUV2IvhZU7QLYY4nLQk=; b=GDkxVJy0ljSrkyo6YnDKY4pFJLdfF
	2IiwBq716JjjpA1//mgjXXP5rcXOZixDJgoknebyqw1EqT2D2QU8dP8YL2NcTi1O
	IcPYk8faxiG7shlcm1dGUo/6sDJPCw3Xx0CSF1UrFWPh0CpWGKFhWKa1eSkHxUvZ
	hQKxsPVNrue7m49ASD49SHR8b6Ycrxepba23aSdmT5JPYAnwwLCp85qf4tpFV9QC
	s7uZrWeg6Rcr0aeiWooXqJ01AnWywTF72j+hj2YO3Lel+WKAuW51T7GBsJGC4tEX
	zBWePkKQBus17YZIOFzKmp68jsxY9m/bGzWsIxe3JfxKnYUSnioOb56VA==
X-ME-Sender: <xms:QmSUZLkPh6E0UqDs8VS6ZyRN4qZgBuUFafXc6Are0ycgDlrH6NDVqg>
    <xme:QmSUZO0DJFPef8z4dg0gEklyqcQOteSgU8sjn_ihzdZQGYc5BSSDYBjdql0sceTKV
    t-Mz_Lh8TLjXlZnyUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeguddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:QmSUZBryuN3fCOL33LL87iiMJqMuPdQ374jsU4AyA3x_IUnaAeTNqw>
    <xmx:QmSUZDndHZJxE8ISniqoZMrjyBRb3ilM9dINXYaxUJ00LFwhgi62PA>
    <xmx:QmSUZJ0rSKbadaLwaeA2sIbRM2gI4zZSyduBaxYgvlWuucs5KccdXw>
    <xmx:RGSUZGlj-v19qlVP4kskwEzbSFARUROY_1DQ0zqqUTkr7VMXuaT54Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7DFC4B60089; Thu, 22 Jun 2023 11:09:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <1412dbaf-56f4-418b-85ea-681b1c44cc26@app.fastmail.com>
In-Reply-To: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
References: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
Date: Thu, 22 Jun 2023 17:09:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v3 0/2] Unify uapi bitsperlong.h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_081003_406416_435C6A24 
X-CRM114-Status: GOOD (  10.53  )
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

On Thu, Jun 22, 2023, at 16:13, Tiezhu Yang wrote:
> v3:
>   -- Check the definition of __BITS_PER_LONG first at
>      the beginning of uapi/asm-generic/bitsperlong.h
>
> v2:
>   -- Check __CHAR_BIT__ and __SIZEOF_LONG__ rather than
>      __aarch64__, __riscv, __loongarch__, thanks Ruoyao
>   -- Update the code comment and commit message
>
> v1:
>   -- Rebase on 6.4-rc6
>   -- Only unify uapi bitsperlong.h for arm64, riscv and loongarch
>   -- Remove uapi bitsperlong.h of hexagon and microblaze in a new patch
>
> Here is the RFC patch:
> https://lore.kernel.org/linux-arch/1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn/

I've applied these to the asm-generic tree now

Thanks,

   Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
