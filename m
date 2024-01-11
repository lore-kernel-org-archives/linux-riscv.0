Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0205BC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hxvhow+Jpr+i0B+a/HAAJPGW5U+waNcv65wrqDFbFLA=; b=jCtFg2YLvIde8t
	zEiFRY24UfROQG3UqNIPnRACX3ZGZ1GM6ak4DDe84H+gsm7S44NUFIWfVJXL494+yazf6hMC9Mhwi
	vvICCnS6O/iPdgfJAmVijbuEmHeP3Fzv6suetDkuuJm5w7ElMIjHyO6FcBPLeDr93p5i19V63wJku
	mJ5qdOQAoE9V7cOACMBE6tVlMTRkbjQ6h2nfuROwUFFxn3/A260xr7/c0lN9N8inU9t6znjzoKzUd
	y0Gr8rLPnowfaN3nAynQOCgUy4YNNmc+cLy0Vee14kt24yhmg6mNi0FmGJ25G7oNFYq6+FKk0yGsF
	/QRA3svJO42jA6+cw+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuvn-0007Xm-2Z;
	Thu, 11 Jan 2024 13:17:11 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuvl-0007W2-1s
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 13:17:10 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6ddf1e88e51so1177283a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 05:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704979027; x=1705583827; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3xo3x8zv1BqYEabf/miBjogWe62kYZ8Sg/4Io2Mwxk=;
        b=kPfVr/pG1azrqJcFeDwVKFhqSoodOl1YnVbnluSDEjKRdChZwME5ZB4SaOq4RlPkIV
         B4fy+FBuzGEN+tOsPcUq0Fxe/B1PrkA8ubn5QVBGq+F9zzQnoROhqeSPv+4UrvZC3TM4
         vuLuVTDybtJglzBEIRi7cVk7Hv1G0Q2u7sGHSmGB8l3hvf1LoM+cwSKFiNNMFUGrupV2
         O0OCh8gCtkpAk2Qqhgkm87Sf2gFXv9yObt45xHT4wpuTo0lCs4QDvKbSLTgNw2la6bX3
         I37NsHIuieZoTWgzbrWUbnRCuRbIBqRmT3SjXgIWJU7HnLOkFlt2JuhB0QQRj32r96nm
         Gq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704979027; x=1705583827;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3xo3x8zv1BqYEabf/miBjogWe62kYZ8Sg/4Io2Mwxk=;
        b=sv0glexPw7W9oIfS07x3tMES71Yf/JPmauTSnkEvamlXs7bGLwnKvVlNlcWJnsk16Q
         9YPrnSwkU7qVCC9Nw9Zr/I7t0jRD9yJMflX3DmQxQF2jY+/F3q/W1aT/OhpBu7W7RLux
         eymcmPovg+ddMdE37PwNvrNSesS7UJX/3HU6woLu1pqZqaKk8rYHFqZctkfiBpn9IRtk
         IJdKbQPDcGumDtPab1ySziP5OU2eKNpD9bPe8rqki2h41Rswo6sGbyoMdNySWvkP9O9q
         oR0cpuBxa7aXWm8NyTGuAcgSaq9xxEp7BY0PWZm18R/L4vodjcuzNwo39yYkzHHr1EFL
         aQIg==
X-Gm-Message-State: AOJu0Yxoy7CoEwF+bBxU61NJFtarD8nE1Rf3itihgvGkNxUncrwXCM0J
	N5/f6evPU2qSKFemgH5+TaR9wJ08RwWolhHco63pPFMjyBNXptQV6ELSEKIx4JTWIPc5YlMUjKj
	QuRJY5T807AhKkd8NhZjzB1m9KYC7FEG2X3cfGL6QLVg1kpm+qWeb63IHcIV+P3OyV3VDLrv3sE
	KI3cGkyy6ObNY3FzBrss/u
X-Google-Smtp-Source: AGHT+IFUy6crV9Jo0WusGxvxjKmig0+AyXtQDCLScFRothtYqX3EHW+Tt/e5zz2l9w0LwVcbQP6q1g==
X-Received: by 2002:a9d:6a48:0:b0:6dd:e573:953f with SMTP id h8-20020a9d6a48000000b006dde573953fmr1277439otn.64.1704979026841;
        Thu, 11 Jan 2024 05:17:06 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id ei30-20020a056a0080de00b006d9a6a9992dsm1103202pfb.123.2024.01.11.05.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 05:17:05 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	ebiggers@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [v10, 06/10] riscv: fpu: drop SR_SD bit checking
Date: Thu, 11 Jan 2024 13:15:54 +0000
Message-Id: <20240111131558.31211-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240111131558.31211-1-andy.chiu@sifive.com>
References: <20240111131558.31211-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_051709_619199_39A9F460 
X-CRM114-Status: UNSURE (   8.69  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SR_SD summarizes the dirty status of FS/VS/XS. However, the current code
structure does not fully utilize it because each extension specific code
is divided into an individual segment. So remove the SR_SD check for
now.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Song Shuai <songshuaishuai@tinylab.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/switch_to.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index f90d8e42f3c7..7efdb0584d47 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -53,8 +53,7 @@ static inline void __switch_to_fpu(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(prev);
-	if (unlikely(regs->status & SR_SD))
-		fstate_save(prev, regs);
+	fstate_save(prev, regs);
 	fstate_restore(next, task_pt_regs(next));
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
