Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B334EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 22:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PL7qN8ao9PHyVBMwGMw0LKLBpoxTVBWViNjEgKa0ZVM=; b=3jGZ6nDL2KvV8E
	wwdysfh+tn0+jJKjRF3M6z1T+tKr/S63GD2Ssxgs55HQdcJMGDeLAR58377LatvqyKaCfrS7wjdiS
	lTc8WOhUbr8tI1YLaLUmBIz6plTEOYjVPtV/5GKKSENth6AjGWAwSR5tqlZFXA8h/pEkINq8dc5/s
	VmzInUrE0Snrh2v1fR/eeGossIFoAY1PZoiQddArSU6F2DhcgqTEy+hisIXzEavekGF0rV9R/rGK0
	eHB8Gci0dEf83B4czJYgLTBoN2nU7nBblkps0N5Z8yQduseHSu4+ni8it0DPh4b/7trq235QkhTgJ
	mJgE3tdMwGPgbbDlRdUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhIYF-00AZrN-MC; Wed, 20 Apr 2022 22:11:55 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhIYB-00AZmN-UG
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 22:11:54 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4KkFJD0kZCz1r0PY;
 Thu, 21 Apr 2022 00:11:40 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4KkFJC5Cqvz1qqkB;
 Thu, 21 Apr 2022 00:11:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3mtlwbvpiYJD; Thu, 21 Apr 2022 00:11:38 +0200 (CEST)
X-Auth-Info: 8HbkyrIVus8sGoHUetusB0Obnv7jg/sLKvDsDI9Z4rWZKW80iKNKFlX3jwZgpAnd
Received: from igel.home (ppp-46-244-167-235.dynamic.mnet-online.de
 [46.244.167.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 21 Apr 2022 00:11:38 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id B225C2C3AC9; Thu, 21 Apr 2022 00:11:37 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,  rdunlap@infradead.org,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu,  anup@brainfault.org,  vincent.chen@sifive.com,
 guoren@kernel.org,  Atish Patra <atishp@rivosinc.com>,
 alexandre.ghiti@canonical.com,  jszhang@kernel.org,
 vitaly.wool@konsulko.com,  gatecat@ds0.me,  wangkefeng.wang@huawei.com,
 mick@ics.forth.gr,  panqinglin2020@iscas.ac.cn,  rppt@kernel.org,
 linux-kernel@vger.kernel.org,  linux@rivosinc.com,  kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH v2 1/4] RISC-V: Avoid empty create_*_mapping definitions
References: <20220420184056.7886-1-palmer@rivosinc.com>
 <20220420184056.7886-2-palmer@rivosinc.com>
X-Yow: If I am elected, the concrete barriers around the WHITE HOUSE
 will be replaced by tasteful foam replicas of ANN MARGARET!
Date: Thu, 21 Apr 2022 00:11:37 +0200
In-Reply-To: <20220420184056.7886-2-palmer@rivosinc.com> (Palmer Dabbelt's
 message of "Wed, 20 Apr 2022 11:40:53 -0700")
Message-ID: <87a6cfh0bq.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_151152_148190_63A796DF 
X-CRM114-Status: UNSURE (   9.70  )
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

On Apr 20 2022, Palmer Dabbelt wrote:

> (create_pmd_mpping() ends up skipped on XIP_KERNEL).

Does it?  There is always the semicolon left as the body of the
conditional (which is why you get the empty-body warning in the first
place).

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
