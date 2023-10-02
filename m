Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAD8E784BE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njHxBzczmNft04denufJUyAYJqEMh34gYl/Etd52e0A=; b=2XnVznaWAwFMIH
	c0yuRFUJVxdP+g/U7Rk45Kv1K0g1S4Ktn6NXyj+cXGEVJXvvW9kMKXGybCrJB2XFtk8JUO1o+fI4W
	OkO1W5/EMd8oCTR4R0aFWebV8tSUq53erHMqYicD8XZlVgwKGHr0Uao1m5tuPIQKcUXEs1twwXc0q
	bX7YanNDVKZPRrMfWds7jF2qd/y1cPaoVYEkwnpGFuERagZcM7xkhKynb/NurAQK5LHjbWQ2T5+yb
	FHVl7GKxN+hVAjrbWBSkJ4PmuOr9TOSWZnG20e7myEKciNGhpKq6WbKFN7hrlZT0DfmDHbtcIbY9T
	zHp68D4qxoRmehfvtpOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKuN-00CzY8-2X;
	Mon, 02 Oct 2023 15:32:31 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKuK-00CzWi-2r
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:32:30 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BB6B86E2;
	Mon,  2 Oct 2023 15:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BB6B86E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1696260741; bh=WKwix5ltgB/Rv47bjZiYblkMD2/CI4dSq0MKwEEmH7w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OwSsZDW/5ye5r388TvoSDEcESUIR+xj07++SnzEsA5gsZDHH3iMedoo+rgSmNAXqh
	 1RA37+x960flUtH4LLp60ZDAAAUpQhklj8Ighq0ajc6085S63fRLMo/VQYf2LWRD0u
	 DS3qyUr4WrfZ641H8L4Gjty76PwdOXh+1ZycePTG/hOjjiqc9BEkf2xgJY1KnPJ63U
	 3+ToPlOlnI7X2a37oLoIOuW8QsawBQG1VBP3KIWEDzUYyDbOsWweXAoJ483CyhK/36
	 qTNo8tyxs4rLyqZYzRvOCiBd7GRbdYQkRF3p9XpTcWvR22uWaaCpdlUPbXCVtjIE0Z
	 2V/LRYh7ePROQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Conor Dooley <conor@kernel.org>
Cc: Costa Shulyupin <costa.shul@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex
 Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Heiko Carstens
 <hca@linux.ibm.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ard
 Biesheuvel <ardb@kernel.org>, Atish Patra <atishp@rivosinc.com>, Alexandre
 Ghiti <alexghiti@rivosinc.com>, Randy Dunlap <rdunlap@infradead.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Chiu <andy.chiu@sifive.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Greentime Hu <greentime.hu@sifive.com>,
 Anup Patel <anup@brainfault.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Vincent Chen
 <vincent.chen@sifive.com>, Wu XiangCheng <bobwxc@email.cn>, Sami Tolvanen
 <samitolvanen@google.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH] docs: move riscv under arch
In-Reply-To: <20231002-panoramic-submersed-7f5bfd8d1e76@spud>
References: <20230928103134.2779459-1-costa.shul@redhat.com>
 <20230930-mauve-jargon-0f7760fd262d@spud> <87h6nbka8x.fsf@meer.lwn.net>
 <20231002-panoramic-submersed-7f5bfd8d1e76@spud>
Date: Mon, 02 Oct 2023 09:32:21 -0600
Message-ID: <875y3phwfu.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_083228_970083_ECEBEFBE 
X-CRM114-Status: GOOD (  16.72  )
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

Conor Dooley <conor@kernel.org> writes:

> On Sat, Sep 30, 2023 at 08:26:38AM -0600, Jonathan Corbet wrote:
>> Conor Dooley <conor@kernel.org> writes:
>> 
>> > On Thu, Sep 28, 2023 at 01:29:42PM +0300, Costa Shulyupin wrote:
>> >> and fix all in-tree references.
>> >> 
>> >> Architecture-specific documentation is being moved into Documentation/arch/
>> >> as a way of cleaning up the top-level documentation directory and making
>> >> the docs hierarchy more closely match the source hierarchy.
>> >> 
>> >> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>> >
>> > This doesn't apply to riscv/for-next or next/master, with git
>> > complaining about the sha1 being lacking or useless. What does this
>> > actually apply to?
>> 
>> docs-next, I would guess (though I haven't had a chance to try it).
>
> I'm far from the world's best git-er, but doesn't the lacking or useless
> report from git while trying to apply the patches mean that this patch
> depended on commit that is not in next/master (which I assume includes
> docs-next).

It just means there's a divergence somewhere.  One tree has a patch that
the other lacks, and that creates a conflict making the whole thing
fail.  Business as usual...

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
