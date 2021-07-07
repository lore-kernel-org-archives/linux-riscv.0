Return-Path: <SRS0=Ffl8=L7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903D9C07E95
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jul 2021 17:41:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4693561CC8
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jul 2021 17:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4693561CC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jz+XfqMvGMQs5V3V4YnqwRJs8wAqzxtvLUvq1SFTxSc=; b=RVEt5aEzVSrEsM
	B7WXZKuqC7xdEkzAtZiVAnbY8vErCtusqA/a6AOa0l/NMQT0GWA+cOKJK2/DTRzWOb2DKO9LRwiD+
	XwFbLr6Ew29mghDeHtrKRDvROfcDa7yk9T6sbsDQfI6T0bYAl6bUuH23drsTuttT7D16wIjJdlqTw
	bjF96ncTHf8cSON2v2gNaRc6EE7XfQXyhpPMRy0iSIxwfs1mUIvrScWmuzcz2boIv5UOlhtOqOOmI
	sEuBFoazVyx6/OKasUoTGLc4VnZyW5lwzc7dApmrelNL8VQ1Dsw0p8aR2PFfnuqXbFchRMBDhG3iP
	rqnyAMaI+wda8XO8vCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1BXN-00FPSi-7s; Wed, 07 Jul 2021 17:40:41 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1BXI-00FPS9-A8
 for linux-riscv@lists.infradead.org; Wed, 07 Jul 2021 17:40:37 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 p17-20020a17090b0111b02901723ab8d11fso2134619pjz.1
 for <linux-riscv@lists.infradead.org>; Wed, 07 Jul 2021 10:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgQbhoVbzjmNN3b9sj7N5Nl4gKvJ3MMVqvNXk5zHkNo=;
 b=bR47LD94Ihmmn+syU7HUJyHuGzItCzlwySdmlkOYI/yLYpYVon7pXNMaOD9WbOvGHh
 SqeGoAWtPadPUZwLG9LePULyOje+tqo/OgSzMDdJii1uZfPbqeFYEmEqpHBNywGAbqHy
 2iQt545mtIRNxxSdHd+w2YoLimLHvy+w6F2IHU8lAiQmJenx3+5YoqnFpXT13tHetrgy
 dlzio48/8UmsOvEgsEkA+FcqO5LKFg6wjaBPvsL9Tq+yM5THIWAKi3BkCdR5u6sX/GJd
 fT44xrPMKQbzunyhJl/zp8JqGkmruuVmLoS7qEzyjp8Frx+5bbCDFVaAl7M64v6s00ZW
 AvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgQbhoVbzjmNN3b9sj7N5Nl4gKvJ3MMVqvNXk5zHkNo=;
 b=B1HiYpuqQYw0Fg6HLlS3IuEvyELRfTsMqNSEz4CcrdRquTpQJQLkK4QbCXAHOMQtak
 QrXdTEq2mGpQEbNsovnzYlqpQIwY8lxTRgcb+sfTOwrvHeYAoUMz1VmeWTkc5LMXlaC7
 6PhqO9il47ROASBya12qYHgi1e9H7/IxWv/pEWGxEft3who5Qv9vaX6oM+SFyaSTu9m1
 HXg1Xbfm+9H8iEAl3yjgYESyA94foKcEK7zMIHFH4W1069/R7RjzqcOJygsLf9l0RB0L
 DhIYJNs7GPiEiIgCnf4z0EmZo1//HOrJ8CrC/5eYtD2etfJlv4U3kWdjMfAztlkb2bHX
 GoQA==
X-Gm-Message-State: AOAM530NnCz04YHRazEf+DYqDtp33Kcmqaf5yJGsDGCWM9uYlg33wySm
 dxNxfPChTiJROxUmKjRrDKo=
X-Google-Smtp-Source: ABdhPJzCIAIXmtoc+TgNyipWd2WVTKXNqNE0xipLQsdFFIQOXHcVtnOxk+x8AeC7NNPt4aWeARXzww==
X-Received: by 2002:a17:90a:948b:: with SMTP id
 s11mr28015165pjo.139.1625679633694; 
 Wed, 07 Jul 2021 10:40:33 -0700 (PDT)
Received: from BALT-UROY.maxlinear.com ([202.8.116.91])
 by smtp.gmail.com with ESMTPSA id r26sm15555376pfq.191.2021.07.07.10.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 10:40:33 -0700 (PDT)
From: UjjaL Roy <royujjal@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 clang-built-linux@googlegroups.com
Subject: [PATCH] docs: bpf: Added more extension example
Date: Wed,  7 Jul 2021 23:10:22 +0530
Message-Id: <20210707174022.517-1-royujjal@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_104036_405826_4741ED64 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

From: "Roy, UjjaL" <royujjal@gmail.com>

After reading this document observed that for new users it is
hard to find an example of "extension" easily.

So, added a new heading for extensions for better readability.
Now, the new readers can easily identify "extension" examples.
Also, added one more example of filtering interface index.

Signed-off-by: Roy, UjjaL <royujjal@gmail.com>
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
