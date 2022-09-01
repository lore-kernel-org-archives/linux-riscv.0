Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB20ECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgPlRpCfRGcvtcaUe68KJzckyEj+kY30/hb/ntjRiYg=; b=LHfLYkqV0zfUBV
	IQb9iJfAz0MDh0UzdRTLy7310EhUaZNJiANC8xD1pgQBGuNh/6r7vrtk1BcoyGe/vk1XRs9SUvsvP
	lh1SksMGDnsk25CBVGm78vyI7IxPYDOORJgsYWZKx7+BDMQq39AJHllWj3PVaB2pVg8wtTm4I6Av9
	Fg8vNzqGWqK2l12duiiZJ5UJ6uRJc+m7K9fi7V/4sclSBMRVbAX55mlcmmv8OFqpNkpe863AZajWV
	3OU0ygrmxd60bt7v9WM60hXiAQ3CemZlyWlTwLjr99FJfXAQFRHvXyWec9aFBgirZVmH9zqStuKOD
	inoaLL5c4fO0XfJE65zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkdq-00CEnp-GG; Thu, 01 Sep 2022 13:53:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkdn-00CElp-Ve; Thu, 01 Sep 2022 13:53:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54C2D61728;
	Thu,  1 Sep 2022 13:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D679C433C1;
	Thu,  1 Sep 2022 13:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662040435;
	bh=HdsYKZmyvUhpJZba03oAmfYjwzHbDOVaQz9sEmXDhww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGrJY5mf/CEotU+aiZKDeb0eBpmRY6SlPOv3KQjdek5+gw7JXxzyEgfpFkMyRHDtj
	 OpRCF7x7vDdT4ldIXyVuKFV0kDWHvR1XmBpvtqnEXHXZWzTuciKoZ4s5LFRa14UjM7
	 Ca8tJnTRfof1qW4GTQ8tcSMXSfQT8fCZ8NhWrDg2/fsys4mP5DMpJDMn9DcpL8h6Ir
	 5JgVvucNoMULavFe9OFOMiydvLfqfATmqGPaqNHLcfk4BVWRT27AWssjozNakNrNzH
	 hXi8x0XmPLCvRSmudnfTfmfRuq2I+6QsASRvqVR7NICjAXDMGJEeaRFmwP884Q6P1u
	 N091/JLRHBgEA==
Date: Thu, 1 Sep 2022 21:44:37 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Message-ID: <YxC3Ra5iZDdYX7sW@xhacker>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <YxBZZWopVftK/WBk@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxBZZWopVftK/WBk@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_065356_083466_AA700C8B 
X-CRM114-Status: GOOD (  11.01  )
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

On Thu, Sep 01, 2022 at 09:04:05AM +0200, Sebastian Andrzej Siewior wrote:
> On 2022-09-01 01:59:15 [+0800], Jisheng Zhang wrote:
> > I assume patch1, patch2 and patch3 can be reviewed and merged for
> > riscv-next, patch4 and patch5 can be reviewed and maintained in rt tree,
> > and finally merged once the remaining patches in rt tree are all
> > mainlined.
> 
> I would say so, yes.
> 
> What about JUMP_LABEL support? Do you halt all CPUs while patching the
> code?
> 

FWICT, riscv JUMP_LABEL implementation doesn't rely on stop all cpus while
patching text.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
