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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B9BC388F9
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D855722243
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jGjASRLK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMy31dQJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D855722243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LzIIJWNznbH4X4d5iIPy6DsFbh7Uf0E4/zpRCS1ySxk=; b=jGjASRLKid6xSrMCfKFT7eEZz
	EskxKWLJg3hQwcBJNgd5fra20u2I66NCOpWflvKfGNTTZDTzOJeH7ZrXZezUrh+Ym1zK+vsbA4WMx
	HjowE5Di5c81kBuJ2axSdgKEZ0eDu4od8L6uqd1H8KFwiSSXTyMmtto4Bn6bceyVd7Cg5Ofr3A9A2
	JosvikU0K6q7uRg01T8RKxe9GCDKwoSUBfjJmetn9K+DB42Jf/tuJJQUX7N4I6Lgyj2xrGoAFdS4x
	brfvNtLC/cLyrlixVbbn5eVkZzygAA0A2FaXHBoNmu3Bo6kBUUelirdC1LANlPLKcE67ViEkl++U7
	hS/HYWDtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZwcq-0007Ze-H6; Tue, 03 Nov 2020 13:45:28 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwcg-0007U9-P8
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 13:45:20 +0000
Received: by mail-qt1-x842.google.com with SMTP id j31so4850349qtb.8
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 05:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9/hEAP0td3DKDEonOQx/BrDGR67nDcwn+HdeFH8wdFU=;
 b=PMy31dQJueagbOReuh4TyHKDHnWAkQvYrpAxEIErX4xPuMN4MlNB2tU7IkrAnlx5qR
 uhiVg0r41UxTv/gr4jsg2Wl8FCoeHTXIjjT8/6kSbvOBLPV4TYfJCrk8J0g2rFJRrlKD
 1hx2REJtkovGnmyDSF4OhzIchxZlhVI33gOeYruCrarfFMdqwMbuze+ne7D3usBg1+Vq
 DnVMU0VjWHDphquu2ZmwzzqKtLL7eO8+3YSpHLjN+/oLDv2OFzem5txt9rfYq8LN1OI+
 2+w6DzMI4hNFhProTsfpRsIxSVaEXoTrzgUyJ2J91ehNlbAFEuRmMAY+8h22ZlecP47B
 /smQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9/hEAP0td3DKDEonOQx/BrDGR67nDcwn+HdeFH8wdFU=;
 b=pDtzB8wbQTl8Zx5iEDLXygzSf04mTvbRcKEuMIHsTFB9A4LIoQJR40vU+v6B8j+LCj
 +0+TpJHZagVwpp5wdfpjFVbWdO+PU9GeQORRDyiHsNjYStcrWaVf+jK87K0cX9Rk3STC
 3CKuybTJZxzyjJDB3NyzoRCISOc1KGT1bgwVSc3F5V3ynqaHNVfDKIl92wjCusBv+MQW
 2s2aEb6VPuamosbKOtBx9UrFeQ8TqREY7OqdSgdy46VyQU6bMhJBMm+Fhkj+oxue08TH
 7ezp575VQ2LuB//KSAuD9y8SOuLCBk3qGrxarVQ1/wSvXXP5jeDO2vqODwE2bYs50jm5
 36ig==
X-Gm-Message-State: AOAM533/QWYRxZcFdXvatw3Qqrltd7Qu3t63akAhXcrFjIQY8stk2mtb
 qc9+g6fR56O9lqymvX7E7Ic=
X-Google-Smtp-Source: ABdhPJxZpuM+FL2rdeo54BZFwmZgnUAh5zGzhGJrI7NUoaE9OPGoZYZ+/yTeLM9bmqKuOcXR8gpKgw==
X-Received: by 2002:aed:2064:: with SMTP id 91mr19450606qta.383.1604411117345; 
 Tue, 03 Nov 2020 05:45:17 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:16 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 6/8] sh: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:43:02 -0600
Message-Id: <46d7f8d02bdaadf364a59db2d60f43466227b3af.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_084519_809891_983AFC9B 
X-CRM114-Status: GOOD (  10.28  )
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
for sh.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/sh/include/asm/seccomp.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/sh/include/asm/seccomp.h b/arch/sh/include/asm/seccomp.h
index 54111e4d32b8..b8d169292a34 100644
--- a/arch/sh/include/asm/seccomp.h
+++ b/arch/sh/include/asm/seccomp.h
@@ -8,4 +8,14 @@
 #define __NR_seccomp_exit __NR_exit
 #define __NR_seccomp_sigreturn __NR_rt_sigreturn
 
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+#define __SECCOMP_ARCH_LE_BIT		__AUDIT_ARCH_LE
+#else
+#define __SECCOMP_ARCH_LE_BIT		0
+#endif
+
+#define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_SH | __SECCOMP_ARCH_LE)
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"sh"
+
 #endif /* __ASM_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
