Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09AF606A690
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uB8a3Mdp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gWbbW+qY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGW+HHc5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yeq+GdlP6bbMxFMKzJw+8bu1v8PqFApbv8E7vfNkLdg=; b=uB8a3Mdp5AP5wT5HzAQM7atzGt
	EaYIyhE3Jg/+N/YqzlAjMNphEbi0gxxe/GvTa2LThxnXqL61bCB/Ug6n4dyKWKrGtqlFNmIVtHeKm
	M3W30r5wY9mn2P3Ig1H6mV6y3D1n+JeDNhO1Rrv7lXAwVez/xF6O0161LbZZuFw03io5IJBLoOFd5
	GIFyavh8kAiU0FdEuDk6FgQKsQLyEC0hY1VIkjpcwD1lcKIzEUD3/LSZoJaqZlOht4gYCzs/9KOYO
	MTosHGkclXkki3gHC9NZiowzlNdkgHP1qJp/d7W8wyHhd1/pcTBTCI19uEoxZjlbnieef9slSoO3p
	3GRO3JFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqNL-00000006b6z-1V75;
	Tue, 24 Nov 2026 13:15:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqNI-00000006b3j-1GpL
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 13:15:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AODB3t81408748
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 13:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aTRk+Uvw0wreLlKsRjV0k0mB5AUMhP6r/N4
	IGgQBVfg=; b=gWbbW+qYJJqZVeNsj/m3LH6JEVcJ/y41McoLfO76BjlOQqEIAej
	63688POeQ8aUyBDlVFugL+eg8KlsxZNjhcDAw/a497Lzb8Nok7+DOskrxH44cF25
	CxE65EdxMxHQ+26Uo0le700W/BEjrztik5DpmPeUBC5htVBBiz+KDh7daXHztAYQ
	Y7Zx73es8NwbWuw6JSJUvfJcErYkC8uGPeInZZNL7gLq3qlSlosN+fbryA3xB9xN
	MzceXMaNlFxWAGHVlms02aESHmapQrLZTmQEcJpwxTGKb9mtC/u44ME6u9oz0OrT
	OqPIeLBjWMetAKSZSIY9EUnaNcHTxpsNjNw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b8000r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 13:15:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so5000796eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 05:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795526152; x=1796130952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTRk+Uvw0wreLlKsRjV0k0mB5AUMhP6r/N4IGgQBVfg=;
        b=AGW+HHc5A+3KXBLPH0ajSsPaiR6S9LvWhHNEuNcjy67Qx9lRsGYixoJModUhlMiqrN
         mEuRE+ZVzsSA4z6VMaABNuRW1DzmUtLMOfiOuPonyCB5xU0pzARjFx+39B3bdaqLVw1r
         y+hATUc8MEwaIz1EDsAEN+13A2NwWHSNK+73vX1wRWrpXYKw5BZtix5kXBzNzHN+ey5a
         t2OTfbYt60MQ3+IY7bWHo3uhGh9oY8Ii3ipZ+Si0Dmktm0AjSFo4aDOx+NMgpVhzLpYs
         4jOPEnVKc6v1lFCxFF8mnP8DyPwy5rVWAEcSAYzvv/iRjZIhNDf9PUrZJd0Rfy1Y+5zg
         u5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526152; x=1796130952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTRk+Uvw0wreLlKsRjV0k0mB5AUMhP6r/N4IGgQBVfg=;
        b=2jEF/fYeoRoutnArs1LcDhLbaJVvNI30vn+ojCfDaXC5/Xi6Bk3+y4P9ltaOtdZ/7w
         0XZTUqO2NTnBo7wqmCBfRCK13ACtGF7+PimD3vKmGctx1iqmfKi2veHjUsanOo295Gy1
         4T5V6jWLOzY/MtKdz4xK+PvukZMZbCrm80RiXM1NM+ekBymIcKOffxzo0UG4T9H/k10T
         vSv9BcRUGSrNOGEG4gnwWdrwFFO4RueMkZtLGKATwLd282x4O099iC+sy8i16kaE+FMd
         HoNoJBbWeOIQVs2mt3NjL4qoD0VtieBd708xjXkZiv6v05gL5WMm+S+HxDVUJgh5VcYr
         D1Og==
X-Gm-Message-State: APuU4Z/0L44FkqKhEyumjXuZ2xKJHdleTWPF1Ups7h0hTFiQGGlrz+p3
	/l0sDvb9DV3ddMX6JhRJDbkwKWzJSj3zwrh4XEeNY2alf5jtNfNCcM+zYpYr36wN2WJLxTuryq1
	hG+rG+Vseb4pMVtN1gWhM88e4nlwwK0GbS5BQ43ZE73NHe6prvnMBaGpdDoSwIntEoBj69qH62D
	/zh/M=
X-Gm-Gg: AZFdTZc9aBwrGpG3CEu7CkzNDKIlNpzykFzJ/MLCK0oVOAysWIjaYPRJAQrwlc1rTQF
	8dyN4MmuBLNYwWMWRGW7bDYXcnFzNL3kzssTknoMu281FAHMEgabc/Yfia8J8//1kTRzZUMvL/K
	p5OxENexYSUSoyX6MqhX5KQ8bGvs2wsd8peKCSM1JVeJZGkQgVMKssVvwntFg65FBj/MHz7UyiE
	WCuKNBO1QvYIcMvNvPa92GzjpFNLHRZtQ70dmQfjOjnQPV8HH67Z9E1Y6/fgB0RwFUgK2ZE1rxw
	Ay59gBW17bys1M0SGzc6BdIHT4HtnMt5B3M1HAEk6U8CZXxsWGm9YhRu79yv3dC/Dw/MbbPRhJp
	bS+LI5higB4t+R4q0v3fP/RyAYzDkbJdVTKgg5zJwSwj+lePuzfYdUphoMy0xYaR+vZgsCeFMBE
	pOVRE5fv3RJbODFWVE/SgF6nrappEhgkYoA2uBu8QcBARXbXA9uoxzfQXmRBsWDg==
X-Received: by 2002:a05:693c:25cc:b0:369:f17d:efb with SMTP id 5a478bee46e88-384b3e77699mr23266443eec.10.1795526151970;
        Tue, 24 Nov 2026 05:15:51 -0800 (PST)
X-Received: by 2002:a05:693c:25cc:b0:369:f17d:efb with SMTP id 5a478bee46e88-384b3e77699mr23266408eec.10.1795526151105;
        Tue, 24 Nov 2026 05:15:51 -0800 (PST)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm56371320eec.4.2026.11.24.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:15:50 -0800 (PST)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net,
        radim.krcmar@oss.qualcomm.com, anup@brainfault.org,
        anup.patel@oss.qualcomm.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH v4 0/2] Add RISC-V SBI watchdog driver
Date: Tue, 24 Nov 2026 18:45:40 +0530
Message-ID: <20261124131542.613271-1-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfX/GKjzVQZECHn
 3lCCcHkr9Yxc2T7uA39Me4ncXgMMbXGm4kQuHvrXmDSh0W7XFjKu9fyKLdEq+PoXa4rQnwAr0Mz
 7egka6sFuKhoYj8mAz9kKUXiEDQGosctKOlUIsbm1Y0/k6BXb964Urfz+M2qjRMWurH20cCWp0U
 cAUYIhIu6tocETUxLi0WwzGuRI4+ZRBji2nRNW6qVXZUNSVgCr7vxwEQBAp2SMJiooriC+VQ0lm
 nL+yGZnEnCTUmalpc0YXYMLQU3w/mang1ix4J/w0Inb+sIkgUs5Ll0r4hEe96e5FBU63QLyOXCR
 nBctNvd6S8/Db3mn9ZlxDHvSWxZ6Ge+uuBlW+rtcWsi9lL45MzuHy3qfYAY7rLLzmhtURLg3RxV
 pdYV2VNhzNMOdG84NxIlZ3lqUrCW0AR62iNYLfGQezsMFz+0hxQMnII/rvyZ8f7awOEbejrh0Jb
 OyMVRBXrMvWYI0vIZDg==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b058e09 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=0SxRSwYGAAAA:8 a=bDjJS1w-zusUvRiTzisA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=evtWB9OUeeBtXImRToD_:22
X-Proofpoint-ORIG-GUID: KKKvL29tnFt0_75oERyOKnqhOOlgcJ6K
X-Proofpoint-GUID: KKKvL29tnFt0_75oERyOKnqhOOlgcJ6K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfX1myMebM0YuIs
 4mBXqigZyDhSCoxvirxLnI2qpCItcAYM5bNjRNaM4T5duTf9qpz8z5ttmDoU637sv9r1m05EUvX
 tzwP3w4TV8OHratvy0cfY3B5OiOA4Z4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_051556_493858_9581FB09 
X-CRM114-Status: GOOD (  21.02  )
X-Spam-Score: -2.8 (--)
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

Changes in v4:
- Address review comment in the commit message
- Improve the comments in code to address Sashiko reviews

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
 drivers/watchdog/riscv_sbi_wdt.c | 442 +++++++++++++++++++++++++++++++
 4 files changed, 479 insertions(+)
 create mode 100644 drivers/watchdog/riscv_sbi_wdt.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
