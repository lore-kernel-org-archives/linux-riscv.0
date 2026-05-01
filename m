Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA470CD13DE
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 02:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xa0MZqfc/Aoad7479i7E/vT7JnWyWyxfJw2WqJpOQ2o=; b=dLAYJXnVxlQdgY
	0iEjcSkMm/cDpRsi+nATGPPt1bLHugg9soojPYaAT0pNf9bnuXvhTY3Y4AGRQ8naJ5qNgJanPIb9P
	0KcA4qO6i1quKuKJO49w1wxP3FPtywzZjmOlVYyk5sP0JiXH/FQ7FBQjvHkNn+7DAApTaHYqPsnSU
	ZDKh4M0kUj1nKzjW+NDyumRiGNdT4hDZhJM3uVYowba77WdKlSyxzotAQJ7mjOjVrB969o6gzRMj7
	ww1NvETTX0TW7m8LtbK5lVa9vJM393x++olC2C5rgfuMr36UE8V7sZb8aEiFuz2j2D7Pm4xNYvMGm
	L3osjyjUx85J1vriad9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIdIu-00000006Ezu-32Zl;
	Fri, 01 May 2026 02:08:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIdIr-00000006EzY-2O2K
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 02:08:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F1C840895;
	Fri,  1 May 2026 02:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773B0C2BCB3;
	Fri,  1 May 2026 02:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777601308;
	bh=cX6ylCwLWkbT5yjublvyn2/hVA6tirJHLb3gLL4aW00=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f8C+31CgfLxwz5Ohl6uqPDEukn3RM38jRHDlJZdco/d6pgE7+EAU/NmvT3khqCPT6
	 iHsGOAYroi5lam7UzHeyKQsHT6I2XavVP5Y6O+6wcEH94hcWEgq+3C21e1XcHOJgRO
	 69/ji8cJfLYE6PrK1gMheNg7ojlyy9dApSwr1wU3mLP7DlcTJ+XBdlKAkSAJaPaAUd
	 bF41okhbFBFuW5oHTCVmcstLYPkdaBlQ88zUtU8zIAeE/EZBYY9ft9Ck86LbnKwXvV
	 2z2GUUus5Mh1GOquoLUnWAoWgdcCdbAhcSTksxO4rMCP1gP3VMeSI6D7oR2JJqoXmx
	 /gfO3QtwgoS3Q==
Date: Thu, 30 Apr 2026 20:08:26 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Michael Neuling <mikey@neuling.org>
cc: =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
    "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, 
    Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
    Aleksandar Rikalo <arikalo@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andrew Jones <ajones@ventanamicro.com>, 
    Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
    David Hildenbrand <david@redhat.com>, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
    Guo Ren <guoren@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>, 
    Kevin Brodsky <kevin.brodsky@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Nam Cao <namcao@linutronix.de>, Oleg Nesterov <oleg@redhat.com>, 
    Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <pjw@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
    Raj Vishwanathan4 <rvishwanathan@mips.com>, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/5] riscv: errata: Fix bitwise vs logical AND in MIPS
 errata patching
In-Reply-To: <20260409091143.1348853-2-mikey@neuling.org>
Message-ID: <f860d596-27e9-4c3c-71dc-a2c382feab30@kernel.org>
References: <20260409091143.1348853-1-mikey@neuling.org> <20260409091143.1348853-2-mikey@neuling.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_190829_626913_B4221D98 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

On Thu, 9 Apr 2026, Michael Neuling wrote:

> The condition checking whether a specific errata needs patching uses
> logical AND (&&) instead of bitwise AND (&). Since logical AND only
> checks that both operands are non-zero, this causes all errata patches
> to be applied whenever any single errata is detected, rather than only
> applying the matching one.
> 
> The SiFive errata implementation correctly uses bitwise AND for the same
> check.
> 
> Fixes: 0b0ca959d2 ("riscv: errata: Fix the PAUSE Opcode for MIPS P8700")
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> Assisted-by: Cursor:claude-4.6-opus-high-thinking

Thanks, after fixing the checkpatch warning regarding the Fixes: line in 
the patch description, queued for v7.1-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
