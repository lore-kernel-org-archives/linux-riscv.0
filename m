Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58232C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WRXZmtO9OeSpvud6NadJxedQk0kC2B3xf18oQwfNxOg=; b=Npg+tCHLW8vimv
	XYEnFZ1X8AO789sG9NdxNLk5OkYTJhtfl+OhydYbRf0oa4jAX3oS8ChxB4p5zB0JJADxHnun0rC8X
	gpwAricP7CYWPphwC7Nsic+iSxbadmnXgHN7YUSnN1kJqUhhKcNYZHsR643v5ugVM1eamzXn4Ic/n
	IcU2WRs+xgcXN+fq8fuOdEKi1LFpwSCsYuVbI0eAHHgXJusEUx149e5a8oiXn2l6kvrX4wH2HkCK6
	wk28BMqLo5oUMN0sSFWgQCAXZ21PpPkvAxS953u/DN+H/FLlgQPzoh7rg19j9in2WCU7i9BBQ2FgC
	1/EoOd1syiAppct4ENHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGF-00AKSz-2I;
	Thu, 03 Aug 2023 16:33:15 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGC-00AKQc-2D
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:33:14 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1bba254a7d4so769340fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691080389; x=1691685189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ILMTrWynO1XeQZo7Pg/qrvjmupOG1msKuU2sVES4A7U=;
        b=FVmdL9BKhYm0oI0J4dt4CGErWoGauSC4HRBJ5n1Etp1kEGIvThQH1Dh9CwrqzeD4IJ
         zwL8q3eyWF7EBEkfjkbJjM89k6iUWCH2y/BdjTIqnPb8iZFKRYTMHjxg2+8z8ahVZKFJ
         SPHAWwroS0984S4jWk1AxN+pNYputTym03cih2/4osNfduxZUZuXYd+6C8yH+fpbjDg4
         NhuCCWcT/L0CjreDuzfEuzfWWz6oPBgNmwg90LRZiwEVOcsWEuMp7IAm1b4KUtUvUMv7
         jJR+kDHl0BYDTieC8D8zTDz4EAsEulTGWrE3x6QeKTQIH0TD5gDjjjTVvp7XkZFvtEyW
         qHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080389; x=1691685189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILMTrWynO1XeQZo7Pg/qrvjmupOG1msKuU2sVES4A7U=;
        b=Lht7OxzmGmbkTRZxlc4VvX/OkAGo1fqNpi+XMAMA7rl6QKn943P44H/56UQ9LvTrqN
         4mAd85k2o+47ySBY74lR9PwOGvogoZCvbfOCxeE3QHKz0lo5jlfklAPzMn/ExS56uTNJ
         bwA4iWhmLo9uywsKAyNf1mUYXkVeEpv3ynEECHaXsTXUTHjE1aDparg+a5bprXM0KKdM
         LOwyHxioMwP+jRBZ3Rqm7ivdg6OU0IQz2X+jzWLwFbjx6Y/V8Kk9mNd3IUhk2KUODecf
         gWFctESEUdBgHtPWY8Ok4HuWpYgpWD1b1bSH1nOjo/h6Vtsg/VLNF2lJKEXHwcewHoci
         X9ug==
X-Gm-Message-State: ABy/qLa3miJeU46GkYH7ZpuPQ6IG9vKTbgipD29Om71N1TkEMsM8SSFz
	Yv4bmQT2pCNSDafpVFiJzxVM1w==
X-Google-Smtp-Source: APBJJlFtQ/kKMZtlpg91FxETCiMj0acqjG/Nc1UJc9kNAWDnlX6fQ7+E3ozHQnRPcxlPa2jRfPNJng==
X-Received: by 2002:a05:6870:f623:b0:1a6:c968:4a15 with SMTP id ek35-20020a056870f62300b001a6c9684a15mr21181995oab.4.1691080388818;
        Thu, 03 Aug 2023 09:33:08 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y5-20020a056870428500b001bb71264dccsm152929oah.8.2023.08.03.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:33:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 00/10] RISC-V: KVM: change get_reg/set_reg error code
Date: Thu,  3 Aug 2023 13:32:52 -0300
Message-ID: <20230803163302.445167-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_093312_723589_32475909 
X-CRM114-Status: UNSURE (   8.12  )
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

Hi,

This version includes a diff that Andrew mentioned in v2 [1] that I
missed. They were squashed into patch 1.

No other changes made. Patches rebased on top of riscv_kvm_queue.

Changes from v3:
- patch 1:
  - added missing EINVAL - ENOENT conversions
- v3 link: https://lore.kernel.org/kvm/20230803140022.399333-1-dbarboza@ventanamicro.com/

[1] https://lore.kernel.org/kvm/20230801222629.210929-1-dbarboza@ventanamicro.com/


Andrew Jones (1):
  RISC-V: KVM: Improve vector save/restore errors

Daniel Henrique Barboza (9):
  RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
  RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
  RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
  RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
  RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
  RISC-V: KVM: avoid EBUSY when writing same ISA val
  RISC-V: KVM: avoid EBUSY when writing the same machine ID val
  RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
  docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG

 Documentation/virt/kvm/api.rst |  2 +
 arch/riscv/kvm/aia.c           |  4 +-
 arch/riscv/kvm/vcpu_fp.c       | 12 +++---
 arch/riscv/kvm/vcpu_onereg.c   | 74 ++++++++++++++++++++++------------
 arch/riscv/kvm/vcpu_sbi.c      | 16 ++++----
 arch/riscv/kvm/vcpu_timer.c    | 11 ++---
 arch/riscv/kvm/vcpu_vector.c   | 60 ++++++++++++++-------------
 7 files changed, 107 insertions(+), 72 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
