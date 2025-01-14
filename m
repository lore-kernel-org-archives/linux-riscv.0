Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685F0C02180
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 02:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o9G7EORojQq2BDGmuvwoXb+9mhAmxZGxj1iKK89HdGY=; b=llT3BSwy3te4y5
	XQU/UVIhOZQcMCzmMI4x6oa0yrqteQFdOp5Doa5dqDdCN5ifMINTUPPMlOP8a7agiqQL1ovEUHWE8
	44AVMeWzEwFqdI5RbkgcsHFmbGAlzx15tHpCIp6ucYZLuPG7+s/zKZtu9JHbFtb7eo9czLW5mvXM1
	4zxZqJ9i4FEJyDxWsBrrK4b02hzTlds1HPamcPYoclpMPqwY4dooDFH6CP51HSkPHY4tvw3vY1dIJ
	qYE1zJF309tRN3ZIq+AxRBMyFuvQpzlNvnJOUhpe0j3GfC2OJfTwbp4X+TWbXmnWf4bHHGSYPWEWs
	vjvQdcm/YQE8Ca6i8d7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWXO-00000007EEF-2xXm;
	Tue, 14 Jan 2025 02:20:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWXM-00000007EDX-12fl
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 02:20:13 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-216401de828so81768295ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 18:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736821210; x=1737426010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q09J7qEcp3rrZoNB/+VeCmI2iCaPt+jfy+7tftGYhzw=;
        b=Xs5Pe0fFUW6NhcjsVEKVnahvq1gwGBxp7TzWRqcBU5QMxZPBUIZQ7r3MGa4Tief4RK
         D4EbvtTPQiE/x2QrCXLzxgdrgbgz19eJnbFny4QXc6krYnHzinR5vrJG1Xlkow4Ri/ht
         Vnh751nSfTEtgqZkZkLoWF1I7yZMYKPEX9YY1ZWC9EZa2JbdcB+3dV+59Wu4PDE2sDvb
         oAp31ZrWRQAEut2684dXDpt9r2gXr8SEILMCtzf4H/GDd5szovH7hBmNgQVmhDHf4LUz
         cOqe5aWnAReibW9jMPQtxK6qhg90AUf2UC5buvg9Rz5GnrsqpdlROYFy0ux/9NqCvV21
         xZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736821210; x=1737426010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q09J7qEcp3rrZoNB/+VeCmI2iCaPt+jfy+7tftGYhzw=;
        b=gRQmsvhXf04+O0fdDy6KlcIEGOq4XFSU9BDOUDORPxqiJ7kvFmNKvfB1Bs+7/cUc6t
         NbZwRkQVtzWgqxJQxh2vyjxyA/YuOt8/vXsj/mUtIJj2vSGHbb7jtBisA8qQsX/TXhTP
         7TnnwNbk9H41ZhTSjN1hhliI6HCoHOp2gj0pJK20kecxChXfk55IROCtpih8a/0ZEW2E
         mNz4S7z73Ps7u/AukS6hiGs0zuKtrwiUHrgZfklLbnk7WFITJVxcBOceUr/zVlbDf75e
         8LrIrevY+zf1hsxaq5rZeHqci++c41MwwQWFUnQSCkiLwqO+DpOBj3KwBe5QZOHbl7uQ
         3rEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDtpiOyihp/eTZVTyakGHAhDjzoiJtzttxujiU7cxNze5vORgXwj1+UfH7472+3M7j8BVBtnx3u9ep6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBpFpNvmeXNL0elZ3v/dSeVkNVWsyrbTb7P6JDpGL+zHrjJ/Pc
	a6KExAYT/2b24l2jFot9qRUm09kIslGeFR/kQF44kqfm4Z17iPPI7fhdgjWGzh8=
X-Gm-Gg: ASbGncuu3nGICyqqpJPeZu1dKnt/gdXqU0Wdi6vtMgICfpw4RXFKa39e/ogN9QmhzIX
	qnyjcEjAa+W4SB2P7khwptck7Jy7ZzT5lm/dPak6HVdb87Nz74+Ycl3XB6xBNUcPtXlarLyJZ12
	/U5SKLXxXx1n5sW9GosEOh2SBxttSQPZtLOLCE1SEJa6sOFwMyRA9p9ihIqtERxawCAfxhnt+Yb
	K0rllb1vjfIaQlJQcQ2XL5VabiL0q7XUQA/CQIO1LvfoDnxjerrdVZlirq3qz/CuaYKKXIcLQoM
	SY3KEshQrPLC3lc=
X-Google-Smtp-Source: AGHT+IGVvtg7HHpVAFKIVBm03FD1c07xkEL1bUokr4zs3LVVlfXFzTjyIZLaAOZOhim/RI2TecAjXA==
X-Received: by 2002:a17:902:e545:b0:215:4a31:47d8 with SMTP id d9443c01a7336-21a83f36d79mr330978925ad.9.1736821210574;
        Mon, 13 Jan 2025 18:20:10 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f217b38sm58948065ad.145.2025.01.13.18.20.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 18:20:10 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v4 0/3] Enable Zicbom in usermode
Date: Tue, 14 Jan 2025 10:19:33 +0800
Message-Id: <20250114021936.17234-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_182012_504464_CF104E04 
X-CRM114-Status: UNSURE (   5.45  )
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

v1/v2: 
There is only the first patch: RISC-V: Enable cbo.clean/flush in usermode,
which mainly removes the enabling of cbo.inval in user mode.

v3:
Add the functionality of Expose Zicbom and selftests for Zicbom.

v4:
Modify the order of macros, The test_no_cbo_inval function is added
separately.

Yunhui Cui (3):
  RISC-V: Enable cbo.clean/flush in usermode
  RISC-V: hwprobe: Expose Zicbom extension and its block size
  RISC-V: selftests: Add TEST_ZICBOM into CBO tests

 Documentation/arch/riscv/hwprobe.rst        |  6 ++
 arch/riscv/include/asm/hwprobe.h            |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
 arch/riscv/kernel/cpufeature.c              |  8 +++
 arch/riscv/kernel/sys_hwprobe.c             |  6 ++
 tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
 6 files changed, 78 insertions(+), 12 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
