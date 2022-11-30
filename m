Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CA9C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 02:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LG013dSzp18+mebPiFa3mVjYe8hC+oGYxTVvjqxlpRY=; b=ypRLIv6oIT7sIJ
	6Aqur4HRkDXhVY4c+Ab0z9s5a30Sk3+wowMLMdZ06uvk+sNhADUyJHdiguGv5rvTsPs+fz60hLO6U
	arFLfc31jpQ6YMNimvGDj93J6vbfEv6idAkFEhfTH5j/m4+XoIPixM7uaaZQorefLtsM7TcnPBIDK
	pUYYDIRnMyzMjvPTBGCkOBH4+k6gOTDVqnOT57qXaQn6+K1panuBebagjPepQMIm1AQAZsBVIcFtv
	X6ElctmoufbEweI3ThkGPsP72Jkwe+WDE7NZixQvPf2UIiFFD5EpOE2S52+j9VJzvkpKWkKu+nALG
	xhSIGt4L7Khre1dR2J4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Cwx-00CDQj-CS; Wed, 30 Nov 2022 02:35:51 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Cwt-00CDOd-Oa
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 02:35:49 +0000
Received: by mail-pj1-x102e.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so569527pjs.4
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 18:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=cCcorQr3xt7S/9kPkpKfyFY9wnh4zyqAGWy8g0u82Pg=;
        b=zIgXfyOIwEsoklp4Pj2VNqVlzqwOyXMyUOmtxXL8XX0HZeDXxESlEZt18Ufk8JeuWs
         7Q7DrZZk/oBitKWBF64Y72Kp2UZQ7dqDF1tWUk9honYowHZWf7T07fwYEp42FE86aX1Z
         gotSBlRsn35YWoYFAbebcGNynvUUURc8MWORwvu2WIiMk6mdXfZHEGtdcZ0V537kul+v
         xAfm8oj9auHJEgnhK834L9M7MGTTIIaw5+ZBB9pNrXTs3FyLHdQzM9t0LKeC8H5zFH92
         oL0JH5gN1h6OJbnPfadyReZYXdDjEC1MrmIOqa9EU60CrE7FKP5+UH69dvLJ3D/kKeOV
         roog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCcorQr3xt7S/9kPkpKfyFY9wnh4zyqAGWy8g0u82Pg=;
        b=jRvZoC17NgIYIod6LuBJCdSqsHYpVCCmkuDHrXSy9GH/8OpK7t8RbY1BlcuI8cmzkn
         5ggyI2BVeOpwUZXzeMtNdIbLQHs1vnH3RuXj6LCOG3zGogmdXBNc4+JPcDIzSbqpwd1N
         YP/o2PIDa33+NVFgqSNBYkfREodAH4KWzgqWEix50f2kE8foMQd/UsVzoBmgw13f/HGb
         p3nPoAyXm8uP1jYVco5j9dBs82lwJ5KUtpruXwZcAbLUcQbZ26PH4ReNxZq0yK8Ov6qJ
         4OHBFjhdDV40xz8ghQeSUtUMGUE4jVfFubt8z67GT6gfKi05IuiFGpXk5OrqolxAOMXP
         7ZgA==
X-Gm-Message-State: ANoB5pnXOu+AIU3NCL+v3bU3GYUOj2c296ICH+M4fNMuIOYptFcpyQfN
	Q9jpyH6FDy/nE6ZxPIjDs+W3dQ==
X-Google-Smtp-Source: AA0mqf4G6U9qyc4jE7f2+26f9t+8SDqoSZjzcCGOgkAolwJTuoVkqtHn3/RkqtSOEZJoe1ltS8Cs8g==
X-Received: by 2002:a17:90a:588b:b0:219:c40:e5f with SMTP id j11-20020a17090a588b00b002190c400e5fmr25718858pji.49.1669775746080;
        Tue, 29 Nov 2022 18:35:46 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709027e4a00b0018912c37c8fsm7638pln.129.2022.11.29.18.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 18:35:45 -0800 (PST)
Subject: [PATCH 1/2] RISC-V: Align the shadow stack
Date: Tue, 29 Nov 2022 18:35:14 -0800
Message-Id: <20221130023515.20217-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: jszhang@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_183547_830602_9AFB3372 
X-CRM114-Status: GOOD (  10.86  )
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

The standard RISC-V ABIs all require 16-byte stack alignment.  We're
only calling that one function on the shadow stack so I doubt it'd
result in a real issue, but might as well keep this lined up.

Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index be54ccea8c47..acdfcacd7e57 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -206,7 +206,7 @@ static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
  * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
  * to get per-cpu overflow stack(get_overflow_stack).
  */
-long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
+long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
 asmlinkage unsigned long get_overflow_stack(void)
 {
 	return (unsigned long)this_cpu_ptr(overflow_stack) +
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
