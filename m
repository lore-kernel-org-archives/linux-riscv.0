Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C864CC04A6A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hugnz0WSWcfUofAKLE16vbHNmueECeguRnu6NQMOCck=; b=lqRR6u7zVMeW8/
	x62+q9kJVAZW9vT52qTHAlCf03bXecmhCy6T3w5svavfd32vb5ERsilj2+rM4WofykHkW2Dvk6poH
	fHFghXOgs/Ku8Wke+YVTK9AjH3kVSWJ+JRgadCLLB/FXi5Taw+lE3uvUyWNZrdtMQa+qtxtx0rVxA
	NovzCXKsDzPF0Eqvo8KoNLG+2W/PluFLOhoD6BolHSyces+Wl41hZwmW/ENOBL0380tlB+AW8DuNu
	OmFOF+Qldhfzc/q9pj1Q6CcDXSHvUI3BT8UinQqbRMIHCMv8Ay/sOfREz8d3bX7AgfRC10Z4rcJcg
	AiRivMMtTbNN2R1/3aGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXxi-00HCcI-0r;
	Mon, 14 Aug 2023 13:50:26 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXxf-00HCbk-0L
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 13:50:24 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99cce6f7de2so592501066b.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692021020; x=1692625820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h8OPGW4e9NC10NDchxEU3Fww0ji4s/MwbD4JKceGo9s=;
        b=exBtjx4plgLrWpWvDxnmoIel44QiimXMrb6ED/7yZfOQRpxhsLNrBpBXFp2jPsB5U6
         kSKfOAKyxYO1lu30RA0c9EA5A1Z37MAtxrjn36oOJ1BOQd1C8z57xn5JeEWHAbPkwP9M
         JpbDtB8rsNXAK2p/IRNrSTNRTWkpWFyWAHVN7iQIO3xqQ3xnV9Ml8c9flASnvkGgY8Xz
         GBSwJCHigbIeOWjYQA2Om6aKkHgiYMkFYwjz6FVv0bcV26Q7ABzJaa/YxcyV3knNybsI
         o8HY19mbC6HJfGpQDUbb5pyvebnj248zifKggn8fG6CTZVloCu/rGCnkqaI6QSnDWGnI
         OylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692021020; x=1692625820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8OPGW4e9NC10NDchxEU3Fww0ji4s/MwbD4JKceGo9s=;
        b=fcNxu8ckomdzNbF+RHuweCCwitkFeSJT+3HwYJ64uc+++voTyXO9vaxsRe8V+uXv71
         WWgs7KexJc0XyiW7L7yTAmuIAEgoqom3giT6+2zpfeP8KqUL3whPsOib3IIwFYLVB13C
         Vs1KWr5ZWenUIO2/nZa4blV0jfbny49x9LfINujE5FQXdHL4CK0rx/Xuj7VgdDMP0dKU
         GkwsFzmAuX0UlykCBoQ0tG0f+J878mCpRRZpjdZM6BbED9cxP+JdfmI6SAx/iB8WOv+E
         blG1g91peshnQv4dXFbU6rw0TpHY/WaMA4wu0L/egCJzZaJvJP1Dc1wj3wjgvpfZX5yo
         75Qw==
X-Gm-Message-State: AOJu0Yzjpq9s3isp3J5eD6307TitIQ/WT34zoKYdaH5aRzB9f5ZvdFF+
	53+2VNRPv/rfg554tWCoiuo=
X-Google-Smtp-Source: AGHT+IHJhOwE/X/OVV6jGMjthjGfM8VwDblBa+ZweMorP0hfzZ3t7EMvei4rkxHqKxKUcdJAeHFAew==
X-Received: by 2002:a17:906:5dc1:b0:991:e24f:b288 with SMTP id p1-20020a1709065dc100b00991e24fb288mr7303027ejv.26.1692021020280;
        Mon, 14 Aug 2023 06:50:20 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id d2-20020a170906640200b0099d0c0bb92bsm5656966ejm.80.2023.08.14.06.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 06:50:19 -0700 (PDT)
Date: Mon, 14 Aug 2023 15:50:17 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: test code for kprobe
Message-ID: <ZNoxGXcK9QOfAfbW@nam-dell>
References: <cover.1690704360.git.namcaov@gmail.com>
 <fc71730b9350026427fe1c2bdbce9b993d8bc6f5.1690704360.git.namcaov@gmail.com>
 <87il9hg65g.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87il9hg65g.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_065023_149122_A2D2E571 
X-CRM114-Status: GOOD (  15.17  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 14, 2023 at 02:28:11PM +0200, Bj=F6rn T=F6pel wrote:
> Nam Cao <namcaov@gmail.com> writes:
> =

> A RISC-V specific kprobes test -- much welcome!
> =

> Please add a proper commit message here.
> =

> > ---
> >  drivers/test_kprobe/Makefile      |   3 +
> >  drivers/test_kprobe/test_kprobe.c | 265 ++++++++++++++++++++++++++++++
> >  2 files changed, 268 insertions(+)
> >  create mode 100644 drivers/test_kprobe/Makefile
> >  create mode 100644 drivers/test_kprobe/test_kprobe.c
> >
> > diff --git a/drivers/test_kprobe/Makefile b/drivers/test_kprobe/Makefile
> =

> Architecture specific test code usually reside in "arch/$ARCH"
> (arch/riscv), and is part of Kconfig.debug.
> =

> Have a look at:
> * grep for ARM_KPROBES_TEST in arch/arm
> * grep for KPROBES_SANITY_TEST, and in arch/powerpc grep
>   test_emulate_step
> * grep S390_KPROBES_SANITY_TEST

Sorry that I wasn't clear with this: I just wanted to show how testing was =
done.
This is not meant to be merged.

I do have plans to clean this up and send upstream in the future, but not w=
ith
this patch series.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
