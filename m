Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665E8C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 08:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WSJ/Dt93eKTuf3XFFOYQOAw/elkMJr70M+D2FzDpoBY=; b=H/oXOWPYgYVEOW
	DvIhfbaj3xqvBYba1wugxoR+CHW4XTzFFxDYimneBPfU1ODN/aZ+yjceWuZQ+8eaOD3JqD3UV+1LI
	Xzp2n8YHSSWP4umyO4MWLGkJijTQ9fgIOhXUh03XAutx8ZJ+3223oH45/xOjn2O7QX+mJvpj+rw4e
	WK8VSfkSONuqv4U1a9+0zUuZooQxlhep8HcqF7XD3QKA/+sbymRLVsbg+Kplj1MxFxL3Goepj/R5Y
	KZV78Jsc+VAtv8HJldt2Rn8htZ+pHvmftp89NQmOlZKdEjvmXHZ6o/CQl3nSr6+J0V2bLMPoYmA4g
	DVHrodo116MeTz4dNCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKatY-006LP4-TC; Wed, 25 Jan 2023 08:12:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKatJ-006LCQ-NC
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 08:12:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so2040059wmq.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 00:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iyJXSqP7CQm+h+5+1oMeWkfZOWd0y631bmCZOmSTMyk=;
        b=U1tQ4sQMqpKkkDDWwHt7ZgPqHAKCJeMt1uKYltAzs2h6l9hw4T2xJNSe/xeFcet/e/
         csG39fgFwY2TqfLyRb0HhdaCBinxbA73mLJpGvXw7UxOEsGNL6BuAaxzQjpHu7Gn5Z/3
         cejorsMJW4ya9Mw2LYIBstGIRb9WrgIDWPEVAUTRGF1f486ttdA8eZRbiMoTApJHnPVg
         9oK8RQ9J+d9frUa7biTHAnpYLUiWPwPsgq6LTh3va7CIrem+UYgCZCNqce/ijtTrZ6EI
         XVXuV7P5E9cwGL6bUpcXIrSZy8OZD1hRiYkNlQUXA5twnIxQT/I35wQ90oXDflWqp+lz
         41YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyJXSqP7CQm+h+5+1oMeWkfZOWd0y631bmCZOmSTMyk=;
        b=cG3YAb3lh40gZ7xQmrCWt6juotT+5is+FPuCl/OTWxYTyCg4W63vEzNY4DjOGEdtTj
         V51YypHejGRBpFRncIkBlkkozIQurtD9FVRzuracv+5TkqfILNcInEcN3feKx8Ip4qC9
         KmYzZfP74uFfUaYSu9W7M1SLWhbOnI+K++jBuV2EQSaLFt+zojspyEZfIMgoi4TXGIsP
         fXZeLsREEtCJUjUf38z8O/xm5IN0jAvURFLuB63/dPZvYjTAMtppPztVzVixBqH6+j3Z
         M/2srVMBNJSDOPCsqw0lQO59ZhFWq6zpvkU2SJwOp8VNOHehexxhzimnC4Dx6m0fcTUW
         7TZg==
X-Gm-Message-State: AFqh2koSNP06IJVvULM2BZ7Z4g1Zpbj70eQQ1VUnBm9OrqC04iUIIGf7
	nazPi5Q6U76IhBEnA5+8txM03A==
X-Google-Smtp-Source: AMrXdXvo/5JiqclykmzIB1NdGAzJlDGhKgsGjykOeNA58K9JyuQOPNNN63ZjRphCQmq7Rvir8ugUsA==
X-Received: by 2002:a05:600c:1c9d:b0:3da:db4:6105 with SMTP id k29-20020a05600c1c9d00b003da0db46105mr30909204wms.37.1674634337244;
        Wed, 25 Jan 2023 00:12:17 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003db012d49b7sm6028511wmo.2.2023.01.25.00.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:12:16 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 0/2] riscv: Use PUD/P4D/PGD pages for the linear mapping
Date: Wed, 25 Jan 2023 09:12:12 +0100
Message-Id: <20230125081214.1576313-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_001222_035939_E9790A85 
X-CRM114-Status: GOOD (  10.06  )
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

This patchset intends to improve tlb utilization by using hugepages for
the linear mapping.

v5:
- Fix nommu builds by getting rid of riscv_pfn_base in patch 1, thanks
  Conor
- Add RB from Andre

v4:
- Rebase on top of v6.2-rc3, as noted by Conor
- Add Acked-by Rob

v3:
- Change the comment about initrd_start VA conversion so that it fits
  ARM64 and RISCV64 (and others in the future if needed), as suggested
  by Rob

v2:
- Add a comment on why RISCV64 does not need to set initrd_start/end that
  early in the boot process, as asked by Rob

Alexandre Ghiti (2):
  riscv: Get rid of riscv_pfn_base variable
  riscv: Use PUD/P4D/PGD pages for the linear mapping

 arch/riscv/include/asm/page.h | 19 +++++++++++++++++--
 arch/riscv/mm/init.c          | 28 ++++++++++++++++++----------
 arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
 drivers/of/fdt.c              | 11 ++++++-----
 4 files changed, 57 insertions(+), 17 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
