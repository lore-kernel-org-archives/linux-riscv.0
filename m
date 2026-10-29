Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B33A606A326
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sdcyfknC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CEM4DbK9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MV+skFcK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=L9sOBgSwnYYLg9aKqBNETBoEQjXXDFysMh8UT0fr0kU=; b=sdcyfknCZNNMeNC3XqsN9MdLn7
	qe0pUd1e53i2i24ZkDaquYdI26NXwHK//D/LjBnrsQc3N+ocIhFJe/UoINzWpyFSdPyNAagaOR8uq
	b4paBFgh2nQ/3MzPD9Q7sEF8O+k7A1RpHafFs1xA//ey9iztL0/T25Fl81lK+cks80YNCGgE5EUDA
	D21sGqgTdMPJuvgZaeM9Q7Da5sebrXEvXxyW1xehvy6P9i7ddKrfKi3i7er2Q4nQUB4LYzfWmmxh2
	AvWRlYOKrQ9w10BxBF+bXiN/VHE60vmjsLy9pkSNmR/MIihneusKzYwWuVW8VTztdEZ0HNF4MxjzN
	Vg6AwBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPsx-00000009HRx-1dyZ;
	Thu, 29 Oct 2026 13:09:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPsu-00000009HRR-2z5e
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 13:09:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdx3P3399579
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 13:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xsx1EyxW7xXXpcaoEG5SC4vqFuiaTgmu8xS
	mTw3rKUw=; b=CEM4DbK9ogNGZwmCwwV8zL903+EsrG0822kSe03YTJy2qBozhEs
	iqCQYBGLH6Y8TyNL/ZN243O8O2d8NV/M+LwbtXVjT0GLyXXnxKbtD1l4SPedNT35
	yzKm/WT+VBkxHp+ZVIJKgBOL3YDFnsnCwSgmrHXIlkcd2zWxA/bPU379f7rU4K2g
	+d28R5mub3NmlF6u/zMIqiWaIenLzFqjpHPpok4r6+82aY7As1qfd/zLfH0WPZzy
	pZv9V5K88liLU84IvtUG2VrPFJujq6j03omG4euIQFyn9Cd+XMkEFJfFKRZKbJYz
	iD6KD0mxhCkMM8AHuZJ2FEfvA1tY/yHYgnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2c1y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 13:09:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so1915744a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 06:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279374; x=1793884174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xsx1EyxW7xXXpcaoEG5SC4vqFuiaTgmu8xSmTw3rKUw=;
        b=MV+skFcK5gQ8F0fHN9h6hnl8cRrD1tXVd27wyqfFkjAxZ2XbLC50MOBSw2HpFqIo0W
         yBJoJuytPCe5Kf8/8yN1QPgM1Gd8CW9G7Bx9ipsAwER0qOLhUw4yICE/uxugXlSp5X4n
         rLOAN/fGycyuyAONVVy58usidK0FidPOqQD5oBb3amZLKoz1Qr0JZy+ktSMwJgdcDRAR
         A8/G2/JfHNIvYS6iXjSrkmnw5NS6mJgUVNyW/MCevvgXTgeMsOvCy+tGbB7EHSaf9ptO
         FYnDYkU7eMoU2Ip2QeuEdA05aboDijA3vMw3veUzmXgOzs2d8op1WUHYoR/dGQiHH4FQ
         Ir9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279374; x=1793884174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsx1EyxW7xXXpcaoEG5SC4vqFuiaTgmu8xSmTw3rKUw=;
        b=ywS44LXYmSXar66bYJPJd4YGw0yzn8MA6wx9vEirU0NIYZcHCLccJQ2YmWfPyZA3SI
         Lcpqd6LQXVdxApRrdTl6alrTo2KY1/m81gryZlu/R+kCkN6XnD1eu1ssl5drthOXQ2Zm
         SMeiTzUkgwv48knTa55Js/aOg1QwxY6v7GH6cQ92gb35PRXsBsYje0y3E4zScZZOWPi3
         MJ5Z1yHsrsIc9NTaY5CnqdIvl8yOYIfNFOln4twoeErrcWJbn4F0zVzpzeVGA6XnYhFV
         /Za9IwHnpOUPcncLSzemxEyMHrf56mJISy/tO6K3oTh/LTDPP3kRUj697nGU1gGJiRep
         2QoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZKMgjjjrmFStIpoMael5uRNbiDnk6syX193ZAMTW3tMzJwgEx9mJdE75/vfIMChWTG4epDPafeMHxgA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKDuwY0jA5q1qdT0FkIFL05gNT8A4l9X9e4XxhdGXpatkJgTop2
	qtDp/9uJfoMlMiesmWEh2Hwq0SLuyxPKR9AejnA1PUT9VPORwaQxPfigo1ysWABkodooJkCT+WR
	zDhZnk1yI03F4n4IZoeMPWHUGeSnYdm27I3M42RoxjBkcHPb5cr6UIE44CJW3z+/8Eh4sh5U=
X-Gm-Gg: AYBFou0M0u9JyKHX3Q83iCxVWIh9yZbeVS/9uAZdPLibPsIZQ+J7cPai1hLOv6Wd8ri
	5K56prrutSRyGBACfZH3YbkCPSN/KGk+5IGxo6/rkFX/z5uzljiypYcl1CNt7R7C6+J2ufFJeDn
	kVqMzzwhCrVrWh6XgO9K45l2j8J/El799WeJSDLBE/b1N6RIfVbydu9fqd34+2+wnt5NF1qtFYB
	45BzYjMP+p/dhLDflDwyfi7xHYFYVwqUs8iOJ88ZhHp04y9UDZCV89A4n65kL98PAHfu92A8XQ+
	6hyujN7xf+tSkUX0ZEqS18Q9NZRlO/U6p/vpC2bNDu+sl1bNZLHjZJ1rLTV6vej79dtfHpSuCaV
	+6blT95y14OWDRQzKiN7+8x/nzSNNFEAt0M0OpKsur+ac5fiMWpv3m2JScegy0nO/sYmnwSoGsm
	9vrJmZDOXsRBpxMw+xeL9TBEjJyM7ptOUTjlsCOcHOlhR8NKjFP5tI1n/IMYvK9v5nrXy/EwyYq
	Q==
X-Received: by 2002:a17:90b:1b0f:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ae580cb98emr4155967a91.21.1793279374196;
        Thu, 29 Oct 2026 06:09:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0f:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ae580cb98emr4155945a91.21.1793279373686;
        Thu, 29 Oct 2026 06:09:33 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:33 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 0/4] RISC-V Sspesa: Linux perf precise sample attribution
Date: Thu, 29 Oct 2026 18:39:09 +0530
Message-ID: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae3458f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=JfrnYn6hAAAA:8 a=Wy0b4BpvcoJVJ11Qc2AA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: fhegyrgEf3gwU4t7KT122Yx7c1bffC4D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX3A27KfybP3gW
 CFePd+gW7T0Lrs/PwtpmHwLkc1lDQwm++GgfLZD5Xm14wSHGc436csoR7H6wrjLMgdt/n13lc/K
 5RVQCVfiS+ogRmP4qZs3h6yLwTB8N18=
X-Proofpoint-GUID: fhegyrgEf3gwU4t7KT122Yx7c1bffC4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX1tHyigMM9dZp
 mP/50p0dIRC21tsr6G8D1ll1pAriKXi70K9EFAx1q/7u8C07OkDyloTMKVkcrsN7q29DJVz3aJR
 4YV/dLJFgApfFr+kBf689LU4vYpHa+9ihZORC7aY3ShcajcoOlhg6vpsbqdTOd74+1t8l/M3xLM
 o+KU0O0HLKAvFgS9AEH0NkvUtvv9vcuWx0IRFUqDX2kcLdF7zG93GSmQ6wz+ooaHZ7ytSWOR0WO
 KRjUl57LZgAm1B5KEiMJ1I5VMYUgc8kg1qwhKS/CQ8tvVVh/o2IPi3VVf8ddlLZY7ZbTL2Dik8j
 D/6anZm7byqxudlqPl/7jXxHLcvCY3Rmbe3I31HVyUbHQ0lnV7IKbxvBFtZoIn9uPTpwo7MVDn+
 88YYUAEDH7RL1EKXJTsPNCzpjhECnCScaFvOuhwA8+BMMob3RJje5eOLnFEVXAHv8EuXfFotg+q
 Fys459Vg2DI88dd7dnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_060936_781261_E4ADD6CE 
X-CRM114-Status: GOOD (  21.36  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This Linux series adds kernel support for the RISC-V Performance Event
Sampling extensions Sspesa (Precise Event Sample Attribution) and
Ssplcofi (Precise Local Counter Overflow Interrupt).

The first two patches add the DT binding and ISA-extension detection.
Sspesa depends on Sscofpmf, while Ssplcofi depends on Sspesa. The third
patch implements perf_arch_misc_flags callback for RISC-V. The last
patch uses Sspesa in the SBI PMU driver to build synthetic regs for the
perf framework and report exact-IP samples when Ssplcofi is available.

Note:

QEMU does not currently identify any event as supporting precise
attribution. The QEMU setup is intended to validate the end-to-end
Sspesa plumbing only. Similarly, the `pesa=1` raw-event format bit in
Linux is used to simulate an event that supports precise attribution.
Such events are expected to be defined in vendor/platform specific
JSON event files, but this series does not add such an event file
for the 'Virt' machine.

Reproducing the full setup:

Sspesa support requires Linux, QEMU and OpenSBI. The matching v2
branches are:

  Linux:   https://github.com/mdchitale/linux/tree/riscv_sspesa_rfc_v2
  QEMU:    https://github.com/mdchitale/qemu/tree/riscv_sspesa_rfc_v2

OpenSBI must be built with the following fix so that PMU overflow
interrupts work correctly:

  https://lists.infradead.org/pipermail/opensbi/2026-October/010957.html

Build Linux and QEMU from the branches above, and build OpenSBI with
this fix applied. By default QEMU doesn't define a raw event that can be
mapped to programmable counters and hence a special test DTB is required
which includes the raw-event-to-counter mapping.

Build the test DTB:
  - qemu-system-riscv64 -machine virt,dumpdtb=/tmp/virt-sspesa.dtb \
    -cpu rv64,sspesa=true,ssplcofi=true,ssccfg=true,sscofpmf=true
  - dtc -I dtb -O dts -o /tmp/virt-sspesa.dts /tmp/virt-sspesa.dtb
  - Edit `/tmp/virt-sspesa.dts` and add the following property to the
    `/pmu` node:
    riscv,raw-event-to-mhpmcounters = <0x0 0x2 0x0 0xffffffffffff 0x7fff8>;
  - dtc -I dts -O dtb -o /tmp/virt-sspesa-test.dtb /tmp/virt-sspesa.dts

Boot Linux with the test DTB:
  - qemu-system-riscv64 -nographic -machine virt \
    -cpu rv64,sspesa=true,ssplcofi=true,ssccfg=true,sscofpmf=true \
    -bios /path/to/fw_dynamic.bin -kernel /path/to/Image \
    -drive file=/path/to/rootfs.img,id=hd0,format=raw,if=none \
    -device virtio-blk-device,drive=hd0 \
    -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
    -dtb /tmp/virt-sspesa-test.dtb

Once Linux boots, use the PESA event modifier with a precise request:

  - perf record -o /tmp/sspesa-perf.data -e 'cpu/event=2,pesa=1/ppp' <workload>
  - perf record -o /tmp/non-sspesa-perf.data -e 'cpu/event=2/' <workload>

Check the resulting data with:

  - perf report -D -i /tmp/sspesa-perf.data \
      | grep 'PERF_RECORD_SAMPLE' | head
  - perf report -D -i /tmp/non-sspesa-perf.data \
      | grep 'PERF_RECORD_SAMPLE' | head

Samples in sspesa-perf.data should have the PERF_RECORD_MISC_EXACT_IP
bit (0x4000) set in the misc field, while samples in non-sspesa-perf.data
should not have that bit set. This verifies plumbing only regardless of
whether QEMU supports precise attribution.

Changes since v1:
 - Use the new shpmsdata.PRIV field defined in the updated spec
   to reconstruct the regs for perf:
   https://github.com/riscv/riscv-performance-event-sampling/commit/3eff81a6161ffc7a74a57436132d0c15ab549e74
   Fallback to interrupted registers if precise attribution is not
   available.
 - Add the required extension dependencies: Sspesa requires Sscofpmf,
   and Ssplcofi requires Sspesa.
 - Add the perf_arch_misc_flags callback to update the EXACT_IP and mode
   in perf misc record.
 - Add the `pesa` raw-event format bit and validate precise_ip requests
   against the precision supported by each event.
 - Clear shpmsdata before clearing the pending overflow interrupt.
 - Use Sspesa in the SBI PMU driver only when Smcdeleg is available.

Mayuresh Chitale (4):
  dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
  riscv: Add detection for Sspesa and Ssplcofi extensions
  riscv: Add perf_arch_misc_flags callback
  perf/riscv: Use Sspesa for precise sample attribution

 .../devicetree/bindings/riscv/extensions.yaml |  26 +++
 arch/riscv/include/asm/csr.h                  |  12 ++
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/include/asm/perf_event.h           |   8 +
 arch/riscv/kernel/cpufeature.c                |  21 +++
 arch/riscv/kernel/perf_callchain.c            |  15 ++
 drivers/perf/riscv_pmu_sbi.c                  | 150 +++++++++++++++++-
 7 files changed, 233 insertions(+), 1 deletion(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
