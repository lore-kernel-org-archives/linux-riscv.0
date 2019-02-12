Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1CDC282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:13:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B4F2217FA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 07:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WcE8HGI4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B4F2217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBL12bzMyVD5Cwm0z17B0f6IgNh7+al99BK7Ett4Cbc=; b=WcE8HGI4pQfYwL
	L2bpg5+sF68SJRt7R6Ek4lTwTW+b64xGmnB/O/73FQ9VbzhX7bnHqLYlwnHBTS9QPErUz49HwA7M7
	CylALb/OgxTmHR3BwEJTfqioIs0myAlbxP4O5Jxu1dzINUk6ECEQg/S/DmPX/ULRaC7tk+3s9G1hv
	3Pbz8cR01AteSOtfSjZUtRaN8L4E9Zk6EF1tFBiQ/2qynNeRSkZP5/t70KhDBOdFVU7/IS1QPSVm5
	v8Pp30QZ+yJm8FrhT2iTnn06XdbF0phUQMD1h+3Io03zoz5gieFCqlHGeCPOLsM7lwCyB7kU+zMJ+
	sdQ3NKuj3lnvgE7XV9aA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtSGC-0003E4-C1; Tue, 12 Feb 2019 07:13:40 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtSGB-0003Dv-PZ; Tue, 12 Feb 2019 07:13:39 +0000
Date: Mon, 11 Feb 2019 23:13:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 5/5] riscv: use for_each_of_cpu_node iterator
Message-ID: <20190212071339.GL26747@infradead.org>
References: <20190118140308.9599-1-johan@kernel.org>
 <20190118140308.9599-6-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190118140308.9599-6-johan@kernel.org>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 18, 2019 at 03:03:08PM +0100, Johan Hovold wrote:
> Use the new for_each_of_cpu_node() helper to iterate over cpu nodes
> instead of open coding. Note that this will allow matching also on the
> node name instead of the (for FDT) deprecated device_type property.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

I think this is going to conflict with the ELF caps changes from
Atish.  Maybe the riscv_fill_hwcap hunk should be included in his
patch?

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
