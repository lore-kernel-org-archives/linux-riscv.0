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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E8EC55ABD
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77ED2074B
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U5V3KY1w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtuNdkss"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77ED2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O5STci+UU0ZGtHC4nrdkjEVMauQwQZ/C6OXOBnuLNAQ=; b=U5V3KY1wxhXV2NFx2dLigpD3F
	dQR8GWakjuCc6TKVn13XN21N5qqJHiDlfIe0FOn0PVrD2jVk6p4Te6ze05/kMS7+69UPwTQwv2Ujd
	Q1LmK2zRQb4HXqsytgLqUnhFMnXOMTtyP3N1AiRUZUrFLfPDwpB/4fN4ZSmhs0pDVt1ELszPXJSxw
	f5WuBgMocdfDF/gcasGMj8EzstLuQArHqPd7fEnMW8k3KuaTngiVEklyVtfGFswRH7lyFExPgzH+D
	URwbsbSTWpjX1+LbNptwlzAn7ox0axhCxOBrxkCMVtZril3dr0oCBJgO2VP5c9O2GXcp7Db/RHrd8
	SGN27VdYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcqGq-00077k-EL; Wed, 11 Nov 2020 13:34:44 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcqGn-00075g-Hn
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 13:34:42 +0000
Received: by mail-qk1-x742.google.com with SMTP id t191so1609211qka.4
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 05:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+eMXBOnvKPM7N/Eu0cs4UA1I6FeurfdgB6uFLVTMPX8=;
 b=CtuNdkss3y7rgKc1l9KsIQZTv0LgZAhMRYi/6z6qZmeZkTtZ4x7E48r/LeELYZ06IN
 8cgqYZ8dHlw0uxtVdsPuGe5k/uNahk9dBk2utYsfhVEV4Ba/sogSqNiIxMOka14XZD8a
 eupUAgtHJBLzSWs9IfisbVC1mdakqgfudFjJHeYdfmpXX0W03tbjgHa1X2SdS54+cwbz
 4hcZkRNxXc8xWoaxyCLZaNV6QnzDrrzHDB6WZ3omhkvvhakq0V/TBs/W/M2pg4I58bEk
 U0Idcw73pn5TTYmrEG4CqfKVjhniq9pyecl8f2TP5P/XCIVnlIMOYfN29gQ3XF6HZQop
 jcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+eMXBOnvKPM7N/Eu0cs4UA1I6FeurfdgB6uFLVTMPX8=;
 b=YEle7+o1tRBJcFb7PDazerHY5Er/62pgYB+TAxL4TBfVHuBtflKPn7y4LWqGA/kIzt
 +sew5mr2BedeGn5vQb+Zc5DD/kB7BbuG6MfP28/5iQzxCFPAZi8wCZH/tI1YQtvTcUgh
 5vEggAF0pVDm61QzpSv/NrLIQ6boN4Niy2qvlUlbA4roTupw5GcXtk4Xbtsflc+hwFuH
 iHFWL0lzlmMxX5rpJuvB0EKACSwK4juZpME5ypEl7zMeqk6TpUeGa/QRBLO+zEc3WD/d
 n4nWkAGBZBL07GSl62Ab0j/jNe9LmkDvY06ZajwgwetlcclllsE570L0EUSIGHHpiPOI
 OOqQ==
X-Gm-Message-State: AOAM533a131EC1Dv/HPAQmZElE9SQRi/+451J9mwmL8g4cYeTedcjfSR
 EA/Y7fyElUeeH3GqPAuQS1Y=
X-Google-Smtp-Source: ABdhPJziT3nG/TSXJ4p+Pm6vLQUb4KIz+diKiufrVwDSoSwTeA58/VG9OWAb2+vs2wrY9VS5+FBB5A==
X-Received: by 2002:a37:7fc7:: with SMTP id
 a190mr24750394qkd.337.1605101680151; 
 Wed, 11 Nov 2020 05:34:40 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:39 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 5/8] s390: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:51 -0600
Message-Id: <a381b10aa2c5b1e583642f3cd46ced842d9d4ce5.1605101222.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605101222.git.yifeifz2@illinois.edu>
References: <cover.1605101222.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_083441_681912_475ECE74 
X-CRM114-Status: GOOD (  10.59  )
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
for s390.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/s390/include/asm/seccomp.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/s390/include/asm/seccomp.h b/arch/s390/include/asm/seccomp.h
index 795bbe0d7ca6..71d46f0ba97b 100644
--- a/arch/s390/include/asm/seccomp.h
+++ b/arch/s390/include/asm/seccomp.h
@@ -16,4 +16,13 @@
 
 #include <asm-generic/seccomp.h>
 
+#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_S390X
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"s390x"
+#ifdef CONFIG_COMPAT
+# define SECCOMP_ARCH_COMPAT		AUDIT_ARCH_S390
+# define SECCOMP_ARCH_COMPAT_NR		NR_syscalls
+# define SECCOMP_ARCH_COMPAT_NAME	"s390"
+#endif
+
 #endif	/* _ASM_S390_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
