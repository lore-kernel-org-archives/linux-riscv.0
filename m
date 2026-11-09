Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADE5606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 04:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vpn/h1vR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZOm/KPf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=W2txjMUS86GB702b1oeZ9qMwZlckb8ov89ULMa0dC4M=; b=Vpn/h1vRVaC2oTqn2yOPmU3CzV
	aJChZHvoo9lqJjglx0wjqpgx1ShtfIhTZz6/siBb8wDq7Pa2WFJcjmUr9boXB2up4GNwq8vFHT+mR
	T86Wa8OV8fY+zbfTF8HZY/FWJOHNhvTc/cVe7wEIcD632fTtBW6GEr/MrRsy7sjTjEoWK2ahZyK/4
	gXolOYONiRHSlmJiutIoFd600n60RHN0VXtgILpmW0NmXky9rGWcxCALE3YlM9UF+RdXpt3/N+KgC
	ICj10GOfnaPIngCsw1wDL/HBJ0pE/irEUm4E/I4JXs8WYvKKRMsDMYwAVCKNXPAoh/zx7BzuEC1L/
	VRQBZVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGqU-0000000HIUn-48Gk;
	Mon, 09 Nov 2026 04:19:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGqR-0000000HIUI-1pdd
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 04:19:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so3793555e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 20:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197936; x=1794802736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=whvi6uOzLPFDK63sBlOyMwxJI0H9ZrvTEZmk5Ud1UGA=;
        b=qZOm/KPfI9Jrfx2qgTH/FGU2MbSrkHdIePJuTk9fpVACyj0O4C4FQe9n9cMzb+mnvF
         ejGzx2lQyRcqwFnqVCGmAMyVQw9ODh6+DxtHaVQcw+Lwk1KMG2h495/4w0D5ksrqrE5j
         tGTTjA98ger0KErkqaiuPmMp5TUV7m1Cxsa448rO+f+i7dvViZb/1BjzUU/CyQ8zmElG
         IAU4fCzhlmg2rgErIN8HNiOSAkqgNv/RIRquZKeOFG7uh9jpgbjh7kaerSfZhSRhU9si
         RtBNGnqyIp9TqXN1bQfYkekuPu7BIVRi6HgqQxGO9CYfHc/kxiPfoueLsgq/HtXrAOGh
         OT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197936; x=1794802736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whvi6uOzLPFDK63sBlOyMwxJI0H9ZrvTEZmk5Ud1UGA=;
        b=fYp/qwj0qztd39LaxZzQAaC4vXgY5dvlBeMcZ+NDF41O3die9HvOgx1VbwZPcw3rmo
         2Tt+wWSGHf8dIerXVBKotBKIZyPLv9IdWu5GnxxS7kcw7FOx0ovlpvF6ikr/Yk/Lrd5G
         4G6V7K4sBfabhc12wa2l0ZDVd+eJOTyDWTbT3gbTtQKAeCUgojWDiCSuRD2VbKSlfg50
         89RnFRLi+0NrE1Dnine1HX+buQoXiI9iIvx9VWSQy8CGuwq+k0j5XIfdc43gf5MnWV09
         zYwOxZ36HWbnH/2lO5KBas5mkEjsgCOvC02Gs1l/d6RyNLoN8btm2pyLNfeDiUydTVB8
         CyPw==
X-Forwarded-Encrypted: i=1; AL+hErGnbSJpmXdy8qke098DZQkrYHGw3PSgRpK3/WRrlFTRpUIhloDmg7A9chGaG6RKaI0AHaieez1zsStzlQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+dSCD7txdimHZmKlhGvL8iTRAYLTtA6zS2CfDRMO3gEdwNypAW
	ErEMnrRvUvFstJL6gP5wE0UWznVfAIUN/32It0WkPCAiVUUxoX7UJV8E
X-Gm-Gg: AYBFou01Imsf4EdRrPm05QAPzicd3iGfQX+eYqagCOLEdC3d/pg862RyTw7aUA5r9dR
	qtvsGtN2SDgmy2fA29a8jgQRndNGZzT87RiAL108VvD3CsHzxNaDg+LJnQcHkSBYmtolp3BWrIB
	f7xnF7lNc/1gq322YM+qjzRbRcvZklRPhLp7k8LMMuVx3+tpwzuA2TsuZ6QzBuguNq4gQFMLDNZ
	I1pLSx5ceWab84A97SGXIjGigkFwmWlf4eIuf1iCTiXId7+iKBFABaT8wGIrNxD4HgBltJAA5iC
	mFCAyNWOBDB/d2lVcCNNXDkIgXzc7v4OKC+qO6CcxachF2SE1xubCtvp9YfDpu0RdsdPGEfMFAJ
	9i/TneN3LdZmnF76WrBoiE2ZlNQ7qLC4tqB3zLJZILQGDbztMa7drqRzphsxVDQxat3c2RlhlG0
	43wW5DV4ugUfa0e0+hd5Nku2BfVOz22LjdBgsxnuURIkGGoOtcwu/8KwVL8I5yMOiuW7z8ryZdw
	BAJ7JuGuQzb7xHPjGnUqb1F3wWi8VYTbwTv3eST4JwKlUjRRmi736wQfjSy33Einn8HhMyF0LOB
	S7Mkk85bUgJ8UWbpuCppHNeS4xAqALe5W6AlBbh14ZAzAeqRwtF10PXoFYCF5Gqxd8O/RZPp2/L
	RMOavTtPpUXjvOKxmt1eUgT+HoZMINiWestiNxRBrkLi+HabmIaoewCThdq9A+h/tzpU58X4kyl
	noOKy6rMj0Q0foup5mFFYTxS2SIVZkvC5ZAz1V
X-Received: by 2002:a05:600c:8714:b0:4a2:150f:1609 with SMTP id 5b1f17b1804b1-4b963c767a3mr47264145e9.8.1794197935987;
        Sun, 08 Nov 2026 20:18:55 -0800 (PST)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-a16e-6b01-5d8d-9ced-49ae-4521.310.pool.telefonica.de. [2a02:3100:a16e:6b01:5d8d:9ced:49ae:4521])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502d5b1sm135598225e9.5.2026.11.08.20.18.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 20:18:55 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: entry: Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr
Date: Mon,  9 Nov 2026 05:18:45 +0100
Message-Id: <20261109041845.33695-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_201859_492801_F3521207 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ret_from_fork_kernel() and ret_from_fork_user() are traceable and
return after syscall_exit_to_user_mode() enters the RCU extended
quiescent state via user_enter_irqoff() on NO_HZ_FULL CPUs. When
function_graph tracing is enabled with
FTRACE_VALIDATE_RCU_IS_WATCHING, the return hook runs after RCU stops
watching and triggers the ftrace_return_to_handler() warning.

Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr.

Fixes: f955aa8723a6 ("riscv: entry: Convert ret_from_fork() to C")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

v2:
 - Drop instrumentation_begin()/instrumentation_end() around the kernel
   thread callback. They only feed objtool's noinstr validation, which
   riscv does not have (Jisheng Zhang). ret_from_fork_kernel() and
   ret_from_fork_user() disassemble identically to v1 (Clang, defconfig
   with NO_HZ_FULL and FUNCTION_GRAPH_TRACER).

v1: https://lore.kernel.org/r/20261107194931.69176-1-kmehltretter@gmail.com/

Tested with v1 on mainline d48723711bae (after v7.4-rc1) under QEMU
riscv64 (-smp 4) with NO_HZ_FULL, FTRACE_VALIDATE_RCU_IS_WATCHING,
PROVE_LOCKING, nohz_full=1-3 rcu_nocbs=1-3 on the kernel command line,
and function_graph tracing during parallel fork bursts across CPUs 0-3.

 arch/riscv/kernel/process.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d1cad..6f2b46d1a8e98 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -225,14 +225,15 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
-asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
+asmlinkage void noinstr ret_from_fork_kernel(void *fn_arg, int (*fn)(void *),
+					     struct pt_regs *regs)
 {
 	fn(fn_arg);
 
 	syscall_exit_to_user_mode(regs);
 }
 
-asmlinkage void ret_from_fork_user(struct pt_regs *regs)
+asmlinkage void noinstr ret_from_fork_user(struct pt_regs *regs)
 {
 	syscall_exit_to_user_mode(regs);
 }

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
