Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0523FCED63F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RAid7LByuthmdgVvCA1LXct5po5F74WdR5HsyI94VY=; b=fsHuEVYdOu8jgf
	9F9g2/59j9s5DaLT38I8+5SsPSSkCEuXKDDdredcaRwBbi7TMeb7XLVAbac1xHgfhRA9RiZDr3olD
	EFa7VSYQae+368J2Zf8CWAaWBLI5N5QfBi8sauYL74WJCmaA7axy7prOlCPT54mYABx8neTLS9GPz
	oLwqp8of1ZRLvXHvoCwHHEvcmYrZAQYwYFb0GRDGvcR8e1DZ4vl7MCNN82vQWwzzZhVPzv5KX8CX6
	YA2UQtwvBcXN1esLULrCBS+uz52vn501j2YBZs1Qr/k5XXj98VpOypUJ/DEsceZgdSNQEvuSylgtC
	H793m0cunTxnGwmg6rUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLQM-00000000SL5-3N9I;
	Tue, 18 Nov 2025 13:07:10 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLQI-00000000SKI-39uV
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 13:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763471220; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=EnIDh0HJgKxwQb31liCsQP34D8Yjbk5hFoiHSWRZ7cE=;
	b=AdKRGgOv4gQBpoTB7NU6OgLUVYGB9p3zz7CIDscQgGSPaKHWKyywNHQ3ZlwnjzOOowIaBVeTJfVwuxwIX8z8QtihH6VbsJ7PPf5Ehar8vWW3DWZRKFpVcZ9ESxOF+T0P8Cbhr/8fiCRAVIdDTwfl/KarOn8aCKPHtvz2SFxYp0k=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WsjrMO0_1763471205 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Nov 2025 21:06:52 +0800
From: cp0613@linux.alibaba.com
To: pjw@kernel.org
Cc: anup@brainfault.org,
	atish.patra@linux.dev,
	cp0613@linux.alibaba.com,
	guoren@kernel.org,
	haibo1.xu@intel.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] tools: riscv: Fixed misalignment of CSR related definitions
Date: Tue, 18 Nov 2025 21:06:44 +0800
Message-ID: <20251118130644.468-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <421f4746-8d75-227b-6459-bbd82dfd6fa9@kernel.org>
References: <421f4746-8d75-227b-6459-bbd82dfd6fa9@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_050707_494038_6BC4C6F0 
X-CRM114-Status: GOOD (  13.14  )
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

On Sun, 16 Nov 2025 10:22:34 -0700, pjw@kernel.org:

> > The file tools/arch/riscv/include/asm/csr.h borrows from
> > arch/riscv/include/asm/csr.h, and subsequent modifications
> > related to CSR should maintain consistency.
> 
> Thanks for the patch.  A few comments:
> 
> > Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")
> > Fixes: d1927f64e0e1 ("RISC-V: Fix the typo in Scountovf CSR name")
> 
> It seems like this is pushing the definition of "fixes" here.  It looks 
> like the only thing wrong with those patches is that they didn't change 
> the files under tools/. right?  It would have been nice if they had 
> included the changes to files under tools/, but since the patches don't 
> introduce any bugs directly, I don't think we should include these Fixes: 
> lines here.
> 

Yes, that's true, thanks for reminding me.

> >
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> 
> Please, no blank line between the Fixes: headers and the Signed-off-by:.
> 
> I've removed the Fixes: lines and the superfluous blank line, and queued 
> this for v6.18-rc fixes.
> 

Thank you for your help.

> 
> - Paul

Thanks,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
