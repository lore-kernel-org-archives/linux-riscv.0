Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D33D59D99
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyWK0lB3cUbl0fOOiKo5UhoytyLcH4cFAKju7PyCT78=; b=Vh/3Q42wk6NDy6
	qk1ZO4tTSBcSQXlyaCR/b+HGOQ/zQ1z6/mJVja8NtsprTacsgz3YDUhivr6qnvPKUGbPca/RWugk2
	cVoWnKpZANb3O2RTKz3kOeKnOXjvXq3SojljoQbq+6gyYpJzHZTRKca5fH3AZA3K56gWimgTOtbC2
	cflJwIW5Kck8yLnatsBp7kdYbV1dy4/Mc0m0eT/HPcsZZea57WFH3HFyoAj+HoD6CTbS0ZOf/aEdy
	LP4Q3Y9mTKFuaIst4oroEgL8tBduFjnz0oN17wWe3r7ec6YHuEt3fUp4GTUALeDOIvogOgIT53Oz0
	194OZKgzD3NnUmm9gBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4i-00000002aGL-2Rvt;
	Sun, 14 Dec 2025 16:36:00 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUp4c-00000002aDf-1PYD
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 16:35:56 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59581e32163so3125490e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 08:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765730152; x=1766334952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ceN7tYN/gKBBlWayVud/16shc9bGATzOqOE1jrkBy4=;
        b=kXX6Q7qslVcPl7kyUgamlbysXhXt7KtrtosmZiNHt50Mi25XdTHK8uk9zjA38AVgRj
         gHSTrmt+AZx6WXYUSBLeeSmDMSN9EOBbMBC7w7sEhkOZMt1F41lW6yofiqOW3fj6GDsU
         afF7ThQo0HH54l0YKUo5lNNF5w26X8S9vqD0G6FfhR4JGQPD6dne0HVMhDNs9ujFwiKG
         CG/ft7woUKH2vbUIjh4dlRKkTtREfc2rDQIdZBbztWadwBFNxNuFIqLZcr7m07GH53vE
         CuqUL+qjRoJxdqUMvi3SmWy7lDx4Aq4OM5xx1KSE9t2SgiXbPIDZYBfs8tsSJpz/7/N0
         1xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765730152; x=1766334952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ceN7tYN/gKBBlWayVud/16shc9bGATzOqOE1jrkBy4=;
        b=TcC/rIa2F4L1/mtozJA8d9ZyvyGr24acpNlFWVUz6wP6dzE5NWBirVqvrmOPrPLdha
         nnT4L9qpwIZ777rdFPHVjPKVZosBcvTsUx94OWjtPECczEPvcKWK68pZLbWIsfI9INiC
         V+2GN09haeVqYJPilcpr81iITBMJ+fn1IBwIFbnLpu0pYN55xraQwX/LUQAt6dPwbWWw
         OgWDPzax/HmtMIePFY+ITzmnn7TRLrAS7hkIjeMr4WGpabfZZ6BHwH3vjIs1EfXxMUMZ
         h897PbGu76dhBzKrkRMrRXWWOI0zBsFCrbqGqG02ZNHhlO9vrrTQtmScSyeckyB1Ot1D
         mdhg==
X-Gm-Message-State: AOJu0YwKbikPPVWD1ljU4TB7k3HYs9iQQxSvx5qufH+0nwahDLMqJG4B
	jcTYkEX1oxuAWySHEgTVJa9qTZvPa0jCgLF0w8AzjUkYKCZP1pZXBEHkuaAbvpbL
X-Gm-Gg: AY/fxX7iXp4VOfX/Ovg6h/C0yY0jge08UlX5lwKGHkjm/agVmqKujXtBAjY59VLDhyu
	i8FiYu5WYY1Av8deriFj6Xd4OI3cTyJqBCl/iZSz54ex3QJswcxJHRpz0x5amb1R6rTDn0kB6VD
	vVPjTKShbdjafBI5CGTrYZWJLwBcrI0Jo+Ah/oaxhjNF3KG0BEoBCrupvoDhSjxXkSPichFANGo
	cL0W3unCAOfZgWE1rtuaS48mbjPTqb2IjZhA+01NqdnX4H073t60TvQVcLPg3/j4k1t6dT+6N/E
	b6+m/TqDpuFNqJ8yWqiv27Oq+pCm3SHtW/qVtbOGOcDJ5KyRxHNtxDy83v5wmf5VNodhl3LHRtJ
	EfLFSI3SUuEsT09I3XjG5Fjl9kYx0ZloY0iSPPb5SaBhaIcUKO4o8oNyNpi3j2UAXw5fDJZyMQx
	6MsA==
X-Google-Smtp-Source: AGHT+IE7dE3l70YGYPB3y3zq32vN+TmUO6rInc0cqfa6GCb0iUkaJd/dRh0REzAP8I/RflxLSnRQhw==
X-Received: by 2002:a05:6512:1390:b0:598:e9f9:bdd with SMTP id 2adb3069b0e04-598faa805e5mr2916040e87.27.1765730151386;
        Sun, 14 Dec 2025 08:35:51 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-598f7717b79sm3789618e87.60.2025.12.14.08.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 08:35:50 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Joel Granados <joel.granados@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v5 4/9] riscv: ptrace: validate input vector csr registers
Date: Sun, 14 Dec 2025 19:35:08 +0300
Message-ID: <20251214163537.1054292-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
References: <20251214163537.1054292-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_083555_582159_58B474C3 
X-CRM114-Status: GOOD (  15.94  )
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

Add strict validation for vector csr registers when setting them via
ptrace:
- reject attempts to set reserved bits or invalid field combinations
- enforce strict VL checks against calculated VLMAX values

Vector specs 0.7.1 and 1.0 allow normal applications to set candidate
VL values and read back the hardware-adjusted results, see section 6
for details. Disallow such flexibility in vector ptrace operations
and strictly enforce valid VL input.

The traced process may not update its saved vector context if no vector
instructions execute between breakpoints. So the purpose of the strict
ptrace approach is to make sure that debuggers maintain an accurate view
of the tracee's vector context across multiple halt/resume debug cycles.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 88 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9d203fb84f5e..5d18fe241697 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -124,6 +124,92 @@ static int riscv_vr_get(struct task_struct *target,
 	return membuf_write(&to, vstate->datap, riscv_v_vsize);
 }
 
+static int invalid_ptrace_v_csr(struct __riscv_v_ext_state *vstate,
+				struct __riscv_v_regset_state *ptrace)
+{
+	unsigned long vsew, vlmul, vfrac, vl;
+	unsigned long elen, vlen;
+	unsigned long sew, lmul;
+	unsigned long reserved;
+
+	vlen = vstate->vlenb * 8;
+	if (vstate->vlenb != ptrace->vlenb)
+		return 1;
+
+	/* do not allow to set vcsr/vxrm/vxsat reserved bits */
+	reserved = ~(CSR_VXSAT_MASK | (CSR_VXRM_MASK << CSR_VXRM_SHIFT));
+	if (ptrace->vcsr & reserved)
+		return 1;
+
+	if (has_vector()) {
+		/* do not allow to set vtype reserved bits and vill bit */
+		reserved = ~(VTYPE_VSEW | VTYPE_VLMUL | VTYPE_VMA | VTYPE_VTA);
+		if (ptrace->vtype & reserved)
+			return 1;
+
+		elen = riscv_has_extension_unlikely(RISCV_ISA_EXT_ZVE64X) ? 64 : 32;
+		vsew = (ptrace->vtype & VTYPE_VSEW) >> VTYPE_VSEW_SHIFT;
+		sew = 8 << vsew;
+
+		if (sew > elen)
+			return 1;
+
+		vfrac = (ptrace->vtype & VTYPE_VLMUL_FRAC);
+		vlmul = (ptrace->vtype & VTYPE_VLMUL);
+
+		/* RVV 1.0 spec 3.4.2: VLMUL(0x4) reserved */
+		if (vlmul == 4)
+			return 1;
+
+		/* RVV 1.0 spec 3.4.2: (LMUL < SEW_min / ELEN) reserved */
+		if (vlmul == 5 && elen == 32)
+			return 1;
+
+		/* for zero vl verify that at least one element is possible */
+		vl = ptrace->vl ? ptrace->vl : 1;
+
+		if (vfrac) {
+			/* integer 1/LMUL: VL =< VLMAX = VLEN / SEW / LMUL */
+			lmul = 2 << (3 - (vlmul - vfrac));
+			if (vlen < vl * sew * lmul)
+				return 1;
+		} else {
+			/* integer LMUL: VL =< VLMAX = LMUL * VLEN / SEW */
+			lmul = 1 << vlmul;
+			if (vl * sew > lmul * vlen)
+				return 1;
+		}
+	}
+
+	if (has_xtheadvector()) {
+		/* do not allow to set vtype reserved bits and vill bit */
+		reserved = ~(VTYPE_VSEW_THEAD | VTYPE_VLMUL_THEAD | VTYPE_VEDIV_THEAD);
+		if (ptrace->vtype & reserved)
+			return 1;
+
+		/*
+		 * THead ISA Extension spec chapter 16:
+		 * divided element extension ('Zvediv') is not part of XTheadVector
+		 */
+		if (ptrace->vtype & VTYPE_VEDIV_THEAD)
+			return 1;
+
+		vsew = (ptrace->vtype & VTYPE_VSEW_THEAD) >> VTYPE_VSEW_THEAD_SHIFT;
+		sew = 8 << vsew;
+
+		vlmul = (ptrace->vtype & VTYPE_VLMUL_THEAD);
+		lmul = 1 << vlmul;
+
+		/* for zero vl verify that at least one element is possible */
+		vl = ptrace->vl ? ptrace->vl : 1;
+
+		if (vl * sew > lmul * vlen)
+			return 1;
+	}
+
+	return 0;
+}
+
 static int riscv_vr_set(struct task_struct *target,
 			const struct user_regset *regset,
 			unsigned int pos, unsigned int count,
@@ -145,7 +231,7 @@ static int riscv_vr_set(struct task_struct *target,
 	if (unlikely(ret))
 		return ret;
 
-	if (vstate->vlenb != ptrace_vstate.vlenb)
+	if (invalid_ptrace_v_csr(vstate, &ptrace_vstate))
 		return -EINVAL;
 
 	vstate->vstart = ptrace_vstate.vstart;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
