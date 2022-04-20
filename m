Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DFAC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 18:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsQeglm7wAecDEf5HgQVrui8rrD9uB2Lg38OoGc4rM4=; b=BVWCElxX9eCJli
	GE2sDwZOcnygfS4kkQkF/hJgBI7ULKOV9mZSSJ575O1KoxaK5sdLeF9MKcsNTx7FRaZiCMr+HBdVW
	dQ9FR7tz3iUkhBNv0gS4iVhW7Evk8E3iqw3Bl2ghs4Z5UJs+Scdzj3s6aw5dGBT6UN+6ZVld3M4QY
	71VzeXlZtA67Y6vRIHZXa69yYrT+zJva4BaddZ7EYNlmEPcFltXzuen2dG9E1qmKfO2MCONGR4/QF
	XwKMnRHlJp2T0R4+etn0KjYsSeoC80GNolAKIf6uf2zVlmIkhuzV1STE7LrTC6lpBMNOGKY3hyDhu
	NNIXinCw1W4IopYguA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhFNE-00A6DW-Uk; Wed, 20 Apr 2022 18:48:20 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhFN8-00A68c-U7
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 18:48:16 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso5699200pjb.5
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 11:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=SoH+rXIkHfn2tDchhhZbSJ+crMNxbZGozRfYvpl+XoE=;
 b=juiLZLej55jZaTBjD9xwVIR/YAR4i7cO0bpHr89TY+dz1ORy2ejFFIdrCOQXcP2D8H
 cIxDjtw4zoR/+O/+Cz7gJVkbmHNOFMtnczcO1N4hDW2YNoDdFy7kJvt4NocRNaWc0rrK
 rDxA4wJWcdvspC6ywEgV5rv2Z03Jb9GhkEjoFsHw1t6EhYernuYtCEVUod4KD52lB5iP
 s/aDAOti+/mtT0ZCn/3oAcvuMjjaJ6zzBso+eeSET7y8Nwo2WVkVUSMAt3YlM6JRpRZD
 BvFtCMyG1ZheaQ4dagFcdUGWYCLZ3BHz7skwKmfSnGeYNrdPtlsudMgmLO3FdKIT+CFZ
 SurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=SoH+rXIkHfn2tDchhhZbSJ+crMNxbZGozRfYvpl+XoE=;
 b=Gm3hUQScz+48aOshoAr0b5u+0UxtPALQT063z5tpaHko5zH11x9eG/S2eWZSgEHCfQ
 kX2JPaKG4EJ3mrUobTlIpVWNAi2OxYIU6eHnyT4RLdz0VZZ7iwUUsP0l9YngMtFhLrz9
 ykmZ6Ysnhhpcd8Yt7J6uLuCTFeLWpCbh/OwQxFxGXgYXlCqCo4EN3lvGSTdaWHiwlE5r
 +o9wJeByL6L38jwFZlgNu2fJi1yDUAUIzOPm7YAKgGuvSRFeqjveLXqVqf3fjobfxhHp
 Vb50kndAsKLCWBSXktTCxecIxzzP0bZ+MBG/nRIH+Hox508zv3oWKkbIpZr4aaCvFDgE
 zObQ==
X-Gm-Message-State: AOAM531jKQvxr/Q8mM6QK59lHp0so2WRmaqXGayESYX8OJUUpe6MNiin
 fFzob95O1v0FzhR98hoCSglTSQ==
X-Google-Smtp-Source: ABdhPJxdrixrp+jfH8hvzdp/Eg4oHxPBPiHlreQAn5N+O4widmijdWQO8V5yAwiXQNEjtkHlm2bdxQ==
X-Received: by 2002:a17:90b:4acb:b0:1d1:efc:39bd with SMTP id
 mh11-20020a17090b4acb00b001d10efc39bdmr6085138pjb.49.1650480493464; 
 Wed, 20 Apr 2022 11:48:13 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 i11-20020a654d0b000000b0039d82c3e68csm20741715pgt.55.2022.04.20.11.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:48:13 -0700 (PDT)
Subject: [PATCH v2 2/4] RISC-V: ignore xipImage
Date: Wed, 20 Apr 2022 11:40:54 -0700
Message-Id: <20220420184056.7886-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420184056.7886-1-palmer@rivosinc.com>
References: <20220420184056.7886-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, vincent.chen@sifive.com,
 guoren@kernel.org, 
 Atish Patra <atishp@rivosinc.com>, alexandre.ghiti@canonical.com,
 jszhang@kernel.org, vitaly.wool@konsulko.com, 
 gatecat@ds0.me, wangkefeng.wang@huawei.com, mick@ics.forth.gr,
 panqinglin2020@iscas.ac.cn, 
 rppt@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, rdunlap@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_114815_008962_D6F96EA8 
X-CRM114-Status: UNSURE (   7.78  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This built file shows up in "git status" without an explicit ignore.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/boot/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
index 90e66adb7de5..0cea9f7fa9d5 100644
--- a/arch/riscv/boot/.gitignore
+++ b/arch/riscv/boot/.gitignore
@@ -4,3 +4,4 @@ Image.*
 loader
 loader.lds
 loader.bin
+xipImage
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
