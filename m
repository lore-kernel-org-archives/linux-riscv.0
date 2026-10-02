Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58368CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L3ymma5D0avrU/hCJb9jY6lIaZBR9JPEmQ7KnYyg0uo=; b=l+xmIJmOCZCDSE
	NAL5/+HnM0KGX3ifKYjnQZeHwIMAQmdZD8Wm5Ka8B/WQtD+ff+0PkgFCH/KdasX7jaTPMeXJgIJBQ
	zfG8dCUxPHzI9DHa4zUeHZQ/U36zzWSKoRhM9hyTE7saaHQofnS7KfLOYno3es/okdcPZjVKTwiXj
	h4JuCZLkCkT++1JOJJtg5a6CGgSyE8+3oXr/pg0rwdS5ZDm0o5HFm8kxjXovy8trGdTZdk6TKWms4
	dMGuR22TerqajPmL/aJvYqWe9j25PoKf2aE9X81zNUina2QZ+aD4G7RYj4GlEbamsX2Tee2oJfCk+
	2X12YakN6FvU6Gu3SmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgH1-0000000C3JH-0HfM;
	Fri, 02 Oct 2026 16:38:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgGx-0000000C3Ic-1vOR
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:38:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692G3pKC1543963
	for <linux-riscv@lists.infradead.org>; Fri, 2 Oct 2026 16:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HsZcy7a9Otoosd4ozeXc9gj+pTu1VbaEtDu
	qjGWoYGo=; b=TXs7LlvgmvzWhXVx4prUXYbLtMmu6SEFeo8H8Lo48xzmMSs5kMg
	4DJN0uFP6x39mZ9lNDbjJ+kFiqyYfHi5w7risJ8Zc9u3/Wd9zX9MfyCLuUYUgq3J
	VnCdU3uD2051mQWn/30vesW0o29cBMwWR8MuvScWc3eYIr2w5bFBEeahYSMUaYJ3
	9PO2YvkVXORmATNro0Ia6tygRHhn+IwkqcFjz5IYOiKKOjlka8mRH2iwWn82s1fl
	6ywEJCybXF7OUiFrcPv585CLOfEJr7SU8GYA6G/Luipz/Hb6fHRKQ0ve2IpJ2V6F
	ZLdUW7GuFB+rN92ACTtlQq4VyLflqU4/OZA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ft8r3g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 16:38:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34e676375d9so1596351eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 09:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790959089; x=1791563889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsZcy7a9Otoosd4ozeXc9gj+pTu1VbaEtDuqjGWoYGo=;
        b=a7gBEjM+dqFdfSNeiwEDpekdShSr7D2VliOxPk8uhnFHIgtAhuWOr0JLEHYJZuZfLL
         /T+06G+TVG6InVC9d0UhYdJFGAQ43ABbwitwNjgMDNIAe75d9T4cmVNDt95A2a7mB00F
         aSs8wUx+UTdEZeI2YeDX2O/UoEfjAt2vFcnys5ahuuw2PYPVHXiSEbm8JmrO4kbal0Ae
         AkKAYbo0i/BrZggAOtdk3GBLbyRbuUJHFfSoiSJWXxFtJ8HONsSQtOhRjmJ8JC8vQaiZ
         qUEnVv9jaXHh0yL7+RrYQ484zppplbPN47IciE4gGOT6MaKwfTelLAUyyAC8n8gtQVRj
         ET1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959089; x=1791563889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsZcy7a9Otoosd4ozeXc9gj+pTu1VbaEtDuqjGWoYGo=;
        b=aNEQlbBnXKSz0dyOcZP9m2Z++Vww8Aigd+3B0yR2JwtJDyevBbHPn+Bvvio2nOljZS
         39GuvZbxbemqzt18Cgfxck4hw5xen2PeDwh2BfYrqulBqfwiqSvoA4f0oarOCPmgURtW
         mbFzvGHld74UX3dCZuEYTDUwQjQqUcls098rTk1nmUG47GMpnJaIAWoMZGq6qU+Fm57/
         iVNFeeYgbFZRvibOcMI0xpFlqN+W4YJ9UHo2qJLKA0/44dU82upo695l9jcM35LA1EI4
         E10YCFrsWPtpOvd8gFGqzo+LcFZUxSM95fAW9TeolZBCcnBSlP/Id3kLFBa2cAYXf5LQ
         b6HA==
X-Gm-Message-State: AFq9FYJ1Bc43bXsvcP9MWtAqQsfxwQzfPETAGS1n8sMzskGMzWAQ+SOC
	55Yze5dM7iScUfk2o1FEnkAq7OcjB8uXuz6ecXh5HnwPGvygKGZQIfF5lk3TDePXTJc1sQrVZTs
	PeKfu04h5dzv8VWsNi7qcCJSG7jvQXGOb73jU0A8IWlzN1Qifgn6Zjc6qPZfuAQb7gWNWEQs=
X-Gm-Gg: AYBFou3BlXES/haiG7eOk1UMU0fXaZbI1NCcqtTHB9HFSg3rjhvVBSxUefifVcPyLWO
	vrC4kMOcP4ro2W1GIX9IRA9LGKAFPEcOEe5YMdz5zN4q457/2hZSFLW0v7g5ytk/DC4PTpWZFnE
	6Hrb0g12sUGtYOhnojaobdEkgma7d5xudBmZV9F1GTUpTYmn6wSDVgWDlBsllnlwO9NtFfYMGHF
	ECHXyuUB/hbhE2v0jgvdnfJyBAtWiaVR/DwKZPFX71zIwhOZP+FDW9hyFR07QH6QqDWFJ18/e4M
	mU8ZzEBX8AdlGKUeqUl1K7pQj6t0gVXHpqQ5aYtRX6kjstnDyVCeY6A6RXRub6QAnd4kyLVe5Hx
	Jsngm4mnpOIAaT/RaSlCdmNhG478rciuxhcyVU3Y659Q/8y3eZ0PYBtuPLSPz3zNPnpRAYLwCBu
	z1UthqvUGoKVOn
X-Received: by 2002:a05:7301:23af:b0:348:201a:6c88 with SMTP id 5a478bee46e88-34db6605d44mr6538949eec.13.1790959089079;
        Fri, 02 Oct 2026 09:38:09 -0700 (PDT)
X-Received: by 2002:a05:7301:23af:b0:348:201a:6c88 with SMTP id 5a478bee46e88-34db6605d44mr6538916eec.13.1790959088429;
        Fri, 02 Oct 2026 09:38:08 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fd5620sm7756398eec.21.2026.10.02.09.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:38:08 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net, anup@brainfault.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH 0/2] Add RISC-V SBI watchdog driver
Date: Fri,  2 Oct 2026 22:07:56 +0530
Message-ID: <20261002163758.2919372-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: z_O3fsvfAKJIEMNpBVwMlkf0y9FnQCXB
X-Proofpoint-GUID: z_O3fsvfAKJIEMNpBVwMlkf0y9FnQCXB
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6abfddf2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZbvlEdOQB2PwL-2qBAUA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfX4uml6ZciQZlM
 D4zwkx8OZumIaJ9xjaVxujzCYZC8sZjrBR1ENFGfK9QHS012CAwkNAEfLX4cU1yBV0miTe629Ln
 ODZaYA66WteNmfo56tdpNzYacQ49/FE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfX49bmu68K42G+
 oNHWlJnlthwb9Bxu+D0AplZg7q+MchFd0n5QyFZH++cXmhBQTO63wvvHMklI4KLhiOj1wkTQw/0
 nYHT7xsgZbVhQyPH5hPTXYcIxF9DPIDHKmPRMUYHwtXPHw9KO5URxjiQUf4uNkNaC6OXiE/ysES
 wZUpluFdAUZ4jaYCGD9wCRP5R3Fzy0hhQtQ6lYCPSRVmxCdA2SXsjKMnk94BLeV3OVIbC71qX7P
 Z8caAy3ABiD5sM0qsQHLwTLFpg2Hy+/LJ3roFbBqfL869IXZi6iOhRqk92mt1ZCqwbIwSqo21lx
 pl4e8nC5jcRUMUEx8IGSi/p4vpFICrzI604xW1e913rkL3VGSuqkCOmvkrQDZ0AWurN/oZy0V2h
 v13XpQadGTnZcNMgS51ksmqiGW1hMxn3ed0sNdDpuXAbjjlUdTmLg4FcZGQ2qUNDoGS73Wk/kxr
 EMvF3oyLF6vEcbnWL4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_093811_626733_ED24EC90 
X-CRM114-Status: GOOD (  16.72  )
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

This series adds a driver for RISC-V SBI watchdog extension.

The SBI watchdog extension exposes watchdog including start,
stop, pat, read and write attributes to the S-mode software.
The kernel driver uses the standard SBI calls to interact and
configure the attributes. The driver integrates with the
kernel watchdog framework (/dev/watchdog) to ease user-space
implementations.

The driver currently subscribes to the Message Signaled
Interrupts (MSI) for watchdog pretimeout events.

The series consists of following changes:

- Patch 1 adds the definition for SBI watchdog extension ID,
  function IDs, and various attributes that are supported by
  the extension

- Patch 2 implements the kernel driver that utilizes standard
  SBI calls to interact and configure the attributes.

This is based on the OpenSBI watchdog extension implementation
patch series available at:
Link: https://lore.kernel.org/opensbi/20261002083040.2533097-1-prajwal.n@oss.qualcomm.com

Steps to test the SBI watchdog extension
1) Compile the kernel along with watchdog kselftest for RISC-V.
2) Compile OpenSBI patch series mentioned earlier to generate fw_dynamic.bin
3) Launch QEMU virt machine with IMSIC support enabled.
   Note: The following command requires a rootfs.cpio packed in Image. It can
   be modified to use rootfs.ext2
   $ qemu-system-riscv64 -M virt,aia=aplic-imsic -m 2G -smp 4 -nographic \
     -bios fw_dynamic.bin -kernel Image -append "root=/dev/vda rw console=ttyS0"
4) On kernel boot-up, the /dev/watchdog entry should be available and the
   kselftest binary (watchdog-test) can be used to test the functionality.
   Following are some sample test cases,
   
   - Dumps all the supported options.
     ./watchdog-test -h

   - Starts the watchdog, configures the timeout to 8s, ping interval to 2s,
     and disables the pretimeout.
     ./watchdog-test -t 8 -p 2 -n 0
     
   - Starts the watchdog, configures the timeout to 8s, ping interval to 9s,
     and disables the pretimeout.
     ./watchdog-test -t 8 -p 9 -n 0

   - Starts the watchdog, configures the timeout to 8s, ping interval to 2s,
     and configures the pretimeout to 6s before the timeout.
     ./watchdog-test -t 8 -p 3 -n 6

Changes in v1:
- Initial RFC submission

Prajwal N (2):
  include: sbi_ecall_interface: Add defines for the RISC-V SBI watchdog
    extension
  drivers/watchdog: Add RISC-V SBI watchdog driver

 arch/riscv/include/asm/sbi.h     |  26 ++
 drivers/watchdog/Kconfig         |   9 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/riscv_sbi_wdt.c | 406 +++++++++++++++++++++++++++++++
 4 files changed, 442 insertions(+)
 create mode 100644 drivers/watchdog/riscv_sbi_wdt.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
