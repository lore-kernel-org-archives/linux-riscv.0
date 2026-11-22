Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF6606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 18:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bIagfUEW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Mime-Version:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BK//GjFUnkWsJHyu5lQ9wJNVKV4AyeHcghE7GRcYg8s=; b=bIagfUEWvWh/C/E8L82kWYrWxe
	742iX8zQMcXq1ecBgk4n1tc+Tbdmhmu3yAYzlALA07RZTa+00A1eFEKqcCK6BQpid+VWf1plGF3rr
	n6KOQi8iaaPHmd56+oh/OGnIH01Dlje+yOceWsXHdeKLLxZUdpymInzNEgEwT+w66LsThH9KPLRZ3
	vQ1ZNc7WchB90jAnSE7CR7k2RHSCxt7NbI6VIrGjooSNtxuVhlPyVW5BduISoFbzaB8JBCKwj00xh
	io6Hqdew7L2F7bPWs4Et0R6cZZi/LisE60tCwdyXFycUyT9aJ90Su7msWGRvKOA6xDzz0KvIb4Sau
	cjJdGrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC9N-00000001W3F-388q;
	Sun, 22 Nov 2026 18:18:55 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC9K-00000001W2a-2Hu9
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 18:18:53 +0000
EX-QQ-RecipientCnt: 8
X-QQ-GoodBg: 2
X-QQ-SSF: 0040000000000040
X-QQ-FEAT: D4aqtcRDiqQtbsZxYg5kKrZhFlAOQ0dvpr/wz5oBo58=
X-QQ-BUSINESS-ORIGIN: 2
X-QQ-Originating-IP: IMdIvrQZYyLhY+74ZVC1JV8JkWdl0Lly2jAWj97/dkM=
X-QQ-STYLE: 
X-QQ-mid: v3sz3b-12t1795371479t8cade204
From: "=?utf-8?B?6buE5Y2O5oiQ?=" <1112433017@e.gzhu.edu.cn>
To: "=?utf-8?B?bGludXgtcmlzY3Y=?=" <linux-riscv@lists.infradead.org>
Cc: "=?utf-8?B?cGFsbWVy?=" <palmer@dabbelt.com>, "=?utf-8?B?cGp3?=" <pjw@kernel.org>, "=?utf-8?B?YW91?=" <aou@eecs.berkeley.edu>, "=?utf-8?B?YWxleA==?=" <alex@ghiti.fr>, "=?utf-8?B?ZGVidWc=?=" <debug@rivosinc.com>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: [PATCH 1/1] riscv: usercfi: bind signal shadow-stack restore to the active shadow stack
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 23 Nov 2026 02:17:59 +0800
X-Priority: 3
Message-ID: <tencent_7D0AC8F176A26AB26D61F6A8@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-BIZMAIL-ID: 3799301788162156059
X-Address-Ticket: version=;type=;ticket_id=;id_list=;display_name=;session_id=;
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Mon, 23 Nov 2026 02:18:00 +0800 (CST)
Feedback-ID: v:e.gzhu.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NafziRg7Bx695yxYMRy+91ZtTDESzRZMc/4mUZ6G5JcVjkNGJ8Ll/uER
	rZjJkxeJkjDjEGQePQBIyhUPdY0r7+vKL40HqHVexrJu+KcQeGf5/vV5W7MoKjz9nODWj6r
	we+B+n/DKchS0bqdtbbcAM5hDDgJVUtM3uKlTLGsFhncbz1uTklRHO69X9zPE62dBGYu1rW
	QMEPOqDlptwp9rFfwTIfIUFCiCatJ1teli/CWjd+6tyfWUwN5EKLlGk2xUwcYyD1XsSgBLl
	qqJUxRizAqKNBPF+ChpwHJ/TKy9Li4nFsNorhZ7BPJxMvKAPCwYjEfJVkXRfPqKMIrJ6ecD
	qYkHAsJvRhDV2YPt3qf1m1qe7cqbN/yZeS6pnIaRvHOZaQFMn1oSiZvi9e2zv2Wp4KYGp42
	vIaHmjcvFke9yzRvdkGfsvccSxdrXo1GtI6iVtjbOIGglk2bc0SEgqBdDDAVjZAEDWqPyUQ
	e7D5cddWrGf8Yqe9svARYvKr89hbrlJwvvteE/Qcv7wCjyPMltEfl09L09xQ0EvaSO8le6k
	BMPAS5kJqf3kkOV0wVv/0ajSMXVtyF5Ez0Udyci1zGIiPukmapMVX3SxiyI/t1pDT+ZP7AB
	c1yqJUB36ufzqQ+ZX75eJ23OnOWs3ndBVYP2C0ZK2eze4n9MCLNKyxm4QtHqh5vjrIy4fS4
	2HdyUjNx9EYEqhnUQlXWFQvrGDhQK33s0neHx8Fn+3yhTXOQGGFaDYxJbjtBHY/LN1N1N65
	7xLLTpWpBq2/lfts31xYgm3sDM5WHHOoFmJCNQlDui9Rzba2519u9yye/H5jA1zA6DNuSLg
	sfavJD2AloK5bEaAH+N9laV5aD5qOIfAMP1jIGBW6sZDj9ezDiMiR0eW85SPxFYp++ukFtJ
	C+P06NjPNbk0F6JNoW3pXzZW4d7jZ1LtQ7Dbv6hY+tKXEqeV7cTH5ePUBcxYFjpibyhl7hb
	6abYq+PUMRCe7kxM8tNv6T2KXDLRI1QTF8kUwPfPWuM/n+tlsrwRYVHGFTlrg2lLdVT1uEp
	r3nfk2/5rGgbTmpbP+
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101851_249681_C66A8390 
X-CRM114-Status: GOOD (  16.07  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hello,
Write it's for usercfi,
restore_user_shstk() reads the shadow-stack pointer from the user signal frame (sc_extdesc.ss_ptr) and validates the token found there only by the value relation token == shstk_ptr + SHSTK_ENTRY_SIZE.  Nothing binds ss_ptr to the shadow-stack position the kernel recorded when the signal was delivered.

A corrupted sigframe can therefore redirect the restore to a stale but still-live token belonging to another signal context (in-bounds and genuinely valid, so the df333b72c0e1 bounds check passes); the kernel accepts it, swaps it out, and rewinds ssp to that token's position.  The result is a kernel-mediated shadow-stack rewind to an attacker-chosen depth, after which sspopchk() accepts return addresses that are only valid at that historical depth - a backward-CFI bypass reachable from an ordinary memory-corruption primitive.  x86 CET does not have this shape:its sigframe contains no shadow-stack pointer at all.

Bind the restore pointer to get_active_shstk(tsk), the position save_user_shstk() recorded at delivery, and fail with -EINVAL on mismatch.  Valid returns are unaffected because on the happy path the frame's ss_ptr equals the active position by construction.

Verified on a fully hardened instrumented target (PIE/ASLR/canary/RELRO/NX, clang Zicfiss): the stale-token replay chain succeeds on the unpatched kernel (67/67 among completed recon rounds) and is blocked on he patched one (52/52), while normal and nested signals, sigaltstack, siglongjmp followed by a later signal, setcontext and swapcontext all behave identically on both kernels, as do the official signal kselftests.

Fixes: 66c9c713de59 ("riscv/signal: save and restore the shadow stack on a signal")


---
 arch/riscv/kernel/usercfi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -207,6 +207,15 @@ int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr)
 {
 	unsigned long token = 0;

+	/*
+	 * The frame controls ss_ptr; bind it to the kernel-recorded active
+	 * shadow stack so a corrupted sigframe cannot redirect the restore
+	 * at a stale but still-live token from another signal context.
+	 */
+	if (shstk_ptr != get_active_shstk(tsk)) {
+		pr_info_ratelimited("%s[%d]: shadow stack ptr mismatch in %s: expected=%px, got=%px\n",
+				    tsk->comm, task_pid_nr(tsk), __func__,
+				    (void *)get_active_shstk(tsk),
+				    (void *)shstk_ptr);
+		return -EINVAL;
+	}
+
 	token = amo_user_shstk((unsigned long __user *)shstk_ptr, 0);

 	if (token == -1)
--
2.43.0

Thanks,
Looking forward to your reply!
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
