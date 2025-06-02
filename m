Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC29C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q5q8QPAJnR1eZGL4vXl/xkv235LwRHAHaztHjNGgy8=; b=AsnzkwW6mgQdCm
	jRL6fTlvdUI1j53qHqdOt2dLuxh4vloibg9oK9AyOWcJlL43ZGZcau9dE3RhbOgRN1BFjhn3sqDCh
	aHSsfS+9dVrbTtsHBFhHUUKM1dmMaLD3+Mv0aKZvqFAQeJxGCh6bq2peDZ2KmMA6L0gyZ5PyrfEf/
	wmTsGH6iPmEO4PFVe/rZk/qOrlFMBfrbx9YoT60jZ32mrj45S/Uey82fY3Ihc7puaiAUeJT+zc747
	eMaO8yWT0rcfcr3+/skFZc0B/5FUACcCKPigCAVP+Hvrzv3Z2sKpUgjwK6zGwMArs1gFVvfljpm3x
	MnVesmYnRXEgEmyqf0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMCAV-00000008raH-0997;
	Mon, 02 Jun 2025 20:54:03 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMCAS-00000008rZO-1euU
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 20:54:01 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so5248449a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 13:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748897639; x=1749502439; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hweO6tmk9XCIs8J63FaekelILSkYnStY5cMnlCZXw2o=;
        b=y10UFNwS1gkvILh5lxo6v/X6JMfkh2Vaax+x15DO/a8tFrexOxKVJkN/SN9DqI3j6q
         5SW4KD0YPc+tkcV04H7fQz1NtnwTdfZUCeCCRfC1YPcxx2Dnk0JOmtVj8M4wKkPzr8OB
         iTK0N5tpVQfb5nBdtdJsiim7J+OE4B4O0z4QA4djYh+tMw5RfuEmBAZnU52HvNEr7TwV
         6rxyW7rxOchSfFCfgSTkWc0vPKFbQPkgk5qgkI5uO4GIvdXZbgivvDuRIQ8TWrZL9ff+
         X4zLz3iq7ceM+ACDTwuemxUtTEcKwEIkmWvQ0UApdkyvHgfo7FHxhLIYZgN/F0j0O5s3
         LnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748897639; x=1749502439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hweO6tmk9XCIs8J63FaekelILSkYnStY5cMnlCZXw2o=;
        b=LU7OzJH5HLv3sCDnZmKvu+tcgj+KXNP+23cPW0MQL826lflK2+QDYteQO7wqEC2jpz
         EcbKAWNe8iPtzMo87qgK/FtorN2NDA5o+OdJSIadrdWFAkjeJTXLBmn5eeg3QhIjH78+
         RUBsNkgFDN/wDK4LDSjcw/HJBDy8de4U52QPTKGezXgaORqFNSepat3kGCYdsvDbJhxk
         vXigBHBp02gu1VLMhZfr3RPEKK0G1HKl52Tv92DTRWk3Go0Twu3RP+OY4f8QF/HsXva3
         Ji/GkGv5ZDcr6PbaiL1uNGspy92zbvhhfa8aOnMZBxof/7FyOce3zwKvaC8Oh8XHBCtA
         jxPg==
X-Forwarded-Encrypted: i=1; AJvYcCVl0RtrZmrjqNvsoUQ9EjCEXhAZvv4tc8/30nCPU9dXQr3rlYMxBLnBqcg5YH3i6ChhOckWPagOqFN8WQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYwJZSIrSTKI5wkFdK5InZmE3OUqMsq/hxbosD1uiCZVn0RgUZ
	ujMTB9rwgBHfCT58S16XDpQ7JSVVV/35+QcM3cH7bBIO6/hE95YsUw7FLh+ogGPwPaQ=
X-Gm-Gg: ASbGncs9q5G1ZHGrQgShPrHhJtHb1e79PrDnpW7+CBGHBOB1CZ6XBROQeaxwlQHlBU8
	BXiirYp+LMQ4PL/T+vhE4Jzt0fP7D/MS9SKC+pEzQy+ZDnVQGyerOu7EvWr56gh8nj6nXNPjiXv
	1nUzd1xijaoUsXTydJzqQW07kHL0LMgH5jQmCvAUd6Db2MoohgjovTJRFE66Sl5qA49LFqibgXJ
	Oxxdm658x1rh47E6lAwlg2F+UA0hlRA68RlXdTqRLS/xUPFLKrfimtE4cagdvXYfsy7D6S370UQ
	CvavJtDlCG1VxwKptBSx2Cs8nhsJ4DfIOt8nWFPX3B+erQY=
X-Google-Smtp-Source: AGHT+IGOKGYMi71C1WdDvSFZiiPsMZwi3ra5fDpgeX9iy2Xl0DNGuAzsi7Is4p4NcEg1vfx34vd9Rw==
X-Received: by 2002:a17:90b:35ca:b0:311:b07f:1b86 with SMTP id 98e67ed59e1d1-3127c852665mr16301929a91.29.1748897639572;
        Mon, 02 Jun 2025 13:53:59 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:3831:e87c:eedb:3ff2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e399b3bsm5998010a91.31.2025.06.02.13.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 13:53:59 -0700 (PDT)
Date: Mon, 2 Jun 2025 13:53:57 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 1/1] riscv: fix runtime constant support for nommu
 kernels
Message-ID: <aD4PZdg0pghM1Nil@ghost>
References: <20250530211422.784415-1-cmirabil@redhat.com>
 <20250530211422.784415-2-cmirabil@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530211422.784415-2-cmirabil@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_135400_434588_374D21A5 
X-CRM114-Status: GOOD (  24.75  )
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

On Fri, May 30, 2025 at 05:14:22PM -0400, Charles Mirabile wrote:
> the `__runtime_fixup_32` function does not handle the case where `val` is
> zero correctly (as might occur when patching a nommu kernel and referring
> to a physical address below the 4GiB boundary whose upper 32 bits are all
> zero) because nothing in the existing logic prevents the code from taking
> the `else` branch of both nop-checks and emitting two `nop` instructions.
> 
> This leaves random garbage in the register that is supposed to receive the
> upper 32 bits of the pointer instead of zero that when combined with the
> value for the lower 32 bits yields an invalid pointer and causes a kernel
> panic when that pointer is eventually accessed.
> 
> The author clearly considered the fact that if the `lui` is converted into
> a `nop` that the second instruction needs to be adjusted to become an `li`
> instead of an `addi`, hence introducing the `addi_insn_mask` variable, but
> didn't follow that logic through fully to the case where the `else` branch
> executes. To fix it just adjust the logic to ensure that the second `else`
> branch is not taken if the first instruction will be patched to a `nop`.
> 
> Fixes: a44fb5722199 ("riscv: Add runtime constant support")
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/include/asm/runtime-const.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index 451fd76b8811..d766e2b9e6df 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -206,7 +206,7 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
>  		addi_insn_mask &= 0x07fff;
>  	}
>  
> -	if (lower_immediate & 0x00000fff) {
> +	if (lower_immediate & 0x00000fff || lui_insn == RISCV_INSN_NOP4) {
>  		/* replace upper 12 bits of addi with lower 12 bits of val */
>  		addi_insn &= addi_insn_mask;
>  		addi_insn |= (lower_immediate & 0x00000fff) << 20;
> -- 
> 2.49.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
