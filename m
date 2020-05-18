Return-Path: <SRS0=JdoE=7A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DB0C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 08:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAF9B207D8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 08:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LSPMu6WX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBMuriSV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAF9B207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UwBbuAEEQ/q+LghCP4AzrGc1Gwx+rmRUyjFcyTQYH2Q=; b=LSPMu6WX0TQ6tX2dmbMY0nqMa
	7KQkn3e1l9egxfuIaWJvy4YFB/jE/O6ZiWCeWhTr74wSQ1dIQa1l5tsJFXwyJlCw1o83fZ06EZ+ys
	H2+PKnYCKpQw49t17HbXL9fF3/xesjGBCIW4SjFLxCnY0VUK8j7U7HaPNupjf05nKXnchAW7RiF1T
	RW46DZFeX3+hUmqOEORse2Rwe5tI+gDZLJnWlT2ZK1f6iNuA/waZ6+3ats6Avn0HvFL9HVezRQMgW
	4hFtUnvRPxhu0IANAZJv096R6xdXoH9wNcSPuckni1pAhmnYBUL4XDD/sKtzL+u7G6xU230LEebnz
	nJ9//fJ2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaaux-0002Sg-DR; Mon, 18 May 2020 08:14:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaauu-0002S8-QH
 for linux-riscv@lists.infradead.org; Mon, 18 May 2020 08:14:33 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 009C3207D4;
 Mon, 18 May 2020 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589789672;
 bh=4y+hIz6o4EUtNGoTSAyYuxdvDt1kqgA448EFAYzZna4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aBMuriSVAZ0bZbk1IYqHHHogpilxZPDYvWC0Rm3Dqo0j85N+x0PMsiangyge0sgkO
 nkWBaObEGjIH1WkUYKFydpSgsjjDC2r24t04HnoMHhgcZxnHK9SgE0sDxw5yiMmj9E
 77ZDM7jwOq9U8AujvCgBtL3cgpBAbkvpqaozgOCQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jaaus-00DBaC-F0; Mon, 18 May 2020 09:14:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 18 May 2020 09:14:30 +0100
From: Marc Zyngier <maz@kernel.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH 3/4] irqchip/sifive-plic: Separate irq_chip for muiltiple
 PLIC instances
In-Reply-To: <MN2PR04MB62078C2854FE33CE81186FA88DBA0@MN2PR04MB6207.namprd04.prod.outlook.com>
References: <20200516063901.18365-1-anup.patel@wdc.com>
 <20200516063901.18365-4-anup.patel@wdc.com>
 <577f9a16b3dddfadb7c5487ffaef31d8@kernel.org>
 <DM6PR04MB6201FD64C78C51A94C4776558DBA0@DM6PR04MB6201.namprd04.prod.outlook.com>
 <6fbfca8f084f6cd0dc6818c4bbf58843@kernel.org>
 <MN2PR04MB62078C2854FE33CE81186FA88DBA0@MN2PR04MB6207.namprd04.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <5bc4010161af7bef8e3c30e08888ec82@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: Anup.Patel@wdc.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, jason@lakedaemon.net,
 Atish.Patra@wdc.com, Alistair.Francis@wdc.com, anup@brainfault.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_011432_875972_CC2EB706 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jason Cooper <jason@lakedaemon.net>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-05-16 17:38, Anup Patel wrote:
>> -----Original Message-----
>> From: Marc Zyngier <maz@kernel.org>

[...]

>> I *have* given you a way to implement that in a better way. But again, 
>> I'd
>> rather you *don't* do it for the reason I have outlined above.
> 
> I explored kernel/irq/proc.c and we can achieve what this patch does
> by implementing irq_print_chip() callback of "struct irq_chip" so we
> certainly don't need separate "struct irq_chip" for each PLIC instance.
> 
> I will implement irq_print_chip() callback in v2 series.

You still haven't explained *why* you need to have this change.
As it stands, I'm not prepared to take it.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

