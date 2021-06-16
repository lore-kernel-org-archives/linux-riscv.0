Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BED7C48BE8
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 18:53:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 648A4613C2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 18:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 648A4613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFAWPncdGR/H9TCoEXPq8Z23Hq7QeMnRcqbxc1XEDVc=; b=MIjeQcQ0/K/jk1
	pvSiCnWtf+wtzbRnlYQMtQDS1sL+g1CMyaKW+mZzYjS2ibG+sJlb9E2Fin8l9mrNzlN6Sd9EA8csg
	1Oo/I1v2YcxRNOuTvgdbqK9g6C2HP1gXAhtHx9t2yScPLU04jZL2Jivvz/9EYftsKLomMX6Dn7Tk7
	XUQCTFfmQQ/a2rTx2mlJia75DsNXhXdkHEVL9Uc7/HqNiMeycz6Z1VJGBxV3ehU+wwXYZszazXgCN
	rO6BVUEUOpgEQocxHrXk7JscoqZsixGyFv4UGwhKUTG9igGeDTvXmstBEX7vs/IFKIZfnrhQdnaC4
	xoMmAyiBe/8RT0P24nqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltaek-007SWb-Ig; Wed, 16 Jun 2021 18:52:54 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltaei-007SVu-BA
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 18:52:53 +0000
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3450F20B83F6
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 11:52:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3450F20B83F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1623869570;
 bh=rYJD4cBG4CEPoLnWdqiYM4HuZXVnGRaKOU6m/YkZifA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=akaKzAH14Q5cfSsaQe5MAfT+HU+9bU7yDZ1IavJWmRCRwbI9fkfO8hll3j+cUr6NM
 qPDCwQRYlpb8oHYWTaucsJLQ2fDZjoWJuB5HCnY/P53X6iLScTa3jKYckyawGmwZ75
 9Ppouaulgc8S8TBQ1Do2QAWq5jdf3f+oXffIDdkk=
Received: by mail-pl1-f177.google.com with SMTP id h12so1587034plf.4
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 11:52:50 -0700 (PDT)
X-Gm-Message-State: AOAM531Ph7bXy/v7EwuRuRpxyEMby49QTR1pgr9ypnzRPfWwaF+iHNYE
 JtVTSbDGXTYbO0dJfxYkJSjzYcSJnp1ioH30GO4=
X-Google-Smtp-Source: ABdhPJyyWuopcbCWOsO0GJU76XEW1aKeFZlbubNuh6Kr6/8+/OZoAm8ypz7lE/h+CigtdKqhxy0qyAvQlapQgjB1/Qg=
X-Received: by 2002:a17:90b:109:: with SMTP id
 p9mr12340022pjz.11.1623869569699; 
 Wed, 16 Jun 2021 11:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <CAJF2gTTreOvQYYXHBYxznB9+vMaASKg8vwA5mkqVo1T6=eVhzw@mail.gmail.com>
In-Reply-To: <CAJF2gTTreOvQYYXHBYxznB9+vMaASKg8vwA5mkqVo1T6=eVhzw@mail.gmail.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Wed, 16 Jun 2021 20:52:13 +0200
X-Gmail-Original-Message-ID: <CAFnufp1OHdRd-tbB+Hi0UnXARtxGPdkK6MJktnaNCNt65d3Oew@mail.gmail.com>
Message-ID: <CAFnufp1OHdRd-tbB+Hi0UnXARtxGPdkK6MJktnaNCNt65d3Oew@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_115252_445143_9D44B337 
X-CRM114-Status: GOOD (  11.61  )
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

On Wed, Jun 16, 2021 at 1:46 PM Guo Ren <guoren@kernel.org> wrote:
>
> Hi Matteo,
>
> Have you tried Glibc generic implementation code?
> ref: https://lore.kernel.org/linux-arch/20190629053641.3iBfk9-I_D29cDp9yJnIdIg7oMtHNZlDmhLQPTumhEc@z/#t
>
> If Glibc codes have the same performance in your hardware, then you
> could give a generic implementation first.
>

Hi,

I had a look, it seems that it's a C unrolled version with the
'register' keyword.
The same one was already merged in nios2:
https://elixir.bootlin.com/linux/latest/source/arch/nios2/lib/memcpy.c#L68

I copied _wordcopy_fwd_aligned() from Glibc, and I have a very similar
result of the other versions:

[  563.359126] Strings selftest: memcpy(src+7, dst+7): 257 Mb/s

Regards,
-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
