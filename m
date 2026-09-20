Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD94C982D0
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 07:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hsWtrQGgOsOF63ZuvP5xXqIq24yrat+YBn1Gj2lpJUA=; b=l64bt0FalcKfnb
	xQ8Ymd9ml9D8P9ObIUsjo+wjPvAiuImcZDe8o9vdyaTAaCQEgYfjqCVTpfYHKMjLeLpS2A2aSJpHh
	lt0c7523hb9lhQJlWKNGgtWRzX4pLE+65ieNJwWoOR0XAgOLKtWg0f2nNv91RZHXjwB1iAuJYIwui
	CFqcw5SBQRAjShIo0RS8joYL1lNmFFDKPeY2ZXso7b19LIWjSIJQzMF1MtuHH3YQx/iXsFgeQGApy
	V16ICSbn9bOFwgRin3qCDHqBEd8jsa1G5wbiatThzTL58guYWsSTE1gYOz22ohAcCwXf1CHPFGmve
	kCkS26NGvzN/LYxcgVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BqI-0000000H1bM-3aFK;
	Sun, 20 Sep 2026 07:20:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BqG-0000000H1Za-2uJV
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 07:20:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55hxt1477165
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6T5cYsgTvRzduRgb72gYHdCbpLkwk14QaTErBGhIfmE=; b=PD/ivfBkWOfw/+Xk
	7XROAGrQRMTa5IEgIW70TjHTzjou2z79BjXWdBXQw/6sJce0rmX2fH2maAckOUnO
	P+mRQS4Z88TyxdvPRSpOZcz705C4Rjz+tXc128I7o6+L5KBqdRE1t6mjkBbGhcIJ
	cUE3F4BL8wue83LTEvKcIy3skd30wvw5SizRCE4gENY9P1qE3wWNh/nf41YJE53h
	3oZWsgeidDpfYtWy9mRflfjBRDjqausjcqijyzTJxGKpH2XdHmPc8cO6QIvIP6Fx
	5zFTGvoQ/54L53pXpGDmVl9sFUhh7cncuem3/KDLlevxif6QLResxiFU+aO3gRWh
	dQDx5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrntu9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:20:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so26703465ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888803; x=1790493603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6T5cYsgTvRzduRgb72gYHdCbpLkwk14QaTErBGhIfmE=;
        b=T0mNDRnLS8/uUgB5CUHqZ/JgFSg/qRCMOlmHRhBnSIZ6M+KRZbkxSk7oRzIUy3kdvK
         5NDrDJy4ISFt/goAVVJ6z6UZXj+ZRHdVoeigjCGXMq7B3tOt1ge/ni8HkFpW1xzULAKE
         0b0osa1cFKw0RrGUDeQUnT8lBq73+BMzBSk4Yms420OiQM6SrczSzidhIJDJQox6MwIu
         3R8h7TNu9kA051lIzSZK66yHkhFe4KnXqZbn6SnthZriNurFfKpokLO44s1+6dLb+sLf
         5FjO+VDlzJH4quUKjXLvYSLlUuoNMbCyVws5Rphl0dnqKlTEDZxMlB0l53uZEFcYBnyg
         kMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888803; x=1790493603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6T5cYsgTvRzduRgb72gYHdCbpLkwk14QaTErBGhIfmE=;
        b=RCrOxIy3EnqHCHzC8gpv0nPVBfegw0oNAIGLBRgYwUh/hlSzOuv8WkN85zeUBItBOa
         B0OZ+iNTe6WQdOyjLzJTE2anXusT9Iivfl3S9z+Yatnz/yd5lFrrDPb/S4LAfDp4tH2u
         DYAZ0glzDcaKquPiFP52XewPSGtaYIf8Il4GkmWDhICH9NA92Y1+fsZCz/jnfK3UL+BN
         2KQoLiboMMzrS0MEQ1DoCtP9PnmVmxpRzwGtk3eHU3Gu2WgmMDaGPDg5u9WgHu4Pkh7B
         ZzaWqRWkT7mDiCHEetXxYNHarwb3gt8HFOxD5DKgEb2Im/gkEZtyvM89FPEVsaLSCoA7
         r2+g==
X-Forwarded-Encrypted: i=1; AKwUvByi2z7wZOBE/+ZxocfD2jGWQXEA1mOwAKb209f7e6EuC4UC0mEV8SD+BU8Amfxw3VYU/SYLLskDWi8Ykg==@lists.infradead.org
X-Gm-Message-State: AFuF++mBueOa9t79D5mS+hYMHSqhGkekL9wFT/5QLH0scsAivbQkCtv1
	ah434OO/wbhTTT6rCTx0RjkxgQv5wIMGbT29xyFK9GNsBOJYamcUiXm1AULx5wEsFRjyGQ8mC4m
	QqFAGo7xmK33UezHmc7nP1j73o+2CHBvDnBC85mc6ceUu/GBq6We3zN8Bki0IrgWqdalmPgE=
X-Gm-Gg: AYBFou2ZROoAyAVwBXOLLYJmALYnzBQcbRmoBaXrY0gvjKj4g9eikWoMeY1s7R31cGM
	9sri9PQfFuNfg6Ea0UjfjIrLrUIDleThT0xUte06rHqKFEZVYt8ZnE1Y0pidoA+0Q7TIdgaMtUk
	i3qOeUYtqN5b24L5cZb6A4PVxg6ZIYM6zW7UN1Ri6xs5qNI+0pqgG15Kz+Xu+uMgAWHAXW/gOR+
	BhNyPZs3GtIhcXng84Ydr52UdIlLHsRJmyIhowZ9sHWAafV3Kh6g2jfvA4u3OlWsjlcnAeAH3JA
	eXwIueSRh4p98iUXi0xz20M5GRmYghFOgwFDYOauUf6F1zU2yM4pJPAdSfc=
X-Received: by 2002:a17:902:f681:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2ddc053e127mr64136015ad.34.1789888802536;
        Sun, 20 Sep 2026 00:20:02 -0700 (PDT)
X-Received: by 2002:a17:902:f681:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2ddc053e127mr64135635ad.34.1789888801954;
        Sun, 20 Sep 2026 00:20:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:20:01 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:30 -0400
Subject: [PATCH v8 10/11] riscv: cpu: Output isa bases lines in cpuinfo
MIME-Version: 1.0
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-10-5f14bc5c23d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2897;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=JPdcEfltJd+KKaNtcEuE4Ci4m9uvI5VXrW1f/5ccPfI=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HadSOP76lkVv/3g653/Ys5TSvsvf52oX/tkqafyap
 4vNTGtGRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEzkfTnDP0trJz75AE+tyQ3p
 19sPHojj2Gs7bc5B+/oYvuNPZht0b2VkuGEbfNZvpc79kNqPq3zsZ9o2P09nlFof/SxcwqK75Ec
 TBwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aaf8923 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX9U0zhHav2T7S
 tGo/iXqoEaQ5Ai5CEl35qxj26plq5EZssH2USTAznZrc+pS69cakiUuFwpaL/sk436y6EYFyawJ
 Pnx0RNeDdrmsMxBu0IOtWsGDgtRIq5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX0l14e10PTLQK
 XA9+EYqrFTwoMNJj6dV+rcFFknZun8BYXcBC9MqNBwvmR013yRsxj+yvIxpIwQGgWQ/akFd+T+0
 xLVpO0IFGCMnBlvQVi9NOzic2vKZjOYZvEFnmaX5VAvtXb/v15g2dZaSlwQujJvyFFGrG7h/jny
 aY3v+cczmM3xQdlaZoMchEg6hZmLOr50OVQMbwCQ/OkHUFhJH0W9cGIMa5P+gNpvzEBMNV2lqvH
 KoFBeYlC8wn/VSwu8JB3SBA01JI24/Z8lFAsKCDl4rX7KpfRMcIv+MHatHceTTTKXH0TTJ2Z7n3
 m3MoaLzYXiv52Bul3aSztcNTdJ6f0DiR08vYE4y6aFjy/VEQ5yL1WMrf58t6PYFYu7cxmWSE8Ns
 mQfZANt4Q+zAHuzuDU0xEdcrN4dQttQkW+Sr7oxO8tLkk1Qz6CdEulDYRfSmg6wn32Li/gfuhkh
 Ji0KGJiZuf7UbZHVg7Q==
X-Proofpoint-ORIG-GUID: 7e5_cyBDh9Z5zGKr08pdMoX2IBjDJ98O
X-Proofpoint-GUID: 7e5_cyBDh9Z5zGKr08pdMoX2IBjDJ98O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_002004_854736_075FD6F1 
X-CRM114-Status: GOOD (  16.71  )
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
index 3dbc8cc557dd1..d06824048aa25 100644
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
