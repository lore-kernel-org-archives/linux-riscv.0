Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9071C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gg2Jm4JBXGj0uuECPKzAoAplyQCQW+NSSBwskNysd+E=; b=oZ6AHzm2EP9O7g
	gRRW2tW17qdlS9ecUi/1OJgF31xL3h7/5Jex3E+UF+a8QrQFe+FX2LlaScFtRSu0reqLlxYMr3xHU
	O65/hEYUtfp/nBeIu8y7lO8UO3MqLYlkD5hC6yuHhq+a+4Eef3sN2wEszk2v1fqVm/IbsX8mAFWGU
	FuSA4KJJYJCuTtcCni5ZSDHUilfu5J41lUADczPnhINfmlt5BtGTY0NztXXHcVlYl9+NJexpnGRFN
	3DBVhYx2lps4O8YkFbdL38zYwCiX8FVWh1D+ftfGT5P5/M1unO/crDn/Y70oEF+a+AVyeW6fkMvwi
	yHhV5UFs364ABxvIiNuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohAVp-00DNCf-Nf; Sat, 08 Oct 2022 14:09:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohAVm-00DNBh-LY
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 14:09:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2D53CB807E6;
	Sat,  8 Oct 2022 14:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF22C433C1;
	Sat,  8 Oct 2022 14:09:01 +0000 (UTC)
Date: Sat, 8 Oct 2022 10:09:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor.Dooley@microchip.com, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, ajones@ventanamicro.com, ardb@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 samuel@sholland.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: jump_label: mark arguments as const to satisfy
 asm constraints
Message-ID: <20221008100902.0bbbc1cc@rorschach.local.home>
In-Reply-To: <20221008100748.1078fb3f@rorschach.local.home>
References: <20221006064028.548-1-jszhang@kernel.org>
	<20221006124144.abaz74g7nxrb5hxj@kamzik>
	<4c8fa16a-8463-ee32-7307-0383fa94403c@microchip.com>
	<Y0GBO77e2Lu/khkI@xhacker>
	<20221008100748.1078fb3f@rorschach.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_070906_868659_350CD3BD 
X-CRM114-Status: UNSURE (   7.98  )
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

On Sat, 8 Oct 2022 10:07:48 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> Link: https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/
> 

This way tools can be used to map commits to links relevant to them.
They key off the "Link:" tag keyword.

-- Steve


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
