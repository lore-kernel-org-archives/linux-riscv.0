Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C97CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYy5JyHwsOMKOrnmM9AYTtO/UNkRUzz4kl4RTW18QVw=; b=SrqG+B7o850fID
	PTY7pFxw7Bo7chq37mBeLmhaHIsqaW7qtP++04pKDtp5t53zygMmo0F3z3KVdD2j3hKYmADkeYhnd
	OW/kK/d+BxVcyw22mdWGFppuvHmrGyrQcJx0tekR2rNVl1fz9DpYcDo4l6MrLbK/XbaNoeeCVsTyE
	d5584MlVqbOvxPTisg53oPqvGm5x/HRvXX06naJhNTM4zL68SQMgoCY6XhNe2D1/Oyi+lwXLrp/xK
	aUPhta8p7ZaotlfxCJtEaEYe7NnJ18tHVZFxjzRIizUdiZ1A4CeiGgZBGEgkPXaKmh5SriJdG+YCW
	+DK19+KaFesfp+/9xkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4j3-00000000WT1-3Dqe;
	Tue, 09 Apr 2024 06:12:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4ic-00000000W3C-2t8Y
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 Apr 2024 06:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vK6fRyMYl1P58cmeO0LU6+3feTaUZnDC3wku/DDJlMg=; b=BrDDcwrnHIEG7q3/Tm1BqFmYVC
	RqvQ2PgjL0NSQSzAIEjo2SJCaHO6Hftbf5i+qefDWM+affRoEgZMT0+1/weh5OpMDfkrtJ1MCN5UZ
	1zbweWw37RszMDjwmh5Q7MpbloacCP+evpZhX9rNHJOvAN+DrP2D+fO101nlSx+yfQLYbtpoaOhL1
	m4Cy9HtSJQm2bxt7Pjo1vpRscV4SLnUNSui0VhGADtNjMJNJw7/+fq4TGvFpmx26SL1PT39Y/C4lt
	0EiIGIFoFocziDe+abekjsFdiiTeFO56uhTAmprGCIHp9ZhGSo7eUtuziEjlQ4kk0cEBwF8gwlHEH
	Z9LS1/NA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iW-00000007SnG-1X4r
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e3cf5b171eso25670245ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643129; x=1713247929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vK6fRyMYl1P58cmeO0LU6+3feTaUZnDC3wku/DDJlMg=;
        b=WNBQomlm+gKngRZ/IWl6TV3dg62N2YIpLkheFK7dVIdREUkKqIDAkretr2IeZKQGzd
         4RdPWr/R6HovGnwVKKrSlsly+pd30O56M0P4bpsAgBAWl17WM+ws20EarLn6LCbf3RcJ
         Li4zxyDvuwe28zpappx67zuPcH98xoitMTU2h7qexAW8UtzGKq9MimBz47rKswn6e52p
         lQ94pcMxectuaehz/XCJ3ThzByuX47zhl73Tb0re1CWMUhUhujJhI5K1CPYMbd7LcJoc
         GzFVmR5KCCBEpsUiPCENy0dAXm4qVBCqFdbRvfr7iJ/I+mOc1kokn/Y3UlnL4ls89UdJ
         QExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643129; x=1713247929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vK6fRyMYl1P58cmeO0LU6+3feTaUZnDC3wku/DDJlMg=;
        b=iuxeKI8K7I24fVG++JKhbonVbAbTqy+qaHScqNgny9Bk0jII98sTpczg4740vTA8kW
         tWm3RtwqESqmLHfGIWm/1NWkvyHxRf4QSETz++snNzzUUhGO3kjQym5uUt7dU/UX/UG3
         n/UBZlrs5vP1WNYNh0pYsNRNmIrsO2MK8CBukIuQIBKSw8xN9Qur4SFF8dsUzzelekJP
         60SQVs9lc+bFW8IHqkDPSRbJQkha7bDQ1fDM9YTwerucp56ukSVbS7EGUyC2MtcMIQTd
         Qx6u6yERxE1PbasMJl2quUg1v2lf0RdAQOHxFBDlGNpZEcjbZqcbCc7TlnMCVWYkLTH7
         yNuw==
X-Gm-Message-State: AOJu0YwtlRpTBwqYI59g/LtTM++2Zx2CO+lY4RDGuqT5SbLrq6MrlFY5
	4vqxtP5Wo5K3zRiaZSFQjYZnKMWAvLEsvJ+vD/SyCzBzWAIpfhbzaO+k8alyAJO+gSS2HWIi2Dz
	3
X-Google-Smtp-Source: AGHT+IHgZW6LjlIuQt5UvFz+14tJ+M4rswVyzT+uN214hG5uWWodDhWYY3GIvVhaCwgATxAIZVKVqw==
X-Received: by 2002:a17:902:c407:b0:1e2:96d3:1bc1 with SMTP id k7-20020a170902c40700b001e296d31bc1mr13068819plk.1.1712643129552;
        Mon, 08 Apr 2024 23:12:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:09 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 06/12] scs: place init shadow stack in .shadowstack section
Date: Mon,  8 Apr 2024 23:10:37 -0700
Message-Id: <20240409061043.3269676-7-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_071225_141619_7417E43F 
X-CRM114-Status: GOOD (  12.12  )
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

If compiled for riscv and dynamic scs is turned on, place shadow stack in
`.shadowstack` section. Arch specific linker script can place logic to
protect this section against regular stores.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/init_task.h |  5 +++++
 init/init_task.c          | 12 ++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/linux/init_task.h b/include/linux/init_task.h
index bccb3f1f6262..f025022e1164 100644
--- a/include/linux/init_task.h
+++ b/include/linux/init_task.h
@@ -40,4 +40,9 @@ extern struct cred init_cred;
 /* Attach to the thread_info data structure for proper alignment */
 #define __init_thread_info __section(".data..init_thread_info")
 
+#if defined(CONFIG_RISCV) && defined(CONFIG_DYNAMIC_SCS)
+/* init shadow stack page */
+#define __init_shadow_stack __section(".shadowstack..init")
+#endif
+
 #endif
diff --git a/init/init_task.c b/init/init_task.c
index 4daee6d761c8..3c0a01455978 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -52,10 +52,18 @@ static struct sighand_struct init_sighand = {
 };
 
 #ifdef CONFIG_SHADOW_CALL_STACK
-unsigned long init_shadow_call_stack[SCS_SIZE / sizeof(long)] = {
+unsigned long init_shadow_call_stack[SCS_SIZE / sizeof(long)]
+#if defined(CONFIG_RISCV) && defined(CONFIG_DYNAMIC_SCS)
+	/* RISC-V dynamic SCS implements shadow stack and must go in special section */
+	__init_shadow_stack = {
+	[0] = SCS_END_MAGIC
+};
+#else
+	= {
 	[(SCS_SIZE / sizeof(long)) - 1] = SCS_END_MAGIC
 };
-#endif
+#endif /* CONFIG_RISCV && CONFIG_DYNAMIC_SCS */
+#endif /* CONFIG_SHADOW_CALL_STACK */
 
 /*
  * Set up the first task table, touch at your own risk!. Base=0,
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
