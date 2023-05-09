Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B1FC77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 02:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/h1FVNhu1rvS7lwascdNcRgX0AcXcJuMO+cx783/+o=; b=KPhs6eRiKq8fY7
	yMkhceD7ezvb71Vh5L5ZNCfgAZ/cZOrJ8mmCpzFjPiX34yjWaRL88ghB+vy7B4dCJme25aP4c1QcV
	vnWP/zyh765uoN5u7vf8XUFVLl8kwG39lPzNYtnlxkn4l+dTMyhJZ2ar/oCAVzln7EAO2QAWU7zzn
	m2vKKU9qPDDbLx7K7iJLni0GvbXA6AFh9qi+8lMkeHaiuUVb9IryrcS/p3mI5EdglHL9LZC6fpmOh
	NAT4YzLHddAMGB0irqpbxULhp11pUgFNA8sA+lMCyY7MzbR67RKA75H67qS0Lcs6o9uEKLI6F+2zP
	D3BXl94L6KR6bB96Umrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwD09-0026Zs-16;
	Tue, 09 May 2023 02:22:53 +0000
Received: from m12.mail.163.com ([220.181.12.199])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwD06-0026Yk-1R
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 02:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=S5IyO
	NWTmO0xvL6UmZk6zW+EVi1q52PaUMUXaKqlOvw=; b=fLsTQQa2Z3gGdW+wNMqdO
	XNWRVEWW1vu0BREP5sUwYT9sS9ztcM45mOOnJ0pKp+rGKHcUks4J4vOQwwaGKAQW
	QBSDUJHsnpNZ6zm5h3eO8BhtKEPRke4+uMDx/4wkyMwZnMgYFNnTwdgtl8QM79Qi
	9F7kT89guxPysfdsLz3ptI=
Received: from zhangf-virtual-machine.localdomain (unknown [180.111.102.183])
	by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wBXf4dSrllkqHhsBQ--.30265S4;
	Tue, 09 May 2023 10:22:15 +0800 (CST)
From: zhangfei <zhang_fei_0403@163.com>
To: ajones@ventanamicro.com
Cc: aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhangfei@nj.iscas.ac.cn
Subject: Re: Re: [PATCH] riscv: Optimize memset 
Date: Tue,  9 May 2023 10:22:07 +0800
Message-Id: <20230509022207.3700-3-zhang_fei_0403@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509022207.3700-1-zhang_fei_0403@163.com>
References: <20230505-9ec599a36801972451e8b17f@orel>
 <20230509022207.3700-1-zhang_fei_0403@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wBXf4dSrllkqHhsBQ--.30265S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4xAFykJw1fJry5CF1rWFg_yoW8ZrWDpr
	yfKrnxKrn0qrZ2y3WxJa1DKrn0qw1rtr47Jayrta48Crn8Ca17Zw4fCa4FgFyxJrW8Arn5
	Xw1avw1xZF98C37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9_-PUUUUU=
X-Originating-IP: [180.111.102.183]
X-CM-SenderInfo: x2kd0w5bihxsiquqjqqrwthudrp/1tbiWxZql2I0Z8wmqwABsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_192250_909360_7C7B5A14 
X-CRM114-Status: UNSURE (   7.26  )
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

From: zhangfei <zhangfei@nj.iscas.ac.cn>

> >  5:
> > -	sb a1, 0(t0)
> > -	addi t0, t0, 1
> > -	bltu t0, a3, 5b
> > +        sb a1, 0(t0)
> > +        sb a1, -1(a3)
> > +        li a4, 2
> > +        bgeu a4, a2, 6f
> > +
> > +        sb a1, 1(t0)
> > +        sb a1, 2(t0)
> > +        sb a1, -2(a3)
> > +        sb a1, -3(a3)
> > +        li a4, 6
> > +        bgeu a4, a2, 6f
> > +
> > +        sb a1, 3(t0)
> > +        sb a1, -4(a3)
> > +        li a4, 8
> > +        bgeu a4, a2, 6f
> 
> Why is this check here?

Hi,

I filled head and tail with minimal branching. Each conditional ensures that 
all the subsequently used offsets are well-defined and in the dest region.

Although this approach may result in redundant storage, compared to byte by 
byte storage, it allows storage instructions to be executed in parallel and 
reduces the number of jumps.

I used the code linked below for performance testing and commented on the memset 
that calls the arm architecture in the code to ensure it runs properly on the 
risc-v platform.

[1] https://github.com/ARM-software/optimized-routines/blob/master/string/bench/memset.c#L53

The testing platform selected RISC-V SiFive U74.The test data is as follows:

Before optimization
---------------------
Random memset (bytes/ns):
           memset_call 32K:0.45 64K:0.35 128K:0.30 256K:0.28 512K:0.27 1024K:0.25 avg 0.30

Medium memset (bytes/ns):
           memset_call 8B:0.18 16B:0.48 32B:0.91 64B:1.63 128B:2.71 256B:4.40 512B:5.67
Large memset (bytes/ns):
           memset_call 1K:6.62 2K:7.02 4K:7.46 8K:7.70 16K:7.82 32K:7.63 64K:1.40

After optimization
---------------------
Random memset bytes/ns):
           memset_call 32K:0.46 64K:0.35 128K:0.30 256K:0.28 512K:0.27 1024K:0.25 avg 0.31
Medium memset (bytes/ns )
           memset_call 8B:0.27 16B:0.48 32B:0.91 64B:1.64 128B:2.71 256B:4.40 512B:5.67
Large memset (bytes/ns):
           memset_call 1K:6.62 2K:7.02 4K:7.47 8K:7.71 16K:7.83 32K:7.63 64K:1.40

From the results, it can be seen that memset has significantly improved its performance with 
a data volume of around 8B, from 0.18 bytes/ns to 0.27 bytes/ns.

Thanks,
Fei Zhang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
