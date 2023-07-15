Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1EBC001DF
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4MuWmT+8D013mtYXNbdPw/e/Mhk3vyViCepRYzJqls=; b=0lQGx8UvdkdY4e
	H/ptdWN0UbH7UXkzBDDEsMnLazxk/lBAkU8HDjfTE075bjJhhi7QF9tFu5iIJfyHeeYLc/deKYKDa
	qRCOhJncSlebQWlhZmOqq3Tk6ORmURSA9J1KO8JEf38IeqMOpP4/rK1b/B7ggiNg9VFNpyfbgSIBD
	Dl0saKKC/fYN7qZ+xWLG5K2mgBsV3xPyFYyovxCRB+o+6J8hAlCnp4Q3Lk7LqpnHb7cgzJD7+RQ03
	bniV2miKHuiyNY2uK9pmvui6CyoTeQucmHnNPc+LpJKm+0BZNPxpc/JOoXMb3ZaZdYYmZ9LRa0X8+
	46e+oUdkvsA5DH86zhKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgm8-008zlf-0b;
	Sat, 15 Jul 2023 15:01:36 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgm4-008zk1-34
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 15:01:34 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2632336f75fso1991586a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689433291; x=1692025291;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2UCzvviqLaht1enidoVBHlz8q/RmZyOnwjkKU4rZlbI=;
        b=BsP/kZmUBC6ajblBI5TjQlGD5OKHfRM3e5RwrlxKX4qW4HY4F9+RDL7TJP+E/ZpoRw
         MMb1kJm8le+kbvyTXGgdDH2/NT2lrBZ/RUNr7CgkxHSJTOMQKdmDMHFcuy8GON3nC4Ry
         otYdeVbZLAvXm5/1z8qUSfhwnC38dJOWP8zFdOSVLnelRQYFJy+bgld1nU5NJ4dYkYwL
         V1K6c6culGNDsCecIeuHvyW8IXewBY9Bj4bjeU9o+BnHJaSkWXmtWJbMt8+MuVpImios
         zKjjGLdYsD3x/v4FV3UhWFhHTLaTIHFNTW50pPcJZwY/8rD6zvr5PjIer+X1ILBgBLE3
         8NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433291; x=1692025291;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UCzvviqLaht1enidoVBHlz8q/RmZyOnwjkKU4rZlbI=;
        b=Z0fDj7F19aVCmZYB0YrZ7X96fL2C25RJew2lwysRC9r0CL6dnz10zmyQDf6BVq6U9M
         /6S8MYEKJHrqgcpKs+rU31eu6Kb+l3VpDCNJn1he8ylvA+4N7aH1DtQ+ZQYjagvNYZAd
         21RyY+q2/r7sLTsd6smkJHNKUkDN/jO1TzeuHafbATe6MGsfwtjLif9XMck7oW1qK7wB
         84f4CeeglJnnSpn5YjU7/RGxxKU3QYNKzI3PgtO851k7yAKmmAFkT7OyA/3NWA6w76YZ
         KVmf3+vHW/5xhvGPQ2BFlyGs8fLHnOySTlQ95hhmUcNoMl9ZSsEjAkNH4dPjAfUt2V2c
         v6NA==
X-Gm-Message-State: ABy/qLYg4WFtjgzMVRsmYvnxjAhuPMOVbFIqihhDHZYdimQW8MhFfAjk
	8hGvqlo1SFA7vjPFlFcEY0B3vBcIIpgv1oNfLdCSw6y0ifpV+bu06P6Jct2HNMnnl0k7Jjdmfap
	xGLvtMXZI8iXRewYdjUS5fEiF0BCSgqWpaG6BEkEI9CIUbl///OH43J0T5eIqHv4Vpc7ui1/XZQ
	wBF4Cjy+YHRD4c
X-Google-Smtp-Source: APBJJlFYPKocV2zT5SEHFTeQcJcJM0iyiUO6rDqMYENRz0C1B0Dd1bZNm+TpjYTSv7u413kjLaCHCA==
X-Received: by 2002:a17:90a:13c6:b0:262:cef9:84f6 with SMTP id s6-20020a17090a13c600b00262cef984f6mr6575423pjf.22.1689433291445;
        Sat, 15 Jul 2023 08:01:31 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id a28-20020a63705c000000b00528513c6bbcsm9356535pgn.28.2023.07.15.08.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 08:01:30 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: vineetg@rivosinc.com,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	paul.walmsley@sifive.com,
	guoren@linux.alibaba.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	heiko.stuebner@vrull.eu,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v1, 6/6] riscv: vector: enable preemptive kernel-mode Vector to be built
Date: Sat, 15 Jul 2023 15:00:32 +0000
Message-Id: <20230715150032.6917-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230715150032.6917-1-andy.chiu@sifive.com>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_080132_988747_601889BF 
X-CRM114-Status: UNSURE (   9.82  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a Kconfig to let user decides whether kernel-mode Vector in a
preemptive kernel should also run with preemption. If the config is 'N',
then all kernel-mode Vector code are run with preemption disabled.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a9e8b697fefb..da6a45ea42ec 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -500,6 +500,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_V_PREEMPTIVE_KMV
+	bool "Run kernel-mode Vector with kernel preemption"
+	depends on PREEMPTION
+	depends on RISCV_ISA_V
+	default y
+	help
+	  Ordinarily the kernel disables preemption before running in-kernel
+	  Vector code. This config frees the kernel from disabling preemption
+	  by adding meory on demand for tracking kernel's V-context.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
