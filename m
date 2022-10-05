Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE65C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 01:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=YDUKZZfiK6W4MD/LWvkzlWSq0A4P209rSayeFQFLnAo=; b=faLa1sLSIbcon5KvXxM2TTXDTa
	SwDlw/rjWV18Z4MSYYz0CIJ6FUiDvUwgvn6bPJd1ZQxwoUZnH78WR+E73U2i/KOg+uEYSRvkoSR5W
	rADnRk5+09n6AAA2pVfNG84WRCrdw+RVc/UYbOOEruPK8HJfbr4Vno5Fspr63oDWY87SYo4CAtNkZ
	ZJRiNTjCStH8VxJlryRqBK5+JFe5p3GZNBb9/gFPHKBFdpPjWF5QioTRg9q/z2T3wSHikmP+T/HqU
	UG+sEBWVclFJxwEpCtCRpT5tGmyzvNg2f9hbzQGlOcaFXAD6afjPzXdKLtVkULIcKKnB2ITku4mu9
	/BQtO6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofteu-00BxgE-V2; Wed, 05 Oct 2022 01:57:16 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofter-00BxfW-QP
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 01:57:16 +0000
Received: by mail-pf1-x436.google.com with SMTP id d10so14643927pfh.6
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 18:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nnwFItTZ5v5c/yn0akkkDOhkXWTPLIC0iJTGVgBYgQ=;
        b=64zbq9qZ7oHAyAN3Ch+JOyehs2MDZe+h3ZRV5N9hYybE9KjXb/+ciw3LkJ4oyQMjFy
         S8PKE0hMH8L54Hui716aLwyqJvdHOJHEBkb4ZBkz9yRqUU42DzBSKJprrzfT1B5U8J5J
         Kxm51ooJHMUe8WZjr/wrR5kzYc6kLUjjP6U5NtKcmo0wgycStSLqYb/ROYb8GfoyxcdY
         ddGeIef6cXAxHyp2bIBt7o7lsUJfHWtwZSnE/OmpnDCoe/rzpvV45jQK93hpeYblrBOp
         trV9sAVGaPeiBfP05+dubSPAHZtWWP5K0j1CuFCmrQlqJMIQ4lJzLpwMWO+hF+1LyYnD
         BHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nnwFItTZ5v5c/yn0akkkDOhkXWTPLIC0iJTGVgBYgQ=;
        b=qK94xm+Nqt2bklIxhH0J+CvpRG396vhBELq5qFqhNf7KNtq+uSQK8ZdzeTH6A9yx4g
         +/rBw35xXv3tVPa/EGsvrBw+j1C22yFws6u7HcXcr1mkM4jI48RVfcUXx9rWKrABeuwx
         weHQeO8eVA1TXF6ycoM0yXqYmSaMltxnkFhhLnTTer+2BWKFKMJm/PcZ52/bzAQ0h2Im
         UVZ7CsR79ktuNoeZhZdldylnGdCLpRcgbicsqPkVD999eX1WsPNhi0ZQqUzqd66GYkVx
         JJdW9DHftl8V2sTnYiY3Eh6zhYg+6U3NB9JCRMGlYXc74ik8CwjFXu6CgJcUeU/xKGzv
         gUcA==
X-Gm-Message-State: ACrzQf0clESoOhnBPkP/HdPppqbot+9cGQsFpvUBLs5n+Omdy9tRrCV5
	tMacXznGL+GxWSO+uhAH0glg/DZxkglF9xKI
X-Google-Smtp-Source: AMsMyM7TXkA5swm7Nb7pPd71EgAK7p47nc60Ju91fK6VqWMHyqzsh1KkwYTJb5tci0xHRyGl6WAwLg==
X-Received: by 2002:a63:4721:0:b0:440:2960:407 with SMTP id u33-20020a634721000000b0044029600407mr25597666pga.621.1664935031373;
        Tue, 04 Oct 2022 18:57:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id s18-20020a170902b19200b0016dc26c7d30sm9561479plr.164.2022.10.04.18.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 18:57:10 -0700 (PDT)
Date: Tue, 04 Oct 2022 18:57:10 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Oct 2022 18:48:11 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
In-Reply-To: <20220512205545.992288-1-twd2.me@gmail.com>
CC: linux-riscv@lists.infradead.org, nathan@kernel.org, ndesaulniers@google.com,
  llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: twd2.me@gmail.com
Message-ID: <mhng-e9b5bd39-0929-487c-a761-6a3ff508d969@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_185714_089348_03AC4683 
X-CRM114-Status: GOOD (  15.23  )
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

> Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
> issue [1] in prior LLD versions that prevents LLD to generate proper
> machine code for RISC-V when writing `nop`s.
> 
> I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
> on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
> can boot to shell using an archriscv rootfs on QEMU.
> 
> I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
> successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
> image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
> `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
> separate patch further.
> 
> [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
>     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")
> 
> Tested-by: Wende Tan <twd2.me@gmail.com>
> Signed-off-by: Wende Tan <twd2.me@gmail.com>

Sorry for missing this, the v2 never made it to my inbox.  Not sure 
exactly what happened, but an off-list ping made it through.  I've put 
this on for-next, I don't have any way to test it because I don't have 
clang setup yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
