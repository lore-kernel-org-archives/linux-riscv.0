Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B88DC04A94
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mixJ5ZCzFxK03kHRSXCinDaSFjzRUBY2rv/Cw4KGeQA=; b=YKX27tPq2nq73e
	bS+Eb3sTmPw4gYlFtIOcBezNAHIIXAyhxu5MXT3tDWDKNoVXo/iqAjrWrr+uhQy3E842beBjXB6mC
	66z5LNFCKnWuVGuavHBw9gJOfvIRY7prahi/W9l6z/giNP7mqyNewIpnjyJIvsa9YCA73rq3Gd2Id
	mZ96yQ+0bRrjGvmOIcxrAQeGvT7H18op3W+LCBhrgHsV2x9Nn7mJJSwg9skvh6Lb8txrV8ptvVRBO
	RaaKSpshwBUPLCOYyUrRq4Tdec/9pjJz+gY+Zn0TIDIX2M95KQJoSO1C4sAM37u2ChOOL89RcaqIc
	CwbE5tkJr0Bi4Z1ko4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsV-009LxG-2x;
	Thu, 03 Aug 2023 14:00:35 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsS-009LrO-1h
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:00:33 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6bcc5c86b20so927277a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071229; x=1691676029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NQaNaGtQ40+Jka02M1oSRNm1RIoWACu+SlEJicdyxEM=;
        b=DlSRoqeENBrFcwX9dE6OwcY6K7wFkfwe7L/ho8wPYFmLeomO/RZNObL/mmx0PMPfg1
         6OJPycAzpOaJSr1NduIbCap+p/ciW0Ldzsm6UewhAAbGap9Uur0wTyH6hX56M6/UoWsv
         yAyV/rgOwhjfW57lcOVSR9Ty5T81agjAaskH1qlrB5mrbAjE4AX1NmwZxu3jvHmbcdjj
         eQct/88s/att3lrA9ziYQGqn7/xDYQjCsxBZzBXxlj/PK5v+kv1O2i3Ty/AwkwAFX/vr
         UuFiwkpFY6jWiz+knrKg1ETtXSHLtCY6j30fbCecoXgMyENNonNfKMrU4rO1lsgjpNW0
         Rl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071229; x=1691676029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQaNaGtQ40+Jka02M1oSRNm1RIoWACu+SlEJicdyxEM=;
        b=gFFpGUzSHFKqrE9jnScPuJt8hzZZokuP5a8wsd1pryumRtZyqGygk8dQU9ds1wW2S4
         Vzk8/6jI9oabvark+ZdlF4wbU1EUxP4wwJcEaEHdCvFv4Rdwd9j9YBdo8PiHxNsbBqY0
         7rszKJn+mlmMgN01epG6zmhGoHi93uUeenTNFGWFu+3iWpXFmw6yVwI//DfLoX2XTlFr
         0+VPZICgODT/WW6qon9Nu0IHfPt1wvKvVDtJ5+qx95CvwJBytripanH5HdUAgHvdrZjt
         M660z0PHsxN82Q7v9HsKumbwjRtn4ccSA2CUAtcYuQ40cyf/ZQnH55hS5dm3i5WT/UBa
         H78g==
X-Gm-Message-State: ABy/qLaG8OjrSxuQNcupahEVwQqNjnTGeuV/+oWr1+sqp7mV1/xiUXhJ
	NcZ5ZqG4StGkJjFvQrdV04CeEQ==
X-Google-Smtp-Source: APBJJlFFP2zIvK0oB3QfIua9uP4ZwDxCuwMJLNe7KcVfKUFXQF0/e91jR8mHMyJZjtc0Omqqx4ZKjw==
X-Received: by 2002:a05:6830:1250:b0:6b4:5ed3:8246 with SMTP id s16-20020a056830125000b006b45ed38246mr19720778otp.2.1691071228829;
        Thu, 03 Aug 2023 07:00:28 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:28 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 00/10] RISC-V: KVM: change get_reg/set_reg error codes
Date: Thu,  3 Aug 2023 11:00:12 -0300
Message-ID: <20230803140022.399333-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070032_593528_69E75F78 
X-CRM114-Status: UNSURE (   9.33  )
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

This version has changes in the document patch, as suggested by Andrew
in v2. It also has a new patch (patch 9) that handles error code changes
in vcpu_vector.c.

Patches rebased on top of kvm_riscv_queue.

Changes from v2:
- patch 9 (new):
  - change kvm error codes for vector registers
- patch 10 (former 9):
  - rewrite EBUSY doc to mention that the error code indicates that it
    is not allowed to change the reg val after the vcpu started.
- v2 link: https://lore.kernel.org/kvm/20230801222629.210929-1-dbarboza@ventanamicro.com/

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
 arch/riscv/kvm/vcpu_onereg.c   | 68 +++++++++++++++++++++++-----------
 arch/riscv/kvm/vcpu_sbi.c      | 16 ++++----
 arch/riscv/kvm/vcpu_timer.c    | 11 +++---
 arch/riscv/kvm/vcpu_vector.c   | 60 ++++++++++++++++--------------
 7 files changed, 104 insertions(+), 69 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
