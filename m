Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BA9C5AD5A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 23:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ekt8623CRtLP/bwUCnspFrwFE/TRbzkBz0IIQSNQ0YE=; b=yV4ABKLbc1OyuD
	NfeqryrpH3+mbTZZhbzAkr8CQwMFfXrzqGmBs79bFIIJh4sKl27oJMHr/SP/jbDmisPbmoYrkvm2W
	YJAnUc7mhuzHmH5P58Gc7xmsSZkwnrAnNg9YRxz8krxJhny4twLk6W7E+kgcN9YZ828dENN8swknZ
	DuSOPAdymzVq2CshU9H44L++066+c9HnCpYEawQY77wCT6KtVxPS0uT5R8ui/gXSlHv3JHgN1K3yW
	G/S3ZUaZSMP9TeD/Cah+e3oIX9xSBuLzuQNXm+wuHgj7vMAA9wojU/F01hHPec/8Fk6hnDmYdrqd2
	lpI3H9qouzJxF8SJPbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITM-0000000H9Pi-3SqZ;
	Wed, 12 Aug 2026 23:35:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITK-0000000H9P4-3LdK
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 23:35:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMLJ74009269
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rQQQsvIekjUAhCQLM9e1Lc
	nQBBvYngS//Y4JXycReKM=; b=JOrXZ5u0U66MgSvSjPPPblL3kVtmSR789snhmu
	76tkC965PbIhOmUE8Wyl2DwCOkb5QqOQDeGjbSrJFXGb+YWqwYQPAkSM7Rca+pY5
	IlfnkNGWmb6s7u7uR3nwByVjOKyKRlTCxxPbBlG4PdSHrRXFkT7+u+CIwRDcZdHG
	PalJVcIUhB9fjnTZJhmrMvb4SLoDvE+EYGZ5TlbrPUr+1vdnxEkTvK55WVqIUyyO
	1UdWgbAu/KefEWSHk0S4n+ZPDFehtYxTKV6/tDGNlGtGIOKqWBmZXk7VIgece4r1
	pWWMtatI6dk5DN0GnlEoHkvFa8e20a+Sy3/wR3JImus9c6+Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xsk0vb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:34:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfe48ca1efso2699205ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 16:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577696; x=1787182496; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rQQQsvIekjUAhCQLM9e1LcnQBBvYngS//Y4JXycReKM=;
        b=kgJt3UJxOB5ArYQvGL+qRWS0WFkkaLCtyYVXv6f5TBOBirhWoTy6q1geQpzSP0zhfv
         vJPc0MWE10AxIAmTya849OjpZBXzVgLEaJYT1D8nCKuMkIAnlp5XCdPMrQFqdaZKCIwU
         RyJILFjlAhqXcuFcGPwDZOGwRkStYZQ6WQrqKaA3Nb1YfViEfwjN+EhRK70Nt9GF6SX2
         2/SSazjIt8H+7aQKpHaVD/mJOoWEIObFW29Smh0t5QA8d1RXcwOBIyUjI9dXr/mxIqLp
         4rjQILQlLKorBOiSQyxvXo+/qeR7eejiVIebHDrANU/YkhjOrN4ymUEhDXj6snFjgmDO
         KuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577696; x=1787182496;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rQQQsvIekjUAhCQLM9e1LcnQBBvYngS//Y4JXycReKM=;
        b=MzQhJZBQCnyY1klndSve8i1Z+uw7uUMB8LMKhZe5AurPKFKAdxVKRbol/qb9aOW9Ue
         fWRsCsK/mh9n+9G+uX89YUeM/xCVYWbSUWYNSunZ9oVtz9deir9t/NbcKbOIQNVTFUJJ
         lFQ7lzHqlFHymD+tI2zT3TlckD/5sAuBADx8dd/x5fyVzvfC9nZfaC1p803v0jE9R8II
         UjXQcRJc75Fu6Ca2opmO+nS29rrW3JelN14HFwODZMbJGYpNjaa1QqoLjtCzImNB3/Ie
         RB2DsxEAHh4DpGmfc8FBOEfdYgCe1z9SsJV1s5s89gxSXPMrc58TmkqlM/DKTibjrqJd
         6YRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQlH52UhV7V4yLbYb71IIsnTeaWp2b/mCSOGwdqXgBs7C7EV1oFaMKcj54QzwGSMLJfoglDeHWf/bRBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaYpRtnmfoNQ6v8b4YYQ5kHAV32VuruOXaEQi7xdn7Yi2n6Qsi
	/pPLcy0hiZc0NRx3kSIXxWu4Qkp96vMpmNmuPXaYs0bfoQS97gQ/Lk2TLDIHqak3bzpPXm3ZXJQ
	WRESf4vLYnPPbiOSaTzUZ9ViZmVUDLvJLbmMxFvaDInpW2/iqDebWqigj+2VCQCcoyhnU+Co=
X-Gm-Gg: AR+sD11BT4U3vQDuWaYYrJ/ElR0d+3SxuXWh46yzw1HVOq5vYlnVO856dhusEgsmArK
	cwAJNS+09Uva29oUvoZHGvy9QqTWaHXx62YONQpMpLWULTqf47S52rUz5xbASFR/6W/dKNjweCS
	wzmv6Zx700+CEW/DpegJHuwetXxQsG/PDA8/TqnGlbcpercawTAL9Uwk6u9ffG1pq+sbXcYIfwx
	+sppe0Dv9cgASKYbbTj5Y9CEhJmi9rQ4sSy0qZP9w6pVl3366LcG1vZhIp7TP+0OfHwkibWzY5T
	azSpGhA+myWoMdavbV8KvOonnL6aofhCJkLlOA2NToKXiNC7/StHkN7/Acgu/g==
X-Received: by 2002:a17:903:1209:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2d37f0d36d3mr16031955ad.21.1786577696227;
        Wed, 12 Aug 2026 16:34:56 -0700 (PDT)
X-Received: by 2002:a17:903:1209:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2d37f0d36d3mr16031585ad.21.1786577695706;
        Wed, 12 Aug 2026 16:34:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:34:54 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v6 00/11] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Wed, 12 Aug 2026 19:33:46 -0400
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANoCfWoC/3XPwWoDIRAG4FcJnmvRcXS1p7xH6UFdN2tpskE3N
 iHsu1fTwoaSwFx+GL9/vJIcUgyZvG2uJIUSc5wONaiXDfGjPewCjX3NBBgoJpmmqVgQJ4V0/D6
 myQVagPIeWCeMd04HUl8eUxji+aa+f/zmfHKfwc+NahtjzPOULrfaAm3vr4Hzhw11GAXupZWIA
 +/9NsXs82zTq5/2pJUUsTKKiceMqIyUYGznQAuN293exq/VwDvj2SlYDTEwbgHRoNb/DbkaHXt
 iyPYdr/hg0Coj7b2xLMsPC7Q1LJcBAAA=
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7265;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=Ra/3+L2jk7U4uMiXwJ9Zce9uuTlc+DLXBTrbeJepa0I=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZk7Vi43XPISfdsgu9fnKaOvq6ta0pijLO1/7gJuWt
 8Kz9NCOUhYGMS4GWTFFlsNHW7K3vvKJ9n3O+QNmDisTyBAGLk4BmMjE9wx/uBKPMYatVvn7tu+a
 6jLxzOqtv/bIcS55fy1TrG16qFroXUaGfYLyzDd2Fol8Zr72SXldirr8HvPb3fUzJ9Y3PndJt//
 KBAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: YiKKGJOg3rCxiX6gknRjBFaYoHKMidgp
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a7d0321 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=ee_2aqc6AAAA:8 a=A54KYWeCNih9maOHq1sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXzfHeLry+sLV6
 4S1fbNDMUGbKLx9qJwLppaFFa6zcLbyLsxbJsT6DJWXJ8BgPDfrReYhVOiccYvyDTjABmx2kMFp
 Lsi6l+VruaVXWSrovrMlf+SjEYADF0I=
X-Proofpoint-ORIG-GUID: YiKKGJOg3rCxiX6gknRjBFaYoHKMidgp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX7rlQHmhTlm7h
 hL7ktSLXGyJZXmFvGWBMFd7bAUJPOcZ2/zLh73hZxMP4V32UZWmuCFE3/MyddSTuIRLElV8pcpw
 aufQV06eq9YqeAUvHtHmiYAxps4EPp3id9yUDwL8CCfI5I3iwiQpJPU/n9xq4c5jZIR+fWIZsLv
 3OFYFZ8GxInnsrL3UAb2+mkXfShZAsGmvMZ6T8u4/+N6bMeqTrJOL2xpsWJpzrf3xEuHhrs2zqS
 KQeSHxVaJwmFHc3ALYxk/xJ1zR1Xbql5WXY5LLRmXNUN5JOE4mOa7hB/0tdjCxnLUD1HgiUPDCh
 qTwZeS40YsqTQXQjFB22NpmWf1UT4LsCPAoQ2Lp0t7JNVD3BoIcjfSx5p0zwiQep6cZ89v2TR3t
 JYfUDwmIfDRX03oTrIhY/Wo5BHlLx9eZ2LkFC4qcaKeYC9smujSmghu6psE04h/b2peFMWCQZbn
 qPbb7w5IGAkong1n8GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163459_023572_C86CAE81 
X-CRM114-Status: GOOD (  20.08  )
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

Note: starting with v6, this series is sent from my Qualcomm address,
guodong.xu@oss.qualcomm.com. Earlier versions came from my personal
docular.xu@gmail.com (v3-v5).

Patches 1-6 of v5 have been applied by Paul Walmsley (1-3 through
riscv/fixes for v7.2-rc, 4-6 queued in riscv/for-next for v7.3), so v6
carries the remaining 11 patches, rebased onto riscv/for-next.

Series outline (v6):

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
  11.  hwprobe: expose RVA23U64.

A follow-up series exposing these extensions to KVM guests (extending
the KVM ISA extension ONE_REG interface) will be prepared on top of
this one and will be posted separately.

Tested on QEMU: with -cpu rva23s64,sv39=on, /proc/cpuinfo reports
"isa bases : rv64ima rva23u64" on both the aggregated and per-hart
lines, and hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64.

A branch is available for all patches in the series: [2].

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v6/ [2]

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
Andrew Jones (2):
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Guodong Xu (8):
      dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
      dt-bindings: riscv: Add Zic64b extension description
      riscv: dts: spacemit: k3: Add Zic64b ISA extension
      riscv: dts: spacemit: k1: Add Zic64b ISA extension
      riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: cpu: Output isa bases lines in cpuinfo
      riscv: hwprobe: Introduce rva23u64 base behavior

Qingwei Hu (1):
      riscv: Add Zic64b to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               |  16 +++
 .../devicetree/bindings/riscv/extensions.yaml      |  54 +++++++++
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 128 ++++++++++-----------
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  80 ++++++-------
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  48 ++++----
 arch/riscv/include/asm/cpufeature.h                |  14 +++
 arch/riscv/include/asm/hwcap.h                     |   2 +
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   5 +-
 arch/riscv/kernel/cpu.c                            |  26 +++++
 arch/riscv/kernel/cpufeature.c                     | 117 +++++++++++++++++++
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  25 ++--
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 15 files changed, 397 insertions(+), 137 deletions(-)
---
base-commit: acf3fcb5e9199cc96ca033ec3c7570b6564c2e9e
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong.xu@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
