Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26527C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDQhP2B3+7KWZwLxXw6GMTIU6suP3t02HdECtKsXFyg=; b=CJMwb/POP665ItBQ/Ng65AR6AC
	Efcc1yPGM/Q2iRMSLvKYtFovwNZwPu1Dk01yTVMPDemJH4GpBhsTj3FHInmGqYkoxzyaCTUjtFv1Y
	qSnJ4/BXlWrI1mSpzHbVVszurO4ubO5/kzSBLjq0qKUdN9kjhxXZ5LUbYHkoioDeuAINtKMTxhy0q
	DUOXVm6x6G4sLnfbGVkEUlOh5qmAmeYAt5KXdmmoQv2n7sQ5j9TdHKEfz8SvXOZVoef/dP/UKC17L
	l+MmIaLFdMsF56UT4myt4evp/cevdlhk2cTktyqQGvptmljI/2/iYEwbdVoj4NcDojoFiUxSrNuuV
	VREhhXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMBqV-00FuSN-1I; Thu, 11 Aug 2022 17:19:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMBqS-00FuME-20
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 17:19:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D27CB82205;
	Thu, 11 Aug 2022 17:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE9CC433D6;
	Thu, 11 Aug 2022 17:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660238381;
	bh=4TnnSHe/Xp9maH0JKMds58skYOS7Cg1upinXS2ls2OM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RvpfFthYr58aCHVRgiI5w+v1WO2G2o/SCiIL4fy8KaZHl57NS4y8eCutaUGEPGj1i
	 nfhG2CujkkaEzY0yxGWjkRwV34J5GGb98C0/x1BMn10QNRitkvJe2aaA98hcWp0mye
	 QvSxERRPd8zyf6okW0JHHVmf43IVEwvxmxPWnHqjqXIXvpzLbjV0qXgztcWicLdInu
	 GoLo5h8C2p8XZMARKypXyVbeH9D6E+tDNcQDsORdtQMm3OjbaAdsjQ3yNxuVN9L3Rs
	 CmQKErC63+mMn9bB8sTv3urSZTiWrhgTn45aAkd6lOiTeM1rIpa9q15nZbqeMEvE8+
	 k9lEH5sBDdO4w==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1oMBqM-002Po5-PX;
	Thu, 11 Aug 2022 18:19:38 +0100
MIME-Version: 1.0
Date: Thu, 11 Aug 2022 18:19:38 +0100
From: Marc Zyngier <maz@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, tglx@linutronix.de, Paul
 Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, prabhakar.csengg@gmail.com,
 biju.das.jz@bp.renesas.com
Subject: Re: [PATCH] irqchip/sifive-plic: Make struct irq_chip const
In-Reply-To: <mhng-16e473fc-4513-4998-b732-9059d2c0b870@palmer-mbp2014>
References: <mhng-16e473fc-4513-4998-b732-9059d2c0b870@palmer-mbp2014>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <771e663cebf23735782a7ce41e51d33e@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: palmer@dabbelt.com, prabhakar.mahadev-lad.rj@bp.renesas.com, tglx@linutronix.de, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, prabhakar.csengg@gmail.com, biju.das.jz@bp.renesas.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_101944_274805_B6971ECF 
X-CRM114-Status: GOOD (  15.50  )
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

On 2022-08-11 17:53, Palmer Dabbelt wrote:
> On Fri, 24 Jun 2022 10:56:39 PDT (-0700),
> prabhakar.mahadev-lad.rj@bp.renesas.com wrote:
>> These should be const, so make it so.
>> 
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> ---
>>  drivers/irqchip/irq-sifive-plic.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/irqchip/irq-sifive-plic.c 
>> b/drivers/irqchip/irq-sifive-plic.c
>> index bb87e4c3b88e..173446cc9204 100644
>> --- a/drivers/irqchip/irq-sifive-plic.c
>> +++ b/drivers/irqchip/irq-sifive-plic.c
>> @@ -176,7 +176,7 @@ static void plic_irq_eoi(struct irq_data *d)
>>  	}
>>  }
>> 
>> -static struct irq_chip plic_chip = {
>> +static const struct irq_chip plic_chip = {
>>  	.name		= "SiFive PLIC",
>>  	.irq_mask	= plic_irq_mask,
>>  	.irq_unmask	= plic_irq_unmask,
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Not sure if this got picked up somewhere, but it looks fine to me.

It probably needs respinning (the PLIC code has evolved a bit since).

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
