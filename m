Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA998CD98D0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 19:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EksA4Jc+7VE+XmgU1YgDdCevpay2j9hChR+De1wsZcM=; b=nS3ydSjRvxNIOk
	Xt33zZdOSnsMwY7r1Zpk/k9qBBFp8l9AuInZ8qF3dCvCM33V48c0cvxlvpS0hL6FNkaTw4GeWDqzL
	PLp2ENMDdytuU5Ynwa02sgLlrmRjtajk3cEvde2H4pGi0bqw9pabr/qBY151qlQMsk1o4FKFXTs6r
	CSJ7XQyfDbaCkU5F9Zv6r1rmQXQsDYH7JV2GEjhGMbWzmBGY9GoAUkrfghyfbIjjiYxa4Qs+Mb37G
	7gjDnGbQvr4c2iWD8JDWlJt5isjSjWD5vLXQBnqqcPGt4wqoIO2si1AA6GJ/+3rla3We4NI9IRY2D
	gNtDqIrWnGxCo9RDEqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJclf-0000000AyyN-0THO;
	Thu, 13 Nov 2025 19:14:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcld-0000000Ayxw-2qWI
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 19:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB1D844591;
	Thu, 13 Nov 2025 19:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FAFC113D0;
	Thu, 13 Nov 2025 19:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763061240;
	bh=jTWDk+BqohV3m4pXD2Ea/Pvbdh3J2t6AMrMnl8XqWNM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cfBzblaGV5hhZbOf+DAbxa0lXzHi4wNDeV83e/hMffLKgQ9aQzRt5eagWi2nPqVig
	 +OgYRY0az8+Cx1dALXALokHuXG9h4Ac0KocHu2f2aOFrh5JfP5kb5N2PGQ+jWRkgFZ
	 sQO5P/6ZVQGgc0tbu/wiJi2+KByxtaQcvyCHWokq7luXvunk4iaagmEBd7E/dILMJ7
	 O0OEDG02xpXqVoTVHxOJWhrQ1iUwv/awNcNmXnToyD9TD2PPENLItvCkEQZon2ybcL
	 cBey4qKmDoPGH+bX/4ZC4EIlu/PFZnOgoYOFnwFZ672IwX+pcaSSfkBElCf46zNrZt
	 56xqzpPXgEojg==
Message-ID: <7cfd85f6-54e9-42df-8330-d81fbe441ca5@kernel.org>
Date: Thu, 13 Nov 2025 20:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/22] riscv: Memory type control for platforms with
 physical memory aliases
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Joe Perches <joe@perches.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_111401_765621_7B21BB1D 
X-CRM114-Status: GOOD (  12.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 13.11.25 02:45, Samuel Holland wrote:
> 
> On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
> DRAM is mapped to multiple physical address ranges, with each alias
> having a different set of statically-determined Physical Memory
> Attributes (PMAs), such as cacheability. Software can alter the PMAs for
> a page by selecting a PFN from the corresponding physical address range.
> On these platforms, this is the only way to allocate noncached memory
> for use with noncoherent DMA.
> 
> These physical memory aliases are only visible to architecture code.
> Generic MM code only ever sees the primary (cacheable) alias. The major
> change from v1 of this series is that I was asked to move the hooks from
> pfn_pXX()/pXX_pfn() to set_pXX()/pXXp_get().
> 
>   - Patches 1-10 ensure that architecture-specific code that hooks page
>     table reads and writes is always called, and the calls are balanced.

It is not immediately clear to me from the description why that is 
required. Can you summarize the core problem here, and why we have to 
route everything through these accessors?

-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
