Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD56AC433E1
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 18:25:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99108206D7
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 18:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1y+thkgj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="0AVLkDg4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99108206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Lw/s1tiAu96W/eR8L2sIWPD65MeC6DcYo3aoJca+77k=; b=1y+thkgj7LwgqA7GY5VVT8AxU
	mBmC4XuqqG0o/tx+HIpQM8XIEIKlnhnylzmiqmBvKMP1OLoYsLX6ao8XAj+3laLvCK0Ku6JiTRsj+
	jCu61cul5zNzFCICrCxs8WZy2esJNo5KcwRB+ApdKnrLg5fFe3AhBkANUBrZzClsA9+hrQndvqkGx
	nXHAX+xxZzcETz/GGVKjah9WiVn00TOYK1M93gAtanYI/h4uP5NjfCzYTnCLVr2a3uxgKuBNTtz0B
	HjRMghWnIvROgMcKsS3VAb95aXv55PeHyiDQjDFz1MFnRT3+9yEken0g+gj5ReBWSs81y+mcgzbnL
	AbUqDW6Rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzOqq-0002CE-B7; Sat, 25 Jul 2020 18:24:52 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzOqn-0002Bl-D6
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 18:24:50 +0000
Received: by mail-pf1-x442.google.com with SMTP id j20so6954840pfe.5
 for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2020 11:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=g5KV4oQr9blE2xaUSgxxVlTAVbR4qnTHAPsngn5VHhU=;
 b=0AVLkDg4gvYXOyCyuaQ/UyC2NTl8sa7rUS972GkzEEkWYey9OY2uwFrAoxMvrbUKk6
 x6uShijEDCqjc3W/VfyzX2UUHz4g3J7vJoapE7AN0jar+CW7JDQOm4KxbJ6uMPSkdx/j
 /sfQhtEJQkzDwZCKtZ3dUovhjSMG3beQI9c+4ND3zgsPal5T3b9h+wTjClcJZ8OZbgla
 qooCMTDklefjTGQtl7HKpdN21EPGnLV2HpQRFsQux3YcaBcXNIXPpewlNW/QoFke8JiM
 FJ7zNZK7IkOtQIjbkhs9mvA2AaGpuCYX69o7w6BMoCz8rTLhCAaLD4gMBY+r/o+6LtFT
 gWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=g5KV4oQr9blE2xaUSgxxVlTAVbR4qnTHAPsngn5VHhU=;
 b=EIMFnAxMkPzpIwN7f0VxqEX8/wBKPjTFWpd6KC4bevTmcZILk86Tn5YyWg+qbhme8v
 xucfOziYGV0Y16w59HbF63HUEdNlgxBJxW/V0CWkiJKPcbnYA69k64pOeebgFSVR9AG3
 jGJepoi/sbHsEgdu4atxUuMJWqtrcjW5Yf0/uFJ7rJAswVbT1A26h5m5TVRCPBM0Wbcw
 3SbgRtNsUsyEABNDOBufUP5BA5n/DSOJgcptpx4uJzi4lipD5L0kADTPONdIjXrDQKDH
 SVHjivPQTiYTeBf4+VhMBIVXpDM9U8/Yf7gB/vujthbkS47afvWmzbf48m+oJ22zrmBC
 hT/g==
X-Gm-Message-State: AOAM533+1X50krU77zWSfvBjph6n+wv8+q/Ct33YlQon+zAB3J6AYugs
 gJoPziTOLmeCT2zGbnr//tTucA==
X-Google-Smtp-Source: ABdhPJws9Ncp+xuPpJvv/8k128LHXFkxmXtpwAUE3C5X74SuXudwiFvjH0EoAMdDaY+TX1yoajakZw==
X-Received: by 2002:a63:9342:: with SMTP id w2mr13144548pgm.20.1595701486207; 
 Sat, 25 Jul 2020 11:24:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m9sm9046242pjs.18.2020.07.25.11.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 11:24:45 -0700 (PDT)
Date: Sat, 25 Jul 2020 11:24:45 -0700 (PDT)
X-Google-Original-Date: Fri, 24 Jul 2020 22:21:16 PDT (-0700)
Subject: Re: [PATCH 0/2] Fix some build warnings when W=1
In-Reply-To: <cover.1594880014.git.zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-7bb6277d-bca5-4cd0-a791-3fa2b9891f69@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_142449_557928_82D7BFD2 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jul 2020 23:15:25 PDT (-0700), zong.li@sifive.com wrote:
> These patches fix some build warnings when W=1, the most of warnings are
> missing prototype as follows:
>
> arch/riscv/mm/init.c:520:13: warning: no previous prototype for 'resource_init' [-Wmissing-prototypes]
> arch/riscv/mm/pageattr.c:130:5: warning: no previous prototype for 'set_memory_ro' [-Wmissing-prototypes]
> arch/riscv/mm/pageattr.c:136:5: warning: no previous prototype for 'set_memory_rw' [-Wmissing-prototypes]
> arch/riscv/mm/pageattr.c:142:5: warning: no previous prototype for 'set_memory_x' [-Wmissing-prototypes]
> arch/riscv/mm/pageattr.c:147:5: warning: no previous prototype for 'set_memory_nx' [-Wmissing-prototypes]
> arch/riscv/mm/pageattr.c:152:5: warning: no previous prototype for 'set_direct_map_invalid_noflush' [-Wmissing-prototypes]
> arch/riscv/mm/pageattr.c:169:5: warning: no previous prototype for 'set_direct_map_default_noflush' [-Wmissing-prototypes]
> arch/riscv/mm/pageattr.c:97:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
>
> Zong Li (2):
>   riscv: Fix build warning for mm/init
>   riscv: fix build warning of mm/pageattr
>
>  arch/riscv/mm/init.c     | 2 +-
>  arch/riscv/mm/pageattr.c | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
