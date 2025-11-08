Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BC0CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 19:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d87UP4etv9COOdUM5JmXC5qhTnDQO3MAQWS+ol+r1Pg=; b=0k4tDGf0yjXF+l
	czEuE7pmfIMsdo6ru5UqbUzSQO1usgviF7CwW6/7k0Hv7Qt8omMRPamIdlcNvrX0lKgG5HgT2Iko5
	3fkjbjyIUwWuDhRgjHD1lRYSTL5dN+U3u0WiQj9TDmLp1qXUHKKkiGWhRNHC0D3pm8wmmba65peAy
	sByBqWsijjWUBlo7mc7U0pLvnAaaGXYK0HvVmb/nr2hXtZxisVR6xAjk/RMgTAnJHC6rErC8ZS9+W
	WQOviB2HQAHzpfVfilzqUE0vz94Wf2F0pCkF17om4p8ZZPALjbDEphski4DP0hTyl0Uqe+aa92EIs
	PQgeKUkx3R1qob9y3a5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopQ-00000003OrW-1kRu;
	Sat, 08 Nov 2025 19:42:28 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHopN-00000003Oqb-1Icp
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 19:42:26 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-37a33f49018so16053541fa.2
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 11:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630943; x=1763235743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOKLEyEqhroRvoLq2wOrgCP0+QeKumxXjJG7yF7kNYg=;
        b=BK9dNTaelhnkHDxasqoQx5MdsN6wKtYTbYyQWOHc+ZBSRV9FTQOo2JtKFXb6Lh8zl/
         r3MgWWj6PfS88KEbBjeffN/oawTtSbEoK878Jpi620ANZIDpJ+3g1ICkqTyIO3gwbFVH
         /3X/toLz6OMkMmGsxyIwcgDQCOxkaYWIWaLDQrAj+yPwDRzElBGeSp5Q4/ebgGXfBang
         PnEFiKW31potiz35py9k/maQlgkbGNIUM7VskyuJ67xpopqgkYZPX01F/L8f77uVGYo9
         1cUJaiurfo+RtzyxeT674aIpJXT3C6CUboccgSfZKCHGpwTipvjbNBnc3Zrm67ZmF4d9
         Hl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630943; x=1763235743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOKLEyEqhroRvoLq2wOrgCP0+QeKumxXjJG7yF7kNYg=;
        b=ZwXgarpUNsnLntabIJQoPCtpKkE43bwmXQTU2yaHxe/K+k0eogpPTFjAlQzOuFltgU
         M0RNKxhIESbFyIcbzNWRUSwH8k0bLPt56kPzA2SD8n+KoXatsNqzh+udiYYKm10UPoAp
         W4gunb+V08OXcM3B4SQtJzYwfF5ccX3Vk7MmtFgsgmxXzkXYxHkuxzdf7ojn2ghqO0Dg
         /45u2rue8cs8SEmfX/+Q9rQEsglVvE0GOMrvzaCYMmR1YvQs/QA986yK8v6u5Ifz1b9v
         5Jb0eQJYMKJ83rURymvApDqaXm6Wu/37QcDsCinGn6IHA+edrfimYLtONi6IDS6/CvoP
         dZ4A==
X-Gm-Message-State: AOJu0YwjOe23kI687fGHnIqjAsBqCuos/Rf2Kvr4z0sFZ1ZA7vVawZho
	hifVAR0lVmgDZ463ecGJ1k6ltfbMwR3cxygJaBftEaAQhLl/5JUwbOB5jYizEfHkam0=
X-Gm-Gg: ASbGncsWFYnR8j5H2jEQ9Y/WADs3/aeKed9yDDANnGhRYURTP8bBdeJfYwUJSD+uO/S
	6UBi4f98da5/bW4vvgFi82ImU6okrfdp77bkrihIMAPrCkt4SoSDJgpbeeeHHNJ9HpYyTiEfvqX
	MrlHMt8ErakpZc8yi0a1G+XJw6kKOlgJHwPJ3V4oaPtStw+mBhl51cIk7mFCPo+1Wl/sX9LQKz1
	A/GaaGCoyNLY2aKmEaRG4SWM205PMKkD02L6v9vWEFBEJsp8XYUbMjHnSkFEvAiHmqWCVoqdqEH
	N3krt+J5ZXp13kcc8P/ZEQuq5wLa64mE4t6l3OnTvwxd6YEbqjYg+RYirwlvHADLyR4ytyF1UNw
	KDel7emo7K1gveSewZ9vaosLCJJzCvEAL/YMy99fuOfaEMFLyYd4chCWmZUAq52LKzLLNqlAI0y
	b0hl74khMJ30Nm
X-Google-Smtp-Source: AGHT+IFd11o+WjkQbExqrkTtQGyasr3kUPa8k31aekfobs7VZTRb3CSjym9MsMeXrgwdvuMv8vFsDg==
X-Received: by 2002:a05:651c:4413:10b0:37a:2be2:4cae with SMTP id 38308e7fff4ca-37a7b309ebdmr7296711fa.49.1762630942471;
        Sat, 08 Nov 2025 11:42:22 -0800 (PST)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-37a5f0edac3sm22115421fa.38.2025.11.08.11.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:42:20 -0800 (PST)
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
	Sergey Matyukevich <geomatsi@gmail.com>,
	Ilya Mamay <mmamayka01@gmail.com>
Subject: [PATCH v4 2/9] riscv: ptrace: return ENODATA for inactive vector extension
Date: Sat,  8 Nov 2025 22:41:41 +0300
Message-ID: <20251108194207.1257866-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108194207.1257866-1-geomatsi@gmail.com>
References: <20251108194207.1257866-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_114225_375182_872BE19F 
X-CRM114-Status: GOOD (  14.70  )
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
