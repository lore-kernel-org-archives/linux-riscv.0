Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22BEF532C4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moZWrp+dyv4BpxBaHgJn9j4HeGFFpaRgGmYaLp9zxas=; b=sgOG7IS55r6Xur
	LvNIVrYASvtMVkmlW7ZjdnnlKjofYYqJlfOL9kGnakV+hIntW9HulzIZQhbF0628O+46v/6QXKZR9
	1qNmpPQZGcUyV94+JB0d/Z42/nUpgA9p/kDO8KDpoSIs196ifxYVYKujbpYHc7DNk6jUZQJh3yhVj
	KnA7Tgo8cnY75jHYXnH6LLnQtYDSW45WiTB/T3iGvE/MASsWog93Fmu73z9C/VpFmI9eJwtJpf4r1
	Jjflo+FYZpPUfe5hpI+eiNk7vPolyPwhNS4EV0drzdCMkZm59Lg2HMpPV6/RugXz84id/eoxhppGR
	SG9WXyqhovwN8kUSO1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vZ9-00000000q1b-1gUD;
	Tue, 24 Mar 2026 06:48:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vZ7-00000000q1J-3kSn
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:48:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44F01600C4;
	Tue, 24 Mar 2026 06:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE76C19424;
	Tue, 24 Mar 2026 06:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774334917;
	bh=odvQZT5+RQNdWSOpTEVg/D+eh/9ZL9qJd+SCdaLEbWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzsvAMTtHq02M8vTpvj4+z3C//6/rTk0CvNXkWZfWGgDXl+UthVLSfzAUgytZFmo0
	 xx/36ErRwBTVzMPxLlJPNLzKK0sMDldnKRHqOvVtgPzEP6E0UXd+ctxTVRcluCM6AX
	 KccT28tnAz3SJXQyWHQMPzr/AkTVjPVDKBgvspu+PuWH9vLKtaDcvoLQ6TFCSDpYUh
	 BtBLWc0iCQUX/C0uIv3FD/uCGQkz8fcuAZII5ng7U0tr/zRf//8jIJTvDljaR0UoKm
	 burhCtW/stTZv0rw+RxPXM1yGj39USxc2hvcmGvQFVh/wCL2yBS5gutEYnvsIdbaWT
	 OXs+ge+SE25Gg==
Date: Tue, 24 Mar 2026 14:48:33 +0800
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5] riscv: dts: spacemit: Add ethernet device for K3
Message-ID: <20260324064833-GKA736590@kernel.org>
References: <20260324063714.750428-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260324063714.750428-1-inochiama@gmail.com>
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

Hi Inochi, 

On 14:37 Tue 24 Mar     , Inochi Amaoto wrote:
> Add all ethernet device nodes for K3 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Looks good to me, thanks
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
