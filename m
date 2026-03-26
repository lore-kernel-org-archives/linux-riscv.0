Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD24610AB80C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 19:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9x1xrcQvYRJR3sB9up3RUiZQVb5+DT98nxlF+gw+LDs=; b=jcbfktRJAHD/Nb
	ghLKGTIQZHnUQJPLs3cAA3v1RCBae67jIB7i9zYs2GOH9CPpGRAKI4t7pi45ALG5Qcj+/gPMHxGd5
	cWDt+4/w5CxdJM7rje83UtSil8LLBrRoz2axazgAG1/0UIumUUfmBmQkLD3MlwNgl9iliuX5BI34M
	jaiLqztRo87hGHnc1tWNwNEJZ0y1Rsbb1/G0PCUtHMFNxb+xOIcVIzzFjTElgvKLB3AIboZFEO265
	Yv9SGk4kY0K1Th7u6B2ZiuMRBsjQJTv7qSXrp13fe/P9wX5KX5IqOPbJR3MW+5Kso6seKKmqYefMS
	waIp5N+67uV19nRz/sDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5q9n-000000065q0-08LE;
	Thu, 26 Mar 2026 19:14:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5q9k-000000065pe-0UOM
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 19:14:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D060D40AE2;
	Thu, 26 Mar 2026 19:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87833C116C6;
	Thu, 26 Mar 2026 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774552450;
	bh=XPkKuAmS1FrAmeq9f1O5w4bxL4MZd+YzwQlOdwFrkPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgQvVG3XTA98t5PzoqUFDpF70q2V7DDzuagpZKMg0BWvc0V8aSlc8lMS+zmamJdzA
	 KL0XM0h9wbssXGphYfGXwIZZpcukb1mPktrz1GRgafewDqqw45wChxvUKM9QV9Daib
	 ogqrg7+SjZWBgOTo2b645BIS+fW4xN4ULZABC3mQ6Q3GV8tcJDpUYrrJoQocQFT6ms
	 JlhjV/V89y00ClsG32bwh1S+CysEv96xb43lxCkVdjj2LQfMlcF6yOX7kupEsM7vUX
	 k4uvw7J07BK4Pk3v6oB6V/2zQvX3fTZ5BfslWoeBvVr7EXpjuF+7xwn9JHZULNkyne
	 KtzBMMxiE+kcw==
Date: Thu, 26 Mar 2026 12:14:09 -0700
From: Drew Fustini <fustini@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v1] firmware: thead: Fix buffer overflow and use standard
 endian macros
Message-ID: <acWFgZ8swY60lfDV@x1>
References: <CGME20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37@eucas1p1.samsung.com>
 <20250403131051.1097423-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403131051.1097423-1-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_121412_180600_178F0954 
X-CRM114-Status: UNSURE (   9.91  )
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

On Thu, Apr 03, 2025 at 03:10:51PM +0200, Michal Wilczynski wrote:
> Addresses two issues in the TH1520 AON firmware protocol driver:
> 
> 1. Fix a potential buffer overflow where the code used unsafe pointer
>    arithmetic to access the 'mode' field through the 'resource' pointer
>    with an offset. This was flagged by Smatch static checker as:
>    "buffer overflow 'data' 2 <= 3"
> 
> 2. Replace custom RPC_SET_BE* and RPC_GET_BE* macros with standard
>    kernel endianness conversion macros (cpu_to_be16, etc.) for better
>    portability and maintainability.
> 
> The functionality was re-tested with the GPU power-up sequence,
> confirming the GPU powers up correctly and the driver probes
> successfully.
> 
> [   12.702370] powervr ffef400000.gpu: [drm] loaded firmware
> powervr/rogue_36.52.104.182_v1.fw
> [   12.711043] powervr ffef400000.gpu: [drm] FW version v1.0 (build
> 6645434 OS)
> [   12.719787] [drm] Initialized powervr 1.0.0 for ffef400000.gpu on
> minor 0
> 
> Fixes: e4b3cbd840e5 ("firmware: thead: Add AON firmware protocol driver")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/17a0ccce-060b-4b9d-a3c4-8d5d5823b1c9@stanley.mountain/
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Acked-by: Drew Fustini <fustini@kernel.org>

Is Ulf the person that would take this fix?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
