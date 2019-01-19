Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F5DC5AE5E
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 01:44:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA8A20850
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 01:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z9M73c6R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA8A20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pwsan.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSmLJk0RaVG4ji8BjqODyqzfRvuXXugUTk3bkziGxSw=; b=Z9M73c6R5WSkaV
	Kz7LqoIzydz3oYkvLWCG+9c9onA7YXcvBn90SzxZ1IzejdT3xtwvciL4GuUEoZ5pmoMHxMXy+2xvL
	DFiHyVFYt0de5CSPoMF6D4PhUwO2TClIRrUwrpxCj9mpYfKH363MQmXz6mw30q21ZjfUi5cPZ5GHl
	OR2QuCPHaMckpC8IAH83kYxiAk01FsIocOuhyl/ehGuCybs3fyGD+7fvyxGRdcxQOrnLGCASoYpVE
	g7GlzTJFPMuzU3CXt40Y3hl4DN3+uuHpOs7MI+B5J+y/JXQkBugdVeZOkTpxEfUi2JGzx7atVXm6V
	5/hDGKLIkAQ1QlnZJ3Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkfg2-0001QG-Kq; Sat, 19 Jan 2019 01:44:02 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkffz-0001Ps-Gj
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 01:44:00 +0000
Received: (qmail 9298 invoked by uid 1019); 19 Jan 2019 01:43:58 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 19 Jan 2019 01:43:58 -0000
Date: Sat, 19 Jan 2019 01:43:58 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 4/5] riscv: treat cpu devicetree nodes without status as
 enabled
In-Reply-To: <20190118140308.9599-5-johan@kernel.org>
Message-ID: <alpine.DEB.2.21.999.1901190140510.8813@utopia.booyaka.com>
References: <20190118140308.9599-1-johan@kernel.org>
 <20190118140308.9599-5-johan@kernel.org>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_174359_634079_8A06108E 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jan 2019, Johan Hovold wrote:

> Follow the Linux convention and treat devicetree nodes without a status
> property as enabled rather than disabled, while also allowing "ok" as a
> shorthand for "okay".
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>

... although I probably would have phrased the commit message slightly 
differently - something like "Use of_device_is_available() in 
riscv_of_processor_hartid(), in place of an open-coded test."  That frames 
the change as one that removes custom code in place of an existing 
standard function for the same purpose.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
