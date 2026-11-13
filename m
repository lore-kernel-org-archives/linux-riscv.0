Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF9E606A337
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v4HvreyV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MeUQaFZV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MPzGx+Pv;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcTRI8ws
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hHl+Y24el7TNroest7VgND8zk6I5oO9MVHNkIJ5TIQ8=; b=v4HvreyVtpm6mGIbMyZuc0LQDx
	k2djGmTHMFp3g80xBl5PBGbJ0jv/Rb7wD6Bj0VKVXt06OPO8NxF2ql+zGK3RPvlgQQ2boW5H1UEwp
	GZE3xINvLmV2E/vJc7UimUcmBABwe4L2QL765Wn9m6XAtA/Knwl0AUCHApo43k+q6bfENvqoqsY6F
	rMWkhD46UxL34po6ap/5en/Jt9E6dqOsEBpx0PsarA7NbuZq0ncz94AS+WIin4ojXG/f81mBfhffx
	Er38Fcd/Z3Fe5udBQF6ojtbVpGk0kwMjT6neg/vyIqXg0y97/qOx5m8hvh9rPSkEUw4gvNhBOFkaG
	Q6I1vvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFx-0000000Chgd-3OsI;
	Fri, 13 Nov 2026 12:19:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFv-0000000ChdL-1Y7Q
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=82wzG/D5SymZBCo1RImBwEu2ls9+RkCv88hNwE8Odws=; b=MeUQaFZVwh5dHWPSFEPsWIvuXJ
	O4VdYUDMq3GER/GrBeFLBXSXzqvTPTeWcTjQbsexg83fl/bV7DMMj7p2KP6sALTKIGBrP/XznoKRk
	UW7KgDOsMmAmZ29GsbLlcj7i62cyw50YXJbtev1js5tYN+KqIkSWKZGKA8wgCiUl8cSpE2kwfQWFY
	+++nTIgb0N+RVYFVO24mrz5TwzdBilscOYl1f4jmtvPc7/QT37O9GTcmKGtN0imjnSj6mHnA09WiR
	cGb5RBxrX6Icfi4tMWLh77ndgJDIi9ZzFkRz+H/thrBEtPZCVv6Vc2qIVxmm1TxLj5tE4OVO0Dy7w
	9msAmkgQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFq-0000000BEQQ-3AtR
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJbks058813
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 12:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=82wzG/D5SymZBCo1RImBwEu2ls9+RkCv88h
	NwE8Odws=; b=MPzGx+PvbxOsIKaSdQ9kHQV538VpKgdrabAoRMPkpVvsjRJv42K
	Z8qfLRTPV1xTXj7ncR7zUUgxpi2fit5h0CIdroV9T7PpPnGNd6G3szFgiLfUXFRl
	+R6gyh3Ue0ToAKCqlBbwH66tfnUrXOHJSw17Kc/2KVJnEJ9YiHEfP8Y9OLd/1IBR
	E0NEmkQG2PxiadG0QwlSBDzzDKDc/Mh5orAEVji6QUOzWh8Hb2mmRee7yZ/zkSbx
	eQW1qUD13c3cGXRmdODHp16E02KPep/7dirXbWa8+++6FzvA/G7ESwGTftFUpFGw
	4y18G9DeQNtYdvn6Qy+5OLbPssZEHG4POCg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgway1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 12:19:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so711323c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 04:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572367; x=1795177167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=82wzG/D5SymZBCo1RImBwEu2ls9+RkCv88hNwE8Odws=;
        b=DcTRI8wshKpaZ4gp2FkymbhL1ltL6PRrhKgPx5TQbrUWjKxNJzoIjGYgVqx8uu8XVH
         fsUUpVDujKFB7/RBWlOicA1xSQu7kl0aYFQihKrF+qntnVzBUbLsENImsLwETTFd1E4s
         zEWDQffAIL2jKPhxWGviKNlevFSFRe5kRvAW7x7NIYno9EsMb4fyuIaBCX2TGJXuBahP
         sm8p7nDi4I41FhNrswmV3HG2Ik4sSN74MXqqZJQKVqvt+D6UoEqSNZ8Zmss2RZiXS/Sd
         UNKB8ZtnQizU//R7XU2EUTNDJvJCVvDMNJTA8alOLyCzoLJaUwm0ltv/AJ0Chmx3qETV
         0H+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572367; x=1795177167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82wzG/D5SymZBCo1RImBwEu2ls9+RkCv88hNwE8Odws=;
        b=GABfgacqVIXNPuuQTarycsSkwZCoRfyD2ExF0LCyo9obqNpvKV3I1sUIuEP8owSANZ
         rGhAm5Jz3I10M17xyxd2DCClDJA97HEVXtx6xyXWpu+fn51dOAhz2VxwRTDRTS2rpAej
         xpr+OpgGFyjoGTMBPWkzukWAbsP1mJmhfunk6pru7+egKuf9KznsBoBL9gpIf0dBs1QJ
         q+xmbcdm45PO3rjWyKVX7O6GF8pdxHlheYCKBgw5lesPlvpUsygrpAtJJS/D9DSPdLU4
         MwNZk6AEmpSSW8kDMKnj8aXZCV2p/gR6N4s/Wgso81ucb0u2dmv1vij4tOaYH8b/RIHu
         OqGw==
X-Gm-Message-State: APuU4Z8OX3fanZ3Ysx/HOwRZKoUR17rHpAmnpBxsd1hcJufEhtEmpONO
	JZuN/ey7cK2RzH7dqibjIAA6uePOMmLSwbkTi8Al5stO3IljwxvRfAjzac3oMtvmTnR2DrMXuTl
	+ExUFyK1sk3Sw7X3ntF+JedOOXQxmPfzBfY8x0VV5X5ff3X5qj8yIqzSu5mJnQMTJNJzFuqQ=
X-Gm-Gg: AYBFou1hBG1WjbH1FV8Ys5oKOSw7z2Nt4c5ycSibbTnLBsgjw46mOmColTim1SJLHV1
	x1V/EUvXK0Ekt4YCv4Y5PZzS55Ty9n0cZfx0DKKkxOye3WUyvbtWBX8zV5L2sdosUzHSj/DmXNK
	jKEiIJdAu9+N9/r+cfW3JMDRZvzqnocPWSCwQGbXOe56Hx7TmRoD+gu6rsyybf0bd5T7vHHIUOK
	B/hpyEsbVkBUMEggPFGN/gVUT28D3ZN6o9tPG+fpLAzqwpqFXo7s5kEdsO/6XHGbgaenHbd7REO
	m9e+j704c/adUMqKk0IUMOcgbxBFKIXI0Jn9EN2SExBzHLqpn90doIOki5CkdBhGf55qRCHh8KX
	xm4desG69HkBXV2mE4lAcnSe8tsVgEFX862fi1FiWwrowMeDLV94ObRVgzGF/Pc2SjtwJoqKoJK
	VSCYGh4BKoNspGA6ItZnNSTfW3pIH05zcG1o/eKyu6GSndbrCiAlj5OcRYe/kN
X-Received: by 2002:a05:7022:290:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-1b503068235mr2010279c88.1.1794572366949;
        Fri, 13 Nov 2026 04:19:26 -0800 (PST)
X-Received: by 2002:a05:7022:290:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-1b503068235mr2010241c88.1.1794572366102;
        Fri, 13 Nov 2026 04:19:26 -0800 (PST)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm6423629c88.7.2026.11.13.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:19:25 -0800 (PST)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net,
        radim.krcmar@oss.qualcomm.com, anup@brainfault.org
Cc: linux-riscv@lists.infradead.org, linux-watchdog@vger.kernel.org,
        prajwal.n.oss@gmail.com, Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH v2 0/2] Add RISC-V SBI watchdog driver
Date: Fri, 13 Nov 2026 17:48:55 +0530
Message-ID: <20261113121857.1640918-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af7005a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=0SxRSwYGAAAA:8 a=fWIFD776mP1l5RU5hFMA:9
 a=vr4QvYf-bLy2KjpDp97w:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=evtWB9OUeeBtXImRToD_:22
X-Proofpoint-ORIG-GUID: B9mpqCd4Eq3dNtJ2x5R_XZIMa9o_fdCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX5C7b4XzIhb0q
 hHqmmCMnH0YtgbKTqyVyW0kq0V8/XLwD/9Rhrf3N7OdtlghlOvU4TWGJhn6NXl/AAWRx4T/ju45
 yBS0VD/wwtTVr2QZCLaLWwCv34LjCJrd5MPrZr/9WF0z12AQAV/dTa+Y7IQLuEl804cZHvBKMAw
 yjkGWBehYPsMozomidOuxinj0ZIL+AW8S2jA1kEHRt35HynlrzB7cpMjtVNmx2O8z7LVqXOpDAr
 d0tFjng1HcHtc918etgU2hCtOWIDg6o4AM04mtuy7Ys0FOkibe6G7QF8L5zEEEMD8csZ7z93Kz/
 OmXykYPgr3agFpbzbcNr80qGk2P7KcS5HsqQfzXWSchJcjOqaqms2nwT2wScIAVCmHbf79qN6Z3
 fEhmsz5qP5EbUCsk4WIUYwBjGobtKw8EdNfRDO6W/cyxVUZm8L9yCuFntlOQ+xyPPHsWq8AA6ZX
 m/28H/i2Des/IK7zkfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX4xx2tE0Dgqpo
 hCuvbOHMx+NRGQSsPaGOBDh0OW4odUUs9YExLORuPGHwem9MknEly29r0NgI3zpM8uE6+j0rDnZ
 iuNGda7QlHeas9FXr5ugrecRRtzW9Po=
X-Proofpoint-GUID: B9mpqCd4Eq3dNtJ2x5R_XZIMa9o_fdCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121942_890035_84F0AF69 
X-CRM114-Status: GOOD (  19.72  )
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
  include: sbi_ecall_interface: Add defines for the RISC-V SBI watchdog
    extension
  drivers/watchdog: Add RISC-V SBI watchdog driver

 arch/riscv/include/asm/sbi.h     |  26 ++
 drivers/watchdog/Kconfig         |   9 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/riscv_sbi_wdt.c | 435 +++++++++++++++++++++++++++++++
 4 files changed, 471 insertions(+)
 create mode 100644 drivers/watchdog/riscv_sbi_wdt.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
