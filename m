Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A52EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2S/0sgRLAScMSNm6BFkxExPgpTGvK6Ui4R+rH6F2Eo=; b=KAK2PZQ447aap2
	B5YfTmM8lfxDztW4tr3g4R5hf0ifVHHYvQRyx+iTSfZ18LOLHxwzjHrbQV8i6wb7PQV8oRMB8hlzm
	Y9JDV+vZoc+4G0aBn5MWGr2rxV162vUAfLWqnCETDT59oV1BlQUp0VnLBIedvJI+ryP83bMXd4B1s
	OZ/rfMC7uszCzpsmMq3TtNd+9jws0xiosZ2d47tAeEMp+Uaia7tbz3n5+iDi0GAwDTJ+Q3qZn5uL4
	W0bMJYhofZNZ/oVw7qShJJvitlKOrolx6vVsMjTA47SN3N0bqGiS65fR+L1l7APoGhehLiwmMiI9E
	QV6SLUjz5ZVtB1ilwUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMxLa-00F7lR-2B;
	Fri, 21 Jul 2023 21:07:34 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMxLX-00F7kl-1l
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 21:07:32 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F299D733;
	Fri, 21 Jul 2023 21:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F299D733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1689973651; bh=yqScLomjgHGlGue7ZzyaCfjdFN3rTb1w9u8Dn+9+lSg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ds1sihkCdYeQ4Hvnd4To/fuZ660f7QL8+lxW/MLzQFXL5S5cKWXa9AZqkbOGSfwJs
	 XNFPYdv0lmKsxW/UE4Kv8s4/eeZhUYqA2N2C5tah99cdluaBmJ6SktA5iOsXAeJ/bt
	 kbfGUdrbpCKn4RAk/zHaB4DuEpUUkJYYQZrfYf6UQGdb1f4isJj8TeazXi8Mv3UZwh
	 piR/vDo6ifjOFxUcWzNJcppMW0t8a+CUjKOXQnNnXOuOpmYAkdU66VBZI5jwDa4Uom
	 tGsa+7AyWK/EI8peQ2z9iCjpEEJm5o4oheBeoNH0fqoosv0Cg3SYzeJ7fu9jFiPqXA
	 nLvtAWBiA0GZQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Song Shuai
 <songshuaishuai@tinylab.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 1/3] Documentation: arm: Add bootargs to the table of
 added DT parameters
In-Reply-To: <20230626143626.106584-1-alexghiti@rivosinc.com>
References: <20230626143626.106584-1-alexghiti@rivosinc.com>
Date: Fri, 21 Jul 2023 15:07:30 -0600
Message-ID: <87v8edas8d.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_140731_589382_BEBBEFF4 
X-CRM114-Status: GOOD (  13.39  )
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
>  Documentation/arm/uefi.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

So I'm not sure if I'm supposed to be applying these patches, or whether
they will go through the arch trees?

In the former case, they don't apply to docs-next, so could I get a
respin please?

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
