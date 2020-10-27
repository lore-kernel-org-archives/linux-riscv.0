Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5F7C388F9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 16:59:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB9720809
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 16:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWDu7D/s"
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6feOxWzYg8VHFFmi7Qbu/P1x3pbQ68QBNmqZTHaruho=; b=iWDu7D/s20n8oJ
	TPw5ktIiEZ7pJqonwQbY6bUrcQ2jS68x6uReU32OmMwbJ17UAKf8Zsc3xw+lYPXQqZKB/UncLs+tJ
	MMcanVw1QjCeyhhloaGiRGV2m4pFPWJOrfx9clXGpDQv33rE0ldMSOsF+cnVYJAFWBWVebXPh3vFo
	Xf7kkwdcvgp5SdZtqUYU7e1H482+RCi4huVok0aJHwxBuTaExdijIxVHUVzGla0/54ZDAQnfdcVj3
	IcY3SfSfydAXlDNvJKx6lQdcAlHNvCKEIUvFoLwKHMMT+AnLUMjN+4S7V3PDkdDAuIvgMEcLEAFKX
	9BS1gcHLGY3nUiwbMk+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXSJ9-0007Ps-U6; Tue, 27 Oct 2020 16:58:51 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXSJ6-0007OX-Ss
 for linux-riscv@lists.infradead.org; Tue, 27 Oct 2020 16:58:49 +0000
Received: from cpc98990-stkp12-2-0-cust216.10-2.cable.virginm.net
 ([86.26.12.217] helo=[192.168.0.10])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1kXSJ3-00080I-0K
 for <linux-riscv@lists.infradead.org> ; Tue, 27 Oct 2020 16:58:45 +0000
To: linux-riscv@lists.infradead.org
From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Linux kernels for Microchip Polarfire Icicle board
Organization: Codethink Limited.
Message-ID: <1e50d459-efc0-e8ba-bff9-21c981d04554@codethink.co.uk>
Date: Tue, 27 Oct 2020 16:58:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_125848_955643_58BB8F4A 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I have been looking at running a new kernel on a Polarfire icicle board.
I started with the Yocto from Microchip, but was wondering if there is
any other work around this, public repositories or anyone else working
on it who wanted to collaborate.

I would particularly like to get PCIe and USB working.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
