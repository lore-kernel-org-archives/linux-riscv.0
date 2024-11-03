Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C12E67806
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 07:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a+PamuqhnsKxNRojByWK+rbunX1PrhecrqAOzuI/2Wo=; b=Y3uOaS1DyW7Z/r
	KVxP5pyZA0fSHdFxW8mLdnAvl+efPozQrnn4FFy8xtVnMfxpB9JlRBOT/jGg/QidnotrgtIqqwu8C
	7M5wASBIwHGpznO/yFdtQO41LQo7E4dnWxaIqmLhAShOvWMHzchGYjt9N9pjAki2Gwzi2MyIfGOt5
	uVuGNLjd1IDjES5khmW3tr3+i7bMFU9jCZkep8WmW1Pjz3XNGhLhkW2n4LxdoE47tdmm/gj+XNsk4
	R3KJixt6RUOA6JDzmtxkvFsVklvpG8MWGTWFKqQq+z29dB1kUMMjX1SNwdyE3pydGfuIUF4dQe/Ad
	Fxibdq4LWY6ofXruV5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7VPS-0000000B7m7-0NnH;
	Sun, 03 Nov 2024 07:52:30 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7VNc-0000000B7Px-1Czv
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 07:50:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71e5130832aso2546303b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 00:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730620235; x=1731225035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82bL6EfqhZebZA3MSW+F+KvuGIbomic+Z5nBkECZIRE=;
        b=fOMPe61X25XqsAI+zvvgCsCzXpC6LHNX3abpYvk2+6tnvhPEJO5JifrpsYmRxuyYsa
         q3O+CmsepReHax2OC7Xj+xgQ+k/AdQKoonjahZcK5r1Kpeiv08mq7ZctPHtsw9OP3ERK
         4uLI16UByn2Ty1eL74D780TClNslKKzdxDw9KAhDEVxeOyljuHBUa8Wucjkc5Pd1Ncug
         Yq1ROcu8YqQWkHGc32Ykv7wWRkXf4pBvO+3fLpjez6cFqC7mQLoM1Eeo57yV5m64jf++
         QoxaiwTufQbb4WrtmGYrMRH5TmpvQi9pP4K/q2QXgQoN/uPtZF1A8HE7R6YYJR6KE4A0
         J1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730620235; x=1731225035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82bL6EfqhZebZA3MSW+F+KvuGIbomic+Z5nBkECZIRE=;
        b=CLxvcfVgihZMQG8qb5lBewr8LjT9hBH15k7cxX9z58t2QECRjdmz30WR5TUlPh0Te7
         vAz+yxfvSt2z6usx7fnsjPdH9chW7S8WciSCd6N8mmnyz9iY+9ECx70E31UL5gHu7X3B
         Q4LvnHABj+4/CCS0P+qLihPVg007EiNto/dh/pFZ8tBTjJLwm1SzsdcOQJ11t2Hk3OAR
         8X3397jjOr/nVoBzNt10WH8g+9rqPqbu6rly5awhZHPi7W84K+eRJqqqhfDHo/3jgZEw
         ZfKOmArIImQ/ycjLeMLVF0vylemqho6xiJx3x1Igwyk36HdpEFTyMy6lzMmaZPTJIGfQ
         bchQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjMzPEUoWnD01jh91awwMCPcX3F4l7nDu/0L1bp0Xd8wO7vieIIrM/89uIgnGe5CIrVRxS3podPeot8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGeTScBVpld5Q0CQ6onfQ83RRnVfO5gsUDPMFv6auKbtJld3L5
	4k7xDKKY4POTpK2MIIhPZ1TCgCAEYg+fqQdEu7hugP9mDAeURlk7
X-Google-Smtp-Source: AGHT+IGNqdouYxdkDsVliutvXVfWyle9vrcba18CRK5k+mamY2ZvMxPTcLzeO3RmTrXDAE4yyxkH6g==
X-Received: by 2002:a05:6a21:6d96:b0:1d9:76a3:a208 with SMTP id adf61e73a8af0-1dba553b9b6mr14226296637.47.1730620235136;
        Sun, 03 Nov 2024 00:50:35 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc31874bsm5201367b3a.213.2024.11.03.00.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:50:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] riscv: Add bfloat16 instruction support
Date: Sun,  3 Nov 2024 15:49:54 +0800
Message-ID: <20241103074959.1135240-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_005036_351885_97C0A024 
X-CRM114-Status: UNSURE (   6.51  )
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

Add description for the BFloat16 precision Floating-Point ISA extension,
(Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
("Added Chapter title to BF16") of the riscv-isa-manual.

Changed from v1:
1. add missing code in sys_hwprobe.c

Inochi Amaoto (3):
  dt-bindings: riscv: add bfloat16 ISA extension description
  riscv: add ISA extension parsing for bfloat16 ISA extension
  riscv: hwprobe: export bfloat16 ISA extension

 Documentation/arch/riscv/hwprobe.rst          | 12 +++++
 .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  3 ++
 arch/riscv/include/uapi/asm/hwprobe.h         |  3 ++
 arch/riscv/kernel/cpufeature.c                |  3 ++
 arch/riscv/kernel/sys_hwprobe.c               |  3 ++
 6 files changed, 69 insertions(+)

--
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
