Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E93ACCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 21:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d87UP4etv9COOdUM5JmXC5qhTnDQO3MAQWS+ol+r1Pg=; b=z9FrELhSeHfsXz
	B2wB5FelgcSP+7ctIMcIwV84o2B0AnY2zUrpmf5mRJXT9Y+FnCAws6+mqD0edF/1zcnAyP1xhl8Df
	DPE1Qc+ntTul1o8dWMuy0zkH2S29FPqD4F51kazKnf5IjmPEUWfYcym31cTQlyXHEaafPB2dihzat
	39IOwPJuo+eNRCh78eIQogi3bKie3b+lmihRGTAjk5/25QXA3UigPyJ8dDBy1ock+CsByduDlJQMa
	pZTxXUntedFJjpe6+z8GaC6bvF22ZJrqxZSYZyJopqpjK+maScijc/JdXeK2M6y1fm2N9JHb2D55/
	zzwyHA0atdUT/joUjnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTo-0000000Bl7q-1xaV;
	Sat, 25 Oct 2025 21:07:16 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClTl-0000000Bl6c-0kXT
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 21:07:14 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-592f22b1e49so3028565e87.0
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 14:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761426431; x=1762031231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOKLEyEqhroRvoLq2wOrgCP0+QeKumxXjJG7yF7kNYg=;
        b=YAO6Lya7+qtmRP+c4h+IfYCM7DXO8OWaNJWJ4H9nzjPgAg39DKgAP2vtNuCnOUpY23
         zwBMDvfN/dwnO7VGHh3Dcsv4R3KiUZbkCqn3RW4ekn3MFr73q6fKsmVla1/NIb+ATT+e
         wMud68M/LOIhXJVbjvphkvzDqfa8pdoTduE2Mx9T7fFp/XAqhGKuqUwdqEGr8lnMHxIz
         OWNX7Yosxj7M3qdqOeCSw4VOzIuHzxA6LpDLuXAGxg+yPVLzTsdIsQmYn8G2CuCu39rj
         RWscGxG9IVQq4gsQuxAPlu+xJNgm4Qxy5kE6wm7kBV2hMcKz1j7zIlU5TuykQJE1AwG8
         FAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761426431; x=1762031231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOKLEyEqhroRvoLq2wOrgCP0+QeKumxXjJG7yF7kNYg=;
        b=LJz4qaTBmuK07UlNsYY20G/D598rugnmWPJv45VDE01Hhv8qqxA0prrHOH31bTVwWb
         6cS2rXiMkTsouke3IWT4aBoJ4RmhT+Nnsej44RxvD9L69sghhFDM8TsIgaJ3TIIaaNo9
         iiQgwBQgyDVm3+wyR6DEn9a1mYC6EiX1m3BrJuI+TDS7A4LDpFUK7kyTgwttCCWHBRI6
         l19VHde5voVSVifiDmAUUFNnhVKJLHVrN09tiltbNgUxjxfrl0az/XffNj/dxPitEh94
         KNLTzE8U2DCysjsekQv22By6GzFFZC7PUzmwMnfO0KxufNDO7JniVvdKIsYQbgwrqPkJ
         wcZA==
X-Gm-Message-State: AOJu0YyEQkwNLs2UfJoaJhqL30Xh7ZgWoEugTliei5B5PvpN+57aMoL8
	XVBI2j682cbTccZ8sWZTUJvzuTsJAzx8ZIxG9XxTK+b1T1e8eTUaOrh+bkeoLdwUSRg=
X-Gm-Gg: ASbGncuMl0IJpScoSf3kHpOfZ7/AaHsdnWOdU8oDkitcR4HeVkdTkuChFAdPqsHf2dV
	7FYnmoopX7Z82u2ZCqIMO9NNPhxlF6l2pFGkYE5AA1KMzTIsDxLEOvSPuIJrym8QODp7eo+qnJ9
	AEkioEkbK2l5W0ANfw1dMuNjfDZAwc3tdt1cT0OnCxFiaofc8MCgZXEvGqHd1GoAswB7hdi7dz9
	IgjyKNjizdYdnU9xXEIOdD3VGDN7AB5i8ubU5FXaJ+zDD4X2wB6U+WN83NJ0KjR6JyErxeEt1HJ
	VZWuMR9mIM4nDlAUaLkcEw6/CvMCtMNDS+KXd+a7f+g2tBXoBsZmCRxe762bnq0INKDbsLXgGN5
	9nk7F3WjfTJWsNxCAsw+3/zuHto+oJuDjxGYXchP+oQz2LYsEWyfkScVYe1fm04VVIvk=
X-Google-Smtp-Source: AGHT+IF1PY8CjKZBltkRiaMjAPbsy0y2I5sExlfobv+KioSsAE6i9yPd2n/v6imAUn4q9skXUbuNAQ==
X-Received: by 2002:a05:6512:1581:b0:591:c93c:cf6a with SMTP id 2adb3069b0e04-591d84cf7a9mr11591651e87.4.1761426430511;
        Sat, 25 Oct 2025 14:07:10 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-59301f840dfsm953644e87.104.2025.10.25.14.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 14:07:08 -0700 (PDT)
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
	Sergey Matyukevich <geomatsi@gmail.com>,
	Ilya Mamay <mmamayka01@gmail.com>
Subject: [PATCH v3 2/9] riscv: ptrace: return ENODATA for inactive vector extension
Date: Sun, 26 Oct 2025 00:06:35 +0300
Message-ID: <20251025210655.43099-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025210655.43099-1-geomatsi@gmail.com>
References: <20251025210655.43099-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140713_235253_AB0DF224 
X-CRM114-Status: GOOD (  14.51  )
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

From: Ilya Mamay <mmamayka01@gmail.com>

Currently, ptrace returns EINVAL when the vector extension is supported
but not yet activated for the traced process. This error code is not
always appropriate since the ptrace arguments may be valid.

Debug tools like gdbserver expect ENODATA when the requested register
set is not active, e.g. see [1]. This expectation seems to be more
appropriate, so modify the vector ptrace implementation to return:
- EINVAL when V extension is not supported
- ENODATA when V extension is supported but not active

[1] https://github.com/bminor/binutils-gdb/blob/637f25e88675fa47e47f9cc5e2cf37384836b8a2/gdbserver/linux-low.cc#L5020

Signed-off-by: Ilya Mamay <mmamayka01@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 8e86305831ea..906cf1197edc 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -95,9 +95,12 @@ static int riscv_vr_get(struct task_struct *target,
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
 
-	if (!riscv_v_vstate_query(task_pt_regs(target)))
+	if (!has_vector())
 		return -EINVAL;
 
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -ENODATA;
+
 	/*
 	 * Ensure the vector registers have been saved to the memory before
 	 * copying them to membuf.
@@ -130,9 +133,12 @@ static int riscv_vr_set(struct task_struct *target,
 	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
 	struct __riscv_v_regset_state ptrace_vstate;
 
-	if (!riscv_v_vstate_query(task_pt_regs(target)))
+	if (!has_vector())
 		return -EINVAL;
 
+	if (!riscv_v_vstate_query(task_pt_regs(target)))
+		return -ENODATA;
+
 	/* Copy rest of the vstate except datap */
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ptrace_vstate, 0,
 				 sizeof(struct __riscv_v_regset_state));
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
