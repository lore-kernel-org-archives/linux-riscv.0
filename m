Return-Path: <SRS0=wzy2=D6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135E5C388F9
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 06:50:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 909FD2223F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 06:50:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yTGMeb36"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 909FD2223F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fKnPFlKV9ni1gXrqbIys/Lwum8qfOVQrgXNQOBioFHc=; b=yTGMeb369UvCYx1V/BXeu+B8w
	ZZG8X2fEvrA44F6bX8oGBaxnC4cqDFSROLvV7f0eK+crrLYbbivgQeAo2ShPzn1k7Q0Uw6RRDTnNM
	CCOJz/xp7om3QZZtCBTqjirpr87WtUzEJOizMX1L6Ftfpt/ubPBq5bEZ9i0QhQUdusw5BMcNuftrl
	pVYLcKgLBJOWFyaAwMdIYljRiYcrZqJh0puDwVBi5d4xjEaq5S1FS/+ChSILBRsPEM6IN56rqobQL
	6gdG318uKxBLeOLkG2Qrj3FuRoerseGBVZjqKkQd9R9XH5WaZ3MivK50t1eeIFgMEpxDUqzgjEu/E
	ObqEcu7Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVqtv-0007TR-71; Fri, 23 Oct 2020 06:50:11 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVqtp-0007Rk-FB; Fri, 23 Oct 2020 06:50:06 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B09E267373; Fri, 23 Oct 2020 08:49:58 +0200 (CEST)
Date: Fri, 23 Oct 2020 08:49:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v4 7/7] mm: Remove examples from enum zone_type comment
Message-ID: <20201023064958.GA30209@lst.de>
References: <20201021123437.21538-1-nsaenzjulienne@suse.de>
 <20201021123437.21538-8-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021123437.21538-8-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_025005_703556_1FF5DF1E 
X-CRM114-Status: UNSURE (   6.22  )
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
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, will@kernel.org, catalin.marinas@arm.com,
 guohanjun@huawei.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 ardb@kernel.org, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-rpi-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 lorenzo.pieralisi@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 robin.murphy@arm.com, hch@lst.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
