Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B027C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 06:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soy6mO7UjopDjPlFDST7QPt7Wk1UFbZmO8ZsNyKscgU=; b=s/llqqc2Znzz72
	vJOjE2OcXj8/DBtmcbQsjyADl+WnivMPFYzyJJswds8gqg52aNBOOYY3IkvsC+SrzL9B0PW55jfKd
	kC4RHH7xQaI2TYB7YD55EPF/mG3AW+RhBd2IWgE0L1eEx+TW3vNyaaSdBqOFbGH+3zdiqYKCNBrJG
	fO39AKerwDsAhZDGy9J78KQV6nPhniS2WP8sGxVbDBz7y7k2lEUTNlAmCUQgaP4SNfek6deqxn8m1
	S7LXoy+d5LeeXpO+DRRwwe/pExmhITxmKe9y9MJzBXEjK/FC43yApT/AAa6LdqXCLomUYT/odshRw
	gKobsZ9KTiPBy0vYySxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRvY-00DI1z-1f; Mon, 13 Feb 2023 06:03:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRRvW-00DI0s-Fp
	for linux-riscv@bombadil.infradead.org; Mon, 13 Feb 2023 06:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=H5RDh/4h33AXRCvzLgyL6r/ZYBcOU/v7pv8PufXaHhU=; b=FY0NlIDyLXlkIE/Hh3zueS7SjI
	HkImrRSvWWFoISqERkHiqgscUvWiwEHDmUDInvAD4G/Iknb/2lDAVoYENP0qUGyy5bRJWOUNL8B3+
	evsUeeKYhCfW1Rla3fJYKLvUZ0tvdMWxhCioqo07/NNn1BnyEPYnwWKruhg3i3PPHkdkp+eg8Rcur
	eXWrri/nw2YCWxAGOC/Ze1vKEvrrVm3L4OmsQ8DGKuV839TJdYCh7v9RluvnKSLXlSObtDD6sEQ38
	rGoxGu1i53fnCX7h2H2nBwRnXLpUVgczlI7cthp5i3E4cEAaoVb1xdu3P8k0qI+ayXFfUyat1yJ+B
	r9w3fwpw==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pRQqc-009BSp-18
	for linux-riscv@lists.infradead.org;
	Mon, 13 Feb 2023 04:53:54 +0000
Received: by mail-pj1-x1036.google.com with SMTP id bg2so1476509pjb.4
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5RDh/4h33AXRCvzLgyL6r/ZYBcOU/v7pv8PufXaHhU=;
        b=wq1vjGt5Dk5GTt2uM2o1fsU4IewccIkdZiTiZ7Q6QROKj7XotzLnQnbGMt7mkKvcxn
         Uxr0y6xeaOCw0m3jmFx4LdilZxIzFkNBZUysklHVUGRQgJUL2fG/YYfw9ujVUppzfGLO
         K2+9aqLeM3PSle+L5sFQoNf3ArhkOzkMUImcbHjhQmj01b4KtjSLsZc0o27pdRVwgFoD
         gmJsi6NkemAEVMiZjtqLPqgGgv2Z5vh743ofDqsf+8HUhJwOQVi30lbfExMhXxuLElj8
         xHOnKu08Ovp/uV/YddPhlNoEHhLPdW6MlLGLla9JQ4zUjud10AC/I0X8tPdayr8dpskh
         va1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5RDh/4h33AXRCvzLgyL6r/ZYBcOU/v7pv8PufXaHhU=;
        b=futoW7ahwfC4tNOjWERpJLiuqaOFOr/d7ORLNtx6OAfdrxTDvZJOE1Skk6bujsAGTJ
         KEgt0u3cTvMS/gtm8qYR8ceyUX3nRY8BaZxgt815R16s7xyXKo4KPUQxRggVTd7DlxYn
         ytf29BjEUK7jTLpBU33KP+IwKNbVQwzkd37M48Sg09ytYq+q9G291k0jgAz2/MoUMybM
         dNPyBT7qdHTKFYdeVA0vVRl69fJAAEfxw9YSPhaimD+bo34VcflgF81a6IPCrCdM2OGj
         Z9rpw6eI1c9kycBw+43Qob02A3gfJqwihXGw/p+w9MJQb7OGd585jH/vKg5P6I9k/tQw
         1UsQ==
X-Gm-Message-State: AO0yUKVZALGOfHsA7V9gF7cIZ6ImdNySqzxWp0ffZL/Z2LoIrB/HfFbi
	EI5mbpP/6M6OyK5eer4/vkvvDA==
X-Google-Smtp-Source: AK7set/buAEv0Dcf3oki/D1OsCxjOnHbCXwSRzLrgXj1477fOT32uLPajUBPeIjkACO2s7SI5kT0TA==
X-Received: by 2002:a17:902:f20b:b0:199:aae:7569 with SMTP id m11-20020a170902f20b00b001990aae7569mr17492690plc.28.1676264069586;
        Sun, 12 Feb 2023 20:54:29 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:29 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 19/20] config: adding two new config for control flow integrity
Date: Sun, 12 Feb 2023 20:53:48 -0800
Message-Id: <20230213045351.3945824-20-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_045351_127668_B58D403D 
X-CRM114-Status: GOOD (  11.43  )
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

To maintain control flow integrity of a program, integrity of indirect
control transfers has to be maintained. Almost in all architectures there
are two mechanisms for indirect control transfer
 - Indirect call relying on a memory operand.
 - Returns which pop an address from stack and return to caller.

Control transfers relying on memory operands are inherently susceptible to
memory corruption bugs and thus allowing attackers to perform code re-use
attacks which eventually is used to inject attacker's payload.

All major architectures (x86, aarch64 and riscv) have introduced hardware
assistance in form of architectural extensions to protect returns (using
alternate shadow/control stack) and forward control flow (by enforcing
all indirect control transfers land on a landing pad instruction)

This patch introduces two new CONFIGs

  - CONFIG_USER_SHADOW_STACK
    Config to enable kernel support for user mode shadow stacks

  - CONFIG_USER_INDIRECT_BR_LP
    Config to enable kernel support for enforcing landing pad instruction
    on target of an indirect control transfer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 init/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 44e90b28a30f..8867ea4b074f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -121,6 +121,25 @@ config THREAD_INFO_IN_TASK
 	  One subtle change that will be needed is to use try_get_task_stack()
 	  and put_task_stack() in save_thread_stack_tsk() and get_wchan().
 
+config USER_SHADOW_STACK
+	bool
+	help
+	  Select this to enable kernel to support user mode shadow stack. Most
+	  major architectures now support hardware assisted shadow stack. This
+	  allows to enable non-arch specifics related to shadow stack in kernel.
+	  Arch specific configuration options may also need to be enabled.
+
+config USER_INDIRECT_BR_LP
+	bool
+	help
+	  Select this to allow user mode apps to opt-in to force requirement for
+	  a landing pad instruction on indirect jumps or indirect calls in user mode.
+	  Most major architectures now support hardware assistance for landing pad
+	  instruction on indirect call or a jump. This config option allows non-arch
+	  specifics related to landing pad instruction to be enabled separately from
+	  arch specific implementations. Arch specific configuration options may also
+	  need to be enabled.
+
 menu "General setup"
 
 config BROKEN
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
