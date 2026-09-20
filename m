Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAD3C982D0
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 07:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NmoWv5B8ilTgV7sy3pBgZ/npC5vLYcruy6bd0NoGrTw=; b=rGSTgO77/Cp6lZ
	Ux4YtlowpXi1uYoHQqN+m4k300kqRYA0hnT1YQRi+gU/dqavDR2akPoB13bRqxV04Lgicr2JTuGbB
	kJNculZ6RiVbfGDZV4wjiu3J2GGTtjSLPESyInqLwdFzMqH2mJaW+lCsSaQlkb9Di/gapNUaOfFbN
	bKm4FyRwiZ/oRp+acD+69kLtjKkiwjb/PfDogFpZF3pCiVHO8MEvnyHgTKz+hyQScIsO8grFuLDQa
	fCgvPx8r22pbc+PbiRa0MQSh1HRl8QospxxodxQgPqQk/9Ppm6BBXSbqEtElJ/SICT1Q9Peu/cNST
	qsRVfXS9ZWhR9yA7bqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Bp5-0000000H0yc-3RyW;
	Sun, 20 Sep 2026 07:18:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Bp2-0000000H0y9-2NAa
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 07:18:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K5519R1476041
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jqM0RovfiDvzJezKxW5/YL
	BkYTx4fja7sD9vYRhlE5M=; b=cz7eRwMskLcek4pXCVrptYZ3tGEPU9Auy69OxK
	LrflO+KZmEMC1Xgj3QgZBXYSYSozjTJSsUsU9TQC3ufRaL0L98sem10eGKmffCyF
	iOfQyfIjMH56I8gmakiCZ4TuBXIrDl375bQtaB1CQshNIESTt5UNTrk1G2aaTc4Z
	Myeo+jf8Tog9v/e1crtOyxvJpPBE/Frzu3cQqhVq32adO2Rkska52CYKFsKEbhT2
	BmjDw5RdfbTbp48ejFGo5SeluTvbvHaXp0GzG6gdTTqCySNAMYdUGD8CsxUBK6Zw
	hcq+HrpOMoQWdZVY+fCK8a7PlnTXIlmqMRNmuyUD08VQIYag==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrntu6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:18:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso1724480a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 00:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888725; x=1790493525; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jqM0RovfiDvzJezKxW5/YLBkYTx4fja7sD9vYRhlE5M=;
        b=ZDwOvVRnKr5AF7zSr0hhNsgujL9dXE9REqbAWIeN6IGsnspzZrsRdYApOCsawZFO/A
         lmSfA+UBH+3kvCnV/6xY+6/wFke+7Hw8tRoenlLP86+5YeEonsx80HP5ytFXTurOfepC
         fchsIJzDq4EDjzTbZy5wS7MyEk12JT7w/05kBumROGnLCKUI4upsVrm/q9wyDT7qBV5Z
         ImscMk7zk2UHtJqDZD26HiDnBJL+CEaeuIU4Y8QZCBnz2YStPFoL+r5on9m7fE2QtndV
         Y/7+pM+QKMF1O9gmZSFUzb45zMMODN83oLLxyZfoE8WFOJwLuNhYHHIF/1ux77OexJnu
         1IlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888725; x=1790493525;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jqM0RovfiDvzJezKxW5/YLBkYTx4fja7sD9vYRhlE5M=;
        b=UjM1xPF2ywk4otu21gOdGPOJ7VIXkcqEgSosGSCfgGStLy74VNeYkVuUfYhVJ0gVKF
         Y44NbwcATX90gMtJVmVdR2Tk3g9+pg3IwghnG5JIdZ2SDgDz+HJRmWjah2WsVrJSatwJ
         MaiwNDKvpjcioRrmUwWXNnVFPxdOA/HHJOX8axjqaCkHWqCWRBATBgsahrcXDzjKvTRc
         58hvjym0E20Vq67mCaUfPRw1mN/HqQo4nC0bJuV/Fvo5U5kmOztJTaIo91CNGNl/lD7P
         Y/5rSkXA1oe9wQBq5uLtxA5q9rC5k8b3a/nYe//wkKtIRXr1IKSx+FDq5SqCeHr/hqnT
         KL+w==
X-Forwarded-Encrypted: i=1; AKwUvBwxdy/epGzfeW6hoOjwJypNu3qn2gK0SKMJAqfO5UEvc0qH9AxviqaWlttgxeTZsCmzIqmNnZ/XXYXWfA==@lists.infradead.org
X-Gm-Message-State: AFuF++nvYmQz93Ru+/ZprpPN60oo/lPaZMCrsKASdTLK/LME8jBGpXcW
	moDngY1Z5qsv87XxJDfCAN9oF7fk4b5NoCGQAjpTc3fXh1Vov66EaO3QYlEb3LeWkc82RQkqqnz
	PzmdAJSJ0eJrPqeXjzmjst8W7+si5HDQNUh9T77HfOKSCjLrbT2Rh/ebtDqHEbXoxeTYaJv4=
X-Gm-Gg: AYBFou2uVoFu9bJombaRGiNC4+zbHb7Dwb76ef7mpZjDY90ZpK5QgoCMJTxpnKkfZOW
	2yRq/xWzeHTAJaHrrE2Y07qKU86C+yhgddNEmbUXyWTZQY2AcnonrpkwQOkhLPT1epottZNp9qI
	PDrWTx9fbSx0iH+zd0ymbtyZJlMUHCiE5kwhR7sANePaODphBN37DD8VhUFTG6Ud0+EjHa5asAz
	/jwL2cgPxKLFHdedb9TQqWA+J8zYDdYC4L9FoJOpzbtQ64BSYgGKrfkLFxzXi2Vc9JdFBTyTOXu
	eQY9m+RKZbwdQN944scLloHMuIMmNxN+wkD5EU5iJ83pnr61rklrrJWukF8=
X-Received: by 2002:a17:902:ce0a:b0:2dd:c100:80b3 with SMTP id d9443c01a7336-2ddc10081f3mr52961725ad.46.1789888725025;
        Sun, 20 Sep 2026 00:18:45 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2dd:c100:80b3 with SMTP id d9443c01a7336-2ddc10081f3mr52961405ad.46.1789888724448;
        Sun, 20 Sep 2026 00:18:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:18:43 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v8 00/11] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Sun, 20 Sep 2026 03:18:20 -0400
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALyIr2oC/3XPTW7DIBAF4KtErOuIv8GQle9RdTFgHFMlcQq22
 yry3YvTSlSRI83mScP3hhtJPgafyGF3I9HPIYXhkoN+2RHX4+Xoq9DmTDjligLVVZyRi0nJqv+
 8xsH6auYVazmthXHWak/yy2v0Xfi6q69vvzlN9t27caXWjT6kcYjf99qZr3t/DYxtNuShFWcOE
 KTsWOuaGJJLI8a9G85kLZlFYRQV24zIDAA3WFuuhZbN8YzhVAz5z3h2isyG6ChDLqWRWj8aUIy
 aPjFg/Y5TrDMSlQF8NFQxNOPbhsqGMxqwExyU1c2Q0v5jwlNWzoWqC2UYbFN1phAFeNsa9EZtU
 Muy/AAquVu4LQIAAA==
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9252;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=q+v5z2ZHY+dLT8pX5VQLPmJS9sZvJA0/5oSu5VcFUjs=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HQfdbzJuuZMW/va+wrNPsrGVGiohMyqLKyYGzguuC
 vLQsIztKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgInY7GT4n8DQ4tB0kTnAiWP2
 vcwz24ovCqQtuq2Ul3v8dx7v9z1r3jMyNFfyuzxf/uPrjG3LPWPPOjA+nbesjyX8Wvecg67LvHl
 vsQEA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aaf88d6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=ee_2aqc6AAAA:8 a=PlMrqp6MWOWACOo6-tkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX2mQfKMzEDCOn
 yjndRCeKOHgtF8jS3zwCLd3D4xir2XffzJl+rcvfOu6HHnuvvTjpzeHos6dR8Upg5VoizCLc/dQ
 Ys4aQTqK9VokAID1LN0O9jF97AbuhVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX5BSoFA/C6TfK
 fNt/Bh9zEtuGCk+FEUdOqSkM7vPQTelV/ahUdhbAlRm4U0y5B9x4Eu2ynezvFUPU6tQDsgMTzCY
 HKDU64r1stgMk6fthcihX1vgM//EbSrtV/57ET6JLEZZF/IfZg23bypAdMYUkgO6znQm0ugAK/N
 FaX7MDDfw4Om2kdGxX5nGl1XYrzOuPHwVmK1LsJWvVQktCHVjvlNvsn9b/nrCWZKtYcgKfmIqlY
 eu4dXThx9yJ6E4/8H4LAuB+7trpsiyBjMrd9daX+RQYnrzpsiiwCo6XJnUUA4dxKXHb4JAP/sR6
 aHOtBoH5k4gLjBPlfBEShuaFbpDVanrIQgTuL/Xg+1o8F+ZBqaZGP+bNpHj8It6fJjc7EFG+Bxc
 /xoP3z+BeHfMFoHmTtT0wR0Uw9oGcQBBACyQgjw0/0cbN8bVaKk1kVINelr2zkybpggoPC8JGOZ
 hUQD7lR4msWDsykK/2A==
X-Proofpoint-ORIG-GUID: -HUdBbIjSvU-oobUSGspPbJe84bmZEB5
X-Proofpoint-GUID: -HUdBbIjSvU-oobUSGspPbJe84bmZEB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_001848_756586_B392AE6C 
X-CRM114-Status: GOOD (  19.21  )
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

This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
check for RVA23U64 conformance in one call, instead of walking hwprobe +
prctl across every mandatory extension.

The series adds a small framework that resolves profile-class bases (IMA
and RVA23U64) from the kernel's ISA extension bitmap at init time, and
surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
can add RVA23S64, and backward RVA22 / RVA20 detection, to
riscv_set_isa_bases() without changes to the surrounding code.

v8 corrects the authorship trailers on patches 9-11 after Conor's review
of v7, and is rebased onto riscv/for-next. The only code change is one
line in patch 11 made redundant by commit d0fc6fab2046 ("riscv: hwprobe:
initialize pair->value in hwprobe_one_pair()"), now in for-next. Patch
11's commit message also explains that the BASE_BEHAVIOR_IMA bit is
derived from the cached bases instead of being hardcoded.

Series outline (v8):

  Per-extension cpufeature parsing + hwprobe export:
   1.  B (the Zba/Zbb/Zbs set).

  Zic64b (new first-class extension):
   2.  dt-bindings: require a cbom/cbop/cboz block-size property whenever
       the matching Zicbom/Zicbop/Zicboz is present.
   3.  Zic64b dt-binding, with a schema check.
   4.  Zic64b cpufeature parsing + hwprobe export.
   5-7. dts: declare zic64b in the SpacemiT K3, SpacemiT K1, and Sophgo
        SG2044 device trees.

  RVA23U64 base detection and exposure:
   8.  riscv_have_user_pmlen(): accessor for user pointer-masking PMLEN
       support.
   9.  cpufeature: per-hart and host-wide isa_bases bitmaps; IMA and
       RVA23U64 detection lives here.
  10.  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", e.g.
       rva23u64.
  11.  hwprobe: expose RVA23U64. The IMA bit is derived from the same
       cached bases instead of being hardcoded, so it agrees with
       AT_HWCAP and the cpuinfo lines; on any system this kernel can run
       on it stays set.

A follow-up series exposing these extensions to KVM guests (extending
the KVM ISA extension ONE_REG interface) will be prepared on top of
this one and will be posted separately.

Tested on QEMU with '-cpu rva23s64,sv39=on':
1) /proc/cpuinfo reports
     "isa bases : rv64ima rva23u64"
   on both the aggregated and per-hart lines.
2) hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
     BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64
   through both the vDSO and the raw syscall (v6 returned 0 through the
   vDSO, see [3]).
3) With '-cpu rva22s64', /proc/cpuinfo reports "isa bases : rv64ima"
   and both hwprobe paths return BASE_BEHAVIOR_IMA only, as expected.

A branch is available for all patches in the series: [2].

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v8/ [2]
Link: https://lore.kernel.org/all/c24e720e279fed0296f1f78630b6a471.guodong.xu@oss.qualcomm.com/ [3]

Changes in v8:
- Patch 10: Andrew Jones is the author; most of the code is still his
  from the RFC. Added my Co-developed-by (Conor).
- Patches 09 and 11: added Co-developed-by for Andrew Jones ahead of
  his Signed-off-by; the RVA23U64 bit, the hwprobe.rst text and the
  mandate list came from his RFC (Conor).
- Rebased onto riscv/for-next at e11160948333. Patch 11 drops its own
  pair->value = 0 in the BASE_BEHAVIOR case, since commit d0fc6fab2046
  ("riscv: hwprobe: initialize pair->value in hwprobe_one_pair()") now
  zeroes it for every key. No other code change since v7.
- Link to v7: https://patch.msgid.link/20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com

Changes in v7:
- Patch 09: register riscv_init_isa_bases() at arch_initcall so the vDSO
  hwprobe snapshot (arch_initcall_sync) sees the ISA bases; v6 returned 0
  for RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO, IMA bit included,
  while the syscall path was correct [3].
- Patch 09: keep riscv_isa_bases static and add riscv_isa_base_available(),
  mirroring the extension accessor; patches 10 and 11 use it.
- Collected Acked-by from Conor Dooley on patches 02 and 03.
- Rebased onto riscv/for-next at 77ae27fd98f3 (post 7.3 merge window);
  no code adaptation needed.
- Link to v6: https://patch.msgid.link/20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com

Changes in v6:
- Rebased onto riscv/for-next; dropped patches 1-6 of v5, which have been
  applied by Paul.
- dt-bindings block-size: only match nodes that have
  riscv,isa-extensions (fix suggested by Conor, breakage reported by
  Rob's bot).
- Zic64b dt-binding: guard the zic64b rule the same way (same defect
  class, found while fixing the above).
- Follow the _BITULL() style of commit 8da45c93dfa9 ("RISC-V: hwprobe:
  Use BIT macro to avoid warnings") for the new hwprobe bits (EXT_B,
  EXT_ZIC64B, BASE_BEHAVIOR_RVA23U64).
- Zic64b: RISCV_ISA_EXT_ZIC64B renumbered 110 to 116 after upstream
  additions took 106-111.
- Link to v5: https://patch.msgid.link/20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com

Changes in v5:
- Rebased onto v7.2-rc1.
- New patch: make riscv,cbom/cbop/cboz-block-size required whenever the
  matching Zicbom/Zicbop/Zicboz extension is present (Conor).
- Ziccamoa/Za64rs: drop the Zaamo/Zalrsc validate callbacks (Conor).
- Zic64b dt-binding: fix a double space in the commit message (Conor).
- Collected Reviewed-by and Acked-by tags in v4.
- Link to v4: https://patch.msgid.link/20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com

Changes in v4:
- New patch: sort the multi-letter Z extensions alphanumerically in the
  dt-binding (Conor), and place zic64b at its sorted position.
- Zic64b cpufeature: validate only the CBO block sizes that are present;
  overlaps Qingwei Hu's earlier patch, so it is now authored by Qingwei.
- Document EXT_ZICFISS / EXT_ZICFILP: cite the riscv-cfi v1.0 tag commit.
- Picked up Inochi Amaoto's Acked-by (SG2044 dts) and Andrew Jones's
  Reviewed-by (documentation patch).
- Link to v3: https://patch.msgid.link/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com

Changes in v3:
- Add Zic64b as a first-class ISA extension: dt-binding, cpufeature
  parsing with a validate check, hwprobe export, and device-tree
  declarations for K3/K1/SG2044.
- Patch 1 is now a clean up of hwprobe.rst indentation.
- Document RISCV_HWPROBE_EXT_ZICFILP alongside ZICFISS.
- Move the Zicclsm hwprobe.rst entry to the IMA_EXT_1 section to match
  its bit allocation.
- Collect Anup Patel's Acked-by/Reviewed-by on Patch 3, the capitalization.
- In cpufeature.c, set the local ext_mask with __set_bit().
- Update Guodong Xu's email to docular.xu@gmail.com.
- Link to v2: https://patch.msgid.link/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com

Changes in v2 (since Andrew's RFC v1):
- Rebased onto v7.1-rc2.
- Reworked rva23u64 detection into per-hart and host isa_bases bitmaps,
  shared by /proc/cpuinfo and hwprobe.
- Scoped to IMA and RVA23U64 (RVA23S64, RVA20/RVA22 cpuinfo output deferred).
- Link to v1:  https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
Andrew Jones (3):
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support
      riscv: cpu: Output isa bases lines in cpuinfo

Guodong Xu (7):
      dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
      dt-bindings: riscv: Add Zic64b extension description
      riscv: dts: spacemit: k3: Add Zic64b ISA extension
      riscv: dts: spacemit: k1: Add Zic64b ISA extension
      riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: hwprobe: Introduce rva23u64 base behavior

Qingwei Hu (1):
      riscv: Add Zic64b to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               |  16 +++
 .../devicetree/bindings/riscv/extensions.yaml      |  54 ++++++++
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 128 +++++++++----------
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  80 ++++++------
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  48 +++----
 arch/riscv/include/asm/cpufeature.h                |  13 ++
 arch/riscv/include/asm/hwcap.h                     |   2 +
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   5 +-
 arch/riscv/kernel/cpu.c                            |  26 ++++
 arch/riscv/kernel/cpufeature.c                     | 140 +++++++++++++++++++++
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  24 ++--
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 15 files changed, 418 insertions(+), 137 deletions(-)
---
base-commit: e1116094833337fe9480fb9527a59c7637b96118
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong.xu@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
