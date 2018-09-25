Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5E4C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 16:33:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAA9D2083A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 16:33:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t1wPHcEt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAA9D2083A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uT0v0LpMzVIXeV0O+5p3QvBKPmKCPBxdJOTiMIGOZtM=; b=t1wPHcEtIGUGp8
	ocP5n1InNCQ56GQoeLCKPV2HzrdyqNkc3e6xxorDEy/W+vFT7aHTwPk4ysWF1RXqKuINlvyR909qa
	8Ioc436ob8zDHhInrLeMHNgtrujNc+Nw+o0PTz7jHp/wxJWk0VXaIpTneiGDbiBsu6iFRdKYw7eIK
	oef6+woU5VQmWXRDa0yzIoBZl3MrYJm8pwjDWjbiIoTxOgtQsOcapH2NbmRIfKhZ7awiSh6cANpZa
	e3dxIj1RcxWdo66M0xVsGmVpzjapbeZ/V5ujFwYk77/+vfr/kujSGJAZYWoktBcPq0br8AemUHB1W
	/GG/XyOfkkx4ZFS2gAsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4qHX-0005fb-TM; Tue, 25 Sep 2018 16:33:51 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1g4pzu-0005qT-NY; Tue, 25 Sep 2018 16:15:38 +0000
Date: Tue, 25 Sep 2018 09:15:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [GIT PULL] A Single RISC-V Update for 4.19-rc6
Message-ID: <20180925161538.GA5328@infradead.org>
References: <mhng-e3afd7a0-8f32-43a2-98bc-ef162868bede@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-e3afd7a0-8f32-43a2-98bc-ef162868bede@palmer-si-x1c4>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925161538.5eJth1f2uwvYQusB69lRm9JDW2DL_K8tgee88t72RTM@z>

I think this fix isn't quite right actually - we don't need asm-generic
asm-prototypes.h, as said in the review of this patch.

Also on it's own it isn't going to help with doing a modversions enabled
build, as the return_to_handler export needs to be dropped.

Last but not least I'm not sure who is going pull this if you only
send it to linux-riscv :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
