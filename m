Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0406DEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Om+U58Se0vyNcXnCtQFxJzAg/Gf4WyxIQFeFGoHMmqM=; b=OPpg3tteETloCt
	MXU0/DYWaLUA9w7xWE21wemGTJVBXaVh3klc+As5GqiTL1ScFE9SgJOA9/Wxnz0htmu6jKlFIU9ij
	tj+ewhQlQEFw/Rym+Sznk3yKMuujN8I/tNKtNuZ5E+YrfL9qExSzE8fG6Ct/pqgAPUH8gb7U0F2xY
	wmfCkFfjQnf8gXxXR968gKZpfGPpV3Kckty8Tk4n+prKvwFhtH5OwX6uZcTkhnvdk6MWbwg5gJWHy
	rrWWMuCcLhXpVEGruhsZvl7lBmBokC7DHJhWiBDpwnJYO4/npt6lX8n6hiqQtc80PDpnzl0+TB504
	DI7OTQPzs3bygXgm+ovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hK4-00Dz9g-1K;
	Thu, 15 Jun 2023 07:23:12 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hK1-00Dz8z-1x
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 07:23:10 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-666669bb882so1262904b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 00:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1686813787; x=1689405787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXQ+dIDtCVIjIX+MeG8QhKXJbzz55cnjcb5uSiAVAyQ=;
        b=k9WZ8msNpIYvfOvB7mgrS2d8l3ehr3luCbbs/hRi+0oksVCFFP8y4/1gvWSn6tniL0
         DYxkcw4rToALfY945jPpry0SmAn74Hnh/+o61BtlnbUiEIjRbxR3csI+j8nBtsw1TLX3
         0B5q3WjoTPQSYAry8HdWq5QiGw2+ysrteZHz2yzv7zOnwXM5RyHj8gjUbKVs6crGaLUF
         J3qle+4RmgQ5QF9dZbil7/o1YU0kyzqVULc6+AXlo+ZgU4EVOzGIihdfRhPaRWz8gztn
         Lqa+NRcjymq09KDAMmCBOhSCUzi5xDxkQ4g+6kr/d53jI2hqomDYTxfJXn2x8KeU9WER
         CnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686813787; x=1689405787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXQ+dIDtCVIjIX+MeG8QhKXJbzz55cnjcb5uSiAVAyQ=;
        b=SExVrsR8DQo0OzBTUy9+UQAcS3h0KNR8Yr1SZWZFMSDkzQDwiyO6n601ZN9SXUeFQC
         4eFr6Rs8boP1vhwMMtodE+rUlM46E98+jguMucpNRL4zTCX9dtLDDaaEV337ZNIpd9L4
         odBzH49DBADdbV+CzJ0C1PhA/R0vEdyq59T6JVOyDBc04jYbCwVLZOmKGGsvtp6EVzxn
         Je5IksViTlGzZbAYKGym5zyfJLAa95zhXhZ7koolm6wEV1ahmW4/b0YTYZFkdXnJQitx
         lODaM0jSo/VRQ7HQusHDYSq3rBNOvFSiV6JIHKeCLMt2z0ynAGvNQydxKIGkItUHKTLC
         CRBA==
X-Gm-Message-State: AC+VfDyTruPZqUVkDCkrIHkhe8M0wZpdza0uVNcSPcVrM/JxQnbmQCx1
	7qKdcr5P4JjUJmzdSOY1z26jRA==
X-Google-Smtp-Source: ACHHUZ5w/6Zh7eSyl8NNQwcHfx2tXqXt97Hs6Lh3limWYTSd80JJE5xoWAZwMDR7QMh10WT+LIey2Q==
X-Received: by 2002:a05:6a00:1492:b0:655:89f1:2db8 with SMTP id v18-20020a056a00149200b0065589f12db8mr5741966pfu.16.1686813787279;
        Thu, 15 Jun 2023 00:23:07 -0700 (PDT)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id i17-20020a635411000000b0053423447a12sm5123697pgb.73.2023.06.15.00.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 00:23:06 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	jszhang@kernel.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	nylon7717@gmail.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v2] RISC-V: Support 32_PCREL relocation type in kernel module
Date: Thu, 15 Jun 2023 15:23:02 +0800
Message-Id: <20230615072302.25638-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_002309_673066_7A00F6D9 
X-CRM114-Status: UNSURE (   8.62  )
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

Fix the 'unsupported relocation type' error caused by
enabling the -fasynchronous-unwind-tables flag,
which generates relocation types that are not supported.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
---
Changed in v2:
- add commit message.

 arch/riscv/kernel/module.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 7c651d55fcbd..65be0360a494 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -310,6 +310,15 @@ static int apply_r_riscv_sub64_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_pcrel_32_rela(struct module *me, u32 *location,
+				       Elf_Addr v)
+{
+	ptrdiff_t offset = (void *)v - (void *)location;
+
+	*location = (*location & 0xffff0000) | (offset & 0xffff);
+	return 0;
+}
+
 static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 				Elf_Addr v) = {
 	[R_RISCV_32]			= apply_r_riscv_32_rela,
@@ -335,6 +344,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
 	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
 	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
+	[R_RISCV_32_PCREL]		= apply_r_riscv_pcrel_32_rela,
 };
 
 int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
