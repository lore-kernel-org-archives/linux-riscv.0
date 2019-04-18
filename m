Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEB1C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 12:40:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2198821479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 12:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AV9VVcw1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="MwwctOBf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2198821479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/ksVzqDR9jhbKmJqeTRDKXtDDJOWggILWi8ol0ZvjI=; b=AV9VVcw1p1aEr7
	S8EPz8hFQ6x3qagjQA7p6rVWcE7y/iCRJgFxUO31Cgw+nYdHtHALM4YX7BXJpxS7OCOACwP+nJYQu
	6QMk5BftIN1A4C7rF2my9ACN803qab7euJ4VilcQ+FMyiH8tF5vSDX9YbnkhRA1QssCnE7xFrFeQV
	EcMrSOoDKgt5dIF8T3CIFyNVw0CfN2Rc45J0eiQ1Xly7Tx+PUKCzWeYYJhxFic1QrMs92ylTDLb19
	ujLU0Ttex6ZffGWa9Fc+998Pv4JcqQJeBWxoISxT5RP4UaNI+4BOlPwbLpSReg9T0ulBip99x/ugR
	TsV2yObcFUaAY0p8xxnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH6LU-0007WF-BK; Thu, 18 Apr 2019 12:40:52 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH6LR-0007Vt-VZ
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 12:40:51 +0000
Received: from zn.tnic (p200300EC2F112E003868EF36058F9C84.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f11:2e00:3868:ef36:58f:9c84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F3DF11EC0380;
 Thu, 18 Apr 2019 14:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1555591244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=A/tlFZXrPGyk1/ajtcj9AEpnfcVu3SpUU/A9NTuHNdk=;
 b=MwwctOBfcJ2PECzysA1+jPvueLwTMePZpD0sNt95MklC6BbiXNzU6mZ8VO5CKLaEDi0IxM
 9KiAipPZo+hb4gLJ6AEecpdte/69Ggrf0bc9o2iIHudMukiVkLsAg49TxNx98RIXyJVMmU
 4Ql1WDeqPJQ5QUGUjiBRSHwVXMP2Pp8=
Date: Thu, 18 Apr 2019 14:40:42 +0200
From: Borislav Petkov <bp@alien8.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/3] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
Message-ID: <20190418124042.GH27160@zn.tnic>
References: <1555328443-30874-1-git-send-email-yash.shah@sifive.com>
 <1555328443-30874-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555328443-30874-2-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_054050_166815_EE1A5622 
X-CRM114-Status: UNSURE (   6.51  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 robh+dt@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 15, 2019 at 05:10:41PM +0530, Yash Shah wrote:
> This patch adds device tree bindings for SiFive FU540 L2 cache controller
> driver

Avoid having "This patch" or "This commit" in the commit message. It is
tautologically useless.

Also, do

$ git grep 'This patch' Documentation/process

for more details.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
