Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A04C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 15:04:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB0582070B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 15:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YGtQGIMr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="IjN4f0Qk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB0582070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/slzVADdI4Vzn9+0O41G581ePsI+44+jmbyxUnv8tCk=; b=YGtQGIMrf/ryXT
	fZ4O/N0ox6YwUkQTD9rwR14LicWvn+boR/C4CWhAc/zvD6DT6WsNlEvKkA6d1KRNHe9vT7Z0K1rUr
	KGUx+5Jn5y9pAt+d+cUkrQMlN6LnKNJbjiKzypdhpLM9pE9evKQ37A6BgeBDdgYp1semujD2c5V/5
	57/NA0lOcxiZNgzqo4+b/kI0BEUX44QnkXOQPtWRrnMbh+Epc5IoVMp7i3cQ4ilJfnuhqvaKQJimB
	1N5KgvAhZ3tg3fVS6tIGNJrxCPpnGO/71/2mF3WEyrTtSZombkJczgOTL/9StX10wXCataVF0ToNK
	of/wU639GQ1hm0sM0OEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxCNF-0005Pc-H5; Fri, 22 Feb 2019 15:04:25 +0000
Received: from a9-35.smtp-out.amazonses.com ([54.240.9.35])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxCND-0005P9-Bg
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 15:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1550847858;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=f+XnVhxJbXthUOpO5Fy1JvASNopGIWnNIj6pf0a5wHQ=;
 b=IjN4f0QknHnYF8++DaaXKb05fw0Zc+uwVRJbzusmZcNz2/VADWL9EAxuHx87lNki
 lP0c1rdawJK+5V7cuGPRl/FSUGmt/rbJW3l22uevCgdv3AiZbLzR00AuWnaz0KqN/Od
 vG1VmL7iO4O3rVLHhzM94g1HSvH59liVEezeWY2U=
Date: Fri, 22 Feb 2019 15:04:17 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
Message-ID: <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-SES-Outgoing: 2019.02.22-54.240.9.35
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_070423_505291_0539807A 
X-CRM114-Status: GOOD (  10.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: bjorn.topel@gmail.com, paul@pwsan.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 21 Feb 2019, Palmer Dabbelt wrote:

> That said, it's all a moot point here: our LR/SC instructions are part of the
> A extension, so if you have those you have AMOs.  The general policy here is
> that if there is an AMO that efficiently implements what you're looking for
> then it should be preferred to an LR/SC sequence.  This specific case is
> actually one of the places where AMOs have a big benefit as opposed to LR/SC
> sequences, with the AMO implementation looking roughly like
>
>    li t0, 1
>    la t1, counter
>    amoadd.w zero, t0, 0(t1)

Can you add a register that contains the per cpu area address for the
current hardware thread in amoadd?

If we do not disable interrupts and preemption then the instruction could
be executed on any processor since the OS may preempt and reschedule the
kernel thread arbitrarily. We need a global register that contains the per
cpu area address (which is different for every hardware thread). If the
instruction is rescheduled on a different thread then the other offset
needs to be used so the instruction need to specify that the addres is
relative to that global register.

PowerPC uses such a global register. On Intel the GS segment register is
abused for that purpose.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
