Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1300CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BcnkuVyZZ5dX+GBsyum+0rtommTMFsFR306gY5NpwIk=; b=JxP3nBBBaz34W7
	l9YRiByyU56f4qk2xQwTifV1uAh+LxVm6yt1WBiGnLs5Pxoaf5+dQ2O05Lr8TNMjwTd/oEIW/IvVz
	NzE6ojcmd38o9nH1PgfjiJokDjDBJPxgoYoeC+RlqrKzlQ7qOvKcsWrDE5NHB6LGMVSSY53mffODL
	XgU4i6nE53MUrIYWUAiLYDk+JQg3SlVF4ucjXArUnoBIAi5lhbmqXHBMrdDAdRE8lj1xu0kbuMbs+
	17y+jiktIYocQsSDDV9uT4Zo7M098KAIO2IpCwFKNv/xqwUCxlhXRxPJC15HOLtVhXQv2TLu1G8HL
	3JC/aPDed9K9ApHV5j8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3g3-00BK5J-0t;
	Wed, 03 Jan 2024 16:01:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3g1-00BK3r-0h
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704297664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eW7Hp92xFvn0uEDHFJ5uhGV0bhy55HqDGviT7ReovF8=;
	b=hVjOvOQ2OT5+BgN4WitR8YLS6WcDlyZ//EvYX1XqiNQvfgqaKP8tjLaDdgiotEXaAlc2Gb
	5Qn2eVky9KPsja0KdGxNAsmRPTtjgmBIT25r5IkrNg0aDw2O3NtMU1Yl4/spFO82WN3EBm
	gvfABPugA3jVL643AP+c2APnJMGEd/Y=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-j8GeeJ8PNHuCs9MM0hLeEA-1; Wed, 03 Jan 2024 11:00:57 -0500
X-MC-Unique: j8GeeJ8PNHuCs9MM0hLeEA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-28bcf7f605aso485120a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704297656; x=1704902456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eW7Hp92xFvn0uEDHFJ5uhGV0bhy55HqDGviT7ReovF8=;
        b=TpPqLboSKRQyq0e8+q+JsyLAZaDTFI5Ywg/qogXJVKlZJSe3quqSfXKiMS3Uw4Dn8d
         Jaqz/0wUAW37J6iAvvTMF6n45sue7rwaiNPGb531NI059SsxjG0qgVP7a/9dXcsQo7QV
         1HHGqBeQFvP+HD2Fm93ZdoBaiSw1zVH4gZLPmjAaWJPbDJUkiHeeQP7xJdEtowDynWZH
         DA0CBlMUjsK9W2Q3jCNIPb37CFMAHPrOtl7xQjEI/Y1volJNqjg59xhxTPrlRvvlq9mV
         Tex2sN2Q6ANftzcC4ZRRbinarYKfWjzrzgq4W9yaiEJ1AW8ypmOwYwecmZEUHE8pJsbw
         rHlA==
X-Gm-Message-State: AOJu0YyaKKq+Ek5/+nw0vaUCPuT7jP5olE55t6F3cz8lKegNmx+0qnL/
	/aL8Mr5P6CRWa5unB9YVrIMVoxTtkH7PjRfNYPWC8cZUhicV0ICpFm59EWLbrfHEtwTjKM3XMN6
	JfIiMiGdqOKr9FtOpJNM9FzaEpuoactGXxW9n
X-Received: by 2002:a17:90a:c245:b0:28c:eeef:aaca with SMTP id d5-20020a17090ac24500b0028ceeefaacamr705456pjx.4.1704297656091;
        Wed, 03 Jan 2024 08:00:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1Qw9aIClua9ds5Nw8/POsd9KwpDhXoK1ctp78/8BijwUvH1rwsQL+Vt2C/sTQWWAMNvcTuQ==
X-Received: by 2002:a17:90a:c245:b0:28c:eeef:aaca with SMTP id d5-20020a17090ac24500b0028ceeefaacamr705420pjx.4.1704297655711;
        Wed, 03 Jan 2024 08:00:55 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id qc8-20020a17090b288800b0028b1fce7c01sm1922253pjb.37.2024.01.03.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:00:55 -0800 (PST)
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
Subject: [PATCH v1 1/5] riscv: Improve arch_get_mmap_end() macro
Date: Wed,  3 Jan 2024 13:00:19 -0300
Message-ID: <20240103160024.70305-3-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103160024.70305-2-leobras@redhat.com>
References: <20240103160024.70305-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_080105_322969_B511A162 
X-CRM114-Status: GOOD (  13.37  )
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

This macro caused me some confusion, which took some reviewer's time to
make it clear, so I propose adding a short comment in code to avoid
confusion in the future.

Also, added some improvements to the macro, such as removing the
assumption of VA_USER_SV57 being the largest address space.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/processor.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda549..2278e2a8362af 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -18,15 +18,21 @@
 #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
 #define STACK_TOP_MAX		TASK_SIZE_64
 
+/*
+ * addr is a hint to the maximum userspace address that mmap should provide, so
+ * this macro needs to return the largest address space available so that
+ * mmap_end < addr, being mmap_end the top of that address space.
+ * See Documentation/arch/riscv/vm-layout.rst for more details.
+ */
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
 	unsigned long mmap_end;					\
 	typeof(addr) _addr = (addr);				\
 	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
 		mmap_end = STACK_TOP_MAX;			\
-	else if ((_addr) >= VA_USER_SV57)			\
-		mmap_end = STACK_TOP_MAX;			\
-	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
+	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
+		mmap_end = VA_USER_SV57;			\
+	else if (((_addr) >= VA_USER_SV48) && (VA_BITS >= VA_BITS_SV48)) \
 		mmap_end = VA_USER_SV48;			\
 	else							\
 		mmap_end = VA_USER_SV39;			\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
