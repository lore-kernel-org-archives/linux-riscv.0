Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A07C531C7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 08:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LNOS92Gbcf3maSWdFz3yhBLlA/mkCqUtkgd0/CnvJGo=; b=AfEJn7fzKld7Mw
	9oSJB9eE1bGtH5JBibiNsSaSWxYkX7z3MJjV8FYkCSZnY0GqNpb0qkRAAzzPXDOqqAgfTEzS6MV9z
	Dgj/7CdCpf4Pk7NuTbbh+2mFxSHLHG7qnMmbYYYo4gbBR8xnhXArmvi3SLizFPjEgTz3PefL8FUxs
	N2FjLlg8/7Cbg+vrLxIn/lAPFvJXYxOij82LptBe1fKurQ6q/a5heERHbIgvVh7wrVPWSLyFipAmC
	6cD6Um1Qy4SwEOfNc5lPlCTHRDdfyzN2H86N8sCmzMfER5fEiHJGd4b3uORJYcwKVIS3hdYoevMht
	c/qwGtx4XnIlN1XkUKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmp6x-0000000DmOK-0IYT;
	Thu, 23 Jul 2026 08:48:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmp6u-0000000DmN1-0JR3
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 08:48:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BmIt3410905
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 08:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uQz5ixFmx8Vy7U+RVlxrq/vRljCJFVbgFeq
	c9PEr2bE=; b=TnoMraJuwqziAuKb1Mh0p68YdSCwpq3Dq5bSL5eAFQ1UcKOs9ni
	P2fIukIIumC2Zf3ITeBlPFItVmrWxC/M7lomWJEPdDzkzauWJNB36tUCN3pk2tH/
	TmoUnbi0xs4UIFtEOUWegJNK5eyCR/KvU2zxO3i9hpX1El+oFul4mGBZS3kChTLz
	4qZkdJu7p8+UxGVjalHaM+n1aYnQIrjDo6uRx9xUDFYSbO/9zyc/WukyKsfISLgi
	HcVOGdSGKJn9OjczCvk8qLpAtKdKOZ6L3uLidgs5pmKP/yAHmobah8Ki5g6oaAAL
	p/mXkaPKcrmnReSPZ1Dxb+ZX5Wuys8XydAw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayh95by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 08:48:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7049fa552so413580a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784796530; x=1785401330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uQz5ixFmx8Vy7U+RVlxrq/vRljCJFVbgFeqc9PEr2bE=;
        b=aobI/L+pB96of3YQ+7E1pkap4ao6KnTADZMjODZtDms2VjISrdOe4BzqLUj+RO5zEC
         iA74h+JbXdRVc0PjOLBLmex67dmZ5D/9vC6K+hkFwaKuJYnkyelRNsMgpnJjBpY4K9in
         EqI4rHmdPFAnrR3BEcNhRkNy0Yye7I80l6ClrvyDQ+eUVUmRW5efGxK1SN1RQEs3e5AE
         R9jXHhgze23PIdaFmegN8/pypbpSwbU6ee5I1jQLaTfiUzSnWAgXQLGkiqwKfRg9ZnsF
         Pv/mqyOgtzWxET5xX5Gtov7gwOVICmCgluSx9ZZcmWKnv82ccsQpAomf73+JT7UqTwNN
         1tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784796530; x=1785401330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQz5ixFmx8Vy7U+RVlxrq/vRljCJFVbgFeqc9PEr2bE=;
        b=CT71INvg8HthW5pwHGetP75fjNFTxD/yuA9r8YX+UDrnuaKBJlSAe/3M9B662XUajc
         lpXOGIFa6FlMFXEbMjEa837wRL5ALc8y692Z3ndQ/9TF6m0Nr3GqPAYc+VB1DTndNAD5
         GxIK2zxdrWZppIZvSauzDnQUkiQq+KRly2bC3NUVd0t7DEH9RA9TCjsvQo+pa1rFgrW2
         0fIZTJBmMPS+ftV8LuUBSJ2bnYo2uuQjnTgaQ3KXag6D1CJEoC12qN2bTu/kLHtAoQtN
         8uYrCAzxyKTmKiiTU89FTQb1Zdb8MvOotNhPvkrfOEe2zerwkwHem01Dwrfwu9N5CjCH
         ziNw==
X-Gm-Message-State: AOJu0YwdA4pEYgsM06FeGg/Cb9Fe1aROy/wHx3GBWcJ6hijHIDMRkmsH
	rt1BPaHdEOeGdzN48xA+kJA68c0jMOkdULiWrh2T5Zju+E6X7uv4GAATf7q7rzFyJo8mgwUxZ1y
	qOteEDiHafbWXIJ9jc4Id/cQ5gv/ICc/Jn1hkpuHztFFFO+LiYPmO8JsIuP4CDhlJXRHQBTPOM8
	OBAMM=
X-Gm-Gg: AR+sD10yOcpTRNMsMTOCFzg7aPUrT4LuR+Rgd3uH0ZX38TPK61buvZCwhatOU8e3brh
	0cqm1jBMTBTDiTwX8HzbXam/TdcCD45VLHZWnuQii3SzQVKkHp2fUoxcurraCRrZ8GTeJZ4WHPs
	n8mREpTkthRVTWu957I4KUwBjpp0W42Dw5RyPRrxkDIeMz6TdZYdQVxCfJ9ya0uw8kQ9mRzPv+7
	CfuzYuhm7iFlwsrw0HR+mkVRMzsyvPYG3WAKbIR3x7eNgD4PW18InKwlDZ1Q/Y5MRH5YO4WrUGi
	SzWfbBUMqkkAeiA980Y31iGqb5NnyH6AVOXxz8PN0N/S1Y4Alec7645itb+no1MQ+0GACBxWxeB
	vx9gZYIrvkqSN3bTO5mcQt5DtHPVF7FZ+q19kPtujPIfmh5gbn/cC5dzBXhYtB6x7kAbFeowZsy
	4lafgh7b9s1suqlyETTOwhJZLN
X-Received: by 2002:a05:6300:2290:b0:3bf:a11c:176e with SMTP id adf61e73a8af0-3c44b246bc8mr2366492637.57.1784796530230;
        Thu, 23 Jul 2026 01:48:50 -0700 (PDT)
X-Received: by 2002:a05:6300:2290:b0:3bf:a11c:176e with SMTP id adf61e73a8af0-3c44b246bc8mr2366463637.57.1784796529799;
        Thu, 23 Jul 2026 01:48:49 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130ce035sm13852140c88.13.2026.07.23.01.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 01:48:49 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 0/3] riscv: Introduce support for hardware break/watchpoints
Date: Thu, 23 Jul 2026 14:18:37 +0530
Message-ID: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a61d573 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=VXEou9BizgUDuBldTDUA:9 a=3WC7DwWrALyhR5TkjVHa:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: o-aXT09SLiM-BqcYfVhyQchzuuom7S2e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NyBTYWx0ZWRfX8SRfItlIqxBB
 /6z7fUjxCluzt3PUwsWDiyrFSD/kWKl3/vOxe2Th3kgdFc0kMIQf4Q3jkqbqeo38o5/e3NXxRLe
 AsESAzven7Gnmav2pg2kKt/nUfp8c5OyKdOrFmAV5xcZaTfQLYrt08YRj88csPhvTXNzsM1B7Ag
 /JLodRRCOhqtjbQhP19kpRIHw+3R4BI8FJKFgKtAuWVyIOIx/9+Q30YNugAEt0iiN1WYvG1Xgn0
 xLXft/ciZmXRnI4nsB531q3S6pLu/irbBB8LZQpnHhOmHngW8y2E5oKe93Ox+APfSBPbbKFZPv/
 Fjd5ONeyQy7sr60Q3u+Hn3zYl0HWEsYRPcQ/oO6SvvO5dcAbbgbMjg5gwv2ENkws7lZzP+z0dIu
 Clju2CaS9EA0aiIN1xMYiCNiCHmfqOdBVP0DNbZO2bITMPqyuilrpWQ+F4FE548a8Efa5IdGafH
 y8fS3WjxK/x5f20VJbA==
X-Proofpoint-GUID: o-aXT09SLiM-BqcYfVhyQchzuuom7S2e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NyBTYWx0ZWRfX9JTxmzUs4tta
 yGyj7LfWTntpU1May58Qoi70NcvSZuR6PZQyEg2+qnquEqZhvzx0xa6oKARPJ5xDBFSxI82DTKm
 GS1/9ljiqmLUYZZPIt3ilKSk4KA4pPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_014856_225298_96DC9D58 
X-CRM114-Status: GOOD (  17.97  )
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

This patchset adds support of hardware breakpoints and watchpoints in RISC-V
architecture. The framework is built on top of perf subsystem and SBI debug
trigger extension.

Currently following features are not supported and are in works:
 - Ptrace support
 - Single stepping
 - Virtualization of debug triggers

The SBI debug trigger extension proposal can be found in Chapter-19 of SBI specification:
https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0/riscv-sbi.pdf

The Sdtrig ISA is part of RISC-V debug specification which can be found at:
https://github.com/riscv/riscv-debug-spec

Changes from v4:
	- Rebased to v7.2-rc4
	- Fixed rv32 build error
	- Added pr_fmt to print KBUILD_MODNAME
	- Changed type of shmem_pa to phys_addr_t
	- Use per_cpu_ptr_to_phys instead of __pa per-cpu allocated mem
	- Print successful registration/unregistration message when no error
	- Added RISC-V DEBUGGING section in MAINTAINER file and added myself as maintainer
	- Fixed crawled in warnings from checkpatch.pl --strict run

Changes from v3:
	- Rebased to v7.1-rc3.
	- For watchpoints, check tdata1.hit via SBI_EXT_DBTR_TRIG_READ and
	  keep STVAL-based matching as fallback.
	- Improved watchpoint matching when STVAL reports the lowest accessed
	  address for wider memory accesses.
	- Program execute breakpoints with SIZE=0 (match any size) to avoid
	  misses with 16-bit/compressed instruction addresses.
	- Updated RISCV selftest to avoid deadlock by replacing unbounded
	  sem_wait() with sem_timedwait() timeout handling.
	- Updated RISCV selftest breakpoint function so it cannot be inlined
	  or optimized away.

Changes from v2:
	- Rebased to v7.0-rc1
	- Fixed the warnings from `checkpatch.pl --strict` run.

Changes from v1:
	- The patch that adds the extension and the function IDs defined by the extension is
	  already merged. So this patch builds on top of that.
	- Added breakpoint test application in self tests to test debug triggers

How to use:
~~~~~~~~~~~
OpenSBI:
https://github.com/riscv-software-src/opensbi.git

Qemu:
https://github.com/qemu/qemu.git

Linux Kernel:
You can pull v7.2-rc4 tag from Linus' Tree and apply these patches.

How to test:
~~~~~~~~~~~
From the Linux kernel directory issue the following command:
make -C tools/testing/selftests/breakpoints/

This will make a binary named breakpoint_test_riscv under the same directory.
Load it on the machine and run. Sample output is given below:

/ # /apps/breakpoint_test_riscv
Breakpoint triggered!
Breakpoint test passed!
Watchpoint triggered!
Watchpoint test passed!

Himanshu Chauhan (3):
  riscv: Introduce support for hardware break/watchpoints
  riscv: Add breakpoint and watchpoint test for riscv
  MAINTAINERS: Add entry for RISC-V Debugging

 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/include/asm/hw_breakpoint.h        | 337 ++++++++
 arch/riscv/include/asm/kdebug.h               |   3 +-
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/hw_breakpoint.c             | 738 ++++++++++++++++++
 arch/riscv/kernel/traps.c                     |   6 +
 tools/testing/selftests/breakpoints/Makefile  |   5 +
 .../breakpoints/breakpoint_test_riscv.c       | 214 +++++
 9 files changed, 1313 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
