Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E7AC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 19:45:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F269F64F52
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 19:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F269F64F52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=efsHENHewjF0r7lWwMK2iCQDdWf3uIcV6a8uwPqUJPI=; b=KUep1cGQKetCJrTU6NC7vrgC/
	IAqQmi94KeCQ0iDjO/pCQJxiMKuRiCmKYBZGPN8pXlNcV71zoxEBEON6Qp1rsLpL77xoM8CvTtM8u
	OL/cRb+C08UencECkNvTqy8i8XG5PGNzhWwC2JuLcnkW02E8dkMc/9ID66627x8h8Nj2pYZxd9Y6x
	dfothNKQQ5qiFreHkW0op7gB7z5xSJTtb3fFTg2bwL9yLS5QWndyeSqkgJvN9olMm+HlTNQiwyiSF
	v86fm/91srgG5gqQe0gWJdP4VuFG+EE6m0D6QEdNUQZv5wzNvFjZBuWWcEMimwhBNu5evI3Gj4Hz4
	rJvs5Fhrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMFd1-001kCF-Ui; Tue, 16 Mar 2021 19:45:20 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMFcv-001kBe-6I
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 19:45:14 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F0Nzp5fCLz1rxMm;
 Tue, 16 Mar 2021 20:45:10 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F0Nzp42vgz1qqlD;
 Tue, 16 Mar 2021 20:45:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id HVprAfGCzxsU; Tue, 16 Mar 2021 20:45:09 +0100 (CET)
X-Auth-Info: SurgzyzvOEKJPZRKHt6wkP9W5Z0YUNK8ZVcNfo2fRZpxXEba/9GDDNhI7l/OoTV0
Received: from igel.home (ppp-46-244-163-222.dynamic.mnet-online.de
 [46.244.163.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 16 Mar 2021 20:45:09 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id E3E372C37EC; Tue, 16 Mar 2021 20:45:08 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Zong Li <zong.li@sifive.com>
Cc: paul.walmsley@sifive.com,  palmer@dabbelt.com,  sboyd@kernel.org,
 pragnesh.patel@openfive.com,  aou@eecs.berkeley.edu,
 mturquette@baylibre.com,  yash.shah@sifive.com,
 linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
References: <20201209094916.17383-1-zong.li@sifive.com>
X-Yow: When you said ``HEAVILY FORESTED'' it reminded me of an overdue
 CLEANING BILL..  Don't you SEE?  O'Grogan SWALLOWED a VALUABLE
 COIN COLLECTION and HAD to murder the ONLY MAN who KNEW!!
Date: Tue, 16 Mar 2021 20:45:08 +0100
In-Reply-To: <20201209094916.17383-1-zong.li@sifive.com> (Zong Li's message of
 "Wed, 9 Dec 2020 17:49:11 +0800")
Message-ID: <87v99qyjaz.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_194513_323641_2DB62A47 
X-CRM114-Status: UNSURE (   9.71  )
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

On Dez 09 2020, Zong Li wrote:

> Add a driver for the SiFive FU740 PRCI IP block, which handles more
> clocks than FU540. These patches also refactor the original
> implementation by spliting the dependent-code of fu540 and fu740
> respectively.

That breaks ethernet on the fu540.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
