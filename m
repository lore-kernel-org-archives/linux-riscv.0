Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2A8ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 15:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hvkof6DXm3DKOR5FV8XgqOP91TkQKtAnqyF+phSbUlA=; b=HKz8MFQsrzln8Q
	VybuFRtWgxHJRIyHLjBVsrfdhaLjsm++Ivxi7q/WAOOtgfm82jEcA+LYizgeSDkt/zIGSUH/3teIW
	uHT5tD9fzIwK789CuwHNyPNpoMlyckIuA9UUATtQ+tpaFkSpPeTNa9/0FeR4IFOY9jAmez+hv/mak
	NYT4sH7LHNbDK8t957StjWuPgofPnwhe25xVsD1qyiDXm6t06TH9XOjFHdmB9+SkFEmh6kQhHcB6l
	4eO5WHaYsbNgDiLAzczR4qUTKBNMEUjDP5n2BhyqJKuGLbvO+Q0WTFBx6nobtc1oXbFvA84Y2Jamr
	BVS0Nt8sZSjRo7DLknkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT3YE-000PKG-VY; Tue, 30 Aug 2022 15:53:18 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT3Y8-000PFL-Jh
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 15:53:17 +0000
Received: by mail-lf1-x12e.google.com with SMTP id z29so7554195lfb.13
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=YmhjEmQNSz9LL/62TBl/XR5crW8ZhhyzZ6SYzRTdiT4=;
        b=hLBSqskswIsOLeoD0qtIXQvNy1VFTOeMdFx04S6VOPIo92FyVu96PRUYxn6TI48eqR
         kDrE5HZz/keOwVE/Odsr1mUpeXYuBZSTiDYnksre01ELDXjuBl3BWWy3yzUkmpk8xRar
         GdBHtnc0UwhcZXpy+ydDCQ0uczI2YOCi0euqT4ZNIZAFQUnK1KkVBTXRU1k+o+RBBAkF
         gMDjCi3fd963GwNIAXdPZYxEnmJ0k1kms3L8cE0HRgLbuFlt4tKRBKhDXfXsyCCPy/T8
         /qK7KlYp4E47iuZ8GY/7VA4VmBEM1XEVNWe7Nagf8J08TC/6dz7ZBcccbWGan90sXx1O
         F/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YmhjEmQNSz9LL/62TBl/XR5crW8ZhhyzZ6SYzRTdiT4=;
        b=6h9ZbTFZi2MGAK/xe/VoU0WvwAOnFtvJwEzEAxU8wflWsIID3R5pxAY5Aj3Vtr9PhV
         CeVKy3aWGGx6h6vJl7afxPE+olpW7Dk51hGx/1I8LVPsDS4WQjlmK8S18liHRoXoZeiv
         sER9SLZ2M6Gi6/k2I/h7SQONB3scGYv9OnA20a0AL1BoSIk5De4Ou+MohG/k6zmwReVh
         zB9Ns/JBnf+4CQQkoMhBvq6mFe744N/wQ+QHfGpxj+H0AiTznGe6N3yOymSuJ//mPFtR
         6e0nO2olaSQfeejCbevizYWFYL41IjJd9dGcdtKeg6DEIWQe5mHU+IaxafMC7V7n8gVS
         pU7g==
X-Gm-Message-State: ACgBeo0/n+7q+yxOkC+xde6x7bRGTYOrKAbgvnGBj3eFoIXiLnjQztcp
	wKtjXjZ20mdzUnZ7bzDOlZoS8ORaq4cp3keg
X-Google-Smtp-Source: AA6agR6kQeHA/YxA2RO05lvHt0/s/Yq+VjRNyMtr7CUVmZgKNMs9GvtvmNRArOC3eb/97o2BQ7wE5g==
X-Received: by 2002:a05:6512:2391:b0:494:7f90:ac04 with SMTP id c17-20020a056512239100b004947f90ac04mr886602lfv.521.1661874789391;
        Tue, 30 Aug 2022 08:53:09 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id t6-20020a19ad06000000b0048af397c827sm1646572lfc.218.2022.08.30.08.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 08:53:08 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v4 0/3] perf: RISC-V: misc fixes and improvements
Date: Tue, 30 Aug 2022 18:53:03 +0300
Message-Id: <20220830155306.301714-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_085312_686807_D7F9A1EC 
X-CRM114-Status: GOOD (  12.05  )
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

Hi all,

Another respin: updated commit message and more RB tags.

Regards,
Sergey

v3 -> v4:
- added Fixes info to the first patch
- updated commt message for the first patch
- added RB tags by Atish Patra to the remaining patches

v2 -> v3:
- rebased on top of for-next branch in riscv kernel tree
- added RB tag by Atish Patra to the first patch
- added perf throttle patch

v1 -> v2:
- drop changes for access to the highest available counter as they are
  now handled on the OpenSBI side
- drop switch to IDR: in fact there is no need to handle non-contiguous
  counter ranges


Sergey Matyukevich (3):
  perf: RISC-V: fix access beyond allocated array
  perf: RISC-V: exclude invalid pmu counters from SBI calls
  perf: RISC-V: throttle perf events

 drivers/perf/riscv_pmu_legacy.c |  4 ++--
 drivers/perf/riscv_pmu_sbi.c    | 33 +++++++++++++++++++++------------
 include/linux/perf/riscv_pmu.h  |  2 +-
 3 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
