Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531B4C88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 07:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzdY7MVI1DKpvQjMamDOkNbMhCwuORCGlS4nkVEjwR4=; b=auTVau6GyVnq6s
	FpztjIMaOX6gLKbc7Y4rxohYyWNcGibZtVEiRGNBvBRuVAxP3n5DfGMEOOQpbehmsILwVuYDusaMv
	Z5TN5Qwlnapu9yieCFVADSpSMmeHgWvFomeZ4Tl8lguVCWgKRT2wW0i7s7GnUjDiXz0PQ9Qp2MbUH
	jLhe3VW3KwOWIBfHU3imL3ODKQNXL9CTYsHA9Us4Qt4aGR/7YdM1ezUEMSPfjVdLNCnMybYshlm+P
	w9sVvXL+oM04lQj8t37YIQG7CWIDDx7f1Jy0lX2A1w7PYqTEnbIqhAAfQFJT86Emnfu1J9lKLBWcH
	xpwXUwfL1YxKYJF04sMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NQ9-00000005RsS-0lLB;
	Tue, 15 Sep 2026 07:17:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NQ5-00000005Rq8-43p0
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 07:17:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZFfl3487022
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eeFOyk3q/BZvRjuJEhvKLX8LBrKipvgEIaJeKKaoEy0=; b=SPWks4+rEr9I5TSa
	SWGU3hX0SYmhaht54r/fN5dYD/cVd5yZKTpVs4v18l1jx1EC2SFEFnRRz8fEYmRR
	fQ+/fqN6cyeHl7BxRNmbGLUB8X8nRZPIF3J6ztoNsoJGWvCsiybqgToK44hfGDEd
	Awrrvh2w/aVw9ZqTTJoxuFFHGVDjJVqbqKITulrHife/nDHxxUAa/ucme6GHRMM6
	3X1yxct5UtAkIt7wqMqiNpNyzY9ZK5Ky+NgsoJQsqfpgBCzxFRUslMkHswkUK2KO
	NxpjAIqYL/V4AUIKGleXZuS8PzJtH9fRT+lAMZAPf+tNvS6+/Oiwt/TaVwq5Lc2W
	D+1xAw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jer8a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:17:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so6947874a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 00:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456652; x=1790061452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eeFOyk3q/BZvRjuJEhvKLX8LBrKipvgEIaJeKKaoEy0=;
        b=YkhssqLVGjbHql4wMsDaBOffXgRWvTG8otAl00jg+YgoriQXYi75/n5fyjrYSzLvj4
         K6h63us4U2V8yAONPUF9LGyQbfSyNp1uf82B8Lypwp0bHWeil554ZLwV8YU7dKynNx9t
         5AqnvDwVaQiG6cWSMDNISAs3my0ir4lzpkVgMV1c7yAtgzmP9Ohg19+hiJtefPpVMe/I
         0M/knMTWufiEI4AvQa2n41jexB7+XkVagMJF5ZouQHnvUXgybcX24amIyyPbFWLbczG2
         yQdlrA6MTI6VCUO0bbMmY83cGlTq0azQefYRWcphf7uoj1RGRx432E4XlwXgxyAs9YBT
         Unog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456652; x=1790061452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeFOyk3q/BZvRjuJEhvKLX8LBrKipvgEIaJeKKaoEy0=;
        b=iLbaizVWgyUlZzZDRLaI5Qcsk9eoOovkmXFZbEoDt+XWmLR6E4rJVa4F+hVZFoHKjm
         YeylM+/mqtGJlN9hu+bXPxbGOhN99kkp90mGjcNNrdKF0o2SpuGGiICwlJs2/RDpvoGh
         /fx2OWim63oJhWp/EDxs7RHST/MDnZMxfOl1VdvUUNd2YReSKq+rGMbafhvZlSXpAgud
         0DVgti//HS9F6u3kFr9A46e7tbPqyQiVwz7rrAaINEIPG1zbyMzWxlPdxoOguJA2DnAS
         Swos/Pn6TqadEHsV3wqB3WcHFugLU9VQZ1SS1O5xG0ZzTvib6nqpePUBxdY2YbaA1pDP
         gTSg==
X-Forwarded-Encrypted: i=1; AKwUvBxT+/95r6B2nZqP+p/cBZnNH2GY6YO2nfz2WoZwjkcRS04kmRcWCPxtm/iJBYeZXY6Iu+yeU4fuM0Fv0g==@lists.infradead.org
X-Gm-Message-State: AFuF++mrMxwMZnl4tXyg4lCQreYr4QCbhLOpkwFrrDIJHxTZAJ5q/yCR
	3/JmykvTAGYXA057oFbm4gmjgcYM4pDh+aADWIJ/MoWT6M3nBh5vzvNaT+1mRhw2GytgEowUrQW
	FEpptsSiKnMrLqUkeWOYYlaPMzkjbfx9mF9fKQ6H5akYAPbVPtA6trCOvhdMwxFoyqiayjpE=
X-Gm-Gg: AYBFou1OMpam4lKLCoCSvMS825BiFvZbm9v+AiGty/8zU1haRMZTMUpKduelnvYEYBa
	23YPufRIzMojnpZcrd7G0SoXhgwIdjjRxJk8sPQyjz8v8aTC/6P1p7tfbZNAcEJ7pGkv+Eb1H8K
	ujvaNRCHai7rSOSfTi02PL4Izba4o1HfhEpPbbHRsf29xuNqQaDXvhcaqCdw8mXNushRC60Nhom
	uzBATQk78MsozwlA9MuWg1tvi+rjeK7kbcoOCPibc9gdfDr+PrJnq9GLt7/UZisy7DHNS9qQSZP
	fkg16mbwDekIZYt8GW7P5UYZD8kYYxBIM7voqRfve+XmDfrjjO3zZgCiYESB
X-Received: by 2002:a17:90b:3cc7:b0:39e:d2a:e272 with SMTP id 98e67ed59e1d1-39e0d2aee44mr279567a91.5.1789456651491;
        Tue, 15 Sep 2026 00:17:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc7:b0:39e:d2a:e272 with SMTP id 98e67ed59e1d1-39e0d2aee44mr279516a91.5.1789456650899;
        Tue, 15 Sep 2026 00:17:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:30 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:35 -0400
Subject: [PATCH v7 09/11] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
MIME-Version: 1.0
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-9-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7799;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=AWqWG6VxlflSFSzoqp4jCeQqQPDGRE6cdtAKV5mteNc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bN2ca5v8e1OveLfdXJGnaNPYtSvE7u0ZfaLu3r+
 bZ34wedjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjIPA5GhvsT2X3ONTgYht2w
 PFdV7GCv2d72e6N528HrD34qfV4scZPhf1iB0fEZn53Sf//4G7ZHWFPCPPPUzfk2N9SfBk7cbHz
 /Ci8A
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX2dPIBbILPuNr
 kPctIXyPRcDcRQH7w8FAlbBYO/Px3LHl0pBF2FKVt4UKc/238gMrt3STIkmyjytJZQpDHAvajup
 pNz8DBc7PPS0ITneiaWzQ55zb/AkDf8=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa8f10c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=8k0796NHAHKl4oQHd1QA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: MOUR_30PmN68-agu75rFyjvHm6SLsL8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX7pwIUBjRKS/Z
 aKWJeedHW9xNOCrNKxfJcqUAx9SgnhktG2+L6sRcPG3mehRGDs5CS2g78bTCnXFX4m2145HKAOX
 q5ZWfjBzApRqj7/tv6Ql9ZL9OQnrO2XCNxlKWC7Qlq+NZq/lRxLpd36ex2XmuFpdEa70jw9Pp9h
 WWxF4jE9sXUZWXWdXxJ/IrlJVbDzZTnjLutrehwYjY2LuXQp+nHCmqAseHXwZgA66HBRxGL7Y1f
 eC927mU34yKLgyH5yZ3nGGsgkF9aqn42d7MxOODZc7dsACXTkYSgU4e0ZthM+q2gOasnL/dGWvd
 yr8+h43iwRJQ0EWgGmA+5DNRfiLWCOdf+d1+ZwyDsqh4Rc1Rpol+1jNB/ZN0uSEeliVXP7QgA9U
 0sGTneh+b9KnXgufKxgAZnTlLaN053VqJ0/XsQGqQl3Jf7iFSJGKWiJazx016KtG9cIuA0oT2UZ
 iCOxDy9PCSSjtvuHMHg==
X-Proofpoint-ORIG-GUID: MOUR_30PmN68-agu75rFyjvHm6SLsL8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_001734_145974_B0A1BC2A 
X-CRM114-Status: GOOD (  22.46  )
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

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as an arch_initcall. That is late
enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
populated have_user_pmlen_*; without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail. It is also early enough that
arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
when it snapshots the hwprobe values into the vDSO data page.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing, which keeps them consistent with
each other.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7:
- Register riscv_init_isa_bases() at arch_initcall, ahead of the vDSO
  hwprobe snapshot at arch_initcall_sync; v6 returned 0 for
  RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO.
- Keep riscv_isa_bases static; add riscv_isa_base_available().
v6: No change.
v5: No change.
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h |  13 +++++
 arch/riscv/kernel/cpufeature.c      | 113 ++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..89c64d42ee745 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,8 +25,20 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
@@ -130,6 +142,7 @@ extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index de7cff5f48c34..f88031660e6fc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+static DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -81,6 +84,26 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+/**
+ * riscv_isa_base_available() - Check whether a given ISA base is
+ * available or not
+ *
+ * @isa_bases: ISA bases bitmap to use
+ * @base: bit position of the desired ISA base
+ * Return: true or false
+ *
+ * NOTE: If isa_bases is NULL then the host ISA bases bitmap will be used.
+ */
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base)
+{
+	const unsigned long *bmap = isa_bases ? isa_bases : riscv_isa_bases;
+
+	if (base >= RISCV_NR_ISA_BASES)
+		return false;
+
+	return test_bit(base, bmap);
+}
+
 static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 			       const unsigned long *isa_bitmap)
 {
@@ -1334,3 +1357,93 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as arch_initcall: late enough that
+ * core_initcall(tagged_addr_init) has populated have_user_pmlen_*,
+ * and early enough that arch_initcall_sync(init_hwprobe_vdso_data)
+ * finds the ISA bases populated when it snapshots the hwprobe
+ * values into the vDSO data page.
+ */
+arch_initcall(riscv_init_isa_bases);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
