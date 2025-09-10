Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EADCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eOza3d4HpxDHasXqePpa0JcZNoXGroc84wVs4FQOw8A=; b=Jzb+doWQe3znkK
	gGQaQx/O5r77GiDjBvqjl7iNJXvdSdB8CpFQrSZnHO4S9JliADGtu+2UL2k4d9o5xkDaOyJVJRxxe
	LJSnSbIiG3zLwswUhlnW7jeE7rHdfSi+cX5+txf1Kx7XqWN/sS35GJ426sVPROufrxr+UAAxwFjT6
	/717ByHzouGEHtrm/Y2KxBtwnoOC8t903cfvhDQEiKzWrPVjUWDIGhgJGVEsaBo8kjg96kvGfsRMT
	SN9J/qGnTymMf48X5ea/CP3V5MmlQ/2+PckU1G4MdJn0HrurfDr9yGT0Oaeqe4r08a7O4PHfpBUA4
	ok+VjbDWzRfHoGgvoRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJg8-0000000E1gQ-07v4;
	Wed, 10 Sep 2025 12:12:00 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJg5-0000000E1e0-3mcI
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 12:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757506312; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=XvIiVqSYrXf64RVaEfdD9zGvjg33JNVU80CZvbmOC+0=;
	b=Vh9EYIX47vvv3Iv7eslBHXWxTsAdUfPyd3lw7bH+Ja9YbJp0DQVF08i4vSDtzURAdioEb0iGANs1s3+vYhIw8AOAFRtWnxQ6F43I/mKFDWYj1IejeMm7PsJFg3k+K8n8Kyc0zpw51ZlKSwwntD4kz0nNyufn2+YX5sQEr97giLA=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0Wni1q9J_1757506305 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Sep 2025 20:11:50 +0800
From: cp0613@linux.alibaba.com
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guoren@kernel.org,
	jeeheng.sia@starfivetech.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 0/2] perf vendor events riscv: Add T-HEAD C930 JSON files
Date: Wed, 10 Sep 2025 20:11:19 +0800
Message-ID: <20250910121121.7203-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_051158_118798_98F6CF4A 
X-CRM114-Status: UNSURE (   5.04  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

Add pmu json files for T-HEAD C930. Including topdown and some
other metric groups.

Chen Pei (2):
  perf vendor events riscv: Add T-HEAD C930 JSON file
  perf vendor events riscv: Add T-HEAD C930 metrics

 tools/perf/pmu-events/arch/riscv/mapfile.csv  |   1 +
 .../arch/riscv/thead/c930/basic.json          | 117 ++++
 .../pmu-events/arch/riscv/thead/c930/ieu.json |  97 ++++
 .../pmu-events/arch/riscv/thead/c930/ifu.json |  62 ++
 .../pmu-events/arch/riscv/thead/c930/l2c.json |  87 +++
 .../pmu-events/arch/riscv/thead/c930/lsu.json | 182 ++++++
 .../arch/riscv/thead/c930/metrics.json        | 538 ++++++++++++++++++
 .../arch/riscv/thead/c930/vfpu.json           | 177 ++++++
 8 files changed, 1261 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/riscv/thead/c930/basic.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/thead/c930/ieu.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/thead/c930/ifu.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/thead/c930/l2c.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/thead/c930/lsu.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/thead/c930/metrics.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/thead/c930/vfpu.json

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
