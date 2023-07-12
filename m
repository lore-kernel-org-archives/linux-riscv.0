Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A27CEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 13:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYDtveHGibHHjoBKrnPeTPtLR1HSRvNYKoXP3Hd+Jks=; b=vXd55TaAUM9nEb
	OpxnvnYXp39qBoPmVU1ec/JUiwSg9123WleIsMMlpyAuG9TPK092EOCJmLKx87BtsY075gs0VcSaZ
	iJHTQPh5Eupro5NZ9i4zm+jO+9UU2tZ2bKZ0wTYfA8AvDqNBBGx5kxlMbMbS1kNRrW2o7O707Qxk2
	eWBf14XZ9/cO1YMDF3SLaSl6LIlnQUNVZ+f/c2rtGeMgz+CDdR2qr8Dz08OEF/AgprsUwFyc5NM6w
	+8YD89xW7UWfXzsT5dK1wyxTKWJgT8C+1hIkPUH8KFhZ6M2E5g36OFTuEfFUwQUlqEY1cR/XtE+BN
	g6+9SvyJYLEjS7diIO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJa5V-0005cw-0T;
	Wed, 12 Jul 2023 13:41:01 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJa5R-0005bC-1j
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 13:40:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-66869feb7d1so3901351b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689169254; x=1691761254;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Kqh6fNIY9AJljwrK0e2rNLKBwfhh3ijZgx+ok+fnrI=;
        b=5EEoH9hI3BRpj2k/wZBtzWVgxdQWeCG9MGqEeequWdxBEGrdLj7Fvi2FV7Ph5MuL1s
         x0rQUYf/MUXN4WMG2g9ORlwQpo8h4oK3qBQdyBdGbLd+rL77EqH6G27LcOaHq6E2+g+z
         17McHVpC5lE5vi7aWaxmfSYNman4xCnTDNf22eM1cbCpTik9xPLD54dLEgJs7IyO0t2z
         F/WPkuK8g7m0eAHx6yMATB46qdro5jRbxjAfonFDv9uRNgHq2ln+nxze86OMLdIgAghl
         nZUv6OPqsbrt6t9CPga55Jes0G+j8o9vxSJVOvisc9CGq4FfmI9tDOQXq0/zRyiXQtLt
         61Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689169254; x=1691761254;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Kqh6fNIY9AJljwrK0e2rNLKBwfhh3ijZgx+ok+fnrI=;
        b=glBv/egCPbPhYprPv6kNNt9Bh6jDzerPVqjLfbgSF1oTqdq9DnzdRBy5+sN2RweiHg
         j4VhtH/mYG1WYfs7HPOLiV98s0YbHMWiEwn3oqVazoXJhUezoziyWG/gbqBlMunpahai
         6RW/VznOXm3dNgSDwtEqLcqvuU39VEKaELMlQ4yezr1NIB30pd3nG8dFnOFw4PSD/OGy
         p9zPSvrkkHYxo/5xFekShrtaGjZUUq+6xWel/6owf7H9np+c76anV3zkWj2VGBl6FLZ7
         y1etWNHU7VhJfT2fE48CE9SXVYJuPSKJWrehtHAAZ5OhwVXRUTYa9z4wRsgQcKSmYb4t
         Km3Q==
X-Gm-Message-State: ABy/qLZs/39E5hG/TjSqmcVtW8OmUj9+HjWtnKtte/e+fVaNCtEAGeec
	3HQCsDi9N2dOmDW/ykv1IN/hfw==
X-Google-Smtp-Source: APBJJlHhCR4FyKSMod5bL33rCVPPYzjI//x+UGhJ4p+/Acc0Ye58uNfbCQ5C1waGuZMXeHcsBSwFVw==
X-Received: by 2002:aa7:88c1:0:b0:682:f529:6d69 with SMTP id k1-20020aa788c1000000b00682f5296d69mr10775524pff.7.1689169254368;
        Wed, 12 Jul 2023 06:40:54 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id c24-20020a62e818000000b0067aea93af40sm3648425pfi.2.2023.07.12.06.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 06:40:53 -0700 (PDT)
In-Reply-To: <20230628091213.2908149-1-guoren@kernel.org>
References: <20230628091213.2908149-1-guoren@kernel.org>
Subject: Re: [PATCH] riscv: sigcontext: Correct the comment of sigreturn
Message-Id: <168916917326.11308.11157139765378457247.b4-ty@rivosinc.com>
Date: Wed, 12 Jul 2023 06:39:33 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_064057_570959_D36F93FE 
X-CRM114-Status: UNSURE (   7.83  )
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


On Wed, 28 Jun 2023 05:12:13 -0400, guoren@kernel.org wrote:
> The real-time signals enlarged the sigset_t type, and most architectures
> have changed to using rt_sigreturn as the only way. The riscv is one of
> them, and there is no sys_sigreturn in it. Only some old architecture
> preserved sys_sigreturn as part of the historical burden.
> 
> 

Applied, thanks!

[1/1] riscv: sigcontext: Correct the comment of sigreturn
      https://git.kernel.org/palmer/c/471aba2e4760

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
