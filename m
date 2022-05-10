Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FA9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 10 May 2022 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=693/3NKiHxbaH/D2wtqqE5nzXjTZaxOyIy0hFQDLFNQ=; b=mOD+zVD+jbxkAN
	P1BFgLRg1YCB+NYHqoTQeZKgGkZvXuVmu0Q2PVmp+EAy6O8hC3qBB66ZoU0yHpRWrVaUDze/UYh1r
	aEHKDEI/2bEE2zHIk2Jx2+rg+tWkWtWfdqZ5j6wowUTS4yzpKr2bnI+kiGKrPuxhIWQnVpBhgEija
	kkPH2eUfWUYgPGNFkEm/3seE8Bvyu3UL35/IPudR9o4YEWnmDu9QIYH+xkCLmlaUUe71jzV5y3GOk
	nVkUqt2oXxHYLH+zdxE0R7+ywY/NkMNqkGg5Ld4M4eDnSyvxZgvpgiHXq3PVsCqFGUao54DIBvHso
	Ywii+aQQB/8VAE96H0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noS5l-002q1d-Hq; Tue, 10 May 2022 15:48:05 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noS5j-002q01-Ei
 for linux-riscv@lists.infradead.org; Tue, 10 May 2022 15:48:04 +0000
Received: by mail-qt1-x82d.google.com with SMTP id x22so13822909qto.2
 for <linux-riscv@lists.infradead.org>; Tue, 10 May 2022 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aKum/y+r6etzQiDAncOGvinx4476e/+0uZXTw6pzwzs=;
 b=gW0t2QRbTyXmQvXyimlegclNnIEB2oz1Q2shjZ39XuWnPGlqj4KNZ0qpRhj0fKscpl
 cnjA8BtdGugJAErQ/HU8DJ/dsZkwoZ7BSSgTFS3o2Ra6snQf8kalMqJV7Z1E1ACwsSWo
 5Sddgvu0qSXC+zgKYuWGwVBlY9JUUw+ncgV1uJ1F8HQOrhbwlvwHPwsjwlDyFYZiScfv
 mlP0EeM7Yygzq2Y6bpsLYjCliTNntkC+zkIjkyKrwaT0ca5n6C2Ay5KBcb9FBB4UlLug
 wc8H+vo20SJrhy118uJW+/eNG6vblqSGHG2s3aAf35TrzbH+YuT1vIuMRDY0jL/jEXiX
 T0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aKum/y+r6etzQiDAncOGvinx4476e/+0uZXTw6pzwzs=;
 b=xvB/Q2OuO5ZBfFAigx1/mR9q19UDj6g1CC+GD8/sVzcu25KVK2oD4X2Y3zfaoOpksA
 yBO2Cnzup8/bJqvI1/M/G4GkNcBCBmfhDRkOdbJEoS4AsJ12C2ZtX0yQUbTbcAM73Toe
 KsG54tPbX3xmXd3W5PUhqrE2AgS4zVZzWYECUDbnOpIsBCCxbnEVxl1B6MhQ3jOzjWfr
 sgDieIBBmAkzS6vh4Qj7ewhJ2hMhbuthLOJADMVSwhHeqnd6ZS5cwgZxk5yS3ZEXqLmX
 74HHFPqy4LFa0nMtLjYpcJXMrBzwHO+lEVGHrjxtJt/2bFnCp8JrIY2c1lpt2MXvB2i0
 kXuA==
X-Gm-Message-State: AOAM533uM0nI2+HeXAZ6e6+gJsVKv043JFUFApqYPmui1M/Tr/LE+c/b
 8u+219xA8b0DsqAusiEJRfY=
X-Google-Smtp-Source: ABdhPJz4ankS+cAqYT1bVrUsTcE2UHlB2KcHnUHYsVNYUl/deyqgn3ghukaHi8q8RzXf3c5GanpkYw==
X-Received: by 2002:a05:622a:174b:b0:2f3:b473:13c6 with SMTP id
 l11-20020a05622a174b00b002f3b47313c6mr20251974qtk.198.1652197682702; 
 Tue, 10 May 2022 08:48:02 -0700 (PDT)
Received: from localhost ([98.242.65.84]) by smtp.gmail.com with ESMTPSA id
 b3-20020ac85403000000b002f39b99f6adsm9459897qtq.71.2022.05.10.08.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 08:48:02 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Subject: [PATCH 07/22] risc-v: replace bitmap_weight with bitmap_empty in
 riscv_fill_hwcap()
Date: Tue, 10 May 2022 08:47:35 -0700
Message-Id: <20220510154750.212913-8-yury.norov@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220510154750.212913-1-yury.norov@gmail.com>
References: <20220510154750.212913-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_084803_558894_6F67F6FC 
X-CRM114-Status: GOOD (  10.50  )
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

bitmap_empty() is better than bitmap_weight() because it may return
earlier, and improves on readability.

CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Anup Patel <anup@brainfault.org>
CC: Atish Patra <atishp@atishpatra.org>
CC: Jisheng Zhang <jszhang@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Tsukasa OI <research_trasio@irq.a4lg.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/riscv/kernel/cpufeature.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b2d42d7f589..f0298d756f66 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -206,11 +206,10 @@ void __init riscv_fill_hwcap(void)
 		else
 			elf_hwcap = this_hwcap;
 
-		if (bitmap_weight(riscv_isa, RISCV_ISA_EXT_MAX))
-			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
-		else
+		if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
 			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
-
+		else
+			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
 	}
 
 	/* We don't support systems with F but without D, so mask those out
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
