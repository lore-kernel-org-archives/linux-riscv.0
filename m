Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09505C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gm+4dVhoa4ArGb8afQTX4LiG74cu15J3hn5gZ+LFtY0=; b=td89nNZMwoLkCt
	ixacLhNnFEOKMmbjKLDJfcHnOMZyCDY769PNh1IEOAmdqf8XvBTGR8vpYkw+STxXJAOe030/C6yqK
	tIjECvrCZYZ8SqPMNYaTaWLpwDb6OZ9RUwKGNPIxZ0MwsvwOk4T2Y/kirNshvRDGx+qUD+xRvE7CB
	90haKabZcY1RWEwhkkrja/B9L4C3Y9ypEx8uAcuWCnLsOiGRBZFEWCY+aLAdHCvf8UGVyepn5qdQP
	ojmGop1LsR6rLU+B+tVfIP6TLEBvfzDjVYkikTGA3rfwYQeH4KmzpW9oidk28VQ1ateFblYsIR4+t
	Kw0lLHLAZ2ujzTeU5mow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2wYw-0061cP-K0; Wed, 07 Dec 2022 15:42:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2wYt-0061Vp-HS
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 15:42:21 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p2wYs-00042O-72; Wed, 07 Dec 2022 16:42:18 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, anup@brainfault.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 1/4] Documentation: RISC-V: Fix a typo in patch-acceptance
Date: Wed, 07 Dec 2022 16:42:17 +0100
Message-ID: <1864243.TLkxdtWsSY@diego>
In-Reply-To: <20221207020815.16214-2-palmer@rivosinc.com>
References: <20221207020815.16214-1-palmer@rivosinc.com> <20221207020815.16214-2-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_074219_605566_3D09CB6F 
X-CRM114-Status: UNSURE (   8.69  )
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

Am Mittwoch, 7. Dezember 2022, 03:08:12 CET schrieb Palmer Dabbelt:
> I just stumbled on this when modifying the docs.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
