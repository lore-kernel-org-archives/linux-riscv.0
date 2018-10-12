Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC664C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 11:37:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FCE52087D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 11:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SllYwGY+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="sLllf+hm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FCE52087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01zWhMuKXDE1FJM+0lV7r5Y3GfKIAsR8qJcXuEk97bo=; b=SllYwGY+1dRQkO
	xE2mIt7SwEV8WASpB4rlEDiENuoW8GavIjquURa2pZZHIQtn/37yEhS1OkzEhDNO/Y5xYjF8BVDqA
	jIYFv/fl4/HOwxUrbZJSv3P6fQRVrplPVUKJzwCbX7F+qSthihUglh5IuSQFNtT2IwJsSnvDAi826
	ULNcWAd9h1xu88cVRHXHElODTyJMuqO/aN4btER6DNDU1TUYGl8vKs0BJyznAroM3bf1s5l46j69I
	QSbngV/+keIl3o4oiP0SwyR4NxxR8O9fza5aDQrg6zQgEaxpeIdMmbQPDRRwmMHLbZmzopAFGr7tg
	mkshKVbVBMuHr3/scEIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAvkp-0002LP-6t; Fri, 12 Oct 2018 11:37:15 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAvkb-0002Gn-E0
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 11:37:12 +0000
Received: by mail-pg1-x544.google.com with SMTP id f18-v6so5746215pgv.3
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 04:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RUBKeYPll4jMLSN3Gb+udTJXKfzopX9w+dug7aYTr/k=;
 b=sLllf+hmYeVdtEKLgpvUk4uo/R65gqQ2L7zDPqofo15O4TD2lqqZ48BnJii3zNLrzj
 NyrHzrmlo5M8BFAgDiAnDSzFkH/4pCMx41PDkn9KakXzyWFHzbatjJl7tG6M3QlRWbCb
 PxniswSJvBlL+/pLj7KZtuZCCp2I33/xGPiDrmpqGjXDRkvRlkWGmyBycB9Rzb7E6Zs2
 L7OGkByZKFBctGsWJmvbk2lLkFhYwnI954eYYA9mDD2xDlJKx5AIfd14wPbV5Zu/imuW
 2GvR+0yYrS49d3VwMQPPTufF89rOzatfQb3FsyMC/zTNqHmMQ6U+r5c6uWOkB0vCTRFN
 mXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RUBKeYPll4jMLSN3Gb+udTJXKfzopX9w+dug7aYTr/k=;
 b=JLlUkoKhDwfEMkxkHMoiHHgEDhmk+4RTs0br9cL5Xfc3FOnZpHxRbY7Sad1/xhTSAz
 p/vtWusBD/QxyjngzcG8MpDYy6k3pv5+2pqi4d6gbQwN2X2R8q92KKhz2IVKEKOPrcot
 kDxqxtu5aIf8RtkX1EI0i6PxpW9z1p9wFAQAvkYUtbNZIVHxi6gt+dMwBmETPbIZlbYc
 gsbfSN/rX64s6thugrebjzUyqfPWKPwuXebYs86IIrSH9/P12q8/8P2eTFstOFXXw10h
 Z2aYlQq9FXyD2CIpeTNmeLs5ITYRMV0lzMVEkCOCpx7jZ9Q5fP2GrrD4nzkcuTJoMDnJ
 7ncQ==
X-Gm-Message-State: ABuFfoijMMZVL9kGwrWePzJAcj6GpCD8NlppqWGA4tcSwEswxC7XhBG7
 SuZwUwdHMRjaJbmXei+3oee32w==
X-Google-Smtp-Source: ACcGV60LchXUm+4bueEbZ+6bNEGISqX12eR/mS25M3eC4m93W+yAf1Gp0Al5g3J7F1KCwHaUiWlf2A==
X-Received: by 2002:a63:2a11:: with SMTP id
 q17-v6mr5201085pgq.374.1539344210379; 
 Fri, 12 Oct 2018 04:36:50 -0700 (PDT)
Received: from kshutemo-mobl1.localdomain ([134.134.139.82])
 by smtp.gmail.com with ESMTPSA id o2-v6sm3561853pgi.62.2018.10.12.04.36.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Oct 2018 04:36:49 -0700 (PDT)
Received: by kshutemo-mobl1.localdomain (Postfix, from userid 1000)
 id 60154300030; Fri, 12 Oct 2018 14:36:45 +0300 (+03)
Date: Fri, 12 Oct 2018 14:36:45 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Message-ID: <20181012113644.meqy5yb3xrxyh6lh@kshutemo-mobl1>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_043701_529387_754B6E1F 
X-CRM114-Status: GOOD (  10.42  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 mhocko@kernel.org, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, kvmarm@lists.cs.columbia.edu,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 linux-parisc@vger.kernel.org, pantin@google.com,
 Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 minchan@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012113645.ldDDaXCKKxOpTbUPkzdF9pxIZUGmB1MMZ93jmXHvEa4@z>

On Fri, Oct 12, 2018 at 02:30:56PM +0300, Kirill A. Shutemov wrote:
> On Thu, Oct 11, 2018 at 06:37:56PM -0700, Joel Fernandes (Google) wrote:
> > @@ -239,7 +287,21 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
> >  			split_huge_pmd(vma, old_pmd, old_addr);
> >  			if (pmd_trans_unstable(old_pmd))
> >  				continue;
> > +		} else if (extent == PMD_SIZE) {
> 
> Hm. What guarantees that new_addr is PMD_SIZE-aligned?
> It's not obvious to me.

Ignore this :)

-- 
 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
