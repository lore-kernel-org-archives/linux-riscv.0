Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781EEC25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQKKHvn4OSremmsiefTrKXqc/Eh8LT4T4bEQy0Jf7PA=; b=2Oe98P7OX8vlsv
	sr+a5dAdgbEdzG4e+PR7tI+eQsVrZn7PtNCxyf4fX+mzNCv9pSgm6hzen4+iA+5h6CWIwVFAw+n7C
	cAFLxa+MKaNqOnerzK7jrh02hhouMD0W+IqIZ3ngMIkFO6GPrNaSwyL09yRuiAcGgIurBobwZNZhE
	XOKSmBZoqweBPHDSTY6zFCox6IPsLwzOOpyoKwxJpEhF5PqFeQ359cWHAYl6ettXi3VmdP3zj2lLO
	+IZOB36iH7DWryOnynAnDELYNjSqWxon64EEdV5ZWDA7O9cHNcODrqQEhS/IOs83ROn2HKpzTp+ws
	ylTbic7220sLqTM0Nakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPKyp-006IZh-K1; Sat, 20 Aug 2022 09:41:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPKyn-006ITh-8V
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 09:41:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2F56B80B72;
	Sat, 20 Aug 2022 09:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3295BC433D6;
	Sat, 20 Aug 2022 09:41:15 +0000 (UTC)
Date: Sat, 20 Aug 2022 10:41:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: guoren@kernel.org
Cc: xianting.tian@linux.alibaba.com, palmer@dabbelt.com, heiko@sntech.de,
	conor.dooley@microchip.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	liaochang1@huawei.com, mick@ics.forth.gr, jszhang@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
	Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH V3 3/3] arch: crash: Remove duplicate declaration in smp.h
Message-ID: <YwCsNnfGwkTYShGs@arm.com>
References: <20220819025444.2121315-1-guoren@kernel.org>
 <20220819025444.2121315-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819025444.2121315-4-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_024121_478772_DF1883B7 
X-CRM114-Status: UNSURE (   8.44  )
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

On Thu, Aug 18, 2022 at 10:54:44PM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Remove crash_smp_send_stop declarations in arm64, x86 asm/smp.h which
> has been done in include/linux/smp.h.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: x86@kernel.org

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
