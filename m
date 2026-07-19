Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6572AC4451B
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/Na7KaUUFTbN7u0rHbUtovlkC5VGmEx/WN3aIjtPSc=; b=GVgSKgD15Bht+g
	53nRmtndWk2pv0O6Hsh0Z1E+T402eycF0HDvKUjSWbthoQ8T1QSi7157C72vbcp4M4UM+CydumMkr
	bAkuNaQNGLfXe/G6qqyDX9tPpnUxgFz1wHcosw4I8vn5Y5fs5nAiSvIHWkoDSUb/AYhvOQlJEk5Xz
	Xfo0J8Hh7wOyzxvPsZslSrNsYHEZ9LFkPIwDjyt+IRCaLhLzBfB4/GhqwYliBFrIsVcma9Y7yXCdF
	5bCfS9c+jJZdI4UTJmH376OedA1XD7vNcr4A91wx+ZGGL2wCw+qQ/s7Pody/v17sS6sH9jG+yCHdE
	uACB4FSn21ZdHXLxZpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlVo8-00000005F6F-0xTJ;
	Sun, 19 Jul 2026 18:00:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlVo7-00000005F68-1E79
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 18:00:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CEA743FC9;
	Sun, 19 Jul 2026 18:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282A61F0155F;
	Sun, 19 Jul 2026 18:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784484005;
	bh=f1JbyR4ID8Wt/ntl62PGU1b/cjxrpuw/Kxg2nVCiOUw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=SR3/PY9+86ZezDCx8oqGDETXFoegCBTIAFyoV6/mvV2+PVThbmvqYxngPV5uTknj+
	 fWgTzJezjB0CAU4fcj9K+s1Ic64meHW4Ycyl7YcmcbZ80cAmS7CwshfUzYznS6eyfv
	 +ouHdVCrattuYpFBOzn/rto9fYLN1Cm4Un+RNI9899xOzLZAUzXAVmtFIAToNoD4r3
	 g1TeKxZRct+ClVblYBm+UEvG9TOhSWUbtqTFiT5YVHSMbJx0q5nNzaYR+5Vn0BwB0o
	 Ve0RmoGDd0N5lF7X67Ch2qnzirAlcqj+M9eqUEDADE4DfhGwudxe+Gv9mJQSgvCPAx
	 HveR08wfXlfGw==
Date: Sun, 19 Jul 2026 11:59:58 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nam Cao <namcao@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: time: Add missing __iomem in get_cycles() and
 get_cycles_hi()
In-Reply-To: <20260716053319.2178937-1-namcao@linutronix.de>
Message-ID: <b003367c-7b4c-4d9e-a0e5-6ac5c9057906@kernel.org>
References: <20260716053319.2178937-1-namcao@linutronix.de>
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

On Thu, 16 Jul 2026, Nam Cao wrote:

> __iomem is missing while calling readl_relaxed() in get_cycles() and
> get_cycles_hi() and sparse complains.
> 
> Add __iomem to silence the sparse warnings.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607160619.14G8GHp5-lkp@intel.com/
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Thanks, queued for v7.2-rc.

\
- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
