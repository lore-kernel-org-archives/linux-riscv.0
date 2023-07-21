Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EC2EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YztrzZ9uPXeX4rI5cWcI1JInW3Frp2JbqNViNAd5Cws=; b=eqvkWdGdXqH15R
	nDBPl6Fl5HZ1LTH1UcPBzUMFL2u1WhGHcxXA1WKEFIBNhPekFppBXmYXT449411rwh6bDTzgg0x2b
	oI5vaWAEOyBcbaedWvt+Hn26LscIc+/AjkNWJJUBXVz+rsUorVQAY2i0QnNt2j1q7rPaGwKBTnZ05
	RMBI6zXi2zxQLLcO2IVm2qhaiGmIWOKQAgF9CofL4mLF1TpSQ16qNLxdpJa2j7P3w/yly8SJq4I4F
	iGrJkH3R+jReJ7BTrpKAkG1lX4kpygfhcfC+1NJ5U9d8qXiA3OrVK0iMsSqfG85n5/QrJGCWiIL/4
	qLxfz+fqOri1Sf1eIUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMktp-00DErU-1m;
	Fri, 21 Jul 2023 07:50:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMktn-00DEnV-00
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:50:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b8ad9eede0so12537825ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689925795; x=1690530595;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H1ENu5fF0n6ZOjOvJS+N5uNT6+G56GtxxuoyGCp7XQY=;
        b=jF/0bHVO4mXBlBC+Od3xXUGebXVeXvcdMegNuC5nVzqZQfwhItEdojUNqEQVFE/t/a
         M9z+pQ9qlMG7OYH4ZY5+vh7XQvkwzszZvDslr8ZRDB0i1AZmVlxF7sh+ulG77yWhnkUe
         mK41/Fozgz8bDHGvkLpR6TL+8lgkEk7i6PPzrOBBaO+nq5FDAu3fBr4JDz4EusfFb/6k
         dgFjsQZm5e/9Q4hDIjQV9u414FdakrPXH6vRH4DH101VPf09p5t0DVxNHPj99KlEPyzC
         66COql70+25eWx2iNJKqgz78O9/FFXE9PvoqrQ4urI/TdAuT8kk5N/LOWlcVnyK8SVVK
         x3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689925795; x=1690530595;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1ENu5fF0n6ZOjOvJS+N5uNT6+G56GtxxuoyGCp7XQY=;
        b=Q4KBTbMsO58Zvz2bztRysizHlxr+acOj1v64TodepuSCZMJfl5ZFhNvYywgxDbVb3L
         zr2mXy35154OvOC4ptDFjJ1y2yq96h4RQER4vUCo/2nj2v/LUlWbfKixJA0vJB20eHI3
         LQV01XqHfp7sqqPilEPWfFbtWuHBkAoiy8MFSeh2fDDcsFBp1WqC0z7zb7QYp9p3aKpX
         WgztmUJmLQaocwU6CDoEaEYKAciY8upPgnaSWm504JdwUYQPjox47jvdkal+TOd3QS56
         IN53xlvlj96RVUPKMLiLaqhO1A0USAaiQrmUlNuLevvQzOse123UCZYKT3fStynB7MyJ
         sVdA==
X-Gm-Message-State: ABy/qLbwh0Up/F9dzHoaHxrFfLOPG9CrSdP95MXmX+I5c746wyIPAFH9
	iQvzxXjSYusKdKupimAXW1pvww==
X-Google-Smtp-Source: APBJJlEiX91AUW7P/S6fgZTkfC+SCqUVqpq3WIcgem0ZonkoRSojnm3tdfO2Ok/CWmjaFU8KLeO9cw==
X-Received: by 2002:a17:902:d4d2:b0:1b8:e41:f43f with SMTP id o18-20020a170902d4d200b001b80e41f43fmr1475695plg.27.1689925795580;
        Fri, 21 Jul 2023 00:49:55 -0700 (PDT)
Received: from ThinkPad-T490 ([2401:4900:561e:c0ad:e9b:57a0:e5ae:a70c])
        by smtp.gmail.com with ESMTPSA id x15-20020a1709027c0f00b001bb4f9d86ebsm2770222pll.23.2023.07.21.00.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:49:55 -0700 (PDT)
Message-ID: <5972345a0a5780234bcc9b2d88e97e7eaa839c68.camel@ventanamicro.com>
Subject: Re: [PATCH v1 1/6] RISC-V: Detect Smstateen extension
From: mchitale@ventanamicro.com
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Andrew Jones <ajones@ventanamicro.com>, Atish Patra
 <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>,  linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org
Date: Fri, 21 Jul 2023 13:19:50 +0530
In-Reply-To: <20230719-egomaniac-precook-adf506f2a141@spud>
References: <20230719160316.4048022-1-mchitale@ventanamicro.com>
	 <20230719160316.4048022-2-mchitale@ventanamicro.com>
	 <20230719-egomaniac-precook-adf506f2a141@spud>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005003_047790_40EF5377 
X-CRM114-Status: GOOD (  15.07  )
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

Hi Conor,
On Wed, 2023-07-19 at 17:27 +0100, Conor Dooley wrote:
> Hey,
> 
> On Wed, Jul 19, 2023 at 09:33:11PM +0530, Mayuresh Chitale wrote:
> > Extend the ISA string parsing to detect the Smstateen extension
> > 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > diff --git a/arch/riscv/kernel/cpufeature.c
> > b/arch/riscv/kernel/cpufeature.c
> > index bdcf460ea53d..41c3aefcc53f 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -301,6 +301,8 @@ void __init riscv_fill_hwcap(void)
> >  			} else {
> >  				/* sorted alphabetically */
> >  				SET_ISA_EXT_MAP("smaia",
> > RISCV_ISA_EXT_SMAIA);
> > +				SET_ISA_EXT_MAP("smstateen",
> > +						RISCV_ISA_EXT_SMSTATEEN
> > );
> 
> This easily fits on one line & "smstateen" needs to be documented in
> riscv/extensions.yaml.
Ok.
> 
> Thanks,
> Conor.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
