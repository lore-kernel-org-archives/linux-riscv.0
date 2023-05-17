Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC1EC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 03:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NFdRwigIRaGMjazAiLMxNN/dOE4Di01MUbp5IP2ZnoU=; b=oXbUP79t8rYiGa
	u3SZxykMqCUmIV5xVmEsG1kMqwkhl43qEXXNi/K5K0JGaSrQiBV6kQjx/o36ELyUY+NFToiixXS1p
	cjhQupGgMqlq0CSZ8qgAV7Gt1wLKS+VGvTez9awBD+ixIpvolzG0Q7cEaggPQ159WYsvoiKH8iT2s
	edhVXy41y/cY5O+NGMqZYQborcaPvwSROWjRenC+S2axReMOyDyZwDC5Muda38MSGa/4jcUvNInJW
	3oMf1dH4zcTPypwkQcroDN62bggj3s1fMp8HCbnRWrcs6ZsFnLCFWq64fctYt83gwPespRb4wziVI
	KFEdoCY0LbSucOz4VLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86O-0080au-1N;
	Wed, 17 May 2023 03:45:24 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86L-0080Zz-1m
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 03:45:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1aad5245632so2718965ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 20:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684295120; x=1686887120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n0fdPmeINo3M3GEcsjn+DqgIArQ+TF8t88l9Aksr7VQ=;
        b=Dy5EDllK8uVJFjPdvz1RUbi2yk4rgd1PjqZJX+ibJORvvteuhARUVlChiDWi2GdYyj
         ornOQnlZWAccsQTsX9fLi2XGvQ4x2OgrV6l+T2ZMZvd75JIePFW+SoFmsNoYqlf4tmj6
         mu8MFImYX/tmrIswvc9vSL7jdvTVtA3XMoOw2H5DMKVzaHKqWcXvCHVJhmLlIYe3M0zg
         DYvxBvbgYH6iW3+axk10pT1phM6PW493USZleI0YoHLDNsChz3x3uojs4ai7zGPrwo1S
         IyPBHmYqqM0fciz6V34Z9NRne8SpZebj4C4tOarrPY2uQ/ucSWcFEYkSxS9uD+fy6URe
         cVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684295120; x=1686887120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0fdPmeINo3M3GEcsjn+DqgIArQ+TF8t88l9Aksr7VQ=;
        b=WTqQinWHT8WgbItAWf2O5d5bFXBT4OIrCg1vBx0PdzpMAqEWMFKwwgh56dthr6V801
         A3myd3uQnA5Y97RfnhaBdmA72F0XXGf84snquQJd0TpX266SmRIZ4VY825YTK8OAbYug
         uLqhZEQc3sW/XeQ4mi52j0h2jg3lghag9nOxdCJk0OkA4qVi849fMNKDnm33BA20qdrX
         RZTf/XEXbP5osIzpBGQJj8AHSUE3auGFK10JKgzeZaogaHOq/KhlzhriMIVd0JI6Za7k
         q+PqsIsU3WbmZEUoGqf7qVQ6QdMsbCYYijpUi9Yyy0j1ldav3bn1+bMYOVQKsOYjScJU
         L3LA==
X-Gm-Message-State: AC+VfDy/s5TitbjBrVgquE2/rqv/PkPLqX6HaE6oRLtO+aiL+Pm1yyfo
	hlGe93IaG0+/cNNI/xPiuN0=
X-Google-Smtp-Source: ACHHUZ4ZIj8959vfQi1i7G2NHQaO5ugC9tIBfRlSHL/tUdJglqovvvIgcNxw0ueQxt1v5RcuroWL7A==
X-Received: by 2002:a17:903:110f:b0:1a2:8c7e:f310 with SMTP id n15-20020a170903110f00b001a28c7ef310mr48043595plh.35.1684295119892;
        Tue, 16 May 2023 20:45:19 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.83])
        by smtp.googlemail.com with ESMTPSA id t2-20020a170902e84200b001a19196af48sm16336746plg.64.2023.05.16.20.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 20:45:19 -0700 (PDT)
From: Ze Gao <zegao2021@gmail.com>
X-Google-Original-From: Ze Gao <zegao@tencent.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	x86@kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Ze Gao <zegao@tencent.com>
Subject: [PATCH v3 0/3] Make fprobe + rethook immune to recursion
Date: Wed, 17 May 2023 11:45:05 +0800
Message-Id: <20230517034510.15639-1-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_204521_595762_B8EB5E50 
X-CRM114-Status: GOOD (  10.80  )
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

This is the 3rd version of patch series that fix the ftrace rethook recursion problem.

Changes since v2:
- refine commit message of [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion free

v1: https://lore.kernel.org/linux-trace-kernel/cover.1684120990.git.zegao@tencent.com/T/
v2: https://lore.kernel.org/linux-trace-kernel/ZGP4ypidaxQGdp7Y@krava/T/#mb9e74fe74d5800ee424234b26c6def9d5135237b

The original discussions of this bug can be checked out here:

https://lore.kernel.org/bpf/CAD8CoPCfPmqZH6BJCk3Y1-02BLVVsbQ6OeaNOhcfGWmdF0oX8A@mail.gmail.com/T/#t

Ze Gao (4):
  rethook: use preempt_{disable, enable}_notrace in
    rethook_trampoline_handler
  fprobe: make fprobe_kprobe_handler recursion free
  fprobe: add recursion detection in fprobe_exit_handler
  rethook, fprobe: do not trace rethook related functions

 arch/riscv/kernel/probes/Makefile |  2 +
 arch/s390/kernel/Makefile         |  1 +
 arch/x86/kernel/Makefile          |  1 +
 kernel/trace/fprobe.c             | 73 ++++++++++++++++++++++++-------
 kernel/trace/rethook.c            |  4 +-
 5 files changed, 64 insertions(+), 17 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
