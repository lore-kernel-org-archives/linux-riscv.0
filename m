Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554A7C76196
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kwd2C5keTYDJTgrHTfmDT1KF6JHreRTg5Lg/ZMX2TM=; b=wnfJnqTTTClBdf
	MPvN6jKpueMc52atyuTqdqvbLydNovdFjzhQpBffvsZAWRxlkA+k9i39lQ4EHPHTgozyxv0nc3Ffb
	WNgiKyyJveHxm82kr6BlRzbpLxmhGlUD5LiX0YzBAVWTBBKCihJnHhQ67fFH4UlAjbohcyKTEdM6K
	ZEPm4hUhf3pP71O9QXA87Z/A5F54ZslCLtbFII4F6gac6KVJvCILd5xgQ/HxBFakUhy2HMP8bqfD1
	XtAD9V75Si956g/wE9wMKNDrOJlGsfFd3RBPyDY8W0JxFd0qO66bVAnCByVC14Tc2qWmThgOFemso
	CVqgcQC9xhRh/FL/mbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRH-002Ha9-23;
	Thu, 23 Mar 2023 15:01:15 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRC-002GfJ-0y
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:01:14 +0000
Received: by mail-pj1-x1029.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so2372812pjb.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583669;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+ouetyhXDlSjJJrs7uB9nNBREilJX6aCD2bcZWQVec=;
        b=CTVAyxXuZQajxAGCxDiblOwdF6oTSft+FYeysyuhJ/h7OntJ0akZBDT1uUC6xXIhGt
         V59bRkFFoNHXVo1L5auDb1xzyzkowkZQ1JfG0iEYg9lMZiixduQPEZ57qSeNxIJ140HG
         FOwCekVIUcluoDRvWd6kaOL+d69HCMWpkGQfsJCfWAdferXxduhKsAvCSQmvrnDn63o4
         wjGNdEX0uVwWV8BOZiX2plGjf7e+b19Vz/4eYr4rm7eOP0+KgH74Xiv8OiHafxzZr0lP
         eaurdK4tMrqmMLxi0Peq8riIOHb185yFZY6Pyd3qIELT5ivmv4j5X8AnOzZMdsl3DORE
         8HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583669;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+ouetyhXDlSjJJrs7uB9nNBREilJX6aCD2bcZWQVec=;
        b=GbBETyhGw58ELfh8Q8OVjn/ekpmBa8vQSFUeWC43pVQTI5FUk/iJqiz0OaKOkMGvNT
         haNWMWo7ly1Ui3nqLLqWL74oY0VRPQKJgM13JVvh5t3SS3cNeamJLMSLm8EGjKHhCfQN
         d9IlNNM4CSXr3nmopKlt9TKNMtHZnFDx5DD1Qb7t+iWY/zEMX2kkdx20Gq+wTqUr/AqI
         E/2UcU53WA7UeAyA5krPOzdKljNlNeXuCHN1DPPE+ng3PRUHj6Uh4SjAv8UpoInqG986
         13lck7GzGy3cXoFUPDLyMMgKxC8fgIQSZkkiKhjgVnoAOdP5b+nBe9FFYEpCLMPT4l1i
         WPJQ==
X-Gm-Message-State: AO0yUKV9Q75NiBOyXcDQld/rgeRvBABQos4drjgMp8ySnnUv31+qyLvE
	n3pDuScyAtBHlhh2s2et9IjN5GJBtrGR+5woLrOB9GdmQ5nge6Hq4laeabTSBtyDe3ehoSjzg/g
	Z/z/YY/YUjq++JUpMyaJMeL3ig0jFF384zKXTrvN3K9iqlT7Rw0ZAilpeCr3Ag8Dkm/Hli9YVV/
	2Vzk7M3Ok2QFA5
X-Google-Smtp-Source: AK7set8rM63JHpwDOS1Hl4On1gtG8fPUiROZmSOfWhxCHPK1Cemsm4kUqDHJHPMQawySJxqBigleLQ==
X-Received: by 2002:a17:90a:d583:b0:237:c5cc:15bf with SMTP id v3-20020a17090ad58300b00237c5cc15bfmr8344876pju.13.1679583669355;
        Thu, 23 Mar 2023 08:01:09 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:01:08 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH -next v16 15/20] riscv: signal: validate altstack to reflect Vector
Date: Thu, 23 Mar 2023 14:59:19 +0000
Message-Id: <20230323145924.4194-16-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080110_335119_95412A28 
X-CRM114-Status: GOOD (  10.32  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Some extensions, such as Vector, dynamically change footprint on a
signal frame, so MINSIGSTKSZ is no longer accurate. For example, an
RV64V implementation with vlen = 512 may occupy 2K + 40 + 12 Bytes of a
signal frame with the upcoming support. And processes that do not
execute any vector instructions do not need to reserve the extra
sigframe. So we need a way to guard the allocation size of the sigframe
at process runtime according to current status of V.

Thus, provide the function sigaltstack_size_valid() to validate its size
based on current allocation status of supported extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/signal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 6b8bf935b33a..ffde81cfadb7 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -494,3 +494,10 @@ void __init init_rt_signal_env(void)
 	 */
 	signal_minsigstksz = get_rt_frame_size(true);
 }
+
+#ifdef CONFIG_DYNAMIC_SIGFRAME
+bool sigaltstack_size_valid(size_t ss_size)
+{
+	return ss_size > get_rt_frame_size(false);
+}
+#endif /* CONFIG_DYNAMIC_SIGFRAME */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
