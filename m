Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D467C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Oro0DVvn3gckYwX4YBWh4l8NZg0y0KwUGBppBv3RRXs=; b=Pvm7C2FCMd9iSqvXrnHQcqEOpt
	6s+KAm1S/e3THS1hotn5rZjdv45MiHTi+gV1n/3MxuStqb7XSRuqhUnu30tTBOqQ6AE/nJbJflk0y
	D2PHZPDTr9WL2BYaRBsdBfmUbzSgwxVDpdKmhIAvymQHZINIB8nkh98+2f1ygApkhLt2pN+mRaMsq
	VnVkjhkm1BHp//R5bpojKL3ODHoiPABM/gHfcdLtbNFK830xW81iKSScuFpP4IvodEJoeSWRYzcqn
	VoMUK3EqxbwEr/jqNhlKun07lMGxGOq/bRFXlHuPyF3lMR6ULDnh6ZsGfGvXpEd0C3Hh7BGf2fYn3
	PMZN8d6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxQl-0000000CsJS-191g;
	Thu, 10 Jul 2025 19:59:43 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwEZ-0000000CjSE-0Vto
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 18:43:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-23508d30142so14988785ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 11:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1752172981; x=1752777781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnY/8UVdnX8e8enjBQ6ujPEYmM4pw/IZppWwmW1hvEo=;
        b=eMjK8oEpoVc0TMOdUlvTRSiFC80Dzc0TdQw3Y638Oe9RzI0D6KdW2TP6vFw/HXROry
         5fYNcCScC5vM57R9eZiGikP8SuorW/70PpqEF5/9OC+RKp0EeLslECbJ7+9Ajk+OALeu
         RPpf9LvkFX00EOlmLv6O/p8yE2ao/h9lKeuKbN5oWRwNYfUPANKJjDWoiTCL2Cj5g1jG
         rn4tFwV4I4wnaHKKfxtC0SXNayVgehuwPr6h0D6pNWvVOnIfeQVDSPmA9ee6G4hgz50X
         8L6PLGNnrzwJyIRonGEW7N4sZccsSmu9WIJtING+zhgTITqyxarT+2kiW5fjvhsPhnLg
         QIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752172981; x=1752777781;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnY/8UVdnX8e8enjBQ6ujPEYmM4pw/IZppWwmW1hvEo=;
        b=AYeE9H7b6YRMWxmLwnWiyGHxv+6USZzYlmyBHomcSrhXDUJ5YRL8wbE9KHWs/kyYmj
         ZhKfjNF7lZveUKZu//Jse+IHaKO83ssD0Z/iBYVLM424fUM0/ugJZRCroHhONsTobx0N
         Q5lQ0o5boq60VCBVoMJKcIxwq5pQrdfsT4U4LtJmbVUwE51V64prAUAtV3DEyi6/wwdN
         2C8edJfKEB8kQ0vlD4XfPOtgtxPhrx8ubB0jfC9w7LwghLYGIF1c1ClbjH/5Fmla4Yu1
         tZvC5ZMhebZLo780jnDh6Wz62HD3Y28/7ZWGMKxkIluyR8Y+kIa9vljkWfWIC2XRnkQi
         D0ng==
X-Forwarded-Encrypted: i=1; AJvYcCUF+iQMjHc2SfDG+FKB+Y0jJqh8lHlleP/jORjEn4/AKqYe/3fozdRU9rcDX02uTEuMGrs48u3fp+P1DQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz71ZFkvGrQCaUHceQk3WPZ/ZKp7Nv7GOGrGO2A1+LlkBBwkqL1
	wQURYrTYJIQ95IFylZUtzUNivoTEngT8ZADRXDfETZ2uvNz/zIqWOn8mDkH7J5w/6Dc=
X-Gm-Gg: ASbGncuEIV87/owSOH0lz6p8Vf1mB6pHbNUApK5+NnksRK0RGOvgSzD1bE4J1AgtjyW
	ppyxI5Uvmvv8rCeG+MWQrDoqre0yGTwvj1K6vUwhI2IjMeGaD4pAKHxJyJy2IalfzegBgFa/hBk
	F1zR2NhcgkJ6shE+XMUG73G7yBCFGkZF7osBB6dDPMxlhCRJ8zhydBxuHx9xP9GFrw5YHbq6IJP
	GxAqxz3k1uzIF/dKsj9dTlbPSEWUvl0NFA4SUTt5b3tkTrHml1aiqUQdkEhSDVRdYHEFtNGc/Xc
	Scvv/Fta+GQ+k4qV4fFkF/NIk2QukQWe2dFkNG9MkHzrgBfDJK/zCPVGPy71ChJ48Zm7o8Q=
X-Google-Smtp-Source: AGHT+IHMJ/qK3aP4OSEUQCPGpk+pucneFyglGnVh+UdYApQipUCIF0rMuuf71VK8a5/FxU5krGo9cw==
X-Received: by 2002:a17:903:22c5:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-23dede96543mr4062745ad.46.1752172980662;
        Thu, 10 Jul 2025 11:43:00 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:a219])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de42ae9dfsm26936225ad.73.2025.07.10.11.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 11:43:00 -0700 (PDT)
Date: Thu, 10 Jul 2025 11:43:00 -0700 (PDT)
X-Google-Original-Date: Thu, 10 Jul 2025 11:42:57 PDT (-0700)
Subject: Re: [PATCH] riscv: Stop considering R_RISCV_NONE as bad relocations
In-Reply-To: <20250710-dev-alex-riscv_none_bad_relocs_v1-v1-1-758f2fcc6e75@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com, Nelson Chu <nelson@rivosinc.com>
Message-ID: <mhng-7CDAD4A1-707B-4ACE-BAF0-643C281B9AD7@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_114303_349551_AD86A80A 
X-CRM114-Status: GOOD (  16.49  )
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

On Thu, 10 Jul 2025 01:34:31 PDT (-0700), alexghiti@rivosinc.com wrote:
> Even though those relocations should not be present in the final
> vmlinux, there are a lot of them. And since those relocations are
> considered "bad", they flood the compilation output which may hide some
> legitimate bad relocations.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/tools/relocs_check.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/tools/relocs_check.sh b/arch/riscv/tools/relocs_check.sh
> index baeb2e7b2290558d696afbc5429d6a3c69ae49e1..742993e6a8cba72c657dd2f8f5dabc4c415e84bd 100755
> --- a/arch/riscv/tools/relocs_check.sh
> +++ b/arch/riscv/tools/relocs_check.sh
> @@ -14,7 +14,9 @@ bad_relocs=$(
>  ${srctree}/scripts/relocs_check.sh "$@" |
>  	# These relocations are okay
>  	#	R_RISCV_RELATIVE
> -	grep -F -w -v 'R_RISCV_RELATIVE'
> +	#	R_RISCV_NONE
> +	grep -F -w -v 'R_RISCV_RELATIVE
> +R_RISCV_NONE'
>  )

I'm not super opposed to it, but is there a way to just warn once or 
something?  It's probably best to still report something, as there's 
likely some sort of toolchain issue here.

Also: if you can reproduce it, Nelson can probably fix it.  I'm CCing 
him.

>
>  if [ -z "$bad_relocs" ]; then

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
