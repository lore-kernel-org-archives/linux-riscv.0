Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D742109B492
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0v4bucneJzIHd+YMYUXL3+kKkn6GHi5jcEheQDfMeI=; b=xG7s7Llz3eUpkU
	MbnN0Pmn4PbFpNH2GwVx2hdVj6e6Bs/BijKrDG2wWFDS6jRCIx7sBq5+XytfYVx1+/BmqthSsck7c
	azSh7YP6032Bog96wVPJ6DJRviAqbAkOmi4/ERIZveXYo2ascmgM1Z7MWMCHQ1+oyazJmNADlc4V9
	tPxQ97gUPvj3S/bBu2cmLQ8Pd0741c8rGyY5GwhchgluRYPr/wMOhldCbxE+H9mG+kwKF2H4+Mo/w
	DIJpUXc3AwyCRSkbIrbe77Zi0CGJAMjNVqVcQ11+uNDq9nUNHI0Eh14f8hzrksj6DBQ/VP5iQRB42
	XTRw7t0GuklKCOEtzblQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bZ9-0000000DE6E-0ezU;
	Tue, 31 Mar 2026 16:03:43 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bZ6-0000000DE5R-24uz
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 16:03:41 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-6501547d7edso6287017d50.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 09:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774973019; cv=none;
        d=google.com; s=arc-20240605;
        b=HFcUGamCVliNmOnUF7M9eKSz5uV2HbKhMtJiKhWNb2EUKy33/kNkE7IwEYKBIIv78N
         gR4+nEZf40cnbxWws8XvZ2QAGyg3Qduh/9XrVXpqJDb2FbPo05ceqo9u7s8AhGmJfJ3D
         MDNl/vpjVw0BCQWjK8tjmy9E/vFBfZ3MAOTfgVJ/KYmwZIJE/cps+0VyIdLnwv2uGlBC
         1vwyBXJvSR04gzOIDDKGImKsWokOdzF1K1cuKPx2d4r4sSBKuuchBFHHPHXpufXe+WUq
         cCweVhJ5/bhibpXEukmY4xpq7u+aml0qEkgvmcME6yj+8iOavopJqo+PcB5do3g7QBBb
         Zidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gTFqMEJEMzM0XIbzFOykqgkUDJ1lTvPSHBB5j7hFuM0=;
        fh=M/g8EA4QRYMLw4+0TSPL6Pr+wdu6rMtvJ1f0qEDLp04=;
        b=eDS7Tvvy/Ueip6ficmiwqsWP4PKQeyveJzaHuPbpDg8QxTqfM65AmkuqgTeYzG/nVp
         9vMd0GBM/hj+RYBu0NXOMvU+/zqzs+otxUEgf6GzHtYpM30UNX3j4IkNQGSqA2Sshztf
         /rTvnTY8KuO+FZHs0K/HIfVzpcNVFWnD7G/Pb37fwkiVnxEJ+QDczl8N817zlgU6bNHQ
         POJdwGKLtztJqEwWveuMQt1AHF7DPC0sD0+N1bOrCr0h/MGXXQ0tYO2ySMlRL5hkNb0L
         WCtZKDwPSmoJDNsoOwwR2b9g56t+SnUS1TMoWeUweaoxb5P4lCCZLVASrVmjfr1vCGsi
         syBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774973019; x=1775577819; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gTFqMEJEMzM0XIbzFOykqgkUDJ1lTvPSHBB5j7hFuM0=;
        b=FOzIXyG8wNAvz8MYwbk+svYV2DHoTokaF0uzmmvHR7y2pK7KvuaPKM1n0q2e9gxdl4
         EKquocWPA+sZF6OaS1kDUWlMA2LDWU3OiWYDUCpid/GPfw17UIZCnFtjYlWQwKeMWpWP
         rqKxln4fSxi7JPp3guk/Lxi/xmuwxXYN1kZ5yqgo4o2zAislh8rq0vulT0qy4nbK+s6A
         GdScTSA8UPLTBBEdCHZrnnxkg7CAqhVq7hcKfVOl3E9sLh8Mvn8KcxC9teik5IVe3CkN
         KNGBsjBNSDOsq/hfBTeTptBy5ITsWNcCJyUbd/c6N+FsoEdxzi149cFdq0f2Z2o8QtcU
         +k1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973019; x=1775577819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTFqMEJEMzM0XIbzFOykqgkUDJ1lTvPSHBB5j7hFuM0=;
        b=A2+hGwHzFU3CMA/xlciRa4/ke5b/kxvA4fu1Q5+Z7hl7wGAUu3SrsOI7Rv2fyn3RW4
         9mlqFDotgBwJ7IH9HhHpR11ltOqC6rwCasl8+U7yAIQbIk0bpDNLDuu4N5y0ARYtg+pP
         hA6HPN1PGbGzhTT0IjkSd8MzSjFvzyHQdJyGeHKUKSBE4zmxCrK8eF9ANmsdV6d0OtOj
         RlzgR0fDsGOIfV33WD7nijhjuizeyl4hEWP3D4dt2lVkPPqzbU2J21JCcXBn92affuga
         y2IO28ltvRlZi+U1V2iBlWDGJQYyOMgVy0U2Rv+xbRyURtcd1DXrj6H+U123ikACvnPI
         KA4w==
X-Forwarded-Encrypted: i=1; AJvYcCWBNILw9xOS9jZ4xrHdQM1j3SWXwmrLh+rhCemFMjcqnjZB6tn8Su6o0IEqFwsVns0F4k1v7Vmd/riP5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwK4EcQ6HJSy2j33nH4BtRZbrLB1we9Ir1+2+pJgZL4+wucSnzW
	dc8RgcyjCBgVrAUW68Y5h06oKn7S8A0ONJIBBT+BNWKipqmEO4wnfP03V3EwpyR56RykELzoXEE
	Ib2KeJ8LX0cF0dmGa/GY4dnvdfq+FVHbwHSuaaacfCxXZ0VQhCyco
X-Gm-Gg: ATEYQzzbuse1ZWCPJpaWO/r41v9TzUnx37cSRGuUb7KKKZNYwvVJOylLeroSztE2ct8
	dAunRhUNyLswUyYrFYbS4R+4y4hzh9lBj7fyh/WYKE06XNLdPYC7p+Cf2kRkw8zeLqXi1z1aSHG
	Xyjotxigl5SlYuyOFbeA2l1PCW3MAvd5N7B2v2SobqNA8y1YZcMkHZRv4M5WTWwNFlpLojHAt9t
	/mgSr2qxLFuKY5wHyejcV88aGmooIDUm2Nr+KclwuHiq6MAf5Gt1r1pXry5vwGtKm1+GKl89JVC
	sTAQoaAQ
X-Received: by 2002:a53:b08f:0:b0:64e:a397:5864 with SMTP id
 956f58d0204a3-64ff73d1a87mr13492211d50.46.1774973019048; Tue, 31 Mar 2026
 09:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250403131056eucas1p16076c6e4dce1f1217dc327250c419e37@eucas1p1.samsung.com>
 <20250403131051.1097423-1-m.wilczynski@samsung.com> <acWFgZ8swY60lfDV@x1> <a548b0ca-b8f7-4e9e-8ad7-0465e463ab05@samsung.com>
In-Reply-To: <a548b0ca-b8f7-4e9e-8ad7-0465e463ab05@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 18:02:59 +0200
X-Gm-Features: AQROBzAPoKMMLJqX5fsrr8dHp_KP3UPkNR1VPho2SCITD0qvGCvnQkn7Qsm_j1g
Message-ID: <CAPDyKFo=2UTpCC4sswXDbxm+iwpbL-yR_O5fNKVm-LUtWtXWDQ@mail.gmail.com>
Subject: Re: [PATCH v1] firmware: thead: Fix buffer overflow and use standard
 endian macros
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <fustini@kernel.org>, drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_090340_577256_7A2FBCAF 
X-CRM114-Status: GOOD (  18.36  )
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

On Fri, 27 Mar 2026 at 13:15, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 3/26/26 20:14, Drew Fustini wrote:
> > On Thu, Apr 03, 2025 at 03:10:51PM +0200, Michal Wilczynski wrote:
> >> Addresses two issues in the TH1520 AON firmware protocol driver:
> >>
> >> 1. Fix a potential buffer overflow where the code used unsafe pointer
> >>    arithmetic to access the 'mode' field through the 'resource' pointer
> >>    with an offset. This was flagged by Smatch static checker as:
> >>    "buffer overflow 'data' 2 <= 3"
> >>
> >> 2. Replace custom RPC_SET_BE* and RPC_GET_BE* macros with standard
> >>    kernel endianness conversion macros (cpu_to_be16, etc.) for better
> >>    portability and maintainability.
> >>
> >> The functionality was re-tested with the GPU power-up sequence,
> >> confirming the GPU powers up correctly and the driver probes
> >> successfully.
> >>
> >> [   12.702370] powervr ffef400000.gpu: [drm] loaded firmware
> >> powervr/rogue_36.52.104.182_v1.fw
> >> [   12.711043] powervr ffef400000.gpu: [drm] FW version v1.0 (build
> >> 6645434 OS)
> >> [   12.719787] [drm] Initialized powervr 1.0.0 for ffef400000.gpu on
> >> minor 0
> >>
> >> Fixes: e4b3cbd840e5 ("firmware: thead: Add AON firmware protocol driver")
> >> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> Closes: https://lore.kernel.org/all/17a0ccce-060b-4b9d-a3c4-8d5d5823b1c9@stanley.mountain/
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >
> > Acked-by: Drew Fustini <fustini@kernel.org>
> >
> > Is Ulf the person that would take this fix?
> >
> > Thanks,
> > Drew
> >
>
> Hi,
> I think it would be great if Ulf could take the patch.
>
> Best regards,
> --
> Michal Wilczynski <m.wilczynski@samsung.com>

I have picked up the patch as fix for v7.0-rc[n] via my pmdomain tree, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
