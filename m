Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBC5C624D3
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1Nwe5rZb+Udc2N5je23MTCf9od7EOLzqaMc+cmwMXg=; b=BR9YQ9rVeK7qfX
	i5w48uAz6mcPK/G3ga0oJUOuKKoWrbooW32hXuNkXGcUFu4RFRoS2VgxuF9ZsckdhxRgtx3o9rjPh
	IW80ad2M3UAaxkd5swJXXoW8e9s9emXtBBngME+p4qLwOyaQq/EMpE/OVFeF2UtGoxIW+sZVjkvo+
	aKQLuwEmnEe7h3UDatfT07/9m2DDpbgl55NVpv+m0l82vnSbhVxOMwWmLjMsM8DqnEPLYx8BQV9Zu
	SM/uDCwGU/rQKwZ1yYi6EcngH4HEhPrdSmfjKtCrMgnRZlARKuJnTTiQrwzNRq4+C5NfU2Nazku2z
	tn6Jn0caGQ+9Zc8lDYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwv-00000003DCR-3b34;
	Fri, 04 Sep 2026 19:51:45 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwr-00000003D8l-1W0q
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 19:51:42 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-85590c5aeabso1020622b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788551500; x=1789156300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhQhsQ4UfwQumqLXBrbDqGkg/NZUYL46Pvxy1S1ZxCg=;
        b=SwsL9NaVD7K+FjUAAUIP3IQ8jcAGx8iSdAAEsfjSXnriUXK5n1FewJPX5cvGugv7FN
         udvQEt0O4d0q12JIkCdJYfewF3otnFBtqRIRPpvSKWg60DGJChTuyaRZ7pXZiB0oB0QQ
         3HZd4QrNxC5hlMMxx4VgFwKXogpyTa1RfSM8pmZ2Tvw7DS7fxLEOAsivItHUlKeeYu5f
         0h+BB4Yuk1XNi0Y2IqxVdvOaOIACpVe/CDzWHaqpsAMexr/NmCLC6TNApUnjCfUPgo1t
         KU3W5VxQL8QgTPPdKPthZTjBEEmqlLkM+u9igCyOvwOahehUTfRHd32G2nynHHTcQDHG
         XL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551500; x=1789156300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhQhsQ4UfwQumqLXBrbDqGkg/NZUYL46Pvxy1S1ZxCg=;
        b=FFGHa+Q9RzjIVCysynzmh/nBO40XJkEOVvd3w0RdPje73GkieU0Srdvw6WO36hpwyE
         mODxtQ1ivSDiv2//ilixXzZ1/O0gyswoda64RbTZ038IOjqkMIiMtRg2PyB6Gm+nHzkp
         3dG/Ud5baxj9nqLamhs9eOfLTWsgslAQse0CLSt7vv+xRuGgXdoMqKP9z1ItEkUbJS/2
         +Y8DqF86KHTOkySidWfHnHaTv7ylxKbfgnV1FIw1AFclj8EwSI6V12D2jl9A5Eedsb56
         q9wOwEkI92EWlkwy71QYNezkM+sst/PVl8SpVy2m4lWUpxn7BylMhJZ0SWqC3HkIno43
         sqZg==
X-Forwarded-Encrypted: i=1; AKwUvBzaUFAIssZpA8x92YoYbDd4DwG1wugpxYkSzJI42W7YlF2mi7DSV6662JMO1ffoe2dflgLK4coPGO8+YA==@lists.infradead.org
X-Gm-Message-State: AFuF++kcol9J6GBVIWmKM92mvLbpgyCB2fek7xjcHBYxvQI1j/50AJh3
	T4OsLhznL+R4DRQdEqJxLTkRdfBNAYMNGzIKwRA4rmGXSMTXHGFzt8Pw
X-Gm-Gg: AYBFou26DlASAFAy+nxbks08tx+PrAq51RD+eSKYnNHXYD83opKsmXd+6Ie6d7N4nFH
	stEZ1WuEjn/1PtrtSL9r0gKYDkrTAtIW8CSjsjoM5hr8v9EG4/Q1FE+cwBwRKZBllzQDjPzLNx/
	2CRoA5+pgIS7D5wHM1vJQo+iXSMz/lo79eE0wEy6zQeblJx6xDhBPvF1uZ4WKlJOEHksgAkrjso
	+EeJx6aD8uqpzxxOfY1AmvOXvz4ZGeS7a4vq/QKsNVI75Aje6Ebfn4eAW9pqLzmSLztVlQMLQr2
	lYnb2lnhhARbaCNshczPEZFGstT+Ks0pRRTVoCXrztadSS2EMNv7OC6omxkTMLpQNsrnyNfKT7P
	RFrYdJXyBDeRrR9HHdbzMXJhWBqQ/nHPR4u3WlkmuIaEBzf5uADn52O22kT2nJGsIdS58T5SknX
	gDbZxtqVvn0wgZy1aO3FqbfqZO/1yIcYfl3HQLTpr/c4x394GvOcMm6EXNTtXBMQv4gQ5cmKTIk
	H4ZpdAKHETDo/iHjAb5yHqXntt41Yx7CJwz31dh6oepDJHnHD1xeSFJWbu9hryL2Sqq8flXivxr
	aTwW31xZ0ZJxYCIrjsekCDvHgn/FFtzc4oFOOg7x7mmRAz3688WXBPfFzn5ZiQpA10f/kwQCjek
	=
X-Received: by 2002:a05:6a00:9286:b0:84f:77cc:63cd with SMTP id d2e1a72fcca58-8616a06be4amr11190015b3a.17.1788551500394;
        Fri, 04 Sep 2026 12:51:40 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615404876fsm1497684b3a.59.2026.09.04.12.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:51:40 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: bpf@vger.kernel.org
Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Jeremy Jean <jeremy.jean@oss.cyber.gouv.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	apais@microsoft.com
Subject: [PATCH bpf-next v1 5/7] bpf, riscv: Use resolved pointer for timed may_goto
Date: Fri,  4 Sep 2026 19:51:30 +0000
Message-ID: <20260904195132.141068-6-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195132.141068-1-sidchintamaneni@gmail.com>
References: <20260904195132.141068-1-sidchintamaneni@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_125141_400737_2E8D946D 
X-CRM114-Status: GOOD (  10.51  )
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

The timed may_goto fixup now passes the resolved counter pointer through
BPF_REG_AX instead of a stack offset.

Copy the pointer directly into the first argument register rather than
adding it to the BPF frame pointer again.

Fixes: 6ef8ff20c30b ("bpf, riscv: Add support for timed may_goto")
Reported-by: Jeremy Jean <jeremy.jean@oss.cyber.gouv.fr>
Link: https://lore.kernel.org/all/20260824213158.3755932-2-Jeremy.Jean@oss.cyber.gouv.fr/
Assisted-by: Copilot:gpt-5.6-sol
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 arch/riscv/net/bpf_timed_may_goto.S | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/net/bpf_timed_may_goto.S b/arch/riscv/net/bpf_timed_may_goto.S
index 02c637d87420..8c03e272e0bf 100644
--- a/arch/riscv/net/bpf_timed_may_goto.S
+++ b/arch/riscv/net/bpf_timed_may_goto.S
@@ -6,12 +6,11 @@
 
 /*
  * Trampoline for the BPF timed may_goto loop bound. Custom calling convention:
- *	- input:  stack offset in BPF_REG_AX (t0)
+ *	- input:  count and timestamp pointer in BPF_REG_AX (t0)
  *	- output: updated count in BPF_REG_AX (t0)
  *
- * Calls bpf_check_timed_may_goto(ptr) with the standard RISC-V ABI, where
- * ptr = BPF_REG_FP (s5) + BPF_REG_AX (t0). BPF R0-R5 (a5, a0-a4) are saved
- * across the call; BPF_REG_FP (s5) is callee-saved and needs no saving.
+ * Calls bpf_check_timed_may_goto(ptr) with the standard RISC-V ABI.
+ * BPF R0-R5 (a5, a0-a4) are saved across the call.
  */
 
 SYM_FUNC_START(arch_bpf_timed_may_goto)
@@ -28,7 +27,11 @@ SYM_FUNC_START(arch_bpf_timed_may_goto)
 	REG_S	a3, 1*SZREG(sp)
 	REG_S	a4, 0*SZREG(sp)
 
-	add	a0, t0, s5
+	/*
+	 * BPF_REG_AX (t0) contains the count and timestamp pointer; pass it as
+	 * the first argument in a0.
+	 */
+	mv	a0, t0
 	call	bpf_check_timed_may_goto
 	mv	t0, a0
 
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
