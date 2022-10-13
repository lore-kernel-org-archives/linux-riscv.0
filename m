Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8204C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 05:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXVm/K88s0a3SAQemMZFFf+fGE3FpAvIZsMqzjsN8/c=; b=TU3lpLYxOEz4CY
	pIZuCasA4Xy/vu77/YpgKvr3UG9FgZ5kBBjzwHCaWxmBTYW7odi6WY+QBUtBTzhAiRbqt6WMkzQN5
	fjyT7E95DjMBYS8FFzx/TImeFA0xcdrWLi2eHJq6KzILl6v8PaVAo7ZvgdfkUZVebP/fk0oCs6s1q
	Ju9jO8T/cXAUb/WmBFOsEmwZ5CrjtRBV+eG/m6gOHx5bi3E/9hrI4z2s18hTc84y06+z01OOoZmwD
	AMCScO7+rm7ddriPkPwho64HMJWI3zg/XFncoTcB5Pw4tXXfLnBLchHVilv/FjPM2098VmezVrkmE
	7CCIUc3WmIxNs1xk+QNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqUQ-00AfvC-6T; Thu, 13 Oct 2022 05:10:38 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqUN-00Aftc-2P
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 05:10:36 +0000
Received: by mail-ej1-x629.google.com with SMTP id d26so1444035eje.10
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 22:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H0+8Gcuqu1UfIIg3dEddVHWK5ITU4lYfUd1AQFuGSck=;
        b=PNlEEsHdwYVg58gMTF3ZhmKzEdrbX4fl9/AhTWGZQ3wfRNAwC7Wsw7fkNz2phgytzu
         e+315XZJOSxy2j3+clw13RR71xCsdYqaXQghL/M/eGefdJTVAvWHgIYsLLkUBKmLnG4R
         EKtKs/N7FV0Kw5xV7wtHTA+fEqglQQ7SdaoLrHlwXNwiaBAyhpbsDcKV/6kC+WflfL2u
         LcL+5sJd7N8pk1geCXWKK+I8b+dCkTiBhnTkrFeMc04YW+ApYOEV8S2WRG0TVsZRpQQT
         SZ9ZIx+9iH/bvqhjWboqe6QuAUPv32X0LhCUhZ7xDCJYjdactM0WUmKr/GsSkblFwsja
         9BjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0+8Gcuqu1UfIIg3dEddVHWK5ITU4lYfUd1AQFuGSck=;
        b=LTWOD2aOU9yhGKr2FDNnrPKoJxL63BrPOHz1UlgtB6ffQJoRBrNlePWkCWZpl7tXT+
         xDvX3R/fa7eXw8IX4wXq+qQp2tZ2GJmPB+tw9MZERiZPqFTl3rkxPhoQHtvO0EJ5unwM
         JcKilEJ2c243Ll4eWyJzBcQKhnJm69o5YyulP7Kl/P4AXFXzPzBGCaISZVABKz3x30Ru
         lvrXPFBtWtk6Hd1aLtlrPOHjD6bDiOCIJDJH+4uikB9J1vbY1/wd3rAk1xCQmA9q6fny
         MbYEky1N7Z6I82b6XF5tXtfi0KtGKT4r+5+fa5eg9yuaX/I2l2lN4Iq89gsK6XPBDkD5
         q3AA==
X-Gm-Message-State: ACrzQf0186rYZocmKPp6EHOBMLY6crilmNQDDQM5QMpHlKoxqLuF5R0f
	hsCnFnkcqVYJb4LzOQu9wuBHJ1CxGwk8bqg9vp41EA==
X-Google-Smtp-Source: AMsMyM40g7/fYyTpIkB5M0+vGUbqGmA/ZLanWaIjN6oMD37YP60Aj424A3hZfIdLXXMlNOEEi5oEBv93L2VaR5eF/io=
X-Received: by 2002:a17:907:96a6:b0:78d:b6f6:3886 with SMTP id
 hd38-20020a17090796a600b0078db6f63886mr15039218ejc.106.1665637829662; Wed, 12
 Oct 2022 22:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221013045619.18906-1-palmer@rivosinc.com> <20221013045619.18906-4-palmer@rivosinc.com>
In-Reply-To: <20221013045619.18906-4-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 10:40:17 +0530
Message-ID: <CAAhSdy3UdPr9EVdKakN3hkBG-eoeDa6uuO1=X3OfKGgdttQUAw@mail.gmail.com>
Subject: Re: [PATCH 3/4] Documentation: RISC-V: Mention the UEFI Standards
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>, corbet@lwn.net, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_221035_128076_3ACE6CE7 
X-CRM114-Status: GOOD (  19.35  )
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

On Thu, Oct 13, 2022 at 10:26 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The current patch acceptance policy requires that specifications are
> approved by the RISC-V foundation, but we rely on external
> specifications as well.  This explicitly calls out the UEFI
> specifications that we're starting to depend on.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me from a KVM RISC-V perspective.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Documentation/riscv/patch-acceptance.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 0a6199233ede..9fed6b318b49 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -20,9 +20,11 @@ Submit Checklist Addendum
>  -------------------------
>  We'll only accept patches for new modules or extensions if the
>  specifications for those modules or extensions are listed as being
> -"Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
> -course, maintain their own Linux kernel trees that contain code for
> -any draft extensions that they wish.)
> +unlikely to be incompatibly changed in the future.  For
> +specifications from the RISC-V foundation this means "Frozen" or
> +"Ratified", for the UEFI forum specifications this means a published
> +ECR.  (Developers may, of course, maintain their own Linux kernel trees
> +that contain code for any draft extensions that they wish.)
>
>  Additionally, the RISC-V specification allows implementors to create
>  their own custom extensions.  These custom extensions aren't required
> --
> 2.38.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
