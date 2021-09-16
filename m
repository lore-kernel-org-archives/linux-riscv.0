Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B315C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 00:49:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0E90610A4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 00:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0E90610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJxVqh6K2Ht9yQjMuExagCF+eDudY7FLFCX/jB7OsEs=; b=fzerXPtyS+XRUW
	f37QV1zdcuruiGcvuAgZ+tta8E9Y0x/pw6rfsXXKyJ+lPbcdc3Qp3XDBHNI5I0X/fhYklU7ZD4WdZ
	Rze7g74qH77t8sWjp96Qj25UAvt5U5Uu/I/azCk2TPJZhWbDDcfkD0uATODTKE2mpWNpMKCxepyNf
	4mnY6OLy8wnThdXJXXoFK5tA82k6XOouDFVXDozSkbEGNjODF4PoA8aE75WWUwZJde4h9om1UlRbT
	i25bOuOLAkXaf2ksuKeEpBewAQ1Pqv/z4uGC0n/eg8hpbPxN8+gH6jRAg+i/zxIZFHhQxSf/KnhVP
	gs7HPfQWsE3bW99b/Jbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQfaU-00A9H6-5j; Thu, 16 Sep 2021 00:49:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQfaR-00A9Gm-8Z
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 00:49:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E30A6120C
 for <linux-riscv@lists.infradead.org>; Thu, 16 Sep 2021 00:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631753350;
 bh=0fKIb1wSJtzBX6f3dXc+/Xbaxxti6nBaEoOdmYLZUIk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WCvnczTQPx2dh1r9Q2ZKG5wBOfjDM8AxcKQHwq5bUKOcy/kF4rvxBJv9Tn/T9Gjll
 ysjVntR1bAPllMoGBE0Lr6QgPig14HlVYVgp4mglTOu9sBKg5WDY5nKghhUsUirveX
 vd5/OfJ1mUx3hbzdHVLGy/9JYEQSiw0OyTq3vdGuPJDgqY2g1oPdgU9/gqB61SsQtV
 jAAZtlLKseywDxOGO04SYZAr1mzmLV+5H8ndbtuc8u275zUs69aBO1NdetVUkP6ccS
 L/PeQEd0lIMjohnGzF1Q6nStfu//tF+xGPVO0qq6XbFW6ZNXQ3lmqmMk5oZp8Eyxxw
 YnJIHB/CLVcvw==
Received: by mail-lf1-f49.google.com with SMTP id g1so11488889lfj.12
 for <linux-riscv@lists.infradead.org>; Wed, 15 Sep 2021 17:49:10 -0700 (PDT)
X-Gm-Message-State: AOAM533TC68TXKc27Hj4fjaw/6FBG3rXQR6FmiYcEweLqRfbJBs2l19g
 SIPyFuLWPqsFvP/41Lh1e/EhjbJd1+lapkUudlQ=
X-Google-Smtp-Source: ABdhPJwZWPa7mrnasG5fOmbf2PwdvOe0X12pKkbc9DRuVQ2YmRoDJWly+mMIvlfW0LUkmJZBCBhrPIVa0wvTyC+zIME=
X-Received: by 2002:a2e:3307:: with SMTP id d7mr2546833ljc.292.1631753348776; 
 Wed, 15 Sep 2021 17:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-3-guoren@kernel.org>
 <20210915074727.GB20024@lst.de>
In-Reply-To: <20210915074727.GB20024@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 16 Sep 2021 08:48:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSHvm5h8ZjB40jnCpT15YxA1eanMO8kghRbLWV1xqv9jg@mail.gmail.com>
Message-ID: <CAJF2gTSHvm5h8ZjB40jnCpT15YxA1eanMO8kghRbLWV1xqv9jg@mail.gmail.com>
Subject: Re: [RFC PATCH V4 2/6] riscv: errata: pgtable: Add custom Svpbmt
 supported for Allwinner D1
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, 
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com, 
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>, 
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_174911_383955_6413EEB1 
X-CRM114-Status: GOOD (  17.97  )
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

On Wed, Sep 15, 2021 at 3:47 PM Christoph Hellwig <hch@lst.de> wrote:
>
> This is the wrong way around.  We need to design around the PBMT
> definitions.
I've defined them in arch/riscv/include/asm/pgtable-bits.h first, that
follow current latest draft. Then I undefine them in
errata/thead/errata.c to illustrate we should follow standard PBMT,
not a custom one.

> If we want to hack in support for completely broken SOCs
> that intentionally violate the specification it should be done after
> the fact,
When c9xx was released in 2018, there is no clear direction for how to
solve the non-coherent problem. We just thought PBMT is the correct
direction, but we can't predict how encoding exactly in the highest
bits. (Maybe we should keep the highest bits zero for _P/SXXX in
pgtable.h, but it was really hard to guess at that time.) So don't
imply we "intentionally" here! When the svpbmt is frozen in the
future, we would follow that in our next-generation processor.

> in a separate patch, using alternatives and clearly documenting
> how broken these SOCs are.
Okay, I would separate errata into another patch.

About documenting, I've illustrated c9xx PTE format's detail and using
undef _PAGE_XXX to show that we replaced standard's in errata:

+/*
+ * T-HEAD C9xx PTE format:
+ * | 63 | 62 | 61 | 60 | 59-8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
+ *   SO   C    B    SH   RSW    D   A   G   U   X   W   R   V
+ *   ^    ^    ^    ^    ^
+ * BIT(63): SO - Strong Order
+ * BIT(62): C  - Cacheable
+ * BIT(61): B  - Bufferable
+ * BIT(60): SH - Shareable
+ *
+ * MT_MASK : [63 - 59]
+ * MT_PMA  : C + SH
+ * MT_NC   : (none)
+ * MT_IO   : SO
+ */
+#undef _PAGE_MT_MASK
+#undef _PAGE_MT_PMA
+#undef _PAGE_MT_NC
+#undef _PAGE_MT_IO
+
+#define _PAGE_MT_MASK  0xf800000000000000
+#define _PAGE_MT_PMA   0x5000000000000000
+#define _PAGE_MT_NC    0x0
+#define _PAGE_MT_IO    0x8000000000000000
+#endif


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
