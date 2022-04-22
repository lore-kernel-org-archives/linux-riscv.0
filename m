Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6058EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 04:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4lezofk0MezSmTvXGYJQ5/oFbPID2OdpPGz8AeeFfw=; b=Nom6i3KZm0zaXQ
	pqDTOtrm6PdlVDvX4WAudnxh2J5+vkXy9SonuXGBjtGj2sZhICbTCSfw5oHYK2MSx8SBCkUck13E2
	oDockL7nC5nhjLMSGJTixVWKI41NUW6qZfIymHPBxxyfQ5HlomH8FD1FxG+R4IR2RMCDaqYa5Z3V3
	zTQmF6w8+4r7o6cPVsVdoEYHQvZQhJPi8Zhrf1ph+pra2XcHIJ7q4Bpcw48NG2J2jMHev33wSFuQe
	VEw7DpSb4uk2Ik+Cj30J0SyED+sx/RITFKmG1VGG1m5hdoQC7RBEmQTZhJkRejJnKKvWMfEAY0a2F
	6WTTxSIn+d3mvfQ66MqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhlII-00G7ku-3y; Fri, 22 Apr 2022 04:53:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhlI6-00G7hR-GZ
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 04:53:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id m14so9346593wrb.6
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 21:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NqW1sJzlV4aSvanIKfDeQQY+sx3syjrs7XXIQkRWQtw=;
 b=ExaW9k1Vitir2nINZomSBatVKKgAReK/fsbXvrAbn5dB27O90V3mOmiO3YAOwCQbjQ
 KO5nRkXFQ2jkYtOGrCSAW2kHDHqTx+r4K7qW3xyoxlzKKHpKJj3C2mHxXPBXEjhfW05K
 VwN3yjyHJ62HDahQZqTeMjLhjF38r9RSs6KFHp2iHHfMF9J4gRozQr6M8wzL6caMHMg1
 pVfrKha+2YMwqqQn+cSK/cobq6zGK0HCRIgP93d48oGZUZxHzEjmJkKTiOlZ++2PKerr
 5dnVo7MhjEaLGiwzbJt1TbXG1MT28I3fQJv9yvaAZ+1NF7eZocbk5BHj0OeqG9yV02sb
 hGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqW1sJzlV4aSvanIKfDeQQY+sx3syjrs7XXIQkRWQtw=;
 b=Z0FMpz8dsJak8YuQotsfLdz1V7REflPDcLtI5ePUJUyp5uTOrXybXjdZhCs1z+uQcD
 YvhptUxFOvkHZOEcqqKTQQrBLWo7Ou7LeefK9wUeDS6kCfAboTbjJBtT5zafhoxJwBMN
 FEJUunc4JP/0VznWKHzTOTaIy3j/IZsxHYX26HsHUG3O8+6t8Ane3mSl/5lY9xIgaY17
 LixiYvz3TsFyb2iVy6ZSVLTfo7b5L7/KOF2OcezyxAzwCL35bgRYlihDaa5Ui6z1trD2
 cagX//1xrCrHqvxT1IUsAIVLoAcD/FukX9iAWFx/YRXw8/1ZbgO6qPenblqBYDQfTFDR
 7vUw==
X-Gm-Message-State: AOAM533ewz1yE3843cJttra/NQmA8xNAsqpl1U0e1o1IP/Mu5SZYpsBV
 /jnEmrx8ONIdYwp+SofpdvlaGI9MTcPg9gUWBdamsQ==
X-Google-Smtp-Source: ABdhPJwO8Ppu4TLD2X9dPtcPRS8bzrDXPNIiNgP5tsIUWjZSMW2c0vzfNNqDaJges1D52AHkvsKdSGVlgSzajGlMeIc=
X-Received: by 2002:adf:db86:0:b0:205:bccf:8cbf with SMTP id
 u6-20020adfdb86000000b00205bccf8cbfmr2055381wri.346.1650603188036; Thu, 21
 Apr 2022 21:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220421170354.10555-1-palmer@rivosinc.com>
In-Reply-To: <20220421170354.10555-1-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Apr 2022 10:22:56 +0530
Message-ID: <CAAhSdy0QpShLVXhaT+meSvzkAkDzkG5SqHGbMa4wXdaG22KVWA@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: Only default to spinwait on SBI-0.1 and M-mode
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_215310_576372_944B1187 
X-CRM114-Status: GOOD (  24.66  )
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

On Thu, Apr 21, 2022 at 10:35 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The spinwait boot method has been superseeded by the SBI HSM extension
> for some time now, but it still enabled by default.  This causes some
> issues on large hart count systems, which will hang if a physical hart
> exists that is larger than NR_CPUS.
>
> Users on modern SBI implemenation don't need spinwait, and while it's
> probably possible to deal with some of the spinwait issues let's just
> restrict the default to systems that are likely to actually use it.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> This seems to be the source of many of my new hangs when trying to test
> the NR_CPUS=512 support.  It's not really related, just fallout from
> testing different setups.
> ---
>  arch/riscv/Kconfig | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 00fd9c548f26..dd5e975abe37 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -359,7 +359,7 @@ config RISCV_SBI_V01
>  config RISCV_BOOT_SPINWAIT
>         bool "Spinwait booting method"
>         depends on SMP
> -       default y
> +       default y if RISCV_SBI_V01 || RISCV_M_MODE
>         help
>           This enables support for booting Linux via spinwait method. In the
>           spinwait method, all cores randomly jump to Linux. One of the cores
> @@ -370,6 +370,12 @@ config RISCV_BOOT_SPINWAIT
>           rely on ordered booting via SBI HSM extension which gets chosen
>           dynamically at runtime if the firmware supports it.
>
> +         Since spinwait is incompatible with sparse hart IDs, it requires
> +         NR_CPUS be large enough to contain the physical hart ID of the first
> +         hart to enter Linux.
> +
> +         If unsure what to do here, say N.
> +
>  config KEXEC
>         bool "Kexec system call"
>         select KEXEC_CORE
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
