Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB02AC47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hxvhow+Jpr+i0B+a/HAAJPGW5U+waNcv65wrqDFbFLA=; b=iRmvCcnvBaY3rY
	WyIRTKdaMhN4WEGBlSy7R2H9pLBVGriCx/ChfRuIObPUpS9QOr182eyK2ZRqgVom0gv2dqEPhIV+f
	VM3e4I0pF6JLUA/erOukqV2DXHvf9FWvxpRWNeDfL+kA+OBmAfBCZ1+A/Rw/cxFQSbF6nSXtQGpjc
	zLri5DH1wYSdsJJOBYClerwHafXY3nrMEAVZl/8tbfhlsakoBRaqjJyVjoaKTWBRr9qmGQhh47qD3
	kvn5VDdUFofhxqD34KDTn96KQ7IS8d9NAF0gMJgDbvHIMVrkGbXGihoVZJHwlnFXVfiWYN/qZeBVh
	KSf1GLU31M/OuQa/7RAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPHBm-0083DG-1O;
	Mon, 15 Jan 2024 07:15:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1a-007qRw-0s
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Jan 2024 06:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t3xo3x8zv1BqYEabf/miBjogWe62kYZ8Sg/4Io2Mwxk=; b=JkhqTwT26I3sx9SNRa6ZARch33
	NGOnm8QY9vQUdm5nHRctgVp1PuFHiERYjb/kLc2QH0YjvVSX+IK2EWBHGBw/xweO0pSKsPCowF8sp
	DbcMluT8ysPnO4/GMuwAOBNj9nPkiZaYoYKncOfOzRXMgTv2xoivcoEgk/marwejPdGLvhVonnn5T
	FHona5Y3JwHfrRxoqcjV4IcapTc4kBGF8HRv23suzXkshtgqqMeLrh/H6B41HIg4wlSlbogsVQd03
	Idy5zj4yJBP63um5qCR02QiDQUHYnmP4FlO+5IayyjDp4GJPrpwYcBzvmGXPgnKEWh6+VadRR/eKX
	Dkdrbm5A==;
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1X-00D1et-0F
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 06:00:41 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bbc649c275so3810920b6e.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jan 2024 22:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705298436; x=1705903236; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3xo3x8zv1BqYEabf/miBjogWe62kYZ8Sg/4Io2Mwxk=;
        b=k8JhiupWJFIc/P5pxZ0h1ix/c5VlQ60mfkgv4mrlZfxS9MUkyVFlGYFxeArNJpQrED
         fvu+Teg/3IDHrnthekUAuaea6BsZfkkI/Jl2lxw33fMK+QXGUI6rcK+igdozoazvyh6u
         rJNlYIhbl30cjHfS4mv7p7LelGb5yn+gchYKqOoxrtQ/fNtBRyqZeKFUxfa7nEVLDYEm
         BNOTJIb2+/u1sPno6czu/8lJeXBMIrsouUv7trKtaNx9QGVx2Z2Mge7xRbZM/DZt2+6c
         me5CHuVfyAUTu9Ld4AtEQrBmkFS161k5OwdyLwIGqXenmtt6UiVxi62QSCMePyppOWN/
         4pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705298436; x=1705903236;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3xo3x8zv1BqYEabf/miBjogWe62kYZ8Sg/4Io2Mwxk=;
        b=c3k8D9F7ykSlR3xvW9HOIoHoUa/qclnNtv1WJAV4UwADwVxFOZs6Tax7xVNb0U2tTk
         8fFTyKUWuXDFe8OE7ztFdDjjv//J3RHP9TBSPBKcHTV6KopyMTfyOL+fLtivTgGU6zqo
         4jzPbZTGdcsHbbAJswxhQBA2d5t8o327ty/h4OauvQrW8hy+//iS5zskDTqZNusotaBo
         danX9WRWbzQaqVdDgl61y/jWmlwu3n90vNhAA2aTqi+nmvXt+XMiMrYS6Tcah9OI3gIX
         nYqH8vYgO39wD2JfdztD8EI9BKZujnK1B+paquvmEE/LGLaFV8A6DXNDkz2GU81uDuOg
         aSuA==
X-Gm-Message-State: AOJu0YyExEwf21yz3RjM+VZEEamDPGRyMyEP/8WomADk84I+hyOjXqXb
	DZoCUwC4EAz2ZnkY1/loBkDf6Y57O9WmMn1QMK9mBXg3j5UBfR/q5EekmHFdE1xtrcBce8bPgoM
	t84udrtQ0NoNvGG6EsUXdqKjAfV1TFKy05KlViRd8qczO2NM+Ib9CC1/q2M12IJUyY2pG0dhBXr
	llIBDLEhmQ8F0U11S6t1EW
X-Google-Smtp-Source: AGHT+IH0sco5M9ip8tZThrl+ybvw4fe2WWfUwPeeCXU3QsjF179tE8wZ9uLa6lVOBmWKjvRFtd2ghQ==
X-Received: by 2002:a05:6808:107:b0:3bd:40af:a93e with SMTP id b7-20020a056808010700b003bd40afa93emr2348371oie.119.1705298435994;
        Sun, 14 Jan 2024 22:00:35 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o18-20020a637e52000000b005b9083b81f0sm7392988pgn.36.2024.01.14.22.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 22:00:35 -0800 (PST)
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
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [v11, 06/10] riscv: fpu: drop SR_SD bit checking
Date: Mon, 15 Jan 2024 05:59:25 +0000
Message-Id: <20240115055929.4736-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240115055929.4736-1-andy.chiu@sifive.com>
References: <20240115055929.4736-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_060039_257049_778B773F 
X-CRM114-Status: UNSURE (   8.53  )
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
