Return-Path: <SRS0=iJWH=NH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AA8C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 15:12:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B5A360E97
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 15:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B5A360E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeldEQPrs+ZfrQNuefCTQIjaUX51XDpzPOGT21ObDDw=; b=VpWz1WnaOfRAwG
	ebRLaZlf6pE0wpSApm7K9XFBsPLhMPCHsWyuI4gidWHuy5SDgcHgUAfILQG9UXE3d+NOrQZQtD83W
	/l3HY0BP6HjfUpHcNgJd1vMdKmkFq6I8PoRLPiBaQLoYZ+v2mRJP+zxcbVsfvQP4wDTzNCcfdYKOR
	bTZxG590Gzpfud/qBey0f7+2Jd/PMdPNUYIN2gDlDQ4I5iGKt79jwAWKHMW/AeNppkG1DnXB50vTj
	W6h54bDQAyqJVz+U5XmkmW4rybbndqMtUSUMs0P23T+rYvoICIUdKq2qO1ZI9g8/yE+F+xQIjyfBJ
	wOlYsVRflEUZZxf1h0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFeHl-00HKbs-Cy; Mon, 16 Aug 2021 15:12:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFeHa-00HKas-CV
 for linux-riscv@lists.infradead.org; Mon, 16 Aug 2021 15:12:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0952260ED5;
 Mon, 16 Aug 2021 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629126729;
 bh=uMo8LGfOpe/Almoc8bvAMBEGmqtUS03nPV5PwNh4VaY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NI4STxOvEvDLYkD7cp4EEsv7L1JSA2zVa86AjYMQEt7F0nAhYRfHwh0nuCLtpE4LR
 vzJQdTCeVjixYe3wvkbhORrDwIAhUlEmbl1X4tzJv1tWG4+vTy4qnYkmzJgnUY/CKk
 rTOiYmwPhqQhim0CZVdGtL0BXlsBonMY0aI38U76onGVUblLRHDXk4WL0/i2Ou2tB/
 yAwZjbwNhzpgiWXDdOGqEtEImzkkNPvL5uCH3lmUP6HpI0GjmhHvZMs8nxeSNDI+R5
 fvfIO4W375ehpFLSvnh/VKr2FWb1U48j8SbhyNysnYgb+HCe+YVr5PsrfdkOLQraFP
 KGfhKiozb7CeA==
Date: Mon, 16 Aug 2021 08:12:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Matteo Croce <mcroce@linux.microsoft.com>, Eric Dumazet
 <eric.dumazet@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Drew
 Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>, Jon
 Hunter <jonathanh@nvidia.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH net-next] stmmac: align RX buffers
Message-ID: <20210816081208.522ac47c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <874kbuapod.wl-maz@kernel.org>
References: <20210614022504.24458-1-mcroce@linux.microsoft.com>
 <871r71azjw.wl-maz@kernel.org> <YROmOQ+4Kqukgd6z@orome.fritz.box>
 <202417ef-f8ae-895d-4d07-1f9f3d89b4a4@gmail.com>
 <87o8a49idp.wl-maz@kernel.org>
 <fe5f99c8-5655-7fbb-a64e-b5f067c3273c@gmail.com>
 <20210812121835.405d2e37@linux.microsoft.com>
 <874kbuapod.wl-maz@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_081210_502461_C845FC0E 
X-CRM114-Status: UNSURE (   9.72  )
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

On Thu, 12 Aug 2021 12:05:38 +0100 Marc Zyngier wrote:
> > A possible fix, which takes in account also the XDP headroom for
> > stmmac_rx_buf1_len() only could be (only compile tested, I don't have
> > the hardware now):  
> 
> However, this doesn't fix my issue. I still get all sort of
> corruption. Probably stmmac_rx_buf2_len() also need adjusting (it has
> a similar logic as its buf1 counterpart...)
> 
> Unless you can fix it very quickly, and given that we're towards the
> end of the cycle, I'd be more comfortable if we reverted this patch.

Any luck investigating this one? The rc6 announcement sounds like there
may not be that many more rc releases for 5.14.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
