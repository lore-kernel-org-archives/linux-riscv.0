Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66150C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJ6svdUzXYUtLHzh4oOuIF6w4rKTfBBOvVhDJfCL+pU=; b=FPNw8GM43JyQx1
	mInA63QsstG2BAe6KxCFnEydxHk8nv3nC3M4fHPeHccQsU8XcVyo6bHqkoLcGR2+0MQIQek8t4fXo
	vl15zLFpoYAqgW6OH9hc9zUfJGxqLT0ZgObsjbx2lJetcbaYwWz+XsdIw0gBBLAyunsBXgcNKUMD7
	Nx+s/gFuxFAhn+Nyvqyltwh7kvJtxrNmNvCRnALrdQoS6eC6yszgtEPUiBos4D9/LRfgzmSJI533B
	6qz2/isvuelb7a16cWaInsCkNtFI0xS8BTRInhh1PnJ+w4bHIPaAZCpdawU1qQx3ZfAEAPlbpUQUt
	xkEsO/mkmgw2nMvzqoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npA51-00CUWv-By; Thu, 12 May 2022 14:46:15 +0000
Received: from [2400:dd01:100f:2:72e2:84ff:fe10:5f45] (helo=mail.nfschina.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npA4p-00CUQs-FI; Thu, 12 May 2022 14:46:05 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 144A01E80D22;
 Thu, 12 May 2022 22:40:19 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvZOnFFbob1U; Thu, 12 May 2022 22:40:16 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
 (Authenticated sender: kunyu@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 3FFCF1E80D04;
 Thu, 12 May 2022 22:40:16 +0800 (CST)
From: Li kunyu <kunyu@nfschina.com>
To: rostedt@goodmis.org
Cc: agordeev@linux.ibm.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com,
 bp@alien8.de, dave.hansen@linux.intel.com, gor@linux.ibm.com,
 hca@linux.ibm.com, hpa@zytor.com, kunyu@nfschina.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux@armlinux.org.uk, mingo@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, svens@linux.ibm.com, tglx@linutronix.de,
 x86@kernel.org
Subject: Re: [PATCH] kernel: Ftrace seems to have functions to improve
 performance through optimization
Date: Thu, 12 May 2022 22:45:32 +0800
Message-Id: <20220512144533.58085-1-kunyu@nfschina.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20220512101229.7886a798@gandalf.local.home>
References: <20220512101229.7886a798@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_074603_734920_12761315 
X-CRM114-Status: UNSURE (   3.56  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


I'm glad you're willing to reply to me. 
My current English level is limited, and I may not describe it correctly. 
I consider that these functions may not be modified in a short time, which may bring advantages in function performance.
I could only submit it by inquiry.

Thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
