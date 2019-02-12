Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CCBC282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 08:15:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E97E22081B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 08:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tj+JVNRN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E97E22081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhykRQtbOY7T/Yx+wWmKBtYflEkLJyN90DaI1l7sQg4=; b=tj+JVNRNuWyts3
	QeKskFfmXOS2TFIKrObwkcwnzAhPNyB1YXTdWPI6fXLZNgyxzDSqg0+Zvc5lWigBdSceGWyrL4Mz5
	2teFjmWLnUQ/KKCzcUVTPR+H1GHmTm9MJK+97hBe8+QCnybtLtrIbmLDc+CKd6upiaElFX3SDPmF8
	t9/bxJmscPMR12pDVLhz1b0eV7MWVuQ54x3zgT+2MzaOiI2iOgRa0wlSkQrNSWN6GFTY8RKE9GP0+
	rY07md7N8KApRkkK0vmiFxKpsQ7IrE67LdYdYpBvsqE0chdIWtZ0TkfW8pHB1JRxZqIDQ2TmJNRsx
	N9hA95v9aJb71OrV/z7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtTDt-0004aH-Nk; Tue, 12 Feb 2019 08:15:21 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtTDr-0004Zd-5q
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 08:15:20 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C279AADED;
 Tue, 12 Feb 2019 08:15:14 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: sbi_trap_error: hart4: trap handler failed (error -5)
References: <mvmftsuv2ea.fsf@suse.de>
 <5cfec923-57ac-e576-d296-a29f5ba00ac1@wdc.com>
X-Yow: RHAPSODY in Glue!
Date: Tue, 12 Feb 2019 09:15:14 +0100
In-Reply-To: <5cfec923-57ac-e576-d296-a29f5ba00ac1@wdc.com> (Atish Patra's
 message of "Mon, 11 Feb 2019 12:17:08 -0800")
Message-ID: <mvmsgwttobx.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_001519_368774_8E0C3B54 
X-CRM114-Status: UNSURE (   7.31  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Feb 11 2019, Atish Patra <atish.patra@wdc.com> wrote:

> It would help if you also give some more details about the platform and
> boot flow you are testing. Are you testing OpenSBI + U-Boot + Linux or
> OpenSBI + Linux (kernel image as a direct payload to OpenSBI).

The latter.

> Are you getting this error on QEMU or Unleashed ?

On the unleashed.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
