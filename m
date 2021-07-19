Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44215C07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:43:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037116112D
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037116112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=efficios.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aB/Uf+6fiFb+anu9KGuoqaOdpKHG/y862bCsgo6DB5s=; b=CZ9vKZnsMM3Gr79ZWcTNgfpW1V
	ML+nDX64q6JiQQS7C72RfvJ9iu8bDcu7FF1uTst2giXQd+9gyCtxm0em2jtIenPawkwvxS5KJEH9/
	Y6qobVKhAGodc70vo6RjxRm098c9n/JFHsgUaAQd/9yniCcbNrQjAWIX3IooyBdInsvUPgWjy+lbZ
	e6+wv1sg3eZ/E5pi9wKXdWW89GFP4xDvu+OGrjHHp3/tjoG4QdPBIVJDoOGsgPXfP3f9mqsyPsQ1h
	fP3Fd84N04M8Xmh/SGO0azYmpZubgq5BwbiBv0SPL0dkREYWGPJyBZ2BZa/wf5aPstElpCUYJCNjA
	hBi9dLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5UUK-009wKz-IX; Mon, 19 Jul 2021 14:43:20 +0000
Received: from mail.efficios.com ([167.114.26.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5UUH-009wIs-VM
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 14:43:19 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 46A85368E44;
 Mon, 19 Jul 2021 10:43:12 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 26RKPd2CIvGt; Mon, 19 Jul 2021 10:43:11 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 063BC36909B;
 Mon, 19 Jul 2021 10:43:11 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 063BC36909B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1626705791;
 bh=de0GThxO6PSlD37MzhGtHRKbYXX9HTffYP5G6p3CMdg=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=aFjed2K3OyYgZKzXWrUAG6Jc1NXo/aeMCY8/7L/GSef5XVm2xNIM2go3EVmiQiLCJ
 9brYsup+v5p5VCDopV2ynTVTutKHKU7LEy2/otAMSRlQUIJXlIOlzNWwSW30ogMDcO
 dVVfqLAAJJ866PlJb2jlBZnK5ALubPYl1EVr8HgEcmVhdeLB3ibdS8fidFkoIYkqzQ
 eY7nBTPfPigwTTyLp1kfqCyVg7bGcBAiGssowmiKEJ83QMXC3UsoeYhhAFKiovD9Fl
 ZtTqZZuHWXjDJAB46RBaXwb+TzkkReJTkfYxNeBrYnLut6EH80IsnNuEUUMHmN7LaF
 xj50Ic6dgliIA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sf-mVCvsc1_g; Mon, 19 Jul 2021 10:43:10 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id EB702368CE8;
 Mon, 19 Jul 2021 10:43:10 -0400 (EDT)
Date: Mon, 19 Jul 2021 10:43:10 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@linux.alibaba.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-kselftest <linux-kselftest@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <1257037909.25426.1626705790861.JavaMail.zimbra@efficios.com>
In-Reply-To: <1583733592-22873-3-git-send-email-vincent.chen@sifive.com>
References: <1583733592-22873-1-git-send-email-vincent.chen@sifive.com>
 <1583733592-22873-3-git-send-email-vincent.chen@sifive.com>
Subject: Re: [PATCH V2 2/3] riscv: Add support for restartable sequence
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4059 (ZimbraWebClient - FF89 (Linux)/8.8.15_GA_4059)
Thread-Topic: riscv: Add support for restartable sequence
Thread-Index: korcCokQEeN3DVoNTVQS7BBBu9PEUQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_074318_145974_360C147A 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

----- On Mar 9, 2020, at 1:59 AM, Vincent Chen vincent.chen@sifive.com wrote:
[...]
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -234,6 +234,7 @@ static void handle_signal(struct ksignal *ksig, struct
> pt_regs *regs)
> 	sigset_t *oldset = sigmask_to_save();
> 	int ret;
> 
> +	rseq_signal_deliver(ksig, regs);
> 	/* Are we from a system call? */
> 	if (regs->cause == EXC_SYSCALL) {

[...]

As Al Viro pointed out on IRC, the rseq_signal_deliver() should go after syscall
restart handling, similarly to what is done on every other supported architecture.

Note that there is already an upstream commit derived on this non-upstream patch:

commit 9866d141a097 ("csky: Add support for restartable sequence")

which is broken in the same way.

I'm not sure why I was never CC'd on the csky patch. Considering that nobody
bothered to implement the rseq selftests for csky, I don't see how any of
this is tested. I would favor a revert of that commit until the testing glue
is contributed. Unfortunately, the csky commit has been upstream since v5.7.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
