Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E69EC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZwgrLQy8iAwOPZfIVjPNf8ArOcDLu6erO0FPoRwe5CU=; b=X7tEdQ3vRMZYbp
	VxAKk1TjTME11riZP1dDix2gmjHF6g6q+80lslgL5zqL8i4H5S2RBpm0fvjAW/JLJSDqtUbWFoU5T
	BSCYFsEKdEA+JPwODS3evAPL1d+hUijQLQTCZpQZurr3Bf0jLrRrTHqXOe5aWGSfCtqM5/dm1m8kX
	Plj8gOEJrsR+A355DadkHsWPyv/+1r6JRhKsnfgX0oOw+PoLKvg8/SMv2w0lNhEvHolWTBcnRgcrn
	kQEcwRg/DGsSya7Unvx1MClHGvQ4TrMJx6MMT8S3ooFvS+r7Jdas8q8eTfzIjpOhQy7KICJqa9ldt
	2N0lh2PoBql/RZwwCzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfO63-0000000AMUG-2ejb;
	Wed, 28 Feb 2024 17:51:59 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfO60-0000000AMRX-1me3
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 17:51:58 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2d23a22233fso62633781fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 09:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709142714; x=1709747514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2PXWhKeObjvrv5a0sp4dojdugZSvAvimHcwo4W++JCk=;
        b=M14pO9b16slDVtwx9U6D+Rw5IoaxXoerSaMjvUAyJP70SbrKh2pIhjzS+DV96BLaku
         cS8gY00Vm2NRIn8Zs64+Xv8/45TqkYehp7F2GNW1+Dh3nLQ0aNveQA6ym7o/KCbneQzz
         /AVh5RYkvdDSHDMJdUdXajOoCXZtkRnSmKr4mMS1VRwqcAR9wqn5wcdxmAoVQSXb1aod
         tRbnym4+kETsBtF2KDuH6QDkm6quaJp4wm1I++LlynR3MJYG6SpR/g2DcmfGstbd7CU1
         IIj+pvHJBG8Kg/bb1laXYuB8Q3HkaJB2zKiiScoG4So9DIOso46bcDznB8fQMyf46gAp
         K+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709142714; x=1709747514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PXWhKeObjvrv5a0sp4dojdugZSvAvimHcwo4W++JCk=;
        b=oLclCdSGXVn5l92a+VQ1k8LNKoSssdh5OHU3vuAc9tZK2sbXgHSlYdHgCxpZYEgepl
         OUz1xZabzephoRcsgEAJQbSnpIaddBvMPe7ZfcmkUjCL5f8bqypg9o6c2nYYBfnpc+gy
         OY3zXryOVdML9bhtNhIXZ1OnCxP4p0CedqHpZm8keJSmryPK96kXt43m4b60dPm39lQx
         0/Qx0Ooj/twR153/hZfPOtWL0o1Xd6tXNsvmQwf+k8sH4R9plPvoVM6lODoOhsLeIYNl
         QyT21Tr/do7GxW/RK8iv2J0tNFoLCyCmaQVPUYjYc9Rc10qRvDwNt4ZVr/ImckL6vwX7
         cefg==
X-Forwarded-Encrypted: i=1; AJvYcCUZHWr7H3yEYfkWKGDdUJDFC7reZLMRwXOSUiht/zOZ1YfCBmXfHFn78sUNycO7g+UWvKT9XHxZ+q2+wcmd6Y7TdMXpl7PDje15kdN73YmY
X-Gm-Message-State: AOJu0YwAe1bNq4InqOoiIwbQuLFTLgtglfcEPtAhu2W++S5QAw2BsTcD
	Z2/Bb09hTu1Z801K6SsDOGAQR0bvzzBc91zuz6YAGJzCshEco6WDr0/Mod3gaMQhxY6I34mMe30
	9
X-Google-Smtp-Source: AGHT+IHx7VzXebFCK9PVoydXjk9GVjtk6uMFBqmfk4DW/VbXqUm0WiQ9809xGiewPieJ0e9vq8pkKg==
X-Received: by 2002:a2e:994c:0:b0:2d2:3017:c144 with SMTP id r12-20020a2e994c000000b002d23017c144mr8654944ljj.39.1709142714369;
        Wed, 28 Feb 2024 09:51:54 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m20-20020a7bca54000000b0041290251dc2sm2706543wml.14.2024.02.28.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:51:54 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <andrea@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/2] riscv: fix patching with IPI
Date: Wed, 28 Feb 2024 18:51:47 +0100
Message-Id: <20240228175149.162646-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_095156_529712_8646DB23 
X-CRM114-Status: UNSURE (   8.65  )
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

patch 1 removes a useless memory barrier and patch 2 actually fixes the
issue with IPI in the patching code.

Changes in v2:
- Add patch 1 and then remove the memory barrier from patch 2 as
  suggested by Andrea
- Convert atomic_inc into an atomic_inc with release semantics as
  suggested by Andrea

Alexandre Ghiti (2):
  riscv: Remove superfluous smp_mb()
  riscv: Fix text patching when IPI are used

 arch/riscv/include/asm/patch.h |  1 +
 arch/riscv/kernel/ftrace.c     | 42 ++++++++++++++++++++++++++++++----
 arch/riscv/kernel/patch.c      | 19 ++++++++-------
 3 files changed, 50 insertions(+), 12 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
