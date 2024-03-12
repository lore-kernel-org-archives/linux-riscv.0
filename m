Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AFAC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 23:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DGKOhj2BLWsJ2mNSDrUK8SIfwLzZ8Cc9glAEzUtnWs=; b=kmiNPbKj1X3d3e
	hEN7OxjAll7r90o8XnLgVnj3pKin59bVCh9oYdVkejWYDHXzfCKJDxd2T2ZMiAu9oi5k5jXVC1CVC
	/1eCueCLfVibO40u9JIW8g+ppS8uoFIvUmzjKtwsS2o/vMYyzqe1wj2H1AjDg0g2eQITfyrz8xOKR
	rK0i3nSfvSPtZEFpLsEpbIeUZd4J3jH77ne2bEdeAumrb11B76TXrEnOtszVoSH3VBHbG1zyqdqJD
	i2bWRarHgqITruzPtBzmfnJPRscwrMeTeI4BdsBzf91Y/btSgIG/dj2q3YZGgGpzONV2GhzP35lWX
	tkksNv+EWlm+h0a8afQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBwM-000000081gu-29un;
	Tue, 12 Mar 2024 23:53:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkBwI-000000081do-0avJ
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 23:53:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1dd84ecfc47so23106495ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 16:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710287624; x=1710892424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXYFACIdPWJdwy+Yl+k20SzAykOCyOjeDPUfEzEnCdk=;
        b=HZyZ1VHj7ZmarW2pQjrRdPWyx4k1fnlc7IVrR+1ELhPiOSZevLOfm39cCpl4MTyS5T
         A5fxHtZGC5DAzpVo2yh0ANmVSw8T7oJ2QbjdMVtLCUEe2RL+o1/Vo21U5ukKMeFBOCLa
         l4tt94WPqxr/xwlpE+skrbuls0GuPQL/IR+7Qpv+HKcdYltUglWpxPRxP+xlHJZ+Xh56
         Q223fJcL2479fSYxCIjfivKdo/u164GfvimoAAQ21SgXFyGDibX/lsNYZxcFEj74qRM2
         2HL0oo4b6oI8vjNhBzYsKAZfm5gLCf6iwgY96YR6w2SjQqT81z6GZEV+WovRB3vSXJ/q
         3afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710287624; x=1710892424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXYFACIdPWJdwy+Yl+k20SzAykOCyOjeDPUfEzEnCdk=;
        b=WrKWEok3hldt1Uhj5hAHYNyJrLzjJ3dmeQHJ4ctE96Jukv0mLMNEW4y852uVLQzrn1
         RbEWuuWwI+6mmb/FKXPLEC3H+HV6pUhHAe1AMWzuKyiOJZScL7BgyqN0LDiIap9XU9/0
         As+ckJ3W5gZoVL8/54eqLgtnYBsw2/kXrtQDFZ6li4InILIeW7Uw+7wewaSj1pXV46Sr
         Yme8mIvfzaU8RppcIY1DpLLnZkA3nP7QiMTzdS9InPQtcVNqojIreOK8H7IJ8RSfzT8M
         NqP2ZcfivU5TfHx2QWmm4UzsFxtmrY4Z98eimZsPZJWfeWj6f3ifmCGLjMymFsK+8OLE
         0QUA==
X-Gm-Message-State: AOJu0YyyIe7NnyWTpMllQHb5ab5BmB0yErbY/teFRoca9ECT8j2rHcdD
	9DFFkyc9XDhjehSaHSAr5W8x9mJCIJ3qmw1w601Vgo/VJgpc51eT9YAcjX3AHWw=
X-Google-Smtp-Source: AGHT+IH0SfMIDZtbDgW+D7kbou1UQHEhchAClAhNSOZvw6/dDwtvlbI2nHGNgmwsKXGf11eS2MPl9w==
X-Received: by 2002:a17:902:cec2:b0:1dd:6174:c646 with SMTP id d2-20020a170902cec200b001dd6174c646mr3163048plg.8.1710287624279;
        Tue, 12 Mar 2024 16:53:44 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001dcad9cbf8bsm7282844plw.239.2024.03.12.16.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 16:53:43 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 16:53:40 -0700
Subject: [PATCH v13 1/4] riscv: Remove unnecessary irqflags processor.h
 include
MIME-Version: 1.0
Message-Id: <20240312-fencei-v13-1-4b6bdc2bbf32@rivosinc.com>
References: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
In-Reply-To: <20240312-fencei-v13-0-4b6bdc2bbf32@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710287621; l=659;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=kzrpE3Jf/ixYwB6jIjCMuZiuZ4uucOwZGOq0f8reVWQ=;
 b=JdUmv9KuobgRo10PoWynjhbDzqMEbIcDakiliqU/bWiH/yeoVaClcS5c6gI0xUpubRXXVWRFH
 vfEzAOtdC8OBOMPEPNikt9gJbUM6yqYKdtTdzPyRLqTmxVZE5W122JX
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_165346_221502_C1FAAF9F 
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

This include is not used and can lead to circular dependencies.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/include/asm/irqflags.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 08d4d6a5b7e9..6fd8cbfcfcc7 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -7,7 +7,6 @@
 #ifndef _ASM_RISCV_IRQFLAGS_H
 #define _ASM_RISCV_IRQFLAGS_H
 
-#include <asm/processor.h>
 #include <asm/csr.h>
 
 /* read interrupt enabled status */

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
