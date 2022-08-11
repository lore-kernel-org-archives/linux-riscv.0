Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276B7C25B06
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=HJz9c53ss9ajP0/y5X55eliXLg88hl4oroXZMsDdE3s=; b=SFvPLEUjBAQtP2IIWApOoh6wVt
	7uD3pya+OoBK/IcENJuSGvt/hiPQCQSfbTf+tkz25YItDlD8ZFqgNAR+TsbuDCmGkfKKjmH6YpIvX
	ec1NemS8bVDXyFfBOgh8CeeDo1dyab2HzChrZOKEzW2dDaBTRiaucCm/hJDxavUmuomtOGyHaETw3
	GVowB36/cIEkUwmcKA42iFBjaAMPCgWG/DRhEId2AqAF3yH2V3GhaEQaNkDmJCtKrLaEd1KsN/PPd
	qNDHDVyQ/6H/L0aMlOLIXzNXYTv4oIzLD7Hx/p/0kSfWGsJIyVpf3Q/gg0ZXViHqQX0AJ8RU4qRP6
	thWiALQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMBR6-00FML7-6D; Thu, 11 Aug 2022 16:53:32 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMBR2-00FME3-T7
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 16:53:30 +0000
Received: by mail-pj1-x102b.google.com with SMTP id q9-20020a17090a2dc900b001f58bcaca95so5930379pjm.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=QSpm1V+Ji47xL0bb4a9x9poHrFEc/OWZ59EiV9Me3Jo=;
        b=X/u+FLkyzkuFdNfRE6blckihWwEe3TVdXw9DwZWy9d6NmFNRbqRIMZgNpQ1i0+5NZ+
         HPCExhGijUIVKwqUQvCM/RCTK4WG5knu0PEDJ9mGHGpczh44JzBRSUghHAWbo/eWjGPV
         Y5kpLfcGXHCvhDMnVbfnZ5P5cfwe3A90NsBHWuwDFuWDUmJQFI8MKy828C5d0EyH7/TZ
         DqM1l1lG1PyonBhq57LVAXrlmrNHbbXFrJ9VbfNXPDknsOO7UZb413p43bbnDNXvjPqx
         B7FTCG68mGzEE6eA/M3LwJKiSEFGOTkQLkGoKZT907VWu6GVat1dOmnn81YUEoBi8QPE
         D5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=QSpm1V+Ji47xL0bb4a9x9poHrFEc/OWZ59EiV9Me3Jo=;
        b=x3zvAqoKbHBvp+/1peWOhK9kT/1Dbs4aiaqfwFRr10uhSGxHQX1hbjZGcknOFtw8Su
         koD6XWHnhBMgom+khef4URoFo1HACzd8FBdCu7VhDsSTcLkACDcAn+KlKg9IjPKWwvrm
         Z1Y9DpEtMVIzV348xZDWnPRP0VI8nFHt72xE2Jf8gqfBnDSu5G/4z3L2/RlElhKBJaao
         umQJr3C/Lbz6Kc+Pte3Am7Fs/9mQD0rAfZe8OonbJCNOZqqUGseDvAnzJPaXIPyd4q8F
         kVu+eqros134hqUabGxNfeSFfyoxnGb6/fRL5C9SFE0zrZHX3qpiAt+9oGxNQ6RwYhwx
         o6Bw==
X-Gm-Message-State: ACgBeo1/QGgDoNFbgjfDQJ0TNqjP7fzqAt8XnKUO2kI0GMqzJfr9bcNR
	rzJbos0RZGPpSfU76hq/61S58w==
X-Google-Smtp-Source: AA6agR5ueu1dLkkrusSuI3DsSk9yaavTbdaR+6RE9jVrGKdK+odMpnXIKdJ10mwvIfyJbJqa43rTNg==
X-Received: by 2002:a17:902:dac5:b0:16f:63c:3e91 with SMTP id q5-20020a170902dac500b0016f063c3e91mr66920plx.169.1660236805100;
        Thu, 11 Aug 2022 09:53:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id c11-20020aa7952b000000b00528c22fbb45sm4441125pfp.141.2022.08.11.09.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 09:53:24 -0700 (PDT)
Date: Thu, 11 Aug 2022 09:53:24 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 09:53:07 PDT (-0700)
Subject: Re: [PATCH v2 1/2] riscv/purgatory: hard-code obj-y in Makefile
In-Reply-To: <20220725021902.625630-1-masahiroy@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, masahiroy@kernel.org, bp@suse.de, lizhengyu3@huawei.com,
  ndesaulniers@google.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-e4e57be3-7448-411f-9633-af8a320edf45@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_095328_973140_458EF4EF 
X-CRM114-Status: GOOD (  15.16  )
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

On Sun, 24 Jul 2022 19:19:01 PDT (-0700), masahiroy@kernel.org wrote:
> The purgatory/ directory is entirely guarded in arch/riscv/Kbuild.
> CONFIG_ARCH_HAS_KEXEC_PURGATORY is bool type.
>
> $(CONFIG_ARCH_HAS_KEXEC_PURGATORY) is always 'y' when Kbuild visits
> this Makefile for building.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> (no changes since v1)
>
>  arch/riscv/purgatory/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index d4df200f7edf..c2d14e2f345d 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -92,4 +92,4 @@ quiet_cmd_bin2c = BIN2C   $@
>  $(obj)/kexec-purgatory.c: $(obj)/purgatory.ro $(obj)/purgatory.chk FORCE
>  	$(call if_changed,bin2c)
>
> -obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY)	+= kexec-purgatory.o
> +obj-y += kexec-purgatory.o

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
