Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AECAC7EE24
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 18:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S16v029CR0GmDCKh5ChdLpU0ivVTDDFLdm5rTZ3Gt/c=; b=0mwsZyME7fTvxl
	/LLXFW4TBqJ8soOA4kf3fSA1A0Zal3KnW/t6FQoAWjeVkG7U6ZLbbLTW5tNtGJ+qL1Ty/SNOQQ9kB
	o0SO7GxQThFA9RydAH+gwM4/W22gOeMyvrIOs/69Ri/KNN+c0BSSD9Qm0Xtkh40+xgOXzQ4t5zknE
	tmZ7Y4uk74co0Y2e9twy5mONoOG0ZT6EpLI6S9p7cqk5leB+xLEMVGSzWMHMKfv4Kz0xTB0P7SCJ7
	433ZhNtjLh0uFbp3jIRBg2zMp2lJGdg9VotJROm6LwFsjHKKJNVW4OIffTxfY+TWe6MBoemm71ioP
	13DHwpAo8e7dOOdg6GnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwotS-006mrh-2p;
	Wed, 10 May 2023 18:50:30 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwotO-006mqQ-1B
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 18:50:28 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64384c6797eso6219976b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 11:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683744624; x=1686336624;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F76UK+CxAhg4hqyTNocO7OCTW+IWsVT57luco8VSSm8=;
        b=3EYfHC/B/4fOE5EWwcqj9yAlBmPc1JO7qTwY9urGNzT+EbObCV/IHCD+Ta1EAeOdTy
         FgCx55rYjxcmo/xLfofTSK/D9D16MeqSF5NghXCpvhggVu6TX0wYMT19wycl54laJ+HO
         QUEtz7559EQmUyeY0WtLvvLwvtRjxaFkIj9wdT3j+MVEF1lqE8/Q3pU7i1tyIYeKnVbT
         0A0RxC+/gjLE4r/uRtzjS+KmLAhSzQjj86UZZnmOjSim4PqMAyQGKYQ8LYl3i/t1LixR
         1K79zcvG8L/tvdhcfXTBuNFHrgoyZaFLATCEVQBmK4KepL89vILcAptuuVnrAhKfjTaT
         4ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683744624; x=1686336624;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F76UK+CxAhg4hqyTNocO7OCTW+IWsVT57luco8VSSm8=;
        b=RwtuqbBBwh05LdK9TaIYTwYdcnnlSEVyh9orDyWQLDgX4jDit8cR//GRcLEcqdaEBh
         uzSyrLubjtn4JspXUZMKmk/upRCNIBJ+1Yc1xuD5N7NpmkAFAPr+GpbLVEHwUCT3tg81
         1np4Ecuw+F8f7FneJfMMW0UPw4dP2tqRFJ++u2j4w+qDEo7yEB+utNyMMjm8PrrJ+Dij
         FqM3mqr0vcX0myYzVxy9P+jjcSXtWUyutLtS5D5zPqugXjbtREb7Jna2u7lT2FgP9Drf
         6bCfQurvxgu6D9EZfOWffl9Iyzig4lriDkOwR8hGiARF6VsM4iJafjWgqV139GHU4uaq
         6+Xw==
X-Gm-Message-State: AC+VfDzU5Om8lSECU2kX4gCmAwdXBdNlfH0qkAn6gdmAKe0NY7qUAQpY
	032B8OxipTdeYOWxDu/PRxXquA==
X-Google-Smtp-Source: ACHHUZ4ArfIWAEgW34cKol+jrrXEu44mmiUN+5Nlg6BKulKz67xIwfTUPl7C6F3SfhSI3TlXQQtGTw==
X-Received: by 2002:a05:6a20:160e:b0:101:1008:6b84 with SMTP id l14-20020a056a20160e00b0010110086b84mr11772796pzj.8.1683744624180;
        Wed, 10 May 2023 11:50:24 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id mh16-20020a17090b4ad000b00250c753b889sm2290138pjb.23.2023.05.10.11.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 11:50:23 -0700 (PDT)
In-Reply-To: <20230504120759.18730-1-alexghiti@rivosinc.com>
References: <20230504120759.18730-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH -fixes] riscv: Fix orphan section warnings caused by
 kernel/pi
Message-Id: <168374440137.14554.1070324077162510128.b4-ty@rivosinc.com>
Date: Wed, 10 May 2023 11:46:41 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, =C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_115026_620343_E0634336 
X-CRM114-Status: GOOD (  10.40  )
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


On Thu, 04 May 2023 14:07:59 +0200, Alexandre Ghiti wrote:
> kernel/pi gives rise to a lot of new sections that end up orphans: the
> first attempt to fix that tried to enumerate them all in the linker
> script, but kernel test robot with a random config keeps finding more of
> them.
> 
> So prefix all those sections with .init.pi instead of only .init in
> order to be able to easily catch them all in the linker script.
> 
> [...]

Applied, thanks!

[1/1] riscv: Fix orphan section warnings caused by kernel/pi
      https://git.kernel.org/palmer/c/3b90b09af5be

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
