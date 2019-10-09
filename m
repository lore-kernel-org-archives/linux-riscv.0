Return-Path: <SRS0=8slP=YC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5FAECE58D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2019 08:53:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E66218AC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2019 08:53:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GWD9aDzD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E66218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NOlRr7I4PP0GEthSP5xmuAMKSR+FXHEM7yKPOERC47o=; b=GWD9aDzDTp1mv/
	RfCnTEhDg1rCr0UiqHNv/0Y6Y2sYLPn9zGvFiuHll0pcMHptBdARFqpi/Hnr25mN9vU7KsxiBBMEJ
	CiVWpUVSfNFyVtO0sgcTJ+IGlkkF59BijUp+E/APFBq8muMuQTJ2QkK4fUwkNBWT+g3Y3VwpDX44n
	wDrpjPZT2PdP3OQFlB4xY9lhT2X4/J2j9Hak02Q4AHm8I9CajZymSsikTQFCQnlG331joy2RhPGAz
	qZ7bec6RyHmXay3lJDhLCLYH/N0GQ+zTwWw6o/v2lMhc5/pAV+YRtwOlCjB3rEPK/qFZXEy/5cz3g
	5tkZh+7E6x8h11PZRTuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iI7is-0000xn-PE; Wed, 09 Oct 2019 08:53:30 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iI7ip-0000x4-QN
 for linux-riscv@lists.infradead.org; Wed, 09 Oct 2019 08:53:29 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x998bE2t098477;
 Wed, 9 Oct 2019 16:37:14 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 9 Oct 2019
 16:53:13 +0800
Date: Wed, 9 Oct 2019 16:53:14 +0800
From: Alan Kao <alankao@andestech.com>
To: <paul.walmsley@sifive.com>, <palmer@sifive.com>
Subject: Does sfence.vma implicitly cover what fence.i does?
Message-ID: <20191009085313.GA14021@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x998bE2t098477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_015328_112353_AF82462E 
X-CRM114-Status: UNSURE (   2.33  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paul, Palmer,

In arch/riscv/include/asm/tlbflush.h, the comment says

> Flush entire local TLB.  'sfence.vma' implicitly fences with the instruction
> cache as well, so a 'fence.i' is not necessary.

and in the privileged spec, it is stated that

> Executing an SFENCE.VMA instruction guarantees that any previous stores
> already visible to the current RISC-V hart are ordered before all subsequent
> implicit references from that hart to the memory-management data structures.

So my question is straightforward.  Is I-cache a kind of memory-management data
structure?  am I missing something here?

Thanks for any clarification.

Alan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
