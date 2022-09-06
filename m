Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36BEECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 15:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bu+N1qLeekyK9HAWniVofVfwsQtvVhnoQKbEWNvgYNY=; b=K+sLdl+0+wO6ga
	zo9WCdHiXN7wh2ej1rZaNSTeQLFi+229ibfWNVtgY9WjJt16bk9I0advkXmTvnllMqvk2o29144tK
	bM6zwA2qFvr5EVMuECrAb6cv8XiJP4hWUvCziioiMsNffGzXilJC0X3fYFKkL9yURESU1zNvFBV03
	jkZHeDQ1CG0QSRm36UY1X1C/Q5P0xCQPTNTXfyu7j2KOMI2It1QdRV9ZVxF+IqWRkGWQCN6t8r8q1
	qcEZx6tVncDGh8cYdkfcpL5XRGEaZA9b5SxWMSErT4Z+RZJBLn6+2w8ZUMwIDFpx1HvYqOiOtMYGN
	Qfnt+bFOE6VffVI5+A/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaoa-00Ezuu-RM; Tue, 06 Sep 2022 15:48:40 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVa2J-00EViu-G8
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 14:58:51 +0000
Received: by mail-ed1-x52a.google.com with SMTP id e18so15534271edj.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=4GvgxfMlZYLYjXfUJemq3+Ngt1ZyEYFjnr2zdE3HbsY=;
        b=mGOCJYGc5tYSI9JRpvQs1HnOz4wxPg9DqWbHAWLuqmObzA3d+yQbEYcUHfRcHglVpI
         hgKQiRijPepEKRLDS2FCtp9BQfbYZKS6Z9xe8RApiDuUgdlgrevLBLEngQ10Ybeqasv4
         7oQuJeeucLG5KFckKv4QWDy7vt0Y/zDb2c43W9Tso08njlzKiK9lLwHodumPNJ0Fz8AE
         S1D4wEGz2spVpTBXfgqpV9Kply1NbxwVG/P6JFLvAu535a4pSQA8gp7+Pxf7XgfGTkJZ
         Hg8muXXijHFd4og/j/PV5xwtTnfDGUN8aVGYd5rF1Y3deU3aPGZUSeM8h5kl2joSxqBo
         H1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=4GvgxfMlZYLYjXfUJemq3+Ngt1ZyEYFjnr2zdE3HbsY=;
        b=x+jijgAMOj+z5Nm6IabUgyPpePYBuX8MPe7vq5mTMc5WZLngMdvfoSlcLql/PbyATv
         MM6IWtsVPHoPyKZOeKSIaC0JhvA33lqs59YqN42siMqB98pndccLRAyWpVPnUZsw+knv
         QTtVpFtqUgCD2NltHrLnJEs1OHbQtkzdnxCDBycBqumHRkGwR6EjivhWD/Du/SW3+diq
         cXu9PMWHSTwJYWmyvy7lAmbVO+or8Sk/+YxmWE8NhMFHjPSXf9sBEH0YMQtSUm1/dZjo
         gqz6BgqdAXTKM1dSadjpt/WSDy05rhpnPu++lBo2Yv7sg7mYLFoshCCfQ5iy/VTymMKJ
         hj6g==
X-Gm-Message-State: ACgBeo2251VFqIvBO/T9NKfe7ZderaybriL8FA8sOcc24ztrEGkx/ZeH
	XIvUQQP2i/TwOCXzFzyZfUcfFZI4PO7NEA==
X-Google-Smtp-Source: AA6agR5vdujbOgdWV0TfN+79b1hr4I0eNRZsdue9UHp1iNgWXGvbGBCimGTlKUTwWul4HXDZBMqguw==
X-Received: by 2002:aa7:df18:0:b0:44e:7790:c726 with SMTP id c24-20020aa7df18000000b0044e7790c726mr9198073edy.276.1662476324408;
        Tue, 06 Sep 2022 07:58:44 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060cc900b0073ce4abf093sm6730442ejh.214.2022.09.06.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 07:58:44 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v2 0/2] riscv: KVM: Expose Zicbom to the guest
Date: Tue,  6 Sep 2022 16:58:40 +0200
Message-Id: <20220906145842.965488-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_075847_575208_087ED5C1 
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

Add support for exposing the Zicbom extension to guests. This has been
tested over a QEMU including the Zicbom support [1] ([1] was rebased and
the Zicboz support from it was dropped.) QEMU was further modified to
ensure the cache block size was provided in the DT. kvmtool was also
modified [2] to test the new KVM API and provide the guest the cache
block size in its DT (The kvmtool patches are based on Anup's Svpbmt/Sstc
series [3]). These KVM patches are based on the riscv_init_cbom_blocksize()
cleanup patch from Palmer and the move and expose riscv_cbom_block_size
patch from Anup which was reposted [4]. This series is also available here
[5].

[1] https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicbom
[2] https://github.com/jones-drew/kvmtool/commits/riscv/zicbom
[3] https://github.com/avpatel/kvmtool/commits/riscv_svpbmt_sstc_v1
[4] https://lore.kernel.org/linux-riscv/20220906074509.928865-1-ajones@ventanamicro.com/T/#u
[5] https://github.com/jones-drew/linux/commits/riscv/kvm/zicbom-v2

Thanks,
drew

v2:
 - Dropped a patch that output the cache block size to dmesg

Andrew Jones (2):
  RISC-V: KVM: Provide UAPI for Zicbom block size
  RISC-V: KVM: Expose Zicbom to the guest

 arch/riscv/include/uapi/asm/kvm.h |  2 ++
 arch/riscv/kvm/vcpu.c             | 11 +++++++++++
 arch/riscv/mm/cacheflush.c        |  1 +
 3 files changed, 14 insertions(+)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
