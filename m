Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962C5CD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7tD4AaE9qeQV6IvDBRqTZZIlXzKNAtUNVInaXYgw/7M=; b=GYfS3p64Ani56M
	cObsYtMafaiFFF6tmyfHzMGBPPCABcxq4Q5cH1PEzG9ieZMUusuYcXn3f3hWhRC+/abhHnGWY1EUv
	y1/GTb63JnkPJGTDTs3flBq4wRDLHqW1mZoAQmE6nSpKbp6kOtQAyk1aon9ovw7Pbn9JnAQFPw4m2
	bSMRMNrMqsOlP2ky79kClVJM0P58BPtSJIJN4jMDdzJechlxeH4EdUGyd3H1EgUPqAOevCDt/Ggxv
	Afl67BygelQMR2wPWMkgMp/KVpZVkKU39LF9CkLTvyo9GTYe2m3vjqNadpHAs8HirsuL1XkLARwvM
	NMZMekrmUq0JJhjwkgsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Bz-00000001m6A-0M9i;
	Wed, 13 May 2026 08:43:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Bv-00000001m4t-1hGG
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:43:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pCuS2331504
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3aWzzWqgV1S+DaS5mlIRnU
	gf5ktWPNv26+QnmRkT+ME=; b=hwR7gbVUoxjURX6qLYAEAxMb+yk0dRG5EZ51x/
	dcXzldklHMzJYhJvk3EqH3s3UdMsgBWSt8bQ9ZADjslw4ciyf9IToJhxJCNvySQi
	isOf3KapTjbRuUG2qXNi92TTYlZfiCKt8HbhpAYZldXTCt1V/P5Rc30lM3tlC066
	NPTZviIYlHcFof+2pKdHhaQ+7RxyGjgotNU5iScDn3Io6YLzFu/OSeZnKzUTV0MN
	e+gIvbaxU+7XeDYSAvdT1xKhTpu4Te2mtjam8/70wbwXtlAiKt+/UP3MaixxEv+j
	GwGWOkUKak7iiRwD8LhOPgUfIRnRsLEzdsAvtKVh+INJSa8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43ypc8dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:43:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36781927b4dso8789095a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661821; x=1779266621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3aWzzWqgV1S+DaS5mlIRnUgf5ktWPNv26+QnmRkT+ME=;
        b=VK9GR147ng4qH9ywCg0uWs5tzAeXbRARTEgBZ9djf4XcePLFjBWVpxOca3DrDJbUhF
         VgwUGDF6Qu3+PH+yfZC869YYU64M+ba35rIY780XDS/KF4FbhJwZiMLXW8H3KiT3xBxe
         gvleFyxOYuj1iAnwJzGYq80FVUn6T1ZaHbKbiQJduPxkNfpR9elxrgKirrexdC52VuQ8
         iPOQGbJdvioBfSkJn8fxad71eC1YfoHo+DERZVgzJKV3u17GkzNZ/OGSA1NdaBlTugX+
         DIxVxj2Mec54Dv0wXUfZ2FfR/nw4HTvCbkuUrSzv8gsIRDTkfib7UbuiVsUpLhGjg+6y
         1FcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661821; x=1779266621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aWzzWqgV1S+DaS5mlIRnUgf5ktWPNv26+QnmRkT+ME=;
        b=aLV+9QsImsH+6UElqehfOh14ZhY7o7TcnK7aNdq+TgsbNro3hilBr38ijuW41D59je
         epDblUA6f2J/qCyYcq7PPv+AUQbQVvyMUHuF4W7WAFiDdBnxWca/mXyDHv/yPxWiXkQE
         kTrWONZGPVX7lDxhVsPLiKVODbxnW/KF+c6n6mDwkCJxhCiAeUa0Ao7xQMzBlQQ0Ofat
         nL+fN+hfpPUP7IuyHy6t18HsU4rs3/sSnIVF6jp2ukdBd3uI7UkRfyICZxrJU6VaEWeb
         v24lritBwzs1xw7DEWoQipiirGG4Gzj6tWXKG2+oMwasifwbx4Xpcl9dySzqvNthMVeK
         Nqyw==
X-Gm-Message-State: AOJu0YxpI2+1hW4hiTNFFST2z+CHYNavIIV+ZnUVjN604uyrTUGfv7bS
	DXGYzS+mq27rdFthfFFMbrExcRapSMolpAGMm2PzjPS2BVk6Ofi5fyh+0ZtChZ1IQG4Gl6cz9Ec
	MQDzLUuWED4kSJJLKW1vw/1F3Eft6/kVq615yqQ9Sou94Xi0G0vUHcnTEqxbKgXOjfblnpwwMsn
	CQ/Qs=
X-Gm-Gg: Acq92OGwAIoIePsecs2eeIBb/zI28hLHhERRPUBGjspm+T/F4IklUd0ooJ5shIp146Y
	OoQJxC+1NXHf2quzBCZWz9RYnfPZ9AftllIjeS5HtNs+0flscvzaMhLV1sWbAClTE9XCHpaovXU
	ELaLaEjG0BKOpv1KNcsxMWjUorGsVowQmKeLal/ZF6AUdVnA/IMr3YWzkWQN+L1G0dHeLQ6fGSr
	T9r0HhSzGV+9Qs78Lhu2hb4FJlSMtoUgbLAyPZDIs6JUrKvkICPUzJrjn0Ub6r9ZaGUikLNAKv2
	q06qCKxUnw4zWoGN5y+OokMJRvJVXJ6xR0m4sa8IOLRtr4DSTQCVc9YNj3avQjp2uHdedw9zrpR
	ogYw3x/Dm8W4v7VOANWtiKDLTs9TAeLFmqlRoTVfurQzpr0YJKQ7044mekb5IQssePI2SFqgHW2
	ykIoiqMll3c6YQwtHVp8oF2U+YnGv6dcnruedlKbc4Yz+u8A==
X-Received: by 2002:a17:90b:2ccb:b0:367:db13:aca6 with SMTP id 98e67ed59e1d1-368f7a26e42mr2102555a91.26.1778661820919;
        Wed, 13 May 2026 01:43:40 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:367:db13:aca6 with SMTP id 98e67ed59e1d1-368f7a26e42mr2102502a91.26.1778661820245;
        Wed, 13 May 2026 01:43:40 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:43:39 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 00/10] Add RAS support for RISC-V architecture
Date: Wed, 13 May 2026 14:13:15 +0530
Message-ID: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: jnTtYbOj5TMbYPVEWrrEphbVqWhJJoMy
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a0439be cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=VwQbUJbxAAAA:8 a=h0uksLzaAAAA:8
 a=dw0t6H4-AAAA:8 a=j7arexpxAAAA:20 a=WC7QRpXXAAAA:20 a=F-tpdftpAAAA:20
 a=hVMvMyeA2jgiXT6_RH4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=MSi_79tMYmZZG2gvAgS0:22 a=wVJa4CU9-Z26yuRAZDil:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfXwd0zJd0z5Qwa
 EszD2qEK69TPZ5CEZ+HvYS2hJSOxq4xEPwmCKAZjcBwjt1/WUXhYENGu1Px+MNkF9bNCrJvmXpx
 czqcPXMTUQUSSI9W+Cpob+PnjV6xVrqr1WXSRMT535aqyxwsWHYc3SCKepfW/9U5vsZuhbAuu+p
 aJAhZIUHtPR0FUVOEykmd8XOM6X6AEGqJ6FRFk+phMxkEZ7KI6zslcPVqlZPYvsfoUcqtd8/IPe
 MFSy0ZgaE2vmyMVogjmPS5vKcsdE0gL7UsI9WiiO/t2NtcnL8jA6srUMM2G52JHyqPtkXexvKXp
 myj6oR+zQdf2euntU+b3veQVeB1JbPK/L0XTTnsZ6Eft3wt0X7yHm6GtCx71hTKv00gApcExI6J
 HfAWTa9Aj1QmcTE8483EjkDC6VmVPMzbGN1xYkUF5J2CRoWu8amPFDW4G7UR811KEDMp5NyDLpf
 3Js/l40vHKdSK92DjlA==
X-Proofpoint-GUID: jnTtYbOj5TMbYPVEWrrEphbVqWhJJoMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_014343_563298_B7E20C35 
X-CRM114-Status: GOOD (  17.47  )
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

RAS stands for Reliability, Availability and Serviceability.

This series implements the RAS support for RISC-V architecture using
RISC-V RERI specification. It is conformant to ACPI platform error
interfaces (APEI). It uses the highest priority Supervisor Software
Events (SSE)[2] to deliver the hardware error events to the kernel.
The SSE implementation has already been merged in OpenSBI. Clement
has sent a patch series for its implemenation in Linux kernel.[5]

The GHES driver framework is used as is with the following changes for RISC-V:
	1. Register each ghes entry with SSE layer. Ghes notification vector is SSE event.
	2. Add RISC-V specific entries for processor type and ISA string
	3. Add fixmap indices GHES SSE Low and High Priority to help map and read from
	   physical addresses present in GHES entry.
	4. Other changes to build/configure the RAS support

Changes in v4:
 - Rebased to Linux v7.1-rc3
 - Changed RISCV to RISC-V
 - RISCV32 and RISCV64 to RV32/RV32E and RV64 respectively
 - Raised a review request for patch "Introduce SSE in HEST notification types" in ACPICA
   https://github.com/acpica/acpica/pull/1170
   Keeping the patch here for complete functionality

Changes in v3:
 - Dropped RFC tag because the related ECRs are now approved [6][7][8][9]
 - Changes to be conformant with SSE v8 patches

Changes in v2:
 - Made changes to be conformant with SSE v7 patches
 - Fixed some bot warnings

How to Use:
----------
This RAS stack consists of Qemu[3], OpenSBI, EDK2[4], Linux kernel and devmem utility to inject and trigger
errors. Qemu [Ref.] has support to emulate RISC-V RERI. The RAS agent is implemented in OpenSBI which
creates CPER records. EDK2 generates HEST table and populates it with GHES entries with the help of
OpenSBI.

Qemu Command:
------------
<qemu-dir>/build/qemu-system-riscv64 \
    -s -accel tcg -m 4096 -smp 2 \
    -cpu rv64,smepmp=false \
    -serial mon:stdio \
    -d guest_errors -D ./qemu.log \
    -bios <opensbi-dir>/build/platform/generic/firmware/fw_dynamic.bin \
    -monitor telnet:127.0.0.1:55555,server,nowait \
    -device virtio-gpu-pci -full-screen \ 
    -device qemu-xhci \
    -device usb-kbd \
    -blockdev node-name=pflash0,driver=file,read-only=on,filename=<edk2-build-dir>/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT_CODE.fd \
    -blockdev node-name=pflash1,driver=file,filename=<edk2-build-dir>/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT_VARS.fd \
    -M virt,pflash0=pflash0,pflash1=pflash1,rpmi=true,reri=true,aia=aplic-imsic \
    -kernel <kernel image> \
    -initrd <rootfs image> \
    -append "root=/dev/ram rw console=ttyS0 earlycon=uart8250,mmio,0x10000000"

Error Injection & Triggering:
----------------------------
devmem 0x4010040 32 0x2a1
devmem 0x4010048 32 0x9001404
devmem 0x4010044 8 1

The above commands injects a TLB error on CPU 0.

Sample Output (CPU 0):
---------------------
[   34.370282] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 1
[   34.371375] {1}[Hardware Error]: event severity: recoverable
[   34.372149] {1}[Hardware Error]:  Error 0, type: recoverable
[   34.372756] {1}[Hardware Error]:   section_type: general processor error
[   34.373357] {1}[Hardware Error]:   processor_type: 3, RISCV
[   34.373806] {1}[Hardware Error]:   processor_isa: 6, RISCV64
[   34.374294] {1}[Hardware Error]:   error_type: 0x02
[   34.374845] {1}[Hardware Error]:   TLB error
[   34.375448] {1}[Hardware Error]:   operation: 1, data read
[   34.376100] {1}[Hardware Error]:   target_address: 0x0000000000000000

References:
----------
[1] [RERI Specification          ]: https://github.com/riscv-non-isa/riscv-ras-eri/releases/download/v1.0/riscv-reri.pdf
[2] [Chap-19 SSE RISC-V SBI v3.0 ]: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0/riscv-sbi.pdf
[3] [Qemu source (RERI Support)  ]: https://github.com/ventanamicro/qemu.git (branch: dev-upstream)
[4] [EDK2                        ]: https://github.com/ventanamicro/edk2.git (branch: dev-upstream)
[5] [SSE Kernel Patches (v8)     ]: https://lore.kernel.org/all/20251105082639.342973-1-cleger@rivosinc.com/
[6] [ACPI ECR for HEST changes   ]: https://mantis.uefi.org/mantis/view.php?id=2522
[7] [RISC-V CPER Table ECR       ]: https://mantis.uefi.org/mantis/view.php?id=2551
[8] [RISC-V CPER Proposed Changes]:
	[PART 1] https://docs.google.com/document/d/1-Dd-T_QIUqjq3muyjfK8IUeXWr9QWkFAkFyzweXQL30/edit?tab=t.0
	[PART 2] https://docs.google.com/document/d/13y8kQqbVtCAPCMI4oJ80MtcUS5FL4xuO914NmfCi5vI/edit?tab=t.0
[9] [RISC-V APEI Proposed Changes]: https://docs.google.com/document/d/18rxA6JTyFTelEj0aiKdSFzxPgwyHyThj8EP8lXqWZdY/edit?tab=t.0

Himanshu Chauhan (10):
  riscv: Define ioremap_cache for RISC-V
  riscv: Define arch_apei_get_mem_attribute for RISC-V
  acpi: Introduce SSE in HEST notification types
  riscv: Add fixmap indices for GHES IRQ and SSE contexts
  riscv: conditionally compile GHES NMI spool function
  riscv: Add functions to register ghes having SSE notification
  riscv: Add RISC-V entries in processor type and ISA strings
  riscv: Introduce HEST SSE notification handlers
  riscv: Select HAVE_ACPI_APEI required for RAS
  riscv: Enable APEI GHES driver in defconfig

 arch/riscv/Kconfig                     |   1 +
 arch/riscv/configs/defconfig           |   3 +
 arch/riscv/include/asm/acpi.h          |  16 +++
 arch/riscv/include/asm/fixmap.h        |   8 ++
 arch/riscv/include/asm/io.h            |   3 +
 arch/riscv/kernel/acpi.c               |  12 ++
 drivers/acpi/apei/Kconfig              |   5 +
 drivers/acpi/apei/ghes.c               | 101 +++++++++++++++--
 drivers/firmware/efi/cper.c            |   3 +
 drivers/firmware/riscv/riscv_sbi_sse.c | 146 +++++++++++++++++++++++++
 include/acpi/actbl1.h                  |   3 +-
 include/linux/riscv_sbi_sse.h          |  16 +++
 12 files changed, 305 insertions(+), 12 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
