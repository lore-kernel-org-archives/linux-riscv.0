Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61077C61D92
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 03:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HieZ5d4jNiAKJpxs2eoK1j+EtrGCZqxtTwbTOgeES80=; b=TQyBQbWjK3oNkG
	Oo0tCpPkmuGmb9f5U3zV6CLdAfkEpr04sJv6leeUazlCMppR0WC9VhI/d8IQdeRzzIPDIp8Kfx9w7
	o8Ge3KsIfJWUYuhtLlnaL4tHmTxQnAt4t6EzGT7hsWjn1o34xh7Y/H1jt9DnCEvZFnjxHdD68XzWt
	5oViifug/lLdAhuN2TJuzlKKDzJzmHTpGYxQMtHqSB/1pFzv1eHd/KYkon8xHgI+a2n0qc38ky2NI
	vCR6Fp951kREX/AvjKGkkxbT3Caa7ZFMVqYon/XNoUJDPDNTJpC2zc3b660j3Kf9DYd/sL4FeWv9S
	UjOR3RSix7WKgS1O4Jfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dd7-000WO7-2l;
	Wed, 22 Nov 2023 03:10:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dd0-000WLO-1j
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 03:10:20 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5E58424DB84;
	Wed, 22 Nov 2023 11:09:36 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Nov
 2023 11:09:36 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Nov
 2023 11:09:30 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, "Namhyung
 Kim" <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Nikita
 Shubin" <n.shubin@yadro.com>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4] perf vendor events riscv: add StarFive Dubhe-90 JSON file
Date: Wed, 22 Nov 2023 11:09:08 +0800
Message-ID: <20231122030908.2981502-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_191014_879887_D2CEF0C3 
X-CRM114-Status: GOOD (  12.40  )
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

Similar to StarFive's Dubhe-80, Dubhe-90 supports raw event id
0x00 - 0x22. Reuse Dubhe-80 firmware and common json file.
The raw events are enabled through PMU node of DT binding.
Besides raw event, add standard RISC-V firmware events to
support monitoring of firmware event.

Example of PMU DT node:
pmu {
	compatible = "riscv,pmu";
	riscv,raw-event-to-mhpmcounters =
		/* Event ID 1-31 */
		<0x00 0x00 0xFFFFFFFF 0xFFFFFFE0 0x00007FF8>,
		/* Event ID 32-33 */
		<0x00 0x20 0xFFFFFFFF 0xFFFFFFFE 0x00007FF8>,
		/* Event ID 34 */
		<0x00 0x22 0xFFFFFFFF 0xFFFFFF22 0x00007FF8>;
};

Perf stat output:
[root@user]# perf stat -a \
	-e access_mmu_stlb \
	-e miss_mmu_stlb \
	-e access_mmu_pte_c \
	-e rob_flush \
	-e btb_prediction_miss \
	-e itlb_miss \
	-e sync_del_fetch_g \
	-e icache_miss \
	-e bpu_br_retire \
	-e bpu_br_miss \
	-e ret_ins_retire \
	-e ret_ins_miss \
	-- openssl speed rsa2048
Doing 2048 bits private rsa's for 10s: 39 2048 bits private RSA's in
10.03s
Doing 2048 bits public rsa's for 10s: 1469 2048 bits public RSA's in
9.47s
version: 3.0.10
built on: Tue Aug  1 13:47:24 2023 UTC
options: bn(64,64)
CPUINFO: N/A
                  sign    verify    sign/s verify/s
rsa 2048 bits 0.257179s 0.006447s      3.9    155.1

 Performance counter stats for 'system wide':

           3112882      access_mmu_stlb
             10550      miss_mmu_stlb
             18251      access_mmu_pte_c
            274765      rob_flush
          22470560      btb_prediction_miss
           3035839      itlb_miss
         643549060      sync_del_fetch_g
            133013      icache_miss
          62982796      bpu_br_retire
            287548      bpu_br_miss
           8935910      ret_ins_retire
              8308      ret_ins_miss

      20.656182600 seconds time elapsed

Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
Changelog:
v3 -> v4:
- Reuse common and firmware json file from starfive/dubhe-80.
- Rebase against latest perf-tools-next
- Update commit message to reflect the above changes.
v2 -> v3:
- Add standard RISC-V firmware event
- Update commit message to reflect addition of standard
  RISC-V firmware event.
v1 -> v2:
- Rename 'Starfive Dubhe' to 'StarFive Dubhe-90' in commit message.
- Rename 'starfive/dubhe' pmu-events folder to 'starfive/dubhe-90'
- Update MARCHID to 0x80000000db000090 in mapfile.csv
---
 tools/perf/pmu-events/arch/riscv/mapfile.csv | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index ee61e26f90cd..56b03138d46a 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -15,4 +15,4 @@
 #
 #MVENDORID-MARCHID-MIMPID,Version,Filename,EventType
 0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/u74,core
-0x67e-0x80000000db000080-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
+0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
