Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235AACCF9EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 21:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5Ue7E6AABdzC0u44urmtEs9rWAKmM0pQ5/4/HP5tfE=; b=3DdlEgaIesUnwc
	xQy1nD+p1wspm4h+HGiLVkpbPQjL65xvFziNOp3BFn/HnlF151by3pmYbM/z7tUlAAjuFR2ND1hgv
	kgq7dyjtGtalfVbBaIPNIKOQmwdMmTObb0d+/ab6GyJY/9IiOUFcyhQ6NBKR/aSXvXdReGTJjK86C
	zoff6T2LFeNhsX6mNrNHmOcnzsE/rmYFgKVyfR5RoValKCr/gDx46DIegwtkd7i6xHEfHeMv+Uh9t
	LSRz1TXvaOqlbj0vxHKn1n5DglKTPfn5PJhgdYut+U0183Z5ioHU352473z/wLb4wK7OUlYYecuTy
	nsd/t1r8bmc7juazd0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTz-0000000BlDG-2mMn;
	Sat, 25 Oct 2025 21:07:27 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTv-0000000BlAZ-3kCi
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 21:07:25 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-592f098f7adso3998205e87.0
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761426442; x=1762031242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYGbqwLXExmna8eBWQ52VSI73UhSuti8d9ZiNWksIVc=;
        b=MldISYbvwX9WbzGIX1Cqg4skZ+yxKsqs0YP2lQT57dmkLi4qEHvgHIouU6Ow/zYIDH
         v7+NFCKT2CeqUmRidBg/eG5EQV559yfBoyLgiJvZxC50KhcKcOUjYoR+Nj8Va7iIxSPf
         1l6Igp1R+WJfq/do7+h7bnwPVg055qstYZN26/YMy17imIlxPsXY4GTIbFnIJP77ZiHT
         SXi7tHKBjhEvzGzVfLyRkM2XgnAkzVu5F8blEQs3zxegKv/2PuCXKpk95MG3JjUMJMY1
         SWINIpsXN984zRPzsfh3InfBKpf9Jlc0LrMHTvDlTquWHVvfKG7R9Ci6FCJlC/XGV7yM
         rz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761426442; x=1762031242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYGbqwLXExmna8eBWQ52VSI73UhSuti8d9ZiNWksIVc=;
        b=mKU4RLuJHtQXEKVE/Asd21e1AAiRNfuBM6PB4MjljNwBjbGPpyqOR5y4PruYc32/WW
         Zc4awUUEKQoqa9XbKO/5V/FDnAmuPRwhCRdsptqGU+iFojnM/9RBQ3W9OowCQ4VQrTMV
         S/9X9wgRZdP0qRDPOxfPfF322UcKfEPzwEwKyEeTa+lBQkNMeuyMyPDvkcodJNeHLH/J
         zMsdic6PPlqk1d+lPYFojl7ucd+6mVxkVkwD0QvR2ye1dcw/Mj99iV1cWP/Ibs/IROgu
         vBbQWqfNjKosDxHX9ypOjGJ1uHEnpijfQxUHdj/ZKbMli3QULbVNCqk1gLV0tbDpx2ig
         b8Cg==
X-Gm-Message-State: AOJu0YwFmFAGdc5EA5oANaQgeFcFOigS8MGGZKNay+TcSzf704Bu1sLu
	5R4YkRcEPNDmJLaHWNLI0jlbkBU7u0ulvSn+mv4/wzTcCMh+AvrGTj3pk0Ks3XQ5lG8=
X-Gm-Gg: ASbGnctWyHEgA8Z59p2gsiFBVulnO1Xbb4lLt+FtNsLUTn0Cv5PBGeQm87gvXTeVw9z
	pPmDVLitvRLT1qJPifmOv2ORJDAUqSTInXEwoAF5v/5SyAinALrwlFUpgXt9KEVVarTROJ1WpoS
	oVqgpz/M5WU/hNS2iM1aBIENA7ynDT/JrSpZHH3v5+nHdA7DM34oQdS4LwhJamKj0VqflCdf9FG
	iHDx2yXOUspB5qpl2sknxzKEbj3p6EoH0d8ZRzImrb2PDcRZf+ynH+cfzN0qFa9bjwfdctDTe6I
	y2w2xL4Zq9HhcrW8Q/IQrSeYU6hBqT5IDHSaeXoqVGigw7dMs8G8NUl2dbHCXmoktSsLmJa2qhe
	3Arto2pAlxN2wwlAk4FLg3m0CeWbNFAWXwYSrWLMwiTJKfg5THRDZVMGBLnZs7yQEZOg=
X-Google-Smtp-Source: AGHT+IFE4AmOR394Md1/lG1S5vAU0ggYSm1xV3a69YcH+wAy86ZduiNSo403ld9BIeKBsd0fBst2dQ==
X-Received: by 2002:a05:6512:234c:b0:57a:f38a:397b with SMTP id 2adb3069b0e04-592fc9d6ee3mr2113775e87.3.1761426441425;
        Sat, 25 Oct 2025 14:07:21 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm953644e87.104.2025.10.25.14.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:07:20 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v3 6/9] riscv: ptrace: validate input vector csr registers
Date: Sun, 26 Oct 2025 00:06:39 +0300
Message-ID: <20251025210655.43099-7-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025210655.43099-1-geomatsi@gmail.com>
References: <20251025210655.43099-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140723_957133_38E6408D 
X-CRM114-Status: GOOD (  16.41  )
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

Vector spec 1.0 allows normal applications to set candidate VL values
and read back the hardware-adjusted results, see section 6 for details.
Disallow such flexibility in vector ptrace operations and strictly
enforce valid VL input.

The traced process may not update its saved vector context if no vector
instructions execute between breakpoints. So the purpose of the strict
ptrace approach is to make sure that debuggers maintain an accurate view
of the tracee's vector context across multiple halt/resume debug cycles.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 62 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 906cf1197edc..a567e558e746 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -124,6 +124,66 @@ static int riscv_vr_get(struct task_struct *target,
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
+	if (!has_vector())
+		return 1;
+
+	vlen = vstate->vlenb * 8;
+	if (vstate->vlenb != ptrace->vlenb)
+		return 1;
+
+	reserved = ~(CSR_VXSAT_MASK | (CSR_VXRM_MASK << CSR_VXRM_SHIFT));
+	if (ptrace->vcsr & reserved)
+		return 1;
+
+	/* do not allow to set vill */
+	reserved = ~(VTYPE_VSEW | VTYPE_VLMUL | VTYPE_VMA | VTYPE_VTA);
+	if (ptrace->vtype & reserved)
+		return 1;
+
+	elen = riscv_has_extension_unlikely(RISCV_ISA_EXT_ZVE64X) ? 64 : 32;
+	vsew = (ptrace->vtype & VTYPE_VSEW) >> VTYPE_VSEW_SHIFT;
+	sew = 8 << vsew;
+
+	if (sew > elen)
+		return 1;
+
+	vfrac = (ptrace->vtype & VTYPE_VLMUL_FRAC);
+	vlmul = (ptrace->vtype & VTYPE_VLMUL);
+
+	/* RVV 1.0 spec 3.4.2: VLMUL(0x4) reserved */
+	if (vlmul == 4)
+		return 1;
+
+	/* RVV 1.0 spec 3.4.2: (LMUL < SEW_min / ELEN) reserved */
+	if (vlmul == 5 && elen == 32)
+		return 1;
+
+	/* for zero vl verify that at least one element is possible */
+	vl = ptrace->vl ? ptrace->vl : 1;
+
+	if (vfrac) {
+		/* integer 1/LMUL: VL =< VLMAX = VLEN / SEW / LMUL */
+		lmul = 2 << (3 - (vlmul - vfrac));
+		if (vlen < vl * sew * lmul)
+			return 1;
+	} else {
+		/* integer LMUL: VL =< VLMAX = LMUL * VLEN / SEW */
+		lmul = 1 << vlmul;
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
@@ -145,7 +205,7 @@ static int riscv_vr_set(struct task_struct *target,
 	if (unlikely(ret))
 		return ret;
 
-	if (vstate->vlenb != ptrace_vstate.vlenb)
+	if (invalid_ptrace_v_csr(vstate, &ptrace_vstate))
 		return -EINVAL;
 
 	vstate->vstart = ptrace_vstate.vstart;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
