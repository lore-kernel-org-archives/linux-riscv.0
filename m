Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACAAC2D0E4
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 00:14:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF76B23A65
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 00:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="skHkzT8K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="MGiQ7+/4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF76B23A65
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=eglGB2Tax+cq2keXuqjYtY28FNUCKP/AhOrlwesv04E=; b=skHkzT8KlhmCHLGrlreK8K2U8
	4DU51Lg8UiE5XGtfUMwlU5jnQMBArpiiryI/s6id7vwc2ld+6qSMkehadHx2aUMmmpHIZVeYr3DJ6
	qDpLpSxtKEhIkiF2nrzhRlmN/+JjUlMIQnEFQ0bEJclACooGHt4wmNrfMl4/YxQZ2F0OjB/5Bo/G0
	Q9MkLLD8nU9qZVntw1Gwx0K0BcWtoXiRa5qCcGNEHfY4lBr+bF8s51+ysYO5AT/QzkoObOVHUq2ex
	7QJ/Iu9LyJTiUFLwJ9eEDwA2vLCPBxNSJItNRYJu6YsoKFmbC6V9QN4WIYd0vGxOFMYspcmePSWIs
	nBBaxeVFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgGXi-0001IH-Oe; Sat, 21 Nov 2020 00:14:18 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgGXf-0001HP-Hr
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 00:14:16 +0000
Received: by mail-pf1-x442.google.com with SMTP id 10so9455251pfp.5
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 16:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uKqWBXY7mffdyrXuPqWycdmx7WjMxlzQo4Hepbp5MLA=;
 b=MGiQ7+/4djIxMNoiGQ2HQ5FgX0BiX7MECdXbKPZQNck9BCSf+vD2+mluHPNMzxP+cG
 RI0JpcoQox5J9JpacWYIlNvbSs1OrmSiauOJ68nqJB8tYnVuKuPBYc8FcY1jjqvArHkA
 I6HVsM1vDIu+1mfN0Wl7aQWjh2gsxwta3wtgwqJ9oZ+fcL+3/zZ0LOLgvGnvXFaqMwCj
 hL03GrfM7phnxuW/StGxVHtcBP2ondXPfL4j3l6zj5t+qWg1haT1vASUsL4Qti5hi+nw
 5coIoF1phUpLhxGUIGQtFXzot8Pa+T381k+CAFNX/BgZfUyxMNe2Zr9rrHM2tF0Z1vRx
 MYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uKqWBXY7mffdyrXuPqWycdmx7WjMxlzQo4Hepbp5MLA=;
 b=Js5pB8KJFVhRMP3mEZ5GSTsKVCZXzKZ1GKR4YGuJwf+kB7VbYu1PddXMV8/0ytOcp/
 1cWQtJPQEhEPYHdbDjOPyhgJWUT6EmpM+KXWD9MUQqOGyzlmbqr1Hhh6tCjdv5QnT8CZ
 Dw4aFaKYgQYX4qNj0+cyZbfVWaTf7smOJlpUH1ojoxuBbk826/vUG7ilcQp1WbleCosq
 nFIVpF/CKGOZx1XDbohOf/8GWwxDNMRGxnO1RW/kHMVkX4ei2TJDREJAmUttfVgckpa3
 nNvlIsTGuqEFspRMfhs5/cGF3pT0jAXQxrDeGnUyqdNluralF+A33YAf40jJbTLe9C1/
 AF4g==
X-Gm-Message-State: AOAM533DRt6Eg2l0Er7EYN3lj59GEddh44j6CLo+H3CUGwaK0DYgaSDx
 GzPc2sv18oEork4PdRWI9Z1FqQ==
X-Google-Smtp-Source: ABdhPJwimHlEuo6JCbvv0hg1vOC1+1xFeCDf/huX/AovS5V1x99g1hDelggACAaCxCijehAiqasUPg==
X-Received: by 2002:a05:6a00:1684:b029:18b:665e:5211 with SMTP id
 k4-20020a056a001684b029018b665e5211mr15948880pfc.20.1605917652295; 
 Fri, 20 Nov 2020 16:14:12 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s4sm5432591pjr.44.2020.11.20.16.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 16:14:11 -0800 (PST)
Date: Fri, 20 Nov 2020 16:14:11 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 16:14:07 PST (-0800)
Subject: Re: [PATCH] RISC-V: Add missing jump label initialization
In-Reply-To: <20201106075359.3401471-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-f4c607c8-ecf6-4eda-88de-4011214fcb33@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_191415_606276_0D52A5B3 
X-CRM114-Status: GOOD (  16.62  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 05 Nov 2020 23:53:59 PST (-0800), Anup Patel wrote:
> The jump_label_init() should be called from setup_arch() very
> early for proper functioning of jump label support.
>
> Fixes: ebc00dde8a97 ("riscv: Add jump-label implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/kernel/setup.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index c424cc6dd833..117f3212a8e4 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -75,6 +75,7 @@ void __init setup_arch(char **cmdline_p)
>  	*cmdline_p = boot_command_line;
>
>  	early_ioremap_setup();
> +	jump_label_init();
>  	parse_early_param();
>
>  	efi_init();

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
