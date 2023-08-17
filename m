Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3116EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 12:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nC2Be9nzZ25wE/1JcCCzaPQw807S9+w1Qn9idXgtKM=; b=Ec9H6Jyej6a2q7
	LMYThbSQQURlUGbPCfZoexvhH621gpZ5XwHwvK4SuQvD5kATOlr5DeLoM4W48kVNsy95MVo3msfO4
	ni4p62l+Vo9iPwZIC+fJS9mENwTsHZ6cm9ymNcj1qCMkUWV71viVJAXKzIE6RMBFgNS/WrJzx7gjd
	2wyY98vvi8Z+2C3nZ4lY95VolapnV/UUILUwkrvjVNQCD6XJHZjpSEKnCdDF62TxVMkz+v4XOMRrh
	44lCbDLvUJxGdqEynC2zzXJi+Z6JeHMWHDdhpSrSK3QT/JCLqU7qBbEhATicogBE9pHTP08KgXllT
	46oYFW1byk0elCs4rcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcE0-006NrB-2A;
	Thu, 17 Aug 2023 12:35:40 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcDx-006Nqh-0B
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 12:35:38 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id ACF1A92009C; Thu, 17 Aug 2023 14:35:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 9F4F692009B;
	Thu, 17 Aug 2023 13:35:29 +0100 (BST)
Date: Thu, 17 Aug 2023 13:35:29 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Andy Chiu <andy.chiu@sifive.com>
cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
    greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
    conor.dooley@microchip.com, Paul Walmsley <paul.walmsley@sifive.com>, 
    Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [v1, 0/3] riscv: fix ptrace and export VLENB
In-Reply-To: <20230816155450.26200-1-andy.chiu@sifive.com>
Message-ID: <alpine.DEB.2.21.2308161701040.8596@angie.orcam.me.uk>
References: <20230816155450.26200-1-andy.chiu@sifive.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_053537_279092_24223353 
X-CRM114-Status: GOOD (  10.73  )
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

On Wed, 16 Aug 2023, Andy Chiu wrote:

> We add a vlenb field in Vector context and save it with the
> riscv_vstate_save() macro. It should not cause performance regression as
> VLENB is a design-time constant and is frequently used by hardware.
> Also, adding this field into the __sc_riscv_v_state may benifit us on a
> future compatibility issue becuse a hardware may have writable VLENB.
> 
> Adding and saving VLENB have an immediate benifit as it gives ptrace a
> better view of the Vector extension and makes it possible to reconstruct
> Vector register files from the dump without doing an additional csr read.

 I think it is an incorrect view of the situation.

 We need to include VLENB not to let a debugger avoid reading VLENB itself 
in its own context, but to have a complete view of the debuggee's register 
file.  While the ptrace(2) API has not been formally standardised by a 
body such as IEEE or The Open Group, our practice across ports has been to 
provide a complete view of the debuggee via ptrace(2) without a need to 
resort to examine the machine and OS on the debugger's side via other 
means.

 So we're not improving ptrace(2), but rather we're removing a defect.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
