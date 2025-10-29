Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F680CCF9EE
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WF9QTVUMmeE4cDM1WMs70HaCJGNu+E21fnruZsXSrY=; b=BO9OOtQy71mjj/
	fJb1ar3etlEpF3FikTuNCG7GGpXsDF7SmbfHzkZeyia5gJ0/Ce+0ih0MJyLEk0xLDSwctp5tc5F3g
	GUwoZ2BaDVP4iH8s5E2VOyzVZbNOSpf5zO2qpIEzqWIcDhQCHiCH88Y5L/KQ1ClEZoNia0s+fd63L
	9WLwKddn8nXKR/XR/FTkep6t9DR5YiPAacOOWzuPXzZzWsOfT6hqzUn45z8wWaSKQaSxNDNFh921M
	XXc7On3AuKb4a26SHf26PY2yWAUA+pLQfs9LQLMmsVS8tNQQZPTeIHTC8saKasv4w9wV+oUPbZOX5
	NnmS9cpbZxrlV1OEe+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBWT-00000002WYq-0Ada;
	Wed, 29 Oct 2025 19:07:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBWQ-00000002WXO-2Vwb
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 19:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A87A454A3;
	Wed, 29 Oct 2025 19:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6220BC4CEFB;
	Wed, 29 Oct 2025 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761764869;
	bh=49v353t4/906lS7X2KOyZwahd8+PWlfEMWjxjmqfFBk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X7xfVF0otCc/bNp6n8AsU32/gwTfo4XDdL2PsZbw8COQEmU0B+g4CN1ng07YCSMFX
	 vooHhJQjlHWB7VeaGDB89lKi1mN5sJvDxuBMKtr/4ZMb+/5o41Wyw+cue9/Ips4kv+
	 aYyjST9s2qCbwp51eNFGqcw5UEjXn7q/AnDgyUt6aF1cUX45pVLphMC9kMSD/FunVF
	 v3N//YCPwkurJCEfiXZ39G3Exo0yx85F3YZPOdVzumY+RO8aoXF6O9PmU5DLcLUze6
	 8ZcvH6+cSHi9Axtri6YN9zi0MAuvhnZQKU0PjPVBpDzIY1ojTCf7XkjD/szTKn9Urm
	 cVoEM0PuxYekg==
Date: Wed, 29 Oct 2025 13:07:46 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    emil.renner.berthing@canonical.com, nicolas.schier@linux.dev, 
    masahiroy@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: Build loader.bin exclusively for Canaan
 K210
In-Reply-To: <20251029094429.553842-1-jiangfeng@kylinos.cn>
Message-ID: <3b4026de-bc0c-61ca-41fc-47bdd4c633a9@kernel.org>
References: <20251029094429.553842-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_120750_658960_758C5311 
X-CRM114-Status: UNSURE (   7.51  )
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

On Wed, 29 Oct 2025, Feng Jiang wrote:

> According to the explanation in commit ef10bdf9c3e6 ("riscv:
> Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210"),
> loader.bin is a special feature of the Canaan K210 and
> is not applicable to other SoCs.
> 
> Fixes: e79dfcbfb902 ("riscv: make image compression configurable")
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Thanks, queued for v6.18-rc fixes.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
