Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BC1C4452F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 03:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upmoi3gSf0OrJL3PnuRlQFWlJOw1PulQEhGY4V0h6g4=; b=HVc9j/HxmJ7Xtp
	NXUgcqGNNMts4p+ZOS97+ukKK2Ee+imQ9d/demTMGa3ZZuaQM6wDFcT7/pm1cDWSvZRmcfBzUV8KV
	ctZYkXWFEsU/NlOZf98f32l/urgEYXkYUFuvLIzXdsMblf+NvbtyaH74RzLyd2Y6gOk1AQNAXqWPm
	YthDK+kikYaHO0DDPZaLo3/RdtdjeipztCc233nnnr+e+yrMuQNgQs3gjry/RqLCz8XSMj8qBdZ1w
	8ojtLWbxHHLOl/CqdnpNkevKmeD9XKqpr34eug/z85AkF0loTc35DukRFjgvY+NRBOAGk4HbqQXSr
	5WeM9BOBaSqoMFSQBrow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1HT-00000008KXK-1Qmn;
	Tue, 21 Jul 2026 03:36:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm1HS-00000008KWy-2KM8
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 03:36:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F15C60A7A;
	Tue, 21 Jul 2026 03:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC821F000E9;
	Tue, 21 Jul 2026 03:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784604989;
	bh=x2XtjheenXuAfLtxWY5ueX0HaO8fYMOsMjj75fAMpCE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ABsb4LABx3jTQejwalmTVmuJ+M+A9r2gmB+IdMZ5ffpLhzLs90LrvURM+wj9EzAK6
	 agMm1lLhiPwsdBwmXB+zcdZR9Lda3DvD7Ga8XE8woxGvI6yDU7320cdH2m6u1YSFAs
	 4l1wRuzmVyQOnV9WYakacN7Gr8yVD6k7PSLkcYGc5lK3pqM/gZxeufkpmUGaT0uSzg
	 lTrJAzJSl0HPMqEN5sl8bpR8gxCsVkLL0P15OC0zO8v/8Vo9qkQ+FFSCCSIiKrdZn4
	 leGTsswVMEqgqARkfcRjjYn+ZZg2iA79FOQ2j4/WPVJi4Fjq+cdarqBVd3/2wepUlx
	 m+yx66E8cicxg==
Date: Mon, 20 Jul 2026 21:36:22 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Samuel Holland <samuel.holland@sifive.com>, conor@kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com
Subject: Re: [PATCH v2] riscv/sifive: remove warning in errata
In-Reply-To: <20260503-sifive_errata-v1-1-6f12a81bc267@sifive.com>
Message-ID: <b6d1bc46-ac36-d8a6-d41d-0bcb7aea3e24@kernel.org>
References: <20260503-sifive_errata-v1-1-6f12a81bc267@sifive.com>
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

On Sun, 3 May 2026, Yong-Xuan Wang wrote:

> The alternative patching of sifive vendor extensions also calls the
> sifive_errata_patch_func(), but the patch_id of the vendor extension
> (ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE) is always larger than
> ERRATA_SIFIVE_NUMBER. Remove this unnecessary warning.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
