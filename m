Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D13BC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 03:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ADTYOZ6TWaxRKcYAqq1+2BxOKyXnllOjdqJUky2JI0=; b=dkigTD7WU7v6wq0q0otHCVYhf4
	FP+H3wK9u8abyd4Rkp+5NzR5TbQwbC5Ar+ajV/JC/vdG2ml756TFSz0LoEkesC396LHjXTE1LM5AT
	ABr4x9AiEFqv9Xk5LMhZ+w+LbLo3tBLgqoUb7vzzlu2G1I5RuLXD3oCxq4CG7czARTJy8Nro7RFVq
	Pw6vKo3GnkjDCjUvdmiDeXvfXB9q2szswep9dLQ903Tf3XKCKrIXrbvmHuUIKQPEZ2cpCLsCJjXvM
	aAcc039ojgSlQqFBJ7X6mYAk4tYLKAKVj7A9TDjc4QXuTouPXBb7FDiEUNjM+yNn80WGIg71LDbhg
	W+CVSd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMK5d-009cwo-0J;
	Thu, 20 Jul 2023 03:12:29 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMK5Z-009cv2-1Y
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 03:12:27 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id 36K3CC89026283
	for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 06:12:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1689822726; x=1692414726;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zPjihqajCHYso2SYLygY80dfwyyJAXwUJ5bsc+egrmg=;
	b=HoBvEI/eMiSilZXfZB6lzV1KKu9/yBE2zEk+Ou5yUNXOgugqprpDcNW58LLObfa+
	MHGbasKVuf29H6iCCVipyi801yXAQZnIfrlAgsXigc5tRpJ6S72kYLXjoLieM9Qu
	JRkIu1Omb6MXt4Gu0qRmztcu37kYgrodXfoWkUzn4ospda75K9BvgYHrU3nWjcfO
	AYQlSx9O45PC89q+Kwyppg9LBHH2hlHfhsRGalBrqPIOELsbfkIXEMKIb/aNWCOY
	+dCiKBPajwdgjIOl8pD7qSu7LInMJx/e6kxxUuQRHE/BaPmOBhXtEtdbWKa9vJlQ
	Ba1bMQz9dYRzjsftr8dO6Q==;
X-AuditID: 8b5b014d-a17eb70000002178-ba-64b8a606a7bd
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id 6C.42.08568.606A8B46; Thu, 20 Jul 2023 06:12:06 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <5b8fd18e-8dfa-96bf-cdd4-4498b1d15ab9@ics.forth.gr>
Date: Thu, 20 Jul 2023 06:11:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
Content-Language: el-GR
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsXSHT1dWZdt2Y4Ug8V9ChZbf89it5h16Tij
	xa8vFhadszewW1zeNYfNYtvnFjaLDZdmMVq8vNzDbNE2i9/i4IcnrBaf51dYTF/1gtniy7J2
	RouWO6YOfB5PDs5j8lgzbw2jx5uXL1k8Dnd8YffYtKqTzWPzknqPF5tnMnrcmBXhcan5OrvH
	359bWTw+b5IL4I7isklJzcksSy3St0vgyrh1rYulYLtAxa31n1gaGGfydjFyckgImEhM+nyE
	uYuRi0NI4CijxKM1c5khEpYSmz+9ZAGxeQXsJQ49mAwWZxFQlVj0YwMrRFxQ4uTMJ2A1ogLR
	EtPuXQOzhQViJT50vGIDsZkFxCWOnP8NtkBE4BSjxK+JP8EcZoGLTBJrDq9jAqkSEuhilNh4
	sRjEZhPQlJh/6SDYJE6BGInDf0+yQ0wyk+ja2sUIYctLbH87h3kCo8AsJIfMQrJwFpKWWUha
	FjCyrGIUSCwz1stMLtZLyy8qydBLL9rECI42Rt8djLc3v9U7xMjEwXiIUYKDWUmE99HlbSlC
	vCmJlVWpRfnxRaU5qcWHGKU5WJTEeU/YLkgWEkhPLEnNTk0tSC2CyTJxcEo1MDnVGJcJZHJu
	i9zY3pqz90Kr9EPmXX32D3bG/j+itPvqnpCjSvnmn7+s5xa78tDoR+RjzUsn7n/IYnKpzkmu
	Le99vuXwXMdVkTHyUv9ezd/BVXUhJETOeH/p6oeX7FxPVvi8aW0KUyv33XqO50C46AOhTzef
	qe25ValRtHN9y1tta3WRft/HgV9sW57s69uw4PxH+YjJHl80ulzUipwiP+kcdN+/RdarJeZX
	/p3ZNl+ncH3bfGzKajfDh/MyZaaw/nCP1gyzntWTbtn1foel8SeBplu//p1r04spFLniorDZ
	zK/7htyMHDXRj1P3HMitspd/PZ1BdLLrh7drvA1cp54RMBTXVLzzYr26xofCY0osxRmJhlrM
	RcWJAHKI+wclAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_201225_968691_EA41FBE6 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Tomasz,

On 7/19/23 22:33, Tomasz Jeznach wrote:
> Enables message or wire signal interrupts for PCIe and platforms devices.
> 

The description doesn't match the subject nor the patch content (we 
don't jus enable interrupts, we also init the queues).

> +	/* Parse Queue lengts */
> +	ret = of_property_read_u32(pdev->dev.of_node, "cmdq_len", &iommu->cmdq_len);
> +	if (!ret)
> +		dev_info(dev, "command queue length set to %i\n", iommu->cmdq_len);
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "fltq_len", &iommu->fltq_len);
> +	if (!ret)
> +		dev_info(dev, "fault/event queue length set to %i\n", iommu->fltq_len);
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "priq_len", &iommu->priq_len);
> +	if (!ret)
> +		dev_info(dev, "page request queue length set to %i\n", iommu->priq_len);
> +
>   	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>   

We need to add those to the device tree binding doc (or throw them away, 
I thought it would be better to have them as part of the device 
desciption than a module parameter).


> +static irqreturn_t riscv_iommu_priq_irq_check(int irq, void *data);
> +static irqreturn_t riscv_iommu_priq_process(int irq, void *data);
> +

> +	case RISCV_IOMMU_PAGE_REQUEST_QUEUE:
> +		q = &iommu->priq;
> +		q->len = sizeof(struct riscv_iommu_pq_record);
> +		count = iommu->priq_len;
> +		irq = iommu->irq_priq;
> +		irq_check = riscv_iommu_priq_irq_check;
> +		irq_process = riscv_iommu_priq_process;
> +		q->qbr = RISCV_IOMMU_REG_PQB;
> +		q->qcr = RISCV_IOMMU_REG_PQCSR;
> +		name = "priq";
> +		break;


It makes more sense to add the code for the page request queue in the 
patch that adds ATS/PRI support IMHO. This comment also applies to its 
interrupt handlers below.


> +static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
> +						  u64 addr)
> +{
> +	cmd->dword0 |= RISCV_IOMMU_CMD_IOTINVAL_AV;
> +	cmd->dword1 = addr;
> +}
> +

This needs to be (addr >> 2) to match the spec, same as in the iofence 
command.

Regards,
Nick


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
