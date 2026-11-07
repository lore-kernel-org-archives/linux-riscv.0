Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB48606A32D
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 02:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rgX8MviW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1gmG5pY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ds5tQrlr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tl5BW3bMukPREJKZPWrk8z1LJsZfIkvSELm+5cGku/Q=; b=rgX8MviWTUy1uvGZsFro0WkIwp
	l0ygK4yuK8iMHTAS1faM4npWtNd//wLhlQs24SnWf6TYgTjqFB+KFMMYlyv1A0bJEIdLkgE1wdFvI
	qGOYSR8E/ukWTZ3bsSW0XdmFnFIR+Jwk39KHtsaDEo0XUjZ4B4SUbJ1yl0NVfuO/w7CoZNsHaUoch
	fV24rCJ8mO+vBI2/2ddrD8eDOMz7cotOTVd1LXhW7kcjT79wsSqO1ig+dbS2rzVbLRjSfjZ2rXTGK
	djoSVVfx3ilOz/Rfg+DqqHR9DGmMjMdIaUbBQm1rE5wQgP7MRYnJMWFVWdp0cDU4ScXhTpCKpph+Z
	+pW8zOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWMh-0000000E5mI-3ovH;
	Sat, 07 Nov 2026 02:41:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPWLz-0000000E5WS-2fdy
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 02:40:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72BqVk2138087
	for <linux-riscv@lists.infradead.org>; Sat, 7 Nov 2026 02:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sxv5EqtnYWU
	COVJkYUviHmwxoOD0vd5Ri8oexCtFYW4=; b=L1gmG5pYYAgjaDrzkHaVi16Gsq6
	/LL/bdPzdAX+2q1kcDuvVuYbcHTP9YzU9jn16oZISlObiwgRlIxwbZW9kJI9vQUj
	WVGtlB3lCpDLs2sRw5F137AbZn8tqtHCfw1DoysxFjVKjoM/HCiWHUnWVF9YvRF8
	q4DeiWs7kiZTohtW0hA9dT/QPrJnvSPDnMNQDBD8/F2eKDk448Wx6S3wG7/cBwSs
	IO/cNrdrg8zXPxmdC79q77wGkr5uVdPkdfVXICkT9OltUFRUPjMJ3fchFLYcaMa7
	ZUltcETQFkaXmYGOJNKXt7SiZ6PyJs2iYJLoKbueD3CNUN5AosrUJ+Nol9A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsu06r2ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 02:40:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2111197eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 18:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019226; x=1794624026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxv5EqtnYWUCOVJkYUviHmwxoOD0vd5Ri8oexCtFYW4=;
        b=ds5tQrlrjbbFIjjlpnNLzq8tBT2yfpSLVXaAdhBLwJcbct/IIJzKc90DYpjtJBiAUs
         c6b8LIst2GIoIPjFZOg6GlupoCybcaaVi7zTzLJdvvXXDiKlRf3+DC2zfbEnIcRKhgwZ
         adqIteTkC4jbu/OvnAOqNzIgWvhwnXr19GA72gezNxev8uYjPj8MpkNtCfF0Or0V01cE
         +NuVTzXl/LPCgvtNkI7ZaMqZCDrzvyMEQm7kih3tfzKxIyYspLnbzGo5yHc8qaCVrVgX
         ySjTlTW5BBpgKYFJA9FPojZWh78LKOw3Qnf4aKsGJLiwxVS7pC7p3LSJSj9oQ8s1S29b
         fiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019226; x=1794624026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxv5EqtnYWUCOVJkYUviHmwxoOD0vd5Ri8oexCtFYW4=;
        b=D2gBjLwE2nYiNAxm4EFg5k2hQJxWi2jzTgjBBAs6PXQOgAbF0Ea1MbL4gxcwY1e5le
         UOHjMFfIfI5B9w2cv/6RufbVoUex9zGR1CsYTbaHrgx+tQv+gUixyMoVqSOKi/RpY3kS
         IAjVcNyilFrhkQwMI3GDoKvGFhNBd9EqjtVoycBuaexDJvEf1KyfKX1RKt8pX45W6tZT
         7nfV+52Vgg3kLaVFvwIAMmxrCpbUo4WQMldRVfpK4N2OPWsaXXLmGQHIYBDUMzCavbuf
         REjyb3kD7wNfhDMmhnisFTaKhBfth4vkE6B2q+PArL0JqcRtDK1CmOTl/njChTl9KrxM
         ZzTQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ3gOh+HKzmJqvwU51az5AJCXYl8QYgTs5/1RF7xdAnWMYgudkm3UjCsaHigoEi0iFzNm5h/egWzPjJA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9hrjv+BdzyYqLDiIOZykNwsZaTQCPEzMlv5k2F9SW8CYP7muGo
	x789T94uqiet+B3QVLgH8h43JS8uK1hUej1UXc5b1e2bPhij6j1i738bN3otxW6x+ZKzR9rOMev
	wbgHmT+YQYFx/yZwfXdSsFlgSVaeKxD803MFOBh5MsvoGWuaZKQjnJ2u2hIokJ28FIzccegA=
X-Gm-Gg: AYBFou0srxEasVdat1ip59fkDW5zAWfyaeNSszITZYRe0Fx8SFii2TS5qeQjOut6NI1
	V0V0+cTOatyyoADCrCiIe1WhnKobrunbnjUXn+yJVldU1qNF6XJiXkUlXOo49BFOwSR9RqO3Wz9
	ohmJZvwnUjt2634tnm5Z2Nqalp+rUGkTQt+n/h/qySvQsjqNek74rtbaTdTyJm411mKdP0PSrsF
	84jyGOESjOVjDPwz5s+7mj7HE2pyK+DyiHGkDJvX8in1Pqb/qJeo54LwjBozqaXO4thjl62LciL
	43tPPu4eoQFcW4Ahx4qQpkqvt90eCVxJWShqTbNGAm2o3XKAeLX8N4pryc56Ner/yfddxRLkWA4
	hrcBxBNdsIEKEgG5h2jJjw6bbYccCChw9uZIhaNntfJ/phmfMf+TnJHLIXYECaSwEdAIt0bsVcV
	rjyAEE2MEu6d+embph+41UBn8a/7dfSSQY/iiwHVP2skOulPzybtURjRj6+O6NgQLw4PV89yTAV
	Q==
X-Received: by 2002:a05:7301:6190:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36f75839295mr5734758eec.15.1794019225359;
        Fri, 06 Nov 2026 18:40:25 -0800 (PST)
X-Received: by 2002:a05:7301:6190:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36f75839295mr5734715eec.15.1794019224581;
        Fri, 06 Nov 2026 18:40:24 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:40:24 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 7/8] riscv: Add software supported single stepping with mc/mc6 triggers
Date: Sat,  7 Nov 2026 08:09:16 +0530
Message-ID: <20261107023917.40606-8-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX/+an9xM4kGib
 7oyB2AEFXTQlKmvnlkbksSjXHcSsoKMp1i9hdCc84vIrcCBWRvkdMP+Ll/wt0OtFQMso+pm1SfV
 i3A8CVfV6Wb9ijKxdF/HJZtDzkHS1moybvHq9KD+2N5UjFlEM9rq0u9HZS+jNCfiiqFkU9JVtHv
 9PPoJ/UwEQhGznUJK2s1Usov+6c07lXhnThZcnA9CV5MVHLg42rrDw/qywo9Go3cOcsFznK4Ogm
 oOaEtjRtHhlIgkOYV8vZaYK2GIdc6oErF++cXxK/FC4AtfP1kU+u+kG/j6NQqo9GV4p4kqKAj4Z
 l2M/cD6RT6T3YuRHNhYjE2Vgi4tnAnhTQmo6ZIGMwmu1XLiC3xLe7VW/g/WI38+0iRi5kPEVEM8
 Nlle33Tl2O3KMRgy37iU0y4enFSNOdjDQeLuR3HkIQKXxvRTuSlZ18rqS+x0cf/owrxg789u9nO
 jguJA1iB+e/k+fDZyiQ==
X-Proofpoint-GUID: tw0zyt4djx9G0NkYZD2HXn1fTMNPXCyp
X-Authority-Analysis: v=2.4 cv=IJGXmQvG c=1 sm=1 tr=0 ts=6aee8f9a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=m8l0dXrX7-G3mt2yGekA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: tw0zyt4djx9G0NkYZD2HXn1fTMNPXCyp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX/eQjxL30m3f2
 wwM+ClfpfH6ERaHGs4CoaEyNsJK3X/0LGqz668UGktsaj/yvZtc7xVFrpYBqH9yaYH79OYBY+eg
 CuDDNciemSz46Q4+9yVQ4r8719piQPc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_184027_849003_1EB9F6A8 
X-CRM114-Status: GOOD (  28.23  )
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

With mc/mc6 triggers, after handling breakpoint at current pc, there
is no way to tell trigger to skip same breakpoint after the handler
returns. This can cause loop of breakpoints at the same address until
the trigger is disabled or uninstalled. Debugger may keep the breakpoints
enabled and if kernel disables it, there is a loss of state coherency.

To avoid the loop, software disables the current breakpoint, finds the
next instruction that would be executed after pc and puts a breakpoint
at that address. When this breakpoint hits, old breakpoint is reinstalled.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/include/asm/hw_breakpoint.h |  16 ++
 arch/riscv/kernel/hw_breakpoint.c      | 297 ++++++++++++++++++++++++-
 2 files changed, 308 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
index 6e8913d69df2..b3ccebb5185e 100644
--- a/arch/riscv/include/asm/hw_breakpoint.h
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -15,10 +15,26 @@ struct task_struct;
 /* Maximum number of hardware breakpoints supported */
 #define RISCV_MAX_BP		16
 
+enum riscv_hw_bp_step_method {
+	RISCV_HW_BP_STEP_DISABLED,
+	RISCV_HW_BP_STEP_ICOUNT,
+	RISCV_HW_BP_STEP_SW,
+};
+
 struct arch_hw_breakpoint {
 	unsigned long address;
 	unsigned long len;
 	unsigned int type;
+
+	/*
+	 * Single-step callback state.  While step_method is enabled, the
+	 * hardware slot is temporarily programmed as either an icount trigger
+	 * or an execute trigger at next_addr, and the original trigger config
+	 * is restored when that temporary trigger fires.
+	 */
+	unsigned long next_addr;
+	enum riscv_hw_bp_step_method step_method;
+	bool pending_perf_event;
 	unsigned int match;
 	unsigned int chain;
 	unsigned int select;
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
index 4231170d4901..72be50943937 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -15,6 +15,7 @@
 #include <linux/cpu.h>
 #include <linux/cpuhotplug.h>
 
+#include <asm/insn.h>
 #include <asm/sbi.h>
 
 #define RISCV_HW_BP_NUM_MAX	32
@@ -62,6 +63,9 @@ enum {
 #define RISCV_DBTR_MC6_HIT1		BIT(25)
 #define RISCV_DBTR_MC6_HIT_MASK	(RISCV_DBTR_MC6_HIT | RISCV_DBTR_MC6_HIT1)
 
+#define RISCV_DBTR_ICOUNT_U		BIT(6)
+#define RISCV_DBTR_ICOUNT_COUNT_MASK	GENMASK(23, 10)
+
 #define RISCV_DBTR_MC6_HIT_FALSE	0
 #define RISCV_DBTR_MC6_HIT_BEFORE	1
 #define RISCV_DBTR_MC6_HIT_AFTER	2
@@ -77,6 +81,7 @@ static union sbi_dbtr_shmem_entry __percpu *sbi_dbtr_shmem;
 /* number of debug triggers on this cpu . */
 static int dbtr_total_num __ro_after_init;
 static int dbtr_type __ro_after_init;
+static bool dbtr_icount_available __ro_after_init;
 static unsigned long dbtr_init __ro_after_init;
 
 #define MEM_HI(_m)		\
@@ -194,6 +199,17 @@ static void init_sbi_dbtr(void)
 		return;
 	}
 
+	tdata1 = dbtr_tdata1_type(RISCV_DBTR_TRIG_ICOUNT);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect icount triggers\n");
+	} else if (ret.value) {
+		dbtr_icount_available = 1;
+		pr_warn("Icount trigger available.\n");
+	}
+
 	tdata1 = dbtr_tdata1_type(RISCV_DBTR_TRIG_MCONTROL6);
 
 	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
@@ -397,6 +413,9 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 	hw->tdata1 = 0;
 	hw->tdata2 = attr->bp_addr;
 	hw->tdata3 = 0x0;
+	hw->next_addr = 0x0;
+	hw->step_method = RISCV_HW_BP_STEP_DISABLED;
+	hw->pending_perf_event = false;
 
 	switch (dbtr_type) {
 	case RISCV_DBTR_TRIG_MCONTROL:
@@ -414,6 +433,168 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 	return ret;
 }
 
+static ulong get_step_address(struct pt_regs *regs, ulong insn)
+{
+	return get_next_insn_address(regs, insn, regs->epc);
+}
+
+static int dbtr_update_event_tdata(struct perf_event *event,
+				   unsigned long tdata1,
+				   unsigned long tdata2,
+				   unsigned long tdata3, bool wait);
+
+static bool hw_breakpoint_event_active(struct perf_event *event)
+{
+	return READ_ONCE(event->state) == PERF_EVENT_STATE_ACTIVE;
+}
+
+static void clear_singlestep_state(struct arch_hw_breakpoint *bp)
+{
+	bp->step_method = RISCV_HW_BP_STEP_DISABLED;
+	bp->next_addr = 0;
+	bp->pending_perf_event = false;
+}
+
+static void disable_unhandled_singlestep(struct perf_event *event,
+					 struct pt_regs *regs, bool deliver_event,
+					 int err)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+
+	/*
+	 * If the temporary step trigger cannot be installed or restored, leave
+	 * the CPU with no active trigger instead of re-entering the same debug
+	 * exception forever.
+	 */
+	pr_warn("single-step setup failed for bp_addr=0x%lx epc=0x%lx: %d; disabling event\n",
+		bp->address, regs->epc, err);
+	clear_singlestep_state(bp);
+	if (deliver_event && hw_breakpoint_event_active(event))
+		perf_bp_event(event, regs);
+	if (hw_breakpoint_event_active(event))
+		perf_event_disable_inatomic(event);
+}
+
+static unsigned long icount_step_tdata1(void)
+{
+	return dbtr_tdata1_type(RISCV_DBTR_TRIG_ICOUNT) |
+	       FIELD_PREP(RISCV_DBTR_ICOUNT_COUNT_MASK, 1) |
+	       RISCV_DBTR_ICOUNT_U;
+}
+
+static int restore_original_breakpoint(struct perf_event *event)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	int ret;
+
+	/*
+	 * Rebuild the original trigger from the perf attributes instead of
+	 * keeping a second copy of the trigger data.  Do not update the
+	 * temporary trigger in place when changing back from icount/software-step
+	 * mode: uninstall/install gives the original breakpoint a fresh hardware
+	 * slot and clears any transient hit state.
+	 */
+	arch_uninstall_hw_breakpoint(event);
+
+	ret = hw_breakpoint_arch_parse(NULL, &event->attr, bp);
+	if (ret)
+		return ret;
+
+	return arch_install_hw_breakpoint(event);
+}
+
+/*
+ * setup_singlestep - Set the breakpoint to next instruction after current breakpoint.
+ */
+static int setup_singlestep(struct perf_event *event, struct pt_regs *regs)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	unsigned long insn, next_addr = 0;
+	int ret;
+	struct arch_hw_breakpoint tmp = {};
+
+	clear_singlestep_state(bp);
+
+	if (dbtr_icount_available && !arch_check_bp_in_kernelspace(bp)) {
+		/*
+		 * User breakpoints can use an icount trigger to retire exactly
+		 * one instruction.  The sdtrig icount path reports EPC after the
+		 * counted instruction, so the callback sees the post-step PC
+		 * without decoding the original instruction here.
+		 */
+		tmp.tdata1 = icount_step_tdata1();
+
+		ret = dbtr_update_event_tdata(event, tmp.tdata1, 0, 0, false);
+		if (ret)
+			return ret;
+
+		bp->step_method = RISCV_HW_BP_STEP_ICOUNT;
+		bp->next_addr = 0;
+		return 0;
+	}
+
+	if (!event->hw.target) {
+		/*
+		 * A CPU-wide software-step trigger follows one task's decoded
+		 * next PC.  If that task migrates, the per-CPU slot may wait
+		 * forever for an address the CPU will not execute.
+		 */
+		return -EOPNOTSUPP;
+	}
+
+	ret = get_insn_safe(regs, regs->epc, &insn);
+	if (ret < 0)
+		return ret;
+
+	next_addr = get_step_address(regs, insn);
+	if (next_addr == regs->epc) {
+		/*
+		 * Some control transfers, notably SRET, cannot be represented
+		 * as an execute breakpoint at a different decoded PC.  Refuse
+		 * the software step rather than programming the same address
+		 * and looping on the original breakpoint.
+		 */
+		return -EOPNOTSUPP;
+	}
+
+	/*
+	 * Software path: update the trigger in-place to an execute
+	 * breakpoint at next_addr.  Build the tdata directly without
+	 * calling hw_breakpoint_arch_parse() so that bp->len and bp->address
+	 * remain valid for the handler's matching logic after restore.
+	 */
+	tmp.tdata2 = next_addr;
+	tmp.tdata3 = 0;
+	switch (dbtr_type) {
+	case RISCV_DBTR_TRIG_MCONTROL6:
+		tmp.tdata1 = dbtr_tdata1_type(RISCV_DBTR_TRIG_MCONTROL6) |
+			     RISCV_DBTR_MC6_EXEC;
+		if (user_mode(regs))
+			tmp.tdata1 |= RISCV_DBTR_MC6_U;
+		else
+			tmp.tdata1 |= RISCV_DBTR_MC6_S;
+		break;
+	case RISCV_DBTR_TRIG_MCONTROL:
+		tmp.tdata1 = dbtr_tdata1_type(RISCV_DBTR_TRIG_MCONTROL) |
+			     RISCV_DBTR_MC_EXEC;
+		if (user_mode(regs))
+			tmp.tdata1 |= RISCV_DBTR_MC_U;
+		else
+			tmp.tdata1 |= RISCV_DBTR_MC_S;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ret = dbtr_update_event_tdata(event, tmp.tdata1, next_addr, 0, false);
+	if (ret)
+		return ret;
+
+	bp->step_method = RISCV_HW_BP_STEP_SW;
+	bp->next_addr = next_addr;
+	return 0;
+}
+
 static void dbtr_encode_update(union sbi_dbtr_shmem_entry *shmem,
 			       unsigned long idx, unsigned long tdata1,
 			       unsigned long tdata2, unsigned long tdata3)
@@ -574,12 +755,43 @@ static unsigned int mc6_read_and_clear_hit(int idx)
 	return hit;
 }
 
+static int handle_triggered_breakpoint(struct perf_event *event,
+				       struct pt_regs *regs)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	bool defer_perf;
+	int ret;
+
+	/*
+	 * Report user breakpoints after the temporary step trigger advances
+	 * past the armed instruction.  Otherwise signal delivery can re-enter
+	 * the same execute trigger before the PC has moved.
+	 */
+	defer_perf = !arch_check_bp_in_kernelspace(bp);
+	if (!defer_perf) {
+		perf_bp_event(event, regs);
+		if (!hw_breakpoint_event_active(event))
+			return NOTIFY_STOP;
+	}
+
+	ret = setup_singlestep(event, regs);
+	if (ret < 0) {
+		disable_unhandled_singlestep(event, regs, defer_perf, ret);
+		return NOTIFY_STOP;
+	}
+
+	bp->pending_perf_event = defer_perf;
+	return NOTIFY_STOP;
+}
+
 /*
  * HW Breakpoint/watchpoint handler
  */
 static int hw_breakpoint_handler(struct die_args *args)
 {
-	int i, bp_ret = NOTIFY_DONE;
+	int i, ret = 0, bp_ret = NOTIFY_DONE;
+	struct perf_event *deferred_step_event = NULL;
+	struct arch_hw_breakpoint *deferred_step_bp = NULL;
 	struct arch_hw_breakpoint *bp;
 	struct perf_event *event;
 
@@ -590,6 +802,74 @@ static int hw_breakpoint_handler(struct die_args *args)
 
 		bp = counter_arch_bp(event);
 
+		if (bp->step_method != RISCV_HW_BP_STEP_DISABLED) {
+			bool pending_perf_event;
+
+			/*
+			 * This trap is for the temporary trigger installed by
+			 * setup_singlestep().  Software stepping must match the
+			 * decoded next_addr; icount already reports the post-step
+			 * PC and can restore the original trigger immediately.
+			 */
+			if (bp->step_method == RISCV_HW_BP_STEP_SW &&
+			    args->regs->epc != bp->next_addr) {
+				/*
+				 * A nested breakpoint can fire before this
+				 * event reaches its decoded next_addr, for
+				 * example when perf delivers a signal handler
+				 * with its own breakpoint.  Let the later slot
+				 * handle that trap and keep this temporary step
+				 * armed.  If nobody handles the trap, restore
+				 * below so a real divergence does not lose the
+				 * original breakpoint indefinitely.
+				 */
+				deferred_step_event = event;
+				deferred_step_bp = bp;
+				continue;
+			}
+
+			if (bp->step_method == RISCV_HW_BP_STEP_ICOUNT &&
+			    args->regs->epc == bp->address) {
+				unsigned long tdata1 = icount_step_tdata1();
+
+				/*
+				 * A trap can be observed before the original
+				 * user instruction retires, leaving EPC on the
+				 * armed breakpoint.  Delivering the deferred
+				 * perf event here would account the same
+				 * breakpoint twice, so rearm icount and wait for
+				 * a callback with a post-instruction EPC.
+				 */
+				ret = dbtr_update_event_tdata(event, tdata1, 0, 0, false);
+				if (ret) {
+					disable_unhandled_singlestep(event,
+								     args->regs,
+								     bp->pending_perf_event,
+								     ret);
+					bp_ret = NOTIFY_STOP;
+					goto exit;
+				}
+				bp_ret = NOTIFY_STOP;
+				goto exit;
+			}
+
+			pending_perf_event = bp->pending_perf_event;
+
+			ret = restore_original_breakpoint(event);
+			if (ret) {
+				clear_singlestep_state(bp);
+				perf_event_disable_inatomic(event);
+				bp_ret = NOTIFY_STOP;
+				goto exit;
+			}
+
+			clear_singlestep_state(bp);
+			if (pending_perf_event && hw_breakpoint_event_active(event))
+				perf_bp_event(event, args->regs);
+			bp_ret = NOTIFY_STOP;
+			goto exit;
+		}
+
 		switch (event->attr.bp_type) {
 		/* Breakpoint */
 		case HW_BREAKPOINT_X:
@@ -603,8 +883,7 @@ static int hw_breakpoint_handler(struct die_args *args)
 					       RISCV_DBTR_MC6_HIT_FALSE;
 
 				if (hit) {
-					perf_bp_event(event, args->regs);
-					bp_ret = NOTIFY_STOP;
+					bp_ret = handle_triggered_breakpoint(event, args->regs);
 					goto exit;
 				}
 			}
@@ -640,8 +919,7 @@ static int hw_breakpoint_handler(struct die_args *args)
 				hit |= ranges_overlap(bp_start, bp_len, stval,
 						      sizeof(long));
 				if (hit) {
-					perf_bp_event(event, args->regs);
-					bp_ret = NOTIFY_STOP;
+					bp_ret = handle_triggered_breakpoint(event, args->regs);
 					goto exit;
 				}
 			}
@@ -653,6 +931,15 @@ static int hw_breakpoint_handler(struct die_args *args)
 		}
 	}
 
+	if (deferred_step_event) {
+		bp = deferred_step_bp;
+		ret = restore_original_breakpoint(deferred_step_event);
+		if (ret)
+			perf_event_disable_inatomic(deferred_step_event);
+		clear_singlestep_state(bp);
+		bp_ret = NOTIFY_STOP;
+	}
+
 exit:
 	return bp_ret;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
