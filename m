Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1253DD232F6
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Z+/wJmUavHGRgISdgyajZTepvanhkRLVRIHMwXfNKA=; b=PGQiN89n068X9J
	8jIa/E6mqohMsk7uls+LyWrufZ0lefmfa14EbF5upbVtdI/SR9FU4vvTdU5YLv9AgJZcqAPLTSz6F
	NdMCvAVztey9clrK2QGmidvqvsCQC7msxbJATW5WIQRs9PR2eqkgqgT1HEID+dWSSiDTm+asLBKAP
	ISnBA0oIIRiiEei7s1Wm7QeKehALnrnQSrlQLOsxgK/RE73oFUKHYvR3NzVsINO4171orEbtPAbol
	+h6GtTuOhtV5DRaHezm4pXxW5Td/QZ+g/nz/IUTAfSixtugC1jhFm5dRfGUdwav83YBLo2AJZmuDn
	N85AmyW71v9DmY/DtuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OF-00000001x9P-24Zp;
	Fri, 09 Jan 2026 09:02:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OD-00000001x8d-09F3
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:02:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982X8o2184005
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jaPeZjaEm2rmsGcviI7wax
	bXzFXJxMs5/kStWwjIs8k=; b=lUvItflCX5293Zm0gWhsCNMlaC3RNDoOoumpL+
	Sf6LfIxKeTAFIjC/PVZAxejpqqzyr0gb6W1Nw/aLtw+C6zuZrbt+DmcG+39DIlfq
	NRNkrd76Y/wc5u1WWex3F3tiaqUzc9Hp2ddwa8c9/j4Cij+hGDBlnh4eraXVXKui
	W1wFmowcuoZaSXqZ4J9wD6BI8tTPt676/kCum5PJmh/PIyTMAv19IMb+FjU8ZsR1
	d6jI42x6ywBrQy0F4H4Hmjhe68CX4bE8KUV0CLJ7A2vyuvHSbJPd6JYn5Gm9opef
	gz9W9AjpxYScfyGWqKGjKNJgWXH55jmTJ3JS1fGeybWNQjdg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn863g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:02:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b952a966d7so7574562b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949353; x=1768554153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jaPeZjaEm2rmsGcviI7waxbXzFXJxMs5/kStWwjIs8k=;
        b=itV1K42bmeDskrT/0yaWEE/mRDme/cSKVaOYxPEZktUbDHG3w4PpeIAiuDL52jgLax
         IfttJyUl3QZ4sznWMsdrHuf7IPwbWGSYB5rJxCb9Y0V/PHZgVJUqNMiLEMB17ZbtaCKR
         XCm5zBcj4El9sW153NDTdac7UUDyO+q7yasM3d0lvmIUZNHJsYNawBv6C1mzMau4/psu
         x71Brqkvd3gAaNGk/5+B1aw/UmIvCtsQk/EZT530ZIRp/nsR+q/NOq90mzWCzAFv+z1Z
         cvg9HnQ0Ix5RGi/MzhuiKqZ+zupnbx2Dhd33crZMwyuPq31YUrcUZ+12hwxhjHb7dJBf
         EWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949353; x=1768554153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaPeZjaEm2rmsGcviI7waxbXzFXJxMs5/kStWwjIs8k=;
        b=SfVKgkDDpPFMdkT6IjbrYlKIE9j5giWvlP6ISUw7UImaZDbr3QiBx33fOrLPqD37cw
         c+1pVyiDRNhQ901NqvzXs9ZrLse5b1UUpcLQqgVH65T7Y0lKodemVkEC3e44aTuLpMSO
         UvAXdIDN9WFlofVd/uOLLH3lQu/AllPmcxCifWRbd/vMcDie9e7XPSwkqx0dVrifmErS
         h5aY/FwWnIOpr8EGB4NbSjD9ptnZFaDOCrVxWYgcY68epSIUm/v493LAb4X+BNe54CgO
         1YBLlbcplGdCL7xXWHUhiZyPCJXN7a9JsXjpLJb161B6wNz0YAojuAYIvl1EOxtuyZe5
         fn+w==
X-Gm-Message-State: AOJu0YyALDAbBQyzIUDXYQc4Cl3l7uYcxzGHtKtZBPWdfM4HsApkKrq4
	7eoXgBnkqaQJZLGGD6G0wbp/CKuNhKre7QiCY2JR4fNdq+HICffWwMk89UdRLlDE41xP+xZbCNo
	uXmpiZt8VXvUEUb4r9qlakYph4qMmhpXLvUtcYYTSmPRfeb7HiFnN/r0ALh1UTSSCqvPO3YkwM4
	cGDow=
X-Gm-Gg: AY/fxX4dBjaz4WXpkM+XTLZ3sQY1plIgkjvlo6dNxSZKHw9G9cQgvpqPhTd37klPMFz
	CMaQTlYWI1E8E4HMUmA3eUZj68hVZpccooo0WZX4xtCju+RjIbFDkQWF2XZ1L76X6trg8Kw2Axn
	hSQvyvA7LYAO1P1hsd1bQDfu4faWP+X/JKFgnmZuDt9UdD+FwZ1mVk9+n9xqbXcULAxc6rH8rVJ
	usZmwBdHZ+Ayp1325Ybxkwk9K/uy95n5j8oxgJH8vO5hdkwUhnrP9XpJX7+GjlQtCE3kTtSlDTu
	i+TOkkabttfBKNFGOQiG8OMJLW60ssn3Z9G8wobikIB3EHGu/E93cn+ZhaayWCUMY4UAWRO3CvR
	ix82APcckvFJembpt90UmBSHbmWlB4JLfzhibPqhZnBjSOLPGi/1cdqzqkCZyQkNOkLx53kV7zY
	gXjT6BWOHFcuB0nic9SPOTyU0WY4UTsPWiJQ==
X-Received: by 2002:a05:6a00:909b:b0:7ff:ce33:e6b0 with SMTP id d2e1a72fcca58-81b7d3584dcmr8600310b3a.10.1767949353043;
        Fri, 09 Jan 2026 01:02:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKauFosRUhftJAAnZIqR7HI0iWGjeOb7mTBwr//VM09K21Q9R/ybDsy4S6rU/Qg0jctDgUNQ==
X-Received: by 2002:a05:6a00:909b:b0:7ff:ce33:e6b0 with SMTP id d2e1a72fcca58-81b7d3584dcmr8600210b3a.10.1767949352262;
        Fri, 09 Jan 2026 01:02:32 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:02:31 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 00/10] Add RAS support for RISC-V architecture
Date: Fri,  9 Jan 2026 14:32:14 +0530
Message-ID: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: gvuf2N0TeqbdTdDuBygjnBfoYpsf-5ti
X-Proofpoint-ORIG-GUID: gvuf2N0TeqbdTdDuBygjnBfoYpsf-5ti
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960c42b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=h0uksLzaAAAA:8
 a=dw0t6H4-AAAA:8 a=j7arexpxAAAA:20 a=WC7QRpXXAAAA:20 a=F-tpdftpAAAA:20
 a=NM_uERPgrM2pg5U9BGAA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=MSi_79tMYmZZG2gvAgS0:22 a=wVJa4CU9-Z26yuRAZDil:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX5wF4oyyL1GK4
 WTnKbzquNe5oeW6GmBAjgFOEe/x8RxD7Ci/SBtgDy5FYtB5BJ2yHSP6PBwcR9SoDvEb+J33oy5Q
 /EXD1QnAmcAtqO/cyv5rtt5c553Rb+ZJW8P2+1b5CGUc/h5rJVmoq9KZBJnm73kszAtcIQLK1sC
 zki56sxkDxt3aNrSS+3Jm0twqhZe2zXUl+bQLkzTEhOtOr8lYOEWDQLwt7MPxHxA9BooifT4oGN
 sWyxjR+zS7iyzHVSXujUnNYxk1pILzAQXelNa6zcL2khOVZhQBAL4KpYai28E/Mcgg51XuIJ50p
 zYAl85BVOfjkzycL+mycPPLGz91eMRl+mbJ5PiIcnskK3NlBUXMxiqt0/DM6nYHwhVoty9ZPK4y
 VXxyuk/1jFd/QuIiYG7yCloqityN/1OMvusaiGUMGVv3GeaSY+pJ9T0aYVqiHD0wx7KZEYnkFFE
 ZSrY6Qh4iSVFVYxvnUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010237_082078_6396E3CB 
X-CRM114-Status: GOOD (  16.66  )
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
 arch/riscv/include/asm/acpi.h          |  20 ++++
 arch/riscv/include/asm/fixmap.h        |   8 ++
 arch/riscv/include/asm/io.h            |   3 +
 drivers/acpi/apei/Kconfig              |   5 +
 drivers/acpi/apei/ghes.c               | 102 +++++++++++++++--
 drivers/firmware/efi/cper.c            |   3 +
 drivers/firmware/riscv/riscv_sbi_sse.c | 146 +++++++++++++++++++++++++
 include/acpi/actbl1.h                  |   3 +-
 include/linux/riscv_sbi_sse.h          |  16 +++
 11 files changed, 298 insertions(+), 12 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
