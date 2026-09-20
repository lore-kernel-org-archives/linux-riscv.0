Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46964C982CC
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 07:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkE61FmPPDqPtR2qCIlDSQuvQUHYr/o+p3eNYoX+RZw=; b=zdepQj9aA0rnNn
	a51zWcgd1/J8EiwFsZbl4bOOpkC4EkFT0zhivRs/N0tkgg2pXsZS9p8R15b+VvQm7oPtvo+8d4ONb
	wVawgClgo6lGGbrnJRMazva4113S3j7sIvxk4DRiFn3gxPgqit2P2LtDf9SVIQaIfW4anskG4MG/o
	cFdglkrsppW9c621nQsy1ue5AZCjFXQjaJnZoOPXJsgEPe2ONEmNikdGmoMgG6q92un+gh5kHlFED
	BEoj0YcGXXiYdOqIVJH/2iviwcK/HDzns0Pl+hV+i6p9pJionoMV4ij9YtkzicHg3gvANGbUKg1ve
	idXjzvrgCwDXBpcJrLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Bqa-0000000H1k2-05HQ;
	Sun, 20 Sep 2026 07:20:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BqY-0000000H1j8-1fH0
	for linux-riscv@bombadil.infradead.org;
	Sun, 20 Sep 2026 07:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=HsgA0tk3dRgdOjoRTGQ8Mt9RLPyoih0R+wzz46tu9l8=; b=E1+UFMlSkjcLe0u2rtn6dAITI3
	KuSWS/yadHgiCKGgpvti09iC66wMkMgR1XF0uWtIHtzK793hYvrZPUrX22CUKgghQsN3HieV9nk15
	fh8apQ40QqlI9i79O8+Stx6WxoGKcw/kJiRjvUe1GkwVR5rOgI61RANM1Nc0CuTNlcyMTFkcIXlMo
	6YkLtLJRp6TzC36iKorht6VM9dm8OBsy8GEEAFhqevThGNOgWfVwDanNlcaX/J0+INfEcXLnqe/Lt
	BBBamIZwz3BhWKBSrY8yZui94yhxoUlhGSO0aCX6B7lo2eVTcxI4jSl7Bj39aQgFwVfxu5A72TrwH
	OLnUR9HA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BqT-000000059jp-1qwH
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 07:20:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55gNW1376242
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsgA0tk3dRgdOjoRTGQ8Mt9RLPyoih0R+wzz46tu9l8=; b=QrWy3Jbxa/9A9xki
	0xtBBUiAf6w1VFoyAQVQZFTg9AgaKDYZ6MkMaieHlPUVSvmbTct1oLK09R385Or4
	jGLNR070jFWIVQWBojRKsLTaSC8MfpPPqLv7BB04SlKtGylLWCdvrXbfEI4gqCg0
	E4iwc2SppLmWuLcPypBmIg4TpSprjr6rf1qzORywuoGNlIg+pG8vOLAR2J68Isqc
	ZUkVl3sjbnJ+TIaQ7K+Q6uyx367+lPS/OH/s2/A+Pf+AbT2CB5fGrnSFwOFMAEHG
	esWIA3vN6P4uKYS2BFLw5bI2CVZoI3/X7AI+O/bKnLczk2CtNlXp0cOgMGhusHse
	syj1cA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqftjp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:20:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fb956002so28733905ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888811; x=1790493611; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsgA0tk3dRgdOjoRTGQ8Mt9RLPyoih0R+wzz46tu9l8=;
        b=jChcmTTY9sekBI9M5jojmRjuZHHBOY3UorNEVWHoq4Arasa7SGQwobqeSs9zIUDdGo
         JdEn2M4QHM4xjDv11Vecu83AA5oRfMLLqxLRYAoM0vxjP8i36Tf2zy+lqeQv42xIxYqQ
         W6NYMWEzhhRRXL4yrlAn+cgduk5T1FAIeVhzLj1XJsE6fSIp5HTmH6HM9U7mwrdzhoWl
         7TW0cm/2fVBw2oe77QC8h/DI25/74xyViPhhb0mJ8Ts2wq9ci9WiRCZrt/ap5B5E/lEu
         7sCrVLWIwuci5UwF8yUILXKxqsFs5B9JqelmD6DfHH0cQBCAJSpRJJ62JidjASa1fpsJ
         P4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888811; x=1790493611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsgA0tk3dRgdOjoRTGQ8Mt9RLPyoih0R+wzz46tu9l8=;
        b=Qg3d39sCR117+X+loo4WNeYhB7vaRRu+LJ1YjMg+8/jHR1Hj1JNy4sa1uTy5pjkkvO
         P61SRkl0k5apgqlOnXqQCPBZQFDQwLut5TWGmpVmVrIpGDr6IVgxPxzflJFRqR6lGxsH
         BmeBe2N1I9B3GDgWDRzBEyHMnuGY0JvVLUIL9twczLQt/7KMRX8INKay0FmCY0eKrqhf
         t22L7wAmws41jxA87EH17kAnRt/1bNxa1oIaugF2pUVjegZEcblDzKRVFUHJmN3UYfTc
         GkWD8vioUn55IDVnf6ZEEXVbH0B6wpjZ5jc6EYRva6p+75/fVfzZ8z0hli9+lB+b77OS
         BeMw==
X-Forwarded-Encrypted: i=1; AKwUvBzL5cLczzrVvz3piW5+D7b8pFka3YrDYmXxoqEndVRa4gHJphdNSQW+3UWMQn+3cog4favpvU6cTuXxkQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nOmeLSkrZGH/3ouL2cz51PFbcRTxbK7oa8zo2eFFtndarZZGOL
	+JX92wG1pNCM4TiyhpxvTnVwTPtGFffWVTnwjzRr2+M36Kkxd8FfirtJoGZsjiwTwUNyaqsfZyU
	X7tFriqsl7Kh/+ArszA+TFZAEd5e8S/vaJZsCutJ9IjBWxQm6RwuwYrVkszrRLBVeYQ8f8U0=
X-Gm-Gg: AYBFou3NabLGxX4PznOVcnE2FvY0vq6na2n5cGxGuckt3uHU+lz9nsfxLi3/i1Q9r4+
	eSYwSq/LVQsrdIWvPSkbOasCwgV9diTiLcpyv/TQ035rYjW5z7zcxKQRNhYn8q4IXiuSqaU2dKe
	Txvt3hFz1tR/ZPSlFNrjwo/M0oRA13aq6H67X8fb6t3xOqRzg3RumUsz0wvYnAyFiXYOU+4gzCy
	hhJiSBTwH44J3IU/+Hyb6lfzp4YC7R857Cj1y87OdStYGUBNKMF4MxNaut+IqAK/FLQLTnVqTyC
	F1nmPEDAH671vafpxerVNwUUb2E/IRJ54kkhuVPJKNEZGysQr1a/11AA2Xw=
X-Received: by 2002:a17:903:b47:b0:2dd:c053:d740 with SMTP id d9443c01a7336-2ddc053d7a9mr61039775ad.39.1789888811058;
        Sun, 20 Sep 2026 00:20:11 -0700 (PDT)
X-Received: by 2002:a17:903:b47:b0:2dd:c053:d740 with SMTP id d9443c01a7336-2ddc053d7a9mr61039295ad.39.1789888810468;
        Sun, 20 Sep 2026 00:20:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:20:09 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:31 -0400
Subject: [PATCH v8 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
MIME-Version: 1.0
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=YgS/IB4s8WPaIOMiZ6JH29qlGPXEFMhKzue+pmpKLGc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1Hacz970yXrFEP7L8taGpf8LFybPPm9XXZ+lYu5/OV
 50hqfmvo5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACay+QojwxZex7L/k6u7WXpq
 3u9ROaKy+f+009EZ30737pmuvejg436G/1mq58UvJL1MiZqk/F7spLXDpnwNvhkfKv35/6ke2l7
 kxwYA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX6nk/YwkrgCsW
 bZc0QHq00OVKLFvAwvAbGeo1BZfYqoYpU/HDOCchY8LFBeU87V0ofqMzAD5jm/weVI0oMxTlkAE
 NcvISpVPxPfI0vvTupNOxYNGCHDzBOhEMpfh4DsXYbQZswtg8cNVT6BBc/E5p1naR4hwB9t1z07
 SoyF8Um7Lr9GI8iSZVaQbcz87SAwuR6j75Xm/2n/mLjBdWxkOG+k+Jx5erAv3LougwuNczZeJ5X
 CzAnUQBxGeheuQMarom7G5XYdqKPLhGid1XTPuE3/y/roDmS5bxHFoEx4aVbjtj98MDqh3nMQRV
 RWrOFrqZ6Kyi8b8ldRMOa2I645eMlXw+Gi9+YASiLgTVTEwmfATm6/bZBHe1tTqNw1uu2AMDHnc
 EP44abtkw7QSekoyVtsn/n5hg/CgtgHnjs+wmaL8teJV++cqwz7Dgs6wtTMUjz5/P5GnWU+7V0C
 7W9JvOdPE1w9z5no5Gg==
X-Proofpoint-GUID: bB2tpTNz_XKXLNZnkxStdr2o3C0KhBCS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX46OdGegg+Hgt
 HbFYrOI1lVUtayM49OuxtRsJNfIEzgmFCzaFJPXKAfuXv0WI9V2V3fOLyyhXqLNAH+G5r9SGPRk
 StjUruJa1ljmTb6caE7ndfCc0vlZfQE=
X-Proofpoint-ORIG-GUID: bB2tpTNz_XKXLNZnkxStdr2o3C0KhBCS
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aaf892c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=npia3EAcFH_frxJIFygA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_082017_855526_E8A4FD5A 
X-CRM114-Status: GOOD (  17.78  )
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

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

The IMA bit is now derived from the same cached bases instead of being
hardcoded, so it agrees with AT_HWCAP and the "isa bases" cpuinfo lines;
on any system this kernel can run on it stays set.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8:
- Add Co-developed-by for Andrew Jones (Conor).
- Say in the body that the IMA bit is now computed, not hardcoded.
- Rebase onto riscv/for-next: drop the BASE_BEHAVIOR case's own
  pair->value = 0; hwprobe_one_pair() zeroes it since commit
  d0fc6fab2046 ("riscv: hwprobe: initialize pair->value in
  hwprobe_one_pair()").
v7: Use riscv_isa_base_available().
v6: Rebase onto riscv/for-next: define
    RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64 in the _BITULL() style of
    commit 8da45c93dfa9.
v5: No change.
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 22 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8454a6ae6fd15..0392a8f41d86d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b4369..4f5d51788c416 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,7 +22,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	_BITULL(1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
 #define		RISCV_HWPROBE_IMA_C		_BITULL(1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 8a38a4d37806f..2290126792797 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -307,14 +318,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
