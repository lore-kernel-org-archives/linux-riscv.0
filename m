Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE2BEF5862
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 04:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vL0ELFtdZSYzqsMtFPUUiU9inb55H2TTZoFvB0IVNzk=; b=lDt7kaRqoAgw+s
	m25Zh3b2wxAwSXKJlhxSFzm/H0P9FOhZxuNQEu3kiFOZeOoZ/fGJ4Tgc+0HQAB+DwBs5XqTXkpQc3
	jpcz0o4MJPRVHoX8ThZ6au2xyncr7lUvVQmL6LvxXgL24v/xlItU0cv+WsHC3VeEfgyjfCYHfD49m
	AX+pFK3DgCH9TW4KfHo+xnuNCfZqwT5jmkSLsUU1TRmowEPUg120b/9vXqDyt1GAs8+T38WK6M5eD
	qM376nQXJH5Zn+K3IBXs954LKEA0+e3/sVzWgl4VvQZIIQdltRif71rQ1uIQNQhdsRlvJqhDDCqvQ
	9UkHxQ2asJ+46XQ1/qgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuNsy-0000000HDv4-3VrN;
	Mon, 23 Feb 2026 04:49:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuNsw-0000000HDug-1TxQ
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 04:49:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MGdIpC1507390
	for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 04:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=97WzUlery+Lu32sx5iV+DbtbOjrH5XZBo8z
	xyuyWm30=; b=avce3QLlW5dh/VnktkYX7gaiNRjx6le8pbIFFyh5o5qOuf8ANQw
	Hnsa6LeP12NiUIPqHmPAHJAMj4I4hWe03OcVLuzdYM73VXkJ4VanOpBFO4JPQehI
	hguwc2a6Pd2LgZV4A1UE/cpgm6XF83L7Eao7YJc1c0sAQ+hCktC63z+Ji4hU44fv
	Hm3mdGECWFx1fcVGD+dqgvMxh0jHdvny9MFmqqVrV6MpH1SP/ZZmyNEwXe0XRXkQ
	v2aXvWI3BwwSfCLL/v/mBHAF7hppxaR9Rww5PG4Kp8gIF8SnkwKtyUMPsoD71Ooh
	K76BmjlHa0IYe1Khd1ky4AfW9Ne7Gjf3+3Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vukar1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 04:49:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3562bdba6f7so28261167a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 22 Feb 2026 20:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771822166; x=1772426966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97WzUlery+Lu32sx5iV+DbtbOjrH5XZBo8zxyuyWm30=;
        b=WMici1d9Tjl+fvVictrisxU4ZOgTpyljQfzvtlxKUJPH+O7h6dJzVrv7Q25OPCaR/H
         OnkCOPKutCs/EilsL4IZ40YvuBHj710ZPUMgqx12vf0mtHGK6B79NpI8myOG3vF9HdbT
         /CMHFhRczPEhZVRRj3ufAoBMD8cDUF41b/+M106AnM7D5juBZ7Zg4Vfyo7WSBnhbjwru
         Z9azZ9bVI7EpIOT9G4c2fXgNsw28E031mFSutr5DA2pDOso66WYSHjsxlVoLwzbhK594
         wqh5CkE9jjbVxSRxUAl7GsS4n0vPI3utCDNEgL1Hbs+BO2fS8PWgp7/58zAe/YeXKBL8
         Aj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771822166; x=1772426966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97WzUlery+Lu32sx5iV+DbtbOjrH5XZBo8zxyuyWm30=;
        b=Ri5R+VSexTxyK7EG5uxGZ45TNlNnpsHN9+j/a/ORuS7X/4H3jM4AoCIPuUBPS3rQDl
         ZO9nMBcFLsRmXdohCUVhJrB8715WnXcVc6MZc8Ov27hZp2/XD2xKcd22HgsJJxJdaFlg
         n60XwFVrv6vyN2PdD1QmRebb1klJB4XU5gJrUa8XM+QxI1ZMTNA/d8oSAwZ7RLyr4rVb
         0xu1J4w1SOHGcGDABVvX61r8QJjFN8/am0WnBo6fDfAkwkmc1zuRNa0qDfqJhuP8MZER
         x8/dtIWcXxFCVdNil1kAl7rrlrScH/X/nf1+bFOjCsoV6ZBVwrxmdcX90TIUnUVPAbou
         nUTA==
X-Gm-Message-State: AOJu0YyMSp/enUZnCXMldnZKZ0Wh1ZquJzrb0Jvj1dSeIZsbyJSX3I5+
	jSg7yoYl8l/HYPQ0r67MIcJxwFgAGbazClu02ZBMLBwwU7axwk11gjoJSkuA2CngkKQkdKZmwMv
	USDIDfbETM7cjzwOk0hNQW+bkW2N/0vx7vwjYwdDYC97Q0w7Fr0Q6SbVihhWH3GhshBJPbRw9V/
	pClU4=
X-Gm-Gg: ATEYQzwg4A7fkp9UtpBa4HW5Rw5NKySo58TKDnZjv5N9Fuy8cCR2loa0NYKvyo08zpf
	XXuMYGyULmX3qvyZ992DCu0OSSzcsvohKxS+R/LuGMxL+ej8hHPqLqBm3+JiHXe3Dar7z4GHsN6
	sGYejiwA8XjOPsYQx9UJ6RSES0gpYaUTcF7xJlQ5vPep4PahD+pPUOBMheakUUt36tK2fLcL+o/
	WnbBmxp5u7viOK2Ig5fAtFJjsNhyesYvqoVdHp/6tAoF8FdbuN7GxR+zt7vEl8vtHaW4pouRAT6
	KEiXXvtzX8bwC9dFkCCn3ojlpugcytS32nmhOH2XiHX0+J66yboBQjiDRrQtMSkDoZS7ci9O+vj
	XdFWtbsW7HmgbkImECmgoKhr1cY0k5CZu3xNg/sX+3v2UyvEPUGf9naSzMS/t/DTWICBT7ewtsg
	hahiYfrEMT7LwB4ccVLekgEc0Cjyl144vh2oxJKeUUUeO/4g==
X-Received: by 2002:a17:90a:d884:b0:354:a05d:9dc2 with SMTP id 98e67ed59e1d1-358ae810988mr6219600a91.9.1771822166416;
        Sun, 22 Feb 2026 20:49:26 -0800 (PST)
X-Received: by 2002:a17:90a:d884:b0:354:a05d:9dc2 with SMTP id 98e67ed59e1d1-358ae810988mr6219584a91.9.1771822165915;
        Sun, 22 Feb 2026 20:49:25 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a2a768bcsm5623954a91.4.2026.02.22.20.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 20:49:25 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 0/2] riscv: Introduce support for hardware break/watchpoints
Date: Mon, 23 Feb 2026 10:19:16 +0530
Message-ID: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699bdc57 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=JSQdZKtrMsnwzkd4akMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: vDERZ6AyQePFB_sS9Vx1x2JY9W_3sPDm
X-Proofpoint-ORIG-GUID: vDERZ6AyQePFB_sS9Vx1x2JY9W_3sPDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA0MCBTYWx0ZWRfX3MlFXztU4Cvy
 CxlJs/ZhuceYTryzxi0ZptIWQpm8aJ6GXG5z8YWj4lEEHKyHEAgkGZQMR8zpYoQGhb6OAF035qJ
 h8t8rx7yKK0NkEeHp+yK6NVFllgudL92jdT+LS9+I42eS89mFETr1qvJ2mbtqg9+1nNq6JNsHGe
 z55GQcikAKbzuzF82Hy36d1V77NXHK2jcqfmXumsdBnVq6M7+biI1Fsc6twA6c1W4IH+PO7Nwmk
 506KqVQ7s1nA/QOLQWJ70aTdf2WEfYbH7gsOfjktBNt0JURmy0KUstlDOJYcQ4HSj8i27qVfv6E
 dEWuh59zuZHoXKbp27AcZG3dX/hyLfC0Rw8dTv1BxDV0W5q34YGUyBQW8b+6uLzVcEMnz66TxkK
 ly7PT+88VxhDDRrNAyaoDNBjY++XxQMG8SZK6c22xt0msOxI1wpqgzcfllObzJ93qbTejYUdZJW
 D9IBIRPunZPIgk+YiPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_204930_509944_EA79B666 
X-CRM114-Status: GOOD (  15.25  )
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
You can pull v7.0-rc1 branch from Linus' Tree and apply these patches.

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
 arch/riscv/include/asm/hw_breakpoint.h        | 332 +++++++++
 arch/riscv/include/asm/kdebug.h               |   3 +-
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/hw_breakpoint.c             | 657 ++++++++++++++++++
 arch/riscv/kernel/traps.c                     |   6 +
 tools/testing/selftests/breakpoints/Makefile  |   5 +
 .../breakpoints/breakpoint_test_riscv.c       | 174 +++++
 8 files changed, 1178 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
