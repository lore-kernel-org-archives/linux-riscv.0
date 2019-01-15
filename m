Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA122C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 13:53:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A930420651
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 13:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZyXT6zp+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A930420651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnmoj2QETjU6dgoJJBsHCSBrhtmP4MQI3LF3wUIUXUY=; b=ZyXT6zp+3elcpE
	jIq5RSrf8mU2LGlVNLHevmfH1Vf2M2UZdzAQXiT9kPaRoq0j7o8Ia7ziOvZEm0Oy4+1HbD5e/PUXB
	SIs+A3vub/P+enHgOnxYRKIGJCRpZvx+w1CQ3+7OVeGnbnYJXZawVdI3m7xZ6bVBxp1U+Y84ViFX4
	c0VdExgJA1FKjdNcufhnDyMcjm0iTzdT6Oc8ojho0MEY+lFog9Ud8ixkzaCpzQcoagoGDMVbthdYi
	hMerE7GKPiX7mh7dWGvBrUNJ3h474YuQu3BCHmpio5WtEndxqYZbp+58JiqJro/lot88xB2SJ/Lzo
	ilCs94echs4O74cVkWOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjP9U-0001VY-NL; Tue, 15 Jan 2019 13:53:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjP9S-0001VD-AV; Tue, 15 Jan 2019 13:53:10 +0000
Date: Tue, 15 Jan 2019 05:53:10 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v2 4/8] RISC-V: Allow hartid-to-cpuid function to fail.
Message-ID: <20190115135310.GD28946@infradead.org>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-5-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1546940318-9752-5-git-send-email-atish.patra@wdc.com>
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
Cc: Patrick =?iso-8859-1?Q?St=E4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 08, 2019 at 01:38:34AM -0800, Atish Patra wrote:
> It is perfectly okay to call riscv_hartid_to_cpuid for a
> hartid that is not mapped with an CPU id. It can happen
> if the calling functions retrieves the hartid from DT.
> However, that hartid was never brought online by the firmware
> or kernel for any reasons.
> 
> No need to BUG() in the above case. A negative error return
> is sufficient and the calling function should check for the
> return value always.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks fine (modulo the line length issues):

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
