Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68963C38A2D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 05:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bEOGJ1l0lH9/FYjLCUyYSWtA9K4VKJ9ttolK66p4ltc=; b=E/2pWk3b7Q1kzcbfQ8ntzG5rmQ
	qT7lkK82Q9TJumRjtYLEfQL2b68T3Q6c6hc8XYWeaMdv/itwvz9a7VsQapFjqRndRMfkuGx7D251l
	9v8giLmaGl6YxyGD8t5J+W5TRLa5sLtk5ZS+SHL0e8I3oIqyrywOlyQCKu+Dbj0EPI805uo3sUyHh
	cPER1oidiXCnkORRLy4oEQ1XnZ9xpjW1Snt7up1ipjXXNLDW9yNX9ttQO6qLdGhAdbR3RzzUVFogR
	cnYq+GKmLQsm7ha1tSgWX9qryZqt60bma9yHZUfWrSnWwCi7DUER7cUrjKSN26GKnMXDcqQEq70OZ
	ZlqeYLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onv2r-00BsjA-7v; Thu, 27 Oct 2022 05:03:09 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onv2n-00BsiK-Ut
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 05:03:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id 130so388726pfu.8
        for <linux-riscv@lists.infradead.org>; Wed, 26 Oct 2022 22:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFiEViH1pmz7CSziqwdr/K8qMtJRaQVlUIY1JyGa0HI=;
        b=GaeWuyn0Y1l2/rp+z3jcUlS98ZQnSqI3XVznWzalbixnQFJnFyqd2wpy2PLIaJK+ct
         q2yn0oEtQg3SCXvbCCpOE/r7fq9T9vPCbtBmVTz82KO6WEUdmNRPYk+QUEH0PDlgSbkt
         o9fP8jyFOrXaqQf6XPSqcbatE1OCnCTTe50I8BTGSo1TIqFfl5ICTeUSPS56JTwkfs2M
         Jg4e1qPN+JvxmXyUh44bAkeCoJ1B797BUiFLkyREcM2dXsQrN2tuwHqC4x1Lkcvu4NDd
         5zyK1mFmAqLojKKnC4EJhqhl13DEccGeC/1EeMb/C3DEzjtZYmk3B5ofk7Ar6vFi38gi
         xN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFiEViH1pmz7CSziqwdr/K8qMtJRaQVlUIY1JyGa0HI=;
        b=HJTe3NUU4Y7x4PCpUxXJ2HZi4TfDprNfs/LBI6ZFIx4Dfa4eaWUzyu1xrOfscMU93T
         kJxueqjzLAtBxKPGssrrgbovFmdVlXYrSIzNR/38BBNVLK+TtBcj9hNE2wAdXy2wHpx+
         d4E6AXABc0fgZmNyPwXtDN5L+m8NdGN61EM8BhPTMNdGWcJa2PCs1na1Ct2zlSVZX87t
         BPsZfx3t0oeBJ6HmbiCT72PqVQei+w1rpLxgBPN4OyvxyPNe5VxZJDl9jCwe1tFAv5AI
         P2SHTFiaWSpadzARuAIfjxzYOoh5EZF5VY96iNzZe5pjK3H6Bf/JP/VAn/EIvNpEjy0D
         cJsA==
X-Gm-Message-State: ACrzQf1KGX4Nz760qILf7y6buFp4GBcxRlENWIJjDlg9QbhE8us75Ogo
	kdERfFkAznyP3isFP+LuPOwqNw==
X-Google-Smtp-Source: AMsMyM5dkgtlTYHOqsvTwbjfn4tuJhkiZCsTozcFbzD9oiklIBw3USJnQzUOe+bEWvy//QAuJJce5Q==
X-Received: by 2002:a63:4753:0:b0:462:b3f0:a984 with SMTP id w19-20020a634753000000b00462b3f0a984mr39380873pgk.501.1666846980192;
        Wed, 26 Oct 2022 22:03:00 -0700 (PDT)
Received: from localhost ([135.180.227.132])
        by smtp.gmail.com with ESMTPSA id u144-20020a627996000000b0056bdc3f5b29sm256869pfc.186.2022.10.26.22.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 22:02:59 -0700 (PDT)
Date: Wed, 26 Oct 2022 22:02:59 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Oct 2022 20:26:02 PDT (-0700)
Subject: Re: [PATCH v6 0/2] riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores
In-Reply-To: <20221011231841.2951264-1-heiko@sntech.de>
CC: atishp@atishpatra.org, anup@brainfault.org, Will Deacon <will@kernel.org>,
  mark.rutland@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com, samuel@sholland.org,
  heiko@sntech.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-0bf8c154-76ce-4cd3-bfdb-ffd8a4670600@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_220306_254467_94DAB7C7 
X-CRM114-Status: GOOD (  20.24  )
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

On Tue, 11 Oct 2022 16:18:39 PDT (-0700), heiko@sntech.de wrote:
> The PMU on T-Head C9xx cores is quite similar to the SSCOFPMF extension
> but not completely identical, so this series

The rest of that sentance got dropped, so I put in

    The PMU on T-Head C9xx cores is quite similar to the SSCOFPMF extension
    but not completely identical, so this series adds a T-Head PMU errata
    that handlen the differences.

but LMK if you had a better version, it's still early so I don't mind 
swapping it around.

b4 also got kind of confused here so I had to merge suff manually.

> changes in v6:
> - follow Anup's suggestion and hook into the (pending) cpuinfo patch [2]
>   instead of modifying the core sbi_get_* functions
>
> changes in v5:
> - add received Reviews
> - fix sbi caching wrt. negative values (Drew)
> - add comment about specific c9xx arch- and imp-ids (Conor)
>
> changes in v4:
> - add new patch to cache sbi mvendor, march and mimp-ids (Atish)
> - errata dependencies in one line (Conor)
> - make driver detection conditional on CONFIG_ERRATA_THEAD_PMU too (Atish)
>
> changes in v3:
> - improve commit message (Atish, Conor)
> - IS_ENABLED and BIT() in errata probe (Conor)
>
> The change depends on my cpufeature/t-head errata probe cleanup series [1].
>
>
> changes in v2:
> - use alternatives for the CSR access
> - make the irq num selection a bit nicer
>
> There is of course a matching opensbi-part whose most recent implementation
> can be found on [0].
>
>
> [0] https://patchwork.ozlabs.org/project/opensbi/cover/20221004164227.1381825-1-heiko@sntech.de
> [1] https://lore.kernel.org/all/20220905111027.2463297-1-heiko@sntech.de/
> [2] https://lore.kernel.org/r/20220727043829.151794-1-apatel@ventanamicro.com
>
> Heiko Stuebner (2):
>   RISC-V: Cache SBI vendor values
>   drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head
>     C9xx cores
>
>  arch/riscv/Kconfig.erratas           | 13 +++++++++++
>  arch/riscv/errata/thead/errata.c     | 19 ++++++++++++++++
>  arch/riscv/include/asm/errata_list.h | 16 ++++++++++++-
>  arch/riscv/include/asm/sbi.h         |  5 ++++
>  arch/riscv/kernel/cpu.c              | 30 +++++++++++++++++++++---
>  drivers/perf/riscv_pmu_sbi.c         | 34 ++++++++++++++++++++--------
>  6 files changed, 103 insertions(+), 14 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
