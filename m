Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B544FC6379F
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Feb 2023 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uAKkT9OVt2cWa0PGOnYI7XZgYYyd3iNjQqH4LkZdMA=; b=GccqnfRuqjW6y+
	dPAx33vkdoujbhavX0+9FO2GZ2xywo5frvF6YaxkMRcc+s6ejxm+4p0yO4tAWI0MxKJuuEzbvGOFM
	2TYh1cQN4ijEd/o6i5g21rlWxuAglgJtApOzWMU9v95kzB+KPzsyUDPYMooN7FdC8MGAvud2O3IxG
	6LyiD+Jd4vI5f8DyLCfRuluYJ3sCrcDHDiVtzuqSWp4z+96zG+YNvgq/XphcR+y4Ef2hTaXIQ4hDd
	WZJBBF0lDhyFX7qFayHNMpnzaSSmlUIOiJyV3QV7lwKe2mpFst9NRAqYXmCocHLr2oBi7A+ZQQxqo
	YWurcWPDlbybdnk/Q3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTqUQ-002GlA-K2; Sun, 19 Feb 2023 20:40:54 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTqUN-002GiD-08
	for linux-riscv@lists.infradead.org; Sun, 19 Feb 2023 20:40:53 +0000
Received: by mail-pj1-x102a.google.com with SMTP id ot9so1292367pjb.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Feb 2023 12:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lqAwlutC29lMR1tf1e4XOcfdxhypv9zb0T2DcQuJ+3c=;
        b=XSbexFaS+Tm+Fh9bIb5+7TsH8cXc/OyRJvw9NZqY53ctg5O6XlonIQ+mSxQEFs9syE
         lUVQj3khdSe3Fc3LpOxcyIdBOEkgeUJK3z40Fm415uv701QNzTtbevYXP5ioH+guMWrP
         r7f7SjRms7JvKdWdxLsJL7avrtKIOQCRDQ1xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqAwlutC29lMR1tf1e4XOcfdxhypv9zb0T2DcQuJ+3c=;
        b=QWHGSLgH+gXdwsvHGyKVamcG3f3LuUUr9yrRwrGHhFHVs3qv5kJNF3/ewNm5k/p/hu
         6odUHp++bNoizIsn/SxLfqihiaK4RHJDFAgEatDlaTwEvpaVnu/GCaXzoM7vgmNnUGhe
         Ibgb1dJTbbLYABlLlrskMIvaDslhjHXQrsmhC9d2uP3W+2wGzy8p6+PqjgXGcyoCOVZC
         x7Uvjgy6QAl+k1uzoXUZxSSOX8FuG2bbsgUKskz3wu/PFMuSvMXoaBNw1hkIXQiqutvb
         8qX4TDiEvCA623WLAD6xPclEcPl3VfAqzFbM06IJCPdymjCMsZqpA9RHVobwlQRiTo24
         zX5Q==
X-Gm-Message-State: AO0yUKXkSyL8+gciU0YPZbYcpLIkoT5+FbODlqHnDjCwKVLo7nE2agoT
	ALM6QHYaAe0JREfIrhqG9QGMpw==
X-Google-Smtp-Source: AK7set8cjnk+CNzhzKm/hjA5DP1TH7rqpGSr8BvS/qmpfvVklVJ20vp+KwvbQWrpg9WzBslEVX8M9Q==
X-Received: by 2002:a17:902:d4c8:b0:199:30a6:376c with SMTP id o8-20020a170902d4c800b0019930a6376cmr2895713plg.68.1676839248964;
        Sun, 19 Feb 2023 12:40:48 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902c21100b00199190b00efsm6372235pll.97.2023.02.19.12.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 12:40:48 -0800 (PST)
Message-ID: <63f28950.170a0220.3759b.b525@mx.google.com>
X-Google-Original-Message-ID: <202302191240.@keescook>
Date: Sun, 19 Feb 2023 12:40:47 -0800
From: Kees Cook <keescook@chromium.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
	Balbir Singh <bsingharora@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Florian Weimer <fweimer@redhat.com>,
	"H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Nadav Amit <nadav.amit@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
	Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijiang Yang <weijiang.yang@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	John Allen <john.allen@amd.com>, kcc@google.com, eranian@google.com,
	rppt@kernel.org, jamorris@linux.microsoft.com,
	dethoma@microsoft.com, akpm@linux-foundation.org,
	Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
	david@redhat.com, debug@rivosinc.com, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 13/41] mm: Make pte_mkwrite() take a VMA
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-14-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230218211433.26859-14-rick.p.edgecombe@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_124051_069355_B25427E2 
X-CRM114-Status: GOOD (  16.44  )
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

On Sat, Feb 18, 2023 at 01:14:05PM -0800, Rick Edgecombe wrote:
> The x86 Control-flow Enforcement Technology (CET) feature includes a new
> type of memory called shadow stack. This shadow stack memory has some
> unusual properties, which requires some core mm changes to function
> properly.
> 
> One of these unusual properties is that shadow stack memory is writable,
> but only in limited ways. These limits are applied via a specific PTE
> bit combination. Nevertheless, the memory is writable, and core mm code
> will need to apply the writable permissions in the typical paths that
> call pte_mkwrite().
> 
> In addition to VM_WRITE, the shadow stack VMA's will have a flag denoting
> that they are special shadow stack flavor of writable memory. So make
> pte_mkwrite() take a VMA, so that the x86 implementation of it can know to
> create regular writable memory or shadow stack memory.
> 
> Apply the same changes for pmd_mkwrite() and huge_pte_mkwrite().
> 
> No functional change.
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: openrisc@lists.librecores.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

I'm not an arch maintainer, but it looks like a correct tree-wide
refactor.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
