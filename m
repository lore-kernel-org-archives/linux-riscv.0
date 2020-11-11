Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304E8C55ABD
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE27220756
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sEgH/NHH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNmx8let"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE27220756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+jekvr7imq7i5DagEmyU4EmOCTF2TyM98MUzjuySQ0U=; b=sEgH/NHH/zH/TNE6qeXrZu+Q0
	zlhRvaVgE8SSvKVj3GxrJ9jpeHLGb49GirY5Q99fW1GOCaWRuM1N0leHhyCbeGfEEUWCOne54tsmH
	aK9SHeJAiu/53jAMkgK/iidiVox9UGGiLvPVE0HI7VJpuD3iKFuGP9Hl1mXhnG3DNupIC34lT2Jnc
	MD7dZFnKqbvW9pmAjpFcDoyOGxfUFNNBLbLMujp1ey2F9fw0skU40CyecbGQiU3uocqkZT1sY0Qwx
	8O0TVuv1qjy/khCD9qYDEvu3zCBXj/O+uQHiNrQnh3LIIMfYgTsC3+wW0iDdOEQ7/NaHrofR91rH1
	AQ6bjFG/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcqGj-00073w-4G; Wed, 11 Nov 2020 13:34:37 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcqGh-00072g-4B
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 13:34:36 +0000
Received: by mail-qt1-x842.google.com with SMTP id f93so1220014qtb.10
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 05:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/wWgXpwOKfWu89zfH4z55YdVS4FoKgsyU3KjhUPw2Xk=;
 b=dNmx8letqvw7/kng3JJM9MT8cp864llEi2W+fdgHjl0ywQOexzPsPUHJHFNPynp1Fu
 KyowDk74TZHDe12eygZFrmJx/0ykft94sWcknmiP/gb2ci8KYGrnhUPNAVoX1CQ7micC
 W9dxg0yPt32jkNPh+v2S6Ec8TERKRUxhAcuQXa3NFkbWo80pdfJ6Bl7pZT/OVLOTmPOj
 ZqSlW3XjT5hv6sk/2vSinzAG6ZS7KozmDUro8la2o7lq04jT1uzUKYXTrmPAjUt7smwf
 isz4yxPSfYvHYghHVVTVYFLVyuwWgAnYoJ33J4COWXdBK+Sc1/TKSOTKCGWEZcvZVt2n
 sfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/wWgXpwOKfWu89zfH4z55YdVS4FoKgsyU3KjhUPw2Xk=;
 b=p10x57oyK0m+fRccPJZaIHyuqQEMXX06n4RnU2gsTPUUvGYKM8FmwghB1JGWzhSnUa
 6Aywxsyyu+zcH8Ri9jKC5yluM47/L3cKHJf0J68RuOgXXruaZvvo0x2dmD81Q9IMh7BZ
 WYcN2RkQ3NiFd/Tv6BP8gxlCRqyxH8k3dec7R94ya+6yBFWogrfjypzTy1zoDKHcV8tU
 YorOeR4j3wlJvDKJsw2tfsd5Ytdq00jQsXienPJb+kp0loDXh7MOoODLo5jhiIyv3WoN
 MUbG42NgSPXVaf4O1zYA2pDaOOtdf9WlvIu8kijIdTgR5COCRecdunU6lZOIwL81baZz
 yDZg==
X-Gm-Message-State: AOAM530qs1aD7Vh8SYzcfvyDy3RzWvxx39m8OJjShlE42O5ZiexVBdfv
 mKaBrvt+elusuaa0Kp/1l3c=
X-Google-Smtp-Source: ABdhPJyXr79D39F72KQTAuWFk25+3xGmXqPHFQ+ygjm2TFYHLHgr595PCW4dLHay6xJ4RhIuu7lNGA==
X-Received: by 2002:ac8:5901:: with SMTP id 1mr17048871qty.350.1605101673552; 
 Wed, 11 Nov 2020 05:34:33 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:33 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 1/8] csky: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:47 -0600
Message-Id: <f9219026d4803b22f3e57e3768b4e42e004ef236.1605101222.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605101222.git.yifeifz2@illinois.edu>
References: <cover.1605101222.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_083435_235667_6678C473 
X-CRM114-Status: GOOD (  14.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: YiFei Zhu <yifeifz2@illinois.edu>

To enable seccomp constant action bitmaps, we need to have a static
mapping to the audit architecture and system call table size. Add these
for csky.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/csky/include/asm/Kbuild    |  1 -
 arch/csky/include/asm/seccomp.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 arch/csky/include/asm/seccomp.h

diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index 64876e59e2ef..93372255984d 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -4,6 +4,5 @@ generic-y += gpio.h
 generic-y += kvm_para.h
 generic-y += local64.h
 generic-y += qrwlock.h
-generic-y += seccomp.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/csky/include/asm/seccomp.h b/arch/csky/include/asm/seccomp.h
new file mode 100644
index 000000000000..d33e758126fb
--- /dev/null
+++ b/arch/csky/include/asm/seccomp.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H
+
+#include <asm-generic/seccomp.h>
+
+#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_CSKY
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"csky"
+
+#endif /* _ASM_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
