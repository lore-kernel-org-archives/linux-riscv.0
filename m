Return-Path: <SRS0=gYOx=TW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2DBC072A4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 08:41:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F1DA206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 08:41:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="chFYy1qH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F1DA206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZE4Bx1DLMQRYf6Voy/WH7+rxciTKo4eF1L2baArXn0=; b=chFYy1qHKV9D87
	v6hUnFM4Y5h8DLmo4XBrAq6ECCErkV4pzfmuROO+ljjLclTdDSzeZEfIbPV8jkeoKHPbRk2tiaWpr
	SVL1lOWnpSQ58XEkHLuAPvUBxmYbLkB996FCv4ZCJaIQ34BD7O4utpz1DVT6PRL3dzC4InHja4SQ8
	gI52peIoDgnhEBqOpkWFMLoIpOreXgEkoDLuctexenJcDVTrwuU7D6YHrPt0yb6WTl2t2IUoJNMgm
	gaDNZEe3dwLpeeypQSYls3P996sasbDVQZm+9datBGi4GIiC1OfZ3eRmwNmoZO0czFBzBc53XgNrn
	4NiiEjJAHkOp6nwaBc6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTMo4-0002mM-7Y; Wed, 22 May 2019 08:41:04 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTMo2-0002li-Ce
 for linux-riscv@lists.infradead.org; Wed, 22 May 2019 08:41:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C67D1AED7;
 Wed, 22 May 2019 08:40:58 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: 5.2-rc1 boot on Unleashed
References: <5c1ffb76-b18a-dbae-d3ad-f3d2cd41ee44@wdc.com>
 <mvmtvdoi1re.fsf@suse.de>
 <636f53d9-1800-df14-896d-c95737203b2d@wdc.com>
X-Yow: He probably just wants to take over my CELLS and then EXPLODE
 inside me like a BARREL of runny CHOPPED LIVER!  Or maybe he'd
 like to PSYCHOLOGICALLY TERRORIZE ME until I have no objection
 to a RIGHT-WING MILITARY TAKEOVER of my apartment!!  I guess
 I should call AL PACINO!
Date: Wed, 22 May 2019 10:40:58 +0200
In-Reply-To: <636f53d9-1800-df14-896d-c95737203b2d@wdc.com> (Atish Patra's
 message of "Tue, 21 May 2019 11:14:00 -0700")
Message-ID: <mvm1s0qj2zp.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_014102_581076_88F3E656 
X-CRM114-Status: UNSURE (   6.38  )
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
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mai 21 2019, Atish Patra <atish.patra@wdc.com> wrote:

> 		prci: clock-controller at 10000000 {
> 			compatible = "sifive,fu540-c000-prci";

U-boot is looking for sifive,fu540-c000-prci0.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
