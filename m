Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F3AEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qol9QqwC/BiPhP85UUuNzh/FjSMx4ZkJLbC6Gpe9LmE=; b=mVgL+Zvb7Fu/gx
	WtlWk+hg0B2PMg62HIyCuTZb6kz3B8HIJWG11aQuGO3iMvDCN3brWawBU/c7D9InDvNGLK0fbjO9G
	MUw7I4HFPRBPtRELj3wzSQgGxGFZk5hSDwE7vLNNXQxV4eRpwq3PwFaUgrIof0knRFW9MnzIjuzCM
	B2/7FpGGZRMjwgyKmJQxI4SfpnkXSKa1p+umR0VjpSUNprP/3+fN1NZYvfQx6WsxAjknDQkaxPuID
	miT4mD5eOeN9z/U/3CrRp+cJ/K/zCOfEfnvWByePc/7oBzIc4/Zu8eDt7RUi2tQZgnOpqyucMlEQK
	PlPetDZj97Ocnik1VKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM17f-005zsZ-0K;
	Wed, 19 Jul 2023 06:57:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM17M-005zcE-0F
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yeYxjLuTkeXplzaU1/5MYQdHyT2ovErfxDS2RgTO3Ok=; b=kzU/I648+nDQ1BLx3OyVpAibd8
	hU7oTVeX3199A2DAW65I/qIRMAitzFMGRlYKNwXuR5tSB/D0Z0uYAd7zya7aD5cD0a1DXMqKnvtMd
	NjCxWIYuruiEGEYGEu9X7hn+/8Lh13+kMeIt18GJbdHYyxFZgJSV07hZ0PimzWnloVfOWSq1zIlSL
	ftPvkJYQsf2JPhdkJRhtT52bBM3T28qLlujppTOw885/2P7VpRiNqne7CbSu5bHd52U9HXJbwbRbV
	G6iO2EydISYs48A5rAqvcAmxRwhVF4KyH0EEalx1juPGuBl+SaLUya2aUcl3hqEAm8gi+wAY8RNzJ
	EOGU1atA==;
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLnc3-00Bl52-0m
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 16:31:49 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-66767d628e2so3853052b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 09:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689697784; x=1692289784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yeYxjLuTkeXplzaU1/5MYQdHyT2ovErfxDS2RgTO3Ok=;
        b=gLQjkG4fVekO4wKfOEhQiTxp/MrdgHIZnXQ0WmW0vwH325FTQMH+hvO0Pl6Tv4So7B
         TCAB08k/nZ6tFUTBDeGsVNR9mEAipRHe0EIzaEVBs6wXYt6zGOPX28c+scik8leIgk07
         eXHW9moGIYwa1vSPSLZqXjFacnO4ukAE8io9e5ttRdydgXuNH2kjH/YQyI45Esm893uf
         GJnWKDfoIhvCgOP1jZL1yqtNK5n1DzSHjkMwGIunf7HYrnEdIAjkNt8C4/cbrV6ZnN1G
         J1XVF3sCTJ/XkxODVioUM9fy0W9h0Uo/IwsR9bTOhOMXUXsIx2qEzGpePAVqsxehokRB
         WS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689697784; x=1692289784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeYxjLuTkeXplzaU1/5MYQdHyT2ovErfxDS2RgTO3Ok=;
        b=FVNc7K9aaoiLj3ToC+2YBzK+RLzSvPviKd3mQ+w47DcDAzLw04+/36Ke3fmXP5CZzm
         hWxf3wFjf6oBcXuxMti1l1TqBFgiPpZ2nbhHUbHrogNQHzqRmi7bKP7YXrUBior5agrS
         /MKmHK0B1wnR110FbYEzyrqCCVRb0DlkDIAGjkEjHFHguRs/5TvKuk+A/ot4bPUQ0d3D
         WBa8DuCQjsPedqzyAsMXKijHVWwXHx7xCbKkSJxj3BBwxcqklDC3vbplJsYAHaIhWwlI
         ixme4CeyhPdddQ+gItL7Flhw9Pqb9YCvJUg8WgjoRiBFG7b8u7c2aDzEeT8O+WqwCla8
         Eubw==
X-Gm-Message-State: ABy/qLZ57nrvYEeWxcVbxwop/k8rKq375lFCAN8EttFVxNMYlIw+AgLb
	9Zlmf8UwoxsuJr4L5ILxHuk=
X-Google-Smtp-Source: APBJJlHJ1Qy7cPNo88MjFDp9ATIP+Ij4hUgUh/REqcmbOnaMxlELvzKUTeKwAjO70btUmn9wUqG1KA==
X-Received: by 2002:a05:6a20:1443:b0:101:1951:d491 with SMTP id a3-20020a056a20144300b001011951d491mr17658741pzi.6.1689697783544;
        Tue, 18 Jul 2023 09:29:43 -0700 (PDT)
Received: from localhost ([212.107.28.53])
        by smtp.gmail.com with ESMTPSA id g22-20020a62e316000000b0062bc045bf4fsm1807671pfh.19.2023.07.18.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:29:43 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Celeste Liu <CoelacanthusHex@gmail.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: [PATCH v2] riscv: entry: set a0 prior to syscall_enter_from_user_mode
Date: Wed, 19 Jul 2023 00:28:46 +0800
Message-ID: <20230718162940.226118-1-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_173147_387942_8A8D7E78 
X-CRM114-Status: GOOD (  10.19  )
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

When we test seccomp with 6.4 kernel, we found errno has wrong value.
If we deny NETLINK_AUDIT with EAFNOSUPPORT, after f0bddf50586d, we will
get ENOSYS instead. We got same result with 9c2598d43510 ("riscv: entry: Save a0
prior syscall_enter_from_user_mode()").

After analysing code, we think that regs->a0 = -ENOSYS should be advanced before
syscall_enter_from_user_mode to fix this problem. In __seccomp_filter, when
seccomp rejected this syscall with specified errno, they will set a0 to return
number as syscall ABI, and then return -1. This return number is finally pass
as return number of syscall_enter_from_user_mode, and then is compared
with NR_syscalls after converted to ulong (so it will be ULONG_MAX).
The condition syscall < NR_syscalls will always be false, so regs->a0 = -ENOSYS
is always executable. It covered a0 set by seccomp, so we always get
ENOSYS when match seccomp RET_ERRNO rule.

Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
Reported-by: Felix Yan <felixonmars@archlinux.org>
Co-developed-by: Ruizhe Pan <c141028@gmail.com>
Signed-off-by: Ruizhe Pan <c141028@gmail.com>
Co-developed-by: Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Signed-off-by: Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
Tested-by: Felix Yan <felixonmars@archlinux.org>
---

v1 -> v2: added explanation on why always got ENOSYS

 arch/riscv/kernel/traps.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f910dfccbf5d2..ccadb5ffd063c 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -301,6 +301,7 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
 
 		regs->epc += 4;
 		regs->orig_a0 = regs->a0;
+		regs->a0 = -ENOSYS;
 
 		riscv_v_vstate_discard(regs);
 
@@ -308,8 +309,6 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
 
 		if (syscall < NR_syscalls)
 			syscall_handler(regs, syscall);
-		else
-			regs->a0 = -ENOSYS;
 
 		syscall_exit_to_user_mode(regs);
 	} else {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
