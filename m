Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F8DCC6B01
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 04:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCZ6OzDWMHntVvyg7tseTXBL3d/0SOqPk6E/e6XmFn0=; b=J1jykik2GLvOZL
	YV6LbY8a2JhxPDco/J3TAVaSkiNEhNKCda//oihRuWYa4gKJj2zJ8SX9lrCllOj3xHBTdIhTWXb45
	Gh3zG3SJlGjdRX02iwLXtJKs6zycOuDfoMUxPV0eKt3YxmouFyP2ktTrEBQrVOSMjPcvzpn67iY9V
	lCs2TgYYkKZHm5uP/off3NFlf5V3g1C5HQBU+30Kx4Zly3pTw/lM5UTkyoJBlKejsa4DgtBcRcq1+
	vazxCVCRnpCvEHJV4CM6kCL4hGqFBBJkxVEhLjczjxrk8/46sS9ot1kOiR6lW9k7iPk3nOJRMHcw6
	Hkdcj18+5lqcWtmAKZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89lO-0000000Glei-1xLq;
	Thu, 02 Apr 2026 04:34:38 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w89lL-0000000Gldq-3mIE
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 04:34:36 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-415b23dd6e5so212485fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Apr 2026 21:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775104474; x=1775709274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYRBDWPBDmLdbk71cyiKzWoWf8/A9NYHO+wwt8aJjzs=;
        b=etzvKcQBeJolECFssBfH/ye3OCXT+5OogMr4DMr4rk2V3zik5y0aukbhDdpC4fsP2e
         lI7bsNVtDLYsZGgFx6o0HHwUfqwo9qMO2X3xf1KchMT2LgpoloDjwzLdIMubjGyFYtkp
         LsG0fsa55Xgd2AbotPrkPGAOch8el6PJgtFOtQZ3ioywSBDm7uzTvItocGH5KJF4ltPC
         af1Z7/w0+NixQUjLOH+IMZ7w8VV/7bA2XNj7OcEe4bXXphGTu/vN3Qnaaqt3uyC+xhpj
         A4jDCK7ypEmwpCIUC/iPTT6eDX8HgUOb1+HwP4uxJkE1VrfUuvGzMC8OSSwsoSTXsSu1
         gOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775104474; x=1775709274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dYRBDWPBDmLdbk71cyiKzWoWf8/A9NYHO+wwt8aJjzs=;
        b=oENYRlg3n0JOi1vecIUpq1YThi11kUZkddldhfLGZeA59mTZARdrXU7aCPfjOvqacN
         jOa2Akl937rxhGT3PDbeiCK+aBT/e03P7luSe6vZEA4dH3YDxVpDr4Kq7hqJSu37ChQH
         lV+9I+Mv7jQvukzZFPgHkq4Q8pmThqG6dJbsjz02ZPSsBnAs2knwo1Uiqr8nXODdbBbf
         ksBJeqaTEy6aHsLYHlVzCcBNokcupdelbPMO28jO2MSz1VK9vpzp6aqlBU6IUR7NS5Lz
         X+438WRke+1jvrEA/fpwppuRq5MBcFCTCoR3ODDD/KKZl/cqiw7wEKz3+NH7eFIgUXEn
         fszA==
X-Gm-Message-State: AOJu0YyLNrY8gxWzQkaz+yiL9gkpwT6Rpp9xszqfPW4ogNAORlDoh3tW
	L9vvYFHfeSVeXusNzXjYux0Z2V3eFvh9qLXp1QdtUzDT+jbf/w+1y9kFbGjrASSXANsR+g==
X-Gm-Gg: ATEYQzx/mFR4mNFxGcdURREmmeRaHm+a2BaXYGRScOH8BxBaMY9NxKx1WxTT4Yf2Sk3
	Bb2qwe58Z2ZH69lvqp2OpVvWPQhR3AyUkVpTGLqoDNCBvyM28mBFpdUkxrZIyySJqw7fOxdsqVj
	qCTz+ZXKk4aqIgQ6GoZWcp6Mu2uGc8Gs1Ovzvyz7ZbJgM3XS0Y73U9kZjlhN2wFwv6oc8YlbPoj
	eHZoEAEL7eDtWra4Lp0e6RvPqPIcOJdAKKLJ6mlI5UsOKc01SVemwoM6g4XWEI3Oo1pMjZO88kX
	7vJh+EUnJF9aDPahPy1n60Cl4L6XjRYRVTUkfMAOdW3bhNakP2e0cAArRINUbfCSCj+DVRDw5pO
	oahm0zV1hE1prPFst+lfObK3CGy/ORNmMb8j7bjbK323LOiuCH9T3x69naOW0b2kx5pzKpZG0Es
	shfXmpzVGGioj56/1H
X-Received: by 2002:a05:6820:212:b0:67b:b847:f0fa with SMTP id 006d021491bc7-67fabc24b56mr3260080eaf.17.1775104474300;
        Wed, 01 Apr 2026 21:34:34 -0700 (PDT)
Received: from hinoki ([185.255.130.248])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm1139558eaf.8.2026.04.01.21.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 21:34:33 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Andy Chiu <andy.chiu@sifive.com>,
	Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	bjorn@kernel.org,
	alexghiti@rivosinc.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vincent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v2] riscv: vector: treat VS_INITIAL as discard
Date: Wed,  1 Apr 2026 23:34:14 -0500
Message-ID: <20260402043414.2421916-2-andybnac@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402043414.2421916-1-andybnac@gmail.com>
References: <20260402043414.2421916-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_213435_966750_5FC0557D 
X-CRM114-Status: GOOD (  14.38  )
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

From: Andy Chiu <andy.chiu@sifive.com>

The purpose of riscv_v_vstate_discard() is to invalidate v context at
entries of syscalls. So users happen to use v after a syscall without
re-configuring would see a failure. It was achieved by setting vector
registers and CSRs to -1 and marking the context busy. However, this
results in redundant saving of v-context if the process is scheduled out
in a syscall. Moreover, restoring the invalidated context from memory is
a costly operation. In fact, all can be prevented if we can delay
vstate_discard before returning back to the user space. To be more
specific, the kernel can mark v-context as INITIAL and set the restore
flag at syscall entries. This is the indication for the vstate_restore,
so it awares that the vstate has to be invalidated before returning back
to the user space.

After applying this patch, the context switch performance has improved
6.78% on vector enabled lmbench running on a FPGA with VLEN=512. The
result was obtained by averaging the output from the following command.

$ lat_ctx 2
Before the patch: 599.8357692
After the patch: 559.1748148

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
 arch/riscv/include/asm/vector.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 00cb9c0982b1..90f77e511cad 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -298,8 +298,8 @@ static inline void __riscv_v_vstate_discard(void)
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
-		__riscv_v_vstate_discard();
-		__riscv_v_vstate_dirty(regs);
+		set_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
+		riscv_v_vstate_on(regs);
 	}
 }
 
@@ -315,7 +315,9 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
-	if (riscv_v_vstate_query(regs)) {
+	if (__riscv_v_vstate_check(regs->status, INITIAL)) {
+		__riscv_v_vstate_discard();
+	} else if (riscv_v_vstate_query(regs)) {
 		__riscv_v_vstate_restore(vstate, vstate->datap);
 		__riscv_v_vstate_clean(regs);
 	}
@@ -326,7 +328,7 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 {
 	if (riscv_v_vstate_query(regs)) {
 		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
-		riscv_v_vstate_on(regs);
+		__riscv_v_vstate_clean(regs);
 	}
 }
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
