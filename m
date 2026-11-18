Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B57606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 09:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z4vsHhlo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZzA1AV2F;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WGprEa96;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g/1k8PZC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uOCGaaUQwzQ8HBgwbm32kDfyhmJN45MkviFf/CdO7mQ=; b=Z4vsHhloWjYueaZBlM7xubZs7Z
	C1/4DI40/Xq+x2xRwzQvtqkLcDplHcnLLPeVzbxkQXqzVxoNBAcTvWogKGO4I87JY6lixCX6YcG2E
	HPgnhsjTdFkhMyBwcnIh/Kp10eXCAv5AsmGmf7CNSTSTVHaxktkoEjydCQgW2VbsFVoeQkpjlNdYN
	jCj6/aW4+UtYeFpnbwUtxk0W4xsu64yxe1/KG2EosuflT1FIqZ5nEFS47Mr4EzfOgodibvEkz8Dxb
	WFQkMGGjpgXtCL0Cu8FECRWb0Agd2GvX616SVxSb0XS9v0jskHVoJkAj7wksH9aSqd9TO2o3+Ww37
	SaSl+lzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbru-00000008Kqc-1pxH;
	Wed, 18 Nov 2026 09:22:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbrs-00000008Kph-3L65
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Nov 2026 09:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=S2YwWZohB1T2+RVJYVuwbz8OZ2OfSbztv8WJJdDcvb0=; b=ZzA1AV2F9bWvCj+m271osk1Jnq
	a2ehUspT8Jd/ok8fwQWq052lnyEbj5PuOjxhexy9tlDOMSl3pKOqyNM4gRf6LEi9WMoNARs4j46Sy
	tJ00iTL3d4M/Jl54JkKzbALmzkCYwWPM7QXyYHcqjsxrjHpnqDuu3zC58f1KCYR3KLf+EEa9iquqV
	qilOnubgVGE/1eaiiXkSzmKMMMmDSUoHT/qWp98rGp4yxnF73Q0zV/l9P6ngfNkmRTAYL4f2ua6nl
	akg+JwzeEkwUdwWZywD0bctQ887Vk/CyeTOXVgXWt+rLKZPkPldubioVRLdzk4odMU61NQVAZIj1p
	/cKIl4zg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbrn-0000000Fr4X-3NHc
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 09:22:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8f9nH2106647
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 09:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S2YwWZohB1T2+RVJYVuwbz8OZ2OfSbztv8W
	JJdDcvb0=; b=WGprEa96jBLNb1rscLfBKBj7tCgSU+7aZ/I7RV/IKwR8zhSEF97
	r6qLG6S/9FLhFH5vRPkMZKEOPp79dGe2ItzbHQgM7l8pjbllJOBA4ZsPaI+/Irlr
	DE5RCR8zz69H6Fl0Aj6nRD55OwKRATD+sgGvzfHo+l3iQYvg/sxTzpcFSZy5YtoB
	mr9w2nfIu9RaRurZF46H6b0Oo9kN+R1bn08bfnba1lUDZyfc+Pjwz9AViS29aqQE
	EYsNpm+3Y+ImszL575q5XcaBL83pcy7WH0FSd1OU8Kc1G0Vj/KzlS02Eo5zgKBRW
	O7cWyaNJV8KN+xICo/KFOYZMkOQ5WNz+CYw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8t873-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 09:21:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso3082850eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 01:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794993717; x=1795598517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S2YwWZohB1T2+RVJYVuwbz8OZ2OfSbztv8WJJdDcvb0=;
        b=g/1k8PZCAQJ5Kxnzgx2+u4k2Dq1bzms2V6xKHu/YyZjMf0yNXRfX41VJJGy/YpsGfT
         xsEsXFJYVsib3BZeYCfR7/XAs43Vzi4+WUR9/nUsSg8+wMr1/sdi2bIpkbZct9qcmxvD
         N4hdOYsgzV25z62GWVW+Ihow0X8tKsWeHS7WoPJUWqPCOsS/g38WToNZyj3nxFNxy7vf
         MNzFD7ODU2z45moXnuQaYbUSAeVDX3yOwQV93A7hF/v1n96F+nIkqFwDLHYBbRepsevt
         6hd7d2pxLGPgAvnKNiyR9xh2q7mpbXdZvhk4svOKSFytG04C6Ll9+IG++EFGg1HIJQLw
         rqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993717; x=1795598517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2YwWZohB1T2+RVJYVuwbz8OZ2OfSbztv8WJJdDcvb0=;
        b=TdJC3TLfa441Sr/tSHq4UXQ6Ad9VuZx2QquXPDQEkwnk099X3Eg0zlR0TPosH+F7tJ
         IZ23d1Kql73Tm+/rtryt3DAJGuMgVMSa46SYwSB71zv188moTMMoP5mY9TRnrSXUiJNp
         0F0Z7T2zp93jwZn3ulUF1NJzMhRvhMmJ+MHwqo3eOOg4b5DkfN2mixTDhi1C/pckUTUX
         TbHUJA1PExgaE6QuzM2WUZDOstnZ19FGztApC4JEwdGnP7KxUd5+3zkjm6g4UXi9es37
         /c5zdM4xgmNwJwOKsBOO4VlVOzhkPCl/umEQ2MD9jBqQqMR6x6drXPLxRZRFjr8+SJKC
         +nNg==
X-Gm-Message-State: APuU4Z+yyFXaqSYkEXNHuckPD3TV1kil2UOyYCTMNPm9AEJHN3p/AMDg
	0OwRLuYSspEnlx5EZh4eoRLPhS5BnHaJ2omjbjlWJp9fN/XVgu1YLnicS+7N3+s+Qgkj7RQRF+T
	g38kDobSMcYvCEV7VGpjHdg6SCRU5B8ALBO/gc4HTJ33r1jxhJATJQ9vvyIZmhSZjjwn/hJU=
X-Gm-Gg: AZFdTZcWDd/w5it5u3ovXtYhXOCeTS/QGKVC4lbHbUeEAj4YV1NZeNNOf+CnprOdTRj
	WVM/o1Pi2j66WeS3UIidHNm1pyxi+bOoUx6cKJByF/KI3bMc0ztDwlrbmRkB/OTWdLy+yB6tp44
	C4r1pqRtgxBZiAXPwMqeMt+pIl8kuq4vLyvo/pU2/C6UfQEbK4qhrRvl3E9z6CS/E/Zyrv9sbe/
	NuI89AM0N+X6JbJuLuiBTB2db5E2UgLYpPT2QjQmFIhXJlaqOdNoKFQauY/SPIRLP77H0hrq60s
	vAejrzpPJjHRvWxbOLGAQD9DkIKDqj32+BfgUHIq8Gm413ICpyfjtpEbF+Iy30B9njw9l+EHkuo
	VUBveosRlX0wTmqf4K3qg8LkyjZ+D+WtuN1WvV23sA1hPFrIK5oVlObeJ5iG18lf8oOIA5fDc0p
	RP2B1NFRRgepvFcdfmQxooXa9f6yoUzikEuoFVWnEYIdvK0oTwy87HCdpEs3JQwA==
X-Received: by 2002:a05:7301:dd95:b0:36c:3b8a:8089 with SMTP id 5a478bee46e88-38281427c58mr1852553eec.36.1794993716607;
        Wed, 18 Nov 2026 01:21:56 -0800 (PST)
X-Received: by 2002:a05:7301:dd95:b0:36c:3b8a:8089 with SMTP id 5a478bee46e88-38281427c58mr1852533eec.36.1794993716050;
        Wed, 18 Nov 2026 01:21:56 -0800 (PST)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm9194334eec.5.2026.11.18.01.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:21:55 -0800 (PST)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net,
        radim.krcmar@oss.qualcomm.com, anup@brainfault.org,
        anup.patel@oss.qualcomm.com
Cc: linux-riscv@lists.infradead.org, linux-watchdog@vger.kernel.org,
        prajwal.n.oss@gmail.com, Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH v3 0/2] Add RISC-V SBI watchdog driver
Date: Wed, 18 Nov 2026 14:51:45 +0530
Message-ID: <20261118092147.2017658-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: ptIknbKDK6wIgODOCuEtVKeKkDh_yTpF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNyBTYWx0ZWRfX7tzUSTUYAA5x
 dUYDQqYJlWM9LLO7zsmHmYdRfizjWaz9awuYHLT3azgo9mfsMzlzCWV6lXVRxojWtvsLO6LGgkJ
 lTl4YSMS2SU67mgaLH22ecqJGmqW0iI=
X-Proofpoint-GUID: ptIknbKDK6wIgODOCuEtVKeKkDh_yTpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNyBTYWx0ZWRfX1App3eD5UU59
 bQOapcvrzpOTIA6NS3nR0Q+eeiMe587BhfDOCdQfWVQEGyYE9ts6KH8Z9jdYdCO9x35nF6ncLM+
 dsBs9BeDmkyLiRdgfVmNk2Nkr7rUd5Nhs8ANIaAah8/K+rdJ6u/HluIZsW6UurmPzC4ZwPwqDTI
 +PQuwwVYsyXLJRYkQbywOycYMVINrBGL3aBUU+/Hq3Z9KatM3S8frlyFcrpjmI6P/5mx8PMtv7u
 Dpi2VgjF5JM3iLKwC9ZPHYc7fV3QqsAA6WaYsI6yLTnS5WYZ8OKtEoOxf+U2MYvxyn3DqVy+OI9
 bmotc8Nh3voNqch6y6tkUNVCphTD1soW3UstDhqS1bdJLXoj4E8D9Bf0HvhOYpbaQBjZqAO8zT2
 6UsjXBubVFHKrS4rtaMwek+JBs43UuBzO7gfDd3L87GyoY8mUj2Y5jtivZZQO8ckOOwvtFd+MO9
 K9gPlYo+bx3swYVk0/g==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd6e35 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=0SxRSwYGAAAA:8 a=bDjJS1w-zusUvRiTzisA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=evtWB9OUeeBtXImRToD_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_092213_161692_B7434BB3 
X-CRM114-Status: GOOD (  20.57  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Changes in v3:

- Address Sashiko review comments
- Select WATCHDOG_CORE in the RISCV_SBI_WATCHDOG config section
- Appropriately return from error conditions when using dev_err_probe()

Changes in v2:

- Address Sashiko review comments
- Fix silent overflow in sec_to_usec() by setting max_timeout to U32_MAX / USEC_PER_SEC
  in probe, preventing timeouts greater than 4294 seconds from wrapping around silently.
- Add pretimeout validation in sbiwdt_set_timeout() to return -EINVAL if the new timeout
  is less than or equal to the current pretimeout.
- Advertise WDIOF_PRETIMEOUT dynamically at runtime by assigning sbiwdt_pretimeout_info
  to wdd.info only after MSI detection succeeds, rather than statically in watchdog_info,
  since CONFIG_RISCV_IMSIC=y does not guarantee MSI availability at runtime.
- Fix MSI interrupt leak on probe failure by registering platform_device_msi_free_irqs_all()
  via devm_add_action_or_reset() immediately after platform_device_msi_init_and_alloc_irqs()
  succeeds. This ensures all subsequent probe failure paths are automatically covered without
  explicit goto labels.
- Add module_exit() routine.
- Replace dev_err() with dev_err_probe() in probe() error paths for cleaner error reporting.
- Link to v1:
  https://lore.kernel.org/linux-riscv/20261002163758.2919372-1-prajwal.n@oss.qualcomm.com/
- Sashiko review of v1
  https://sashiko.dev/#/patchset/20261002163758.2919372-1-prajwal.n%40oss.qualcomm.com

Changes in v1:
- Initial RFC submission

Prajwal N (2):
  RISC-V: Add defines for the RISC-V SBI watchdog extension
  drivers/watchdog: Add RISC-V SBI watchdog driver

 arch/riscv/include/asm/sbi.h     |  26 ++
 drivers/watchdog/Kconfig         |  10 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/riscv_sbi_wdt.c | 436 +++++++++++++++++++++++++++++++
 4 files changed, 473 insertions(+)
 create mode 100644 drivers/watchdog/riscv_sbi_wdt.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
