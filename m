Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79A7606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 21:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ocHWS3q5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgi6aWJ+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NkTmKJF0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zgjh40QX5ilrQCvwvixbCdKvQh7Ku80kCy+qArUKel4=; b=ocHWS3q5yaxbOvebBk/H4Hnqjk
	bx+8oeFZwc1kFnJLpn9iJUjEYUClSWmbPFjqcM7GJajFl4WzUWg9rAMu74ERxPIappYR2NA3+Wr/z
	vdJi3RFtpmIdD7LGcIw6ZOzCxOoRh00MqBuAuw3nbukmsMlnn5DsLktf1vu37j7gcxsoQLkvXs6nF
	yfoi0QcrjfabmVjIqFwUFipxgNmc64YBZQt927qxHbwQHtaTluEdlsaZI7OaunmbVCuMxgdJuiqrF
	RDDxye0QAavn5DUxQSlfQQ1TCwLK7ZpJ1eNqJ9MlsinoKQVbKfaCVfGPTmxsUmmLWsihSwg9uA5Fk
	+zWk2hNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh5l-0000000EYs4-0Zfr;
	Thu, 26 Nov 2026 21:33:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh5i-0000000EYqB-1FHb
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 21:33:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw8Tp3990091
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3z/8Pdbqw7mOchnPI5sAjkgLG9JNDJAvAK03r0XyDE=; b=fgi6aWJ+/r/8Fhc7
	G2mJMzNuj1rPRDSa3+Wt3IVpR3qiF9X7+emw/fzz4GSy+lIavr4qFJqWcKQnJQSz
	wmZzSORgB0RVa38RaEbiAc0R3i/7pfzWsLqnQFH3Md+E13F+wTQnlxbnum6ndfq/
	l4N4b58TN+IW3f4Rd/oVRs/dpXBzL0f0UuWxQyTU2Sq5aEIpcbyc6DABz1+Cx+Vh
	i+TzMv9XBkKJqsITiGb9AK6TizaVNsBnEzzh2y6B/ZBpX5Y3j1mr9zxC9oTa1JV3
	GuBsLx6u6NwirwF91KMYHjMRHnLVImZrmpyi2zR0au4rCZIyY/yTcDo+ioFU7Y+7
	vvBtmw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak03t4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:33:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso4728775a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 13:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795728796; x=1796333596; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3z/8Pdbqw7mOchnPI5sAjkgLG9JNDJAvAK03r0XyDE=;
        b=NkTmKJF0cWCJ3IiIlMxWTBU9Tkml9f3pcwSfU2j6N5OHyFyteooWSeprwgW2mchQkF
         MK3TOTWoVIc/ISWAfcbqN0yu5Qgx0L92e5nGUl6fL1YN2Q0WV0CSj/IsMy8v/IqqOBGn
         SMzKkxIjdssiI068p1XsvhcWmJTi0oAIpxYTewfh1EdPB0NEWRSyFbzPb/imWYwTs/GT
         XN33jBy5g4jkJVgqqRC25LjiT0u3tMrH/0rxN5252sisrltIi4NW4t3jBWurAVt0Glw/
         c/0TfpMcubllWzKUgu0hkYoqu1GblWbvFqGYAaDQkVeRgpDH/vYRy0ktCaJhLV1yggMx
         kZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728796; x=1796333596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3z/8Pdbqw7mOchnPI5sAjkgLG9JNDJAvAK03r0XyDE=;
        b=AjzzDlTGi74ZkPLtrBRvjFfymUxq6LHwo5CVQ07fbZMvtBDdspMhkdRGkoWqdBoXYE
         eV5hVXG6x/+GyI7a5E3U5Qy6MVS9oBvYUhra5NIkTUitOpU/733hZ9G1eQcdMHx0dbNi
         88oTKINHKKwczq5slp0e8OnDUM9jgDovwTRlWkuj7vPph+6pefRNOprPzeTDLwFXIz/s
         LJ1efqkTJ4BUoMHfNM/VO8INrIqCYfFqo+U7jlvcjqfaASbz5C8Fnm55ujgb5opUgLEn
         2bp+s968OLPm6G5y2fpfu1fyPovvwvANNE0CQj4VIJc8Owr6QPV87tYnclf/2dBghRe1
         +nvA==
X-Forwarded-Encrypted: i=1; AL+hErHRCB35FXhCO2v4titAW0W/K2TWsRzbiTHtLf6B2umpIOtK0qrU/ZvmHN+Bm2qB4fLvQVSynBDK0FgsNg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+92AF0yyd3hW9vurAPhpynPOFllTrlamnxJq6JM3YyVGJxcgpP
	DtFRMud5mAlFsFLixpv9GQnbdrPUAbWB/O1j+kROOT43rPsAY/dL0IE9qVxLqKy4cWE5ShmEhX6
	yauBGDO35kfduIsK9zU1Jj4VWaOc+OreXL+9Mm14lCFpLN0ZkW3tkbrpDHR/TSpaTjfsO+N4=
X-Gm-Gg: AZFdTZdDuVPgl/oHv0rY6zcuTiI0lbXr5XGUZkmm1B+aYrKEYeI91+XklBWuHk8fTs/
	hZCd+4Ig6Zj8eHoRt48Rcj+YhEbNzBfTXAohTJ9ZFN2NaZO59qJ0zsMo5k5lZFRJYMWi6B29cGh
	fT+ugnMI0/8hypeXLMAoz0yxFXv+8JPd3Owj6kJt853nTbSKNmHLJ1/eRfctyMRbM1J9Rumimua
	0+1aW74nPI+/mg7QCvdFewdGW4bHCA3VN2kq5H1fPI8dqXPG/WOa4No5S8fmFlNhrPc65n0F6mA
	cFiyt1emyK8l1ZMOOYlasNH7qpqhmNJOS6dqKobiNpfYqmaNh0ELnkW2+k+N7ENMP8yOT7C/4ef
	OToGfOL1du5dpWK292hh3YQiG3ycx0s/joIciXsIuHtH/ZgOj8lxoysGsVliSs4nsUF4P1v/6Vf
	l59mLGx3CM6A==
X-Received: by 2002:a17:90b:4a48:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b41c987b44mr19750759a91.47.1795728795760;
        Thu, 26 Nov 2026 13:33:15 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b41c987b44mr19750728a91.47.1795728795081;
        Thu, 26 Nov 2026 13:33:15 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm39927286a91.8.2026.11.26.13.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:33:14 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:32:31 -0500
Subject: [PATCH v10 3/4] riscv: hwprobe: Introduce rva23u64 base behavior
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-rva23u64-hwprobe-v2-v10-3-bea130335fc4@oss.qualcomm.com>
References: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
In-Reply-To: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8570;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=pyA9Pxgd6x8Yz7FO0jmVwfAyHjvb54JETkPV1oG262Q=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhmyOpVVlTPa/33Kc3bjWaeuNq1J2mmovHyw+a7ZSc9Ki9
 JotURbfOkpZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAih7wY/srGfX8ptOTIB9Yv
 rK2f+AXu6fB8/ni76J2agfnBBdHv7WUY/gqLP1l471rAB50INt2THrHcfiURHGubgnlntHumSJ/
 jYwAA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b08a59d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=g24dY-sxPFC-Kt_ZjfwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Ygvw5NmIm3rhWceJDEFGtMWM3rNh3jn_
X-Proofpoint-GUID: Ygvw5NmIm3rhWceJDEFGtMWM3rNh3jn_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX50+wT9LLH7vG
 aBERf4C9gMUDzkM7ijMc2e53DAjXGPWu92SQaTQ9X/IaKhmeFGJ2X8pLrjwQPLpbsHfcGiKSTzH
 3H2EMAVlt8mSBRVDS4wfbPEEuDm534+X8GMPGHA9Yr+Ma7JQAUlXdlXl3tvJeVwfjHaHIHheNn6
 u0KgQAdWIYVlVvrxjUEukP8cphqImfWD0BxXvlK1E9eamalJmPVroY1LMXFbfhndop5/hGxCOeQ
 l8CoWvG7mgO9oTwH9gpT/Sj4egjaY8Bq0SOPFZ/BMZ8x5gmny6aCgDRkwgWOKUhNlIZwUG/g7LO
 9lhDEYm2AFfSUbQFm23UVCQAJZKmp9pyZPAyHonn8ed21q7GxXffptEgrYxEISJ/V9BLaN7mYQ5
 YpSB5lO9p1oBNSjSF5d1gkBGSwVQX8TJVkvLpfNXFycFPgNgBVkjloCspBX2LohgF01xMD5HOtO
 1eKPFhVurURDFUU8A2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX8CFCPdnZtF7K
 BuJVPPMPTnQKd9oLeU+uKNVAkUKRqaaZtwXY97AFmf+jrwaP4gOjv+LPXODyF6uGbYbhoB9F5Pz
 TB7mkQlsTskNPMOjWM9nj8605iL7SgA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_133318_476114_7D653DBF 
X-CRM114-Status: GOOD (  24.93  )
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
Cc: Florian Weimer <fweimer@redhat.com>, linux-doc@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>, Guodong Xu <guodong.xu@oss.qualcomm.com>, Mark Harris <mark.hsj@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Andrew Jones <andrew.jones@linux.dev>, linux-kselftest@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Peter Bergner <bergner@oss.tenstorrent.com>, Aurelien Jarno <aurelien@aurel32.net>, Zihong Yao <zihong.plct@isrc.iscas.ac.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Provide a hwprobe base-behavior bit, RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64,
so userspace can check RVA23U64 support in one call.  Without it, a
consumer has to test more than thirty extension bits across three
hwprobe keys, and still cannot confirm that PMLEN=7 is selectable
without prctl() calls that change the calling thread's state.
Userspace treats RVA23U64 as a new base, so expose it as one.

The bit is reported for a set of CPUs when PMLEN=7 is selectable and
all RVA23U64 mandatory extensions are reported for them in the
IMA_EXT_0 and IMA_EXT_1 keys (I, M and A are the IMA base; Zicsr is
implied by F).  Any host-wide decision behind those keys, such as F,
D, C and V being disabled when one hart lacks them, therefore applies
to the RVA23U64 hwprobe bit as well.

Suggested-by: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v10:
- Add Suggested-by for Radim.
- Report RVA23U64 as a function of the IMA_EXT_0 and IMA_EXT_1 bits
  plus PMLEN=7, instead of the isa_bases bitmap. The separate
  host-wide gate is no longer needed: the keys already apply it
  (Radim).
- hwprobe_ext0_has() takes a mask; add hwprobe_ext1_has().
v9:
- Report RVA23U64 only when F/D, C, V, Zicbom and Zicboz are present on
  every hart, in line with IMA_FD, IMA_C, IMA_V and the host-wide
  Zicbom/Zicboz enables (Radim).
- Update the RVA23U64 entry in hwprobe.rst.
- Reword the commit message.
- Revert RISCV_HWPROBE_BASE_BEHAVIOR_IMA to hardcoded; do not compute
  it from I, M and A.
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
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
 arch/riscv/kernel/sys_hwprobe.c                    | 54 ++++++++++++++++++++--
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 60 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8454a6ae6fd15..c24630c672c43 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    Each base behavior bit is reported independently of the others.
+    Hardware that implements a later profile whose mandatory set includes
+    RVA23U64 therefore reports RVA23U64 as well.
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
index cd7cf272e6e11..f9c1abcb7139e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -29,6 +29,31 @@
 			missing |= RISCV_HWPROBE_EXT_##ext;				\
 	} while (false)
 
+/*
+ * Together with the IMA base (I, M and A), these masks list every
+ * RVA23U64 mandatory extension. Zicsr has no hwprobe bit; the RISC-V
+ * Profiles specification, commit 0273f3c921b6 ("rva23/rvb23 ratified"),
+ * notes it is implied by F. Supm needs PMLEN=7 on top, see
+ * hwprobe_has_rva23u64().
+ */
+#define RVA23U64_EXT0	(RISCV_HWPROBE_IMA_FD | RISCV_HWPROBE_IMA_C |		\
+			 RISCV_HWPROBE_EXT_ZICNTR | RISCV_HWPROBE_EXT_ZIHPM |	\
+			 RISCV_HWPROBE_EXT_ZIHINTPAUSE |			\
+			 RISCV_HWPROBE_EXT_ZICBOM | RISCV_HWPROBE_EXT_ZICBOP |	\
+			 RISCV_HWPROBE_EXT_ZICBOZ | RISCV_HWPROBE_EXT_ZFHMIN |	\
+			 RISCV_HWPROBE_EXT_ZKT | RISCV_HWPROBE_IMA_V |		\
+			 RISCV_HWPROBE_EXT_ZVFHMIN | RISCV_HWPROBE_EXT_ZVBB |	\
+			 RISCV_HWPROBE_EXT_ZVKT | RISCV_HWPROBE_EXT_ZIHINTNTL |	\
+			 RISCV_HWPROBE_EXT_ZICOND | RISCV_HWPROBE_EXT_ZIMOP |	\
+			 RISCV_HWPROBE_EXT_ZCMOP | RISCV_HWPROBE_EXT_ZCB |	\
+			 RISCV_HWPROBE_EXT_ZFA | RISCV_HWPROBE_EXT_ZAWRS |	\
+			 RISCV_HWPROBE_EXT_SUPM)
+#define RVA23U64_EXT1	(RISCV_HWPROBE_EXT_B | RISCV_HWPROBE_EXT_ZICCIF |	\
+			 RISCV_HWPROBE_EXT_ZICCRSE |				\
+			 RISCV_HWPROBE_EXT_ZICCAMOA |				\
+			 RISCV_HWPROBE_EXT_ZICCLSM | RISCV_HWPROBE_EXT_ZA64RS |	\
+			 RISCV_HWPROBE_EXT_ZIC64B)
+
 static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 			    const struct cpumask *cpus)
 {
@@ -215,12 +240,29 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 	pair->value &= ~missing;
 }
 
-static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
+/* Return true iff every extension in @exts is reported for @cpus. */
+static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 exts)
 {
 	struct riscv_hwprobe pair;
 
 	hwprobe_isa_ext0(&pair, cpus);
-	return (pair.value & ext);
+	return (pair.value & exts) == exts;
+}
+
+/* Same, for the IMA_EXT_1 key. */
+static bool hwprobe_ext1_has(const struct cpumask *cpus, u64 exts)
+{
+	struct riscv_hwprobe pair;
+
+	hwprobe_isa_ext1(&pair, cpus);
+	return (pair.value & exts) == exts;
+}
+
+static bool hwprobe_has_rva23u64(const struct cpumask *cpus)
+{
+	return riscv_have_user_pmlen(7) &&
+	       hwprobe_ext0_has(cpus, RVA23U64_EXT0) &&
+	       hwprobe_ext1_has(cpus, RVA23U64_EXT1);
 }
 
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
@@ -309,12 +351,14 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 	/*
 	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
+	 * extensions are supported on all harts, so just cheat a bit
+	 * here and tell that to userspace. Other bases are reported
+	 * only when detected.
 	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_rva23u64(cpus))
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
