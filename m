Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F29C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWrjJXBG9HOPYJxRpVRPg/ShTNSVjjNeMdTnuWbUF0o=; b=pTBolzQUTTmESY
	HHVHOs6YBt/KNY1mjA342UitxGNDRTuYmCy4Onio5Z8KXba42MH/hLiESBLnLSl9NsO88E2sT04YC
	6U98au0dTw6+4SOQcuvsRCK+yoeEo341GXPM0xNNY7sEFo0AIbG8OJeHLlFnX0tIo0EnPAVlOvVjt
	Firm4hJDnjNAzAeCclzdYSFkUQxKZzmIH3G3BRfe8t+Mx7q0+XYCdstNYAx7eFDxtYq2T6DdV4mNK
	s8Bqpw4/dOjSyO5GTJeqwNM43yAnvSjFZquZ/NpyEswzlNtDlf9rvxt4cBnALZ+fXYFjraEsY1PTa
	Rs0tCVWVYkIeX6nue4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4p9-00DK3B-QR; Fri, 20 May 2022 15:45:55 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4oj-00DJjh-7H
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 15:45:31 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so11811221pjp.3
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=vc6UzMZJ99rPT/oGbTC9rWGA9q53ZOjUpC79nvKqcAU=;
 b=xn7tGQsd1Ammyb30tKhGhYaTasZDR6D+KopoaEElpoNqc6cGf0hpG8c/xcaW+oBpAb
 NQDMz08xYT3+AcMmulQAk6hqyDWTp+nOeQiNtJHz9aUl3GAakkxCzJCkqmNuICNj6ku9
 Vl5uzJywr8dENe3WususOJPHvvwQ2N9Zb7UXl2j98MpGfkZKlVUup3aNUYpiWXSSsMnF
 HepGggexSW9DzDTaB5r53P4KdrOWLX4hD7rWWZIHZzryaJzlILIHBDAqaXM69uvA+q0+
 HTb8rFfgcXIiymlN8fTxxIcV4a/06ryRKb3FCuQF+PfCqhJ1VLcOJ4sJZ6Wafv1dnUgs
 vWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=vc6UzMZJ99rPT/oGbTC9rWGA9q53ZOjUpC79nvKqcAU=;
 b=J5JueVxJTbtD2Wd4Wi9+DBhsr/fQLqx365Mt8ASCU15bdpHVEf7GTkL2WkTejaLyQv
 DBPbSTo9spBW6t8L4R+TnBAigo6oZHadaU3ualswB+fWkxMHDKzTTgFizvhO0g3TRAzb
 5dkhkwjNFWOeqfPub/isVeuo3fyqPX0xV1eQr45Ykgs62ccmaDw5Ol+nCkxYGYBlsZsS
 JCEm9ueo+hHuiTsUhyx9wRy82wC1y6QDsn5aAzvuXHe2zLVir1Aw8Wfu/LOUjdd1GkXR
 xnECYq9AcMWOhPjDmuEM1scXUbN7UkTOxcWK1lgKhw2e3l83NwmFlzuIMvZV7DDDJnjS
 eHOw==
X-Gm-Message-State: AOAM531aAMccMFn9pKk892CM1O68C562+ZxhZZSFjehE55dIbHKVYU49
 d+zqRgPOArdt4KGiRlsBezZrvA==
X-Google-Smtp-Source: ABdhPJztQKNxzDANcIjGDZLNAGCofYLcLEa+w82rs1Ze6iiV8t755M1LTaCfj73BRJaCli8PyHWtOQ==
X-Received: by 2002:a17:902:8c98:b0:15f:3e78:dc43 with SMTP id
 t24-20020a1709028c9800b0015f3e78dc43mr10194800plo.120.1653061528884; 
 Fri, 20 May 2022 08:45:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 hi4-20020a17090b30c400b001cda0b69a30sm1987977pjb.52.2022.05.20.08.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:45:28 -0700 (PDT)
Subject: [PATCH v1 5/5] RISC-V: Allow kexec_file() on 32-bit platforms
Date: Fri, 20 May 2022 08:44:31 -0700
Message-Id: <20220520154430.18593-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220520154430.18593-1-palmer@rivosinc.com>
References: <20220520154430.18593-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, robh+dt@kernel.org, frowand.list@gmail.com,
 zohar@linux.ibm.com, 
 dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com,
 liaochang1@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lizhengyu3@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_084529_319230_3CB28BD2 
X-CRM114-Status: UNSURE (   9.66  )
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

With the build issues now sorted out we can enable kexec_file() on
32-bit platforms as well.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 898052ff743e..a246f2fe60c2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -388,7 +388,6 @@ config KEXEC_FILE
 	select KEXEC_CORE
 	select KEXEC_ELF
 	select HAVE_IMA_KEXEC if IMA
-	depends on 64BIT
 	help
 	  This is new version of kexec system call. This system call is
 	  file based and takes file descriptors as system call argument
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
