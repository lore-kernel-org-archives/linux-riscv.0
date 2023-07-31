Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684A9C001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8s+Q0+x1lgqdBu8eFGh5e3glU9qCxng81B1G2yyj/g=; b=0+c/b8e5+Y3F3f
	dDFFEg1GsD2Ne5UBri8vhEUJgBECWr4nsx01n5fRABmMkLAFA5JSXJ6X42u3NNfBKPld6XOeN5Cgf
	HskZ3O5JzO9xczRl/TrpbnMmSPeY27XR6SBxsSaadUnPIEuvYy8iEmJ8UYzplmC7oJ4YptkjUqmJ7
	vrdxRzg+b3QfPlrrQfBnMq5HmC7BdbQtp/url80gFStWBu8O3BCpkpEQI+IOi7pi56FVvnYP9tuQe
	6tVInt5A4cjVBlPtBZb6+YYkf8g/txZKqhPqZ76dlw6VKNIsdO7Yi25ZPp8OuxlEogHImeu81MLMC
	E3xnFvd5AG85t4CGRK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVMZ-00GW8N-2U;
	Mon, 31 Jul 2023 16:03:15 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVMW-00GW6u-3A
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 16:03:14 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8BF2E2B0;
	Mon, 31 Jul 2023 16:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8BF2E2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1690819390; bh=6DZuq3K0IVlWprkW7UxAsqG3o6fDHDawj8kLGq2UaX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JM5UkfFEyC3fj9Qk4pNUCg8AnEHpsETABUjjbve3Y3yn2B/72TmhTPlL3OhE5Mr/e
	 PyZdw9rp20TgtbJvtuXC7GdCAxzb+0abIDaHc4ZNvblp5mcZG1iRfFmsgyQyB/7o73
	 QwLelHb+VQwYjJlp3+CMjUJdGCyohcSuYfkVbUsrpZMMfacb9TWLobaQVnnGvm+gF+
	 06kblk4KGnkqiJZUcUZd4bYxBPpGfGfVdLA8FaKM0AoP++n+A5dEE802zEfevc4E2e
	 swL7pa1EJKOLdoEdKHJZJQmVsM5RxLtfuLoSkwSY/mVBDHhY5d62Ai4odK1UqV1Ir/
	 O/JT/ukJ48CZg==
From: Jonathan Corbet <corbet@lwn.net>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Song Shuai
 <songshuaishuai@tinylab.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v6 1/3] Documentation: arm: Add bootargs to the table of
 added DT parameters
In-Reply-To: <20230725141926.823153-1-alexghiti@rivosinc.com>
References: <20230725141926.823153-1-alexghiti@rivosinc.com>
Date: Mon, 31 Jul 2023 10:03:09 -0600
Message-ID: <87fs54dq6a.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_090313_041222_81919D5B 
X-CRM114-Status: GOOD (  13.09  )
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

Alexandre Ghiti <alexghiti@rivosinc.com> writes:

> The bootargs node is also added by the EFI stub in the function
> update_fdt(), so add it to the table.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Song Shuai <songshuaishuai@tinylab.org>
> ---
>
> - Changes in v5:
>   * Rebase on top of docs-next
>
>  Documentation/arch/arm/uefi.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Series applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
