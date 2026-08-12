Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCBFC5CFDB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 23:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAclAx7VKQWK7imQbJZ5EUIeeLvvVP8bZ+exVGTmPLo=; b=FW+PPXTB1bUly6
	9SQddhrsPMJB8hIW87MxL1vaS6d6G5aV6kKVjDScp2R2dZ3Z0GS+E4mbtrmf1ABt1jnyJyKmT8Rqd
	qoVq9xBloHw5K4XV9K4MswtnKLWf76zlEcQ4YkLWylT/LL3qc/GrnC3Fb4UMp4hZmSqjq3i+dIEr9
	Qvn7OgS15CoED8hv9paP9L6ZqmfdLVGUj8EDz4nALWwjLzTFEBZjEIgiX9AJ+mVwnOi9KHPeuHzFD
	W0R4sRRjRYt9dhcUfLNianAlY3GjFijiiTLBYud9qUfZqmOM9mkT99SGXMW5VwH1e8HIXxeY4ZDLm
	3sgJjyzGt+5Tplt3piqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIUc-0000000HA6o-1PNz;
	Wed, 12 Aug 2026 23:36:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIUY-0000000HA3M-2Bx8
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 23:36:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMWn71024425
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhUu0uSzo3AfsrNzm/Bks16Jnk8npDCjKZIoNK46y9A=; b=HcEYqNs4ECci+xC1
	Gik3L6KmLJ7Qx5QtsCNKawHOJhDsK1/P1WSCu+5KxvKJ5ckLHHTm1TcKejGNXcFk
	z60tjy9QCZn9e2yP8sKEe21/F7DDMQjJ3UrRNKjOhugw1gACTu0wbN3XQFPbLCKD
	2IlIoO+FBnhlWBYNO/YZ0yR13W1QXcdjye8+a7zI3jhgL+S022vpbPMZmQ0tbdrH
	qqyiEZ4zdDoXjurmV8yx9poIQhZxPWk40gCTcx/+kf9rwpJSn4dk9sR0wXojuMDc
	j5mKAyX0pHSjnBCRF1eI8MsGQfZkl1MQ08kw4jwJuzXpbCoRmYPwDXlkOOOWRK32
	pOo4HQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0y04gtjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:36:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfca8558d2so19791985ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 16:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577772; x=1787182572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhUu0uSzo3AfsrNzm/Bks16Jnk8npDCjKZIoNK46y9A=;
        b=RBcGP9hExPk3vNcWgHdiBE2ShP38Aw0jaq8nq7+uAQOG/Q/cXigSuYfIN40thVAfGY
         s02LiTBgEzN8kpEPgu21FICBiwHwKlPIXxxv3W+yMy5BwZfCjgN8LSq3wNMgV1xirDeF
         7IHHMOCYUJ+7BNNttWszFjH5IwHerxqVGTXKEoAuXg6oXWu5wVFlwWO89UqK0HrFrMri
         S0KuRohZO7efeYSfrGZlGMuoyK4BB/5e9KVjGSHUsapPMpsTpbaHDX5sTIwf3pVA2kYW
         ca+rQA1bbySUkvD+RDM0d3cpwNEurXHVKR7YdOnJSsXgTFLFodFjf+varaG9iIQzKXGr
         csJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577772; x=1787182572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhUu0uSzo3AfsrNzm/Bks16Jnk8npDCjKZIoNK46y9A=;
        b=ov839tJdaaV6YpCTn0fkwiwTeaQEtJmVrX5XVpIH3nXMHTDJFZjAVo/pe2xIudAwiM
         TwHNbiHmEwZn3CzNrZAppZ1x5nobcTCzwvHPpjCjwhFbdRwVARbp1WQMwWWP6oQ15q3U
         IS+2fIjHsMBSwDHe8eUsFFBtm3sEaQburGggvjIe1B8eNYjaMxSqtNCBljazwhzTYxE9
         QmXk9/XsKxoyJqGnExIGa/Qvj2kCsVRKIUS0zpwJzxjswYOwryTe5s8K5A+ruLYPtxuU
         CeVQNN+Jit4k0Vb7xCGXR6+KQpkH5fwuJOX+O3q0UhMF9ecQo7kbzw0aVWS33yq3LL19
         NlKA==
X-Forwarded-Encrypted: i=1; AHgh+RobBiTqUCqF2ej+LXI/Q3blzRo2NP7L9GNqQAMLMw3X6Z4mnKLy3nw9qj+ju/Z321VVXcazrpnltCJQmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK4WIj0qBp/UqQUw9cXZR2LgcqJva/0JAhtTmucWNPfwcuxYNV
	75CqN7IaAAhMk3rLv97lcnGT2WOoWliVsm3f2TTR6RWn3u/G6Q0qj58IFmS9d+WNpCKy6etsVEJ
	8DdhKVs+FP7l0nm3Ycev+3FPIsYY6KkkzUwLJ3vSToEIy4tilk69Vb9gy5ppr6Imt8cf3vjE=
X-Gm-Gg: AR+sD12BbnAjXlO6qJl5SFhyyT3eev2pNIc4UdsAkmkkeiZWPrbDuDD7xrMjUpSCcIZ
	NjKGeNAbfHg6Y68Q1mtHu+EWbZohPGJXc96/HsiqllBmIZHX7aJ4X5Zuz8oErmOYvid5tKnktpZ
	M+h/0uQswwXal5fKXoZDJDFwKXYHYsovV3z+K0TbufbkOLD2UBLzZhGuH14KiZScE4qr64UwRRF
	76qD3Xvi4SEcsjKnmTjkTPWO+gap7yZdzEGUFm2ye2jnvgrVNED+NWnDN4H32ZGnsiwK4HXP82C
	8FeucLYNVmc//SSJun4mGkUz9NaWrtv7+F9MTRNznJbq0np3DstEDZuxmHUDJQ==
X-Received: by 2002:a17:903:3bc5:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d37ebb2bc1mr21037505ad.17.1786577772129;
        Wed, 12 Aug 2026 16:36:12 -0700 (PDT)
X-Received: by 2002:a17:903:3bc5:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d37ebb2bc1mr21037045ad.17.1786577771667;
        Wed, 12 Aug 2026 16:36:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:36:10 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:56 -0400
Subject: [PATCH v6 10/11] riscv: cpu: Output isa bases lines in cpuinfo
MIME-Version: 1.0
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-10-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2735;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=DiWwiEx9V6F5N4m+1J76YOkAHoc6sfST7Sl1jsmaxE0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrFi3zn2DQpK0zelWy2YsPdA3W7WIxqsX13WTbqex
 3Rw9tzEjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjIzRhGhjX3nrnVT/5T8WJW
 8drt/96v5Ju384TRVZkeMZnamgbR3b4M/8vEi6bKRhc0n+m2r3p0x0b39WoJo6z0KWEH/XY3n75
 YyAMA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MSBTYWx0ZWRfXzqMT9qsFqVSB
 KpOjZ5bRYnAuemuw/ZGZlIEX5Vu1hY+RFg5G32SIrzVYX0j6+5KM5Bsj6FtPv20ggcKmCw6HXcT
 O3eXZcJQJ9bh/lE6vXs28aXfmEbKKMGAsvXDpI6+sddzJ+HZT34n2EMDL12txNwXc4OODN4EBvw
 pd9sSl48JFfMWkVacJlRZB/IXyKcxAOmBju3D9ckJyp2uOXDxkE/8H7VbABo3bm8gNEX+fOs6gm
 hEjmicXWoxibHagmEBCM0RLZho5xnFe0rEpfaHIK91WVBv/xzYh3pEVhBqlB7ty55A1ZuvuxqsB
 4W5r81wp0evEbZfDtULYjvebYgffVfD3iOrIU1szvKEP3ORVzEc5RGKh1rSrhCDY0qgb7UdIJ4e
 +tM3IfzL0AFvcMbDfFFiXn73xfGVAeVfPnwUx7D3Oqz8Sxx9aUGQQ3Wr4T1+phYCV4LvktA1V5m
 YOlasw9Patx7gz1xA4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MSBTYWx0ZWRfXwyzP5GNRqbK4
 BObnZQttIxj7xYLs5i93ff/lb+upwxU9j7xQfxvhK+wLZbYpLwvIbZ/XRifSAGTBpShGUGpGdqG
 Xaa8cvGIhXdtEwnNbzHUcjpDGbrP7n4=
X-Proofpoint-ORIG-GUID: yJl-jJVCFIXdiGY7NvFOFXsvhBSMKiPY
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a7d036d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: yJl-jJVCFIXdiGY7NvFOFXsvhBSMKiPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163614_686118_8DD76B06 
X-CRM114-Status: GOOD (  16.44  )
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
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
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
index 3dbc8cc557dd..31e2857dcdcf 100644
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
+		if (test_bit(i, isa_bases))
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
+	print_isa_bases(m, riscv_isa_bases);
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
