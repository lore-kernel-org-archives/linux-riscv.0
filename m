Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05F6C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RkrR5WdHd8cXYrz8KcmzXpLM4km0xKPigwhumbrFgyo=; b=znbb09dKH5qU2D
	JD51CsMAOS+pu42lQ1NPDH3kGUGjxohNIBYT3aNHBkBSrsJ3TfJIimIkVZmXw6jE8yYHyUNxOM8Ll
	iQVdCEUZVV515X3sV1KrkVrokaQPm1LE+jwhxDaVIkXvrd4KIgH9kEIPmCgkUd+BvVTf3YlW5hBGF
	JIdeVqD6A70UZ33/6D/l6RP59t8RVLklapFTB3Gg07cauXfoQ3GtRxs0G/vPRtiyd3z33DJtAnA05
	WwHdlSvKYJ50Zy+BM/gqPq+M2yTdV+KHFwS/Qz/52ZoHEk6LtbRDbWf7dTQzz+PlMsCBH7yIkT0rp
	YiPtIH2XEmFz8NaWmotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kst-0000000F4d4-0ImP;
	Fri, 03 May 2024 04:50:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ksp-0000000F4bO-3rQI
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:50:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1e651a9f3ffso47152185ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711854; x=1715316654; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P1pri5vJc6a6erBHblT+G/90vMaXtH4w+W1SfMwHWew=;
        b=jjVnBxLpSKRkPvuVqsK6bqAVQ36DhvDUbQrowYMHlBWWmPlqr1nW/sNT/sM2tRJNzq
         CG4ewpEjbs3c9nNh+kLOyvHkqeJe5DGwUg//YWlVlsofSg/C/HV2kkAHk6XSiWi9ICSb
         a9SDlrX4P/TKkIgUpEp0mbXejz6UzQxNpBhmozoOH1j7euO1L1dD3ZAdTXix7VkgKlsq
         SFzk67pa+vUDLFiAQ8U72J/oVvBt2YZ7Vypis6arfd+P0Gb1Ca/8kWL++RBd1pQVr5gv
         Js8EPrKrNW7dNRoYi5QkHGwbyB0SvRi+6eh6kTocKuFATR+mNiOfSMnpts1U8lQXqNlJ
         zVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711854; x=1715316654;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1pri5vJc6a6erBHblT+G/90vMaXtH4w+W1SfMwHWew=;
        b=MvolEUOis3eldDNMHveuwWLX0Ai8Ey1WUCFYix2dMAoegi3Jfa+4Cdbzx7nKCZn15n
         qFToJyNcSo+E17lMhl8IUjAMDWjgpp1ZZeY4MCtWgdsXyWYepOfef9wqH8IeHQq2ubHR
         rQ2atXR6cB+6BmV2lpq8IuDWNsq2AWFpnTEukP4GzL/UqatY0he/tBcxCVxJsygl+9w+
         83jutc7YHJIq8frBgJ99ALvTWaZMET2dWIfNLD8XZmh71DWU2IG5OBh89h0F0K9tXaWB
         PCpfkDdWAN+qFJXczTuhsvsf12J1b7RZFhsr99a8P6qPjvUZDwx2Aw+ugvK+ZsciBZf5
         OK8w==
X-Forwarded-Encrypted: i=1; AJvYcCWfnN+wN6cEn9ApDUqzkWMfxT14JNMQxJV5gdwX4vkB36t/3dDFXchSvX/vH6hPfa7wemml+OZQEj3cuumfern2sr5Z6g9NLibD93+mieI7
X-Gm-Message-State: AOJu0Yz10UJB6aZnSF+eFHhr+A4/FHEZP9VbF13Pp9cQhhgZ09Xy0PDR
	Eq70t5NzP4T/msYH2LxmB/jQcohzAQZioHhS18MwqiHzbz717k5gr06lrY2B6oM=
X-Google-Smtp-Source: AGHT+IEORFLsgu03dCb67137W9/Puz9LTNMIUDTKupfQs2TVKEvgT1NFtqJrCUNXu0iFi8qln7RGqA==
X-Received: by 2002:a17:902:ecc5:b0:1ec:c6ba:de3e with SMTP id a5-20020a170902ecc500b001ecc6bade3emr1582135plh.57.1714711853907;
        Thu, 02 May 2024 21:50:53 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id li11-20020a170903294b00b001e3c77db2aesm2276384plb.88.2024.05.02.21.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:50:52 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 0/2] riscv: Extension parsing fixes
Date: Thu, 02 May 2024 21:50:49 -0700
Message-Id: <20240502-cpufeature_fixes-v4-0-b3d1a088722d@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACltNGYC/33OwQ6CMAwG4FcxOzvDusHEk+9hjIGtSA8yssGiI
 by7gxMxxOPf5v/aiQX0hIFdDhPzGCmQ61JQxwMzbdU9kZNNmUEGKlOguOnHBqth9Pho6I2Bl6J
 Go6wuJWqWar3HdZFat3vKLYXB+c96IYpl+geLgmc8P+eopQWAor56ii5QZ07GvdjiRdgaxY4By
 dBSa6WgFhL0jiG3RrljyGQUVSWEtZgL+fvHPM9fBoKo8TsBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711851; l=2166;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Dxpzzy/z93hXB1aHpi749r74tSlAAuPK148cUOanOFs=;
 b=be228u4Ild/sEBi/+uvBsPWy7IukprxcPHtzBJD7A9ck+Fsnxq/xVWLZ8cCYLRex03loQOBw9
 c4LOUEkw6KWAkoFoVflv5PTwjn2PCqF1oKiEx823WLkTQfRcXjRYWFa
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_215056_011592_84F76318 
X-CRM114-Status: GOOD (  10.96  )
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
Changes in v4:
- Delete comment
- Link to v3: https://lore.kernel.org/r/20240429-cpufeature_fixes-v3-0-6aa11dde513b@rivosinc.com

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
 arch/riscv/kernel/cpufeature.c | 10 +++++++---
 3 files changed, 45 insertions(+), 7 deletions(-)
---
base-commit: ed30a4a51bb196781c8058073ea720133a65596f
change-id: 20240424-cpufeature_fixes-91bec4d793e7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
