Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2E9EEE277
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 00:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2eMsj6xjzNLfdEUEB1fj2dHlnLYL3qqwd58NApm0l4=; b=o7U2Lsp+Av4FDP
	o3wJFnLp5ze2p5zm+HyXKSIWXZ51GmFNnB+L/DfR4CQz2aS762jX7ZaPAVJ2LosxH1pxzivjQHxD8
	7oSgaeS5+CntdWrKW8hoF5peoY2yUaE9tQHBQX0jRfzEDjjm4G7K3NQc0PLFl3f4244EoDavdst6V
	buXj4JwXj1iWBFWpty4S8mf5WYh3vtRT34DziRNlvOkSxLE2NRcxnzfmEf94xZVhBOyqsAYKXJo/M
	C3puMsZK34RxSlMb5aey2xokBliC9szExvwaecyI35au07qszKqnsigvD/Uwx0EQK9s1IoRPodMo7
	gn6c/uSSv6QOlzQC4byQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souDK-0000000EaYa-0Lbd;
	Fri, 13 Sep 2024 00:31:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5s-0000000ESmQ-3rsO
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vRpTmBOo4f9wGNdjTiRRTPN5pl3eVu/w/Wzy47xL6pg=; b=MzYCBxCnNxTaWYkLERSp+AEKHO
	4O40YnaKbv9Cw6OfD/EvGs5BQOjqGTLHhOaiYAEKVbsa+ftAs6hyC1jsNfU4bheX8iTwsQLEBG1Ex
	vTZya+csCl9DIrdNyTMhp4q5Rp17l4xTqXbF8ga47JRpp37NShuhXjp6YAr/h+WuQgv6tnZ03G31t
	7cAwIzzoQTvgCvN0fHwen7aIBN2e8LxBzub8Ik64IDpTybsYrIrT/E4I0MXjGZJvK6o49LcqrbCNW
	5cDN5yENGRUmmZ9GGulm8PRqE5Vt0lCKTAktvl6BcpHeQn5yP2sRIe3Cs0G2PBTYBHIDRY5HzVs10
	ZAzv6uug==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot5S-00000000YJl-2CFz
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:19:14 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2db928dbd53so1261248a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183131; x=1726787931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRpTmBOo4f9wGNdjTiRRTPN5pl3eVu/w/Wzy47xL6pg=;
        b=EubGq3m5ZvVzO77BgexbV19Y7VM3ZUiv6FU967A7x6+5SRRHtJcodhp4XGr1z6XO+Z
         kYh7r3F4CgLboPwQWbJW2xOAJf58+97u9L4woKi5JY/DHzEvwzhSXwQW73pj4hoHdNYM
         RZi/S7KoMD7aNDD0EsCXt4Xlw2T16jGLZnJtEUPP6oiBLuHC5D5MGiusK7+ZKTLiO6Ob
         HOPXqhYcCX4DqREZsXtptCG9WPNANi4tOa65eZFQquamgWasKgOv6S5XoUjTF0cisiGg
         uGTucTY5ilATJ1kjFfttj+LzR6jKfGAsldekInDvgY3Nqrd1aT6uXs88JfO7l4N13RLI
         mRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183131; x=1726787931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRpTmBOo4f9wGNdjTiRRTPN5pl3eVu/w/Wzy47xL6pg=;
        b=Up/1D4LKvgskfI+TwtgRULvfWrypDgafrV3cBwAFEBdP0wI6H1IUNx54l6Wz+hg22/
         Bw4lzWWemkaO8MhFsJYmTjnI1Z2AdkF+Ts5J6NeJoM8MLPlNPBK2oEQJEIQCAkMX/6u9
         WzYDqIU5jgAeztC9Boate8zlGjPvLZd2F8VBK74cLcJnfxcAN1cVLDtCbv8+dMJAJSls
         KaLr6HAf7Fj8S/A/cSiRUZ+wmPXR8n3I4dog8zEOeFWZQ79BKXhem8Dw5UYZ6tpoAHgC
         pydkbkmJ5zfbPTE5ST2vJU8PbjODd/62MFJ0hYi6ox7jdbW/no7NEnhsUwrIUZCH3akx
         B6pg==
X-Forwarded-Encrypted: i=1; AJvYcCXVsULBZo/bdB8yDDqUeRxkJ2UCeL4cN29hsHfV8UngAumXfvUVVYeruGzE76vnc4LxF9xas1SCiiBjlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVlY6JPn2EHxCLz+GuGgkh3wsXjSSG2h3o9GJB3z+ue60WKr0f
	S/S1WOoCl8N/sLu+OPWldOeCGSvZCha6I8bUAMUKi7iNm9N4hjPjOayyMn4ecNg=
X-Google-Smtp-Source: AGHT+IGSBIHvNtnBIsR7GeLeQfebNSrrsHlC0GHK9qkrAjtXKK+cIqA47d5wbXfoZYS+dksrkXz4mA==
X-Received: by 2002:a17:90a:1641:b0:2d3:bc5e:8452 with SMTP id 98e67ed59e1d1-2dba00681b2mr5466829a91.32.1726183131166;
        Thu, 12 Sep 2024 16:18:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:18:50 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 24/30] riscv/kernel: update __show_regs to print shadow stack register
Date: Thu, 12 Sep 2024 16:16:43 -0700
Message-ID: <20240912231650.3740732-25-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001854_984037_726B2B61 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index f3c5b8f2c869..1a5d70977e5a 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -87,8 +87,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
