Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB71C3DA4D
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tb0QBVWNG3zh4ba98N/i3R9yUUM4hEwvIMnuGSrsWwo=; b=YcO8FseQWz0Pdu
	1/gYz7Gwq+BhzXEnxx5SBRWWF8WA5OUbeytJhx68yJWIoKDeqR88RZmgrDpBB/pFOJGk2UBnIfliz
	fn1SCA0p2soPKSGNOcZVg8nAH0zVlRoOA1S8vME/WxRPj+dlGJXIcXV/FWb2oBGcmY80kEDopsbVW
	zo9u1WY6PYCgLtAVjE0QUOjbPkqyAPTOspcW8exuLita1WOBa0gb5YIaqGb66+UlV3B9Sy2sVV9Ml
	afbUrLtsqfk4Z1B0XHY76puywyaj5X1K7Ys4lT+E01ZPMn3JPl1JuXJhlOwqVqcGjgIEcRSTKVVvB
	nUVrIqZk5oWPO0gKGKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWfmv-006mTb-20;
	Thu, 17 Aug 2023 16:23:57 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWfmo-006mRQ-1S
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 16:23:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe5c0e587eso683785e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1692289426; x=1692894226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGSwnb8GAVoGMDqfa8fVfToggHQlZrwZxUPGf234bZo=;
        b=B2oPIkHIKrlDOhEIojds91G4hZLMTEQojbocwjctEimMXAckTxYNauZNDFSVfSR4rL
         /Di72fwpl91LqxmE45qYQmCfmzMVLxGrexVbF2aQvX2cIlQCg3dVlxHx6+OU/ItoqN2b
         ukmDggrEXkBNUvXmrsdJRUgk8HGipXt6Sjeyrq8MHnrDDxQ/TGUzVmIYryPvNt4aVkYp
         qU9yNUbsSQQe1VypIudt8wy+1/HAU0pPN+fQU1NNRA1qmDcvIkxQx80HSXIxPNAyjVO/
         qA4P3O71U57cbguI7eI/r3wg0bXV7ENIxclGiWKTw96HutmqNBl5lFnojV/y/S8vh1bl
         mvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692289426; x=1692894226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGSwnb8GAVoGMDqfa8fVfToggHQlZrwZxUPGf234bZo=;
        b=WaugYxA5XB+rFLEAjOIoMEz2C/0Nez8f7Gc6N/WmDOkIMqj1FGLpwJXxsS+BRPpiw5
         IHBA7+JB08yV+u6lkGR98UI4efN5Be9hdLsXFWGxIJNXrl0sUYFBMznub7v65kGxv7mf
         HJI6idiTbkJdsZ/5ge3/pAcPgQV8QoAZ4TGt6Ms7Xni+jNTRiBLr5+kZ5qc9XUr5b6Sv
         fPKHTUnXQxdmeHlXmvIpIlcfY0dAzf0Je8pEl2K0oAKI60XZQ51VdwJ1X1Gqk3H7aWMf
         1ig667RpQ1rMfwCuFPHBt/KezaJ1llAWl3Xt0r/wYxN+6V1LapGXV3HE1sLUvUGq51wb
         TgqA==
X-Gm-Message-State: AOJu0YztgUi8YIhVIcW18p9DJ4iE+T9qE1+iKdYqNSPVWGixFkw7XuwP
	HDNTTE5QaS94QnO95fnbSjw0gw==
X-Google-Smtp-Source: AGHT+IF+D5cD3dgYIk73+iRrJc6YkWu7HG1XWDcStuIoswCFl3Uoxv3DROk61h1ivElDCsFbabdWcA==
X-Received: by 2002:a05:6000:1292:b0:31a:d90e:42cd with SMTP id f18-20020a056000129200b0031ad90e42cdmr1622358wrx.35.1692289426506;
        Thu, 17 Aug 2023 09:23:46 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r13-20020a0560001b8d00b003143c6e09ccsm24998838wru.16.2023.08.17.09.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 09:23:46 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	haibo1.xu@intel.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests path
Date: Thu, 17 Aug 2023 18:23:45 +0200
Message-ID: <20230817162344.17076-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817162344.17076-4-ajones@ventanamicro.com>
References: <20230817162344.17076-4-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_092350_501401_97EB893C 
X-CRM114-Status: UNSURE (   7.69  )
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

With the introduction of the get-reg-list test for riscv, another
directory has been added that should be tracked by riscv kvm
maintainers.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f966f05fb0d..8fc9e6e7f207 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11463,6 +11463,7 @@ F:	arch/riscv/include/asm/kvm*
 F:	arch/riscv/include/uapi/asm/kvm*
 F:	arch/riscv/kvm/
 F:	tools/testing/selftests/kvm/*/riscv/
+F:	tools/testing/selftests/kvm/riscv/
 
 KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
 M:	Christian Borntraeger <borntraeger@linux.ibm.com>
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
