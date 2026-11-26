Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C11606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 21:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WwdYSccl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVhHlhXe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VxeD78iv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SGOWg85vGXbQ7O64CbwuNrvQfCYC466dpJ3G9UuclYs=; b=WwdYScclbNLNSH0fSPxBvONoan
	KdSeX81A1/322h9MtLSanvOeRS9F5DnZY4crRe/Vh0bcirCJMoUUtva39eMzVpk5kujSZGTd5iSTh
	e8jDAohKkvIRuTH2YKvmVumEIY/oDDvjwgOkWnGV2TP+IPdyaK+Oo8epyZDTug0Irl2JHE8jxiUzq
	JsWQRMqjcHiHEuUSJr/nh81//HNRwfs5ihg04bOnrM7Pw+PoSbwKwL/TXVdFJ5XFnLI/rlb659wcB
	FzrUA0oRFvJi+qzAuLNr0MjtRR2sbda7R3pcjslpNDqHvOp3EsA1/NuYOLUR1b416AQMBEXx0qJcB
	jxWj0fpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh5d-0000000EYo8-08HS;
	Thu, 26 Nov 2026 21:33:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh5a-0000000EYmu-1Ywp
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 21:33:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw7rx2354080
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvB/9LyPp1IHurY6PqxrQVZAOe2efDBvZteC2OZl5Mg=; b=mVhHlhXe/JPEGUZo
	Ea6Si0qCn+iqRvt3BFR2nU458Fp4E9RPkoqgIfjIIWsmop6kENBCPOuGV3QvmON0
	Fo6ddYEdEvoXZ3o5R40oJah3QBEqmpmNNANmqsZsJBWXLk4FMUddgPcEFfIAWNg2
	j53bb/Yidb1473rz426kFjtd8y78YVFzZVEtT21Am4BpA/RIXxofeC3Kq9RtzEqe
	HRxHZe8jr+tnKoJeCW68nzua/BCwbvEkNx8Okyd0RR/kOb6VMNhDdu1yPwxhz2rY
	pRcMNUgkoNcSJWehqkaTq5dzoSA5m6yqIZk7uKCP7Xjzs/Doh9OddtiEI/r5NvID
	JnNeCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7ttrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:33:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f09a37f41dso44444395ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 13:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795728788; x=1796333588; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvB/9LyPp1IHurY6PqxrQVZAOe2efDBvZteC2OZl5Mg=;
        b=VxeD78ivTOYCzMbEx+ydFi01wpWCRl4OIL1yncS3Ex6LPHNL5UNkSjG5k0xuYOHSeR
         c67h2jw1sdezz4V5ea13k9m3hUrbeNS8R7a5en71ft5bPU5mEBnLuvdnwYPMUTtoFbKR
         Zqe8nOWajGYdl9wio8n4UZqc/9bF9yMWWuJ/V52wDkz0ovausYMak9RfNZDqwPTRbQXT
         /lldDC7nd7Ob+KnYW1aqSoav9S/GfwBkacz3U8yi1JrVd2BvELjlghR0OVAp34tQFF1S
         aLqvx7hnZr071+5qsi8ggWkBmmvd/hVstkU4AyNiocinKyV6uCI+gMMCJ8+1SAQIAisg
         eqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728788; x=1796333588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvB/9LyPp1IHurY6PqxrQVZAOe2efDBvZteC2OZl5Mg=;
        b=yelrd7WBnV6FBlRkYEeukClIxx53E07I7kglWcDKaTJqZX6VA+j85R0L5HkrK/eFzg
         HKj9PcR/jiM+GmcIBwGYPSnCZMGLvKa6GIPicyorqNohQcEFsVnlINqdaXODWqCNGAU7
         1AA1BGAQ4UWWZTs8K/3GFxV8IUJ41gzAkIHHGoitKlhXKU8IsFJ7do5xeWWRRLgOP5UO
         YJYKUf9Vf/cV9awX7lPz16JwcYBeZlidDiTcYKWaFGk+1y441mes8nMR60VLy00tHkUD
         XrXzwZ/CknT+VQWRnD+GlOT02mkMDRdjyHG92pPU4xMY86NfQZWHKu9wOFTUBe1n74NL
         XVqg==
X-Forwarded-Encrypted: i=1; AL+hErEf5Bw0gBNdsm+oNiInlS3ict/yGIfrdaYWa2mca/wRLpyc4BSosF+rNYZFMhC8Atd3MBrzZqprLfSTmg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/PWsxzGH2Ao211108K+xaepxvCcnwSPqKGOcSgxAl+E4yyzuyK
	Tm+UaOTEqgDgnt5m4KnO5ACF3YxRf/IXTesry97gYfDTWZRbYQX7EivGH3OoS9LqM+SBPmbm8nE
	TxhQXJJqC1gC7Oo+jSdf35S8wDpzVqowsG40mBBWmWd5kY4MOKTGecdr91jC4r/uE0rR8LHY=
X-Gm-Gg: AZFdTZfXNgHPYehoZW94IAEVaO8lSQiUOgkOOJRIIM40rTKQVhEp38+pxBh41MkMWRf
	hArO5A29pO2zO9o0chELh88MpwL8Yd7786MTHH4YAekW9uyW3cfQwm1rSHSpSlZ3zzaofpRpr9X
	uFcvDx+n4VeMevmCzIPbXZsy+ZkWghyym0D95921TKg5uEEq8mUWl+8j0wTuRXlGBO1hfCt3Lfe
	wKCOkiR9kYf+JJ1ZkLB18594G4xncPpEeySJ4Gygmz82649lk2xsy6lldyO+Iwzo39CSCqbEB0h
	apoILY2JDPVTGaEJPVCzRY05IbuztSS739+da9u3PT8uNQ/ES6aAsjgQEIwMBuQ0fe/AuolEZr8
	EeyRTIHI3K9Zs7swgaY2afOBz9qsqkx9nXd+tcDEJ+DGRMThEw2zvjr1AmEKF1Wu1QKN5OMof0v
	VgIbiu//uL6Q==
X-Received: by 2002:a17:902:f547:b0:2ef:dc8b:7c0c with SMTP id d9443c01a7336-2f03f256468mr266662025ad.52.1795728788302;
        Thu, 26 Nov 2026 13:33:08 -0800 (PST)
X-Received: by 2002:a17:902:f547:b0:2ef:dc8b:7c0c with SMTP id d9443c01a7336-2f03f256468mr266661425ad.52.1795728787627;
        Thu, 26 Nov 2026 13:33:07 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0ebsm105273215ad.33.2026.11.26.13.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:33:07 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:32:30 -0500
Subject: [PATCH v10 2/4] riscv: cpu: Output isa bases lines in cpuinfo
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-rva23u64-hwprobe-v2-v10-2-bea130335fc4@oss.qualcomm.com>
References: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
In-Reply-To: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2930;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=KGFFI+GHVn3CUDWYcK4D8PXW10DDW9YkeGNfzxS/z/8=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhmyOpVXK+dE3M7IeOFc7c7PVruHR873JuDLBLGD182l8X
 Paqj1o6SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCIPdjMyzPgjr764b2/SHk/t
 n7Fm56uUTtTvFTGwffDv2SLN2P0X5Rj+u13btzfv9VOhz/VFJzv83ix8wG1dksgp/+5Jb7wxz5U
 FbAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX3Cue09jO9nrO
 SFrxeFxCIqD8gZV7LpSN5KpjV7HbfAq5TT/SzPOkCW8b7YwgxQPF3TsJkxkI3jRDwao5jVc1udX
 jSRlSqoqNQ7KpJ4hrSjzAp2Dj+C4DtI=
X-Proofpoint-GUID: bxcibOcitZ6qNmWCwTrOadYWyBt0nlY0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX/foJ04CpWTsa
 7sGTnmoznDUURnfYGaUG4zkcoHIZ6SnRY72EGdTvaKDfkSCLnD4z4mXm+UNnBGgu92mJ/1xSOnw
 RZGKb10UVmm1AzTVh3dfiw1hIPyme+I81RfdgIncWy6iIQwWHkmMlC57z2rmUjqUiKlhRrC6D8v
 Nw+hEXbbFB7ffHr+HPwKGE15wfA2mkkoTDT1iJKVxUaP6TZ/w1b6EFOgkZ6lCuBTTmKxjQMUCKf
 MywEabCFzs/Wa7VkGKgYijts+Ko0EQ+T3r6F8XuxUMtkT/iTGTVBHWn4xbatfO8utvcjHbQvqJU
 h1HJASROgOXqMiv/IQjgo4r+b0r59hWa1qsOw/SxxV9NKBW4szhfDnPs87frKO/OLdAzdqEjvAa
 FO6S5OeCXVpQgP3YUYYHkRbwlIYMkWpIQ7DH6Ib1JgDPeWMPo7ux+0q8j3nk5hvpneTbUGTBylW
 AgubIe6pR0UhiTDQECw==
X-Proofpoint-ORIG-GUID: bxcibOcitZ6qNmWCwTrOadYWyBt0nlY0
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b08a595 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_133310_543012_6209C6C7 
X-CRM114-Status: GOOD (  17.46  )
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

The "isa" line in /proc/cpuinfo lists a hart's extensions as
concatenated string, but not which profile base it satisfies. Add two
lines that report them directly:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on:

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  ...
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v10: No change.
v9: No change.
v8: Andrew is the author; add my Co-developed-by (Conor).
v7: Use riscv_isa_base_available().
v6: No change.
v5: Simplified the commit message.
v4: No change.
v3: No change.
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index af84b97af3a19..75761fc9f09ab 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (riscv_isa_base_available(isa_bases, i))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, NULL);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
