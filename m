Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC302C64EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q91OhDQkGu5c1cSfyNNr4+6As/oaOqpmy4usTUTe7EM=; b=4MtVPeAeABYchD
	cjLwgPsEg/pChqK1Col1VZRLpgGJxDgCb64hYqJ+hMcRltpp/8b/R5LJMU+DwkiZTSm5SbKaDdQ6g
	rTmhQ6TXns5MMv3FdLaMcOPWS8zO3jZhYDirsb2ncOIZ3D3aFolS3MYZvk9Jx2Ja+/rGcjjHDav8i
	KVXlW1OTUhoVHeYFC5FxuiYDnJAd/OIEX+BbKIAFdSE/8vZ9JCltJa71IRr47Ztq4sAE1GnX1tKSE
	XdO6b+t5LPqhidYWE7e0IkjU5MZdlBgqt2+0lZ6i/n+YG/tO3eroPj5UECJJg2W83GBRzBvxTRxhF
	dPz5iV1J3Pm2oM/xgU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUZ31-009fh9-HZ; Tue, 21 Feb 2023 20:15:35 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY0w-009Uo8-O0
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 19:09:26 +0000
Received: by mail-ed1-x536.google.com with SMTP id da10so22603821edb.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYNxCoy2kO8Df1US+5U8F6a2dVH3sUiqyDcA4T+cIdk=;
        b=EYITKlLr72rNFqewRWkBcZIH/vOCjOWBdgaXGm/V1n/d566Z7FAxepJOy1rHCPj6dl
         iZPY68A8qqNpvLChuWDvncH9eb8FPlf9oUzkfajT4Y0wErspOI9prAtce1ortH1TkJMQ
         0GmxfCml7vv16dNhye981zY8nbwUXe1dnK7tWuhXAjwDCius2dbj0JGupkde2qZiZOxU
         zOu9rPfITBTwRMfp2zkXJ2gaRU3w+V52Y3zu+OdjMeTJx6iDbp8UK3soMZ3atBudw6e6
         lF/NjUB56yU5KdfYM1Y3ZQ4YTKxtInhjUAkYP6NPkVzLPR3un1vHHidHWNsE/wI+aOqq
         aHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYNxCoy2kO8Df1US+5U8F6a2dVH3sUiqyDcA4T+cIdk=;
        b=gUUJkgU9Yhd/Gwolho/z+x8wH+Cs2QKL6Fno5fbm0Wbk4ZaktJMMCb6fxgbaW/x6NN
         Y6pYsX7fDWMSWWEffKUR1aHkiHhy1XK5Ozmqp2WH6w5uJ7Ad8ioKCfIWrM/vLXRz77Ru
         JvP4GURW8XvIo2oShIzzDShbRhsV3pmcVzuNqg6ru1I5LEktOjy2aUTiXHxxC3WRshVS
         U7R+lPqF8N9AORwf/H/uOr9Bryceq3nIBt+3lbqxNTblp+enzsHem07bhkfk3L3V0MUg
         81TUaWl3OK8QevWknG7Nx2XnCXnvwBK48YpdG8rFrNbgHpmp8vo28PAD1tIJbgWm9zVl
         5llA==
X-Gm-Message-State: AO0yUKULRbZD4RZX9ZMVk+u9Y0dXMVMGAWZoi8Vy6sS2uT2TEE6IYO6i
	TFL0HKKT90232eptTxIxsTfUZElwlrahCJxF
X-Google-Smtp-Source: AK7set/w5FjER/3tKGB8RECJxQK3hqRtMHjbasbAVUNEy5Da6xeEsfNxs3m4JYfZBwWCY/jOTenDiQ==
X-Received: by 2002:a17:907:1c0e:b0:8b1:3159:2eb3 with SMTP id nc14-20020a1709071c0e00b008b131592eb3mr21055233ejc.43.1677006559385;
        Tue, 21 Feb 2023 11:09:19 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f6-20020a170906494600b008e240be0bddsm733310ejt.140.2023.02.21.11.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:19 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>
Subject: [PATCH v5 1/8] RISC-V: alternatives: Support patching multiple insns in assembly
Date: Tue, 21 Feb 2023 20:09:09 +0100
Message-Id: <20230221190916.572454-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221190916.572454-1-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_110922_799348_07FC9484 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As pointed out in commit d374a16539b1 ("RISC-V: fix compile error
from deduplicated __ALTERNATIVE_CFG_2"), we need quotes around
parameters passed to macros within macros to avoid spaces being
interpreted as separators. ALT_NEW_CONTENT was trying to handle
this by defining new_c has a vararg, but this isn't sufficient
for calling ALTERNATIVE() from assembly with multiple instructions
in the new/old sequences. Remove the vararg "hack" and use quotes.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/alternative-macros.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 993a44a8fdac..b8c55fb3ab2c 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -14,7 +14,7 @@
 	.4byte \patch_id
 .endm
 
-.macro ALT_NEW_CONTENT vendor_id, patch_id, enable = 1, new_c : vararg
+.macro ALT_NEW_CONTENT vendor_id, patch_id, enable = 1, new_c
 	.if \enable
 	.pushsection .alternative, "a"
 	ALT_ENTRY 886b, 888f, \vendor_id, \patch_id, 889f - 888f
@@ -41,13 +41,13 @@
 	\old_c
 	.option pop
 887 :
-	ALT_NEW_CONTENT \vendor_id, \patch_id, \enable, \new_c
+	ALT_NEW_CONTENT \vendor_id, \patch_id, \enable, "\new_c"
 .endm
 
 .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
 				new_c_2, vendor_id_2, patch_id_2, enable_2
 	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \patch_id_1, \enable_1
-	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, \new_c_2
+	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, "\new_c_2"
 .endm
 
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
