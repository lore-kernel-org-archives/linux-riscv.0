Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F2BC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 06:20:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF5E61446
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 06:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FF5E61446
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=on8MFxCIQwk5n8KMiYFciJAzOio8WIiL9aSAp9Zsf9g=; b=ZOaJibQp2dlpyk5p5Vpkjl55b
	C2ba5YTbYiJgoj0chqCtUHrGElSiLKYLUyhxloC00Xnv08kCi1u5HmcwZ2WEWVob7uFNsukGaVeiq
	i0mUxKaGsF0Bl2ut/N9fW9DY0ZBK0xcbR+aaty6CxMMmIwMVpjfnaQeMJ1jQvzZgE2o8/EklhSwiT
	OkycH4MaLLq5L8SjeGPc8jWUrh2AJ3vd543Kg73Ir+tNW33zmBOEmFdR83gWIGcNihzrEr1jtdEuz
	8PGKOlrjoMcnp5rQLMQ0Dht4Mhx7b+06adaIoQCI7rBHLok10L/25O+/1sullvvPR5fN31KpCnlEd
	lGFK+5xmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc02F-0052gq-6F; Thu, 29 Apr 2021 06:20:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc02E-0052gh-4f
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 06:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=7hePKxoNOOkqFqu1d3hBmli9l1XZ0VvBzkqyp1K/ilE=; b=D4/MN0+bNl9tj740Jtxj9VgCmV
 Gpjnue4HBs3yfyh+mJSSlmB77hl2sdhNXoIvtRveFjaR6DztcleTFolkAj4dF9achuMZ4w+mcfehB
 PxpLgd8MVxkf6FtR5hMswMB+zXG0myPGgyqy1VHWwdb2jmt7/iYrT8513FIoksd2TDFCdQyyRRCp4
 DAkETLmtyy7qiMspqkbzGnCanuRW8H+1nNFtVHi3/4wVGh6qq/ZDg2C2zlfqb6c/1dW232xJ4U/wJ
 KhtKwH7Z4v0svTCABkg6W2XORzl8tRVDQ98c4ZW8UQGex4IihZPx8u0XGkaQ5OlnNJBpj5bnF3iT+
 xRasMdTQ==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc02A-000P7f-Rl
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 06:20:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id h20so34199019plr.4
 for <linux-riscv@lists.infradead.org>; Wed, 28 Apr 2021 23:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7hePKxoNOOkqFqu1d3hBmli9l1XZ0VvBzkqyp1K/ilE=;
 b=gVZGBF0dYT3j0FfoxMhQqewQ6jHytPaedWryPYzcVR6Ox2Y+pqgC3+Zc4Oge8sbkaf
 7J+kJBDls78lV0YHy9a/7O6uKhwWITsSyEdy5KK/MwKc/6Srhl6lDNDScJyFPsuR44xt
 NmQAoECk56Kb3kRgSgY82QKF9RNu7png16Ke8fI19OboE+SlxURzWdJzyn1DiLnLIxxo
 yM0BAGraoySQoW0MtPby04m/f1LhYSVQB/hkzKUyLsXHWnA7S3L7XkIGnJjfRvI9EKHl
 8wOpaPgDHdCWxSaLT/UR/B3EZ6J1Fg+qC1+ZSt3ETuRQFRj6Cyxg6f2u6h+0KzH+OA2Q
 Ymaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7hePKxoNOOkqFqu1d3hBmli9l1XZ0VvBzkqyp1K/ilE=;
 b=Pv+Ye+6Tjl9KRnSKtac00MgT9+xLlWgY27NdVLazeRhb9tPaBwzQorrf3papuPvy11
 /o6+jd+5c6H1Op6hmKefQGSwNZk6e3tpnihiUatseUDn1SD7Zfpdthe4gvt8F6aBKq4i
 OBYsx8Sq0FfVAL8SZCcaC6eypKe3Q+Od0b0HUkRCFD1+QJjUv5V+Q2goz3Iat7FDxSFr
 Jbt0aEgu8W2BRZz+pZgx73gUKCHmh8uiHXnrkPEC/IViihfd0DJsgmwib99/nZtHqSEC
 fu03y/8ntIXPNQ4Jhu0v08lSsBTBThRGHD5eDVYOzlxtWCUj5LoLJSXkhFnGaXj89r4d
 TH6Q==
X-Gm-Message-State: AOAM532VX2VDM8wwBfkqJVZ7A/pqVfwHUJbf+Q+9lmIz1rE6XyjWWVma
 CQJavNyADhoOdU5dRpKeV4y4gA==
X-Google-Smtp-Source: ABdhPJzRBfomesl78AueVtTuhDjTaaxo5cN8KvQ7aPSpfRcJktsUaCLSusPQG+RipiPVQRHffC3dqg==
X-Received: by 2002:a17:90a:3948:: with SMTP id
 n8mr11729158pjf.32.1619677221257; 
 Wed, 28 Apr 2021 23:20:21 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a7sm6994397pjm.0.2021.04.28.23.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 23:20:20 -0700 (PDT)
Date: Wed, 28 Apr 2021 23:20:20 -0700 (PDT)
X-Google-Original-Date: Wed, 28 Apr 2021 23:12:31 PDT (-0700)
Subject: Re: [PATCH] riscv: patch: remove lockdep assertion on lock text_mutex
In-Reply-To: <20210417023532.354714-1-changbin.du@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 changbin.du@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: changbin.du@gmail.com
Message-ID: <mhng-6a0fd653-64f8-4d0d-a265-d80cecdc1b84@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_232022_969817_EF5BB25D 
X-CRM114-Status: GOOD (  24.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 16 Apr 2021 19:35:32 PDT (-0700), changbin.du@gmail.com wrote:
> The function patch_insn_write() expects that the text_mutex is already
> held. There's a case that text_mutex is acquired by ftrace_run_update_code()
> under syscall context but then patch_insn_write() will be executed under the
> migration kthread context as we involves stop machine. So we should remove
> the assertion, or it can cause warning storm in kernel message.
>
> [  104.641978] ------------[ cut here ]------------
> [  104.642327] WARNING: CPU: 0 PID: 13 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x166/0x17c
> [  104.643587] Modules linked in:
> [  104.644691] CPU: 0 PID: 13 Comm: migration/0 Not tainted 5.12.0-rc7-00067-g9cdbf6467424 #102
> [  104.644907] Hardware name: riscv-virtio,qemu (DT)
> [  104.645068] Stopper: multi_cpu_stop+0x0/0x17e <- 0x0
> [  104.645349] epc : patch_insn_write+0x166/0x17c
> [  104.645467]  ra : patch_insn_write+0x162/0x17c
> [  104.645534] epc : ffffffe0000059c6 ra : ffffffe0000059c2 sp : ffffffe002a33c70
> [  104.645580]  gp : ffffffe0019e5518 tp : ffffffe002a232c0 t0 : ffffffe01295e8a8
> [  104.645622]  t1 : 0000000000000001 t2 : 0000000000000000 s0 : ffffffe002a33cc0
> [  104.645675]  s1 : ffffffe000007f72 a0 : 0000000000000000 a1 : ffffffffffffffff
> [  104.645716]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000001
> [  104.645757]  a5 : ffffffe0799e45c8 a6 : 00000000000ca097 a7 : 0000000000000000
> [  104.645798]  s2 : 0000000000000008 s3 : 0000000000000f72 s4 : ffffffe002a33ce0
> [  104.645839]  s5 : 0000000000000f7a s6 : 0000000000000003 s7 : 0000000000000003
> [  104.645880]  s8 : 0000000000000004 s9 : 0000000000000002 s10: 0000000000000000
> [  104.645920]  s11: 0000000000000002 t3 : 0000000000000001 t4 : ffffffe000c615c8
> [  104.645958]  t5 : 0000000000007fff t6 : 0000000000000380
> [  104.645998] status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
> [  104.646081] Call Trace:
> [  104.646147] [<ffffffe0000059c6>] patch_insn_write+0x166/0x17c
> [  104.646280] [<ffffffe0000059ec>] patch_text_nosync+0x10/0x32
> [  104.646317] [<ffffffe000007d0c>] ftrace_update_ftrace_func+0x74/0xac
> [  104.646352] [<ffffffe0000d338a>] ftrace_modify_all_code+0x9c/0x144
> [  104.646387] [<ffffffe0000d3444>] __ftrace_modify_code+0x12/0x1c
> [  104.646420] [<ffffffe0000c4c2c>] multi_cpu_stop+0xa8/0x17e
> [  104.646451] [<ffffffe0000c4474>] cpu_stopper_thread+0xb2/0x156
> [  104.646489] [<ffffffe00003645e>] smpboot_thread_fn+0x102/0x1ea
> [  104.646524] [<ffffffe0000311b0>] kthread+0x132/0x148
> [  104.646556] [<ffffffe000002e02>] ret_from_exception+0x0/0x14
> [  104.646657] ---[ end trace ccf71babb9de4d5b ]---
> [  104.647444] ------------[ cut here ]------------
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  arch/riscv/kernel/patch.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 0b552873a577..6d2ed9c15065 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -49,19 +49,18 @@ static void patch_unmap(int fixmap)
>  }
>  NOKPROBE_SYMBOL(patch_unmap);
>
> +
> +/*
> + * Before reaching here, it was expected to lock the text_mutex
> + * already, so we don't need to give another lock here and could
> + * ensure that it was safe between each cores.
> + */
>  static int patch_insn_write(void *addr, const void *insn, size_t len)
>  {
>  	void *waddr = addr;
>  	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
>  	int ret;
>
> -	/*
> -	 * Before reaching here, it was expected to lock the text_mutex
> -	 * already, so we don't need to give another lock here and could
> -	 * ensure that it was safe between each cores.
> -	 */
> -	lockdep_assert_held(&text_mutex);
> -
>  	if (across_pages)
>  		patch_map(addr + len, FIX_TEXT_POKE1);

Well, we definately need the lock -- otherwise concurrent callers will 
install conflicting maps for FIX_TEXT_POKE*, step on each other, and 
install the wrong patch.  I just sent out a patch to use an explicit 
lock here, as sharing text_mutex doesn't seem safe.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
