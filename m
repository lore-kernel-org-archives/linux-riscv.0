Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577E9CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 19:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5Ue7E6AABdzC0u44urmtEs9rWAKmM0pQ5/4/HP5tfE=; b=XdcJ11hHLA9oyU
	tGKes+WODJg6Z9398FrNPkfNYWUqKESd7A51F4j55VwvIsVQb80yp/YXgPzdpLYbRSaD5LzG0ottm
	kWqjicVyaFKqfYNbb1NIGTkWwHMj+hEaoN7mFNn9KiqnX6QW+epPvM1RSPkizN2iAMinZsQf98STL
	gXQuxOPJk1ULFeLf9L/1YQXXLYJGYM3y8Fa1syWkiVqObwJeHSD8l/o98d0FFavaPwvxpv65Lf55O
	nJpIbIYx0vKEH5EFAW8IVpWoHyv7bZTOOALS49GHfFm4eunxnHUw8lc9xuYCEG1Yp2cow+H3aN1ML
	Mr4Kka6vLmsKCiDzmFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopf-00000003OxY-2hPp;
	Sat, 08 Nov 2025 19:42:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopc-00000003Oug-2opc
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 19:42:42 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-591c98ebe90so1908900e87.3
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 11:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630958; x=1763235758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYGbqwLXExmna8eBWQ52VSI73UhSuti8d9ZiNWksIVc=;
        b=hzlWaNXJU/QF2hbVMsL3/9zb4eeH/bnqUtt39nQI0sQ36DWB8XQq+kRJWslhPrC/1B
         stYG5ehzOOl6cixcsx285Wi8i61Gq4Eo0afT9FRwgnUpm+ZM3nwDbbYzz7CP67sjFjMZ
         MDfD4qDUzrtUsPCgVZN7j5RB/HyRBEDF+bVb6GBqhr82rUcNqMCS8MVEYL3SMOTkfmgK
         E7Syv0tbflxEK/YgU7qhvazOmvuf7+c06NCRUaJrOqeVF3Y69IWXs06tC2aq8VYiRncG
         HlzeuPF2hNrpNmp7oRgaquCUyuI83R/u8IxsUMeNPt1aoPc03wfMjqj2Nsz4Yykx85H0
         nepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630958; x=1763235758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hYGbqwLXExmna8eBWQ52VSI73UhSuti8d9ZiNWksIVc=;
        b=BzaDkCTGsQrOX1aR4mvUArGaAgfQPnN5mF89eE24zj+dD5OVoqBd+Zl5yR0G4ubG8i
         ulI8RQLSpsCpHI+Ai7IHH7jHIMZtce/qoVvp6v79lZW9jGdmX9rVCKZfCRgMEamRwdvS
         rGkIgnQ3IxWZgsNZTgwekVYwqBrgonbfW1QEjZU6LY823j4UAFlpXkcg+8rMwh4I9Fv7
         cXtwXTGemZnUc/UT7t3vyHoRGG1HtuTQgOkf7HLPoMuwqZgVnZbL4Nx+Z1ICX7N2Am1a
         SgBlC7IRf8491ZzfUVMI/q3xTRcdNbl3rg4LyiWBu69LzblLQ9m9KxUSi4UNfwj+W0+6
         VHkg==
X-Gm-Message-State: AOJu0YwDqe/2BUQjvmCeUZkVWR9xkDryV25j2orJsxSBswY7FbsytyDb
	mZOrLgllOvSEzoCAbpxonkOzHfpWE24AwxLvIWuMjgHIvuJy+PoODcLPdkuRdOvFO+0=
X-Gm-Gg: ASbGnctBc0QBmZFQ73d5Ikmu0G9NWXj6JtJIbjVlM1W3h2RrovtTQHAQEuSwi5qQpZ1
	vlTmQHetp7cVTdxojhtgJKGT1YbPYWjwPJSZ+rhMiqkDnrT7+NoaJ9F/4YLtpZF8r8ylO/Lv0SB
	NgCFrPKQnkO6Jtro+AS28W/cPanxC53kzPO/Wx3dvHEihU58zfFNrv6lhjkThmUUATXp9faOXqF
	CxieyEgGwDmRst3flpQwPFw8ogxDz6Fl/pxMRgC8G0WMqei+osF21ce5pj1cMaaEJAO2Sw+F9v+
	k+1HJwC6d4AqJMlDI3hw18Kg+uBc105nJg4J7Dkw5rlBSO8Xb7aXCqYIMl285vTyX6aoDeQnT7K
	+X4CB41upVwTNt4Am0BaHQCC+lzI3kFmeSz5/JfPJxNPD1J1UzII43spDtMjblPUktY3jt8vZ8f
	OLNQ==
X-Google-Smtp-Source: AGHT+IGCGTuLFvx1ywHQFavK6M7uVgMXiMcQh8hxSwydElhFvD3mPQcbttpE9Nqhi6nEDN0y6TVfhQ==
X-Received: by 2002:a05:6512:3da6:b0:591:c862:2b2e with SMTP id 2adb3069b0e04-5945f205993mr991066e87.45.1762630957976;
        Sat, 08 Nov 2025 11:42:37 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37a5f0edac3sm22115421fa.38.2025.11.08.11.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:42:36 -0800 (PST)
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
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v4 6/9] riscv: ptrace: validate input vector csr registers
Date: Sat,  8 Nov 2025 22:41:45 +0300
Message-ID: <20251108194207.1257866-7-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108194207.1257866-1-geomatsi@gmail.com>
References: <20251108194207.1257866-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_114240_730938_2F58D1CA 
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
