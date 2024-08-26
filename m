Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F57C5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5D4FfgsQevovS29L0tvjxoWpkRVBZyaZUK6yfITUcg=; b=NL/hnMvOWyS/jp
	bkz2daqqYe0M+Myu2dFJR68hTOMvQ7GDi/Bl5J/A3DgK7CAQItlZsnY8mx5VYiPwitBnWG/hsTl1X
	AIahjdgZX7Hzv7zMG+O+UQVR2PNLkRyqS9bCt8vLNwuESb21k8vq91ccEajx90D7oEDGTYkhTfVz5
	ZGU1g1NNDCRVRkBQBilnul0mVzqn1Ef1sVbIhJGW+DtuRJoRm3s3Dp7XGwic4YfzVpmWTAfG/4VmS
	RQaJi6kGgyz47MGO6+KvytdoVlNCjtQ+gRZpDhtR78a13FS/JeAhcrGug71MdZwQ1z2PVxFqkIIVg
	/8gHJPRt9P26LVcZUEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sibbv-00000007nmv-16YO;
	Mon, 26 Aug 2024 15:26:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sibb3-00000007nXT-2onZ;
	Mon, 26 Aug 2024 15:25:36 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724685928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HtqBVIjvewMJmwGbbGrtzP9wseneIF0JG8Xv5MYH9sg=;
	b=U3t4b3OdLu+GAFgNF+W13RPfUi9UpqJlkWXQo/rbtxrF5v3F/xRQunKmlWVgSEBMTg6p9H
	SnfM3j34lgAwsP+QxdwgsSCcglS3v9IpKrJ+A1OKiEqv2VnnbqvJ13QcQaMjWzLSnyLkPb
	8YX+HBqyP/evDscLCNv1QU6RgC0lXWa9ptOHqu9VfLENdJWaHjvQKm9/FyAMM/FTEh4Jj3
	2tmQsmzx0MyFVH3JkiSJxhhpuh/cynV1rX+yM8iV8fZ2hJAFIjVxwKgppVsfP9y06WdQYW
	VwSsRLNnEJPLAS0yNUrXAyAsezewrT8q5YP9MnQhb+9f9zA09h1hQd8jpE5nAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724685928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HtqBVIjvewMJmwGbbGrtzP9wseneIF0JG8Xv5MYH9sg=;
	b=LbhSekJ2kImTjTpI5qKezEgJdoF+OYa4K93qQL/ngQ9HbLWQbGvavIRCL9Qq9RBtd5Pbvi
	jsetTuVjOe5BLaAA==
To: Sunil V L <sunilvl@ventanamicro.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>
Cc: Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Anup
 Patel <anup@brainfault.org>, Samuel Holland <samuel.holland@sifive.com>,
 Robert Moore <robert.moore@intel.com>, Conor Dooley
 <conor.dooley@microchip.com>, Haibo Xu <haibo1.xu@intel.com>, Andrew Jones
 <ajones@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, Drew
 Fustini <dfustini@tenstorrent.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v8 00/17] RISC-V: ACPI: Add external interrupt
 controller support
In-Reply-To: <ZrlgVUXC_dCW9ISM@sunil-laptop>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
 <ZrlgVUXC_dCW9ISM@sunil-laptop>
Date: Mon, 26 Aug 2024 17:25:28 +0200
Message-ID: <87mskzcnmf.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_082533_875680_A739E78E 
X-CRM114-Status: GOOD (  10.64  )
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

On Mon, Aug 12 2024 at 06:37, Sunil V. L. wrote:
> On Mon, Aug 12, 2024 at 06:29:12AM +0530, Sunil V L wrote:
>> This series adds support for the below ECR approved by ASWG.
>> 1) MADT - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing
>> 
>> The series primarily enables irqchip drivers for RISC-V ACPI based
>> platforms.
>
> This series has spent quite a bit of time now on the list. As you are
> aware, few clarifications like _PIC codes are also done now. There is
> no major change after you had agreed for the design. So, can this be
> considered for the next release please?

Rafael, if you want to take it through the ACPI tree, then for the
irqchip parts please add:

  Acked-by: Thomas Gleixner <tglx@linutronix.de>

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
