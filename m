Return-Path: <SRS0=emcE=ME=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005B4C07E99
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jul 2021 17:39:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4EA56120A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jul 2021 17:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4EA56120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USYKdhaGtdw2t786KbooTFQbTbv0botxA7fQ0Zc8Rcw=; b=xQkLM81hiwTwET
	R3Qg0rLtNxUkAryy+epJOp6ixkDMdw2KJAt60XbyFs/kAtECwCxgqhMBPcNSf1BF2hqsbCO/mCo96
	3xEI+iPILxLLOKBFNOBw1ViWx512e6rJsf9yRZSJEQho2aB+U5ak+y8iWpr8KcQA8ud1m3NCdjHkb
	3A/Q/GxqjLFd8injtySAeXTdsaL0l1EFvOI59A1wiu3kB7C0p0ddNLXoNBJbqwu3xt1rqmVuwVcQ9
	OBfG3oYvk8D+MOPVXD1LMFxg4RKS210dLUeMPjsO0D+U+eGkq5iD0LbcWYHSzHjS1z9RthyPVZcj1
	72msXZISBLoCjPsvvxbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2zsz-00856y-SS; Mon, 12 Jul 2021 17:38:29 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2zsm-00854z-Ir
 for linux-riscv@lists.infradead.org; Mon, 12 Jul 2021 17:38:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id b12so17061463pfv.6
 for <linux-riscv@lists.infradead.org>; Mon, 12 Jul 2021 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZD1hOKzyikLBWTW4ZoPnyvY2gKEeXNcSLsw+d9zA4VQ=;
 b=nKHhlhdRHNxftODTOCIkDlgaV6FA5fmf8BPcGt8VoG1sHRp41AUiaAqZrTKrN+wDc2
 dFPejf1KWPe1YoKioeEl+c+1INkftKkWi2TlhUw79cATJS4+HP+ysPWQmEpGLCtpSVs3
 bbfEzys5m6DB/I0V6hCsrNqcq0gDk3LkMDI68WrJEWKg6kTjDytOKdUh+syYbamI0JLE
 6Q7Msh3m0WLkXVKJc5W3HVgPi0cHp4nZ7iTd24jbTEsR8dveHkCx7GgBkta51kUqYuOY
 zdsi3yzFFNyIyOQ3CYmNIDAWygopvUPwHljJ5OT7D6617USMbYpY+iCHHDHvcZMIc7bm
 1JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZD1hOKzyikLBWTW4ZoPnyvY2gKEeXNcSLsw+d9zA4VQ=;
 b=ZpzBwdUOpVz3teMMiSVZWZxgFcxUsNmWS7bx9Ma9qtM5PcaM6ErXcgWRsl7ZmFiJjn
 I/o4pDdQlooaVFwJHMKRBzAHrenIFIyoaTWllrGd8JttGszkF5Zy9e1v8tp/o/aS26SX
 A8mb74Rc+1K44PQgsDZwHIEBYSAw8dGAheJI7ToGZqkkAbn0+/Dr1wlVfFGXN09AcphS
 jSxXkisE3xiFwstZJILwZWZ/GnGHEaDR2A4+sdbfyFTP5LHIu82aahoOoNCfmN7XpekL
 JZ586x70NDs3ibTgdp8HfCYU8fEmQATreV/JcXkjZAauC5WQ/S00qjmcWvlnYQLTLwMo
 +cng==
X-Gm-Message-State: AOAM533rJYl8yyFJD9yu2pB/QW/rpL6R+XXPtlCqNusw8tlv5sCu65aQ
 Rl3SvlN2S1Fg9zioDIxte9s=
X-Google-Smtp-Source: ABdhPJx00ULwX/fYl6jygcwepHAx93W0Ysg94pOdMnslRbsL1k1j52m8HHuZUZMkisXl8sJIgfaw4A==
X-Received: by 2002:aa7:8707:0:b029:306:7e78:ee7a with SMTP id
 b7-20020aa787070000b02903067e78ee7amr169703pfo.29.1626111493506; 
 Mon, 12 Jul 2021 10:38:13 -0700 (PDT)
Received: from BALT-UROY.maxlinear.com ([115.187.60.212])
 by smtp.gmail.com with ESMTPSA id z26sm16851491pfr.31.2021.07.12.10.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 10:38:13 -0700 (PDT)
From: "Roy, UjjaL" <royujjal@gmail.com>
To: Song Liu <song@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Networking <netdev@vger.kernel.org>, BPF <bpf@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org,
 clang-built-linux@googlegroups.com
Subject: [PATCH v2 bpf-nxt] Documentation/bpf: Add heading and example for
 extensions in filter.rst
Date: Mon, 12 Jul 2021 23:07:23 +0530
Message-Id: <20210712173723.1597-1-royujjal@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: "Roy, UjjaL" <royujjal@gmail.com>
References: "Roy, UjjaL" <royujjal@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_103816_670555_E04A7D00 
X-CRM114-Status: GOOD (  10.54  )
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

[1] https://www.kernel.org/doc/html/latest/bpf/

Add new heading for extensions to make it more readable. Also, add one
more example of filtering interface index for better understanding.

Signed-off-by: Roy, UjjaL <royujjal@gmail.com>
Acked-by: Song Liu <songliubraving@fb.com>
---
 Documentation/networking/filter.rst | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
index 3e2221f4abe4..5f13905b12e0 100644
--- a/Documentation/networking/filter.rst
+++ b/Documentation/networking/filter.rst
@@ -320,13 +320,6 @@ Examples for low-level BPF:
   ret #-1
   drop: ret #0
 
-**(Accelerated) VLAN w/ id 10**::
-
-  ld vlan_tci
-  jneq #10, drop
-  ret #-1
-  drop: ret #0
-
 **icmp random packet sampling, 1 in 4**::
 
   ldh [12]
@@ -358,6 +351,22 @@ Examples for low-level BPF:
   bad: ret #0             /* SECCOMP_RET_KILL_THREAD */
   good: ret #0x7fff0000   /* SECCOMP_RET_ALLOW */
 
+Examples for low-level BPF extension:
+
+**Packet for interface index 13**::
+
+  ld ifidx
+  jneq #13, drop
+  ret #-1
+  drop: ret #0
+
+**(Accelerated) VLAN w/ id 10**::
+
+  ld vlan_tci
+  jneq #10, drop
+  ret #-1
+  drop: ret #0
+
 The above example code can be placed into a file (here called "foo"), and
 then be passed to the bpf_asm tool for generating opcodes, output that xt_bpf
 and cls_bpf understands and can directly be loaded with. Example with above
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
