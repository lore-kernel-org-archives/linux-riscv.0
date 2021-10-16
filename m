Return-Path: <SRS0=v6lb=PE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18A4C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 07:07:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CFA260F9D
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 07:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CFA260F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QvH5NISztNWnMhZnJKv/wILF8pIxjy0xxnZGECyp5M=; b=gamp7jHSBUfu2Y
	Z15rRZ08zfSXrFhEuDF9TijFfSNcinGJePVLY30vyJnqTtNSVzJPVpwswItb5KUnuYUJ1dL6vhMKs
	Bh63zd/VUA7277v4+uj+f31lZT+mR/Hl/mMs8/2jQ+yyvmCMHgGQllamQKhk+eeTiJFkch2VZ8nDh
	Ycr5zBKlXlwKSigyKpMSQtwsXTj1qPOeFcmmFt1Aq7Pke822KEdHRbDYcw2I0qaRxOsbFCkXGRjN+
	4bxPTJOwTTeFVz+9A4cPn3bBxkl0gpjad2wCSiysqvo9pkiojKcTM3IRKZ1yxhbpiKE4UhsEBkRJ+
	0hhxW7/5PoaZXjTq/hYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbdn5-00A1Jj-Ex; Sat, 16 Oct 2021 07:07:35 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbdn2-00A1JC-S1
 for linux-riscv@lists.infradead.org; Sat, 16 Oct 2021 07:07:34 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4HWZ2j2GfSz1qwdY;
 Sat, 16 Oct 2021 09:07:25 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4HWZ2j0mb5z1qqkG;
 Sat, 16 Oct 2021 09:07:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id e3wCBQBOMcud; Sat, 16 Oct 2021 09:07:23 +0200 (CEST)
X-Auth-Info: No1qsPtfFRC9ZuIkUUM30dyIMijkYssVQQxOsW3Cr6nnbsovXVT8eKA04H+4eQ0m
Received: from tiger.home (ppp-46-244-180-223.dynamic.mnet-online.de
 [46.244.180.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 16 Oct 2021 09:07:23 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
 id AA29C6AEEA; Sat, 16 Oct 2021 09:07:22 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: guoren@kernel.org
Cc: anup@brainfault.org,  atish.patra@wdc.com,  maz@kernel.org,
 tglx@linutronix.de,  palmer@dabbelt.com,  heiko@sntech.de,
 robh@kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,  Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: update riscv plic compatible string
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-3-guoren@kernel.org>
X-Yow: PUNK ROCK!!  DISCO DUCK!!  BIRTH CONTROL!!
Date: Sat, 16 Oct 2021 09:07:22 +0200
In-Reply-To: <20211016032200.2869998-3-guoren@kernel.org> (guoren@kernel.org's
 message of "Sat, 16 Oct 2021 11:21:59 +0800")
Message-ID: <87mtn9mor9.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_000733_101698_509BC0AC 
X-CRM114-Status: UNSURE (   9.36  )
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

On Okt 16 2021, guoren@kernel.org wrote:

> +  The C9xx PLIC does not comply with the interrupt claim/completion process defined
> +  by the RISC-V PLIC specification because C9xx PLIC will mask an IRQ when it is
> +  claimed by PLIC driver (i.e. readl(claim) and the IRQ will be unmasked upon
> +  completion by PLIC driver (i.e. writel(claim). This behaviour breaks the handling

Missing close paren in both parenthetical remarks above.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
