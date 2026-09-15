Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8D7C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 07:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FNB5qTkStl48/qBnLdNhrWQYxmIahsIXlx9JCCduII=; b=NgsTqvMyyryxz/
	EtwI7LfGHYnIB6VOwStmzliakaprt+9E5LZBWDl99zTNkAtQtFOHlh6mLHRqgCqmx6g8lWWmFPH79
	KzlTBxw6CeUs8iOpOxmZJxI0n8FsXleqm9N1/6ZjIlveTVSpY4ZcWeVZAaz9i1qAg0NK5IHVg8wNQ
	zOtbtQUrlLnP/zUZAhyb+46rJsN76t6PS+1n4+8965Cszgmwv9HWg/EbYSaYdKI+iXcOLklnNahj+
	d61z/O4UP+O8+OozRY92rdrxa593t8D73PluHhPLC+U2koCwwYHmFe8us/+d2kcfRR3IM7fDzKId4
	N0yUoXyMr7AMjcZH7jhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NQK-00000005S0b-1KOH;
	Tue, 15 Sep 2026 07:17:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NQI-00000005Ryq-0lpg
	for linux-riscv@bombadil.infradead.org;
	Tue, 15 Sep 2026 07:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=; b=kPw2v+1OzhruP6hv5L68C7z/iR
	TROXo5VrXDn41PBFuYvwbZAfBE9QAvuUOeWSN/EkZ1phs5KmCyRQ20Q4TeZ1AZ1K7bQO6hV8xurY7
	nrZ3F+PJ2zeIEc8aGLAPvjIpkwW+7zPmtClJKa+/ijBtYOXd/cz8RvmN6D6AI6G7pT2u10ZZ7g9Rf
	u+wXMGGAwhQu42wYWtn7WlAZYJjv5bxTra0KdgPGfGYt3csHypKNxrsl3220OWNKteuUaIfpqFVsv
	7b9XY5r7c1wrQ7UhzO/94l8KsC3DFeI6Ql/DGQaW6cW2sbVgFDP4F5NaHJ8RYOoivgqrptskXzTGn
	NMQUB46g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6NQE-00000006MPz-2sqr
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 07:17:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z73I3486855
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=; b=ljcbxh5gBgC5LYEh
	mseWdzdISqshcJZLWNVvf9ju2i3w8FWfDrKb9DcuIPRj0u1JpTht2dqfbYnJVnlP
	7qKI7IE/NicBdV5NDBMtIb9jvQLz7vncAQmsc/GuhP/KM+i+wLk9/uBpeoDX9OCg
	KbsTLB1GKVEz4ViTD/wgCd4ojrjxl5Mqgxf7echK7ORomS52oGF44xZhBKQF88zK
	74sR56TwfOf/6yEydMj1N4dWUqYZ3caGzi7s8+MP/6YNaB2niqaPzco24wRrFeiU
	9Ku+z2kFa8Lxc7BhlRJQt7UpQHR91n4i/h37wTuh9lwwn7g57S7wOtik8vCSuQR5
	WY7m7w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jer8bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:17:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so5599378a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456660; x=1790061460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=;
        b=KNm+OZM78GUNrAXjzVVX+b4OH26DwRN65cJ9YTjGAlOMMu/YcYM6G4owq/MM0hNQwQ
         Q1pxq6qSXTDrBm4TRzN6YX/4B6ZJE2PQl2b5QOgcK61nN2iXwv2796f3yEeqTm/O5d5h
         Vg/bQMn0QUVMHa4u5EhPhMxx1Trmco/UoIYN7L8HOYt04R3kHA6rBR3JwWG4EYCRwOHl
         YOO4Vc6q1s3D4nSOmC73nsKBdKNkqFIxWNeTUyfsfQgPdxiuMo0x77yWEUiJp6o9nXnT
         +xzHlKmjwhelmXKJ07dG6DkG6BCMfAG0ZBKFsdc8kTvh4DLsIVOeCCS9S5+/AC3AHKon
         PCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456660; x=1790061460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=;
        b=OYKSPNT9uVjfha5HW/maSiiOECL+WCpYia9P1M4NuI4aL1hPxsKQuroOo1AbhuSX3F
         wvyeFUFG3kZaCflluBi/LoU+I2TnOZkQI+1D0XRCHmFaTslmZOz1Q+n+RmUM4AWjzRSH
         mKY5TO8vr5Y05+sj7mV1XIfy1at0CakCS1S9ROholb7iFJjgiQ6v7i4HszOj0SaqBuOE
         GO8R59c9WrFYWJ0aKD7uL1z6BbogpjfauEuCveqjgNFvfYAi+j3I7Gx53tN1b/SUKajr
         tx86xW8bcS7FjaLW5Ie6if5WfYf6XvnD4y5ja75qg/hWVjbKD3bk3A+PF+x+8pVN55SR
         x1Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwIBf5LXiMz7syBIEDuuBQ+ZpcicIU4DPXFGU+WXLGcGbZzUSFvf79Ajfl1JdnITcYL5MsPXbYaBBNWzw==@lists.infradead.org
X-Gm-Message-State: AFuF++loJ7IWCNPVBVlz0TZ521pOKYbzg12kuG16iOK7NWBh63Vsq2pu
	clML0wxah0uzea8r6KRCJIp+r4OU8HhZ0eozzHU0d7OzDZWP43V7fB0C24hPZRVnrwtE1ZHieC3
	gE6WgY+/KW+qbIeHliRhu3Vfucg6as8FswlZY3/pLzHRuOQQU0LlK043SOAu1ELB33spXpCYDQe
	TsRag=
X-Gm-Gg: AYBFou1r2cXBMuugCZb1qMjrIspmwQvoD2Xa6a1zrd1Dn1kMlMT+drq/Jx12cfpCHk7
	dOhgOeZ2oaYV0AnYNGYwaVjw+20i9NGRN1J5MWt54nIDHwo18C0zRUCxzbabb1dyChO4639HEOg
	+ea5o8+2w+bzIPKxTssmpP/0e66TCVQdR9OHVPHNClkSQmnmKu8trlT5OxOSSNS5La3l3JpOnkX
	Ihs+gyYFlP/jIoBP6pP4GpNHF4wUK+42Mh4MPa5vdUT3AK9xLroHzSoJQXN0+5OAK06f0WCCQlV
	+mCFuDwN5gjQXLWbueVx7AYnPAZ0FaX6lwGNJiacYCeaR9pc8kqXedlxOJfz
X-Received: by 2002:a17:90a:f16:b0:39e:b7:cbe8 with SMTP id 98e67ed59e1d1-39e00b7d278mr3590021a91.5.1789456659726;
        Tue, 15 Sep 2026 00:17:39 -0700 (PDT)
X-Received: by 2002:a17:90a:f16:b0:39e:b7:cbe8 with SMTP id 98e67ed59e1d1-39e00b7d278mr3589957a91.5.1789456659306;
        Tue, 15 Sep 2026 00:17:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:38 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:36 -0400
Subject: [PATCH v7 10/11] riscv: cpu: Output isa bases lines in cpuinfo
MIME-Version: 1.0
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-10-aa35ebd9ae96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2779;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=MFEXerAp8YkUeh1632oAcakBkgoa+iIvn8OYQFJJq/g=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bZ1ogEmMSfY9Oy1bh0rMZyYUpccPK+Cxpmlw4ec
 vA5ZXS1o5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACai1sjIcHHTx/Qdf29cUxGf
 ub15s/LP7Vcnhl451Wpyr6pCXqNSeA0jQ1c54/Xc1X+3zqv7LLRrbsfJd0tXmJUKx3aq7blcoqT
 8mxsA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX+KjJ3vq/rsBf
 zUtJ+b/bL7ROtM3//o9y05QXKMWB0xYT3a7JJ10zXEycgvoqqeMDb6v55mI7b3k6nEkdmaxheIL
 NwDmGNM6ssiHa3dr5u2p+N11fyJFRko=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa8f114 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: fCrCyk69vxtfL9gSBcS0OB-hfwT07M3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX0zM7qSATvEZA
 w0tGjcKwTMTuz/4hhxfb8WfrOFVECZaq8ZtKZeIZu2qwYa5FyYDJp4LIhog/iKXfogE6LCrb8qH
 CjeYBQzLdxXpjo4yBNOZKeSaeDttFLXE8qBNCpcflymT1IQrIt254PMy489R3mM9+0yFVKGEq62
 wgw0F28CC/fiNik8n4MAHz0Hy9aWh0B6KPsTp+SBYnKsEBfZvhhUNLf1itZJo7OKClAAYXUTDVl
 A3hXNPRt4D4uw51GarHS3xj6CxN8wnQ8K0STnnVHmqlBawfCgRxijUlrlV9kHOApmDuH/jo+hLZ
 6sfJqcL37DOvM5xgvVjchWbW4JeZ7KT/AQesQ/3LjWQ+AscwULHm2uHo39Xe5UyxwGLnIwVEAey
 SEkWmaWEyX/ZrHjAozlWyH9olB2BFBdcwH0TqdMIMqb19ixVn9i4anZxXkB35VAmCMEatSeJfFy
 H+0rLikNvQ+S5asvJbA==
X-Proofpoint-ORIG-GUID: fCrCyk69vxtfL9gSBcS0OB-hfwT07M3a
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
X-CRM114-CacheID: sfid-20260915_081743_189882_3286DD04 
X-CRM114-Status: GOOD (  17.41  )
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
