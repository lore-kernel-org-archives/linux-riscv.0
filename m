Return-Path: <SRS0=A8D8=X6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89323C3E8AB
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2019 10:25:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CEBF222C5
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2019 10:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UyyMDtD3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CEBF222C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4pC7etpTIbodOCVrbIsRvGusJGe/pZTahg9rVlaD4k=; b=UyyMDtD37shB0O
	WB4ookkU+6yiLIyHaENBukCXyA0CcyDXCOA6g3/0/M9wpoMsiw1qDpTGnrsEyoKkfQ9CUvQOnDBWX
	iQlKtpsJotAmxQXFNffGau6utAOVSbPbB2KigWAb51vWHcKHdKiTrX3/ZEpYSKRa+ee0haUyTLoTQ
	24OLcdx+K+4ECsFMj+h0MhgPHahuOHSUHeVeuUb2zR95SftjrcEtVyPH+FZM6l8vRkHthd72hFTUI
	ykv4bQOdOezpasDsnPYJHdXlqhusZG4bXy/0V23WfFPeAZ89ZQe7D4ltH35V1BZvH766JExbGn9Qy
	c15dqBqv3uNm7tUwng4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGhGA-0001sW-5t; Sat, 05 Oct 2019 10:25:58 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGhG6-0001ri-Ux
 for linux-riscv@lists.infradead.org; Sat, 05 Oct 2019 10:25:57 +0000
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1iGhFt-0005mX-DY; Sat, 05 Oct 2019 12:25:41 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.92.2)
 (envelope-from <aurelien@aurel32.net>)
 id 1iGhFt-0000fU-2C; Sat, 05 Oct 2019 12:25:41 +0200
Date: Sat, 5 Oct 2019 12:25:41 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: Fail to bring hart online on HiFive Unleashed
Message-ID: <20191005102541.GA22188@aurel32.net>
References: <20191003200735.GA26760@aurel32.net>
 <73a9ba9fd6c29075209a61660137fb4b899f7ff2.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73a9ba9fd6c29075209a61660137fb4b899f7ff2.camel@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191005_032554_997793_A8AC992C 
X-CRM114-Status: GOOD (  16.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 2019-10-03 23:13, Atish Patra wrote:
> On Thu, 2019-10-03 at 22:07 +0200, Aurelien Jarno wrote:
> > Hi all,
> > 
> > When it happens, the kernel logs contain:
> > 
> > > [    0.049851] smp: Bringing up secondary CPUs ...
> > > [    1.082530] CPU2: failed to come online
> > >  [    1.086267] smp: Brought up 1 node, 3 CPUs
> > 
> 
> The log is aligned with the outcome. CPU2 never came up within 1 second
> for some reason. How often do you see this ?

It happens about 80% of the time.

> I tried couple of times and did not see this issue. Here is the log
> 
> OpenSBI v0.4-50-g30f09fbfd1ec (Oct  3 2019 14:03:20)
> U-Boot 2019.10-rc4-00023-g72efcc8f00fc (Oct 03 2019 - 14:03:12 -0700)
> Linux version 5.4.0-rc1-00004-gecd4522e3e09
> 
> Here is the bootlog.
> https://paste.fedoraproject.org/paste/-gr1Zeg4~UBs~bqIPraJwA
> 
> If this issue is reliably reproducible, here are some areas to dbeug.
> 
> 1. __cpu_up() in smpboot.c has a 1sec timeout for each cpu to come up.
> 
> You can increase that time just to make sure that it's not a hardware
> issue.
> 
> or
> 
> 2. Put some debug prints in U-boot/OpenSBI to confirm that all 4 harts
> did  come up at each layer. 
> 
> You can also just use kernel image directly FW_PAYLOAD_PATH in OpenSBI
> to avoid U-boot. That may give a clue if it is a U-boot issue or not.

I have tried that first as it's the easiest to do. I have not been able
to reproduce the issue when skipping u-boot. I'll therefore now try to
debug that using your suggestions.

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
