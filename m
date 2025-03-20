Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B0DC28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 23:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I63R+7EbST5EMXdrm+qzg4Qwj0JBGmzW2btZl4gLPoQ=; b=z6/5qtioUFjyz8
	gNSgz4bsQFn7QqQ5hLX7k0wNK//qvIT38mf1vEtUVDyaQMr9waB8hkkfmjLR+xxLWKZlJg2JpFJU4
	ww9uaKegBc+vxctpMqLFVdd5JW2d92m//nN0JAFHzE1sK0aIbAquSSsfBevlOkPEEkTYyyRCT7z3k
	ewDnSFa8tPIw/PsnIGEAaC9GlGKoe2DwIrOVoWB6dvpfd8t6T25ORSKQOjydwvD+RctO63As5doLx
	vkkK3oniB+L2uS47tD2U8vpwMDn7gBTgv+j17ucu9McTa6AiR8DhxvB/7A8f96TVY3x6muRy9jx8M
	fpZ5aqwYZQ+Vu04ZyxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPda-0000000DUZo-0SSz;
	Thu, 20 Mar 2025 23:49:22 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOcl-0000000DPFa-08Po
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:44:28 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3f556b90790so388480b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742510665; x=1743115465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8SFfZ8SQ++q1U43zBVQpg0YMcuwUtwU9gjCvKh1RgaY=;
        b=QjS9VjC/1sxx3u9zvy5jcdhRF3Q44I3K5MX1z7irnAPk+vktd1zcKnPF4OEnxGvXzv
         FUhxy+WXFJT+2Om5aKWwSmrG3htpz616IpK4/tAMQ6dKPx3V3H95HM8HocW0Z/v8vRSI
         Ow5on+dqjbO3u/K+Gr+EGYaYO219magiI5/gVTFIV0xk5EzxUszO2MbTHacx3fIWdoTd
         VmLRu6jtySbQPHo/9BhzDA3lkHFKcuuferNI6of6vEBuuFScSnjZrEBT+DQ4WbFP+V/t
         +Z1uV+R4Fo4Yw0WnHGeG08DjgpR848DkfoSkigiYQv4EwZlQmNeb5Ew687zb1PaurXW6
         UVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510665; x=1743115465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SFfZ8SQ++q1U43zBVQpg0YMcuwUtwU9gjCvKh1RgaY=;
        b=rr1U7p6VZSrbNw8tUH/0MDeuKt6/hKXhJKhTKkwWRku2o6pYMUwMbZfCH4HpNSMqL6
         yXlKvzgC2wS6+dbrvINHCbuszXJmZpU4T9+Yw1SO6PpMsHTOmSMmxiJZIsk5M+bTvBiI
         bCUPqL5gwvtWUmI9A78FlDJxnQxM0n40CSSJDs8XIvFHacMCr97v/VMDHz/YhN/esdlX
         1gKgnOsJCZelbX9XAWvzvd+RVfQ+afT+JqCY2GZN/Yk/MDJInKtX1lSptwI93B7NN1Fr
         5Wep/M352XJ3JHXxouruRZ011Sk2Sw3lq8Mc++eniLDPtWyRvPh0BFkd6DOkuzZrRl8c
         DfhA==
X-Gm-Message-State: AOJu0YzzNimTX9ndeG271sKIFdyYBhLyErwuSgqAfW/a+Ua1d29oYwei
	nas04bx1FYRiIot4EZn6HZlVVxy8IQOy97fWFL8hJZ8h2nK16d7Qd6LA301d5Q==
X-Gm-Gg: ASbGncu+qQztLWKbdA/RchbTNeUwLS9ajZHsVfRl4DI6AigoEvfUjet9L3JkAomsW9C
	agjxTKWw0bsWv60LAi2NC0hgl0PkhOXaRbD3n9BccLvj07b8vjByz4A3rC3nqCYuNKja/xnL6oN
	yyz6SPc8uzkit8BqQUbszK842J2fvcLGuPF+8FDBhUaAyaRXHh5Pkkg12tsNI70hy5tebCL891q
	f788HIIkpCxPa7OrhRKM9C+gi+u5UgqYP29zl2ZDcft3pMzFUz9HHofyUK1e2h2a4JgUkD/iD7l
	KHR1UuTV9cnCQkhPt1UvPYZTy3+Ia7wXLt/VcZRZnMWtou5g4KOVFsCFU1HgnGs=
X-Google-Smtp-Source: AGHT+IGD26THZoSitvwX/Ku6LnvKO2hX/XV09PCTifQuKV3OygKNloEFk1j02pnAYxFav3zAgUrsvg==
X-Received: by 2002:a05:6808:2396:b0:3fc:1f7b:c3c7 with SMTP id 5614622812f47-3febf714101mr614720b6e.15.1742510665572;
        Thu, 20 Mar 2025 15:44:25 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf6dcc09sm103524b6e.12.2025.03.20.15.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:44:24 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v5 0/5] riscv: uaccess: optimizations
Date: Thu, 20 Mar 2025 22:44:18 +0000
Message-Id: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_154427_083606_720D94DC 
X-CRM114-Status: GOOD (  10.25  )
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
Minor code changes for legibility and more comments

V4:
Fixed checkpatch errors
Added a unsafe_copy_from_user()
Added patch from Ben Dooks to save SR_SUM bit on switch

V5:
Fixed mistakes in adding unsafe_copy_from_user()
 - Sorry about the noise

Ben Dooks (1):
  riscv: save the SR_SUM status over switches

Jisheng Zhang (4):
  riscv: implement user_access_begin() and families
  riscv: uaccess: use input constraints for ptr of __put_user()
  riscv: uaccess: use 'asm goto' for put_user()
  riscv: uaccess: use 'asm_goto_output' for get_user()

 arch/riscv/include/asm/processor.h |   1 +
 arch/riscv/include/asm/uaccess.h   | 218 ++++++++++++++++++++++-------
 arch/riscv/kernel/asm-offsets.c    |   5 +
 arch/riscv/kernel/entry.S          |   8 ++
 4 files changed, 179 insertions(+), 53 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
