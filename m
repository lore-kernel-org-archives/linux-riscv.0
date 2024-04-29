Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EA6C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 22:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TdaoQaLI+tC73SVXlvzPuACWnM34vn3T6ZruKBTtad0=; b=iz6aKqWpeDK5Ca
	eStCQnT/GLBbpzYlumCuXcHImNaAJERiqDMefZ7t4liu+wsnBGCJOYaneL4e1gKt/FjQAlfRzLq0c
	eYSy42kMnj9XDfSvdm93D/35x60eWRIqmryDsol2O45QCuxKYVowLrjTe8gqL1iIMBX7lL+1DHfeM
	eq68PXoIy0MsrUm8LW8aGNObnPeKKxULYP/xtmNaeFtHZBhb+38XPmeBXzH+DCkLvHVgJXfZ4CAcQ
	KtuoTr8+iA3Ss56WR5tMyvAlQpMeC07tlpcz1OYjJGSWt1iQ0lXy89Zg026Y18Gzmx14k5/0KrJcX
	jAENsLblXQZqkg4BQ0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ZVh-00000004NXJ-1Z87;
	Mon, 29 Apr 2024 22:30:09 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ZVd-00000004NVQ-1KgB
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 22:30:07 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5f7fc45fe1bso3987199a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 15:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714429801; x=1715034601; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGmL3GuKmY1H42lgMEV/4/Oq9o75wu7J38VSJ3m+Rqw=;
        b=suWU4jRNaUbK0kFNLNlrEhw8nePOfA9Ej55cVBlkiRwH6eHVB8xnD7LbI+BsuAvRs7
         UckaoGq1YrePvnqX3AI/pFiFvUFuTAv4iGQZJA6tm1fOeRL1VJZt3sHh6mRFbFyWSQTa
         L6pqvySkniV5hhozO4mTHykU6N982yDmV2jw2vutZ1h+M2yM2MK9utULmzDCgAJYUI7l
         PWIm5Wim0ofZGVm69kQeJHeecDcw7oG/d/6mq+niKq1sKuTUPktSc0bSp5QamW57THUi
         MfH6Mp/vQRhMrehNRbYl5LVKP7tm7F2d30fRkIFO31fRKCFqHWXt/kmhcoy/H3x+K1X9
         95vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714429801; x=1715034601;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGmL3GuKmY1H42lgMEV/4/Oq9o75wu7J38VSJ3m+Rqw=;
        b=Wb1pgXD3rZ3Iw4HRj09rtZ8CV9UuHYCb6LDgHpBnpAlX+K8Lgo/nCstR1vTdtCQw08
         SFr3bYBekhw62Ic89EQS9QvCsQlwBdI649KSAAFcV2pTDsdtSoXgn5IvWP5DGmtWjtFQ
         0FAd0wp2dWPQrSj519Rha4WALvOI6ayX3xQgzFQnN27POPGU4RDgHApCtCBgi0JhLGHN
         vi/14ZrEvPOdxJNTANWBglGh6qal0cBeOtfB1e7dqMcQ80Up1BLPuS65jqchwJRvzTYC
         l6CQcLEfzZqG15Fm/RN0mQhotORf9SK/XoPM0ZZXZ+pFgAJUOM91JY5d3dmupeZ8XQg7
         UnmA==
X-Forwarded-Encrypted: i=1; AJvYcCXo56/3Q8BlvunTprlKk32WrisiK8CQpPNd1Jpj9WcWwXOGyAIAZ8TSG+dDP4x9kH81m1Ve2elgJzCXStMaz9tQdeeBpJZEff4kkNiVyLwp
X-Gm-Message-State: AOJu0YxrEbJcg/X17eXwNeFQP7MHvSutkRrLcLleFrHzvSZJ9E9Deh+j
	+AVKO+frVzx2xtvtNgTo5aftqMLFSMXu7kM0RZV/T/OlNWU6YsfT07FSFxsCp+Y=
X-Google-Smtp-Source: AGHT+IEF8OlozRoQce0HwZQGpZ8kYidr5kizYc38QfjcOVCk2gTvkPg51in4Fx1/8xbTKpgZTRq8gA==
X-Received: by 2002:a05:6a20:244a:b0:1a9:c33f:224f with SMTP id t10-20020a056a20244a00b001a9c33f224fmr15161040pzc.16.1714429801055;
        Mon, 29 Apr 2024 15:30:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b001e0942da6c7sm20794013pls.284.2024.04.29.15.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 15:30:00 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/2] riscv: Extension parsing fixes
Date: Mon, 29 Apr 2024 15:29:50 -0700
Message-Id: <20240429-cpufeature_fixes-v3-0-6aa11dde513b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAF8fMGYC/33NQQ6CMBAF0KuQWVtDp4WqK+9hjIEyyCykpIVGQ
 7i7hZUxxuX/k/9mhkCeKcApm8FT5MCuT0HtMrBd1d9JcJMyYI4616iFHaaWqnHydGv5SUEcZU1
 WN+aoyECaDZ62Q1pdril3HEbnX9uHKNf2DxalyEVxKMioBhHL+uw5usC93Vv3gNWL+GmUPwxMh
 lHGaI21VGi+jGVZ3mjYqqT3AAAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714429799; l=2034;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=fvClvK1leB3WxFOLHKqvaBOMT13Gn6BJXWn5UVbIdeY=;
 b=adaWLTF44UudJs4IA0A6KturrVGuVi+n/7nKiVF7xGWLglYddK/1JMAh4nS3mrBUTwSi4dYa5
 B7oyLe7zT1eDbCGy3153GncO7EaR6UDk4FgYK0ITxNtr8ZKxysr/YjJ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_153005_404952_284A05A8 
X-CRM114-Status: GOOD (  11.01  )
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

This series contains two minor fixes for the extension parsing in
cpufeature.c.

Some T-Head boards without vector 1.0 support report "v" in the isa
string in their DT which will cause the kernel to run vector code. The
code to blacklist "v" from these boards was doing so by using
riscv_cached_mvendorid() which has not been populated at the time of
extension parsing. This fix instead greedily reads the mvendorid CSR of
the boot hart to determine if the cpu is from T-Head.

The other fix is for an incorrect indexing bug. riscv extensions
sometimes imply other extensions. When adding these "subset" extensions
to the hardware capabilities array, they need to be checked if they are
valid. The current code only checks if the extension that is including
other extensions is valid and not the subset extensions.  

These patches were previously included in:
https://lore.kernel.org/lkml/20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v3:
- Change comment about assuming all harts have the same vendorid/archid,
  to just state that only the boot hart is probed.
- Link to v2: https://lore.kernel.org/r/20240426-cpufeature_fixes-v2-0-7377442b1327@rivosinc.com

Changes in v2:
- Move comment about assuming all harts to have the same vendorid/archid
  to apply specifically to the code that expects that (Drew)
- Link to v1: https://lore.kernel.org/r/20240424-cpufeature_fixes-v1-0-585e73d2226b@rivosinc.com

---
Charlie Jenkins (2):
      riscv: cpufeature: Fix thead vector hwcap removal
      riscv: cpufeature: Fix extension subset checking

 arch/riscv/include/asm/sbi.h   |  2 ++
 arch/riscv/kernel/cpu.c        | 40 ++++++++++++++++++++++++++++++++++++----
 arch/riscv/kernel/cpufeature.c | 12 +++++++++---
 3 files changed, 47 insertions(+), 7 deletions(-)
---
base-commit: ed30a4a51bb196781c8058073ea720133a65596f
change-id: 20240424-cpufeature_fixes-91bec4d793e7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
