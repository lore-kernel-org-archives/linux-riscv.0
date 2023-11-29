Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DF2C07E97
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Et5nVCFd+Vi0vvZzTPctrzu6bdtY3/0NKTzqr7ZWZcE=; b=gdyrv6rFFuYGLu
	6nri3faZ/8lKmrroc3oNjW76isT37pIxvY28230B9doYIA54539YuQoOBibuBBomvZeUjLdHjUg1Y
	YU4H9m9Y3fGWxW0A+Afjzt/Y3tNT18kPDWPIZzE4LdaJVDOBO7Jy9O3RxCIfkrdnvhAyJjVgpKcSe
	yZksrc+zTH+2xmth1DXOhMZfmvr2Wziuo4khpnG0VjTh+tSo8fOvrFjsQ5FEf3UpjCHxjFtVzDlGM
	er/utXgWjPc4/CsA4sOAZ6PzMKzk5uPTXALeGD30lpR2DGZR4ExDXSk1g+tKpRvvaqLMH27gCBGgI
	/nMTASD8y6KjRn7yOFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ipg-0088XN-2w;
	Wed, 29 Nov 2023 11:34:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ipe-0088VM-2F
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 11:34:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-332d5c852a0so4171634f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 03:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701257656; x=1701862456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RawA93PtztsXjd46Xm/FvUzLSqM6WJrs7Op20maKa9w=;
        b=L4hySjrj56rgurSkDQH5fNyG+MNYlRqPMOskeBM6KxejilGBxMz94cYJwlXFfSf3/X
         zNvnexoXNSKbvhn7BxGo+SQe2pG3Wu95k0/Bf0xwHiaO80fXsYrSJNon4OBErcoBRQQf
         lBY7rGyxJ/YyFeGzzlpyVxEbhgzALD5s0aIKG435vcLukfMG9Bs3ieT0elRnNeKUapqL
         J5ri2QDTMW/fj1OsDC36AeNQ1xf8PJ9FAmNBFZXTAj9ULwKwY+1igDa3dKqqTPUFsZL1
         F3W6xgU3wJB3Ucw5jjF7SimjEm0ezmfOqdUQEs0B++i4O3qMTP8Lh/s8jA8+luobrefC
         2MdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257656; x=1701862456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RawA93PtztsXjd46Xm/FvUzLSqM6WJrs7Op20maKa9w=;
        b=PjPZVBrrDcbtbiY7mZhYIGuFdjik/bByWIzWKnkIQqxZPJV33T98LoxvTcEQRChiko
         GAntEbRvDkxu+aGgeLoN5fTFL7goXIgMEDF79JV1A/Uenm7MORgRxL5ALm19diwZKBfW
         YCS+AiseioxMVSdNHaEPjlB41c+jiFRACt4OqvSxZzpB9aYIfl7T6I/cIV867Ar9PBgf
         7/zR+nWomxfexmmXKq/ohbqq2yqjeNmCQpj4sap8my3pR/MKHgyI+kLkBjr4rXwCYmoV
         AjzLxUp/6cBuNNfnb/0j2r9ST+xMQb9alA81gc8K+re/UvS7IcYN2BeKsrHKeGvKoIjg
         w7Ow==
X-Gm-Message-State: AOJu0Yw+XTZCfvY/SwCC+z+lqfYdeY43ykncggcBfh6ZtxLrYw7Ajzat
	Yx/xAdnvIRGt2bZFWXBl0tDoGe47Abz1S/XIbQk=
X-Google-Smtp-Source: AGHT+IEzpeh8ZXJOhoEjVLxQHQQXz20Ef7/8cv4LMh3UxDE6piEIupMfcrjorEp17RGaMZTIZNhgqQ==
X-Received: by 2002:adf:9dcc:0:b0:333:156:91da with SMTP id q12-20020adf9dcc000000b00333015691damr6722354wre.36.1701257655581;
        Wed, 29 Nov 2023 03:34:15 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f2-20020adffcc2000000b0033315876d3esm1879350wrs.12.2023.11.29.03.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:34:15 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	samuel.holland@sifive.com
Subject: [PATCH v2 0/1] riscv: Introduce system suspend support
Date: Wed, 29 Nov 2023 12:34:15 +0100
Message-ID: <20231129113414.41661-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_033418_744008_5F980EE4 
X-CRM114-Status: GOOD (  11.24  )
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

OpenSBI v1.3 and later supports the SUSP SBI extension which has recently
been frozen with the freezing of SBI 2.0. This one patch series adds
system suspend support to Linux, which implements "suspend-to-RAM". To
use it, build the kernel with CONFIG_SUSPEND, boot on a platform which
supports system suspend, and then issue 'echo mem > /sys/power/state'.
It's also possible to test this Linux support on a platform without
system suspend by using OpenSBI's system suspend test support. To enable
test support add

      opensbi-domains {
          compatible = "opensbi,domain,config";
          system-suspend-test;
      };

to the chosen node of the device tree. With the test node present,
OpenSBI will wait 5 seconds on a suspend and then kick a resume.

Changes for v2:
  - Rebase on v6.7-rc1
  - Added check for SBI spec version 2.0, which is the first ratified
    spec version with SUSP [Conor, Anup]
  - Picked up t-b from Samuel

Changes for v1:
  - Rebase on v6.6-rc1 -- only minor Kconfig change needed

Changes for RFC-v2:
  - RISCV_SBI dependency [Conor]
  - Rename SBI_EXT_SUSP_SUSPEND to SBI_EXT_SUSP_SYSTEM_SUSPEND and
    SBI_SUSP_SLEEP_TYPE_SUSPEND to SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM [Ley Foon]

Andrew Jones (1):
  riscv: sbi: Introduce system suspend support

 arch/riscv/Kconfig           |  6 ++++-
 arch/riscv/include/asm/sbi.h |  9 ++++++++
 arch/riscv/kernel/suspend.c  | 44 ++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
