Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16986C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 18:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=al01KnRv3seteAP1tFvvNEcCyUJpFZa2CK6KjU5GPQY=; b=KWGbBaeID62Y/6
	zgn4dRMFSRGPnPuw9DmnGdli/HPbYT4kfKPofkjBqwAxjxECQIBmxedDs2TsH/oJplTmIDmvwoFYt
	qavgN5xtdeVOgzEFbMVnLpfFK72iQmtc8lcC/7A43zsa4HszBnuIG6okUSyCwpU7BaR8OKT/yyAJM
	PAJqlsDry2Yz5Cfzzrx5EHoFkM/Md/uzbwI3RR1jYLZ/ieDDDqCFPR0IHwHBwJXTjfUmlLw2lSdF7
	OkyHBbP2XysjxgiW3J6ZCa/85zpmgCAsiYpOmtUV95MMqQkkpAAh9Snlz+QRAu5qR1KcI4VmU24O3
	apsOXiwf2YL2pBSRASqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvjkp-007mZD-Sm; Mon, 30 May 2022 18:04:35 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvjki-007mUd-P2
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 18:04:30 +0000
Received: by mail-pg1-x533.google.com with SMTP id j21so10688586pga.13
        for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 11:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=subject:date:message-id:mime-version:content-transfer-encoding:cc
         :from:to;
        bh=HFuPbXxjbDk6S3pYsynOoFPl0MlzupKqiFwmJbQaR88=;
        b=hn/QBWOmZi1nZrEVeP7eOIa0WkT1nTVa8veNl4RgYj8dktckHhrt8sNA37kkioEcpW
         4T+nok2Ho+Tspb3CfZOaZ91SKGenUB6PjdlGyFDNV9epvg2C0OiTQZtg1QOK79XXBh2/
         EFni2XliZqiKtmOq7KuyXuvaJcLh7bCUEuJv/cbBfoB1uOGsdm/Qjs1btbbzyEB5+nKE
         P4tT14DHDUMnkjVuK2VoIOGB03bMXojqeZDdFfThpjLydBn6CRBDm+YNRHwKYl/d61S/
         sWq2Wz8L2voHKrQfLXXJbxmj52nQ95PY/r9kQlJoKRQAuLxkfSjTA64vqi8ubdoZwQYl
         /zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:date:message-id:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=HFuPbXxjbDk6S3pYsynOoFPl0MlzupKqiFwmJbQaR88=;
        b=MPiWx8EYN3d/+/WJc4uDV9oBcxzygJ3RgSBHWUj5wr9ERKb5kZYxzJRMhR71tAV5ea
         mptsZBY0nkNKRCHGE1Og5dISi8LW3Q39Q5Tz1PmXKNd9QldkbtKqec9q1TaFuQ8LVw4H
         NF2uAg6NZt6QQwiwufsSwslGzZGbiN7tC2b0J1uQOlCBqRxpWsuZirRA7OmqeB2duu9U
         BgCaU2/YFP5RxZ6vni90M31I1papvRPngK0DgdLvYtZNVnOdV3qghKI1plAn2+PGm2TJ
         DKwDy/TU/qpGI0/y5jhNIq14YL7Qgccg62Uct1C2E5cyqQeZWrJ+p+hwDMwAQxWN50oe
         Flmw==
X-Gm-Message-State: AOAM532YoA1U210zr6WxEcja834i4bSDez44M4gWrqWsNfhLTcSXFr4D
	fypdGICu4c5+DkM8T933HI1BEZOp+NPJXQ==
X-Google-Smtp-Source: ABdhPJyVFjZt9jfEZzVHyghtZhTE43eVNIWHZEINssYkIQDJzbZuEkqY7Ax00a6v4Ica5eJ1KQC5+Q==
X-Received: by 2002:a63:6806:0:b0:3fc:3b43:52d5 with SMTP id d6-20020a636806000000b003fc3b4352d5mr2159706pgc.319.1653933865262;
        Mon, 30 May 2022 11:04:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id m8-20020aa79008000000b0050dc76281d3sm9332540pfo.173.2022.05.30.11.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:04:25 -0700 (PDT)
Subject: [PATCH] RISC-V: kexec: Define arch_kexec_apply_relocations_add
Date: Mon, 30 May 2022 11:04:09 -0700
Message-Id: <20220530180408.16239-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_110429_082300_5C84DA34 
X-CRM114-Status: UNSURE (   8.39  )
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

3e35142ef99f ("kexec_file: drop weak attribute from
arch_kexec_apply_relocations[_add]") converts
arch_kexec_apply_relocations_add() from weak to ifdef, which landed
while 838b3e28488f ("RISC-V: Load purgatory in kexec_file") was in a
different tree.  This converts the RISC-V port over to an ifdef
override.

Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/kexec.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index 206217b23301..a38769d50a80 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -55,6 +55,14 @@ extern riscv_kexec_method riscv_kexec_norelocate;
 
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops elf_kexec_ops;
+
+struct purgatory_info;
+int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
+				     Elf_Shdr *section,
+				     const Elf_Shdr *relsec,
+				     const Elf_Shdr *symtab);
+#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
 #endif
 
+
 #endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
