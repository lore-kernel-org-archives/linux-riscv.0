Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62E1CDB479
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3cbggsFEq00ryVB6l2+85kfnZRcbzRWfkzjKp/T7zQk=; b=3RhvJrWgDQtKVD
	RHGOm6SDKpkc08rUdROK5aKc2lMUPFjf+Pzxk05N86yLLyf2CGHqxh/yxDEaHM0I4Xl/UTwpcpm4q
	qfbT8vp7QIa+l+dByfrFhKprcbPRAUa7L9d3paeE8QT0WIML6WGcwQlYFs5K/94gNg/buagkabUIs
	2DOysKqjANnnrzr+gaZCkq1cFEfexm204x1w7sVKZ/G7HVgl0AJSPsq4DSt+YIRVvL5Z15QUMa5fB
	dwDVMIIoK0H4KSLqQPvNzHfVIcUsVKi/D6VYjEjrznSUfSaF3obHxLhLdVXfQwwszC7i1ipjFNWqr
	IvoOsIqtx4ywiUZNWbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNFy-00000007n4p-1Fws;
	Wed, 24 Jun 2026 13:03:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNFv-00000007n3T-0Qy9
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 13:03:04 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf1cda2b17so6293415ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jun 2026 06:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782306181; x=1782910981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQUuPMmuv/cgtI0GhaDa2PT2gy6UgZhnkw9/EmvR3IU=;
        b=Gn7xyPqtwdxC3fTZ0eOv2u4lMs61AcbErBObYwE2yyukzKyZBKZfSwBjoA1rwW23FH
         0RTu6m4vq7TFTxGhMkvmobHUGYuwx2onjpLCcuyqND3qtyKghguzCik7gAsZRxzG+/YS
         nnj4p+wqA1HUXCrrE/gWfWsgJNtXgoS17xf7jqUAkh8tCvhL1ABR3FmVIXJCFIfOp0lU
         qBJvyDItecQb3dbhwmRa6O8ZZB0q2Okr1phrk1PkDbaXa5OfgeDrj3JfibDqmi5q/8RI
         NAJcMyTbfL+CoxlkW1nofUaS/e997jbk+6jUIa9vZEpF9TOHtmrHvby9sDq0DgIO5uCm
         RLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306181; x=1782910981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQUuPMmuv/cgtI0GhaDa2PT2gy6UgZhnkw9/EmvR3IU=;
        b=p7WI8wEpTcYKpWfW2qSCYf06o07BbQsrxFlwqICK9mbNp4Kud1/Bw3ItzH4yv1JJyk
         GGe5CWO7dudsvQbY4Y9cBK1p4nxJReutzKUPjmWN6yK9wx3CtNHuhzuUTZCnTZ0QdxNN
         W6tICX0RbjtMRpkaip650UDB17zJhuSuLw6X4HR5heQ4dUcPxFOwpMh48isFsLMO51lh
         OEJ3Mwck5Ksb9RBh1Wau9hUbRrz1syZyxU36iSXnYUw25Al6DPIixeV55cSfBJ7IeFi6
         1/X0foFuwYNWIH1+dxsrfVIteDL3k0kXIWRrquDk7Fyjd+welM9kI7DmFyxGxxOnvRtM
         4qbg==
X-Forwarded-Encrypted: i=1; AHgh+RrBiWD0R52vQw62RCUlTKvLypaTGxsNEy9g6BP+z0FECMjWcCS1nWbWbPGMJA5oEH0rTpDSkt5rUraWqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5lgEaCIWe6ZqjfdeB9bkeMzbI6m+lYgiHGcgorM0UArP1K93W
	jxD3wwgNpaTJHVVKM0/FEv3Up427vJDsF3LX5CdJF0CNrorSizfWBSEq
X-Gm-Gg: AfdE7cnuhiY3/beR+gpuJvcRurLBSyWF8E+x1VoJ8+XFcICIf9JGqnztmX1Q7umCe+v
	lNtwMw8xQCAE3HMy5UFDomJNtuLqx0pJlrl6T0k56W9vnAkDhY6BA4HuN6LIaOOiqjHDPnwO8aQ
	IxTtQ2z/xoUhiI9FQfu7CceD8YE3Z0IaE8DCcqWSH3fKtT2ngFTM1aWa4L1wllRsFIn1XOWaPA3
	L6DpSFeUKiX4BwXaUWT7QLFCjyjXlQcmoqzV2VeoVidiiuTc7eOsE47BZROpwqLQRPFydkXEVGp
	8WyZRnVTrvtGziuoDpWU2WeX8GlsD3nsiOmRpwt1rWwCieGZpD64wW4VLDYU/Pg8Aq7OrcvI+xt
	xAtWbwsW5Sim49+ztQFwK1HZh69M5cFgoVDGstfyLRyS2CX5s2ih/2wpR6czpCf3G0htjEa2zbN
	hjzl59ZGuFgUcCr5T9rWQZ70lMxoDneFwDOMu4gZrEplQlSpA=
X-Received: by 2002:a17:902:e5cd:b0:2c6:a4ed:efec with SMTP id d9443c01a7336-2c7c40168b9mr61894555ad.27.1782306177091;
        Wed, 24 Jun 2026 06:02:57 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad8esm134704505ad.76.2026.06.24.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:02:56 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	cleger@rivosinc.com,
	ajones@ventanamicro.com,
	skhan@linuxfoundation.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] KVM: riscv: SBI FWFT: Apply LOCK flag only on successful set
Date: Wed, 24 Jun 2026 22:02:38 +0900
Message-ID: <20260624130238.524706-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_060303_146530_DDFF12E0 
X-CRM114-Status: UNSURE (   9.68  )
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

kvm_sbi_fwft_set() applies the caller's flags to conf->flags before
invoking the set() callback. If the callback returns an error, the LOCK
bit persists and the feature becomes permanently locked without its value
ever being changed.

Move the flags assignment after the callback so LOCK takes effect only
on success.

Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index ab39ac464ffd..1342adb3180c 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -327,9 +327,11 @@ static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, u32 feature,
 	if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
 		return SBI_ERR_DENIED_LOCKED;
 
-	conf->flags = flags;
+	ret = conf->feature->set(vcpu, conf, false, value);
+	if (ret == SBI_SUCCESS)
+		conf->flags = flags;
 
-	return conf->feature->set(vcpu, conf, false, value);
+	return ret;
 }
 
 static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
