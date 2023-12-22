Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ED7C46CD8
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tW9mKQjQ4lHB4bKNay+CXh6Z80KPK+9xzojR7ujZtnY=; b=Ue/Y2iqtpNQLfI
	2SkjEMP+sMec2in0XG7R0ZdWXO/G3TR0og7GOJs4/aRKk1DmPi0i9Rm+aNHEJNBo5TzzEPol19275
	MnNFs1+qB0XAAV8PKLjHxK3tarNlMQFzHY+OSgiQKtdPBcx6wcv2afEOzNUIoFt9gmOglTdWfwYjY
	UCiVN9KP53N2SRWva16/QUaCrZcC57Xyg4wloMmt1RhZHICtOvhbT2Rzq2r8IRBu1xi6e6TqgcflR
	YopPA8MmzpRIlaGjqfTshfeEWyG3xbLHX48ieAXtl9U4MA2OMnje5ZwjskqpWUlXFJzjva8B0m2GH
	cQ/giOAeubw3FtLIO0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaFD-005DLM-2r;
	Fri, 22 Dec 2023 07:46:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaFA-005DHv-1H
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 07:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703231211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CivPyX79A0Z1hBiu+NIjR9u/sMwnUQBrdiWOV2RqYZw=;
	b=eZODkezzb3ZKdOlfJTCPfoqEPQWfs5NbXT3WfZwSLeRmx8ds6PiSy0elxsDmmm/V646e+4
	YWsvq+ntrYAI+YtYEIvUzaUU45Rt9HaudtCXUqq7Q7gkckigAMXuZL5VKWcm4PAXu4uTUa
	uab5dZaYUdnlW/sIH7AZFD4S/dZjvfo=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-C5VC44DHP5GPisyDwcanSg-1; Fri, 22 Dec 2023 02:46:49 -0500
X-MC-Unique: C5VC44DHP5GPisyDwcanSg-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6d398f0de98so934591b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 23:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703231208; x=1703836008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CivPyX79A0Z1hBiu+NIjR9u/sMwnUQBrdiWOV2RqYZw=;
        b=l2oqn9TC/NSxHdLadGO0SQxMK56xSIfDWbS/5DyQxTFAA5thf1/1ISalKsyVqzd9cb
         89LWm552h1UNdH+/ZnmRTMcqBeQOxBi26AkdfEYkd8YfB6z5lICpgQ2sBQrL11XTWBmB
         1nOadt1YisKPmX0HPSBE2eYiyfs/LVRSFeNzEF7brhe0aYLo1trIkx9UMFN6kcQa381s
         JJawiJkGyESUI3UBJOMMbxd2xxoEj1AhT2glUVcu4MV9Wc2MNgcEGvm3ZxbOZsuL6BIL
         fz2idcHcCJ+oR/NU0cuedumvuYTpwdc8MTNa14gAzoDwgqtY+EHmFXlHnnbLN1mSBfxo
         H9QA==
X-Gm-Message-State: AOJu0YxHcaU0kqz3CLHQ9UkBmzISYGcX97CHDcIi3wLlNZ4VTX1RAl08
	3wjXQoWERc/oB1XrDZ8h8/fzU3hW+8NOLxlfbaj4IimqLCA1QGJ5JZ3ZvYrMcgypWZRjGzTxsIV
	ibIhzvd9+LR6E9QGvlMhVMUjlktRMtWAhWp+1
X-Received: by 2002:aa7:930c:0:b0:6d9:6261:919e with SMTP id cz12-20020aa7930c000000b006d96261919emr591302pfb.19.1703231208654;
        Thu, 21 Dec 2023 23:46:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3ju0vDAUEHX0GCDDvkiFL8Wq0IKN/wM1vpTmL1pxShU1txvq7JIxARGiDwyFtjeAX5+gIOw==
X-Received: by 2002:aa7:930c:0:b0:6d9:6261:919e with SMTP id cz12-20020aa7930c000000b006d96261919emr591291pfb.19.1703231208347;
        Thu, 21 Dec 2023 23:46:48 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id m2-20020a62f202000000b006d97eaba6cesm1527015pfh.21.2023.12.21.23.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 23:46:47 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greg Ungerer <gerg@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 3/4] riscv: Introduce is_compat_thread() into compat.h
Date: Fri, 22 Dec 2023 04:46:03 -0300
Message-ID: <20231222074605.452452-4-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222074605.452452-1-leobras@redhat.com>
References: <20231222074605.452452-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_234652_502635_F1F0D3E7 
X-CRM114-Status: GOOD (  14.21  )
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

task_user_regset_view() makes use of a function very similar to
is_compat_task(), but pointing to a any thread.

In arm64 asm/compat.h there is a function very similar to that:
is_compat_thread(struct thread_info *thread)

Copy this function to riscv asm/compat.h and make use of it into
task_user_regset_view().

Also, introduce a compile-time test for CONFIG_COMPAT and simplify the
function code by removing the #ifdef.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/compat.h | 8 ++++++++
 arch/riscv/kernel/ptrace.c      | 6 +++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
index 91517b51b8e27..da4b28cd01a95 100644
--- a/arch/riscv/include/asm/compat.h
+++ b/arch/riscv/include/asm/compat.h
@@ -20,6 +20,14 @@ static inline int is_compat_task(void)
 	return test_thread_flag(TIF_32BIT);
 }
 
+static inline int is_compat_thread(struct thread_info *thread)
+{
+	if (!IS_ENABLED(CONFIG_COMPAT))
+		return 0;
+
+	return test_ti_thread_flag(thread, TIF_32BIT);
+}
+
 struct compat_user_regs_struct {
 	compat_ulong_t pc;
 	compat_ulong_t ra;
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 2afe460de16a6..f362832123616 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -374,14 +374,14 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 
 	return ret;
 }
+#else
+static const struct user_regset_view compat_riscv_user_native_view = {};
 #endif /* CONFIG_COMPAT */
 
 const struct user_regset_view *task_user_regset_view(struct task_struct *task)
 {
-#ifdef CONFIG_COMPAT
-	if (test_tsk_thread_flag(task, TIF_32BIT))
+	if (is_compat_thread(&task->thread_info))
 		return &compat_riscv_user_native_view;
 	else
-#endif
 		return &riscv_user_native_view;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
