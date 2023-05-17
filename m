Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E58C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 03:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHHPqUzvp8Y8kK26A+DoelnCDmhcln7J/gNjNyilVk8=; b=VG0CKr5HwKWA1L
	UiGYEMd8zaJW0GgVLOOi4k75bpsk1rIaZ45nOd7uCNn+Hs8ZbHZ4ESVsuQ0xK+ZSUdsa+X/nlllRg
	soAcO65fBsGE2kl3sR/R7aqFqvtVfQjWMXgtkZOYbwjt7ZQTGc1vCFb+62n+eQaxOjnOz6+nxDySw
	DLjuzKwU8bDTAVDVargK1pUrFt3oF1DwuElZWjtk6xi64QYtxLeWkin5cSmFtRHZoUXPAakPK4UcR
	77r9COnmSAQLx8LvKKjB5P63Ljk36plwsBK3tCIt2uweQQsgTRsSA0jVw/7zaNz2H41yQpOSfCoQZ
	yA6NWy8gSxItx1c/wDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86W-0080dC-0Y;
	Wed, 17 May 2023 03:45:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86S-0080bI-32
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 03:45:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ae3a5dfa42so3088625ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 20:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684295126; x=1686887126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uMSZdlVzbxeM11qsVcr0sdcteuxEXHjRqP1IVvopNU=;
        b=NaiABcWCkvK2DCfRgsRBZ/BumHoPpPMfbt+vLGTc6mJZBbSsqJ0Qfs1mqA7kr8myUo
         s7kSI/PYlCeuqR4ZbKL9S1vhuAY+ZO32SdCRVFiTtC3/xKk1CUQDuNXIMAh3wyt3/G64
         rQWz6cmVHkWp9jnZhxAKMfX2GMLup8u+aKqErt2ZO3RuFuVlpDjKXH4tL2d1zxJYDeRP
         ECA8Kbi6BULm0yKVVaAKuR3xEaYyCpEWicvFRD1kFGuO1KsnamVYvfWDtne7SmUss8Bi
         uvPjR3V/VweHcFPDZkGddzvzmyH6a+8PLhXzZqGWD0Fq589AY6UlUaV1QRpGrKEEYisb
         4R5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684295126; x=1686887126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uMSZdlVzbxeM11qsVcr0sdcteuxEXHjRqP1IVvopNU=;
        b=QzgPVwmAmLEGcUkxFtH9hEA6D75MJx/5VzOaIawLPL9U4EwGe4Gxz8dpBqTFXkr6s5
         vegxSNsrEOWoi/5iNyHGfF9rdSGc2mWLMmqjslsnOwy9UdUqxC8sra0pNs04+5MAu/wY
         MtewJDVoH2gEfyBn9rq2qtI3f40MuO15CZ1ZpmiuOobuMAFTqVtmGpmu21mDDSBrAcFU
         rE6JsIIdzGWaqgfsDMcKCjFau6QttVHrf8h3RxBNY9i8WVb7PadJz8wSOKen8g3ai6Sd
         oV4BRJ+AveTWUbbtnsjlbHfkpdIqe/YVPLiRJwzaQw1r9I0qK+qefm7zq6F84lHZ37sA
         7sGg==
X-Gm-Message-State: AC+VfDz3X/IuutkUV3q8TP4dd/HLv1cnBEIS/oTsBVxK3vX0kUjkiLMQ
	NUWzpj6KN90ZkzQ7X/qZ+Rjl24MHapbJZQ==
X-Google-Smtp-Source: ACHHUZ4VwlgfLZwJWUKsSA1KMAjkQD96iP+U3wN3PhFLqe4E4WOUqEU/zeGOhl4OyE2MLWqyzdNQQQ==
X-Received: by 2002:a17:903:32c5:b0:1aa:e5cd:647a with SMTP id i5-20020a17090332c500b001aae5cd647amr54727835plr.23.1684295126019;
        Tue, 16 May 2023 20:45:26 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.83])
        by smtp.googlemail.com with ESMTPSA id t2-20020a170902e84200b001a19196af48sm16336746plg.64.2023.05.16.20.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 20:45:25 -0700 (PDT)
From: Ze Gao <zegao2021@gmail.com>
X-Google-Original-From: Ze Gao <zegao@tencent.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	x86@kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Ze Gao <zegao@tencent.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/4] rethook: use preempt_{disable, enable}_notrace in rethook_trampoline_handler
Date: Wed, 17 May 2023 11:45:06 +0800
Message-Id: <20230517034510.15639-2-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517034510.15639-1-zegao@tencent.com>
References: <20230517034510.15639-1-zegao@tencent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_204529_001025_E3109B87 
X-CRM114-Status: GOOD (  12.13  )
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

This patch replaces preempt_{disable, enable} with its corresponding
notrace version in rethook_trampoline_handler so no worries about stack
recursion or overflow introduced by preempt_count_{add, sub} under
fprobe + rethook context.

Fixes: 54ecbe6f1ed5 ("rethook: Add a generic return hook")
Signed-off-by: Ze Gao <zegao@tencent.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/linux-trace-kernel/20230516071830.8190-2-zegao@tencent.com
---
 kernel/trace/rethook.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/rethook.c b/kernel/trace/rethook.c
index 32c3dfdb4d6a..60f6cb2b486b 100644
--- a/kernel/trace/rethook.c
+++ b/kernel/trace/rethook.c
@@ -288,7 +288,7 @@ unsigned long rethook_trampoline_handler(struct pt_regs *regs,
 	 * These loops must be protected from rethook_free_rcu() because those
 	 * are accessing 'rhn->rethook'.
 	 */
-	preempt_disable();
+	preempt_disable_notrace();
 
 	/*
 	 * Run the handler on the shadow stack. Do not unlink the list here because
@@ -321,7 +321,7 @@ unsigned long rethook_trampoline_handler(struct pt_regs *regs,
 		first = first->next;
 		rethook_recycle(rhn);
 	}
-	preempt_enable();
+	preempt_enable_notrace();
 
 	return correct_ret_addr;
 }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
