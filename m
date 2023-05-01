Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BDBC77B61
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UwAHmM/o1nCEA8+u4Hzr3yj9okxnacoGMXNsESKHlVM=; b=Dwbj/q+LkoGx00jfTJaWj0nkn+
	issrd+yj1uzpH/EHMaHmEQkfq4lqI4aVn5gMYehTnyeTPzh8pcbRrPcQD5Yq2+aneNH7EKWhUxPx3
	RlYYN46Q4YlOc6PXyhUGTsxxPJcf7smy11uZEkiNt8P0sWe4Ks86Secrz9nyoMGP3Qe0AcOpsx+9P
	VnBijQBNzMRETI4OChq17X12T3pVSLE2rmfbmC8txBnS3CvYJjYk11uZzrYud2KDUjAsPMZPo+SpF
	LH8g6LVRStZIDveIOXpQNCToAKbaIvsUWYdndNZB9D1zzdT2DXlC5rYleKCCYjRz1EVzFGTPOayc3
	rAEKhYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptStO-00G1cR-0h;
	Mon, 01 May 2023 12:44:34 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptStL-00G1az-0p
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 12:44:32 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b5ce4f069so2923757b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 05:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682945067; x=1685537067;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+/m/Q8rJDfBtNlvA5MoeSZihLHMU+hMCap0lrbB/rs=;
        b=cwwHyIgX4KWvvBvY8nSBkLAFNRsKMYzp6WW1Di0i93YYJQgPlYiPsZZCu6Q8jvx894
         ycO1ma38TjwwxCTgtSZueTlcY4Th+uxr3S4GZBnOqQEH/2pBTsxgbr9pWx/8L3JZczbj
         MnpoznAqXqI5UK+Sm37GsXne1PqltuZm1m4Xu8tVG+/im46OIrq2m1j0tSR/GAxO8Bh4
         VdlXDlQkolJTQQTRdSXDTZdb4WP2mQUEn80kYCVF+/O11w7FZ444LzumBUmo4iRb4nVZ
         uU5vUU+SbF4ykTZ8FxZUOcJJPtSPqDIpmNPWpIGo5upiSDMbV64yvLxaou3JoJtoNA5f
         aYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945067; x=1685537067;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+/m/Q8rJDfBtNlvA5MoeSZihLHMU+hMCap0lrbB/rs=;
        b=WurjQ8fOLznmhAxWMAhuqp9gmH605n9vhSOpcGVw8YZN4ZNqmqPss1FLupYGqNzeou
         7uEHI+1xcJv4Ar2Sk5Njx3o3V6dBOFwMktR74hAaAzZ7T/tYEAmtKZjYUKoN4IQZ9sfd
         vT37SEqJSctPBKV52UA2dKtnSzJU57G2REk2tCEeUoOfcAI8NOD4cHqOEipYKjcnIX4D
         9KwIt4YL2EILgA58LXmWdISHUXDeERxtWV77UyhAqZxpGO2Z7Hcj2daxU65Y9fuQluH5
         k9Ro2DXYZ376zlMp1ATjTmzhqWDBkpAQWpXJijokUoIkeMgPiHUvlkTClAD/saTAMmJy
         ZOTQ==
X-Gm-Message-State: AC+VfDxX/ipcDNMVLtgSJvdDl3hIX4ZRBoXnILV1VK41/hlBvIFYH8xR
	4EErPbQceufU1KfH2B3krFiz5Q==
X-Google-Smtp-Source: ACHHUZ7UwoeVcV7NcPNRh+PYPFK4S9ad6FQ4bVggkB4CDQoyhbAx7EDtp4SCD00iu4lmGkebBwMNsA==
X-Received: by 2002:a05:6a20:6f03:b0:f8:b39b:b24e with SMTP id gt3-20020a056a206f0300b000f8b39bb24emr14578405pzb.11.1682945067231;
        Mon, 01 May 2023 05:44:27 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v17-20020a62c311000000b005a8bf239f5csm19690294pfg.193.2023.05.01.05.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:44:26 -0700 (PDT)
Date: Mon, 01 May 2023 05:44:26 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 05:44:09 PDT (-0700)
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
In-Reply-To: <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org>
CC: ebiederm@xmission.com, prudo@linux.vnet.ibm.com, dyoung@redhat.com,
  akpm@linux-foundation.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
  dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, nathan@kernel.org, trix@redhat.com,
  mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, bhe@redhat.com, prudo@redhat.com,
  kexec@lists.infradead.org, linux-kernel@vger.kernel.org, zwisler@google.com, rostedt@goodmis.org,
  horms@kernel.org, ndesaulniers@google.com, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
  linux-riscv@lists.infradead.org, ribalda@chromium.org, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ribalda@chromium.org
Message-ID: <mhng-6809e805-0a92-401b-af74-fef93eeda1ae@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_054431_510140_93293899 
X-CRM114-Status: GOOD (  16.18  )
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

On Mon, 01 May 2023 05:38:22 PDT (-0700), ribalda@chromium.org wrote:
> If PGO is enabled, the purgatory ends up with multiple .text sections.
> This is not supported by kexec and crashes the system.
>
> Cc: stable@vger.kernel.org
> Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  arch/riscv/purgatory/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index 5730797a6b40..cf3a44121a90 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -35,6 +35,11 @@ CFLAGS_sha256.o := -D__DISABLE_EXPORTS
>  CFLAGS_string.o := -D__DISABLE_EXPORTS
>  CFLAGS_ctype.o := -D__DISABLE_EXPORTS
>
> +# When profile optimization is enabled, llvm emits two different overlapping
> +# text sections, which is not supported by kexec. Remove profile optimization
> +# flags.
> +KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
> +
>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>  # also link a purgatory.chk binary without -r to check for unresolved symbols.
>  PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
