Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEBDC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Etyg4MVWdM/+qzNoxDRi8TWIE66R25CfOhAttgBspWM=; b=vGPELZE0rXGRVc
	9bnL4zSGTsHA4qCu02qCN0beBIy5k36HEq61IpihzwhlodZvn+EOLX/Co2JnYEPUZFcZycEnDVf8b
	yRnp0J32Op9XujR6HUHZuX16IjEQ3lv+PsqzVMrYmS2/b/Ns4cpDTPc2f6Dk+1Ijhqewrik17jq7D
	COpasY3fq3hTgKcEaYc4a6pV880KRczYS0I1f+a+DVvq8nUQwH1bxSc2djamaBfc2QMxGVpCgd+x0
	15F7zYWPQ2cOfYGmQddN1A22kppPN8UvybfV6JSxh7se5Qs8UP1plyrdsD8LtDhBWZrIJVQJqhp+d
	eKrWP0Uu4jZboOobWWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2w7-00C4I8-Gp; Wed, 21 Sep 2022 16:50:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2w4-00C4Es-05
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:50:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id iv17so271689wmb.4
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=wNUcq1etcZciXQCHJChvzfvxl28Joooge09sg7cQiwc=;
        b=Jzi1LryoMP5RPsOHf5u8iCZIRCNbfj8N4WxVj6q1rrnZQOIbReqgdttTe3EFwyqw2h
         QuIzqoH0ou10m7K44afWjxtgNCV/iyzWZ/lDLHBPJdJMp07FM3Co3dDBcdRur2Wy46yW
         fK1jaJVTxrBsGfdKncRYylT9CTK6QT24Ft2WvzM+1XhHBbfZW2Pg18F8FgOUIj6QFugM
         lqO6zE5M5ucQzvsVU6acfYO+gmPypUkK4mCI9yURBj34z/GpJu/bQ/iYmiKesbyDbhzt
         tcskxBom0rzCxQhjlFOlZy1UrLNAg1u0jpaNRMne+O1HyH1dxqFyOTjmQlRxxnbeB5Gv
         VCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=wNUcq1etcZciXQCHJChvzfvxl28Joooge09sg7cQiwc=;
        b=nx9M0nOuItwTTGsbaBg8+VI434i9SjEj6ZAlZr7JiU6RsAtHcQkSc9snnMw7tKATZQ
         NRTdAzbkdHZe96sNKYYrP2icXaRgt82T+qEjCNR03/Ryn4MtM1/5sAO2ItF0z1AH/wE/
         WBFRwuoi8oSQZFRza+jgDF7gM+YfG3wZR4ifgvN1CsiQyRoAYtPxttyvCvEG0bacs+Sm
         gjo15uLKYuUX7E6RJ18k4lkcMX6N0mlQ92TFQVFX3WUR2uH/wSzbfqBpqfhtvBEdZz/g
         VRrlfLAQSCSWTC9IwfsYpWpPgV1nqvCQSS6VADe3q6EVE9mYpaWNFtPYaRHI+yokycXD
         ZcWA==
X-Gm-Message-State: ACrzQf1zEddWsMsaTAbvwVJSXTxIxar6EYWFfIczNWsQHDcOb/aoVia/
	oTZUMI6KVEJRxZr8/z53IgtBydbpyK3eAho6k2LzXw0SJem2ww==
X-Google-Smtp-Source: AMsMyM6s6C7h/XHI6eGYcrWSxpaHqFnbQN31rOQItXfDFfJ8W15eX4HsTzDspNqLXzj9dh/9m40LOuSLuxd+TU0Kv1c=
X-Received: by 2002:a05:600c:410d:b0:3b4:9454:f894 with SMTP id
 j13-20020a05600c410d00b003b49454f894mr6442213wmi.111.1663779053539; Wed, 21
 Sep 2022 09:50:53 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:50:17 -0700
Message-ID: <CAM2SziWWP8U5qs3BFh5uZjGLV6EFKSzALQ9-fsCd=wRgxy_HPw@mail.gmail.com>
Subject: [PATCH 15/17] riscv: Add V extension to KVM ISA allow list
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_095056_076021_B948364D 
X-CRM114-Status: UNSURE (   7.83  )
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

Add V extension to KVM_RISCV_ISA_ALLOWED list to enable VCPU
to support V extension.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6f59ec64175e..b242ed155262 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -35,6 +35,7 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_m                ('m' - 'a')
 #define RISCV_ISA_EXT_s                ('s' - 'a')
 #define RISCV_ISA_EXT_u                ('u' - 'a')
+#define RISCV_ISA_EXT_v                ('v' - 'a')

 /*
  * Increse this to higher value as kernel support more ISA extensions.
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
