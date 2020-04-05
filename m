Return-Path: <SRS0=yTIg=5V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FA7C2BA17
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2020 14:37:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D6B7206C3
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2020 14:37:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RX0HS3Gj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEemUvBb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D6B7206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MKQvHdwC+ist3T6F8i7xcPFrJp3xaHVCClbktGExROY=; b=RX0HS3GjKVtu1v4rIg5R54j2C
	7Vg7ua5wadbOSDHbHLXhMc7GfTwKrfK1w2e1qIBb/qAhrby2lPe4buh3VOxronO4hVvjsZNkfaOTC
	haIeN1D6985idmOThjKketUMMvG6pwE8jvbIA1rIh5SohbAyC939Mg2ZyGD5qiWht8xSNgO5aPbpv
	Tgj1gYq5F06WikfXgEFzfMBIiT/gZVc0NUeO18dDkMgr/2vF6QjsJNYI+zA3r1DpKUo9nfYG+FsH5
	FVt+5Pv+LLqO+G/Ebk86ALuh1M5e+ZualUCjF93MeeaWZiJ6yhkI4dJMXFKNPKijbEuO7NSp58bNv
	eYpZdkT/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jL6Ol-0004DX-8n; Sun, 05 Apr 2020 14:37:19 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jL6Oi-0004AD-BM
 for linux-riscv@lists.infradead.org; Sun, 05 Apr 2020 14:37:17 +0000
Received: by mail-yb1-xb43.google.com with SMTP id e17so7299604ybq.0
 for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2020 07:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MKQvHdwC+ist3T6F8i7xcPFrJp3xaHVCClbktGExROY=;
 b=aEemUvBbCWM/Pv9KFjjqy1aPFijL+dwSiZ/pFpkmnZ++FzJnyTEqoPZG05slBZslZ3
 1npbJcN33CUNn2vFXG5c81zx/j8x/3vEEOmgdve3p9EwtxzuD/Yr3oeiQ6wfNFC9KcdH
 9ik3prusQPUyMEOQMxm/NEj7Dge7shyfTVmiSU4P642LRqvjDJlBVwJldmj6v30Wm8oP
 yUMonnOGlCAMAt0g2C8WjR+BJyAYxV6GOYlWICIY+0yGx31sZkGUC56KbiizQwD0yyyI
 JAWoobJuYULQKamzGbHglpmv1svTsANMC6vduQ1Ipsv1ko4G7Xnq+H+bra8DNywTeZp8
 4BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MKQvHdwC+ist3T6F8i7xcPFrJp3xaHVCClbktGExROY=;
 b=P97VK7FDYdbcU267SnwurzhXs2fmHl9b2vIDVujQVwoPOV6keJ6OuktaZJVoNMIZnR
 AfzMLdS1x5iR2vOh3ZQl7B/W+S9f2hylTb16iMvf+HIaoi/WmbQ8hrdGXZuIwVlH5B9+
 yitSYyWnezQAmDcqX8ExaKsDWc7V9oqFjgyR36Qr4v0SdKV0ciclxVC+Iw38TPqxrkK7
 YF/HVFU267ZFh4loUGGJ/G9K0m01NSDkkMkpkWqvmBwuZRoiSKF2y+wc7EApnIis3+UF
 5qhc4oPOBV5d9fuc6ZzoaBSv11DtD8CwjEoc2DoorUDh2rxVBC5eZ4Hoa2koU8oTwXNG
 JBTg==
X-Gm-Message-State: AGi0PuZY49cDbuo/E+stpuwQ8DZZYIUkOZbl164iPeC7L5kY8WjaUvNz
 tP2RJKW1bUhyXy+5yV+dPg2fazax/czE4al54B4=
X-Google-Smtp-Source: APiQypLIDyHR18s2gWsL39NR76H+2z45jTNzr28WXT++x/VulixJW1bLPAjQ+4WHe9BzUecXNEZzdh4k8VAoF/PdpCs=
X-Received: by 2002:a25:d646:: with SMTP id n67mr26357259ybg.65.1586097435424; 
 Sun, 05 Apr 2020 07:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200318011144.91532-1-atish.patra@wdc.com>
 <20200318011144.91532-5-atish.patra@wdc.com>
In-Reply-To: <20200318011144.91532-5-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 5 Apr 2020 22:37:03 +0800
Message-ID: <CAEUhbmUN4rkJA+KZQN1n=VFhC5=QX-DsfjEun6_HGR6WL3WgpQ@mail.gmail.com>
Subject: Re: [PATCH v11 04/11] RISC-V: Introduce a new config for SBI v0.1
To: Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_073716_394336_FCC2592B 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincent.chen@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mao Han <han_mao@c-sky.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2020 at 9:11 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> We now have SBI v0.2 which is more scalable and extendable to handle
> future needs for RISC-V supervisor interfaces.
>
> Introduce a new config and move all SBI v0.1 code under that config.
> This allows to implement the new replacement SBI extensions cleanly
> and remove v0.1 extensions easily in future. Currently, the config
> is enabled by default. Once all M-mode software, with v0.1, is no
> longer in use, this config option and all relevant code can be easily
> removed.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/Kconfig           |   7 ++
>  arch/riscv/include/asm/sbi.h |   2 +
>  arch/riscv/kernel/sbi.c      | 132 +++++++++++++++++++++++++++++------
>  3 files changed, 118 insertions(+), 23 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

