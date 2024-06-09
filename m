Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE98C27C53
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jun 2024 11:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O/EUaF4d3NRSZXNUMG7t7KBn2SvE0pxRgQaWr8YR2cw=; b=eAY1V/iO97/1CL
	RcRmwiAEGec8VgpdEs7nKRsbA0MW0X7weFCIInHGALjSj3sjGDAkAO6if/FBIJA+B2B732co3i+cm
	yc++2BiY2B9hwgnNvvNV4qQkeRXUY2845iOupkOc0faFpRqjuemu7CATHBKBvWQBwU/ZNQZxTsr+v
	jhhw7m2PTG0VV186XVqdzoINFM4/UWzetG0cnNIH/ZYu/cs9WhdmH1rMTYtJowFbhZXhNF/oyFIjz
	/TYGd9pzxDien4XWT/LReq6PzN8UGhYXhzLxWjsJo3jSGyZJ+v+O7kPkvQLWlr6eYQQxQ/RPSsYYb
	bI+9qmiBx0NMVm6jzlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGGc3-00000002Tzh-0HTc;
	Sun, 09 Jun 2024 11:21:27 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGGbz-00000002Tyy-0Mc9
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jun 2024 11:21:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f658800344so28151625ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717932079; x=1718536879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RkJz7STlGmWW8jD0TSVOv8fdv0p5pL3iIjahqzVhas=;
        b=Qe1QFu8quY8NbdXWvRJzV57BMJjfg+IXCXJtDhFNPoYRMWxEDVdef8NUq88bPkUqyG
         Y5jijUKymgHSkROMvFn/jedN2Bp85rvTCPcekmTuhU1nf1TTW8zu8Err4JOn9QEjrr52
         Z7oEHDEA/yahnfY7JPkbJ6m4mMchWckZjcE3nPlrRoa0Fj7qbSn4qGgLTmUAZCv627kA
         YDYNOMSNxZecwUqG68hrWh09nUmLMHg1yC6W5dTbxCUBIms8KI9Hhi2N4eYpag++Ue1+
         ejwnTMkYcSczD7yj/bgwYFEMsXkMpJyQAl2olap856w6LPptababaHYUIH/9egYHeXN4
         UUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717932079; x=1718536879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RkJz7STlGmWW8jD0TSVOv8fdv0p5pL3iIjahqzVhas=;
        b=CfE4A03U3QX/v7qWTh7131GxEDOGUSWhj9NUFlFZUKC9UjNxRMtUcX54VVl+gQhvaJ
         mkp9MSVktGKPE0K13MnbBjonKLMoahHcEfWAhjDEiLcqOjfZlNwSWzjYmWZVyo1O3HOR
         9kj0tm1CTkeVaI6R4fIKhHEZH04GG2szHXa0rLHaP6jY8jwK/ferKexnzagslxTbLO+T
         EuildozspYYKTniIqbTKvecQtvfStZoB49HNOn6gPxCvilNZc0UzD1i0Rdb9/r5Ul+ZQ
         keTgowqNvVBy6CISaOYMAoQO6M+mRJTKWKT5AFEfxsj0cI4BiJ6iYgw5pbuPGxikQ+s8
         N/yw==
X-Gm-Message-State: AOJu0YzDEe04baUzwX18G1Px9fTEU0vSeyVqx7y+s2ZiatrLH8PVIqvE
	e8pkLRFRia6YIVhwdcAlFVsUOqaiW6SaElZp9bb4RZskyMBi0jrcNc8B3CfmwHowyX/wB6YDFht
	l
X-Google-Smtp-Source: AGHT+IFog+F8+3CtcaQAB+IE2NjOh3YkhfJjv6SZ9tbLhc0+ydCcGWmNOlM33MkzDXR7SiIUO6y9Sw==
X-Received: by 2002:a17:902:da89:b0:1f6:ff9a:cee9 with SMTP id d9443c01a7336-1f6ff9ad07cmr31639975ad.58.1717932078923;
        Sun, 09 Jun 2024 04:21:18 -0700 (PDT)
Received: from ThinkPad-T490.. ([223.233.86.175])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1f7092a525esm8168355ad.241.2024.06.09.04.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 04:21:18 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 0/1] Risc-V Svinval support
Date: Sun,  9 Jun 2024 16:51:02 +0530
Message-Id: <20240609112103.285190-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_042123_172613_A3080AE4 
X-CRM114-Status: UNSURE (   8.34  )
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

This patch adds support for the Svinval extension as defined in the
Risc V Privileged specification. 
Changes in v6:
- Rebase on latest torvalds/master

Changes in v5:
- Reduce tlb flush threshold to 64
- Improve implementation of local_flush_tlb* functions

Changes in v4:
- Rebase and refactor as per latest changes on torvalds/master
- Drop patch 1 in the series

Changes in v3:
- Fix incorrect vma used for sinval instructions
- Use unified static key mechanism for svinval
- Rebased on torvalds/master

Changes in v2:
- Rebased on 5.18-rc3
- update riscv_fill_hwcap to probe Svinval extension


Mayuresh Chitale (1):
  riscv: mm: Add support for Svinval extension

 arch/riscv/mm/tlbflush.c | 58 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
