Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B82106F303
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nurn+udZidh2ymAZUyewOufXofQxu3PDJOD9RT/9qQg=; b=YHzkvld8SsdfU6
	34RZB+GJX5zmWh4jovR0OpSnLAqF5OwM7olAkYNS01HX2Wdt4mclNHTl+9Cxt1ZR3XtHxGvRliAyk
	G/VgGLA2jpXK34wF3z1pmU8nqZ+CfQbVSusKzEHxv/gfto7wa7TXa6PtfOcXgyHzXoj+3o+CmjJES
	rxew+T1VCZWStz32bR2zL09jDVz0tQTApc6sGnyVlcQFyuWJnmsVBvozf5hsnozicVQfn193arqql
	QU7DUwgz8WF14IYV1xi8unA3GdbNAGVdLp8tjJ0y+Cr4b7K4bFR+cd8z+8izoQrFU2YmSljuOmzyc
	BlvNUJmiQ8kDfPonbvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gIn-000000053G0-0sEj;
	Thu, 26 Mar 2026 08:42:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gIl-000000053Fj-2t3q
	for linux-riscv@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5KrwW45sM5ZLNWZHKd/Qx/J976PKoiXqfS4hEKQAF+k=; b=R2AuZnMpjPJnW+OkuOdXzJiAVD
	kcVd2Lb54+6Hk2rKUifcHCB3DXbShqclPqMi3aQSyo8G77JTlSH1+84UDRzROskqYc4f1I8PCpxE4
	dt+EYboAbR5v0zuL9BxfnMioO9US15adNTvngE10Fcq+dm5lmbZBIusa/GBJqqwDVIRxB4xvL7ArR
	Gh0OZDt60RHijf82I1EvjS8xfhfVUe0NSP/Gc37/eb26adaBuHPdtbm4iz2AfF2eT2eG9tDBhBe1F
	7HYEJ0UJM6upW9MHQGVN89zklcWXyYlFCl61KrFHcvOv1huxRzRXj1Ui8FOk8IHa3oQ9EkxjJwTpI
	vuI1sdGA==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gIi-00000007mFE-1a4I
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:42:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439af7d77f0so529514f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 01:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774514566; x=1775119366; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5KrwW45sM5ZLNWZHKd/Qx/J976PKoiXqfS4hEKQAF+k=;
        b=ZYd+4s+xZe31nZnbQGVe2rvyRz3y2Om4HJ/r0EI0VSMnic85o4XM1nzYnfzhhDw8ff
         VigOxMfkXKOdo3lmoAb1Qw4uTsAderjALEAIuPjovc744jQ72gjdmAEWbFTlKTcl49Mn
         OFg3qXeAT0Q0y1bMoJrZgJLSEbZJq5UdgzkzZEUa0Lugu7KTdybsRpOb5BRxBoVnJF+c
         4+8FZd9R89wB4E5ia17VnzSeVftEWLWotFnhkv7QQG4rfk4b6aGX5sqPpkBAjABxQ/pK
         H7dIggiI2DRoqu5MbVe2d+SfnQx4uqNVXQEdn6MA0vPFmA7IN69wi1wuAHqNRyDmiZcY
         qnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514566; x=1775119366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KrwW45sM5ZLNWZHKd/Qx/J976PKoiXqfS4hEKQAF+k=;
        b=E2qDhwshk6/wmELsRdrE8XHRt0t4ujjxyR7RK4H+gbhNH8RLogeI529lsVz+ZT6wNi
         vQBFBIUGxa4HVCrE3MnpshRIejNwHmv7zMMHygwrasKKOZdR9/AUP72OpJ04nJl4HoNT
         TAK8OQek98zsMUj8WSVSsafPqRTytx5TOtQOjiPF+AhjxXwimlxxvcAVeOXHbYpeOJNo
         lbfpDdKRQmtrMOautJJpcUz6Hb9CbVA0a5CYpsxFuXebpsbjKuPocoL5vtUgzDR9VZae
         Ll1dneNgSD/F9wNBmQxjPiD8Xcj6vM/8XRlJnqrJECH5nnfAT/7X9JRwRTeApFxtpaKB
         2TCg==
X-Forwarded-Encrypted: i=1; AJvYcCVOsVAV7klzmWqQ2uOntmDstdB/IIoQB2U6jleSf/8ClKkalZX41g+5W3zSiL8rzrze6dLE35lRoei+5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRST2BgCO7qF1tZfbZSI/mT8mRksUwHK1JIrKMGqilPj8u16Hm
	WHr4kWW/kMAuwXCkE6Lxc2Zz70kusTE/dsiQgUvb2D/6U6E2DDBe2AZpA+JQjM/8VRo=
X-Gm-Gg: ATEYQzyue1LbuDi92wxR6UDYYiXddZ5VOR64mbOJaTBU1vryZkvWd7zQm//vRCHKYm/
	0ZLBXzWkSMZF9PcWeyF4ddbpoB9KDtv5fUNgtTxSBUUqCrF46oe/2T2SMQ1uyq9tjvVw5Q0oj5m
	+6/u8mo2Gto/7rvKEsps7ixx5CU3ijiJVuVmOXH2EFofu94/l4x0dRhNNFu6sTc0nhRSxRTa7N0
	JLr2QQmHCWuKsAqFeIxXjKfPqWhbGfA7EeptxB+LRg8nBZmyEmReD2XxxDYULl3R+NDWYc5BGBh
	CFsdR7VJm3vQ8YhDXi/LJ9NWYMtTSCgautSFJ4I0J5aTxJoedAVdDFqISvr+3bJXaZMpriaYQ+/
	XP+NXxEjCXJNP4i7PUdC4qE9PtxCl8uaNsn+OjI4gSUiRM/Ft3UOMotZVHJTmzJo1c7GgaYlp7z
	EqsAvK9XcPInNXyVC+dS2yDAUBxiES
X-Received: by 2002:a05:6000:2385:b0:43b:4396:674f with SMTP id ffacd0b85a97d-43b88a0d0b0mr10208058f8f.55.1774514566156;
        Thu, 26 Mar 2026 01:42:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7372sm7729788f8f.34.2026.03.26.01.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:42:45 -0700 (PDT)
Date: Thu, 26 Mar 2026 11:42:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] firmware: thead: Fix buffer overflow and use standard
 endian macros
Message-ID: <acTxfcRffVT6SuBm@stanley.mountain>
References: <CGME20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37@eucas1p1.samsung.com>
 <20250403131051.1097423-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403131051.1097423-1-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_084248_521672_0EBCFB49 
X-CRM114-Status: GOOD (  11.11  )
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
> ---

This is nice.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
