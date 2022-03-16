Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FC4C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 23:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LSqBvvikorKyxkorIIvxIzLrntMMp3qjy67XDgvmc5w=; b=MvecbUoIygA4Nd
	SpccaPQDjTOs0pJcfYtYIQkxXtbvvw1SxtcuB6urMPwwFpNzWS8wQKNGKe1Ob3YRT1+DyoSmz0Bju
	DqWy2O5s/Rfyz2GyqvrSMqO0NL7Nd8vxhTcHLqx+Os5dq2fOlCTW9oVGkQ2S/Ovo726V+BRc4Pnti
	y4Mt80n2FND22Tx0QV1sPNpn8sUMBV0vVovYwtuxD6hR1j4cspXx3asXxX/1QRTij3iBbvyGLAfHC
	FdgpUi3nZngHan3Adc9ImVfFpoTRFa7Bx5FMmg5Rk2sVDrB2Mc0leCkUVrfLIpRt6qFZFiUA62Gs1
	n7aR0dApeUjONvmkLnSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUd48-00EU86-TH; Wed, 16 Mar 2022 23:28:28 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUd45-00EU6e-U7
 for linux-riscv@lists.infradead.org; Wed, 16 Mar 2022 23:28:27 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so132467pjm.0
 for <linux-riscv@lists.infradead.org>; Wed, 16 Mar 2022 16:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=G2OlpynL+svPG/qBCVApCbgh8fee1f/XrsL4DL/Bf0Q=;
 b=OtaZ9yqhWB4tye3HNb/4HSG53Ngt9PyiVKbt4tKiDRePwVvwEya9svqm2s5w3VOs8/
 yc5YXBiYJ5lI37j7IwRDhHc86YnavSlVsh0QAtvZb4djSLS4+IhqRPG1UroOa6lAYHr2
 MmdFeBcb5MqiiXN9c0cZAnTi3wMI/B1Z3iSzCUEZVZYrwPOrXxRi/ycPnKNM2hdrjT1d
 ie9NE6P8P/kdLZ/hzrBMaChScpMTxQMof4mqs0RbevtIK7WFu960AcDmPUpRF2qSwADe
 J1d0UjMM8OCE0iWgumuCsMKONO032+3frQbABHiQ0inzP7hO/d2ZcCst7FmOhhFQK3zm
 GXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=G2OlpynL+svPG/qBCVApCbgh8fee1f/XrsL4DL/Bf0Q=;
 b=3CFvnrbA7NICRdWDHkoryulFqfvzg70NupIdOeLpsNjSsXPqgYJus+rkD/uRFkJX14
 T3oJWosj2BYLvO4nB66fgWdaBgwyUlRvQ1nWDnYKLA/VVMC+RTObYIs1P/Bg6h4tx9TB
 8aDPxbg0drZQe2iOB5vdFKqORlid+0clJwZRaFvO6wCWYdZC4qv3AotE3ncL030uo+VZ
 9QHV5CdR4RHvs+LLBs/KwVapNz8GWkrzbI2wSXoG8lMcdDpNjvXsALYNd++MpbsrqYPc
 qhMIss8IkC+i+gZc/uKuVAFRVf9s5TutuAFk0sIVhLqkP6wh+QCpi9YsIJOB8Im6QdgQ
 TBpA==
X-Gm-Message-State: AOAM531PmNgatp39x/7XX4k6nutItCxd+12kWds4J2Wlagvaxj+cy8eL
 gUt+DfaUFKEKTDbcmLq2d/f+0Q==
X-Google-Smtp-Source: ABdhPJwvtB81UtChoOLXVE+LBbgrtmta/Nk4/MhmrLCtsDTPfNUpp+6kUErqrPWaxRw1IuW1/C269Q==
X-Received: by 2002:a17:90a:4306:b0:1b9:80b3:7a3d with SMTP id
 q6-20020a17090a430600b001b980b37a3dmr12666080pjg.66.1647473304308; 
 Wed, 16 Mar 2022 16:28:24 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 i187-20020a626dc4000000b004f6e0f346e7sm4189585pfc.39.2022.03.16.16.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:28:23 -0700 (PDT)
Subject: [PATCH 0/5] Generic Ticket Spinlocks
Date: Wed, 16 Mar 2022 16:25:55 -0700
Message-Id: <20220316232600.20419-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, 
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org, wangkefeng.wang@huawei.com,
 openrisc@lists.librecores.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_162826_064016_F9A687F8 
X-CRM114-Status: GOOD (  12.77  )
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

Peter sent an RFC out about a year ago
<https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>,
but after a spirited discussion it looks like we lost track of things.
IIRC there was broad consensus on this being the way to go, but there
was a lot of discussion so I wasn't sure.  Given that it's been a year,
I figured it'd be best to just send this out again formatted a bit more
explicitly as a patch.

This has had almost no testing (just a build test on RISC-V defconfig),
but I wanted to send it out largely as-is because I didn't have a SOB
from Peter on the code.  I had sent around something sort of similar in
spirit, but this looks completely re-written.  Just to play it safe I
wanted to send out almost exactly as it was posted.  I'd probably rename
this tspinlock and tspinlock_types, as the mis-match kind of makes my
eyes go funny, but I don't really care that much.  I'll also go through
the other ports and see if there's any more candidates, I seem to
remember there having been more than just OpenRISC but it's been a
while.

I'm in no big rush for this and given the complex HW dependencies I
think it's best to target it for 5.19, that'd give us a full merge
window for folks to test/benchmark it on their systems to make sure it's
OK.  RISC-V has a forward progress guarantee so we should be safe, but
these can always trip things up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
