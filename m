Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC46EB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 18:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUiVz919OVnGpAQUSK6tUHZJrT0cAva8cgvgPXx7Pxo=; b=33isd5Vgjm601B
	PXkD4Gh/Y4cwgWyPwxIF2hGT6fLBuQcznrs0I8nmwVIRQyWtNAll1tmjMGxGamBPXekktVJkLN/LL
	4ODS9HIhGltOmXQ/pTE0MylGl/2Hf0S8efz+grCLoPNn1OVc3qnjMot0LdJXx7c2Az3T16zYJZV/n
	GHjy9SAZTJluEyT6Qfgo4Ufkb0bpR/E2hlC4w8q7x4Q3kKkrIo4CL2z/M7PCLPcuXpbA9JMIFuH76
	8A2/lLDTxu5lGPEU3iafdLpWEuBLRvsrHq6o26SKkRfAubRM5RXu0Kmj5POXoUkvdaIZ4YGiD6R3H
	Jsiv/Wd5McqUKrVOFSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2Em-008PRg-1D;
	Sun, 02 Jul 2023 18:55:56 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2Ej-008PR1-24
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 18:55:55 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362Itnlj017400;
	Sun, 2 Jul 2023 20:55:49 +0200
Date: Sun, 2 Jul 2023 20:55:49 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, arnd@arndb.de, david.laight@aculab.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 09/14] tools/nolibc: add missing my_syscall6() for mips
Message-ID: <20230702185549.GH16233@1wt.eu>
References: <cover.1687957589.git.falcon@tinylab.org>
 <5089ddd75a7cb01486f664c025876c803fe26d5b.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5089ddd75a7cb01486f664c025876c803fe26d5b.1687957589.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_115553_968945_B9E5DA9B 
X-CRM114-Status: UNSURE (   9.18  )
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

Hi Zhangjin,

On Wed, Jun 28, 2023 at 09:37:29PM +0800, Zhangjin Wu wrote:
> It is able to pass the 6th argument like the 5th argument via the stack
> for mips, let's add a new my_syscall6() now, see [1] for details:
> 
>   The mips/o32 system call convention passes arguments 5 through 8 on
>   the user stack.
> 
> Both mmap() and pselect6() require my_syscall6().

Very interesting, I didn't manage to make it work previously. Did you
test it to confirm that it works ? I guess so but since you didn't
mention, I preferred to ask.

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
