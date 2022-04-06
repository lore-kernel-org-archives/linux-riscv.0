Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6847C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tb4QR4UrjoCt8A5L/5/+hGPBUOjainAjPhuJWCC9ZVs=; b=JQB2YdsYJa5nEE
	FU88FGBZEA+MqCvhs4gci3FnYL1g6YxRmtJ19/Wwfex98c/75X+TZ6asgB+n39iKOKE5UjtgugZPF
	mp0R6Kk5PcsD914uJtZTkN6zlLbSXYzkOkynVrDZnL6+HPsidgNXJdXY2mLi4jp7QsPaOwwnEerGt
	1Nk8oA90EWJUGhXhyRjxWxTUIezvm7lUM52SKYqlaoLAqYT8PbyVJHhGQOM1RA7UvabjuzW8T62sG
	zekMs/+pV+WKvy9h6GMmT/oTEoP8hLFA69QDfQgU7A1eJ3gHPBNG5EcZs9mqWazWLVVDWvAIQvWxq
	vUdI9m43Dc5ixeI7HWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6cn-006V8Z-HA; Wed, 06 Apr 2022 14:27:09 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6cl-006V4p-1G
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 14:27:08 +0000
Received: by mail-pf1-x432.google.com with SMTP id x16so2583228pfa.10
 for <linux-riscv@lists.infradead.org>; Wed, 06 Apr 2022 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BlaHLYunH8lWogXwwfxKssKzGVm1nfRpO2uSQYLbmK4=;
 b=AycY1YVxDa54nJpBch0AKnr4fQqh/ofZJHis8/uZ7wWJOSQexNGu/TkhQXKuTapuXC
 Oe0RTNTVoKpp9diugvrz243dFZbkcxw/T8tMGwStdU+fCK+j2Ng2TYLu1+PiyS/gV1Wv
 pPHe7/3wW0TWlMBi2i4VpHd/+8ByOIIEpavuN48UycUL5rHNxoliDoxgMBz0j5xkeUby
 u/USPSXfwuWum/duFYlfBDvSJTNM8tLjjX+o3LNlFaLkBgY9VeFNWY5BslVxu2rjmiln
 9DUlBRuW4kl95PYl2NIQkQk0dmE9KaAMyNbVThROAJEVvAq7eOeUYsRJFkfyJywlASMs
 oN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BlaHLYunH8lWogXwwfxKssKzGVm1nfRpO2uSQYLbmK4=;
 b=yG1RYPI6eH7q4sEZ8jmwK7SnoFT3PkOMa0j7QDQfOHP/86MpJiEiy6vtCxxyc6pfUl
 cdOykXEsSQo0lLewtfkYL2V17PR1lsiK5r7vXSK3E3MEIgPtC8547FOIw+fhxvaarsym
 T2bkAKz7D+2oR6QEewemLT7t+zwPXYR/bxJEsN/uPgg3Db39tj+kUUt+hW30lUK7m1wc
 TJ3zek7/H/j+ieLDHgXTTlFJcUDBEhKXbcZ69FYtftNceW8N278vZm/kb8KusZ4gYrGh
 GWDlveMTj+4rnBtMzXd0HVr4sIh6hvNcmkuhK5BwINm3PkfvyR+zuX5qus3rL8yjbkBY
 lu8g==
X-Gm-Message-State: AOAM5326zUp5bXd60JtjepEgmB+caHrVbT0KSPChT9kxTHIOG68lFbzM
 zuZgOLtuOOKyogLhZLlDSoyKQA==
X-Google-Smtp-Source: ABdhPJwaAJtnGiRN+5RAf/ZIeJzHbeGqbgF7hWd3RWch1tryvglddvyOCvMokwbAKr+NAy0lWkH8pw==
X-Received: by 2002:a63:f10c:0:b0:382:623b:3bb9 with SMTP id
 f12-20020a63f10c000000b00382623b3bb9mr7287904pgi.97.1649255218336; 
 Wed, 06 Apr 2022 07:26:58 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 k137-20020a633d8f000000b0039800918b00sm16424151pga.77.2022.04.06.07.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 07:26:57 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 namhyung@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 iii@linux.ibm.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, greentime.hu@sifive.com,
 Eric Lin <eric.lin@sifive.com>
Subject: [PATCH 1/1] perf jitdump: Add riscv64 support.
Date: Wed,  6 Apr 2022 22:26:06 +0800
Message-Id: <20220406142606.18464-2-eric.lin@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406142606.18464-1-eric.lin@sifive.com>
References: <20220406142606.18464-1-eric.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_072707_115018_AC94F4AE 
X-CRM114-Status: UNSURE (   7.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 tools/perf/arch/riscv/Makefile | 1 +
 tools/perf/util/genelf.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
index 1aa9dd772489..a8d25d005207 100644
--- a/tools/perf/arch/riscv/Makefile
+++ b/tools/perf/arch/riscv/Makefile
@@ -2,3 +2,4 @@ ifndef NO_DWARF
 PERF_HAVE_DWARF_REGS := 1
 endif
 PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
+PERF_HAVE_JITDUMP := 1
diff --git a/tools/perf/util/genelf.h b/tools/perf/util/genelf.h
index 3db3293213a9..ae138afe6c56 100644
--- a/tools/perf/util/genelf.h
+++ b/tools/perf/util/genelf.h
@@ -38,6 +38,9 @@ int jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_ent
 #elif defined(__s390x__)
 #define GEN_ELF_ARCH	EM_S390
 #define GEN_ELF_CLASS	ELFCLASS64
+#elif defined(__riscv) && __riscv_xlen == 64
+#define GEN_ELF_ARCH	EM_RISCV
+#define GEN_ELF_CLASS	ELFCLASS64
 #else
 #error "unsupported architecture"
 #endif
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
