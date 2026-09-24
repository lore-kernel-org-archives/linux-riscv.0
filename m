Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E04FC98314
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 07:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TSZKUe0UqkO5O6UjK5KuzK/d/grh2eMqNDObxRdVupI=; b=Ln8G685UxEQAFt
	hdBwwg5JG3dSmMyizQLO6UHvJWMhHjj5s3pTWr7HcnHfd9ScDQERcAyslt9YrJIMVfIPAmQAWKn3S
	2ZqOzTFHXnyFlzYMWb8wj0cmFyN9BuzME3neLuSGghZYUhqt7Y2cRBLzw4eYB+iGYvhcZmfbFWO9J
	I9KX+2ALTF1kyRkCBfsKWIhdJRfKOhyafdwu3SlqYaqv5ByPATPxu8k9z9Vn5g8E3sohcR6Zoyxhy
	0R56YcXFXUVt8uDbxj3vIm7PNyqW5NefJTm08CIgT8Nc8Eb725/KZMyBJDcYyFaOKJyoP9+VyHze7
	K9O6ZdNSvOyOh5Tq4zOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1L-0000000AJBZ-2SPC;
	Thu, 24 Sep 2026 07:37:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1J-0000000AJB2-255k
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 07:37:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eAt62277186
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1w+JvUxZEw++QK9Ap9uSoi
	au1BeWaNj5tUGjJMjv4GE=; b=LNqk74+4dX6OYzqukgQbkxoGDF9EAogd+Vog7G
	Oy8WOvhHAhroaNh2WSzDheNIlFVtHlT9G/L70F79XJ7gY1TLe7MPSzmExEolF2Bj
	dl64xnNyM2H/N1hgDNY1lWPvmZfhH0ez72qIxYNnbjvmgYQhoOAHYpPUN9Gp4LqI
	r3kS7BYhp9zSYry8RQ0PoW3v5IvHBYEt97rEbWfxNvge+F2FbyGwvn5LqVCTOn5u
	K6kUroWsXpUsgQ6bmom8jy5NDznWPLVKNr2HpZ4eglKIoZe01CVYIdTFWEABWFs9
	fM3SYGS7LLuMcN2ZC5yACZ7qa/op0CZeC4zMhG2jkmUuGFBQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxuwwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3002799eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 00:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235448; x=1790840248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1w+JvUxZEw++QK9Ap9uSoiau1BeWaNj5tUGjJMjv4GE=;
        b=dmgyD4kiJInH14A3GMzvhH3ZIx/VR5tVlPoGFt81gEpJ/EhDxoOIyhw8nh6Faxbx0+
         YpU/rCOLqQCYyto0/m/kuV/hxHlaMhGwRs2SK4rLtYLS32g9ZnLobFfOv6QsM0wBy0xH
         zn+klKTV4gGqWSWfKVi5wJD4EvM+cir07IadDytoz2E7nZ3G+LZNkvOkWnbBaP9aDr5E
         6hh/W9vzGRcIGol7NCxWzE9ZhSCKoicrfozUQM+JL2VEwz93kooFznZ2t7+rBG27BIJb
         HYszXZ8t6O7WS3NoREwAnGvV8kAwhjoYfr9mQ6y0H8BcbCBnJWiNvh/PcDxZLeQszNUp
         fu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235448; x=1790840248;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1w+JvUxZEw++QK9Ap9uSoiau1BeWaNj5tUGjJMjv4GE=;
        b=ouAIeRjrsHDKVgIB1IGs3J9bibnnUNGA89Gxi0lOH0uxWmeiP3MnmwAv6kdEWNe2CW
         yxpiG9WHRfF+KcOu9GPuSJThF4kwQ2Ngd3KRX9TKUGTHMn/bnRJ5paWrdUrdP2PTYIfT
         kYmXMobzWGk8H1ZbrWWo562yjwPNbw0nTFxr2HTI5T0qFNyxNxWDpQrahj4QNv9WXKB8
         lFZ7NgFl6Zcdln7mY0AsWh3S9A3gmP9F3gtV3A30nI3xqMotuywDyNExRmA5XdHLq3FL
         s7Xfz3G0CUxADx1s4vgOq4MpdX2h2jsXjIDEyh/8Zl87FCqDEO50CccNhTKaBDJdtp9L
         4VpQ==
X-Gm-Message-State: AFuF++luWiR7KcRq9kr5d6ubR9nbSQLy5Z+Ip4n9ZrAyxVKmEO6CzLuz
	1yDgO3nfIMAyZaEBbVeX6YRN7cjjH9CCfQNzSpwzi6iodZToIWLnZVjl25LXIvKwsa1MhUB1FBG
	zdzjjZ9Y+e73NSXdKN5f5WsWDCzDU0QjTBZIhYuSROwLM6r4nnZchuJkRgbSPt9LwW0mvkUvgkC
	KgMLY=
X-Gm-Gg: AYBFou1+KXq2jpKBWfrjg/5eWYuk2jzqviMLxE9d6ifO4vCEfq6lJHegbZC5LmL49nw
	PSJFCGDLCZuu6dhVQf4Cu4XNzpbRbX3KyoZTOkYLYnRzIRNxEwFT/nLP1708ld4K2thfvxG/Wrl
	nhNOsawMUoDYRF+eGJzvQk42QFTfAd2XzjWvVDcNMCbrJ1TqrBA3JsAmros5GojlbkWOJrg3s4x
	hWJvSZoNWm+Jx/3ZF1VlZHpM7+0AzhYRTAXXOxfMnSZLcEt6z34S+gjaYwclH7SQd8w4BQMe/6q
	+OETevFO+qYMq35es4YQSUMWWHvKkVA5XMq7RFNsVWyZSKeMFdqc9Yn5Sb2YfjBPQGGirGWS+1q
	N+2UQkp/yydXJjm2HlHFj+DuFLU1KKqTG6arkuosZFkLsyQVSsFsLuVeM/stxcpoNmobq8w2GS3
	+5sMvMlLNi+qC9dlcVoKbkB+t5
X-Received: by 2002:a05:693c:8087:b0:33b:f062:a674 with SMTP id 5a478bee46e88-34000643243mr1469589eec.21.1790235447231;
        Thu, 24 Sep 2026 00:37:27 -0700 (PDT)
X-Received: by 2002:a05:693c:8087:b0:33b:f062:a674 with SMTP id 5a478bee46e88-34000643243mr1469548eec.21.1790235446486;
        Thu, 24 Sep 2026 00:37:26 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:37:26 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 0/9] Add RAS support for RISC-V architecture
Date: Thu, 24 Sep 2026 13:07:05 +0530
Message-ID: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: CvEx2BVnDiVHpKgbSsowdVy_rm43VcGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXwAie+9UcQs+y
 nds+Hz3fL05zi5YWAzIT7rsNrgzfkVrL6y/Q1jXtwo0yhie0y1oChbs9u7nRORseikrLkMGBPqr
 NGJDA7ycI/iWH4+d6BUqBJ6H7ujMGju5OJMG/8mxkPeKQUQzXQ4YULhoeFa7oD+5uoiQIrliVHM
 EVgJ33dv+6CaCeuvxIYD9RBbaPAoP9Du01vKMBV4QtJKn7pB9at2Jqk6Y57sFU9sKQtbUe6UMd/
 b0QGR38ZnYBPGIAmz6q0muTOn9fvnoQuNznGrYLscd8Wa6CMxQhkbGBL03isLdcMT3ul212mlXb
 khdbF5OenyorIAx445oTqJ/8OaOog67YTZEL9F7aO/OeGk2qlW5ypvOgiOJ6dhD/a1KZA2KtrJV
 /Jj+dJvn1uQUWWX0lUYm0rZCcejt9cfYvbWeeV6F6BpgTbs3YG6S3EOzXkfaMxEbiR3bcLGEIVe
 L431e4p/tss9viuXeXw==
X-Proofpoint-GUID: CvEx2BVnDiVHpKgbSsowdVy_rm43VcGw
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4d338 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=VwQbUJbxAAAA:8 a=h0uksLzaAAAA:8
 a=968KyxNXAAAA:8 a=dw0t6H4-AAAA:8 a=j7arexpxAAAA:20 a=WC7QRpXXAAAA:20
 a=F-tpdftpAAAA:20 a=5RlsHsUcgChCSPQ6cREA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=MSi_79tMYmZZG2gvAgS0:22 a=wVJa4CU9-Z26yuRAZDil:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX4WsPnIehfvqc
 4j+rxOGhubmZm4ZsDX6XBkNGtDJAM20hTKOmCyVDmn8s9Ek7Wu8naxbv330+7Zm0/FYSB3pCzYS
 xwTo1dq4zkDm85LhN6aofpBdmidunto=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_003729_548296_F5B555BD 
X-CRM114-Status: GOOD (  20.22  )
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
The SSE implementation has already been merged in OpenSBI. Clement/Zhanpeng Zhang
have sent a patch series for its implemenation in Linux kernel.[6]

The GHES driver framework is used as is with the following changes for RISC-V:
	1. Register each ghes entry with SSE layer. Ghes notification vector is SSE event.
	2. Add RISC-V specific entries for processor type and ISA string
	3. Add fixmap indices GHES SSE Low and High Priority to help map and read from
	   physical addresses present in GHES entry.
	4. Other changes to build/configure the RAS support

Changes in v5:
 - Rebased to 7.3-rc3
 - Based on SSE v10 Patch series
 - Notificate type patch is generated from acpica gen-patch.sh script since the review request in v4 is now merged.
 - Since 7bfd21e828504, takes care of conditionally compiling ghes_in_nmi_spool_from_list, 5th patch in v4 is dropped.
 - Moved from kzalloc to kzalloc_obj for sse event allocation

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
[6] [SSE Kernel Patches (v10)    ]: https://lore.kernel.org/all/cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com/
[7] [ACPI ECR for HEST changes   ]: https://mantis.uefi.org/mantis/view.php?id=2522
[8] [RISC-V CPER Table ECR       ]: https://mantis.uefi.org/mantis/view.php?id=2551
[9] [RISC-V CPER Proposed Changes]:
	[PART 1] https://docs.google.com/document/d/1-Dd-T_QIUqjq3muyjfK8IUeXWr9QWkFAkFyzweXQL30/edit?tab=t.0
	[PART 2] https://docs.google.com/document/d/13y8kQqbVtCAPCMI4oJ80MtcUS5FL4xuO914NmfCi5vI/edit?tab=t.0
[10] [RISC-V APEI Proposed Changes]: https://docs.google.com/document/d/18rxA6JTyFTelEj0aiKdSFzxPgwyHyThj8EP8lXqWZdY/edit?tab=t.0

Himanshu Chauhan (9):
  riscv: Define ioremap_cache for RISC-V
  riscv: Define arch_apei_get_mem_attribute for RISC-V
  Introduce a new HEST notification type for RISC-V SSE events.
  riscv: Add fixmap indices for GHES IRQ and SSE contexts
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
 drivers/acpi/apei/ghes.c               |  99 +++++++++++++++--
 drivers/firmware/efi/cper.c            |   3 +
 drivers/firmware/riscv/riscv_sbi_sse.c | 146 +++++++++++++++++++++++++
 include/acpi/actbl1.h                  |   3 +-
 include/linux/riscv_sbi_sse.h          |  16 +++
 12 files changed, 303 insertions(+), 12 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
