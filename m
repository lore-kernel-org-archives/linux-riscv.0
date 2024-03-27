Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C19C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BVvI+O+G36o0b8S+B7hygqdvy4k+TrlqNaBXChefKS8=; b=lCTbrmlxkzwOzK
	u65kACHZDk6T6bgze+uSThvCqEFuECOM/aEoFzQlTpmFeK8QhHqXMT36K79as7p/scIA91mDb2j/C
	jVRwZ2PccL47DWte1BRWzAu2nRbStJW+kSpA7L5eko3s9Gai4PgLHAiYKnXsPlJtuctkZ/BpJXYC3
	zClsbUIGmRauAh0o17NWrqZOXCKlLmJbBqXSj/iShmZluXQuqZZBoTONEN5ldSIfmejTkMgqyN4F8
	dP9o4rPEzytre185nYY5xPpIgsQnfesDNM6d0HymIEcsnTb8xnUvGL2/pDMyojbedhGKellRggBsS
	F20mxEsMUnANVNEqPPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWur-0000000AFir-0dRX;
	Wed, 27 Mar 2024 17:18:21 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmF-00000009z5N-3xB5
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:05:29 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e0f2798cd8so19135915ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711555522; x=1712160322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kwbw8Bfq5TVdPAVwgD2UahVCoOXtlyfhsdDWXgrrMaI=;
        b=FEZ+Pa2mbpPe15F0hkbwoupAO8oMwJ3O3ErtI624zYNamQGgvdZRmnIl736jcqgl4O
         H38HP9faAk07Thdz3q4eLafY+frTGkSBEk/eF3agNlflKzeqtQBNyv56MHRxf6+wsFmT
         JASMQYyiUla9WuoyVaeNZXAf1TnYrJ7naD0pGYeVWyyN/I5Rh9DZZGpgvn1Gr1xJcoLo
         i2ZXW/tWI08+2EkuKHVpza/IL0dhVDnNd74eXfYukxGBJeTG+jRBcQUqtLNB3tPp/RmS
         cuuLpe7bg4i4523oy+6oktcD6UwQ9pg9OPMCdVvrN1C/XZBjRZP0k+9sBDVuPxezklHf
         mhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555522; x=1712160322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kwbw8Bfq5TVdPAVwgD2UahVCoOXtlyfhsdDWXgrrMaI=;
        b=FOZmtt/DM4VZP3Lx9ws+PC1EFmvC5i6JDAzwRilTK1VBD+can6emWa+FLN0uF7GIon
         V9zPjTDLmdBvcQtqwomwdbvNPig9m/37DYTO36WWpdCwBZgjTvowH3MjUe6AfLmLwP/+
         Fo8YtDrmgpB9rSDg/1TN6Les1FjAggf2L5p91v4NSAvpicRh1m3dah0QhubD+AR394FQ
         cPj6gUDGEE3NT/3kW7VqQTiYfIxqa8tfZB6Jqttpi3I54XxscnoRSo/pdPtKq/ZiFSse
         K0E2xSuGmDzsYxudpbN6KuaDA83FtVEHTBsN1oIxEz5hV15pJfb79CB9DZqMy5s1cdUO
         42SA==
X-Forwarded-Encrypted: i=1; AJvYcCVbhpS5LYP51NcOOJ2xD9gKNQBASGRtfl/FhXzgcUNqXeOkVLFipRHZ/ur705NYvxBb0LqFK9+hGGYFzXFMoAvTs01NkfRMLNGHh4taB9VT
X-Gm-Message-State: AOJu0YyIG7dansUozpuDHJnOAhpCP6S6DPcwAqwZTfuq89UFfjcIHVhQ
	abFyox+WDapBwETleIs3/jdo6QS3pcOfCcplogzAYzmblkP8t9IJpByZDFVP+t6bBP9m0uOeNN8
	2
X-Google-Smtp-Source: AGHT+IHrHUQx8CTOsGUx7d9I0wuSaSBLdTL7D/z7DZEE6/9Njp7t/Ngzy8GHegWFTHCH7uUVnbidfQ==
X-Received: by 2002:a17:903:11c4:b0:1de:ff9f:aee9 with SMTP id q4-20020a17090311c400b001deff9faee9mr138103plh.11.1711555521786;
        Wed, 27 Mar 2024 09:05:21 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b001e14807f9cesm1718226plb.125.2024.03.27.09.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:05:21 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	bpf@vger.kernel.org
Subject: [PATCH v2 0/7] riscv: Various text patching improvements
Date: Wed, 27 Mar 2024 09:04:39 -0700
Message-ID: <20240327160520.791322-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_090524_376834_2D420095 
X-CRM114-Status: UNSURE (   9.87  )
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

Here are a few changes to minimize calls to stop_machine() and
flush_icache_*() in the various text patching functions, as well as
to simplify the code.

This series is based on "[PATCH v3 0/2] riscv: fix patching with IPI"[1].

[1]: https://lore.kernel.org/linux-riscv/20240229121056.203419-1-alexghiti@rivosinc.com/

Changes in v2:
 - Remove unnecessary line wrapping
 - Further simplify patch_insn_set()/patch_insn_write() loop conditions
 - Use min() instead of min_t() since both sides are unsigned long

Samuel Holland (7):
  riscv: jump_label: Batch icache maintenance
  riscv: jump_label: Simplify assembly syntax
  riscv: kprobes: Use patch_text_nosync() for insn slots
  riscv: Simplify text patching loops
  riscv: Pass patch_text() the length in bytes
  riscv: Use offset_in_page() in text patching functions
  riscv: Remove extra variable in patch_text_nosync()

 arch/riscv/include/asm/jump_label.h |  4 +-
 arch/riscv/include/asm/patch.h      |  2 +-
 arch/riscv/kernel/jump_label.c      | 16 +++++--
 arch/riscv/kernel/patch.c           | 69 ++++++++++++++---------------
 arch/riscv/kernel/probes/kprobes.c  | 19 ++++----
 arch/riscv/net/bpf_jit_comp64.c     |  7 +--
 6 files changed, 63 insertions(+), 54 deletions(-)

-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
