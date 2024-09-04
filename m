Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4648CD37AE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5qyajFHqaVTLBEP4yMLxU2q3Au/P3nSLvb/V5+tQH+k=; b=rJg8H/JI3/AEmh
	4s9QJi4jA7ZyHOjq2IhK63vTF7Hgp9YTUWoBrpZZ3H8odNUfYzltVNUeMY8xIIMW6lvnUqiZaWdKf
	K9ctd43ZHhVUNji6bt+rHg8bBMHRAXPeANZqoKPoFhPuEsARgwMdU3TpT0oWml8cse0f6PFcUPZrW
	v2t6xWTvY9W88l4AuXVThqo7DyaKrRT/H973arnKE8nfivBL0u8Zje/Te4iX3L2PBM3v511pc4inH
	+DkPRhE2WiAuRGriMcpOZmWBwQFHZLM7+ixre1BmMCx3jNp1FAML7wzFBYvv07B82o8onHLIgwwLT
	OuwC+moEvWf+8pdXF2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sljzI-000000035uM-3f7w;
	Wed, 04 Sep 2024 06:59:32 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sljzF-000000035tp-0qSE
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 06:59:31 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483Mn3O8031356;
	Wed, 4 Sep 2024 06:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=5Y1gyYG60jOF3JE98uZpYCUiZX
	bStaASEh6e18i5Q1M=; b=tQGmHwE+Ps8bt17Iaquf5rQBl5WDo7mjSWYR4Wg4tI
	JhrxW53qYzmHI15te292CcSsvHw02Pu5cdzQQKr9cvNOCS6+8sAWIbLZ8r0VABwh
	B1GNQT71yvkaWhx9kwNLmklgTQ1B5dG26jlBRmnC4H8OemCENLm/dFg2xu3r9J7/
	9aaRfgyDl/p9yFmvwpC36kGasC5xDl2ru7jXdesBt1NA23kk8UlEkndgMlluBq3y
	wz76Gol9p9L+/sm4yVWYQv91z/JmCS8Cxb2kkcNwrdWXY22nTc2iRVDiJY7SZwmC
	hdntE7JUxzYyCnDuGMzfyBo2BGVOpr9ylXsMFLKihUhA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41brkqt1tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 06:59:18 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4844rSWI012058;
	Wed, 4 Sep 2024 06:59:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41cegpxf99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 06:59:17 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4846xFOR58720732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Sep 2024 06:59:15 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B0C52004B;
	Wed,  4 Sep 2024 06:59:15 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 888B220043;
	Wed,  4 Sep 2024 06:59:15 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  4 Sep 2024 06:59:15 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55390)
	id 1C085E0297; Wed,  4 Sep 2024 08:59:15 +0200 (CEST)
From: Sven Schnelle <svens@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: [PATCH 0/7] add function arguments to ftrace
Date: Wed,  4 Sep 2024 08:58:54 +0200
Message-ID: <20240904065908.1009086-1-svens@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IyPlP0Aqv9vpIEU4M-A0s0FHBpbG2XRG
X-Proofpoint-ORIG-GUID: IyPlP0Aqv9vpIEU4M-A0s0FHBpbG2XRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_04,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=829 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_235929_604654_A2747A58 
X-CRM114-Status: GOOD (  13.56  )
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

These patches add support for printing function arguments in ftrace.

Example usage:

function tracer:

cd /sys/kernel/tracing/
echo icmp_rcv >set_ftrace_filter
echo function >current_tracer
echo 1 >options/func-args
ping -c 10 127.0.0.1
[..]
cat trace
[..]
            ping-1277    [030] ..s1.    39.120939: icmp_rcv(skb = 0xa0ecab00) <-ip_protocol_deliver_rcu
            ping-1277    [030] ..s1.    39.120946: icmp_rcv(skb = 0xa0ecac00) <-ip_protocol_deliver_rcu
            ping-1277    [030] ..s1.    40.179724: icmp_rcv(skb = 0xa0ecab00) <-ip_protocol_deliver_rcu
            ping-1277    [030] ..s1.    40.179730: icmp_rcv(skb = 0xa0ecac00) <-ip_protocol_deliver_rcu
            ping-1277    [030] ..s1.    41.219700: icmp_rcv(skb = 0xa0ecab00) <-ip_protocol_deliver_rcu
            ping-1277    [030] ..s1.    41.219706: icmp_rcv(skb = 0xa0ecac00) <-ip_protocol_deliver_rcu
            ping-1277    [030] ..s1.    42.259717: icmp_rcv(skb = 0xa0ecab00) <-ip_protocol_deliver_rcu
            ping-1277    [030] ..s1.    42.259725: icmp_rcv(skb = 0xa0ecac00) <-ip_protocol_deliver_rcu
            ping-1277    [030] ..s1.    43.299735: icmp_rcv(skb = 0xa0ecab00) <-ip_protocol_deliver_rcu
            ping-1277    [030] ..s1.    43.299742: icmp_rcv(skb = 0xa0ecac00) <-ip_protocol_deliver_rcu

function graph:

cd /sys/kernel/tracing
echo icmp_rcv >set_graph_function
echo function_graph >current_tracer
echo 1 >options/funcgraph-args

ping -c 1 127.0.0.1

cat trace

 30)               |  icmp_rcv(skb = 0xa0ecab00) {
 30)               |    __skb_checksum_complete(skb = 0xa0ecab00) {
 30)               |      skb_checksum(skb = 0xa0ecab00, offset = 0, len = 64, csum = 0) {
 30)               |        __skb_checksum(skb = 0xa0ecab00, offset = 0, len = 64, csum = 0, ops = 0x232e0327a88) {
 30)   0.418 us    |          csum_partial(buff = 0xa0d20924, len = 64, sum = 0)
 30)   0.985 us    |        }
 30)   1.463 us    |      }
 30)   2.039 us    |    }
[..]


Sven Schnelle (7):
  tracing: add ftrace_regs to function_graph_enter()
  x86/tracing: pass ftrace_regs to function_graph_enter()
  s390/tracing: pass ftrace_regs to function_graph_enter()
  Add print_function_args()
  tracing: add config option for print arguments in ftrace
  tracing: add support for function argument to graph tracer
  tracing: add arguments to function tracer

 arch/arm/kernel/ftrace.c             |  2 +-
 arch/arm64/kernel/ftrace.c           |  2 +-
 arch/csky/kernel/ftrace.c            |  2 +-
 arch/loongarch/kernel/ftrace.c       |  2 +-
 arch/loongarch/kernel/ftrace_dyn.c   |  2 +-
 arch/microblaze/kernel/ftrace.c      |  2 +-
 arch/mips/kernel/ftrace.c            |  2 +-
 arch/parisc/kernel/ftrace.c          |  2 +-
 arch/powerpc/kernel/trace/ftrace.c   |  2 +-
 arch/riscv/kernel/ftrace.c           |  2 +-
 arch/s390/kernel/entry.h             |  4 +-
 arch/s390/kernel/ftrace.c            |  4 +-
 arch/sh/kernel/ftrace.c              |  2 +-
 arch/sparc/kernel/ftrace.c           |  2 +-
 arch/x86/include/asm/ftrace.h        |  2 +-
 arch/x86/kernel/ftrace.c             |  6 +-
 include/linux/ftrace.h               |  4 +-
 kernel/trace/Kconfig                 | 12 ++++
 kernel/trace/fgraph.c                |  7 ++-
 kernel/trace/trace.c                 |  8 ++-
 kernel/trace/trace.h                 |  4 +-
 kernel/trace/trace_entries.h         |  7 ++-
 kernel/trace/trace_functions.c       | 46 ++++++++++++++--
 kernel/trace/trace_functions_graph.c | 74 +++++++++++++------------
 kernel/trace/trace_irqsoff.c         |  4 +-
 kernel/trace/trace_output.c          | 82 +++++++++++++++++++++++++++-
 kernel/trace/trace_output.h          |  9 +++
 kernel/trace/trace_sched_wakeup.c    |  4 +-
 28 files changed, 228 insertions(+), 73 deletions(-)

--
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
