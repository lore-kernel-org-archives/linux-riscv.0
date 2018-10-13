Return-Path: <SRS0=D72f=MZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16399C6787C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 01:35:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF78320895
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 01:35:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PTpYhqet";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="t/bdXm4a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF78320895
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUQGKrvVUUaWnZBjOp32sepx5VyRGCnlG4I4KPzpqvk=; b=PTpYhqetaHeAqL
	pDw72+OR9QImLzyTcpNW1DL9GfGev4XUJE6zQ9uxnolYrBM6YI75b7YkqtoiBmEWbQUB5e71Us6Gj
	0SN8rOm3SZiUXSQVPYDvGRxOKELrMYIANvtvhGT7bDDAHLMBCAc8wOkDqf+SrtdetUC6cMcLKJdnZ
	saEGkOX7bINMfymWmO9T3nM+KIqWn1rPsUlEHU7IVGXVuKedoRqnREGq0eHsI8K47L1QxktGpbyHS
	jD6IePRv+8sJrPcOBBhqQLG/akDAoWg98JkHZaCjC5lhdETFeBmhYxdLPxqaT/RIIMdTXXCU5sgmO
	sYfAo1KavBRj4IKVu3JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB8qT-000659-0d; Sat, 13 Oct 2018 01:35:57 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB8qP-00062z-UD
 for linux-riscv@lists.infradead.org; Sat, 13 Oct 2018 01:35:55 +0000
Received: by mail-pl1-x643.google.com with SMTP id f8-v6so6697350plb.2
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 18:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WNSmz6gPUWl0psy6VYdrKZKj8jjeGLoBOEaYk7PTF5E=;
 b=t/bdXm4ahfHUsC1W/kmIGtZM4IaaXFvhptMHyl/MsEl85wogOLcBRPLXwHtXoa2xTR
 d2M48uB6euL4d5IaKV5t6nT5ABUr0y0qRBKJlUNuiclAcNB1bktYaPSMWAk89SYK1P2v
 +doypv+PPbaJGW2yXU+EaPjAWnWnd1ZXLhamE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WNSmz6gPUWl0psy6VYdrKZKj8jjeGLoBOEaYk7PTF5E=;
 b=CuO+GvDgVXCjKRgigH2ExTmA+tGoDvTQX7zcnlIzzK8BzWb6s/0OEIMAMluaTQHXFo
 COTG3sTAQGNgwIjc/56ro1i4gNtenynHpL11waDD1mb7UD1u4DIAmxJpxfh67kTG1Onh
 FKlZNmn+2+7NniFnPbUQcdAt0RZVKu//Ltyiw1z5Gx19/jOXMXNPwNTXJ9QF1BqfmvmL
 6DasJ92qHTEdOg78pD7o1/alhx0YxwpTVSh1hTDJY5BPDbzymb1eCLx42O0jtlIXzlJt
 X7OaHujycmZ4liLa5GCBSMe6ucd6DEO5zx+UrqW2lTUcowXN0FGyD1Mr8nLaQv9AXQD2
 999w==
X-Gm-Message-State: ABuFfojz8MaxzshridzuVt+XctdUx0l96odT+HV8hTflU95M3/6QjFfJ
 Gtzck7flLeHvyMHrJkxRxr0I0g==
X-Google-Smtp-Source: ACcGV63YcGHLeWFH+zMcDfPGfwOAvPK81iWmstN1Bsc/dCjm29V/T1DgWrxlTjwp6QBDN3hA/VReOg==
X-Received: by 2002:a17:902:d20a:: with SMTP id
 t10-v6mr8118444ply.256.1539394543039; 
 Fri, 12 Oct 2018 18:35:43 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id 20-v6sm3688934pge.77.2018.10.12.18.35.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Oct 2018 18:35:41 -0700 (PDT)
Date: Fri, 12 Oct 2018 18:35:40 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Message-ID: <20181013013540.GA207108@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
 <20181012125046.GA170912@joelaf.mtv.corp.google.com>
 <20181012.111836.1569129998592378186.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181012.111836.1569129998592378186.davem@davemloft.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_183553_994509_936838C0 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, mhocko@kernel.org, linux-mm@kvack.org,
 lokeshgidra@google.com, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, jonas@southpole.se, linux-s390@vger.kernel.org,
 dancol@google.com, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, deller@gmx.de, hughd@google.com,
 jejb@parisc-linux.org, kasan-dev@googlegroups.com,
 kvmarm@lists.cs.columbia.edu, mingo@redhat.com, geert@linux-m68k.org,
 aryabinin@virtuozzo.com, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, fenghua.yu@intel.com, jdike@addtoit.com,
 linux-um@lists.infradead.org, Julia.Lawall@lip6.fr,
 linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org,
 nios2-dev@lists.rocketboards.org, kirill@shutemov.name, gxt@pku.edu.cn,
 chris@zankel.net, richard@nod.at, linux-parisc@vger.kernel.org,
 pantin@google.com, jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org,
 minchan@kernel.org, linux-alpha@vger.kernel.org, lftan@altera.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181013013540.zhw7pjSjxg_Yzfa-wrqun3Ju9Sz-LXVTIifv_9oNCEA@z>

On Fri, Oct 12, 2018 at 11:18:36AM -0700, David Miller wrote:
> From: Joel Fernandes <joel@joelfernandes.org>
[...]
> > Also, do we not flush the caches from any path when we munmap
> > address space?  We do call do_munmap on the old mapping from mremap
> > after moving to the new one.
> 
> Sparc makes sure that shared mapping have consistent colors.  Therefore
> all that's left are private mappings and those will be initialized by
> block stores to clear the page out or similar.
> 
> Also, when creating new mappings, we flush the D-cache when necessary
> in update_mmu_cache().
> 
> We also maintain a bit in the page struct to track when a page which
> was potentially written to on one cpu ends up mapped into another
> address space and flush as necessary.
> 
> The cache is write-through, which simplifies the preconditions we have
> to maintain.

Makes sense, thanks. For the moment I sent patches to enable this on arm64
and x86. We can enable it on sparc as well at a later time as it sounds it
could be a safe optimization to apply to that architecture as well.

thanks,

 - Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
