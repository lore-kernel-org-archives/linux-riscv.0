Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7A3606A31F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 04:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NNYElX2D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=peejiJdB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1j4Vqh7Fhhjw9L4lwRcjhtziwS7wY8+ZQ1NCaYnFBCM=; b=NNYElX2DqvPTNNC7kRSn1Z59Hf
	267R8diKDdVgI+lhF7l4ZTnlcwRrBXPvlktLv4reS7IKkZaWHCsy0DtXUMBlv/9NYkwdaFlQkysvs
	Fkj1hFFCSqdNCNjweFrER+QYfwsvMzCxzGn2WhudkIKwzpj0LN4a3jfjZVTLIZAglLMpxmVsOj3DR
	c8U1+exVfqk+EnIxSv6W7QyzORHY+RAxc36VBD8uU99zBYNPekRnUyXiyPCeBg6rp2RihdsZQF078
	20a7fE4jxP3ABH7a5xVRz4v0TrlbnnO0wX9JeynSQ1ceudQWOI5eSXfO0WwIhRWrwbwtvVTg7UR1d
	n0/Le64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSntx-000000015JX-2fy2;
	Mon, 16 Nov 2026 04:01:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSntv-000000015IC-33BV
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 04:01:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L0RX3787251;
	Mon, 16 Nov 2026 04:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QcDyiOSlokKyjjnIu8ukWFiBePuWZqgFytO
	Jsb5n/ok=; b=peejiJdBm96CKNl28bfXweC02H0MlYwBQKJ3vM4gdyLxnAS9j42
	1ZUQgiRL06BuaXatj8bv90kyUUwmZh5LnN4HwAsW1jvjKRpwDf0IYuCxEOvCkxfg
	1QymPxcuTvq4KTbkKfE2kLkFNgMwU2NMqigDP5t7bv/XLZzdnw8DVNPJ+e5VFD4s
	JApXAC6uWI8WCoJfp/mndNw7BTSmEVsIFyFwvWYXETLnrm8iGnepA61I/Ppixjoj
	WYb5HzSr06aBXRcySg9rm7VLKVUx7zR9hgeWlG5mbypTfsn0Dalo1n1puCQQe9J7
	qR7BPiBH9flEytrR5TW+QySsi/smmpyrpig==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwcjq0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:54 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG40qcK4139887;
	Mon, 16 Nov 2026 04:00:52 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AG40pdQ4139874
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:51 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id E5913222D9; Mon, 16 Nov 2026 09:30:50 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sunil V L <sunilvl@oss.qualcomm.com>,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Parallel message send using SBI MPXY
Date: Mon, 16 Nov 2026 09:30:44 +0530
Message-ID: <20261116040049.1795610-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX8Ybkgchzc+No
 4P/mS8NPifM3RsgCcTe6iBVZeLCcXWQT6mW7Lo1BhQbQKgrYGL+dUm6f0lJPni0t5an4nE+NxUP
 K51CyaOenbYooKnkWLCVAVgx0eVPmEIV+FqQZyj/J+YjOk1SWPpIGuvV9oVy4PO3SekOq9/IAu1
 eVUk4Lr6FuAsPOyey1HV4PhAycmEV0+whrOGIQGf/U8haBgBB+Jfvh7FpNbJkniA+T4gKIfEOAn
 faVBJ2CmxUDr6S0c13RGZcA5VZqLvP9tkrlXQJ+SWp+XlePbYjOFe5IMP5UJIayTFB8LyzsgTBa
 OQ4tspdQp4p6Ij3wQ6JxB5LqN2m99QNcbeg8i4ugtvAmOPsYPwpOO5LDV0TewtDQwnd64YaNof5
 iXtMvGu6GVf73B8BUIVaoP/5M5nyPNX7eP5quQNS07kKaV/tIR2889Bl7Q2ufXhAZpiUvKoK87t
 QJRVruow0NguESav7PQ==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afa7ff6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=v1LW-1MmbVdIZeTtpKQA:9
X-Proofpoint-GUID: 7AbmNaH6QRDq9idT8PUxTXF__lffhWv4
X-Proofpoint-ORIG-GUID: 7AbmNaH6QRDq9idT8PUxTXF__lffhWv4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX/7xiyUro6dtx
 nprh7IAdKiow4bAujXA8yua/jRdzNl8yAmsp333IbvYjDPpeLi71lcNoATp73yvlknZT7S10WlI
 xdOjw1hCHSM8ofeFDoajMjtotqiDVw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_200103_769575_385D0074 
X-CRM114-Status: GOOD (  10.84  )
X-Spam-Score: -2.7 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series primarily extends mailbox framework and SBI MPXY mailbox
driver to allow sending messages in-parallel from multiple CPUs. It
also serves as perparatory series for the upcoming RISC-V ACPI EINJ
support and RISC-V TEE support.

These patches can also be found in the riscv_mpxy_imp_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Rebase on Linux-7.4-rc2
 - Replace PATCH2 to factor-out per-hart MPXY shared-memory acquisition
   with a new patch to Use irqsave to prevent interrupt when accessing
   MPXY shared memory
 - Adopt Jassi's implementation of mbox_send_message_sync() from:
   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git/log/?h=jsb/rfc-synch-xfer

Anup Patel (2):
  RISC-V: Move common MPXY helper routines to arch/riscv
  RISC-V: Use irqsave to prevent interrupt when accessing MPXY shared
    memory

Jassi Brar (3):
  mailbox: add direct synchronous transmit API
  mailbox: document direct synchronous transmit
  mailbox: convert RISC-V SBI MPXY to direct transmit

 Documentation/driver-api/mailbox.rst          | 350 ++++++++++++++-
 arch/riscv/include/asm/sbi.h                  |  86 +++-
 arch/riscv/kernel/Makefile                    |   2 +-
 arch/riscv/kernel/sbi_mpxy.c                  | 340 ++++++++++++++
 drivers/clk/clk-rpmi.c                        |   3 -
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c       |   3 -
 drivers/mailbox/mailbox.c                     | 144 +++++-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c         | 415 +++---------------
 .../pmdomain/riscv/riscv-rpmi-device-power.c  |   3 -
 include/linux/mailbox/riscv-rpmi-message.h    |  17 +-
 include/linux/mailbox_client.h                |   9 +-
 include/linux/mailbox_controller.h            |  38 ++
 12 files changed, 1006 insertions(+), 404 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi_mpxy.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
