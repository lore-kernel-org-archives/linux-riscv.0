Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1897C369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 02:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LmK5qJtNtNh6bB/lLWgOwZwnNBo988Gx1M2vDEy6aK4=; b=Cpm4U5NWI/hJI1FnFN7YUiylD5
	DoemPaRi4Z9+3FntFY9bVFdL6vqAE8uf2veYW5E2CpzX26tBONyQwjyML7zF4OMzHncdaRgkt1gqP
	RRqUxmTkcpx5QLZgQN8oi7j05uelgNtcnpUHyRnqS+5aUK6DDl2UpymiS1fTXH8i1q0hohH5mzF06
	S6KZuSLH4W8DPpMhYLZvYlF3FpwObRgRTep8FylmucbOmvb3/3pJsc2Ey/Zx+RTQvXikJ1tWXQItl
	pDo9ZNp3Ce+PQS1lnxNI2D9cYzt5Ce55uNt8x6vWYhP7sf3EzApJGk0KdzUnAhBMEUR7avSIH5m+t
	cnXotzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wlE-0000000BTnz-28i8;
	Wed, 30 Apr 2025 02:01:20 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ved-0000000BNYx-0coF
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:50:28 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-736c0306242so8795798b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745974225; x=1746579025; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zV8KfWtJknVUvMYzwAQZK7J5V2/CfVSOWymHPTFROZA=;
        b=qex050N671jMQdDI5bu4f0DdUMYlZallhhH8haSc5NZs/UbGooU+d9DPnp/jAKgDPP
         dvaORJIWmnuViFHMHgzbw6Yb3yt3m8TYplvghYvMlt3Gic3l5MAHtIxQWj35PS0OogCF
         +8s/OjOW7RpuxKWuC4OIdVSSx3U/s+s8rGY70ppr/ZuJOJHehKdOmqJeoAqBoUd8haok
         YNKVv/IAArd+WjzM1/zM8uSGFLfFny2hvREPbPfGZnAIUUCBNgfvuPnUGmoKeHd4wzPP
         AwkDOegNU0BGrnsLn78eUDqC5us9QhhIc9JNDywDlzM50YmYOxMum6mg2SGWcG5wkngk
         WeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974225; x=1746579025;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zV8KfWtJknVUvMYzwAQZK7J5V2/CfVSOWymHPTFROZA=;
        b=f5CgJFPb4wVwps8a0ZZsostNjDVsqzZJTF9iEvzuUya5XT64f5CNtwvoo3eYGLcKnF
         z4V8aElz0UcO+To20RIOP62QJD0j9fJDKJcNcanpa5yTjSwzBeeHEyvLTgKmkOgW9abK
         iOs4Mi3JkqovfNWkdzKrE5V17p568XDRPfMOWljkOCTO37/2oQIQEV2MRF/+kvoH+KwR
         0EII7FK7u/8GHzDBtCS85V+OIJRLffRwmcEazUcSmbwqMcNp2Zo3IQX9qKZ7Fef/Zqai
         IAYJkG/tKi4LOL0pDGrgNyJmxavpJQaA/+mSOFxMHh6Afj+Fwg6jtFtSjn/Jjm2rvCEJ
         slGA==
X-Forwarded-Encrypted: i=1; AJvYcCUaWTu1tJ2UTXdFwYASr/OtlIqYPDh/alUm7KVsuHeBVDpoYxggwgUVnKfraxYxLbruX6EC0K594zlKEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXo24PM3RvtYNT5nw9TdtM2tvawZmjMluFqsi80RxTbONtREkI
	R85Ss6PigKmB2ZyMBvt711zQSklfpC+tRQjUDMnBTe+HTsSYEGPmLoR7MPNsUyTBsKLJpv5HusO
	1jhgvRObfFw==
X-Google-Smtp-Source: AGHT+IGXjMAQ6Z4HpUzZGw+SfPLRp4intDdhQh/m2Ddl0uunRXtaCeDsdf0ekIVVtBs7GrtIhrk10UjAwgEmPg==
X-Received: from pfua19.prod.google.com ([2002:a05:6a00:11d3:b0:730:8e17:ed13])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:928e:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-7403a831702mr887054b3a.21.1745974225616;
 Tue, 29 Apr 2025 17:50:25 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:50:00 +0000
In-Reply-To: <cover.1745970908.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1745970908.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <2c1ec0e60974f8438730dc5126f9ed986b32a3f6.1745970908.git.yepeilin@google.com>
Subject: [PATCH bpf-next 1/8] bpf/verifier: Handle BPF_LOAD_ACQ instructions
 in insn_def_regno()
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, linux-riscv@lists.infradead.org, 
	Andrea Parri <parri.andrea@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, 
	Neel Natu <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_175027_188053_72ABAD1A 
X-CRM114-Status: GOOD (  11.08  )
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

In preparation for supporting BPF load-acquire and store-release
instructions for architectures where bpf_jit_needs_zext() returns true
(e.g. riscv64), make insn_def_regno() handle load-acquires properly.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 kernel/bpf/verifier.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 54c6953a8b84..6435ea23fee4 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -3649,13 +3649,16 @@ static int insn_def_regno(const struct bpf_insn *insn)
 	case BPF_ST:
 		return -1;
 	case BPF_STX:
-		if ((BPF_MODE(insn->code) == BPF_ATOMIC ||
-		     BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) &&
-		    (insn->imm & BPF_FETCH)) {
+		if (BPF_MODE(insn->code) == BPF_ATOMIC ||
+		    BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) {
 			if (insn->imm == BPF_CMPXCHG)
 				return BPF_REG_0;
-			else
+			else if (insn->imm == BPF_LOAD_ACQ)
+				return insn->dst_reg;
+			else if (insn->imm & BPF_FETCH)
 				return insn->src_reg;
+			else
+				return -1;
 		} else {
 			return -1;
 		}
-- 
2.49.0.901.g37484f566f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
