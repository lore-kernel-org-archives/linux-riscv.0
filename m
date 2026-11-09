Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64612606EEA1
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pfYPC3/A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7GQ5ekV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WoiftzSL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=11+jqQU61tSzqg0/Hp6b61qJMFEwxls4wbfiCQ843qc=; b=pfYPC3/AYxFfR5K8XIp8HNjc7U
	StVY3EIVtOr2R/E3mdAa9msgXkEaECqbAO2/sdz5QfgOqLC4U69J/sV3T21GKBqpB+wFVwClWbGx4
	28Fh4Q82X/rPJXVuo9YGcCK3hztHJZI37Nlz0pRv8j4I7wr5TfliRDgBdiBxXcxVxMAeay9GROb9J
	fRk8PCglXjgXXjTHEAVJIQqQzO0wNnkZY1sPvZfkMQt4RprFQ8AROR1ThwaczR+X7jXbHmUrXXJgj
	0N/NPG8qmprKZbG8DEjQGgZ1MaVqPydMU+fvgqezwc/vOjouA0cfqncMathBs/O2Y7GxA5pyco+jB
	6vJy05DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOn1-00000000jXy-1X8v;
	Mon, 09 Nov 2026 12:47:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOmy-00000000jXL-2BoI
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:47:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9Auhl4034262
	for <linux-riscv@lists.infradead.org>; Mon, 9 Nov 2026 12:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93Ud6tX5DUmvunUc03btclwxbqnXrbA4BzkJ7bh/H78=; b=Z7GQ5ekV7pUUF40/
	bX+P4gyHUJzsZeV5lNnPLBzus5l1FYGb8gpJ6zSN6EhWWCknbY9eEZhTEuZvZVhj
	a9iL2J1E0BpjinysqV7P7D9SDmk+V21ea9bsVc4VnbQSovxckpS6KAj5xKY6pRIV
	cUrY5B+x0g8kRRzs6YN+BVcYNIPHpY1tW0ezQUzm2jsT+XHT+pV792kVtd8/Q3gK
	mBPQVxeynpSn1EEOZHHwkavVyLWHMWM3ARzjH1fOOp0SMWiCHsZ9/Jgjva+QPS7i
	6UkRST3QP7zpZTLXeTrnkrTpiF/Dn/uzUTwKJ23zhJgzl/gh/7CF2jgicLQ2cdPa
	lioS3A==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rc2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 12:47:55 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b2fd108b28so11314317b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 04:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228475; x=1794833275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93Ud6tX5DUmvunUc03btclwxbqnXrbA4BzkJ7bh/H78=;
        b=WoiftzSL25fSHWIef7yxTrnyiM/lACMtMbxqbY86QSYDpaGSB4sYCWQ6Qaz1oSVa1u
         K4O3IJianvJyaBJDrM+TturobGbQcXliJTSMdAaFEMeSS2ajR0LcUuER/52fYowv3G95
         JzaP1eY04XvG4AYk2TvogsSHux8L9jtelbI/LCbnOYvL5VjTZ66gtqYHRBSGF9oOXDfc
         c2mNPcICEilh9oWrXyj/oR4qocNJIGhZ4azfiXlJk97p8lWb5/frIgWuz53MgUG/2ZAc
         zktm/UCKQFs9VdZGQb+aQ+cZ/A3LQc0aglyIHitRmwPO27RbWnh4K86kMa/WyysRhw//
         inGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228475; x=1794833275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93Ud6tX5DUmvunUc03btclwxbqnXrbA4BzkJ7bh/H78=;
        b=kF1RjhM+YeZnWIQdoMS856SKEIsG48uZ+GBEOEqSRqdYjiI5bE/zyh5NWBEVOZwLPQ
         B+nL5H92Fwqce2p7jBHHqToKWh9ck88QKxRC0UpqFaJDFfO2rvGoAUzQTLSavnh5zdFz
         4YCFb+nRO/lq5+bQqnajC79dByRW3LrgPArXbYNIMG5YUjqAhnE5pu/yuusHP2qPh1AJ
         4nJjNrwzZFW6WfnsmleopN7daOpAJdoQAky3LfwZWs68q8VgKDY4Ba9ZuIAobaK0Ebbk
         vlLo2CrCdZpALPKaeRHQbtaHCnKE6l8SDT43jo2Kzsu6yRMqu4lQAX1PVUpX/ggl7YOz
         qKPw==
X-Forwarded-Encrypted: i=1; AL+hErH1BixR8SUxTUzHAOyls4Vz4OTykTKUqvHgy7wSU9c0xcYbt/cByP4ZJRbMYqubYUu4FUyqb5TAOa3Ojg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9z70E3G8CJ2YRUMhBoF8ZTIZmq0ov6wP2KAe9gRm0hdgSXUV1w
	QQtDJs2EeKTqNZKHKmtr+lMuKXnTrSWVHqgTp0YjUUg/GopfwTZ50ZmCwdfNN25LsGYhmnuyIEc
	Py8R7yWcHYVIT8L2pkB+vSJt0N/+FpvfcM8joVY9K3JrmproOj2FzdpV4BOduj62s8XajMDCAKl
	f+w+N4Xg==
X-Gm-Gg: AYBFou0MJ3nenXSjUUP5xPmUs+ROw2F0OI65Bp4oKbyG6knkl429z+0JQEUV8QPwHXd
	pH6v4uiO4KMFArZNrKRemTwgzQsXlApjgDd3Up0QjWjaM9DowwRic1J0pBY/r9r6n3a1HOcpzUK
	GcAsAeQxIGRU1kjYJ3bU9BMj56/1ZQb/2eJe3NKOZKMwTEcYHLhNub1TnUh4dtyoGWyklwA7sJI
	O5OSxBVgR8lWIF51Tnt0xJ6CM7IX0o94kcMSG1VYrVsrd9cRWR6yerbLXwofaIgR9Sgb/wTtl6q
	Yim/AmXIM6KJCeM0T/aJlp/ksSBK95TuV9Cc7iVbMxgUYl8Sr7luvumb3pnFoA7XzTxoEZbHysa
	KR/OEtUJbuvsfPTXRIKWqEGDzC1rRtUoSubYVSZ1drMDNujoKmw983t8pl1AjeAoyeW8Socljdr
	9l+mGs4j1UYw==
X-Received: by 2002:a05:690c:8e14:b0:8b3:b01:74d2 with SMTP id 00721157ae682-8b36ca33a92mr13349987b3.59.1794228474614;
        Mon, 09 Nov 2026 04:47:54 -0800 (PST)
X-Received: by 2002:a05:690c:8e14:b0:8b3:b01:74d2 with SMTP id 00721157ae682-8b36ca33a92mr13349727b3.59.1794228473849;
        Mon, 09 Nov 2026 04:47:53 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbe3575sm34080897b3.23.2026.11.09.04.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:47:52 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:34 -0500
Subject: [PATCH v9 1/4] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-1-ae846c5c7178@oss.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@linux.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8142;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=rFGx5xnsY6+CYs1od16ASQHM/wmyhX0GFjExDJkqLds=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB15bsnaUpLE1cdVHh9hbt027vYtDvt6Dfe4Zn+jGL
 by8HrwdpSwMYlwMsmKKLIePtmRvfeUT7fuc8wfMHFYmkCEMXJwCMJGIBwx/ZaLVBE52r1s207J5
 T/2FL2en266YJJUzObbk98Ztq4+d/sfw35MlzO3Pvu/X1h7/6DJl39lX7B0XWB/9rAlS1XZs1v1
 QyAIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX6eUxCadk/WGl
 YwJpuG1mN9Pyzgd7QzSV+/zH2KpT1jtZw1fdV2JiqcFOPKkx88RsY6jMG5b8e5/3MjVO3PMza6c
 xeAeSYHWIp39ZFXnJ+AFMpe3J3KaG0w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfXxkoD/X6DC1yi
 NofLhGBEqiQ0IM1c/UB+64ea85YyaARi2Lr/amufrkcs4KUi93r51mbmenzq0ddMa6faAsmOQyz
 CsxH3bCjZOxz3tSbt3h+Kkmx2AHt1R3acBklFSnovYLtj5gPNRSkNa4/n9q+1VsZ1seJD5Sxloo
 pimWfh1LDakaDG1kDkzFFR8umSsRi33rdb4+ZkfhfT9tO/mR17TE31mBXtbwTay7ceaz3tAIFTj
 9uUwfylktGIwCjqRNrVRju/QLz8WY4zhgzWc0Q/m+3XAmNHxHuft0JjW+75iwGTiag8JjoXa+pV
 2bfVujZBmvnSGhdfAFP1cijZZX+CFm1FoU+B+xH4a/VMG5EliMIGD1bJQeHVCRQJEjmjPQkKryX
 POSAhAq5p6GX0eGORyizPkn+BWDEG0/ZBojD+1GO9qL4abd3+IdwPasGtql+8Pv5FCiq2jcZ27Q
 xmYbTTef3ZkQdhkHf2A==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1c0fb cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9qfSqdpAuJX0V-etOtAA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: WmAXLwi1_k07o0Q-VnL7yE0NfD_IevOW
X-Proofpoint-GUID: WmAXLwi1_k07o0Q-VnL7yE0NfD_IevOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_044756_585255_2AA16993 
X-CRM114-Status: GOOD (  22.75  )
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

The IMA base is set unconditionally: it is behavior the kernel always
provides, and is intentionally not derived from the I, M and A
extensions.

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

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
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
 arch/riscv/kernel/cpufeature.c      | 109 ++++++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 99799cc6c198..2ce1a1e212c9 100644
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
index 72bce616491f..0377fc148785 100644
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
@@ -1406,3 +1429,89 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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
