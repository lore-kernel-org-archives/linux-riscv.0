Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC3FC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 23:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qh5A5KYvpxKfIk3CnXO5/3RzA2TCbMgqE68LJvlr/os=; b=UxGaS/wSBCutkT
	l+et1tYPMRQ+jVXczESc4omKKtZNHQFy3xZvzARzaXiybzEOA6CJD1J3cLml3sOQYrZS3YszyAqXM
	8JaPSWlb1+ie2o7eEio8sFCVLmSyZZr1LpVeKJiPIJtIbZ5FT+zkZ5YURxQE+xwtpsO3jFa33oe9R
	P44vC3YrV0qO68IiXvWboJBc3gyQWHzGEJ2CSPDvReSak8ByWjv8yoSIowrFo0pwHW6LZGdIEWq4W
	E6TK4EqUoJNkqvZ0bnSXuzXNY4cuJYXiPUWspE6I8pSJogmEfNsseY/Vz71oOXpsDUmlN3nBwkHFY
	pcb9+bsWcNdIeUfklb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8v2-00000007BBj-30RU;
	Tue, 11 Mar 2025 23:21:52 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8uz-00000007BBC-4Ahs
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 23:21:51 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c24ae82de4so666419285a.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 16:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741735309; x=1742340109; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pJxmF6WUVc5kNSkt8K1JQrgUW38NF3U/yReHT+CGrcM=;
        b=RIKpN2Oe3Bj2wTq3iT9GUD9cnR0uVAb+KJUXVMvkf6Zp8uf9jBMa9WLQrI4OtSoAO1
         ILJd1m44ZdC6/Owx35PYDFNsqIWiOVHRcmmusuUFO8VVp0++GXi0z3ZPXPkINTmeof3m
         xBDK0thg4QaMYnFcHkq+t8cDKDs0RWLdMjfsw26XAe5YEIriXVG7Mtr+tjA/LkXLX96b
         3eeQ8FBRkOtcvF47dHXhPwE0ibtepGahMH1Q6PsjeIoCHhiUeu4kG9A/J4N+LfSL7adj
         TpJ2UxAzaTDJ7tj+NGAmIHBDI3LXjfelUSfkN0zhJPiD2EYCWFTVFDkt6VJ01LPHU2CX
         J71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741735309; x=1742340109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJxmF6WUVc5kNSkt8K1JQrgUW38NF3U/yReHT+CGrcM=;
        b=sHPXruZ6it8YSwaWEmLcKHk8ymSTidN3tT+PKTirDe4+wyABC+1cWBUQ7lPDlSOBZ3
         sXZDzvbHb1VPQsNEapk5F2G9spNwAICyws4OG+Zwm36OYfS50GuepzJ7lE6rXV9+ffv0
         K1twqFZqURWY+PBAPDs2et5q7guJfiGJBFBjaAZj1LBZDUnFkHdleVg66SZobiMkkeDF
         s0067+DmNvsnp4UIKpJ5ObBzyy7L6/eBessvNNAxqoaH98WgGn1YRhzk+lh04AWkPSeo
         hluH2BbQpWrm5cQ0mubnsqkqsy5m4+izDNG0Lth9pAJUJWA7ucOJ8Y9nf6i3cWWcpnxv
         OsMg==
X-Gm-Message-State: AOJu0YzloowXMDsCrIfjYHDsgPv1Le4SB1Lx0zOCO7M4+KDAPpN6RRc2
	NlDpRslVAAGRkjkdlGK4MfBX+BhfGhqX5ZxblfGdztleXhsduI42
X-Gm-Gg: ASbGncsUxvkf0Ps8060Hd0Zf9fs6/9BJGxHjVYCWRPU+HrT1gvbgfp5yEHJbXtt3hyA
	bUXj9n7Uh5IWcfVbAwjfr+Wx3VwTvmU/bsTV6aF79NZV1vZwnrtH5jq/d9TYKFs7oelYRWWsZpN
	ObtNA0aueVumByfBdvAlGAIN3vau4pr1a7Ig3ofqKofb+tilkZpaE9Og3qA8oxwAlqt5xRIlkl9
	ZbCir7Pn7bu3/RceW64NyPYjfiytmQrsPluhZw21lIfygMs2U5vOBEx42Xsq/FPEfpyvRLrpF28
	/WMrmGQ/n4m+rPMbBFusLBUJS65MAok=
X-Google-Smtp-Source: AGHT+IFc2n+8e2vw/uDNxiC07QwRLTMDbQw8VNTcBIu1VuuEqaEF5tPNOqcxmCKXAvBGFAeajVuzcQ==
X-Received: by 2002:a05:620a:8706:b0:7c5:4be5:b0b9 with SMTP id af79cd13be357-7c55e89a129mr782406285a.28.1741735308703;
        Tue, 11 Mar 2025 16:21:48 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c554dcbb2bsm390858485a.84.2025.03.11.16.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 16:21:48 -0700 (PDT)
Date: Wed, 12 Mar 2025 07:21:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-clk@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>
Subject: Re: [GIT PULL] RISC-V Sophgo SG2044 clock drivers for v6.15
Message-ID: <znylrcmmd7hwbxg362cyurw7pyp7szivlab42rpncswx6huzsr@w2cyodntxok3>
References: <PN0PR01MB10393DBCE92A34489031BE9BEFED62@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN0PR01MB10393DBCE92A34489031BE9BEFED62@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_162150_031940_FDE9F16C 
X-CRM114-Status: GOOD (  15.34  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 10, 2025 at 03:34:08PM +0800, Chen Wang wrote:
> Hey, Stephen,
> =

> Please pull clock changes for RISC-V/Sophgo/SG2044.
> =

> I send this PR just want to expedite patches for this clock driver. The
> patches have gone through several rounds of review [v1], [v2], [v3].
> =

> Link: https://lore.kernel.org/linux-clk/20241209082132.752775-1-inochiama=
@gmail.com/
> [v1]
> =

> Link: https://lore.kernel.org/linux-clk/20250204084439.1602440-1-inochiam=
a@gmail.com/
> [v2]
> =

> Link:
> https://lore.kernel.org/linux-clk/20250226232320.93791-1-inochiama@gmail.=
com/
> [v3]
> =

> Thanks,
> Chen.
> =

> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
> =

> =A0 Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> =

> are available in the Git repository at:
> =

> =A0 https://github.com/sophgo/linux.git tags/riscv-sg2044-clk-for-v6.15
> =

> for you to fetch changes up to 135418add3878dcd44483d0f2851f6f470a85395:
> =

> =A0 clk: sophgo: Add clock controller support for SG2044 SoC (2025-03-10
> 12:22:01 +0800)
> =

> ----------------------------------------------------------------
> RISC-V SG2044 clock driver changes for v6.15
> =

> Sophgo:
> Added clock support for sg2044.
> =

> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> =

> ----------------------------------------------------------------
> Inochi Amaoto (2):
> =A0=A0=A0=A0=A0 dt-bindings: clock: sophgo: add clock controller for SG20=
44
> =A0=A0=A0=A0=A0 clk: sophgo: Add clock controller support for SG2044 SoC
> =

> =A0Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml |=A0=A0=
 40 ++
> =A0drivers/clk/sophgo/Kconfig |=A0=A0 11 +
> =A0drivers/clk/sophgo/Makefile |=A0=A0=A0 1 +
> =A0drivers/clk/sophgo/clk-sg2044.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2271
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> =A0drivers/clk/sophgo/clk-sg2044.h |=A0=A0 62 ++
> =A0include/dt-bindings/clock/sophgo,sg2044-clk.h=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 170 +++++
> =A06 files changed, 2555 insertions(+)
> =A0create mode 100644
> Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
> =A0create mode 100644 drivers/clk/sophgo/clk-sg2044.c
> =A0create mode 100644 drivers/clk/sophgo/clk-sg2044.h
> =A0create mode 100644 include/dt-bindings/clock/sophgo,sg2044-clk.h
> =


Let's cancel this pr. This clock driver still needs some
improvement.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
