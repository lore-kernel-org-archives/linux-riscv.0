Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D4AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376AA222A1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sG4AS8sU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376AA222A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEsRn7Ztv1IinkJtZobDt2RBCqe+LIAiWzDIz+BGcCY=; b=sG4AS8sU9kCks5
	DrCZIRgt0wjSZBZSkSYfM9oiGT1F0N4O4VGiVnvv/Q8ozfcReqNngL4dp6+LE/+gTHDmyiGEfx/rl
	07CW+e/KYzKvpwW4ZzQepvTwXOCerZVLbbMsb+L176XpTjuQ3VTc/SXFA/MNCVoB20LRvi4NxE0HJ
	HX+grIrw0MuIS2BwfruZXgKgTaMOjWAG2P4Rd6NZkEY70txWmSxDFHM07TNaRoJ8U+kcWGN6dj61c
	zPdSLvxgJTK5a9xQYbZwws3B9MW5YGAUyc8GkRiFZHzzn33H2w1m33u9u6ru7VCB1gwnrur6mfqKO
	nCOFmxaqJaAYPbGOgvsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guCmm-0002rJ-DN; Thu, 14 Feb 2019 08:54:24 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guCmk-0002qV-2K
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 08:54:23 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 958DDAFCA;
 Thu, 14 Feb 2019 08:54:18 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/11] powerpc: remove dead ifdefs in <asm/checksum.h>
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-2-hch@lst.de>
X-Yow: With YOU, I can be MYSELF..  We don't NEED Dan Rather..
Date: Thu, 14 Feb 2019 09:54:17 +0100
In-Reply-To: <20190213174005.28785-2-hch@lst.de> (Christoph Hellwig's message
 of "Wed, 13 Feb 2019 18:39:55 +0100")
Message-ID: <mvma7iyrbra.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_005422_257220_EA479284 
X-CRM114-Status: UNSURE (   7.95  )
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
Cc: linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Feb 13 2019, Christoph Hellwig <hch@lst.de> wrote:

> __KERNEL__ is never not defined for non-uapi headers, and GENERIC_CSUM

"... never not ... non-..."  That's a bit too negative, I think.  :-)

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
