Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B6EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 22:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peGuAq8BXAm0KEvQxg3kcAXNqvyaPf1c3sOTYtLWw3M=; b=XYHUTjkApOs/Rl
	gHPpteok6fOEcC0wHN57TTeZ0uuu5lJ7p8+UJNycPKB8UwIuvNjLa06FYXzoXxkjYhY6BP+WixqvH
	jIR5nkYkGYgNi4BgRNaBSc3tp/gVRTwMrr8Gau1EZjzEBhbplt0QY6dE+rNshaOIRRMRkYl8TMpVY
	fivBsI8Zu4NGb7WPvLm0cGItLXaQWxVFO7vDdq/aBVrxs7fv+Ib+/WU0qnU8otoFqAr6AudEZnyvS
	/g/WAlSInw53E/tyz0+2AfmSZFSqJWBoz5TunqoBnCj+tD+Xtg3lSekTAsNTpQCu5bALxXZlal03V
	FvC/52Mn9m0SmlXUl/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGJv-00An6L-Hz; Thu, 10 Nov 2022 22:46:51 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGJr-00An4W-N8
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 22:46:49 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q71so2937046pgq.8
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 14:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HQDpPym5LjtymWxLp9cUJ2V2mQCjf8ma1sxDeE3Trs=;
        b=4OVUeR2TK6kWC2W5gQrF/BlbpmApyFxOIyfASWXy/mRnhwY6WACExnL/RULtvMHmhe
         C8fGSRkbItiDjQ8hVxrOJAUjyIV9xkxtMqjVzhxKALVXd78L2XmkjRJaSQ6/KaXgd2in
         RrQMuyzZhqK16eo7uIywZbvcPNos8I658qoFY3EbmR+soPcjKYd9aO/IvGemRrwPd9hz
         ckiSEIZEWJQSkF4mAimRjRnVoOIvtnHn1YNGa5Seemn+U4SdpDYGdPQqqEI4JFopF8BA
         F2QwkNRxECouBslnr+PswF65YjcizTLqA6wgcr+rzHC1V9MsicfDO37acZq+CpwEH9wz
         EBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HQDpPym5LjtymWxLp9cUJ2V2mQCjf8ma1sxDeE3Trs=;
        b=KriozyU1gR1K75bmol12TaKvyJJGY8IYrHLV3tJ5Exgl6jxynRYgbP46V9lldibAqY
         a7UKjh0QaQsrHBSB98wlqhWowj0a2HfoefxKaVyojTpBEbRSWg6X6hLFnPswzeG4z2R4
         opHITc+eyanhLplNG6PvbV4YTG24CO4ig50+boGyhe+IuwvF/KedXX8zzh+Wl4tYo1cO
         ge09bfWvmr1PUjYIkJtKLB+/sNAGUctUCbXxqEKBoo4Kg8AF7viQ5l7T2PUXk54gW+NG
         KquzvNNOAJmmStr8c+ygwy6r7uhyANboNFGklEO5sP/YLuVvksQL0FPxUtfLykp3kmUx
         aNGQ==
X-Gm-Message-State: ACrzQf2+Sgnd8rsJAZQdfRZGzAwa/uOin6o7OTocv5sp+vA0iI+FRxy9
	sI6zHwzC0+fsl1Mc3kuh58J6E9I2d5Fw2g==
X-Google-Smtp-Source: AMsMyM6wdg+8KRdSAaiwO14Vxuxd+vx0l/jvivNeeD4ncPgJBLu1u77/UQZ2qL00jLHDi1FK6zWo0w==
X-Received: by 2002:a63:6d49:0:b0:43c:4eef:bac7 with SMTP id i70-20020a636d49000000b0043c4eefbac7mr3654048pgc.356.1668120406609;
        Thu, 10 Nov 2022 14:46:46 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090a454a00b00214247ac1acsm3571235pjm.12.2022.11.10.14.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 14:46:46 -0800 (PST)
In-Reply-To: <20221031182943.2453-1-jszhang@kernel.org>
References: <20221031182943.2453-1-jszhang@kernel.org>
Subject: Re: [PATCH] riscv: vdso: fix build with llvm
Message-Id: <166812034329.20280.6345239431217056884.b4-ty@rivosinc.com>
Date: Thu, 10 Nov 2022 14:45:43 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
  Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_144647_768910_45AD1409 
X-CRM114-Status: UNSURE (   6.59  )
X-CRM114-Notice: Please train this message.
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

On Tue, 1 Nov 2022 02:29:43 +0800, Jisheng Zhang wrote:
> Even after commit 89fd4a1df829 ("riscv: jump_label: mark arguments as
> const to satisfy asm constraints"), building with CC_OPTIMIZE_FOR_SIZE
> + LLVM=1 can reproduce below build error:
> 
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> In file included from <built-in>:4:
> In file included from lib/vdso/gettimeofday.c:5:
> In file included from include/vdso/datapage.h:17:
> In file included from
> include/vdso/processor.h:10:
> In file included from
> arch/riscv/include/asm/vdso/processor.h:7:
> In file included from
> include/linux/jump_label.h:112:
> arch/riscv/include/asm/jump_label.h:42:3: error:
> invalid operand fo
> r inline asm constraint 'i'
>                 "       .option push                            \n\t"
>                 ^
> 1 error generated.
> 
> [...]

Applied, thanks!

[1/1] riscv: vdso: fix build with llvm
      https://git.kernel.org/palmer/c/50f4dd657a0f

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
