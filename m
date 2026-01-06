Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C0FC47BC5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 08:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NrfS3+7StNTG4IKLnzw88V/RYWPOGznVDHMklih4o/k=; b=2dMYCsqQ3bLLAO
	MnH0MVp3d02xDvEJPcbCO2pLW+5sACA3OvkC7owvxZVv88X6Zt/uBlGu1e8z2P7QzKZlZtYOF5PK8
	+DrvP9tuRjIyMusE+TQuVkGWmUdjbce+UT+zEvFh9KKplQEExzfPzKKmZhaabSM2fPlWBI61JwB7R
	Sxsob3Pt8irMW6Ge+A5EQbZ2JYGKN51fRASXVQC3mEr2J96ceDh2Nb82j+03zQCe2553LgWbUTMHf
	W1MJDyA4cd2Xw1VpPtTrQvE0UFJ/+0CcBywyltEy7D7ZnizZi0tlH1j6VgiIX5zgKDXua8s9mU6V8
	2FOxfqDhO7DEmRspJaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2Iv-0000000CbNM-2WNl;
	Tue, 06 Jan 2026 08:20:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2Iq-0000000CbMg-2ati
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 08:20:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QDLR2922670
	for <linux-riscv@lists.infradead.org>; Tue, 6 Jan 2026 08:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IQ/wN0uAGiYruXFr4Lb4UETO8aiuIyMHbvQ
	R2bicQIY=; b=isQf8JP50Qc0Hfq4cARrQqf8Xl/XdsInU/DehHxmJlY63rhZza2
	nfCVQ8vfqBjnCYUeeyDTzllnCHtvgoDZtgQBSteRFd+/FxfdA41RvIbBr3pmJLTq
	Kx4c/VuwXINxD8qpTRABdBL6ePsA5teOOLTYhcr/Ux64YZLuITNqOuyGYKnQT1tS
	Z3Qaq9hEEULxq4HGKHpHWKrJZgjM7naiVZHgsa+PyPPchvAq62eXzrCH4sQ+3kgo
	mvFNo6YUyTkG0BYQuV3n9jonRnYHeCOmD5D8xOJ9mYlczBCdPvRr6ydvhjygpBJK
	gX16lvhzRC8HN5EQS0JZYAyZTcJgcyiB+mA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy8xha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 08:20:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a13cd9a784so8040915ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 00:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767687630; x=1768292430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ/wN0uAGiYruXFr4Lb4UETO8aiuIyMHbvQR2bicQIY=;
        b=jFRpouWerW+os4ApgX+9vR243TFsrrczO5K6n/1zxZx7I+sU6YOgAeipqiGFMaEpu3
         gcCdXJWfTE6pJHS+X5DnIah6S5ueTcJGECu+mES5FRe1uO/QhUFyD8b2JKekZjZFyYYw
         vS2Ykuxm7zAtfity77Z5qg+SVVuHu96zyJDdoBxix1aaTHbdDfsXyaLdLHSUyHXSji91
         U64Y+J3AddblqYW+sWTXZkqV9f5Qi/YAk1zz/sjT7Bv2DIIUqE9lGh3FCq/mt4hmc2ZM
         nYFan05etuiQ6wgDbBaWMM5/wriYbSJODieMf5IceterlQ7KoWTY/n4WXHCvpi8xQ0Q+
         YMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767687630; x=1768292430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ/wN0uAGiYruXFr4Lb4UETO8aiuIyMHbvQR2bicQIY=;
        b=LxTft0kX0Vefb7CyqTToLGGnl+k5wg3hBoha/ddA0iS8drQ22RwcdAWdb8GDUhM1uO
         s3WE5MJFzXZEWcnt02joKVidZxxV4oYCRqmHjG7uF+cXcNO9jRaxrRYXSkvMA+9WxXai
         Vq0bx5fH6AcxUcb+wefujjrSwu4VU6NnAj/NobvGSNPAD54TXZt/pvq9rkyTqeDd462q
         HYBf+uTf62jYuEnsOKgdCQedqom8LbqlSRX8To+0/UosmxeAep8EbOwwsUEYXxSH/7NX
         +CUu4XMaLQ5UBKpT/nb6EfMwbiUTn08OUb4pltTXtX+JED+xdylEWhCUnYm915UW12Qp
         upkg==
X-Gm-Message-State: AOJu0Yw2qWuK4xt2VSHADTZEnOlXzk8a+YpqRy/KYlTYbWjZoMd4s4UK
	CUqMLwdTY4nbhXS7gFY1wTcRbbpnjBVH9WpkSruZzi5JhsThnYOq5Ewx4i8B7w+WnEjY34R+9EF
	C1qaq+AaJFaPOg6ntK3QjGX2X3eIMFvH3OghfagOu79W2supCDfSG1htGgabxZVESN7rF65RTg9
	84Mvg=
X-Gm-Gg: AY/fxX7teOBt+mFqymCoqS8R3f3blojyu7Q89AroiORQm/JUh1+mh4UPzY2b1utZmKE
	gYk01lH5d0HxzzkDNEGxNmZNtVVdJvNwWSoFUNPH14Y0NymexsMMPm3P6JBMSxe5hpaxH/a+yUp
	BehhKYPbbHV7JM8vkQx2/pjK4w5LxLB4rPYQL1LVTRWxDmoZn+d1JhDMo3k5f/jUhXFJ+go5aaN
	IEs0qyxpzJ080dsQWmGc97zH8iv8C6nWCgdHAukqMOHFvcMFWwLWMTgnXjTro6TQR4dfvjBK4Wi
	FnX14Ql/TKFgreg7VDal3cSA9xDJSwUiK862b6oSd7usYpd815UOmFSa77IzpmhX2CuNxRY1OWu
	B8Mr59oby3iNtn/jMwQhwUYOyKoTNkDOHEvsZue2Zhw+MubE214GeLXHPi187IjERMHnTvKQwDa
	kIKXXgitq7GDHWT15hibhhHLnTd0aFxkp3Ig==
X-Received: by 2002:a17:903:22d2:b0:295:8a21:155a with SMTP id d9443c01a7336-2a3e2df52c2mr22042915ad.35.1767687629843;
        Tue, 06 Jan 2026 00:20:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLgZrCaDXOi3Xok5vW6HXIYuCwpSsCu/rt332gbh7AdOQycjnlgt9wCkQjN8C3Jk+kGo/WHw==
X-Received: by 2002:a17:903:22d2:b0:295:8a21:155a with SMTP id d9443c01a7336-2a3e2df52c2mr22042545ad.35.1767687629250;
        Tue, 06 Jan 2026 00:20:29 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd3284sm14545575ad.91.2026.01.06.00.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:20:28 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] riscv: Introduce support for hardware break/watchpoints
Date: Tue,  6 Jan 2026 13:50:19 +0530
Message-ID: <20260106082021.2680658-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: QsPErAR-MdOCwhFgikhh4VeWrmTn-RFY
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695cc5ce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=JSQdZKtrMsnwzkd4akMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: QsPErAR-MdOCwhFgikhh4VeWrmTn-RFY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3MCBTYWx0ZWRfX/7PlbgrJYWnk
 PsHp7bWFQh6bs7EyvzvWFuBwmVkWQrnxM62s/w/Lp+WHCFKo0F7IrN+vsYXY5Ph3JAncveirLGI
 VCnMWGhLgIw4rsISsFiboUdd4aJtHiGohwMcxoMby6RA/pYTHONxmH/rF9oaDLoM74tYjqqCSCf
 5stmcVvfWVGBxWvYeHf+gnGjv3XmLGFqw9sr2NEoDm8bIn/3d4dgTxvhl+tw6hEqo7wKntEC4/f
 svnG+PSJUDwmT8axiHrDSEDfTie70b05PpTIBc1A/wC44VZpitpkT1JAc6wYpqPP920FS6cmYWw
 nt8PsV8rGnysqzrsrefjETuYIvn3/tMdEE4zZ8fLKGT0HUmhoJ1Kx9sfzXMrNltxAoqYP4QD4mk
 CfnzamWYFy+5v2z+w9iGldgHapgg5r/1pGq+QVuQDSZCuxoWkMJsNZU/jMHgbllPoUmOlbGRhM1
 Fi4OES99rco7O5NH+zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_002032_663068_CF42D8E3 
X-CRM114-Status: GOOD (  16.34  )
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

Changes from v1:
	-  The patch that adds the extension and the function IDs defined by the extension is
	   already merged. So this patch builds on top of that.
	- Added breakpoint test application in self tests to test debug triggers

How to use:
~~~~~~~~~~~
OpenSBI:
https://github.com/riscv-software-src/opensbi.git

Qemu:
https://github.com/qemu/qemu.git

Linux Kernel:
https://github.com/hschauhan/riscv-linux/tree/sdtrig-v2-upstream has these patches pre-applied
and based on v6.19-rc4.

or

You can pull v6.19-rc4 branch from Linus' Tree and apply these patches.

How to test:
~~~~~~~~~~~
From the Linux kernel directory issue the following command:
make -C tools/testing/selftests/breakpoints/

This will make a binary named breakpoint_test_riscv under the same directory.
Load it on the machine and run. Sample output is given below:

/ # /apps/breakpoint_test_riscv
breakpoint triggered!
Breakpoint test passed!
watchpoint triggered!
Watchpoint test passed!

Himanshu Chauhan (2):
  riscv: Introduce support for hardware break/watchpoints
  riscv: Add breakpoint and watchpoint test for riscv

 arch/riscv/Kconfig                            |   1 +
 arch/riscv/include/asm/hw_breakpoint.h        | 320 +++++++++
 arch/riscv/include/asm/kdebug.h               |   3 +-
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/hw_breakpoint.c             | 657 ++++++++++++++++++
 arch/riscv/kernel/traps.c                     |   6 +
 tools/testing/selftests/breakpoints/Makefile  |   5 +
 .../breakpoints/breakpoint_test_riscv.c       | 172 +++++
 8 files changed, 1164 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
