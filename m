Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB19CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+ViyrjI8AFLxNKMHFALyum3HJXJZ/zRVbg2u4Bw/oY=; b=Fq9/c2zF9lB0pB
	QS8e99Y0YITWpOgXNHDHKG+w+HzDqGROfJnodzIzpfCaFdwRUkNdNf0Ss7OFq3qsrxB7WM1UG7dmI
	h3FriyFCFjZbqiq/L0scMec5IH1fSjD5SMPzX4oKoJ/hdVPVK4DDX35uztEkwnin8e8FFw0WCKvOl
	iqXbEU62pjaJRLKB1TJo1AcaTeDmJYou1V1cJcp2UAkS65gh+tmmnNQ5HKtiqEHblPMGyM8WsKXqn
	SriHRZY/ZMfvF7dYwunbPk1fYtuXBF8rr+P/tM9mKtEmQGy5F8YtJ03CyE2TuKNnSuUeRm8FAfnXr
	+pbFEb2qn75gNwq2RoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1zx-00000000RXX-32hq;
	Tue, 06 Oct 2026 10:02:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1zw-00000000RX6-2mFc
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 10:02:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AD2B436FB;
	Tue,  6 Oct 2026 10:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEF31F000FF;
	Tue,  6 Oct 2026 10:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791280932;
	bh=20r9y/3pqO+oU52vGaQ2rGrnfbyQCVghQBykrxxnv1A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=kxtcNyol/Emt1DBEO8ThveH/imjIWTlQnEM96WkTVODvMyc2TRTSf82UfeWp+lAbA
	 nTptIYK7vbROotCaTxmcxOXg/OqtG5t8BiyjQk84bD8rHdDs9kTGa6yCwh98XIYNvB
	 R591gh6H/Tx7VgDrBdcyWX3eDXIINXC5lBz0zJXaija7UlXiMEWU1Z5ZMaI+qAuGyq
	 PcENXvf1LuWBmQXSHIV/mJta6TrOB3N9Z/JetFjTvDj0bIy3DKITi3YA9FK5f67NUM
	 Y9MwKZE4Rc0cUEtGMsOZoFVaoXMYlpqvFMEG+lbeSwPVKz1ARVWzgr4gFAPh3b9fC2
	 u7VqdVcv854Vg==
Date: Tue, 6 Oct 2026 04:02:08 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, andybnac@gmail.com, 
    dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
    daichengrong <daichengrong@iscas.ac.cn>, 
    Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: Re: [PATCH v6 2/8] riscv: vector: refactor context switch for
 kernel-mode vector
In-Reply-To: <20260918215154.2481482-3-tchiu@tenstorrent.com>
Message-ID: <1d9e4bf4-e057-f671-3285-c5613869ca56@kernel.org>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com> <20260918215154.2481482-3-tchiu@tenstorrent.com>
MIME-Version: 1.0
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

On Fri, 18 Sep 2026, Andy Chiu wrote:

> When context switching out a thread in preemptible kernel-mode vector,
> there are 2 distinct cases: One is voluntary switch and the other is
> trap-introduced switch. We don't need to save vector context for
> voluntary switch and the context is always !dirty as long as we clear
> the dirty bit at riscv_v_context_nesting_end().
> 
> Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>

Thanks, queued for v7.4.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
