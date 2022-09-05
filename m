Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758FAECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 05:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+pj2IttVdejuPfp0urlrOEsw/wSZcrHiMRBERiLjZY=; b=y2Db3b1vpyFD/B
	+pOOH12sXx+yRwmyRSDIpeAPZdgSVfk8X/ckwH2GXCWtbeys4h9mtle8zjFoUqF9G6qaWSvChknEs
	xLEzXSA/xGYhD29xRp/A6UnT/Y/gRb/o15AGeVWGZuGJ3zSY4wRgjgb19Kp9dZEtwyHMaNNmXEWO+
	JYkCN6vktRMgfXyQdQN5wtSD2GK3Pmo0aPkKnJ65GrbgCttn6nqLC4IxEwLHeJ8my2D6tEr40Myj2
	nFqPpHcbgr9OaPVzP8dIPHhX1h3PvxzqbqfOEIBNNc8Xh1u2oxM2UZYEOlzdEfW2TvXPIgVbUn6Lj
	234cQY7yEu+Ozz68dllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV4rB-00BK8B-7n; Mon, 05 Sep 2022 05:41:13 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV4r0-00BJfH-SJ
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 05:41:10 +0000
Received: by mail-lf1-x134.google.com with SMTP id z29so11525905lfb.13
        for <linux-riscv@lists.infradead.org>; Sun, 04 Sep 2022 22:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=TjKI189t+rmknCeybye+Z3B6Q7LhyXEjxxra9ypXiPE=;
        b=PVAN120o4qSsY+UYcxqgnKjHLvMN5Q2KkjU3yj9tYKWSxaZ6zSLUVsy/w+mDXMn7GY
         SiJKxgp4xY1HoLwMR2mWj5CLokAWcltoAlWZ5qAfhTBd/7YKHiRxF/e41mDnOqSP3Kko
         14y53mP7Q0C7m/yI4LBh6gAekQVg2IFIpeQa0ZGuV1GtSFpwHHuu7KMtVqeERt3/JAHH
         pJI/GyxPDmiH45mB5rIv4RATpXIAlcQ1tFE7EWshXOATjhojdOgzMyKtPpU2pd6Bqq4X
         ua2yCdQ2uAm9/MPjEhgbZW1dvMuDm2E4swux9EN3AoPAw0Cvg5IpCKQenCk+dR9TnKVm
         Sx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TjKI189t+rmknCeybye+Z3B6Q7LhyXEjxxra9ypXiPE=;
        b=7yOW0C7edMPIF9Gi1ic3DaojK+GrSYqNCSJp3//rI4AWyEUd5Fnzmdlf+prXRZKWNe
         cHosWq96nd47uIGtlfMZoO/uxdVsws4wYQmr3FphQtbCIUAbzef0wf+mn2pknfzqjQq4
         Tuipx3fiXgmn9HYZ9FzES1EdOfrAA6YhmqrdzUIi6dMNazuNoOShYm82UTwpqtcgPoM5
         DwPTjzIiWwhCH/znymlCcVwrNIugSKHMbMn+2tuhSZYwtvHrEBLN6wKXO7M8bkSK0r2Y
         S7hWKV8OpBTDkg2OQfSygL9FHTZ9A3r0/8WaZvtKrtUpkeycy3W4T5HyrLbs9ejK9FDz
         nZ+Q==
X-Gm-Message-State: ACgBeo0iGCHUJxyWDiXctrY8OPnK2V3urchjiFb5MpqD7zYqjFq7T3+q
	nlqohn9/ZSHzf5gSPzn1nxZMFrEXQcdvpeHsu0CMNVev9d1ulg==
X-Google-Smtp-Source: AA6agR7kBEKn7fEAoAflRCB8ysM+7whhdFrAy9eAA3L0FWvCMSXWwB5c/Ym66bP1gMZ/KVzw4Gvdehd9BzDCSVRPheY=
X-Received: by 2002:ac2:5045:0:b0:494:66d2:6dc2 with SMTP id
 a5-20020ac25045000000b0049466d26dc2mr11414786lfm.661.1662356456637; Sun, 04
 Sep 2022 22:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <YxEhC/mDW1lFt36J@aurel32.net> <CAOnJCUJ-E-VyQOyh+psbJP4mDO9F+ShvnxDYjoCUUkH4rddJtw@mail.gmail.com>
 <CAOnJCUKDQfCD7mh-RWrq0E8a3Fmp4Xz348THrS+SmJ71GX8=PA@mail.gmail.com>
 <CA+7wUsww-CGmyNOHJw2bVfcDamq3_XD8mVDJ6pfk0UsxreEjOw@mail.gmail.com>
 <CAAhSdy2RGu9NHg0rOfiGxZYsvvcvtOr-jGWdLVt+iUkpZKgN=w@mail.gmail.com>
 <CAGRC-mj-v6RoGjCNr_TiabgqYX7H9mTXYE9tx6BhCKT5nHD-Aw@mail.gmail.com> <CAK9=C2W2tkmyX0x2A7iaNLGoRq4N7L0CwwNacmdtsw6OUdfODQ@mail.gmail.com>
In-Reply-To: <CAK9=C2W2tkmyX0x2A7iaNLGoRq4N7L0CwwNacmdtsw6OUdfODQ@mail.gmail.com>
From: Jan Wassenberg <janwas@google.com>
Date: Mon, 5 Sep 2022 07:40:45 +0200
Message-ID: <CAGRC-mhdmjcf=6gx8Rh5Rt8jvy5a2Rz+2g_UBRG_0fAG-D14uQ@mail.gmail.com>
Subject: Re: rdcycle from userland with RISCV_PMU_SBI=y
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Mathieu Malaterre <malat@debian.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	Aurelien Jarno <aurelien@aurel32.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jan Newger <jannewger@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_224102_952792_E66E0834 
X-CRM114-Status: GOOD (  11.22  )
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

> Currently, only "time" CSR is available to user-space and all other performance
> counters should be enabled (or accessed) using Linux perf syscalls.
Unfortunately that would seem to prevent precisely measuring very small code
regions (order of 10 cycles). What is the corresponding advantage/benefit?
As mentioned, there is no security gain from merely disabling rdcycle.

> In the future, someone can always propose a RISC-V ISA extension to obfuscate
> "time" CSR values visible to user-space but the "cycle" counter is
> purely a performance counter and accurately reflects cycles taken by the CPU.
Yes, this is why we use it. I'm curious why we think rdcycle is being
used to measure wall time?

About consistency: I understand there will be a time when rdcycle may
or may not be available on Linux depending on PMU.
But there is also bare metal, and other OSes. Is there a way for
userland to detect whether rdcycle will fault?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
