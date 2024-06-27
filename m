Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE34C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 11:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCv0oGGm4uYIfB/fS/6dGoXpvQZeYhH3DkTOYW7FJJU=; b=bIYqRaegvYYBRg
	sgzp+e82BZVvpxO3kV9Zn0lYLVwXN9YfyrqheFxIMJoXJdetargW++2wR+Hd6p0H8aNAFSrPAiUqb
	noyPzwFDWUOceLAd2jC5zdVAbpDvO7r/z6ta67eZeXgrpWemK2IOiFn0cUYeoD0SxRdwtisPr8OYk
	G8gRH5u7Kg0jIEsfcuAXsPzVNS+2gedMrIvdwinBmu9evhbbPV1ABs0uqeD58ewFy7nDxG8Own9d6
	BBCAP9UqHkApS/DAkaRWTRyE3VbuJu6ZSBvvwhPIQ9UL8y2/Eg1X3p2EWXke1G4upaEP25v/FV/pv
	GRbAT0sHEX6VHYLHdwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnhV-0000000AE4H-3JP5;
	Thu, 27 Jun 2024 11:54:06 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnh0-0000000ADyv-2fxc
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 11:53:57 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee83so1675417a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719489213; x=1720094013; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jcNyZGznc5fPRIAycn+yX2TaeomztoG0VIVAkH7fqvg=;
        b=hizI1/rP07zwslwg3y/5Xow7ZES3uWjw2a+FFETd0BKZT42YJEXg5ig6NR9h6otXD/
         1QQyXWKW7xmEpPcuY/tf6CmJAf8/DwAbIxarRG2viCFdXvrVMqKr4GFMeYLeXdyT2ML0
         bGAFF41LVIcNLKsH610y3r/Re3G3eYMIFyuYdoZ7LCMo6km8sIU09TFKBO7Dqh/AE/sW
         js0tclls74AHhRboH2BvTDonnthLT5h2e8Mol5sYEhKZsMdSJTs7JrCGZz0QkMVc0co+
         z3tKzjwlSl/25u7KZSacDztYh4m8cfC6pcOTUQR/GSJXrTRs1UnafV/uV04hQwvjYtRj
         VlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489213; x=1720094013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcNyZGznc5fPRIAycn+yX2TaeomztoG0VIVAkH7fqvg=;
        b=RPy3nZUjTLQ2KTTWRjc4t4Umf+5pHDG5TkeTfFiOoRMDwcijfMACams6kmuSadFfR4
         N3aH7gPjmi8ASRjNPE8+G0uMYhLV6G6yffL7/ciQuMe5X4hQdYVBOrANBA0qC0RHUHBs
         xlWZvfN3k/8x6aqA26ZBXo4d1XVFnEM0/7kQ+LUG+Xs7rDLvC7veUxDEGDFM7i4KQPG/
         ILwluwTvLm/49XAOOf0A6/f74pG6pxzMgUPddnOEgvMBWM29TmpguATyNQUZYmOiOUU3
         eIvDjsxmnavqzD5JYNrbJW2SdZgdiytvZUrZPZrmkgjjUbjomL+lsUCkfaQPgY++ji+X
         skPw==
X-Forwarded-Encrypted: i=1; AJvYcCXlOD277mInQg9pgGM8ssa8tXdG/qVIeoMVZ1ueDKi0FUniXG97nWlKhA+SQ3X71fZGE1NY2ghaL1qtE+RCNRnujXs5YpdXsRkJ8o3VnjlL
X-Gm-Message-State: AOJu0YxDfvTeylbx60uT3CwwdgALg1omtWossQw02luHG0BSJb0fQAXC
	S8hcdzcSCAO/8FdJlmS0bixFHDo931K4d+iKs7ME4N1yZSn3l6zM
X-Google-Smtp-Source: AGHT+IGLItRQBo55yU3VI7Wivwhx6v+M1XTrEZj2isMxyFDWUA2A65q19H3IxMSRCHBj2w2WgDoQVA==
X-Received: by 2002:a17:906:230d:b0:a6f:50ae:e0a with SMTP id a640c23a62f3a-a715f978a7amr818590366b.37.1719489212385;
        Thu, 27 Jun 2024 04:53:32 -0700 (PDT)
Received: from andrea ([217.201.220.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d71f1cfsm52522666b.72.2024.06.27.04.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:53:31 -0700 (PDT)
Date: Thu, 27 Jun 2024 13:53:25 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 03/10] riscv: Implement cmpxchg8/16() using Zabha
Message-ID: <Zn1StcN3H0r/eHjh@andrea>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626130347.520750-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_045336_130880_5148A350 
X-CRM114-Status: GOOD (  12.74  )
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

> -#define __arch_cmpxchg_masked(sc_sfx, prepend, append, r, p, o, n)	\
> +#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
>  ({									\
> +	__label__ no_zacas, zabha, end;					\
> +									\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
> +		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
> +				     RISCV_ISA_EXT_ZACAS, 1)		\
> +			 : : : : no_zacas);				\
> +		asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,		\
> +				     RISCV_ISA_EXT_ZABHA, 1)		\
> +			 : : : : zabha);				\
> +	}								\
> +									\
> +no_zacas:;								\
>  	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
>  	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
>  	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
> @@ -133,6 +145,19 @@
>  		: "memory");						\
>  									\
>  	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
> +	goto end;							\
> +									\
> +zabha:									\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
> +		__asm__ __volatile__ (					\
> +			prepend						\
> +			"	amocas" cas_sfx " %0, %z2, %1\n"	\
> +			append						\
> +			: "+&r" (r), "+A" (*(p))			\
> +			: "rJ" (n)					\
> +			: "memory");					\
> +	}								\
> +end:;									\
>  })

I admit that I found this all quite difficult to read; IIUC, this is
missing an IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) check.  How about adding
such a check under the zabha: label (replacing/in place of the second
IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) check) and moving the corresponding
asm goto statement there, perhaps as follows? (on top of this patch)

Also, the patch presents the first occurrence of RISCV_ISA_EXT_ZABHA;
perhaps worth moving the hwcap/cpufeature changes from patch #6 here?

  Andrea

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index b9a3fdcec919..3c913afec150 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -110,15 +110,12 @@
 	__label__ no_zacas, zabha, end;					\
 									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
-		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
-				     RISCV_ISA_EXT_ZACAS, 1)		\
-			 : : : : no_zacas);				\
 		asm goto(ALTERNATIVE("nop", "j %[zabha]", 0,		\
 				     RISCV_ISA_EXT_ZABHA, 1)		\
 			 : : : : zabha);				\
 	}								\
 									\
-no_zacas:;								\
+no_zacas:								\
 	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
 	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
 	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
@@ -148,16 +145,20 @@ no_zacas:;								\
 	goto end;							\
 									\
 zabha:									\
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
-		__asm__ __volatile__ (					\
-			prepend						\
-			"	amocas" cas_sfx " %0, %z2, %1\n"	\
-			append						\
-			: "+&r" (r), "+A" (*(p))			\
-			: "rJ" (n)					\
-			: "memory");					\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZAZAS)) {			\
+		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
+				     RISCV_ISA_EXT_ZACAS, 1)		\
+			 : : : : no_zacas);				\
 	}								\
-end:;									\
+									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amocas" cas_sfx " %0, %z2, %1\n"		\
+		append							\
+		: "+&r" (r), "+A" (*(p))				\
+		: "rJ" (n)						\
+		: "memory");						\
+end:									\
 })
 
 #define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
