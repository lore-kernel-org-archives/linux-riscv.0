Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C4BCDB466
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 08:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nvGQjdB+Nq2xK7Da4U5+yKHUY28mZ8vGSm7gbkVJGA=; b=Q6eEZHDLQOVtfe
	RZkgOZhIFvaa8WUtvGFEs1DF5fyyVR5nhp/iTarIYWWRQ7mxmqhr08budygikoSh86qetKuLJSmX5
	MQO7DTLmWI+5vmVH92TyR9Xxyw7K49hjbat1rhG8zaVkCvj9rajrM+23OvszUnOnquzh8B5LAmCNh
	vPO92XWjqorhNWq7iJ0vII1Q54n8i1BliqE5LdDi4uh4bKT2mgZ6HxhHx6sVc3uoCiA7fhEdrGwhI
	IJxMdUaTVF3tYv+JsDt7NCSjOFIt0dbwvLUGQjlVcs9/Za8pRhgpOXlmIqJVp9ktrxp/CXt6+VRqc
	0BuuPnFRc0oiXKKn+89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfln-00000008qtt-2O7y;
	Thu, 25 Jun 2026 08:49:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfll-00000008qtJ-0Irx
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 08:49:10 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782377346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CH2pCCXt5kqod2CyOIkwzroP+4v71HSKPpSDEHo8rcw=;
	b=TbtMD0J7g/R4Uw+RkH5qfOreFOOYyqsOER3GSvIfvyoAvRbuSaTb9Ccqu3FHLDWmSNpBdC
	ZPtYA//tgi/Vvi6I6Wfpvn1m3C89eFgCGrsGSsrr+jYxqkzZ44+3ddCwORtLYCt2Pz9vIJ
	jTgyReZ1sUUskOJs3CmN4Ob84dVxYDf288rzQPXQufDAVsyySkGtzkE0xDDyGHnPYuYmNj
	U2rTXFg38YbH7HUhql3QWo/Gs57m50Fz7dT70WqtDHhOrnnF2kwhibB3MIU5ijZrU0RlXD
	EIBNfw9bIhWTbHVGmUcSv7rxRqxdfBcspneDxogWNv9aIj4Z7vPegiayQ/VFmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782377346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CH2pCCXt5kqod2CyOIkwzroP+4v71HSKPpSDEHo8rcw=;
	b=vwmhRcnf4gj5RyGzSPY4CXrQM/apW4IJ7nIHin4pgmIcYedDnHRugW1ruGzl1F1ZSLoWLN
	VAT0sy+vRUoPxwCA==
To: Michael Ellerman <mpe@kernel.org>, Rui Qi <qirui.001@bytedance.com>,
 palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 conor@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 samuel.holland@sifive.com
Subject: Re: [PATCH] riscv: Fix 32-bit call_on_irq_stack() frame pointer ABI
In-Reply-To: <2e47388a-8883-4b44-b440-a00b8e622733@kernel.org>
References: <20260624113148.3723541-1-qirui.001@bytedance.com>
 <2e47388a-8883-4b44-b440-a00b8e622733@kernel.org>
Date: Thu, 25 Jun 2026 10:49:05 +0200
Message-ID: <87pl1fvwce.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_014909_269918_C3A4105C 
X-CRM114-Status: GOOD (  10.47  )
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

Michael Ellerman <mpe@kernel.org> writes:
> On 24/6/26 9:31 pm, Rui Qi wrote:
>> call_on_irq_stack() uses struct member offsets to set up its link in the
>> frame record list. On riscv32, struct stackframe is the wrong size to
>> maintain stack pointer alignment, so STACKFRAME_SIZE_ON_STACK includes
>> padding. However, the ABI requires the frame record to be placed
>> immediately below the address stored in s0, so the padding must come
>> before the struct members.
>> 
>> Fix the layout by making STACKFRAME_FP and STACKFRAME_RA the negative
>> offsets from s0, instead of the positive offsets from sp.
>
> The fact that all uses of the defines need to add back STACKFRAME_SIZE_ON_STACK
> makes me think the defines don't have the most useful values.
>
> If the values were offset + padding then the uses could be left unchanged.

At the moment we only have only one user which has nothing except the
stack frame on the stack. Other potential users do not necessarily add back
STACKFRAME_SIZE_ON_STACK.

The offset value depends on the function. So I think it's better to
leave that offset calculation to users.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
