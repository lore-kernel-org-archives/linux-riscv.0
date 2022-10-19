Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65558C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 20:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbtyDay2xmrRxfSPRoVQyD3yElB7xIgd+vzA9n7WtcA=; b=ipgnsQCZ1554tg
	/D3SP+KFKq5JKE6Cjm5TxEVO3LydMo8wFNs97kUHrOviz7M36vsgcz3InTZP8CLMoSZSkYMYLeQDl
	WXvN7t36aFoY72632B6lwWAPX64PU7CQ+/Zz7wGKNw8/f+g3HvJkLUUAXrpGox+SOgkWA0pzURM0/
	KIUM40qGsBmKt4U3M1WsPel7doJoCIVJMral7KjUZndLCzvxReO8nAdtbqsUkBWMUAfbMm6S2ibXt
	DoDs3ozEpCnPeQtz6ZOmYWF9FM98TXWnPZ12Rhb9r9bXbDZDJXEI9NTCE1ZAu0f0kaLGAA28MpNvv
	z580D6gopPXLkKELS+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olG1T-0058Ig-GA; Wed, 19 Oct 2022 20:50:43 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olG1Q-0058Gh-QG
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 20:50:42 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id EC0205C0172;
	Wed, 19 Oct 2022 16:50:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 19 Oct 2022 16:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1666212639; x=1666299039; bh=v02lubHCvU
	grTExgVSjs3iH2RzBOzg6UGAwCAUxRqJs=; b=p+cXu8MHpC/7DVe6y2ZZOtdDZ4
	6vcC+B2jqcssDTzCgTy4HA9px5ybTkZMumK8lXTP07c7Jcyf1sxTxbHt8lVLQgr5
	6MhBedMX82hqPVH5mvzXOJo8WFPX/BiyaugJBkCOuvv4ReGTt9Wy99VLs5xg69b1
	lCOh1YzZk76S5l+XW2gY/sngygZSxm0vWUPdUGFZbht4CPWUA8u4mflrm0vHnbdr
	UwvNPcrx8ofelLR67T4ktGvkKzzNytoNH6LSCG+UXwfsR3ODFu59vgbThING85F9
	KoMn9DW7n/39pyvU1nakVA5pqLplFldksUURTzX/zOvcWVlqGbn7VU9jdHvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666212639; x=1666299039; bh=v02lubHCvUgrTExgVSjs3iH2RzBO
	zg6UGAwCAUxRqJs=; b=fBfc4hINCDwv8+Dz/eU06bQw5+UKsrsNfcS9NvHAzjlA
	RpI6F0a39UjCXWMwYqDIAVU49L1iiaQEIJcDaOGPYhnXZen+klLzswT2tx25wgm2
	3GEkbUym7MNR19Ty0dKQWx8pHVWvtnD3eMxVARBqgVkyzfQTNW9/N8ypswrVkgeS
	hBRI418ZpGCxbBtRDUeQpTYmVJEMxZlQItEOjjxKlcofNK/De+ogqjJZQ18s3OJz
	peAP7h5RnXP/ocnAgIsxT+aX2s78h5/QAxEkBRxD0NEaOIZuRRoclMl7aN2vh9wQ
	HRLdPakTIjrZj2VqtbUZbgdhyaCsSgrpmkkCZHDwfw==
X-ME-Sender: <xms:H2NQY6gKZ771Kf2__FJ_znfzNdn3VTTSzy6ntYMm1hL0uu2zYubvlQ>
    <xme:H2NQY7CVSHClF79-XX5LVvAB45rwgzKboCEi2WAmvyz53hsvW9UmqvljUSGREUoh0
    _LZwnM7VwHS9PU4DNc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:H2NQYyE0BJtMHDi294tcKtpxprQBVKcglbRBvZ4z-g7eS-_9BsAPCA>
    <xmx:H2NQYzRE77gjDw_x9dFX6ppHmtBuJnfse0YGlCinVot9Fnv_W1UzOQ>
    <xmx:H2NQY3yGWun4DCw9icG7q5L9KKHFG_ONfQBATEeOTPozKCPm3cZz6A>
    <xmx:H2NQY-lpzKVzYxJXfkhsjnXh5-8UfLxTIwTQG3pelsVKGEMeVRd2oQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 18CACB60086; Wed, 19 Oct 2022 16:50:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <20bfd8a3-3836-46b8-9fdd-a407973224ba@app.fastmail.com>
In-Reply-To:  <CAK9=C2WaoqAaVa2fo9E7cGXMy-MKpj-xLN6LoMHyq_g1psGLUQ@mail.gmail.com>
References: <20221019131128.237026-1-apatel@ventanamicro.com>
 <20221019131128.237026-3-apatel@ventanamicro.com> <13122510.uLZWGnKmhe@phil>
 <CAK9=C2WaoqAaVa2fo9E7cGXMy-MKpj-xLN6LoMHyq_g1psGLUQ@mail.gmail.com>
Date: Wed, 19 Oct 2022 22:50:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Anup Patel" <apatel@ventanamicro.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Atish Patra" <atishp@atishpatra.org>, "Anup Patel" <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>
Subject: Re: [PATCH v4 2/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for systems
 with Svpbmt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_135040_967516_D5FA9C77 
X-CRM114-Status: GOOD (  15.73  )
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

On Wed, Oct 19, 2022, at 18:10, Anup Patel wrote:
> On Wed, Oct 19, 2022 at 7:49 PM Heiko Stuebner <heiko@sntech.de> wrote:
>>
>> Am Mittwoch, 19. Oktober 2022, 15:11:26 CEST schrieb Anup Patel:
>> > Currently, all flavors of ioremap_xyz() function maps to the generic
>> > ioremap() which means any ioremap_xyz() call will always map the
>> > target memory as IO using _PAGE_IOREMAP page attributes. This breaks
>> > ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
>> > remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
>> > page attributes.
>> >
>> > To address above (just like other architectures), we implement RISC-V
>> > specific ioremap_cache() and ioremap_wc() which maps memory using page
>> > attributes as defined by the Svpbmt specification.
>> >
>> > Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
>> > Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>
>> Wasn't there discussion around those functions in general in v2?
>
> Yes, there was discussion about a few drivers using ioremap_xyz()
> which is discouraged and drivers should use memremap().
>
> We still need the arch specific ioremap_xyz() functions/macros
> added by this patch because these are required by the generic
> kernel memremap() implementation (refer, kernel/iomem.c).

There is a difference between the strongly discouraged
ioremap_cache() that pretty much has no valid users, and
the ioremap_wt/ioremap_wc functions that are sometimes used
for mapping video framebuffer or similar.

It should be sufficient to provide a arch_memremap_wb()
and no ioremap_cache() to make memremap() work correctly.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
