Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A05C3ABDE
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QC00/uZw/dyZ77gwg27APonHfZYpmB3J4ceVLlJfGvI=; b=q4UIi9m6FLknhW
	1DH7p2liKjWL50qHvPNmF47IjP4Ewj+bOa3OTBxtYCy9CSQMOc1YNSozuwSUx+MZGuZZbLTZAhNcN
	U7VykR0DwVo8RbkxkWd6J7/HeggNHSSIcnA1jkXkt60kN7Xdf6tjoTLEgK4n+JXVuc+xMpSkXO3uK
	NqvFitNoffgqcklbcn8G1Ro0Jqrpe6NWnaLART8D5sx0VEqXuMBI1kEXDDjlZHDiqB59sA3EUMYLI
	/FmA3tDXMMA4xLovT2nOa3fddVEASzAgQNBg+Z6SQQnekXoj2M1xJudpLbwGI8X/1G6oaNaiOtccW
	XJHcHd5lVRW1xx1I/b0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDGL-0000000FRBp-1hmk;
	Wed, 14 May 2025 14:39:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCnh-0000000FN77-39Up
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 14:09:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22e5df32197so69181575ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231776; x=1747836576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn73ykHloddZuPbAEU3+QOc70jop2fReDsUopGcz0T8=;
        b=XVgPeD1M01dj9RCGMU/90yM6O09hxfpEJu4Z7tsltR80YgBp/Vp7AjA+Erk84rIHl4
         NVsgwwzF8QRSxXyU0DL0e+SjduKOzK/8aB+zVBhfDMiWTQ/4VGkgfjsT/K8Yl2g/nozK
         aOs2opuUE5Z52JcB+3yUQvBPpMe4mmJdoR8fqaQjn9ngfpbDKT8w5HSuYynT0casLHgD
         i44ZrfzZGRsMVAKgNXyZ6guA2vlyLYG0pOSiLqOKWedfNsR1fZuX7+cRHsfJTCnxr3Th
         LFwmsMvhKbUjIMfxs75+Uzpk5xfFpGc5uqxqZjzOmcfjctOyYQvWmWpZZpNMOCLwzQa0
         IkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231776; x=1747836576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nn73ykHloddZuPbAEU3+QOc70jop2fReDsUopGcz0T8=;
        b=ky+TnNxKoZHS1xxbjVxrLhjn13DFQIPApmdBpr03xpE/ySRW+ti6ae+SnfvWqm1ONN
         8lHnWOD6AHHY5b1MZdvj9fyMiSyTmw9+riEU7Efp27Ru4lbihsJLXIQbjelRijwjzsOs
         B/3cubkCTlHCjw8RDHsSJlB+sKfPK5M+Tsv4tuRpzeL4Aw9Ly9mJ+f+//HpPCj7Lm6fZ
         4G38jkUwgGIxKaTvmNEvi2ZqnQB6CWNQQgolG8nAG4WsEfsGlrRIdcFMbAp9f4S9djZX
         qfntqQvcb1OaPvF3B2neyggzDR+g6tmmZLxSJUXwlWD2QgS+5W1mMcshSzTCLvRiI6Dj
         Q94Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFAGb2lQrfZgb7N9fSYCwZO4Z+XWPntHCOt2ZaxcFSARtV2H1qGZvuNb1pomM3F+zwyc2SOlwY8gazzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2ZVvxVKv9goXbIIcCm+VtWvFaD+CS7tmWa2saRdR+mTRbbVOg
	BOqPBL2U9OwiYTJMIgLcvQYkNXvV7R+VO2LicdLbpT1YeX+oFYkz
X-Gm-Gg: ASbGncvxeLFDKV+jpdnfwOx8Ys9P9g6WnyUw0+lEODz+BBFvAPhEB+QJymf0NXJWwXu
	rPW20zDdMftIlOVkaRp0mCCOmChpIvGJXr7XpIOBzNGPe+w21sKwUzpsdH/szUf+5aRpcs0lYwb
	J913CYOLhYGT6oWpjSFq2c+Wx6EzKegb6dCqiNIXZUfbVpfYgz8MF9+SPZWkrRBMjzCtp21Sj9O
	JhyWD4LEd2VE945RxjdYJgYbbGyv+zjDbCupj+GfPr3zi/JxRdVekgfPU3rd34sq1EUC75d1/mB
	zet6gRhKG0tU+BwdRDivVWxNlrGoXQUwKswk93D2XVtw9eNOoJLwfCRujqNj+w==
X-Google-Smtp-Source: AGHT+IGYPQ7AEh2PEScl/20vslZRXfRKA3Io3uLpuFyktZVo/du/cwLIS5UZo4wt53W5E1XOpkOfgw==
X-Received: by 2002:a17:902:e545:b0:224:26f2:97d6 with SMTP id d9443c01a7336-2319816e59bmr61090345ad.28.1747231775439;
        Wed, 14 May 2025 07:09:35 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:34 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add Sophgo EVB V1/V2 Board support
Date: Wed, 14 May 2025 22:08:58 +0800
Message-ID: <cover.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_070937_789948_C1EFF0BC 
X-CRM114-Status: UNSURE (   8.28  )
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

Sophgo EVB V1/V2 [1][2] is a prototype board based on SOPHON SG2042 [3].
There are many of these two boards in the hands of developers.

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Added ethernet support based on [4].

Changed from v1:
1. replace "sophgo,sg2042-x8/4-evb" with "sophgo,sg2042-evb-v1/2".
2. replace "Sophgo SG2042 X8/X4 EVB" with "Sophgo SG2042 EVB V1.X/V2.0".
v1: https://lore.kernel.org/linux-riscv/cover.1746811744.git.rabenda.cn@gmail.com/

Thanks,
Han

[1]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB
[2]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB
[3]: https://en.sophgo.com/product/introduce/sg2042.html
[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.com/

Han Gao (4):
  dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X bindings
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
  dt-bindings: riscv: add Sophgo SG2042_EVB_V2.0 bindings
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree

 .../devicetree/bindings/riscv/sophgo.yaml     |   2 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  | 247 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  | 235 +++++++++++++++++
 4 files changed, 486 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts


base-commit: 550de367614f7a9a0c1d40d7e19764aa9305009a
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
prerequisite-patch-id: 84d1e1637549f632729eaeb7cf935ca78a642fe3
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
