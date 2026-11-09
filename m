Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8602D606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eR1vm5gm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HaWRJQyE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ItDPAIWl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U1g6fqkHZ9jCub72t1suqWQFqiWNHuBKuS8yEMT3UrQ=; b=eR1vm5gmaGVWfhrU91QHCoGFTv
	jkaS7sE7NQunmudOtfraNx5+2uV6g1TUDjgk+FKUU5oqoErjWWOflxwA0UeSu4VI2wbHevOEB/lRT
	KTTj1EYD7cMtfOcbMiUTLyyPDzmPkXqnrgWjY9ONvv74nLQCHYObOn5f1O+FDPrlkqvx+glLCOdOb
	6jvJnw4UW94ZQxGwb/Rx2GuYtrRdcXVay3jNaSKJsKT+2DdbsbUMeqaonkhYSrqLdz5V+b8g3/Fgu
	miGDVZWU+dEj34M+r8Req3PpSfBHgsMoR8PFCnz+sOhZzs1K9IKe/70LVYLT8hAC7DQH0qpNpC5Mt
	LKVw4G8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOn8-00000000jaA-26GP;
	Mon, 09 Nov 2026 12:48:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOn5-00000000jZB-3XIu
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:48:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9CEPmI1193071
	for <linux-riscv@lists.infradead.org>; Mon, 9 Nov 2026 12:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRcjtxEyFKeSMylm4kchPyfddfB4hUfWm9kwcCT4kgs=; b=HaWRJQyEbJ7aYPnO
	FgzyfedJfWr23ikxXwH5cFk21qCwUuoHz/P/MVVbNx1gnMQujeDFgFaW9P9c6kcG
	vasEKhTm1yOtcequc7VQae+dZue+rKEgp7t7zR/clonRy8yCYzisfGrOxPQM3WCp
	6h7cwZx2EtIh+Alz9LnoVxAJAEsx8GOpx/Ph+DK2ITHTYuPOfUDkyoxAxK4DisF2
	skEVYJB05cwbafgpfE5HjtNp7yVV1+FiWQwz94a8g0Qif6wiFQD2by9fGsfZkfJ6
	tramCembj3VjTeukyDXpl52TQbmA7brOIeNcZKd/4hasig36cyJI0xRstPSRR9M6
	s1PaOA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qr3gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 12:48:03 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67532014b2fso1859960d50.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 04:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228482; x=1794833282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRcjtxEyFKeSMylm4kchPyfddfB4hUfWm9kwcCT4kgs=;
        b=ItDPAIWlQF36hgcXrMe5Qt/gy3xuUh1ZoKqFNoIhWpF2heO+cEqlM5pQYQQGNzO8S1
         +hhCbtxOJKg2JV8rx5v2uULUydrTOX3QYnHNuhNgLP/DCnQQis+eZ+BQXCcqJdWuUzmn
         Rb7LXTuJlIQYTofc3vxDZ19EnNVqpaNSaGdbAuGbK+EfdM8KFrE9R1faox01bjl4Syyr
         z1jXE5dhOfELnZkHixKEfthTUwHKI21cbgteIPago7Njy40C2WwvJF5IOw5sZLM2jxXd
         FaFT5ASz0tv1HfCuxIy3F1aXQOkHr7NPzgnccszzUzvwkY9gm8g3/+hQ+Ygze1qTSNZx
         sLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228482; x=1794833282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRcjtxEyFKeSMylm4kchPyfddfB4hUfWm9kwcCT4kgs=;
        b=WIUeU3oiYY4uw5RxpGKWj8uBqyakMTfWXuM3UYHloCmQgVGV9RdkSM2g/P0jnkssAb
         zhjBkkmjZyPHBq9ce4UIERqgMAOG5XKo1N9NfHATIq6Iept27uNDbPm00jFt+cu+5huj
         Ahs7OWFXRrjPnzIi4jWUCFB/v+b7cwooqY+5qAFDZpKJtPvTbLEaqd4/6QsYvpBwFB3d
         SC9wFwpSNTTI7d2cbPew3GlDjfXKj594D8zvatfZQnwkLQb511bF/YMj7Coan0YJ7MXj
         BxzZ7iLK71pGz7WnuLl4RYXyh6h94PqWKQ3GaNdXtotDarivRs0Ue1eJabkXMjzC5StK
         b01Q==
X-Forwarded-Encrypted: i=1; AL+hErGiHItODWr6R846a5cb12AvJhK9GxD/O88y35j83JKj5YpAHq1PxaFs7nIU0IbZS+WCuq8QGbHoX81gEw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Rhb151kotEdeos0Xrolk7KVG47Wasxfdp/98BWCx+mbVa5NfS
	QYVoRWqKoEehyaffBCNmCwRh+cyoBrDZjBFNLv4pj0GlAwOA0A7zL3eeBHPio7KPbGlsaXPTzwk
	/AP+/ylv5oF80U4QEdtwKSpyp1vmTgoz4jvHwjEGH18fu5YqQNuOmu83o4oDqj8y+B5U9T70hnH
	1hMA8LKA==
X-Gm-Gg: AYBFou2mDE7ZoPf0BwzHRA+py8IY6AyBLAiUVuwO9aVYFIGqlb50Y3DLBXHq+FopKyy
	4Ncq9CD5Kb6uxFmCtqyq4Hbau1ToENl0xl0gQ+esz9DFZQuk+Z+hFvmlYnvUyccbm6yfwgEClc8
	niAcv9lM0zDOSfaShOj4chEPzscwPJn28Rcry6F4Wpkylbr181FIy95WKuF66da88aRecqzFCZH
	+vb+YuZk67bGN9Ff0nBeMrn+lbXQftOSaUtaeGJdfSG53Gig9BBo4tszr2z9DDBR6Kzn3yMpQtj
	fB5MPA/dPfyFFj+mjM/vmUVJWD37Sv7IR/YHY+F12GR5ucBNFGkUriwhkAzuf1vv44CtVXg/J/n
	1xMOJ4YPvfu3/9lyKTy5wF2E0laan6lFx8+QFF47JSukOWT+ulTGf1HTYjKHq1XdYol5oLh6B8D
	Z281VxT472ZA==
X-Received: by 2002:a05:690c:7107:b0:8b0:dd35:7b9b with SMTP id 00721157ae682-8b36cb0d50fmr20463657b3.67.1794228481731;
        Mon, 09 Nov 2026 04:48:01 -0800 (PST)
X-Received: by 2002:a05:690c:7107:b0:8b0:dd35:7b9b with SMTP id 00721157ae682-8b36cb0d50fmr20463467b3.67.1794228481035;
        Mon, 09 Nov 2026 04:48:01 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36c0b4244sm33697547b3.45.2026.11.09.04.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:47:59 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:35 -0500
Subject: [PATCH v9 2/4] riscv: cpu: Output isa bases lines in cpuinfo
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-2-ae846c5c7178@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2911;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=wzAGtSSkmxZfZizOFQBUvhE0yLM4MHIUJ9HkofggPGw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB17PO6J7+rKjJvej8N0RsgtNNGeYR30TjX2qntb2R
 DMn7FpJRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAExE6CIjQ58B15f7bKveB9w8
 /a/iu21LtQX3YeO/R+ce39LC/GV9ZgrDf9coeemlqz1zfA8Fb98hpmf75xrf6Sc37jZLT9sX8f+
 nIA8A
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfXy9y2eGW8NTkC
 iLgMbp2erOkka5gSm1nZ8NScOvZg5cHsc7B0FojT9hM0Kpa41f7SkOcdB7EepMwPNzHZXBR3Rch
 3s1OjZFXpvxOdIsODV/VIx7lEkQnp8HRwiCh0QoZE6LCi6EIvPLqL5W96jskTxyFAMOd8POHhUJ
 d4DP5CtAPdpe3Oa5t6CS2mLH/LR3JmkmEdn4qg0G6Om0e3/Yd2WRY+RHcEHIV7wRy7nftuzjLjd
 WP0qovHV0SUfvPsPSRFtwSD4EoDPLZ/rhrVhJoyebkCSPKL0rgHF+aEdP4MZhRUjQ17owix8pbc
 62OptUnRmbWyBgDqBFnL2MRC4mEpbtjAoqONsSjaYDS87XNQEiZjMartTBeYyuNiPMwzThldtyt
 acsKRwtThqI7JzHL62HAy4UXFAe+nkVBtkCd7AlwjH6FPOoqyPTP0KucH5Wl9zYEt/NOLWrvji1
 6L99Axs6TI+kwElsdEQ==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1c103 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: Ue-Ebm9L2IUhp_vazmugt8yOIhVRcswW
X-Proofpoint-ORIG-GUID: Ue-Ebm9L2IUhp_vazmugt8yOIhVRcswW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX0rTIfpHNAqyQ
 lKbyrkO2WIYFqlNgG+tVUHvDVkJ0u9JH4uOf0cOxKjL5elWDIq/xJHrQWfStpAt1zT849Bf4QmL
 ku+/d8oGhCIj1dmg3EFPUXTrKkFJnYE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_044803_901667_E38A6558 
X-CRM114-Status: GOOD (  17.19  )
X-Spam-Score: -1.5 (-)
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
index af84b97af3a1..75761fc9f09a 100644
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
