Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5622C004D3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 10:13:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A5882082F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 10:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hjpj8Wth";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="LW3rQRbs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A5882082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=miDjoPv29CeZTdXAbjp0XTwbBdZPEknNHdytF/qo7Ak=; b=hjpj8WthMYKlOI
	dFEsXxrQBoqyPbK1lcgb/GLNMfURWS4qS1G8ArxCKzwdkycOhswRgH0Atg5fTAoe1D+gSmRWJUi3R
	CJkJ8PzxcNOM/8WnDP4azb86+T2yezO4Jpo9aQZ+HoG3Jd3Me/s+/12Ja8zYp3mUyVKkpWT7ZNz4h
	S5KIeB5nckFF64qQ5rlz6+pmkJghdCR7PQLBl7FzH9O72PD9WkkFAprrHKDWfDrr3ImgoDJwuAh3J
	SDHQRIBnYhFMgUUoAkRIhr//s9u6cE2DN/P5NAhV76ufEjhT3vUvreWDTdTSILyUzL73wui8LGiYV
	CUzyjEp/VwMXhExFXf1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFGAT-000413-Up; Wed, 24 Oct 2018 10:13:37 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFGA6-0003x7-B1
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 10:13:16 +0000
Received: by mail-pl1-x642.google.com with SMTP id bb7-v6so2005823plb.13
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jjwSE14LPfje/VjGow1mCRc4iV2H58RrCA9qPOR9BBI=;
 b=LW3rQRbs8K/P5qiShw/IjeV4JIMIBiAhuu+U9E9cikIKD48cJuEOrgryRgu/RAi5Bj
 3cLxW44W5HajhHHvJFOUhlFSBMtQdtCFyuZNB5pWXN50urWt943X7B6IlF4lnS2P8crr
 IK0a5dadeVb2twXxbnvoqBnwvaymW80gt6ONfdSTaWEEdiF5GMl7OFiNooArOjDtQJEc
 VX9+WeKOJthMSmGl1YHBxsgw6f3AbqohBwSKRHD/fHYsKKW9yvNIulEI+bhq7B56IpfI
 Yf4cEjhcH3uKS6huccQljB1CsOCeoxoVGJnLxQA4VWUlW/F/y0aI0+QL5dcA4RpObOXq
 3F7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jjwSE14LPfje/VjGow1mCRc4iV2H58RrCA9qPOR9BBI=;
 b=rPbS1XddM4WDaUqU0WF3KFG3oS/NLcVcwwCVIqVYcGM1yUhp8ZnPPr4B5WLUole5EB
 IeSPEYHD74Z4sy3izj8JEdIM2Gu+CwjNdK+y8MHSx+fkCQuZCKHd1CgtNcV9bfi0mLdH
 3y+VWcmEbpEwLFgDzJlIDVdxad/YrtM2v1UbMq+IwCGJK5UtGOyxzR5pB/V+40fl1X62
 4G40zD6URMMW0UQz88acwZMOZU5t2V85A2pkTKgNJ0ilmGhTw3kvpLmYtXNbUk4Nb3iL
 J098fhFOmORPcrXCe54A7lwNo5BYAtNoYkoAqMjsyoLzUDPE8PSsk2UzmG6PteXpSsK2
 kPGw==
X-Gm-Message-State: AGRZ1gL0TJJ7x4XNoXHqvlowH+IF3whiKgLh4peSDVbMbJkB8Pkhs8GG
 FndrOpNDH0HP0ENpaGIMfP1ZsA==
X-Google-Smtp-Source: AJdET5d0UdURELlruNjEqupiPGen6jVsxoGb5+iKkDtucxAzZChLo1c7KZe84NtjlNKHALsCS+tdDQ==
X-Received: by 2002:a17:902:9344:: with SMTP id
 g4-v6mr1939843plp.159.1540375982727; 
 Wed, 24 Oct 2018 03:13:02 -0700 (PDT)
Received: from kshutemo-mobl1.localdomain ([134.134.139.82])
 by smtp.gmail.com with ESMTPSA id m11-v6sm6396544pgn.39.2018.10.24.03.13.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 03:13:01 -0700 (PDT)
Received: by kshutemo-mobl1.localdomain (Postfix, from userid 1000)
 id 594E3300225; Wed, 24 Oct 2018 13:12:56 +0300 (+03)
Date: Wed, 24 Oct 2018 13:12:56 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: [PATCH 2/4] mm: speed up mremap by 500x on large regions (v2)
Message-ID: <20181024101255.it4lptrjogalxbey@kshutemo-mobl1>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-3-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181013013200.206928-3-joel@joelfernandes.org>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_031314_586931_2266593C 
X-CRM114-Status: GOOD (  15.54  )
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
 kvmarm@lists.cs.columbia.edu, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, anton.ivanov@kot-begemot.co.uk,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-s390@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 nios2-dev@lists.rocketboards.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Chris Zankel <chris@zankel.net>,
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
Message-ID: <20181024101256.QySn0e0dmTlPdS4jWBjZgoX8vVWMQhokrDexXuF_Qz4@z>

On Fri, Oct 12, 2018 at 06:31:58PM -0700, Joel Fernandes (Google) wrote:
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 9e68a02a52b1..2fd163cff406 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -191,6 +191,54 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
>  		drop_rmap_locks(vma);
>  }
>  
> +static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
> +		  unsigned long new_addr, unsigned long old_end,
> +		  pmd_t *old_pmd, pmd_t *new_pmd, bool *need_flush)
> +{
> +	spinlock_t *old_ptl, *new_ptl;
> +	struct mm_struct *mm = vma->vm_mm;
> +
> +	if ((old_addr & ~PMD_MASK) || (new_addr & ~PMD_MASK)
> +	    || old_end - old_addr < PMD_SIZE)
> +		return false;
> +
> +	/*
> +	 * The destination pmd shouldn't be established, free_pgtables()
> +	 * should have release it.
> +	 */
> +	if (WARN_ON(!pmd_none(*new_pmd)))
> +		return false;
> +
> +	/*
> +	 * We don't have to worry about the ordering of src and dst
> +	 * ptlocks because exclusive mmap_sem prevents deadlock.
> +	 */
> +	old_ptl = pmd_lock(vma->vm_mm, old_pmd);
> +	if (old_ptl) {

How can it ever be false?

> +		pmd_t pmd;
> +
> +		new_ptl = pmd_lockptr(mm, new_pmd);
> +		if (new_ptl != old_ptl)
> +			spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
> +
> +		/* Clear the pmd */
> +		pmd = *old_pmd;
> +		pmd_clear(old_pmd);
> +
> +		VM_BUG_ON(!pmd_none(*new_pmd));
> +
> +		/* Set the new pmd */
> +		set_pmd_at(mm, new_addr, new_pmd, pmd);
> +		if (new_ptl != old_ptl)
> +			spin_unlock(new_ptl);
> +		spin_unlock(old_ptl);
> +
> +		*need_flush = true;
> +		return true;
> +	}
> +	return false;
> +}
> +
-- 
 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
