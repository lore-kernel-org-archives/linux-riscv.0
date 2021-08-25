Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D16C4320E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 03:49:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85D5161357
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 03:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85D5161357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7LTDi1C2bDJyDHfqgR7ndtqUmjp+OBveLNZ2P8ICUAs=; b=VJORr3xDKni8a1LUrtRt8AcNCU
	uhNzuKrLBfvOW+I21mwikLNAPWaBmhOJtE2QqF9fJj8tAhyQG9yxS/iAb/CRmhR9ZWxgXaq0SAipd
	CIBR+YdhChMT8BlU6eqlgM+1h9RMxX29zV7GK9loMQgefttl/Qnu3YFmxu/quiYa593yPkHlczq0D
	EQM2wxLYsw513729BPRUqZgg/hOyVQyBXTzOL4buwUBRoR/8wBzLoTwBrR6DLN6/1nrm7JnX+Q8VK
	lM1z5iOPfOM60rKwKWMFzOUeaMy5G40KpCRvEDD4xv+1l/BaHJy2PdkIViyR0SFnwnr0XptTfic68
	laJDEhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIjv7-005OXv-65; Wed, 25 Aug 2021 03:49:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIjv2-005OVm-GS
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 03:49:43 +0000
Received: by mail-pl1-x62f.google.com with SMTP id w6so13516057plg.9
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 20:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9sHfdiClg+ir79cDPtKTL0W793DnT07IRwQSqAPFHp4=;
 b=SNHYHGi1ywjzqrjN4Vr5b6iNJuFzuwLqCq5u/T+Vfl6bT/nVDfak3HIZ/5zzUaXBLx
 qHXc5HMhjunz5Tcci8T3BtPjccUPo9lQag2yq3MXOA8dzmHpPURkp4Phyb+NMOiA8uHu
 mAk3iNIjgmeySpy814cH9pbwf2U7WobmCunvxbey2Y5JK954SHN6j+FOB7BhcUUV6fy6
 b2YKJhK2R6UhdDgyj6KV0/AwH80guc1lwrwNI99/pqR9LOlSlx+tvHE2KYpVFMgq+70x
 D/65PWFVp2fnw4Ly+nACy81jTlmetYbczposURZHXwCv83wJ8N9j9QIOFTbcm721nckF
 YnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9sHfdiClg+ir79cDPtKTL0W793DnT07IRwQSqAPFHp4=;
 b=e5lXSz8jQ3fW/xFWMoDvI+ThZuWMf/NInrqQZmwLmMWVnIFSSyrSU54TgBNb2LlVxt
 2/unPdWpACjaZgV3Fiyrh/AqWYJxVHVmcvZntwhFy0FKJt5Z/XrGUgAtFUb+/twKCIR0
 bMn/ksBAtJ0g7jC8oSVI2PAgvfQjA9U4AmXEFKz8f1OIVlHHrXsLkfAn3F9LuvnubDvG
 aHhUwYcdIfbpldFxiD+AejsajiesK66b4cH7Nz99i+Wj3KnHFTGolKMZQ58PcYY/bZgT
 3rEgzKKh15uBWohj8pj9pUVvBpNLhtRWN/Puoj52jBNWTBVYAyz8fM18+/vxVFemrizw
 4TwQ==
X-Gm-Message-State: AOAM531AsqrqaUdmbIj2605iFJP9QDc5bUyaJAi/8TlNThgRSyB3S31s
 me+hpQY6kuA/Zs7i/86MpcT2ww==
X-Google-Smtp-Source: ABdhPJxItrgE+EVFUgM4xk5y1cyovfSflBdGl/ZTQWYSibONNZyb8WQmjv4eJYMsWeIsNWXL/FrN5w==
X-Received: by 2002:a17:902:9008:b0:12d:8258:e07c with SMTP id
 a8-20020a170902900800b0012d8258e07cmr36851163plp.42.1629863379987; 
 Tue, 24 Aug 2021 20:49:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x26sm20744756pfm.77.2021.08.24.20.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:49:39 -0700 (PDT)
Date: Tue, 24 Aug 2021 20:49:39 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Aug 2021 20:43:54 PDT (-0700)
Subject: Re: [PATCH] arch: vdso: remove if-conditionals of $(c-gettimeofday-y)
In-Reply-To: <20210731055733.12332-1-masahiroy@kernel.org>
CC: luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linux-kernel@vger.kernel.org, masahiroy@kernel.org, will@kernel.org,
 tsbogend@alpha.franken.de, 
 mpe@ellerman.id.au, catalin.marinas@arm.com, benh@kernel.crashing.org,
 linux-mips@vger.kernel.org, 
 paulus@samba.org, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linuxppc-dev@lists.ozlabs.org, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-2a609a54-0d13-4fb3-9966-086357936773@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_204940_589407_C2980D46 
X-CRM114-Status: GOOD (  10.31  )
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

On Fri, 30 Jul 2021 22:57:33 PDT (-0700), masahiroy@kernel.org wrote:
> arm, arm64, mips, powerpc always select GENERIC_GETTIMEOFDAY, hence
> $(gettimeofday-y) never becomes empty.
>
> riscv conditionally selects GENERIC_GETTIMEOFDAY when MMU=y && 64BIT=y,
> but arch/riscv/kernel/vdso/vgettimeofday.o is built only under that
> condition. So, you can always define CFLAGS_vgettimeofday.o
>
> Remove all the meaningless conditionals.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/riscv/kernel/vdso/Makefile     |  5 +----

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
