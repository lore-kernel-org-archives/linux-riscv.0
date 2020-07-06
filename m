Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32B2C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 13:32:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A9D7206F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 13:32:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tGcOmKRi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="PoaKW+Yz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A9D7206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=om4US8Tmz9grc1fwSpODPHLfolLab/tPwRaaBsnpGds=; b=tGcOmKRi13AotpeZK0994QEo7
	iu9bH/BPkOaSCUMqWbW31JCEG9llyB9CxHGeO4/rHuhSwrOQP+o2rcdMovJTo3/6g3++Czx1ed7HV
	Aq9DvVZd2/O8RYkgEGIYgRsBXklox5EairGmy2SggXvygMB5mi6MF0aciEZoBiH/Ga64zWNb6N4CY
	cDJxOnIXUExXVVaYlEooCQL8VlNt7QJ16rpG8e3YVwh6/G0n/QTIIzBYzcyqJWDqC/BA3DzKizkQV
	TgPkQ3D9NIs8HwNnTDce7zIh/kZWwz/0K7kaKR3N5FgZflLSpRhG72Ow20Jp0+93BHp7B2h3Thx/z
	kMC/Fe+XA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsRER-0007xE-G4; Mon, 06 Jul 2020 13:32:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsREO-0007wM-Sg
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 13:32:25 +0000
Received: by mail-wr1-x443.google.com with SMTP id j4so38517272wrp.10
 for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2020 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ko2w1+ycEur/pfHrKptDPRv/FO4AoLBCTaMsUEWlZHA=;
 b=PoaKW+Yz+CyO9ACCDiOplerrz2RgUUNWJ232tMWiok4Z7kOpmuuTIx/NfRflNAQmUv
 mNzSDmrvEmiUnrD9dz78LDRo+SxPWFUA+n+hQTHsaqbpYgZNtBiS6IP6Mvm+kuS8RNaq
 Cl3rs3xK94dUtlu9FPjnZru4TyqusrmB+5oxKEsIvlEl5WX4YzHuZQYj19Yv2vXVF5mm
 KapHZS61RNuaZUz/LlDMVLOo+nY9UV/erIZygQ3fcKZfgSeIijFZedXYPqcdIyP/WVva
 jT1Pngr0Yz0u+oWv/dg6k1qEXqwCKKdjwY5/0A3uXHwD1kaRCg2CBsBU4h+ZiSLdC4Th
 1PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ko2w1+ycEur/pfHrKptDPRv/FO4AoLBCTaMsUEWlZHA=;
 b=Xttw22bIIKfatztcQoHt7aRJPf2z7lBBNPI4PEo3zakvgvaJ7PmCJh6n2x5bNtwbCy
 Brh5LgMiJGxPpSonQ31n4EAJ/iiHaaDx/9a7RvYuLn0RlhuieJNwPG/5jkTLJAHlUkM0
 fKPXSRyldYwX+AzJsOBWs2QwScTeZ0uco22emiwuDgyJYJPZmNX3X5vxyiG5vsVY/kt1
 DL+mvDJ24V7x++lWO+/KGrHbDNX8SiKDFr5rBevfhxYFJYh/aNNyeM8YWN3g4wqZIE6p
 AMmTYYJvcPSuh4LeaFS7RglEWjImMz5CIGwkCQmNzVU6a/FfznVR3Uuqh2cOVUmGzt4X
 m5Cg==
X-Gm-Message-State: AOAM531Mlqpb4EYpdmJIqcniorOmZyOVE1vJQ9JT/qIJtwu5gijY8SGX
 J4akZmnrKJNUE0cgdul4HaElvBygwHXiPb/qiHPvcA==
X-Google-Smtp-Source: ABdhPJy+b4oK+stysikQj1MtAzUoVr5iiIUynI8OhGa5g7IJ/LIa2IUN1+VKuIkcaMKbKNOMSzo5MZNW5ArSDO0FpAQ=
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr47894756wrr.325.1594042342000; 
 Mon, 06 Jul 2020 06:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <mvmeepoddt1.fsf@suse.de>
In-Reply-To: <mvmeepoddt1.fsf@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Jul 2020 19:02:10 +0530
Message-ID: <CAAhSdy2c6t6TkwCCU+J9iV0jynNOyzm5fRcXz2CwqB=hhvJC6Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: use 16KB kernel stack on 64-bit
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_093225_075816_6C4405F6 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 6, 2020 at 6:02 PM Andreas Schwab <schwab@suse.de> wrote:
>
> With the current 8KB stack size there are frequent overflows in a 64-bit
> configuration.
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/include/asm/thread_info.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 1dd12a0cbb2b..464a2bbc97ea 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -12,7 +12,11 @@
>  #include <linux/const.h>
>
>  /* thread information allocation */
> +#ifdef CONFIG_64BIT
> +#define THREAD_SIZE_ORDER      (2)
> +#else
>  #define THREAD_SIZE_ORDER      (1)
> +#endif
>  #define THREAD_SIZE            (PAGE_SIZE << THREAD_SIZE_ORDER)
>
>  #ifndef __ASSEMBLY__
> --
> 2.26.2
>
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
