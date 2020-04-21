Return-Path: <SRS0=1Rer=6F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9487FC55182
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 08:18:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B2632073A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 08:18:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tVebrrTx";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="maGq02Kd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B2632073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fIbpi7O6WJugTXFmCQCTQurXX9axhW0Esg76IWWTzRM=; b=tVebrrTxjudPe2
	MiY96Cweulax0Bxq1FJwD+ldfZNgs8gwyYp7S3HB9CPV1LPDdvkvxxpIBTr1VIFw2I3w9tNUE8kK9
	70g0TcWXct0Vq/yQMuBtrvL4glcu5W03kSlwsWtp4iHmLLHmhoDa9Ux8/+YejFAJQijqxAfMI0Vmi
	OQdL/p7ia3EVo+I04sQz2WQGj0ELccgxV2jlnfIGssyOZHJr3olNEl9G7seyBDMxa754//vKdGE05
	M2bbQ6EB5dTOQIz9Fp2cZ/1w+esWr1EL/RsGxKshF/O1jTI/6Rghse+nTl12MtN7X+MqdSsr8kQ2b
	64MmZ2RTjPbQwrsncqyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQo6T-0007v0-10; Tue, 21 Apr 2020 08:18:01 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQo5u-0007OW-3e
 for linux-riscv@lists.infradead.org; Tue, 21 Apr 2020 08:17:28 +0000
Received: by mail-pj1-x1041.google.com with SMTP id y6so555030pjc.4
 for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2020 01:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fIbpi7O6WJugTXFmCQCTQurXX9axhW0Esg76IWWTzRM=;
 b=maGq02KdAVVk27vQzcEjc+9Aj6eXZN5V2r9JEffWU+jLG6K5d3N6SCP/HPXtkbM6AK
 RhIjAxrGcbKW+dxQcT37HVZbsVXOjfjTQmpLWjKW209TaIKpir/7hJPTkkBmCv3Rfcls
 Md48rNfmNv79Zp4dZ//dMeuzz0fSSFNgW57QglHqXwr3A1P3Xk0/wcC0wb6mJa4hkW37
 c05pY5whmZVrBy3NEhbbYVPdXi5F6QCxP3xEheuk3vt5UkgEocij/Srp/xIeqjVJCj5+
 gS5hzy/yP4GJRnptmpCjpcdIj8LFjzEWpsJv9d+HgnD8+ovaGjhh0AH59EP3jfZtHWP/
 6/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fIbpi7O6WJugTXFmCQCTQurXX9axhW0Esg76IWWTzRM=;
 b=pCz7C787ZvdIqYCt7/3vrkJIfgmEtuNtee9nWgTDBUJFb8j6V8o+0Uxq46pWjt6Vvp
 FlnTwd2Vm+sybMMqChImwzLcKcYYNLgyjJRm6LvmKFti2V0wLOueP3WcHve18GLY2C0v
 9D5d0SOEFoR9IADcIUyHE678Bun4vI9vuUpdxn02/FDKNH1RoxuqSI6gj6rEUDD5UtbW
 SfUQ6LOBOiqmSoQF9PS1ihPrtAiWhFDtGhZ3LWY5h+JALE9qER6cnuu1Khn0EtitEE2n
 DMlHduVNHoZ4JSYl3Mv999plfTR6nUxYc4kwfITu8JERPNuYqjAA5QASTpuYgMSLC6U9
 xmWg==
X-Gm-Message-State: AGi0PuajREX0HQFtXVxpjzToCZS9tUPHPrAUUYgO+Bk/4h1r0dFMDa3D
 XigpCPuhVp0vDx8cx7ADu+YiqQ==
X-Google-Smtp-Source: APiQypLLHyb++yTAlD6wehS7jB/h9oebLCuGheJNM864LJqIFw1n0PbffrUmSWn8iBeylKnoopk9/Q==
X-Received: by 2002:a17:90a:498a:: with SMTP id
 d10mr4369781pjh.194.1587457045415; 
 Tue, 21 Apr 2020 01:17:25 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v9sm1610067pju.3.2020.04.21.01.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:17:24 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org, hpa@zytor.com, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] Extract DEBUG_WX to shared use.
Date: Tue, 21 Apr 2020 16:17:11 +0800
Message-Id: <cover.1587455584.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_011726_685049_BB28CE8F 
X-CRM114-Status: UNSURE (   5.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Some architectures support DEBUG_WX function, it's verbatim from each
others, so extract to mm/Kconfig.debug for shared use.

PPC and ARM ports don't support generic page dumper yet, so we only
refine x86 and arm64 port in this patch series.

For RISC-V port, the DEBUG_WX support depends on other patches which
be merged already:
  - RISC-V page table dumper
  - Support strict kernel memory permissions for security

Zong Li (4):
  mm: add DEBUG_WX support
  riscv: support DEBUG_WX
  x86: mm: use ARCH_HAS_DEBUG_WX instead of arch defined
  arm64: mm: use ARCH_HAS_DEBUG_WX instead of arch defined

 arch/arm64/Kconfig              |  1 +
 arch/arm64/Kconfig.debug        | 29 -----------------------------
 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/ptdump.h |  6 ++++++
 arch/riscv/mm/init.c            |  3 +++
 arch/x86/Kconfig                |  1 +
 arch/x86/Kconfig.debug          | 27 ---------------------------
 mm/Kconfig.debug                | 33 +++++++++++++++++++++++++++++++++
 8 files changed, 45 insertions(+), 56 deletions(-)

-- 
2.26.1


