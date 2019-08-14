Return-Path: <SRS0=pZSk=WK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE95C0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2019 08:24:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FCD20843
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2019 08:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NrvEOJCd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aprA4MX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3FCD20843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l7bhotr7q30O8KhytzjP9nlFqFLgYXV4CuPcqpZB0+4=; b=NrvEOJCd2+ZWpld/TBASQZkNVL
	NLlXiPkVH+vWNoO2QkWElf68qhM5KdaD1OhOA+dTbK3Y+nuWli3PrAjDS7xL0gah+zMk/mXKjj57J
	IA/W2HDC6ZVizvvw6k2RyU1UpZ6my63qW7nuKqsb5ydzI4z+dAjmc5YsLtGXghUvxsXjnt91dFwyF
	ojP5+zarvu56lY28xvrttPvTfJHp9QGHVkmL7DVxWxXf/zdj4RNCRLYdMKWicZSBbXA7G6veEWKYa
	dR3izKuafsy8n/3sjqPL8I4qRC0ffoMKu/E92IMEddwPzvcBb8iPap1qh8c8DI+5CXCV47orzFa/N
	s2NYhmYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxoZg-0002ML-FF; Wed, 14 Aug 2019 08:24:04 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxoZd-0002Ig-B1
 for linux-riscv@lists.infradead.org; Wed, 14 Aug 2019 08:24:02 +0000
Received: by mail-pg1-x541.google.com with SMTP id l21so52701895pgm.3
 for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2019 01:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LKUTmfxWju3JH0UYdXaX0ZmxM1v34X/CQR0cjWXAdV0=;
 b=aprA4MX8fFP42+7Kfj2VmM2auYXDJcnW8YzO6vnSgXZD4MuPEx8PnT719qHFqIr/8n
 QmbZ0QuY/hdaPVLq5Qw9zGc+lgBmz54nZxOVLVk/a6ciHKcZKGRIPSumxAOoQa+lFXMg
 Z4uMvEByYuk/s/C8PNQittEjIb+K5+DyAfQ6cEBZ/zDoQd5MGztJ4aOzq10agMJA7UiN
 FDqQTgG0lMxnF4XDCJNHNKvx7sAok8gbO5bys2VzvMgT+AmDci9oOg+AHhe05JKeg2zn
 0209fn6vu9pR/FoCbx1lMxKN4l+zwrkJSq8FNq7tY10dmn+tm2v/q4XkIMFQCz5Jcn91
 Xm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LKUTmfxWju3JH0UYdXaX0ZmxM1v34X/CQR0cjWXAdV0=;
 b=OPKmSDQQ0bp3Z61Uc9uPE8AmX4zQQVymoLenPl2ENshfoj65LBpJA+Xjdc0AaH7kXY
 Aq9N65P0afGvqF7tl91/+BqEShsPmepeb8/k88vfK0I016RQMQvOSoJgezHRG7lgdhBO
 HBmzCpLYsu73FoCx3l/BBTuyGtu3olaHg2Du3a1nws2tu2p9ETHe5ySFKwFc7V4Py5Bk
 /uhuZ33Rca7cH17oBp4j2sQHONxIUYWwEwRiBBO/pQRDXNyvSgKqgFj7EyPwMk1aQHZl
 XoT/GY2ETq9zaEBcKcsHJGb44oweLk5J3MzUII9SozomCbWvLRMFRc6dmkb3oGkh40b2
 DiNw==
X-Gm-Message-State: APjAAAXlTvGtR1h23rf0Dm2bQhJLPXMrROvY8jqnPwwyi924rNKGQLd4
 cH76oMFodXZeQ7TD4ZLVkMgO+Q==
X-Google-Smtp-Source: APXvYqyF7XbbwdZczu0+BTGt6EYKJY4ia695LRy4XRq7P8Im2pJg5qZNWSLmNfYr09pro/ZO5lhd3A==
X-Received: by 2002:a17:90a:ad86:: with SMTP id
 s6mr4822761pjq.42.1565771040942; 
 Wed, 14 Aug 2019 01:24:00 -0700 (PDT)
Received: from localhost.localdomain (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id f205sm12359152pfa.161.2019.08.14.01.23.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 14 Aug 2019 01:24:00 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH v2 2/2] riscv: Make __fstate_clean() work correctly.
Date: Wed, 14 Aug 2019 16:23:53 +0800
Message-Id: <1565771033-1831-3-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565771033-1831-1-git-send-email-vincent.chen@sifive.com>
References: <1565771033-1831-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_012401_417731_60054EF1 
X-CRM114-Status: GOOD (  10.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Vincent Chen <vincent.chen@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stable <stable@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Make the __fstate_clean() function correctly set the
state of sstatus.FS in pt_regs to SR_FS_CLEAN.

Fixes: 7db91e5 ("RISC-V: Task implementation")
Cc: linux-stable <stable@vger.kernel.org>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>

---
 arch/riscv/include/asm/switch_to.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0575b8a..0aa5b94 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -16,7 +16,7 @@ extern void __fstate_restore(struct task_struct *restore_from);
 
 static inline void __fstate_clean(struct pt_regs *regs)
 {
-	regs->sstatus |= (regs->sstatus & ~(SR_FS)) | SR_FS_CLEAN;
+	regs->sstatus = (regs->sstatus & ~SR_FS) | SR_FS_CLEAN;
 }
 
 static inline void fstate_off(struct task_struct *task,
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
