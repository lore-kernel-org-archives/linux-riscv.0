Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E85C5DF66
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wExqRLATGCFujd1Dq8EL7MyCeIChTTuhi8xJxkcH7Yk=; b=Y3wFCO4Th4SElq
	PFqghCRF6JWaLRTjxV4mGXI+nCneMu7NjrULQaxZK9cIoS7go5Bmc7kzDozucI60dW0ru0HHmInpd
	2kFAAZ6p3xSBCKAonJXb7L6aJoReiUxPdH1ZR/xoV8ZjxcI3lzayL9NocOVJbJKGAOCDCd+Od2bCK
	KbMM2un5gPAIR0e0BfH501RzEHJrYE0KF3yLDwS3AqCFe85mZfI9o887TwyQNSW2kKL2a4i5RnvM8
	buKHXEnCtZWnFqj7wklQh8pkmLX6RDS/GAhroB0UG7/nEpBkhCAiQxv1p5eIiZ8D99UvmimA0FyPQ
	VPwHSQs9epXAgbFFRyyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvznR-00000006TGR-06Pu;
	Mon, 17 Aug 2026 16:02:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvznN-00000006TFG-20CW
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 16:02:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYvn43082358
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 16:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F1ydbwCOJHJXHm4fbFBs3uDl9Dggh/0McdK
	z5MjuJng=; b=PosSKHKv5Wk14m5PM6r3+D+7nUkYhx8jJ8e9DVlT6gx8JSle5Mk
	LGVFcaraXw4j/vw8ezxa4tFzbdA8gxMczUe8gqGTt/D1Dmf+d+eEzd4JfGSgJA9d
	cA+gIMqf/XbtebnBfHODSLV2XS7zsaSFKGemeQuSBEAiFEoWGj/Ww7g2ZIw87VKv
	E9LMKF9lPg8Vd46HHHaw31rpt6mT7ats6te6hFV7CcdDOqiMv1AcJwESaBvVA2My
	iFbp8wt3aF8B8CmMYws57xwSAGd5xtWbrokw4xLi5TDvrSRAp8VlUvoygFGeIB7Y
	yU1g6aV4nVt8+MBtUtiClIwN3gJV+jiGLWw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y779pst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 16:02:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84857446424so6189950b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982559; x=1787587359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1ydbwCOJHJXHm4fbFBs3uDl9Dggh/0McdKz5MjuJng=;
        b=CkUmMe6IFDnu7RPdt0B38wUtq8uIoxbhkWNYJXc4oSocPPlZQBh5r8FcfEX+jAT5vb
         tHrrLltZiLMMQ5vgNsOTw3Gd8+ablW3NNlIIO5ppTHNkufSHp00/1lLc2oB6wsNWwxcc
         7OKzDYtjX6jwJ1WcHqR9SL/Hw0WD8ZnWBCtdr3k6gUSC0PP2xl0kJZ/++3wcooyIxb2A
         Fg1Dhnwr+BH0v1WyeyAmhUn5am+NBefB/5LLvx/7FxiIt+esmEmqXTkb9IXzzB4IQ1LZ
         XT6wHRep6Mm0lVE7gBPrynxpl4Je4DMXGlLmFr55vre6JjDc9Zq4c6VLE2xQoSDEIkyB
         Nhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982559; x=1787587359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1ydbwCOJHJXHm4fbFBs3uDl9Dggh/0McdKz5MjuJng=;
        b=OvI9kgXhxZT+9q9/PElO8CviTEYbDumqUVZMurKYHSliu24ofBoFZgoM1Y/M1seGvt
         rGnSk8C4GIkURe6ghdaQKq9vDhYGzZuLhxAHRy3FP8UC4q4P3rmcCajQE71xiG1NGc6b
         BYJZue7BeWNkLuFbIT3al5EqErmYcffaBqTMEd7D7B49lGoRLjaGZqKdE48Z3wVhb1aS
         Aq3esEzgqiFDQdkQRDwhoCMGipO2/ceIjYOJH6yzZYFS8a4GLb/i48ka6Az9w4IcjVAy
         VzeRr0tnTg3OcVsYUPujHVN9oQm+PxHADiXtg1VIW6MkPr8hkUigr5gIMjy0STb7NeM0
         a7xA==
X-Forwarded-Encrypted: i=1; AHgh+RrsdW8n7aLk5Oi9YvK42DHL0ZAi7wAKLYilrHB17SFVsL770ahSnOvIdIBtM/RF3k3c2dHBrTXWoYiC7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKlUmqJ/yT6SNtmV8Kn5hbzNfOOn/MEzAmnjmPJKQPbyWG470y
	81G59SpKyDV8y5Np4vY6bSDke0nMcp5ySdvln+9+hXkcQpdPWMhK8Y96hbXdKHa+m3PbUllK1RX
	cRPt2T6tj7vboNCd3gbUhgrdpnl2D5Vv6f0oLRpPxS78rhTbVRWJAQNxBSFMB49Fs0UykFT4=
X-Gm-Gg: AR+sD10SaDl/QDtAU0NjETFzBHrmG7ofbMD6fEuV8Wp3ImNG39EgoYcbTNKSVAikhcH
	OU+K0PUaCyc8lrZJ2/5u57AqVpWI4vhnN8sf5QwOPnBOjqJg4P9COAQxywopCkAYYqzacHvr8/9
	wk/HN8y7d+ZY1IHtqRYAZ6r2t6JuKFIjBSumk40akiJD8iQE/afntQ3di5cV5Z3Cd5BGkJW2UYI
	yzYmamtYyU1mFzFjTuawy+F8s//xdFUQCLakNVZGGeLXEhIjbwSbPcZ7Ki2L4N6uQv54E2cEOhe
	+EC0VWW41iIajGWRolyQv+AzK28htKgYXr98kgZtAh/oH7IzE+rHhAIItwSXzqhUnA6lD09SrgE
	dqvWaUdtlZleB7B/JI/826vAogWPedn4xW1Fu0IkXqu3skiQ22fdmB5nObyfCb7CFRNOip227Em
	TtgtVhrRGubOBbZ+9dM/qWetsytw==
X-Received: by 2002:a05:6a00:a219:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84fde2bb2camr25464891b3a.35.1786982559217;
        Mon, 17 Aug 2026 09:02:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:a219:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84fde2bb2camr25464810b3a.35.1786982558539;
        Mon, 17 Aug 2026 09:02:38 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-851b6f8b189sm562883b3a.34.2026.08.17.09.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:02:37 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Chiu <andybnac@gmail.com>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor+dt@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
        Guodong Xu <docular.xu@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Hui Wang <hui.wang@canonical.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        Rob Herring <robh@kernel.org>, Sergey Matyukevich <geomatsi@gmail.com>,
        Thomas Huth <thuth@redhat.com>, Will Deacon <will@kernel.org>,
        Xu Lu <luxu.kernel@bytedance.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH 0/3] RISC-V Sspesa: Linux perf precise sample attribution
Date: Mon, 17 Aug 2026 21:32:16 +0530
Message-ID: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfXzJbQCTqJzGjL
 zaz+4ZrmpseAwjzbGLEKvN3gpdneJ/aKv5X6crL5I8N+/OpIZaBqHFDgVC5FSGbe1Y6/zSJmyAL
 BHu97XkZH6lsc0ybSHxfLWeKRhM8p62bweo7SzX05GfN91br0319IdL8JuaqjOYUXZZ04v0UjAC
 lEG01wpzihFzR0kXtNWmbsxL2kQ9ZfL471bG2CKpcDG1PyscA9sy1XfKSLCSusSGf0cKbMz7Qnk
 Gk4qocpZsAKtRnmxaQ6pdWAcA1wfUR+dMXsaHBVSqpYLWufOwkZYlVetgpDn+G2nCJaVcSbtRRv
 QzD1D+o3sTW4fVrl6B7i+jZokbF2txBuRtWYWf/nmD91HYipez2TG3+ESKatF8TkB2ljJJ7bzJq
 skJyaP7K4rkyQrSZa26oM9Sl0k8L8d5UtDBwr+G6GgUiR/dMPms1RLoK5TDddcFUa0oXRV4exHB
 zB4oycPe6DEJlFvho9A==
X-Proofpoint-ORIG-GUID: Xvz8--CWkq5n806EPmSb2wF4QY9BkjbU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX3TZtVXbAXvDC
 izfn0SDdgY8QKHweIzn2lzJAahLei0D4QBbgprSJ7kJfjPBEDj/TMv719+TP1veqqF0Rr7Wy2ij
 rdMKvyHf8FymrS/acpSaG/s+sTQMUhs=
X-Proofpoint-GUID: Xvz8--CWkq5n806EPmSb2wF4QY9BkjbU
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a8330a0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=8ilw5EQWc8m46JC1U7oA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_090241_632479_3DF6FB3F 
X-CRM114-Status: GOOD (  12.17  )
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

This Linux series adds kernel support for the RISC-V Performance Event
Sampling extensions Sspesa (Precise Event Sample Attribution) and
Ssplcofi (Precise Local Counter Overflow Interrupt).

The first two patches add the DT binding and ISA-extension detection
(Ssplcofi depends on Sspesa). The third patch uses shpmspc to report the
sample PC via PERF_SAMPLE_IP in the SBI PMU overflow handler, and
exports shpmsdata as PERF_SAMPLE_RAW.

Reproducing the full setup:

Sspesa support requires three projects: OpenSBI, Linux and QEMU. The
matching branches are:

  OpenSBI: https://github.com/mdchitale/opensbi/tree/riscv_sspesa_rfc_v1
  Linux:   https://github.com/mdchitale/linux/tree/riscv_sspesa_rfc_v1
  QEMU:    https://github.com/mdchitale/qemu/tree/riscv_sspesa_rfc_v1

To test Sspesa, build OpenSBI, Linux and QEMU from the branches above,
then boot Linux with:

  qemu-system-riscv64 -nographic -machine virt -smp 2 -m 2G \
    -cpu rv64,sscofpmf=on,sspesa=on \
    -bios /path/to/fw_dynamic.bin -kernel /path/to/Image \
    -drive file=/path/to/rootfs.img,id=hd0,format=raw,if=none \
    -device virtio-blk-device,drive=hd0 \
    -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"

With all three in place, a counter overflow (e.g. 'perf record -e
cycles -c 1000000 -- <workload>') is attributed using the
hardware-provided sample PC (shpmspc) and counter ID (shpmsdata)
instead of falling back to epc.

Mayuresh Chitale (3):
  dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
  riscv: Add detection for Sspesa and Ssplcofi extensions
  perf/riscv: Use Sspesa for precise sample attribution

 .../devicetree/bindings/riscv/extensions.yaml | 19 ++++++++++++
 arch/riscv/include/asm/csr.h                  |  7 +++++
 arch/riscv/include/asm/hwcap.h                |  2 ++
 arch/riscv/kernel/cpufeature.c                | 12 ++++++++
 drivers/perf/riscv_pmu_sbi.c                  | 29 +++++++++++++++++++
 5 files changed, 69 insertions(+)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
