Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F9DC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 00:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UclGDiwI/MHKorco0QMsyb0s+Cb7NTYmPyu/oXFkWeM=; b=q5HW8nbrWcBmPD
	OHjSslrktZY7kPZXxXuBbXR0hjtO7o98A9flU6cFsAxnXwXUyW1fcyoL03GOn026ayO7yFsa7TgfR
	98cDvXqfGUR1q+xuTKUtmJm09avz8zH4p0XdySQt9wj61TSWrdnofoL8+Px0dSzd0S+vtrS1m1Q1x
	n+DTLAV9jSGhKnMTVgHgz7I0efXpwLGIDXXVvRCCnNJPFJFrXYuBloraK9OV7N+EQYNcNrnoAx/Xj
	0xHwDz4exXT6T1T7uwUukipFjIaODnMkD/7ckgaQtDGbKSS1r3VV7chavm43xO4+8bxZ2ROosl1rU
	aWetDhm0RrvwBLTFHVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relSd-000000036zv-0BVT;
	Tue, 27 Feb 2024 00:36:43 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relSV-000000036x8-3YbX
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 00:36:38 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-22007fe465bso968187fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 16:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708994194; x=1709598994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gKpylQvY7fWF0HEhcpoV/u+3QY3QSMz3zE4Q+faMtfw=;
        b=Wj/ns2m8g2CgX3UeLiBHwBYFkqj2QmNrCjVrKjGs7/Yc6fC6EESjkxonJ0xHQqKXZ9
         6s4NzHmuulGb6jBACM14ElL+Gi7UVpXlQK4tuOe/9EzdE+IIkS/65/jzYF1EVaBlwtDu
         Obcno88R6euxNHAIjbLtKwlqOAAJukVptzi+XbWd4duf+XzmRMsIaZYGI6XZS8hZ+ekr
         YykQfO8bydHb3yJ84Vlef4kDb1FnsR1q+37NUyY8KHLc0ak767TtQs11d4XAlfEbTM3h
         yD4GHlNivyomh3ABWtL8WdQclVcwARNpUx8RFOToiGWeCv4GyIrgWf7s/wPF+ZuPdl5M
         SvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708994194; x=1709598994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKpylQvY7fWF0HEhcpoV/u+3QY3QSMz3zE4Q+faMtfw=;
        b=YbKkTEJ6Nd3Ewlkj+QKQl3UwewUnq5ZT2aNeV45xrtfrziuvit5snJnYFEluPLjzbV
         KAnbIVmekNYNbVcTvXfCPHptaExz4A91iOkiaT+IbTbjryaDPd9kr4OSzjhmOXBjns8S
         Scr1wFuZOmxYTrP3sn3aRXLew29wlFbK3WG0P1nAx/fr9lHxBDSM4lUAYepT5S3PDzSt
         et6iKN0eMs8kLW2a3DP1eqiVVurtUOINQfJ9z9nVWftcqZVQuGWqT8kyxOhpmSqLFPd8
         k1+0ZrWkDaP/hbl8bFNr4cvsYDkJzKJizabo/wif927iMzeB6Spn6juXo36NM25amyoL
         CJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCXq7TwtqdJ34dfxjIqBVmYjQxH7GJyexqJo9XUB5j88irRWvKABjDISfY4AXRZtkEPR6xFgKs2KpNMt9feOS9EAMlsr20+ak4JRhevcCA9P
X-Gm-Message-State: AOJu0YzAvMOYPOlQCbcxjYeDGtFC1ioW2cQTIgWJ1GmyKiz3VWtubTdG
	JJCsJkC2B8+YrcvB5ea1Fvh1uDdrzzlPj5A6H+3mt4vhXNsIZTUKpij/qf7LTis=
X-Google-Smtp-Source: AGHT+IF8tWJd2eygIWIDlgPAqpdoF+Qi7wuIkaoa0or5Hh5ol/qnDbAz3ov/zNu7c3Mnn8M8tQ1D2Q==
X-Received: by 2002:a05:6870:d154:b0:21e:8424:8325 with SMTP id f20-20020a056870d15400b0021e84248325mr9458650oac.18.1708994192531;
        Mon, 26 Feb 2024 16:36:32 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020a631919000000b005dc85821c80sm4504117pgl.12.2024.02.26.16.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 16:36:31 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/4] riscv: 64-bit NOMMU fixes and enhancements
Date: Mon, 26 Feb 2024 16:34:45 -0800
Message-ID: <20240227003630.3634533-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_163635_932551_28A2B4BA 
X-CRM114-Status: UNSURE (   8.70  )
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

This series aims to improve support for NOMMU, specifically by making it
easier to test NOMMU kernels in QEMU and on various widely-available
hardware (errata permitting). After all, everything supports Svbare...

After applying this series, a NOMMU kernel based on defconfig (changing
only the three options below*) boots to userspace on QEMU when passed as
-kernel.

  # CONFIG_RISCV_M_MODE is not set
  # CONFIG_MMU is not set
  CONFIG_NONPORTABLE=y

*if you are using LLD, you must also disable BPF_SYSCALL and KALLSYMS,
because LLD bails on out-of-range references to undefined weak symbols.


Samuel Holland (4):
  riscv: Fix TASK_SIZE on 64-bit NOMMU
  riscv: Fix loading 64-bit NOMMU kernels past the start of RAM
  riscv: Remove MMU dependency from Zbb and Zicboz
  riscv: Allow NOMMU kernels to run in S-mode

 arch/riscv/Kconfig               | 17 ++++++++++-------
 arch/riscv/include/asm/page.h    |  2 +-
 arch/riscv/include/asm/pgtable.h |  2 +-
 arch/riscv/mm/init.c             |  2 +-
 4 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
