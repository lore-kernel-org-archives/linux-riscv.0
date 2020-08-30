Return-Path: <SRS0=+nUN=CI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED7FC433E2
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2020 07:54:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 792142078D
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2020 07:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jBE6fSfX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBuiYpmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 792142078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MJ2BWzI5ZzcyavIdrImjK53eYcb+BMLJqYcSDSfqOvk=; b=jBE6fSfXpHXBdx14c6vBxkzuo
	h/4IrEbQwsSttCsLY9H9DikLznT/MgzyYfixPu1XMHZgXgUXeuyj7YDyLCj/QjIvXgBooSYgDCp4Z
	vcmioR251eMidb5swEEJTDhkv8mRx63JbAUD59mHVW48RxiZJ8ecZtKVQA8WBsZ2VXWUKsELyYkzR
	4/86WEAXs/zmxzHA7/rYzByPSPeiNbcp/cDKn8v0dTKnJrOzaFEBxzktVt8P9s9aBhvaCCNf8efOt
	JaZs/Pg2F0mwq+i8+34CKN0rpolfuHJ+09K20ICcRxgE7+2tj07W07dc1/YrdVQ9RLVTNXqXLqvFo
	VkDIE5yig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCIAE-0006sT-Bj; Sun, 30 Aug 2020 07:54:10 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCIAB-0006s4-BS
 for linux-riscv@lists.infradead.org; Sun, 30 Aug 2020 07:54:08 +0000
Received: by mail-ej1-x643.google.com with SMTP id a26so4508833ejc.2
 for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2020 00:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ohDVHll9uNXquWg/6LUDMQsitXnSxjQWS4MTv84+k88=;
 b=QBuiYpmuSQYBHZAZ/Jw90PmwEpkYyjbmSDHyKKMSCvR+m5CDksZFiIlevVBV9sWL/4
 MP+Zax0lFrV/IHMEUdh4dUAHlzjeDQLkUkR0u8Y6sXFQoIN0VHVZpdYdUheaDZJGlpjm
 8sE0aB9CECoGkPE1b9MzbVkl73XJMvYbOt22NsLUUBjIH6kT/BMME1GgzWWMPT04oeiu
 rhx2ANl/3qjBrRw4uNoq3y99SNpOpEC3qFSnEIqdb+Uagao8KnmQa0BqiJ9SQbRmi1Zf
 JTNC+24bWm5BM2tzrhdSnVJCVbod5V5faiEJefafnudd/v0OvTrreWIBk/CcEc28UhQG
 PXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohDVHll9uNXquWg/6LUDMQsitXnSxjQWS4MTv84+k88=;
 b=HTzHADj3SUW4vZ+B+I3M3e9boahFiCq63FeITrdfF3zLCr+WDQ4IxVxMDrRwH02IXx
 PnmHrBBpHgXHQL3JbfDi7iGGbxcf071fhsAvRjCrjBBztqwZLnFYWM5Fx1xvPOE0/Kaw
 uYq8Krml77wqJaWYmsFqJJyZbs+YzK1TiDNez716QwjE4kmxof/1v93/ZRuJmEMIyGMq
 m8vPvfpRTXeUotusaRgNoMvu0Cql+6f3kSQjdvxXBITXAuzDoxTgAYXBc8RNRApzDnKi
 cnrJEDWBpW32aSROmXJSrivLgzG4CFTzQjJy+it7YcvJz9NBOa9ZX90I7UnIMA6So0Ej
 9lgQ==
X-Gm-Message-State: AOAM533yI7JDjtn0Qnlc3etuL0+5BjSSDby/o9URfP2MXi5Wacn6kwxJ
 Ff3eNRu8Qggrr3xzbe9FdsvnQpvmIVCAw7ywpaI=
X-Google-Smtp-Source: ABdhPJxJOKBGQIwl5zr92GkAxuJ/JNXh2osmS0VcZOhDmNUCHlcHZq1jn722dLnsh0dgRyK7pglsCsJpCWAKFf/1r+A=
X-Received: by 2002:a17:906:bb06:: with SMTP id
 jz6mr6991256ejb.248.1598774042143; 
 Sun, 30 Aug 2020 00:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598598459.git.zong.li@sifive.com>
 <3f1f693147f0b62f19f4a44b8e8ef3d5bde23352.1598598459.git.zong.li@sifive.com>
In-Reply-To: <3f1f693147f0b62f19f4a44b8e8ef3d5bde23352.1598598459.git.zong.li@sifive.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Sun, 30 Aug 2020 10:53:43 +0300
Message-ID: <CAOJsxLHOvvt8WGQUynGkLxZCA4OQQ+KgxxJJD7s_iP8Pxf-Omg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: Set more data to cacheinfo
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_035407_436340_AFF11EF6 
X-CRM114-Status: GOOD (  19.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: david.abdurachmanov@sifive.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, LKML <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, Aug 28, 2020 at 10:09 AM Zong Li <zong.li@sifive.com> wrote:
>
> Set cacheinfo.{size,sets,line_size} for each cache node, then we can
> get these information from userland through auxiliary vector.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 59 ++++++++++++++++++++++++++---------
>  1 file changed, 44 insertions(+), 15 deletions(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index bd0f122965c3..8b85abfbd77a 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -25,12 +25,46 @@ cache_get_priv_group(struct cacheinfo *this_leaf)
>         return NULL;
>  }
>
> -static void ci_leaf_init(struct cacheinfo *this_leaf,
> -                        struct device_node *node,
> -                        enum cache_type type, unsigned int level)
> +static void ci_leaf_init(struct cacheinfo *this_leaf, enum cache_type type,
> +                        unsigned int level, unsigned int size,
> +                        unsigned int sets, unsigned int line_size)
>  {
>         this_leaf->level = level;
>         this_leaf->type = type;
> +       this_leaf->size = size;
> +       this_leaf->number_of_sets = sets;
> +       this_leaf->coherency_line_size = line_size;
> +
> +       /*
> +        * If the cache is fully associative, there is no need to
> +        * check the other properties.
> +        */
> +       if (!(sets == 1) && (sets > 0 && size > 0 && line_size > 0))

Can you explain what this is attempting to do? AFAICT, the if
expression can be reduced to "sets > 1 && size > 0 && size > 0", but
what do you mean with the comment about fully associative caches?

> +               this_leaf->ways_of_associativity = (size / sets) / line_size;
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
