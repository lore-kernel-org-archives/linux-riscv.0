Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029CDEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duMyjR/CMFqKmjPdIadXvFw4kUzJfE4+1Wji4Zp4i8A=; b=c9xk8JySjX2nAD
	QQYqAW+UsoBj7Y8N2+HcFQoY+0CV0dbt9H8eKPRFFqEIYwfCvxcx7d6ub55KvMId8abqenE6UbyTE
	Vwn85mrFOU9Q/sxvo5mTsd2SiyIhbwJwloNrlz228cV3l+AIdNTSh9oI+DzniZG/cNHTFD9EFajfp
	laORZBmhbufhTNxBn8Auky8mJu5jZS87de2Txu3FLrY37LUUCIx0le2upwQrpZ9WT9+Bq+bsqPHK8
	RD6k0vrdhAgLiVhUuXnUY53Y6ufESfZiiaq3buRmnw/DfHZ+DpFOxYfYt06oFXBEiEBhBVozVoDbI
	xZ8vtaylLc7mF3gRinfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC71-00HN5O-0M;
	Wed, 05 Jul 2023 23:40:43 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC6x-00HN3e-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:40:41 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666eb03457cso144208b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 16:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688600437; x=1691192437;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgsF/Yozlpx3nfM2SL9w4rDMvY31abGjUNz6r4TG+KE=;
        b=Vu7pF9XZzc3t1Mny/o3ibzdUICpJIdLiz/1zifUzyS1IbXBy114fxvGLlttLILcMXn
         HYHRSSwlhZkKYB6szm0+/jcf1mMkZRez5mBWKw6fbGpDo2jcs6ewq/vWjvLbsOk4+qSq
         W4OGwrD8wsO3Evup8IT5yzukcj1W0A21XAXbtZB7K/Q9XK3g4lSz796vmUkuxOg8BlWS
         SHHE12DBZdhJk/UONAi0tGHrGTW+YQzwPrZGJVq5gJLa7jGS/Rlz/NyTgY5CxMOVYme6
         6vNDxB78/Bj4CEK8clvHalQqvlJTTMi8nKr0zQXLBHLxtc4AkP4rZ3/q3S4UpJgJfAnX
         zHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688600437; x=1691192437;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgsF/Yozlpx3nfM2SL9w4rDMvY31abGjUNz6r4TG+KE=;
        b=iPZBiza7wwGtB3jgb71Hg2Yn21eOMIjJ67P0wUuujmUx/jGNQjEn8C9is/fzGE9fBo
         cm5U2m2ZWiN6QaM3ZnpfNixAO8vFubTT7DNPN/eSxZmPMATlgQs7kTMa+Y6x3aZD/vET
         Yip3S6i4SljluxuVJgk0pqnt9tqkoZVOrpi8KKt3kiqy01iHiOYEqjOigxvBqCT5uHs+
         VY1j2H2llsov3fRneexckw85w1GABJzDt2eQtXk0CC8C8jxVuOzcnSHhc5c9hHeT8hqN
         zDn4F4/czctvTK/GqiYaVQN4LzIh0GSXgS9CJgLyIgsqYMTX002d8+9GmyhD7W8vtirW
         HJZw==
X-Gm-Message-State: ABy/qLY0g0axuBQVr2GJEIaXJIfFUoo+RcvPUScB3RI2jOu4G0SLc5Fk
	Gh2YACOoLxBB0YPF1R0jt9BehIOI/m/FGMj6qtU=
X-Google-Smtp-Source: APBJJlGmCyh895H+NKlRrEXoEw+nVendMQS7mGtQ6eFTMLjj37m8JK7kRdXwP+uI0gQH1xZBJFSQTw==
X-Received: by 2002:a05:6a00:1a8f:b0:647:4dee:62b7 with SMTP id e15-20020a056a001a8f00b006474dee62b7mr252551pfv.29.1688600437156;
        Wed, 05 Jul 2023 16:40:37 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id x11-20020a056a00270b00b00662610cf7a8sm69515pfv.172.2023.07.05.16.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 16:40:36 -0700 (PDT)
In-Reply-To: <20230529101524.322076-1-songshuaishuai@tinylab.org>
References: <20230529101524.322076-1-songshuaishuai@tinylab.org>
Subject: Re: [PATCH] riscv: Enable ARCH_SUSPEND_POSSIBLE for s2idle
Message-Id: <168860030754.22647.1544926627696310969.b4-ty@rivosinc.com>
Date: Wed, 05 Jul 2023 16:38:27 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>, suagrfillet@gmail.com,
  Song Shuai <songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_164040_065751_605F0994 
X-CRM114-Status: UNSURE (   8.52  )
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


On Mon, 29 May 2023 18:15:24 +0800, Song Shuai wrote:
> With this configuration opened, the basic platform-independent s2idle is
> provided by the sole "s2idle" string in `/sys/power/mem_sleep`.
> 
> At the end of s2idle, harts will hit the `wfi` instruction or enter the
> SUSPENDED state through the sbi_cpuidle driver. The interrupt of possible
> wakeup devices will be kept to wake the system up.
> 
> [...]

Applied, thanks!

[1/1] riscv: Enable ARCH_SUSPEND_POSSIBLE for s2idle
      https://git.kernel.org/palmer/c/c1f048a6bd7d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
