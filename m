Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BDFC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z+w6pJzKTDYZyzrCBbHCTGHL31hr8oY1n5out9qGVhA=; b=q0W7zcg59iZYVt
	rbgeq/Fwvfh0wFuLgM8hk2EaCTN7hIZ54wDGyhg6bs6OT2NrnG0B+ZdlsekLr/I0U+Gr3tjqUm3Yj
	OjMRX1vKCKs0uH3+5NJy2A6vW4C/kzG+Wd2OylvSWspXFGkFj5u3g/UoKpwo+DXcfgNCwVrWziQJ/
	LeiV5DGxo2TxIrvGxJeEnScqCNNgifyPQW51WJ08nmwOQcgGiuDV1bEHBtRPwASahI/SEpu8Od+bo
	QTpddYImQ4lA5dmMI3tVPx+45LZuMw7ztrnCY92ml776CFCXZ9hX4hPJ/w2Sngc//du7vXux0g3VT
	CHJu8OPRiMvcxZuYw/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jq5-002X0G-5u; Fri, 24 Jun 2022 13:59:13 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jq2-002Wyj-Bw
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 13:59:11 +0000
Received: by mail-lf1-x129.google.com with SMTP id i18so4626197lfu.8
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LASuadjqs8dZURlJ2vtEtDagwxj0mbCR7tk+olJN1qk=;
        b=hP5Sow6nrnYSqCobNnCycgByLXh4+HYtfaD5xWzbzwd7Fu/kRmyEqWH9h17NSJJA7S
         UUFvVQ8zNwTg1dQFrdCqlc3UQUWicvsFjOPOfNBSWkJX8NYFzC+yr5CXU5UXvpjpa4hu
         5iGI/aDLv1y/bL3AwfqRPbb8MmcPH2bmrn3/y53jZMkYebA9Rje6+5FOlzev9jcWMsEa
         G/3JhYYXw0xUY4ZTuX1uGu8f6ighsrWNOUgJakc6n1OSqQmb38maYqjcXd2FKaYyXaaP
         WrePlC1ZRCI3EfsE7kZeKQC1ThZF+rbJdz7E+uqYZnnfa4TxZHDNKp813VrhmyjTcQpG
         6LFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LASuadjqs8dZURlJ2vtEtDagwxj0mbCR7tk+olJN1qk=;
        b=2qUkKeWTYjh+a0rJMrdp83wVsZfIbwxhUx7w6Dxm9dqxwdHfKHX4dKNnoZJqKy3HBP
         23oSooHm9k38Y3g6vdD+P6UOL4w73iE7S+YqZ/L336j/QGhLNpJzsIja+981DQiSU3pO
         GpLN4E/rPOTkaiDac1pstfaqzXFJ02vOcSIRdKSEtR68PXI3OLEo+eS7zSWtrfcLzd8u
         BiKdLApP4GSdnCyM6p4afBoUWtF2QdoUpUImG7sKrTxq03+OiGvXXfyYd/V/g26UnTPX
         QVPPC5nERt9D/oDh85Y+JnD6cDlEjpmtthyV01fM216aUjIZ566oqNOs8AlnzI8N5U2X
         XkqQ==
X-Gm-Message-State: AJIora9nx5eYlgb+R2OeE35iGYSB02fH4bRQNN7NYE8MdXw868yZALJz
	oNWxQBthbSjKsVo4QniS++G1QXq2J2VjGQ==
X-Google-Smtp-Source: AGRyM1tdRB32cBYiW54xE1IwmHH9zO25oWU/oMaQd1WNRjCbBha/zXPyLY3Mu9l+n9dF3Yi4YgBVJQ==
X-Received: by 2002:a05:6512:1308:b0:47d:b9cc:ee88 with SMTP id x8-20020a056512130800b0047db9ccee88mr8822104lfu.680.1656079144827;
        Fri, 24 Jun 2022 06:59:04 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id p14-20020a05651211ee00b00477cb9b8762sm385762lfs.50.2022.06.24.06.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 06:59:04 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v2 0/2] perf: RISC-V: fix access beyond allocated array
Date: Fri, 24 Jun 2022 16:59:00 +0300
Message-Id: <20220624135902.520748-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_065910_440745_087EF8B8 
X-CRM114-Status: GOOD (  11.20  )
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

Hi all,

These patches suggest some fixes and cleanups for the handling of pmu
counters. The first patch fixes access beyond the allocated pmu_ctr_list
array. The second patch fixes the counters mask sent to SBI firmware: it
excludes counters that were not fully specified by SBI firmware on init.

Initial attempt to fix access to the highest available has been reworked.
Now it is handled in the OpenSBI, see the following patch:
- https://patchwork.ozlabs.org/project/opensbi/patch/20220624110330.452640-1-geomatsi@gmail.com/

Regards,
Sergey

v1 -> v2:
- drop changes for access to the highest available counter as they are
  now handled on the OpenSBI side
- drop switch to IDR: in fact there is no need to handle non-contiguous
  counter ranges

Sergey Matyukevich (2):
  perf: RISC-V: fix access beyond allocated array
  perf: RISC-V: exclude invalid pmu counters from SBI calls

 drivers/perf/riscv_pmu_legacy.c |  4 ++--
 drivers/perf/riscv_pmu_sbi.c    | 24 ++++++++++++++----------
 include/linux/perf/riscv_pmu.h  |  2 +-
 3 files changed, 17 insertions(+), 13 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
