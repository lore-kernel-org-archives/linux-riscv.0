Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CC0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OlAOniDWHwr2mitx6LAr8QFL7eZi/wbPoWwoJx7fm14=; b=c2nmOvHUwUHQ+W
	IUzn796Zcb5BaMEz3N6eUJ4rub/A5sfdnDOqzvlGQvMeqAG/Lsy8JgoUTLpf41mq2kBlJJXdMfEDE
	4WxZlGiuSmO3pi+ZxJFrVSDAMcQg3F136Ysu6nNVojY29sga+ISMXcNatIkfZRY30EGt16PR0bXht
	Y+uU9kXl+W1TIzmzwQWNpe4HE/0oUmiqixH4KQOg7pWnVYYmg2xFksx8kRxrtPdGw3gitCAp4in4a
	GNJQLtzzTJcKyhOyAWraxGzd+dAu0q+S7OOinssrIh4wAX3O99MlJH3jZJNec3gfcT1H7PbNHCYwX
	CeHeWwHhbjVmbS+AnC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxO7M-005yuH-H4; Tue, 22 Nov 2022 07:54:56 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxO7J-005yrv-Hg
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 07:54:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id t17so11898095pjo.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 23:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaD45/LH3TZ6LbPUcB/tZTNJd6oSSleYgrDKwVHXXS8=;
        b=VXTHMSvhK6rf+7XuYyG/Gc5csVm38SGJclqk6icVnehGJCmZm36gv1dNZd/ovtPDJL
         elT7gvTL5S4ggs/JMsETB9Bd5ncHE2XwVRXV8MU4Nea822u+N5+S2i3hrDshAk7Oj7yz
         VDNPHxehjxo009md4A5dm5XiKHdp2LGzlHOAeLxGlLQs5ge7QAR5juXK0XJlqwBVIjuf
         MpJTJhbGkge1ODNOOz2QQymNH52SZbDh1d0nFwp2Lb4d2+b0j8gTyDcW62cnyI0Ej0/o
         Zqb49YSUw3WjUc1I2LECR2D/U5vtYudC4yB4PvmpHOKeAiQx/AOjp/aNsfOuMBwH7i/s
         tNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaD45/LH3TZ6LbPUcB/tZTNJd6oSSleYgrDKwVHXXS8=;
        b=BPGKA8uGc7n17hTGrsfAa42ERTVz6W0P/Diyzkmzh4hUo0fNrjMuA4ukOXhy/4qwjn
         5IcCaj+1KnjTf1SAi4XObYsFF8KHPez5rhBXyl53oLEafkyoNXdRyDeAbwAI2lAXCRbD
         LEhdrOO2yw63BS0K10jrzJ9l4RE3TyqHUs5XGXzbZI9dR/6BNRdJyhzOW2FpR2uAU747
         JCpzsv6ObuaymS3EWBXsiiB7nAuu7866pkjvDL4rmpmEZInhSCH8A3DdQjDq3BWZMi0p
         CNGVo6LZ6SPS9pGxfM0IWNfr/o4c4JLubkrx60ssCHwg7MDE+w8jekBEv12I7afP+Rut
         tOcA==
X-Gm-Message-State: ANoB5pnvNih898OWlpjrtQYLbFWY94HJcLnAmLVG2MEcyOQ1xDTCMI3y
	KuDb4Z3liP+l+Ex8h0vhzvk=
X-Google-Smtp-Source: AA0mqf4i0LyLXge3UiPlp/TJqbVFTXCUKervCrY1UnSc8o6dLKUtk/1OH1tm/qSlyQIyPVzzTMDRrA==
X-Received: by 2002:a17:90a:ac0f:b0:218:bc3e:95f4 with SMTP id o15-20020a17090aac0f00b00218bc3e95f4mr7143299pjq.150.1669103690943;
        Mon, 21 Nov 2022 23:54:50 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id 131-20020a621689000000b00545f5046372sm9891909pfw.208.2022.11.21.23.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 23:54:50 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: guoren@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH] riscv/ftrace: fix ftrace_modify_call bug
Date: Tue, 22 Nov 2022 15:54:40 +0800
Message-Id: <20221122075440.1165172-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_235453_622378_185C36EB 
X-CRM114-Status: GOOD (  11.10  )
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

With this commit (riscv: ftrace: Reduce the detour code size to half)
patched, ftrace bug occurred When hosting kprobe and function tracer
at the same function.

Obviously, the variable caller in ftrace_modify_call was assigned by
rec->ip with 4 offset failing the code replacing at function entry.
And the caller should be assigned by rec->ip directly to indicate
the function entry.

The following is the ftrace bug log.

```
[  419.632855] 00000000f8776803: expected (ffe00297 1a4282e7) but got (1a8282e7 f0227179)
[  419.633390] ------------[ ftrace bug ]------------
[  419.633553] ftrace failed to modify
[  419.633569] [<ffffffff802091cc>] kernel_read+0x0/0x52
[  419.633863]  actual:   97:02:e0:ff:e7:82:82:1a
[  419.634087] Updating ftrace call site to call a different ftrace function
[  419.634279] ftrace record flags: e0000002
[  419.634487]  (2) R
[  419.634487]  expected tramp: ffffffff800093cc
[  419.634935] ------------[ cut here ]------------
```

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/kernel/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 8c77f236fc71..61b24d767e2e 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -132,7 +132,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		       unsigned long addr)
 {
 	unsigned int call[2];
-	unsigned long caller = rec->ip + 4;
+	unsigned long caller = rec->ip;
 	int ret;
 
 	make_call_t0(caller, old_addr, call);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
