Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB404C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573EE21534
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fceDEJmq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZPVvErj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 573EE21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=seMBl2r5zMUxidH6G9EgGq4udYGrBfI9xEp5H9jmSE0=; b=fceDEJmqItMrcvCvlu8VEL6Uq
	7XDwLM+bBySjcRgPRx9XKL2osKniQQyp6fDfiIoF4IQ+QpL7GumqPK6mzZ4vPbTWIclED4vzjSWKU
	vAMDh9X5B2HERPH2GZAB1+xfZmdhyi7NUTklo/kvMxLdjEASOxOHXwvQDDAN5+Hq2BxxHulbvL4ta
	T6GuV2NNHXEZnLcjBs4hSKPdzyfzqQyb/mIJn90rfm/sOdg7t8n2nWrTN4oc+Ttd141Ipel1oL4sn
	ZIqF/2fDs29f/SMh5QKm3jcApKvglEEJPxvQdZkxDpgN65MeKxayfkRtbsqHc5d+UzD26hSbDueOQ
	T+i3Z9lQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZwck-0007Wk-7C; Tue, 03 Nov 2020 13:45:22 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwcd-0007Ry-J1
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 13:45:16 +0000
Received: by mail-qt1-x842.google.com with SMTP id h12so11599851qtu.1
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 05:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=do2IkGTsgJZMce9dLCi5y9V7vjNX63EvX8bAUDpEGLM=;
 b=GZPVvErj4PHBMLqkcSjbNmjmJr4IFQAsCF6LbDLPnOqXfs7SLj1TTKqhDmNgH840z/
 JMTtucvAwREP+cEU+Z5Iz9lcArpHDNTiECZewb/MjCmRhNpQ6PuqqdTsVjqPNl8xvRdo
 sip44uxOeEAEVkGMyHAODxwQELEMs/kd6J09+5V1ZmN3zfpxAieTNiIx3evs2766AEOo
 gEP+Z4M+G2wLoWKjcrT41XHAyl01UzldioGtYHEGV1haEI4YToOheJ1zn1dRAZHSXrbf
 pKglRVS7f6vVvyFumFCM3MU4VHkFYyeDA7+teIbMSHjdZA03RLUMjsja8eSRa7PJSF9s
 Z5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=do2IkGTsgJZMce9dLCi5y9V7vjNX63EvX8bAUDpEGLM=;
 b=Fjv32aLdWq2qcZoCOVlWqDsINUE1L4PeXDukPiFTsgG8lyGPt3SQHD72a0wm601CWo
 BXsQBSIpaOlAAApJm4xTgtxrA3QenWTkr5RvxHVvQQCNfoFWxYXFy8PV4zpxJUrvonHC
 D3CbCXz68xKAdVIl7fgxT+pbTdqNO69vKRKlLzYYjNqJ8zRm+A9HpNMV7veFX5O09p/f
 v9lRquAjkr+mLzVPhwniP6IiL6f1YXcvTFJEMVJhRHLHBbjufpcROAswFDjWD4uDLJwm
 N0yA38BEo1sZ8Rta8Foru8+o54o+LiGRLhoPLKHABVQ4bCw3wJx+M58mbjysT4+/qrqG
 epww==
X-Gm-Message-State: AOAM533jPu73mRmpoM/D+LaGmWaiyD5GXPytED371HJ4B1sojfI4sqoZ
 ZsabTr0OrtE6r8OnDZOhLpk=
X-Google-Smtp-Source: ABdhPJzhvqPfN56+Yli4koNRw2qkj9WiJNRq59eXTsSDpfjJx+9FOdsirhwbtC1KEzvqsKxYUpRyXg==
X-Received: by 2002:a05:622a:8a:: with SMTP id
 o10mr19841485qtw.274.1604411113872; 
 Tue, 03 Nov 2020 05:45:13 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:13 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 4/8] riscv: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:43:00 -0600
Message-Id: <c2a5b127d7b52557bca6526eeaa73c91fa989816.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_084515_915011_771C0603 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
for riscv.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/riscv/include/asm/seccomp.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/seccomp.h b/arch/riscv/include/asm/seccomp.h
index bf7744ee3b3d..c7ee6a3507be 100644
--- a/arch/riscv/include/asm/seccomp.h
+++ b/arch/riscv/include/asm/seccomp.h
@@ -7,4 +7,14 @@
 
 #include <asm-generic/seccomp.h>
 
+#ifdef CONFIG_64BIT
+# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_RISCV64
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"riscv64"
+#else /* !CONFIG_64BIT */
+# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_RISCV32
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"riscv32"
+#endif
+
 #endif /* _ASM_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
