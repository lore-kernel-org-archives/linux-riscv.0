Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AF7C021B2
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 00:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8RFTbK528Xc1jIXxXdKaqPr6xXtLMT8OC6e3K8L0jaA=; b=fDgpLPDGJoj/mj
	26WkYExoLX1vzYafLLZxe2IY5RN+yB02wGq+hpIxIQNo2+zvIZvMxO4IPzfKeu8A/JpQwX9MuRCGN
	KfS1cKpPDnEGSS4KrZLAgbRTgLsysqXHL4Z5FTcl5z7usSers6HNBpLnsvE5o6N4HMXWSh1t+xZIi
	A+SsfQziRaIWO/p40lwGkj4Hyq/1FbHgWBiF7kIZo+Zv0SEhJqKHC2QZHUnO1Hl6IbXJWZ/9zNyPU
	j+/YuqgfHEq7DZMaXKBB64MmDvodY8khxIE3px77fhezVRpONF9i1ujCyWKj8xgzQjSjZtNhm/ZXh
	lhljhWTOmzKWRsxPIG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGbm-00000003SJ7-03e0;
	Fri, 21 Feb 2025 00:09:34 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGbf-00000003SBd-3rdP
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 00:09:32 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3f1c94936c5so861592b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 16:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1740096566; x=1740701366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5RHohY8rfSaMQdVznrllxN3pGVzi32rdYlqu3XuSUA=;
        b=ND0wP0nd41c38335cVxg2SG3/qwkq/1gT/oX8MUg+aVZMkpmA1IqDMOurPmG9WPh+z
         r8saFrtjXC4xCi3SOtt6SVpM6NHgSWxYzg0c7IdOO3exQj3lMvm1rdfj5PD9pyaSB8ZM
         hF/3QxCMbQYPG4t4N6rdEbQ7jBq6wlrvUCy1b8dzT3uTc7gczNPVoiANjlnezqc4pDe4
         fQK69S5ec9+Sfw1Dt/0Escm7bzyR1prbRlegy3QPc1ZUtXqgEiZ6ZBTgZI0dhAZaoG2w
         hpXQYCx44JmOro7VBOk0owDOm80Di23cLKgebiOyd+tf1qcwG+MRVsMTV+cAbzEN4Ocl
         IH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740096566; x=1740701366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5RHohY8rfSaMQdVznrllxN3pGVzi32rdYlqu3XuSUA=;
        b=DFRqwqshPWYat3HwSVcNpey4gQbW5IHZX5kAIkegWqm7ihkVtih1W6Y10eHhNBaDvx
         ElWq72R0QWgcGFjGI2qyvWZ+dmw0Pk5zz2v2yBZHusFE3gFSe85vERERKWGHZOtO/ZRq
         5wrX41tMRTclqE7tUbUgH66+Wg48dgxX4V9axDdOWp+3zcG0oqqIJELrO7mlrPGA+xIm
         Z6/te0ywgP4/a36D9n3Gk9m9hs1/2g/D0Y9adwtiJDWD447B8bTQd8DP/Ad+3Nx1iXpK
         wNQBfYEzxUCbXXDQBAMSLKUJ1b/UJ3uHzTxkx7DlStud6B0AbXZOqdqjxGpP63f9PU+A
         omyg==
X-Gm-Message-State: AOJu0YyXQnm00hDtgHZbBf4wmqICgTuzlYvVPk1gFP+dLPqTQgvyLbrk
	/K0QFbfEXubb1RAgHPK1y2eV1Pwmvuo30/1McsEZzF6aBSsN6oQTtWd12U55kA==
X-Gm-Gg: ASbGnctvL2oxdryAppDRIoSU8GPGnVaLBPDoTWxm6dfgp0WOitliYiwvhHKYHeDrEzI
	qtcY0uQCT5eGfLNW1+aeGgcCApnoRY67DxCL1j6zG96ClBfLBwFYPIK2Chy7uv2BLFkwZzsJ9T9
	r2ZHp83X/ASBoZ+ZOFrnnNmXzNMN+YCU1P3cH/FvW++pCwt/a+oyfNiAu6xjH50V3vs84/6TZwf
	EwC71/9z70tIsBodgxABhcTCIivSzzs+8xrGVD40tWyJY6OgooYH8zNDjoM4/sLwc3DRzyMqzgV
	D6dtKIiTLvHAlICLCDwJAxxuw87JeUm3KQ==
X-Google-Smtp-Source: AGHT+IFLLufz7FCvALtBDLCNlSBShOP+uObi95wVRF1EC3vzov2bGxRF1xe20tQaoGmGTc5DR9TQmw==
X-Received: by 2002:a05:6808:3987:b0:3f4:9e6:fb7 with SMTP id 5614622812f47-3f424c163c7mr1180195b6e.1.1740096566280;
        Thu, 20 Feb 2025 16:09:26 -0800 (PST)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f40b027906sm1573401b6e.42.2025.02.20.16.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 16:09:25 -0800 (PST)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v3 0/4] riscv: uaccess: optimizations
Date: Fri, 21 Feb 2025 00:09:20 +0000
Message-Id: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_160927_969382_3E146E3F 
X-CRM114-Status: UNSURE (   8.76  )
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

This series tries to optimize riscv uaccess by allowing the use of
user_access_begin() and user_access_end() which permits grouping user accesses
and avoiding the CSR write penalty for each access.

The error path can also be optimised using asm goto which patches 3 and 4
achieve. This will speed up jumping to labels by avoiding the need of an
intermediary error type variable within the uaccess macros

I did read the discussion this series generated. It isn't clear to me
which direction to take the patches, if any.

V2:
I've taken on this series as there isn't any response from Jisheng. No
significant changes other than build fixes.
- Fixes build breakage in patch 3 to do with not having used 'goto' keyword.
- Fixes build breakage in patch 4 on 32bit not having delcared __ptr in the
  macro.

V3:
Significant commit message rewrites.
 - Corrected the justification for patch 2
 - Better explained/justified patches 3 and 4
Minor code changes for legibility and more comments.

Jisheng Zhang (4):
  riscv: implement user_access_begin() and families
  riscv: uaccess: use input constraints for ptr of __put_user()
  riscv: uaccess: use 'asm goto' for put_user()
  riscv: uaccess: use 'asm_goto_output' for get_user()

 arch/riscv/include/asm/uaccess.h | 205 +++++++++++++++++++++++--------
 1 file changed, 152 insertions(+), 53 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
