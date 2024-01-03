Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF125C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z39f2LXEAazgZQu1u/8/M67chdCg31q2eFQFunjDu/w=; b=ey3P31mY8azki2
	sZLICSzjvhjgXRrxuztTzXh/dAb3rkY9lqdmLEUjE3aPiPW3p/xGLa7wKLbmsuBchv2HGcs3QGjek
	P8yHc42dNNeSNOLEFMGJF/YjFOaQ223pTHs8gYOhf4QqaT2AnkY3w1w/nXatB0BCd32qcVQd+a2Jm
	Rlr9HvyVvqBC28IT+KZWIK1dEgeusT41IUD5ATXwHPhW+xm1xc+/gLo3+lIrLCOaH9IRx3gQmOP63
	QWqByrsiBgkkMYodqol2+lLD4olztvs2L+3GVp5/I0H5n1QEiMfNjJYuH7r/Ga00kYHLU4aFEAfI+
	Bs0Sq/KGnVaxWj3WL8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3gP-00BKGZ-0w;
	Wed, 03 Jan 2024 16:01:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3gM-00BKEZ-2y
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704297686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcuCCcEH82BE3ayeUzaJsR8GgVjZd2XA38iISRs+5EQ=;
	b=d3UHuvIyEi7qN1t3aG+RFLDzvTpKxKMMjjhZVpLf8Nc+g4+R+abgbob1Coq6AhEKGbhBgK
	JU+cr/MfG3uV/KlRAAgj2VzqWQsr75H6BMhORkggux1tDmXvkNbEhoJI+KwqHCveko3KZB
	imHXXNPgNHdKMQk35Mh1GkTy4+QM/mQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-tPQgy22_NuS2K36DHY3i4Q-1; Wed, 03 Jan 2024 11:01:23 -0500
X-MC-Unique: tPQgy22_NuS2K36DHY3i4Q-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-28c26fe6068so5060178a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704297682; x=1704902482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcuCCcEH82BE3ayeUzaJsR8GgVjZd2XA38iISRs+5EQ=;
        b=s4h6mAkPN55DotgoW0RiCM0eXAUC4QAvFT2AB59Cm7plNGxv7Q8BaGfpvnUpwlOXjy
         5ajB3fR7mxHIuQkODfwrIsHOLP8kVysxyi46dkZIG3+tJfbaXfvB8MTROFnsmforZlkl
         pGdqOydHc69VAkNVz7gMWSUxg04pXxNEMxJFu+FBu2Dle5vC58bL9yaIdREIHZhG9r3V
         CfK2HpzAcSEdYQh1fhKNKj56eG//EQG4F0WBf84CuARcZUxWZqFJhPdDzVXDGep4jWvd
         GnvMpk/iIxL8sBMzlIu0A3egZSCaKra5nrJ2rCbUYraJ6tV/u3T2wTcf+r9T0wbmV04Q
         b2SQ==
X-Gm-Message-State: AOJu0YwO6mDnfUjJXoc0iqkRbrujdBx99npNOmPrbg5MQdhobtuxl62J
	eQftDG7rrJrFDQ6GF4hAtrwKElRCz2CCJi9wIBBao0hDD83kw5PbxHe/c2ZEirNQNiccKknhQi2
	raOwzvBJfWsXH62WOWDnvyn/TjJv4QuQWDiDl
X-Received: by 2002:a17:90a:ac0f:b0:28b:2e19:70ad with SMTP id o15-20020a17090aac0f00b0028b2e1970admr6096718pjq.25.1704297682424;
        Wed, 03 Jan 2024 08:01:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWGQZgfdECo7Rqv5SvlFkPiOgIc2kjMq7oXKIwuu4xXAPoN6bd8DlcIBQPspVWHa4cRptl2w==
X-Received: by 2002:a17:90a:ac0f:b0:28b:2e19:70ad with SMTP id o15-20020a17090aac0f00b0028b2e1970admr6096675pjq.25.1704297681382;
        Wed, 03 Jan 2024 08:01:21 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id qc8-20020a17090b288800b0028b1fce7c01sm1922253pjb.37.2024.01.03.08.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:01:20 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Greg Ungerer <gerg@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	Baoquan He <bhe@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v1 4/5] riscv: Introduce is_compat_thread() into compat.h
Date: Wed,  3 Jan 2024 13:00:22 -0300
Message-ID: <20240103160024.70305-6-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103160024.70305-2-leobras@redhat.com>
References: <20240103160024.70305-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_080127_034463_1C1BC653 
X-CRM114-Status: GOOD (  14.17  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
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
