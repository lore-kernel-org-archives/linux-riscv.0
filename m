Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945EEC6FA99
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 03:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDN5u1ddPLxapcwbF6N18DfrMGzot8cmYB0HuqVKMA8=; b=zNaCA2q1iSc4iP
	+2syv4T1HJsSfhLY83WA9edHgXaBoCRxXCIpPgtiqLB/yhrpItEGiNuAHrrJWUpEBNTK4/kan5fLa
	JQahBtwy0n8E8HTMThYxETMLdZ0niaTboeNGMkpi4i20GMGNWss5xc08JAmBOhAn2TXTD2wExN0gM
	btqyS/PzD4nDDomkcQuiEhOszvP/ntuhrhPzj0nzXiJpoW35Uoo5x0iQDuOFWig4FGkOi+jnyjqR5
	xWfwUDuTyP6HMo3ZOkv4r6olOwwqISzTFtMmHdviBxtaXWvNpzvm2fw3jTDmewLr8XukFh5DiSlmG
	VB78yav3qBiisDN8Fiow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkVb-003JUl-Lm; Wed, 08 Mar 2023 03:30:31 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkVY-003JSB-FE
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 03:30:29 +0000
Received: by mail-pg1-x534.google.com with SMTP id z10so8876191pgr.8
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 19:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678246225;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrGumBD3CuL7JhmpbkRoYLuQ9iRztdyj8h7PwNT0G+k=;
        b=nMEKpiB7FONecJfzkjebJwCPpi28Dj2XGpP4GXKQ26ESvbaACwC342Din9Ax1xxY5L
         wbOddRCSnmwOYMksQw3Qdu5mRfQureAx5/i/16NCIUODZpYPqRkiko+kmKKPlNGUXiEA
         aXYE5iDy1t1/dC5gzdd2qFFMC2Lsk2FIHb4DgjPfQlZUyXgTvmE5yxVkScVuFdMXQ8N/
         9PY7FQJCGGsTo0VGTQrba5VHI8TNPXOxIBhzPzY2mCeDhoalLaOSxSq41Fd1BV+9Keyz
         gR3qvdUJN5o2gNrh+SlnHyTyO3n8fbOGKSIRdfzol8xhkDct4RQZ0bUznxP61irRCIEl
         RvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678246225;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrGumBD3CuL7JhmpbkRoYLuQ9iRztdyj8h7PwNT0G+k=;
        b=1A+3bbv5mWD+XguqA+2VrRsR1aO7sEypi6QruPCYpgJS43GIkIYL/05YLnB58TMzF9
         dZrt8g1K12IxMokpXMrc1Px4Pqn0q1imJ0Y+oTrM84cJYrin0atG0Pv3coUlhx0hfZIa
         kkNE3qyJH5DjDhMdt/RakT8zs5xDY7L8EoKhZ192nlYF94JtALWOyBzbAHODkVwTpWyK
         MXQ2g/OFeI7zWU+YFUFgeIMi4ECHbGWB1o2yebqPhe3fYNVzMlN1JCSk7qPg/uDueAPm
         8m+vsz81UzdzhlxWHOAo57gjlRFiXXQu+d2fBpL1f/IrdgohLWlxEWGOZXJNEPPEG7QA
         x2dQ==
X-Gm-Message-State: AO0yUKVaHKoP3WV3WGYSWpgtgPbqktTiW5K39foTRTgPpcZqIJoKttof
	wh/aJf/H8mpoDztVlDDb7re4fQ==
X-Google-Smtp-Source: AK7set8hzVBuskesB4GYntZLwYi23Uwo1MfEphVfa6NFwFtmeKv9GeZ8e6GgiHrVvGj/l+Hl+mwyWQ==
X-Received: by 2002:a62:1758:0:b0:593:d2ab:fdfb with SMTP id 85-20020a621758000000b00593d2abfdfbmr13432662pfx.13.1678246225092;
        Tue, 07 Mar 2023 19:30:25 -0800 (PST)
Received: from localhost ([135.180.224.71])
        by smtp.gmail.com with ESMTPSA id n13-20020aa7904d000000b0058b927b9653sm8771578pfo.92.2023.03.07.19.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 19:30:24 -0800 (PST)
In-Reply-To: <20230203075232.274282-1-alexghiti@rivosinc.com>
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 0/6] RISC-V kasan rework
Message-Id: <167824615129.30763.10646446884793553712.b4-ty@rivosinc.com>
Date: Tue, 07 Mar 2023 19:29:11 -0800
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Andrey Konovalov <andreyknvl@gmail.com>,
  Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-efi@vger.kernel.org, kasan-dev@googlegroups.com,
  Paul Walmsley <paul.walmsley@sifive.com>, Alexander Potapenko <glider@google.com>,
  Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
  linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Dmitry Vyukov <dvyukov@google.com>,
  Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_193028_542453_7C78EAB8 
X-CRM114-Status: GOOD (  10.69  )
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


On Fri, 3 Feb 2023 08:52:26 +0100, Alexandre Ghiti wrote:
> As described in patch 2, our current kasan implementation is intricate,
> so I tried to simplify the implementation and mimic what arm64/x86 are
> doing.
> 
> In addition it fixes UEFI bootflow with a kasan kernel and kasan inline
> instrumentation: all kasan configurations were tested on a large ubuntu
> kernel with success with KASAN_KUNIT_TEST and KASAN_MODULE_TEST.
> 
> [...]

Applied, thanks!

[1/6] riscv: Split early and final KASAN population functions
      https://git.kernel.org/palmer/c/70a3bb1e1fd9
[2/6] riscv: Rework kasan population functions
      https://git.kernel.org/palmer/c/fec8e4f66e4d
[3/6] riscv: Move DTB_EARLY_BASE_VA to the kernel address space
      https://git.kernel.org/palmer/c/1cdf594686a3
[4/6] riscv: Fix EFI stub usage of KASAN instrumented strcmp function
      https://git.kernel.org/palmer/c/415e9a115124
[5/6] riscv: Fix ptdump when KASAN is enabled
      https://git.kernel.org/palmer/c/fe0c8624d20d
[6/6] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
      https://git.kernel.org/palmer/c/4cdc06c5c741

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
