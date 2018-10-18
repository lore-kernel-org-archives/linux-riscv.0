Return-Path: <SRS0=9tbA=M6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884F2C5ACCC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 09:41:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EDFF2083A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 09:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CMDwfD6w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EDFF2083A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=13M0X5eMmujIdKgUW+YaYMP97FG21CU0NBkNtzaWjqk=; b=CMDwfD6wWYbjTQ
	VQAYBAOiEEvntFWjHbaBOP4Zw+hvAOCzNV56GxY3X13X/Q/yf9Jt6kQpfQWyu+v0r9pQFh7JWFElL
	Di5LVQ4zs2Tx2YTYs9/s5kw9fFxfoqmwPEDA60JRazpI0MUTg8t6MunNkvbc6MlKacgdPUb2I9ZX+
	hESsaSDQrLQD3wiD4+UT1IrIMRgjuclXepH4GyCmjHTjRcNQJ4ViwU7eg10CniZ6AOnxCxbCM417H
	rlG4iGn5hgKROsiQSOdJdMsllktYe98tSfUMgPiEy2YQgWQGGLI1ujDUE16JgzuuY49D8tw9nyA8M
	kxwLZga9h0MmFq3H17tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gD4no-0006cg-QG; Thu, 18 Oct 2018 09:41:12 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD4n8-0005Zv-CA
 for linux-riscv@lists.infradead.org; Thu, 18 Oct 2018 09:40:31 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3845EADEF
 for <linux-riscv@lists.infradead.org>; Thu, 18 Oct 2018 09:40:17 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: Hifive-U vs 1000baseT
X-Yow: I hope you millionaires are having fun!  I just invested half
 your life savings in yeast!!
Date: Thu, 18 Oct 2018 11:40:17 +0200
Message-ID: <mvmftx3twxq.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181018_024030_568657_DE1D7637 
X-CRM114-Status: UNSURE (   6.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181018094017.FSu7EuP9V35M_0EWcGwbNwmAGGEYS-wdaxOcSg2iDyo@z>

Are there any known issues with ethernet on the Hifive-U connecting to a
1Gb port?  I see that the port gets a link, but no traffic at all.  When
connecting to a 100Mb port it works fine.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
