Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B44C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 11:35:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1396C61423
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 11:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1396C61423
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D6NUTbXTJlzdXe5eEXovDiRlgi5sPEq2e+F6/O7gOAc=; b=G0EgvL2DyfS+2xwtojQ6TK2lz
	bzYT36nc41BbyCJreYzZXv1VkXdteomTT40CFbCIsKAP6i1jePF4IhKQnWBIYnIVaY0RfP7RwSjgh
	pIqIKbMAF3p1mEGu8P5Z1Vr1IbuAL1apyfXAXOe+wC8UYzE5wvDl01yPie4URVp9Z52OOtOTu749F
	Pv8+nbL2thrzWz4Wccbrii4TwFf1u2/VhHm/wfvYuAqzjBGnfDhpU/96a49+TQRJZNWeglrxT69uh
	PLPRTDMU3N58hkZGLNJyH+ucVbWqTzUdL8uZzVeWGsesGlI00TXB0pP/9c8PeDtJ0YxeO7YzyH/xm
	8kq47in/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcRPu-007juB-9h; Fri, 30 Apr 2021 11:34:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcRPr-007ju3-V2
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 11:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=pknrEZADBe5pecUuZoUnEdYNMNO0TlrodWPYW8IYZMs=; b=vw+S7aS9BBRK7UlrgaUmLITI96
 plZLVnu0DeRkQ4vIIDmJ9TZAWKIJs8RDsg1Gf21VwDczN/ZmLHyVzU8w+MAu1VMD8EzoY2oUc/J5x
 AThRQtDppUOowfpcfAYXIFZ1R9qke0TtltHulL5wHeQLm611OafR4SVmSy3sjti8UtcnnsVDMPVY6
 /Zv955qBZZrjX/udrQuxrmXtaIlf7yqfoh54Tl0zhaJSVv1hv57arcbd53Jg/UHz/GEOkC5wuja5g
 K3jclrkz8rkZdJNvoRX3i2LbAxqBRcPGArP39gLVygGslIlMWNffbhafu9smHAAq9BE9Cj5EFoKjp
 heWuu7cA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcRPp-001Kjs-6Z
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 11:34:38 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07B1461423;
 Fri, 30 Apr 2021 11:34:33 +0000 (UTC)
Date: Fri, 30 Apr 2021 07:34:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Anup Patel <Anup.Patel@wdc.com>
Cc: Changbin Du <changbin.du@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu"
 <aou@eecs.berkeley.edu>, "peterz@infradead.org" <peterz@infradead.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "jbaron@akamai.com"
 <jbaron@akamai.com>, "ardb@kernel.org" <ardb@kernel.org>, Atish Patra
 <Atish.Patra@wdc.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "rppt@kernel.org" <rppt@kernel.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>, "zong.li@sifive.com"
 <zong.li@sifive.com>, "guoren@linux.alibaba.com"
 <guoren@linux.alibaba.com>, "wangkefeng.wang@huawei.com"
 <wangkefeng.wang@huawei.com>, "0x7f454c46@gmail.com"
 <0x7f454c46@gmail.com>, "chenhuang5@huawei.com" <chenhuang5@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-team@android.com" <kernel-team@android.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
Message-ID: <20210430073431.1bc4946d@oasis.local.home>
In-Reply-To: <MN2PR04MB6207E102997326E6513416AB8D5E9@MN2PR04MB6207.namprd04.prod.outlook.com>
References: <20210429061713.783628-1-palmer@dabbelt.com>
 <20210429123007.5144fc0d@gandalf.local.home>
 <20210429215451.yuey5gzmfh2dkzp5@mail.google.com>
 <20210429224742.391154ae@oasis.local.home>
 <MN2PR04MB6207E102997326E6513416AB8D5E9@MN2PR04MB6207.namprd04.prod.outlook.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_043437_294770_7E1A0FD1 
X-CRM114-Status: GOOD (  10.87  )
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

On Fri, 30 Apr 2021 04:06:35 +0000
Anup Patel <Anup.Patel@wdc.com> wrote:

> This patch only takes care of ftrace path.
> 
> The RISC-V instruction patching is used by RISC-V jump label implementation
> as well and will called from various critical parts of core kernel.
> 
> The RAW spinlock approach allows same instruction patching to be used
> for kprobes, ftrace, and jump label.

So what path hits this outside of stop machine?

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
