Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14741606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 21:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lCYUSxpw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oalIg95P;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cBX07pYe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=90zniJWL1x0+Go8tJ62TadnQqSvwdnNSznWZt8VBRUE=; b=lCYUSxpwtX3zp1JFNRb1mIIn3L
	GE5HqZscFsSYxQPkIAhGAPI7bh7lwue6rv7Sh5bdVcS1Q2A8bORJgWlCqY9gCeIWlMpFxFifXe6oR
	XrP4wNgtc2rdyBvgBbF0kZUWAaqTNvGvHRpLYk3ye1ShUBu9JOkHQVAiV01tAjwSe4CS9wfX/9/QR
	TGVtXNCsB4m+pAkXC0/S9ItFDJz7hH0Kcmu1QJkBBxeS4FgTEEZuVA8Wp8U+7oI68E0aQAgGkd9jg
	NTxD1u2u6Y3a/CAsLU7XKMSJj4ANz85jR5QBb+Dc910p8VPnVzYM/NX9gAm4xRTGzWsrvpyx5WJID
	13II1GuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh5X-0000000EYmE-3qhR;
	Thu, 26 Nov 2026 21:33:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh5V-0000000EYla-1Zwo
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 21:33:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwEKZ3990401
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbF0/Zpd6D8zEuprgKoW4WGKvrtBgaY9AIO1Yxozo/0=; b=oalIg95Pzq0SmhiQ
	+tQiS7aCTQKINNLuk2CK7fbzH+oZBTyW5rzTTNg4e+efRGOFGi0mwPJYCcdn4aaN
	hAQ+7Wm52xvAqgEcZXdOEz5xgy3vtWPb+Fyd3JlNy7ZFD5tGwZA7r+FeN52H3T7f
	3feCKIc1l97z91Of8BTZ0sNOjark7UBCSRCmK2SyG9IBHXVnL6KHcgLQFb/oWPf1
	n+Bvulw2fza341USRsMQm077cgJK/Y6wV08qlGLHGh9cvAqBSEC7GQ8b9hjj1zMs
	DXmVVZ9QI+vF7YZBQYPwCoGE8mvivSFCQU8snRjeCXKJCEmq/Om/sLlsuL1SCwLk
	4NN9wA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak03t3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:33:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso5637896a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 13:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795728783; x=1796333583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbF0/Zpd6D8zEuprgKoW4WGKvrtBgaY9AIO1Yxozo/0=;
        b=cBX07pYeC1VHsx4MFxy8GV8jBq9HLQSrUeQSL6oPqrOQ1AKLNMBsRsO3xXDDHiVrsx
         xFN2wPN318UMyRLTFXg6R7vq8KXCS7R4+SKbKKuJxqPovIXfskwcFRWU+DeOczy8lgtt
         CuWBImY6OPJh4UViY6kcxEmjeeLnhdXmmJ5wWUNfZq9GOiY5Chn+pMHhgknlPMPpODT3
         iuj8g+h7vTRsXP3f1UvZ6Ov88Q9xZAWJHCAFX90+DZIWyKeTeM/YPm2wHb1EBK185LoH
         NbV1WrxB/E+k3akPmHEI1EeY0LFnte3P8INF+/Hq3MT9e3NkvGtYPLcT5gDdHygZm0Mm
         zS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728783; x=1796333583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbF0/Zpd6D8zEuprgKoW4WGKvrtBgaY9AIO1Yxozo/0=;
        b=QoR6PEdORkkpPTH2V4oopMr0QqzDd20v8/7D3N5P22c/ynbskyHp27QeWyKeacEory
         GCxNy/jbVr3TbV9LkR+ZePjZM5wIROXtoCIuMd9mCH9Gk7HoOQaWukeg+bWLjkFGwhYL
         LIhUO1mCrI1PXYIdWCcjQiCNjxiB+zZixInyzXha4hvPHdiQ59vUtmdzskzbNbY3QfMK
         xEqz3QfEs2whalae86oJ4mogBUCBSPxGRJedCeIUMk0m+eyZP43tTfbbfVM2Zcje1BNS
         yw0W3DMQ27lyHWy8WX2JblR/D25HbyQnV6MN6/TFLsfiCPmmKpSkQ3wJF5oamCMVn1C2
         XmYw==
X-Forwarded-Encrypted: i=1; AL+hErHiJT6Do1cNpt6txYkL5JbilDa9lez3xUgYm8jmUK6auX8KuV9IwqgO0Mio2c7dHA82oomI+hTV/WNNaQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z91t1/fmjyVM+uIfPIfPrIh8/hQnt2oHY1MZr5ZyFzDDKp9rI6Y
	6KGT5d8PbKmJrbuMIBNh8tlofFGdzNfgXJzbKYDEyhSYd8k3jnZdR+NQpade0Kqo/qPWVmANpcq
	HJTAfYwbUJkuif0SSFdsYRKs2jlq4SmlOPMZY0AqjOh2iaTt4c7wxrtE78L4cPjeX+cQK/iU=
X-Gm-Gg: AZFdTZcY9ue0hu1z6YmiafLzFjIHnJ4rp9quG575hcw4v2wB8v17BrKcMbzStqJ53b8
	HBoc+KY/KhpMXORrdTK4IKnjCdrzjvg0EhWSA+VmYEgf93pgWviAj/T1+ITr/ZYWLCJjB5o65z/
	etn8JBPKEr0imxP/nkhA8f45AZe3J/xOpmIMYlLgOKE5gvl0ZBkK42rQ1GR79fLDEi7MFnxKWPT
	DIBxlLkZvz3H7XF4afqDmx2PXMaUVz5lkgk2tJchcvKH57Z8JLE2q40Wg/BRSIoJ+ca9m19+7ZU
	yCqXi3jUgReA+20seg8c0yi5FkjowBY2a0BfnoRF9lwUDoqwPP7KC1xeI2kOmH9HLYZRJiNDDnw
	99hWwOkP8XuLYSty0ttoJOsNQHWT2juYMBw6S7mRnf2BGI+xQAjlZEzM5ffqrUE7lKdPt8CUgyS
	nBR/Z6bXV9Pg==
X-Received: by 2002:a17:90b:4b05:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b41c911c9emr20098471a91.26.1795728782994;
        Thu, 26 Nov 2026 13:33:02 -0800 (PST)
X-Received: by 2002:a17:90b:4b05:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b41c911c9emr20098421a91.26.1795728782345;
        Thu, 26 Nov 2026 13:33:02 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm10988078a12.12.2026.11.26.13.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:33:01 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:32:29 -0500
Subject: [PATCH v10 1/4] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-rva23u64-hwprobe-v2-v10-1-bea130335fc4@oss.qualcomm.com>
References: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
In-Reply-To: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7858;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=lZWLb7/5VadHhSu6m/BnO3hRf+Bmv2pwYJHFTEmRVE0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhmyOpVU/BZnb+dNd3Yxvhmkten3k/LEl7zjNzRJEvt65v
 jz41cmjHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCRwHpGhpfff84tcux5b7iu
 zPXb3K8/Y2adDpc+HPeYJ8JG2S5Y5xgjw/K7E9ymbD4Q9HbGo9IMw62qse/PLg779JG/R3R+iuR
 sPT4A
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b08a590 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9qfSqdpAuJX0V-etOtAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: UoaHskoHVKh-wLq-NkkyaXTq56I68i_T
X-Proofpoint-GUID: UoaHskoHVKh-wLq-NkkyaXTq56I68i_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfXy/fLVE6hNhmn
 vyVWdAtQ5iPya9ErDBIakodCUtGbr+Ay01BoTy6bONj8wMgTNwSas1JJ/7cZCoy0gg6OMsg7lXe
 pjYFfXnbrZNBka/cixNbu87GpKnV6WbwhqA3PsEh8uCeBT9bYEDHA0ieWiNvMgVwUh+B9yv0ZuX
 c3CXjQ2XIlisGqbyPRolvZgV6sO0jSDxB5mTX+0ZPGRBNnuDZ54lfR/HIvETAHVkWyXteJj/2e2
 YB/bUZ8dTuGnei0/oDhwmT3K8w0+KJbTf+1hnyilM7EeArntx4W0h+3hH6tZ1xepaIi2u6p7E0b
 n/hpjz/LHBrtDKyd5z1mhCKa/KhXmy7tH9Bj+QO+FvtaQX2Upfnvp9KHeb+l3nfH3m99k8YrVoM
 6IBrWKj2K3aGZFx67BX+8VNcyZPB24GyBRgTNkweej8QNwN28cd60waTZ8vCBS32WR7k13caUFS
 w5dQCgW+yhcigESiaug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX2Q6wiONveeNU
 IkJTPn+R2yi0am7Si/sOzLzEjpqbriu/+s/ZBGtqCFlHXEdYCe5QQDmVyldfU5o/jxl0aG/xf8V
 2uo20IgW5LhL4bzhv4ZFXezqxdnv+VI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_133305_565474_D2484F35 
X-CRM114-Status: GOOD (  23.12  )
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

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profiles such as RVA23U64, plus the IMA base), computed at
init time by riscv_init_isa_bases().

The IMA base is set unconditionally: it is behavior the kernel always
provides, and is intentionally not derived from the I, M and A
extensions.

Register riscv_init_isa_bases() as an arch_initcall. That is late
enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
populated have_user_pmlen_*; without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail.

Consider this as the cache that consumers such as /proc/cpuinfo's "isa
bases" lines read without recomputing.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v10:
- Reword the commit message and the arch_initcall comment: the bitmap
  feeds /proc/cpuinfo; hwprobe derives RVA23U64 from its own keys.
v9: Set the IMA base unconditionally; do not derive it from I, M and A.
v8: Add Co-developed-by for Andrew Jones (Conor).
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
 arch/riscv/kernel/cpufeature.c      | 106 ++++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 99799cc6c1984..2ce1a1e212c9d 100644
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
@@ -134,6 +146,7 @@ extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f1..d63a70c387019 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
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
@@ -1406,3 +1429,86 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	if (early)
 		local_flush_icache_all();
 }
+
+/*
+ * Compute the set of bases a hart conforms to. Profile bases such as
+ * RVA23U64 are derived from its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* The IMA base is behavior the kernel always provides. */
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
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
+ * core_initcall(tagged_addr_init) has populated have_user_pmlen_*.
+ */
+arch_initcall(riscv_init_isa_bases);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
