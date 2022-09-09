Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5D9ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 04:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5ned36SPZo3Fow6Nv7uxeS13kgZH+trgu0Riokwsbw=; b=zF5+EeZO5moCwP
	thDM5f7u/78WkVHFzPGtJ9W3IReKQZnQNF2lnPElxq7TYbam7Vkon+ASPuICuT6yWgwvwrLQPVLHx
	i88/xy/HwgroY6RrcMjMq/Gqmr2fc0hjzQBwA86+UTGBZonIKYsO+x2nwkgHxm/5PSmBLYRAorrKP
	HSvVzXcO0Pod4Sbwf++A3mNfzSWlMJ/TJkHXapmWk/MIcnA3Bn39pF4r/nv1QohN2PKNXO3d733Vc
	5MJ6138AJcjHcG5V7/bTlF6CZ877ZpM5+HovHQhTuu/vdHuXn7vGxCbWb9izf7AZi09oJ5A3AYkfJ
	CtdkoRWfE6sV4S4dfbNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWVoj-00CLFy-CI; Fri, 09 Sep 2022 04:40:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWVoY-00CL73-3b; Fri, 09 Sep 2022 04:40:27 +0000
Received: by mail-ej1-x633.google.com with SMTP id gh9so1231054ejc.8;
        Thu, 08 Sep 2022 21:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NOESYgoK2wMPdnD2YfaTrguO/djOwdOuUJuGX9ov7n8=;
        b=meNsPfiLywKgKFDDvhtxftkHvuDh/WiZHX2Z1dmBwtfDHgO36Nj1yVuy1IKmGlDU49
         /az6NEjYB5gLRkND+3l1hVhavoH/n1JLic50JLRBihmfW8Qi3mejmU83jCiGVNYTXZBZ
         DcSXrVGjF76nSlgBjF2/aAIzDp6/8NIKUJpdz5oSuA/vwh4qvBod/9sQIn/SAcRgtl48
         8bR1uYYfCukDI84yqsDymw8gY07hjgNoNCP8dBqcXbv3db1pwLkm1vmjeubjDVatD387
         cn+5BLjxfeBVd7JSUQrQg/ccKzX/tCZGEU7KIrXL3QKhlFTDUwFpg+YgVdZUQmtNWiPk
         vBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NOESYgoK2wMPdnD2YfaTrguO/djOwdOuUJuGX9ov7n8=;
        b=bDMGc8S8GPboUWjRyQPpnBbmI9/p1NBhSbdER0BKd0S1WklZXFhh1bx6JdnvqrhyzN
         iM7x/2g1QHo27mzmVQEgxgqSkr6iqX3o3JpKHJpZeX62FmwnDNh8y9GBCszsl/WrVXZ+
         //urykYpjo4ey8YKsrXXVObTo7fxYvbnFnVWVBGunNs4XbW4E56PEKw5UMkuuZSG/ebu
         DbU462WhlnXJ2AAtqKZHYiQSQaVaK/Z5n2dUq7VYANh8/QntaDtjuLEqGgDwXzNKHh9c
         ymgat0PAwp4J+34XGu/LATDcCRd1YU+aSwlDLn7gDirxPoQuDNV9FgNZVx3lSGQpACCD
         NRsw==
X-Gm-Message-State: ACgBeo062IivLDm9BAYFtZtT5nhS5w0guauhrN+t0YfTU6sj7KJ8WB+s
	qfGdYfFyJOCNMAxvrUC30l7mN1UzJ4h1zKWBG+k=
X-Google-Smtp-Source: AA6agR5ik0/CfPVi5GdwZMYYyFQwzDdtK6EYklLEoOGvER0iKkdIFE9toRIRoQmVP45iGah3ph7Sf46nDTUSkJyhO8o=
X-Received: by 2002:a17:906:8b81:b0:733:183b:988e with SMTP id
 nr1-20020a1709068b8100b00733183b988emr8401446ejc.457.1662698423278; Thu, 08
 Sep 2022 21:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-2-yangyicong@huawei.com>
 <cc68c8c0-0db1-1678-2095-54383c1383ad@arm.com>
In-Reply-To: <cc68c8c0-0db1-1678-2095-54383c1383ad@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 Sep 2022 16:40:11 +1200
Message-ID: <CAGsJ_4zajhnbt47HQHCyu7fL5Y-b3BOb8MSCb2kr2CfW+gC5gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] Revert "Documentation/features: mark
 BATCHED_UNMAP_TLB_FLUSH doesn't apply to ARM64"
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	darren@os.amperecomputing.com, yangyicong@hisilicon.com, huzhanyuan@oppo.com, 
	lipeifeng@oppo.com, zhangshiming@oppo.com, guojian@oppo.com, 
	realmz6@gmail.com, linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com, 
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com, 
	Barry Song <v-songbaohua@oppo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_214026_174135_0F7033A4 
X-CRM114-Status: GOOD (  25.15  )
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

On Fri, Sep 9, 2022 at 4:26 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 8/22/22 13:51, Yicong Yang wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > This reverts commit 6bfef171d0d74cb050112e0e49feb20bfddf7f42.
> >
> > I was wrong. Though ARM64 has hardware TLB flush, but it is not free
> > and it is still expensive.
> > We still have a good chance to enable batched and deferred TLB flush
> > on ARM64 for memory reclamation. A possible way is that we only queue
> > tlbi instructions in hardware's queue. When we have to broadcast TLB,
> > we broadcast it by dsb. We just need to get adapted the existing
> > BATCHED_UNMAP_TLB_FLUSH.
> >
> > Tested-by: Xin Hao <xhao@linux.alibaba.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> >  Documentation/features/arch-support.txt        | 1 -
> >  Documentation/features/vm/TLB/arch-support.txt | 2 +-
> >  2 files changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/Documentation/features/arch-support.txt b/Documentation/features/arch-support.txt
> > index 118ae031840b..d22a1095e661 100644
> > --- a/Documentation/features/arch-support.txt
> > +++ b/Documentation/features/arch-support.txt
> > @@ -8,5 +8,4 @@ The meaning of entries in the tables is:
> >      | ok |  # feature supported by the architecture
> >      |TODO|  # feature not yet supported by the architecture
> >      | .. |  # feature cannot be supported by the hardware
> > -    | N/A|  # feature doesn't apply to the architecture
> >
> > diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
> > index 039e4e91ada3..1c009312b9c1 100644
> > --- a/Documentation/features/vm/TLB/arch-support.txt
> > +++ b/Documentation/features/vm/TLB/arch-support.txt
> > @@ -9,7 +9,7 @@
> >      |       alpha: | TODO |
> >      |         arc: | TODO |
> >      |         arm: | TODO |
> > -    |       arm64: | N/A  |
> > +    |       arm64: | TODO |
> >      |        csky: | TODO |
> >      |     hexagon: | TODO |
> >      |        ia64: | TODO |
>
> I believe this patch is not needed, which explicitly reverts an
> older commit. Instead when ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> framework gets enabled on arm64, the same patch could just drop
> 'NA' as possible values for arch support for a give feature in
> file Documentation/features/arch-support.txt.

Sure. it is certainly ok to fix this in
arm64: support batched/deferred tlb shootdown during page reclamation

By a separate patch, I was trying to highlight that my previous patch was
wrong. but, yes. it is not fundamentally necessary.

Thanks
Barry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
