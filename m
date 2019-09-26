Return-Path: <SRS0=YEgk=XV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CE1C432C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2019 06:52:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346FF222BE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2019 06:52:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hinX272g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346FF222BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtH0H+73jJKzndi5F/sF4zhSfgsDpYIMYGSU0CFDEBk=; b=hinX272gbAM7hL
	KJP1+Jbt4eGZnhGIR+n9hFZudnZljsp5KKXDpGKpAuaBAX/11KjcSxccZrGX6N6gpzl+kuYbFv7Eu
	125cVSVXVx6M5zm65nSSRNLix16y3uCoH4nSl1RFc+l91eSr8KbfyvT23O8qzth8fVja9CE90Cx44
	3/44feW0P8XzmHuHNL5pft7ZUC1IJ+xQBL/5uQAQwlg9BheJHAQm2EdHGr1GZAg5oFJkEXASixMh5
	ywssLsbg4N0/27NWDppmOWYJk0Yq3ESq2LJY4LqnRoOTOb+bYJxFDMovNWTBeKEw6jRCMNgeKS6IZ
	FHC49lHXKAcVyZCeitXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDNdz-00029y-LB; Thu, 26 Sep 2019 06:52:51 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDNdx-00029E-5Z
 for linux-riscv@lists.infradead.org; Thu, 26 Sep 2019 06:52:50 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 801E8ABB3;
 Thu, 26 Sep 2019 06:52:44 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH] riscv: move flush_icache_range/user_range() after
 flush_icache_all()
References: <20190926022938.58568-1-wangkefeng.wang@huawei.com>
X-Yow: It's the RINSE CYCLE!!  They've ALL IGNORED the RINSE CYCLE!!
Date: Thu, 26 Sep 2019 08:52:43 +0200
In-Reply-To: <20190926022938.58568-1-wangkefeng.wang@huawei.com> (Kefeng
 Wang's message of "Thu, 26 Sep 2019 10:29:38 +0800")
Message-ID: <mvm8sqb4khw.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_235249_358038_29CB2F16 
X-CRM114-Status: UNSURE (   5.16  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

https://lore.kernel.org/linux-riscv/mvm7e9spggv.fsf@suse.de/

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
