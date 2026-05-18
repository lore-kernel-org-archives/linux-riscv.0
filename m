Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D7CCD4F4A
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 06:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U6up7bGpBvId6EiELoXlcAIn0VbWztAZhk/YWJSd/10=; b=QsKor5v2Pf5/U1
	Wmr2crdWz+r+72DlN3QzleZ86f5A5Sd6ObwsBCOpu/HyyNM4Y3J4PaCyESfQuw75lBN5ssrTC/1Pg
	Tuxx9RRdzm7hj1zXTPya5DATIiexgVSzbw7iPsF7xA2cIVtbTdHEgAqMdSMW1Ym/EJMi2iT5kbCBG
	XQ7v97ydColkeC/2g9mi4M1I4KI6SwcT+B0HY2Pvw3QA8q4n0kC99egwWO0A3ybQF+pTqZydle1iO
	c7jLCBzD3mMmQRxpwhaavClKv/mFPz3oHTxVtpuebQKZdt2MZKu8qIGhLHHhQEZ6Mp3t/bRHz12KM
	gFXdV8iRKGLEoqgKBmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrwv-0000000EVBv-3Ezh;
	Mon, 18 May 2026 06:59:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrwt-0000000EVBR-3jfh
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 06:59:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I20uQo2303883
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 06:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NhVDdYbxD3mVbT1W28WUJ2s+19P1cuAWiBa
	xeNYN9eM=; b=bgdqae3r9Ei6FuIeHRkMPTAZWR2Rn4H6IX+zmZMkqmE9b4DJPEe
	6L+YUP9HLrFq75I0Gi7uxSOKsNCkVJBUD6q3GxSh7ihXbt/LtBgxRyZvFsE4LkYB
	SlSC4Kb2Gv6pCR45BBwX/Gx3jWmAphADoPJyZGyAKuN8toO+/nLB/3q5kxChdgfB
	BwTFdC2+B/2IizrhLVpGm7raenytMtTCAfmPFK6RVHgy8mVVuoa5VjN84eoXlJjN
	nLv5MXC0txB59mVKZ1/sPbXiIxh1VG1jL7h1NffFpyFR8UrxEKyMp6QSmQ+A6cRV
	xtmhpcOCYXz34K1lxuYHkB/kVFTWNrh7Nlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqw3qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 06:59:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662668b825so3816607a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 23:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779087573; x=1779692373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NhVDdYbxD3mVbT1W28WUJ2s+19P1cuAWiBaxeNYN9eM=;
        b=DZhvyh4lC9mDE1+6enPI20IKdDozTZOi0uGKjjujgANUSRmqEpX+V5jZz9Qfv+j44w
         bKCmUO0AM3n55VIRrqNeD+ryKA65qoLlDTup3RrNm8CNvYtZwTdd5Zk4IlRWQw6kLPuL
         vCzGRNiI0WFDIwYjYp4+XXsyKz3KNvdfBOjp7Wn+J38SksMM4Yu0N/ndjXTQf6LZ9beB
         PHvhTCPiH/sggvaMJfzmF30Y580Pmqmmd82HH61+JcS+2XH5+E3wMA8Bk7B07KnI86GI
         dd/FD09xCj6m8jtPaBtqcR9MPYr+AuD+uoGxQUJtYhv25kYwI7M/ZvmG6KqcQaldTPyC
         W+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779087573; x=1779692373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhVDdYbxD3mVbT1W28WUJ2s+19P1cuAWiBaxeNYN9eM=;
        b=dJ2KBZ1oQwscVtDLBJs4fobaJeaRCKqYlyNLBZTcaMjSUfbYtd+3UOg3TMAHFWOOUB
         mysxmk8UZHJaKpPPjTNQpBmNzbA6k1e8bxxofYWbdfAGN0ClAEjXFB8i+d5EzVTjFB0P
         fBg2vT2ue2LJqZEu1IyCvHrJ7EWp7pPdaOXI4eb8jkl1linxp2QdjnU1UkmDVdNRt+cH
         P4aRp4V4JjdbounJS35hPX1wXm5KoSqu3CzNl6TyLZ6fUZMSz/w2VKRJutAhOZdd6nCd
         GTGQu3F0wiUlaOyq7WrzADRuyLNGm4GnvHVbHEz6qOTChfLhasr2VZFxjdROy5KyXnLi
         GyMg==
X-Gm-Message-State: AOJu0YzeDWLJfD7OQ4rXxZcfN+iIoVu4XENSpWrZ+wXTUkgJpmR0qrlf
	xJooCEwM+Qw+3TGSG1iloegOITlvm/JHcKo05kaqeH/NgryNUrt6F0LnfSIbUPVSZQvHum4STkP
	nrMJzHbfi+ENWX8KRAP1EUavB153jzf8leIFBqxsAgaFuz9Fh0JkhMnr7wwfrozEJRS8QRWQgly
	Ec5m4=
X-Gm-Gg: Acq92OHneDKYH0fRVabfw/zg9NpyCfx/5I4tPrku6pAqYhoP0YEaFt0S4RRWa3VkhB8
	5fksC1ZVzPEWV2jp5wq8XxCPA82RPmIkGHI3xNXxpuV5jnZVzZ8uUGsHz0t91bOLutPHqnHKFXa
	gyb4ErhLJfXulfTnOEM4CLczJSnIgwlDz4ao/NCKfcEH2HpvLf3tjgAzCUEvdHBoqFar/gW137p
	R5Sl7vrLrhrRNh5Ol6fLom2RqJRoTvBcI1SgpMWpGWNKkJrjzm7pSC4KcoYwRS7fRYAUwYRvvYs
	HPZcedra3afFKyrYO3YQWjbWOQ/xHaXblLq0GiknEw4LP6CCVVJFQjdE0AxojoFrxy+2KHuMT7L
	KVTSPdZf00ucQ6DRitlKav9jTyFjPS6VFAnNLJQ1HB+ox4wQpUGp+tJc727w8dD7x8u+7NVGCvA
	mmnp9G3Ar9aoV9Pm6y2AnXFBsGbInLq6X7FYK/Fsqe0sYDHA==
X-Received: by 2002:a17:90b:544c:b0:369:7ef6:2874 with SMTP id 98e67ed59e1d1-3697ef62f88mr7415977a91.4.1779087573560;
        Sun, 17 May 2026 23:59:33 -0700 (PDT)
X-Received: by 2002:a17:90b:544c:b0:369:7ef6:2874 with SMTP id 98e67ed59e1d1-3697ef62f88mr7415954a91.4.1779087573079;
        Sun, 17 May 2026 23:59:33 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c5f0eb2bsm2058381a91.7.2026.05.17.23.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 23:59:32 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 0/2] riscv: Introduce support for hardware break/watchpoints
Date: Mon, 18 May 2026 12:29:17 +0530
Message-ID: <20260518065920.872131-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: Y0XcY16URCzCAjNlEPt8dkfkSsECnWHz
X-Proofpoint-ORIG-GUID: Y0XcY16URCzCAjNlEPt8dkfkSsECnWHz
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0ab8d6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=VXEou9BizgUDuBldTDUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2NCBTYWx0ZWRfX+VSU+2vnNiSo
 qKv0d10OTIAbf41ToESDxTUjuiSSDkL12XP7jjj64M4FqXtQ067LYYcEdp6pi7AwlVIHh99wnNC
 VkjEh8reO4OppXtThE2km3T23/N1/BIiCMj4P/hbo2P+bHBxDSeeC/VvDyaPoSYcZm7TnV2S5n4
 P6SmzcMi0SBO5bHR36Zo3t1vnees4qJkNEnNPEaAu+Ny9nINCCZOisGVTIwGFDvKCMcjau6p10K
 gmVkhDjQc2iz5NocrOrjkZ9vy6ZHjmlewedy03Fl37WRxsrZfGf2KbN0PsX+ueVwKZ37v3pgCcE
 7545npeuDWMVIVwEPdEqrENXGCkyJpoGevTRCv/OvqGZazQnVEvsOdLNwWeuTnWVS/NvEw6sb7Y
 2+AlcPZfla6dyhhSVHyM3pLfTq5D+Om9mkLCruMSoP4geSU9NdP69+SGZtYNwTun+VLIPJPa2yZ
 ot3tPjuHgLFIL5uvCaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_235936_057470_EFF2A0E7 
X-CRM114-Status: GOOD (  16.18  )
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
You can pull v7.1-rc3 branch from Linus' Tree and apply these patches.

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

Himanshu Chauhan (2):
  riscv: Introduce support for hardware break/watchpoints
  riscv: Add breakpoint and watchpoint test for riscv

 arch/riscv/Kconfig                            |   1 +
 arch/riscv/include/asm/hw_breakpoint.h        | 332 ++++++++
 arch/riscv/include/asm/kdebug.h               |   3 +-
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/hw_breakpoint.c             | 736 ++++++++++++++++++
 arch/riscv/kernel/traps.c                     |   6 +
 tools/testing/selftests/breakpoints/Makefile  |   5 +
 .../breakpoints/breakpoint_test_riscv.c       | 214 +++++
 8 files changed, 1297 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
