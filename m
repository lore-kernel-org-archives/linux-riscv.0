Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A60AD5B87A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 01:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bdz8AG6rrMngVhB7PlXq0SnxNujPBmY/PgkrxVz8MUY=; b=TtfxDwHxjdj4jM
	vNxe6jfUKqgStmW44Un1IZg8a9xMlhfHTHb3RQY8EAii210WdX3P5/+Oa3AMfczYpq665lV+oZhBY
	f40u7nNWeg5BT3bK1U0JlAvRdNpLmw5k8ljFoyGESPDn5nYaJ6KvV3wC8CFsyy+BpmyTzvgBXAE5c
	RTrMNyhpY70Cpk2w7WZePb7Fa7G5xP4Ee3Bv58lHDOTRVgPUhI0mAjvIaJaxPCtQc2D9/nyW/QbKD
	KqNVyij6IQBKAQBIkx4R5E0uigYQJA7+8Ns9rrRWMAnfO+lFT+icdhJuRc46J/KJL8TznvaSWtVWC
	kwK+x/PJYGC7f90QBtSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKAD-00000004VeJ-13ON;
	Tue, 16 Dec 2025 01:47:45 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKAA-00000004Vds-2gLn
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 01:47:43 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so85444b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Dec 2025 17:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765849659; x=1766454459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQOYML69oTsOQ75vYxPwSIyfraEydi6o2qTswuNZTTg=;
        b=jN+/i5wUtvajyszX/OK7JcDltLAfCWcTumEvNDmON8Dpoe2eRGMIeCqz1Abwe8LXkp
         WpWjN9h/OwfbZT9qTGN+flt8q9RAB17THARY8O1hjduuT/ZqpjVi7xfXWC6JctIVs9Da
         /RornhImfvrGJCUh4yGlCnF/UAqNmAyD3YxZBsU1tB9bgMaUD0co4aj2+wQFAG3p4VIc
         CntbWg3KQzaVDHfq82YNxDz+M5trwtKKAWn3T8YnIp3Zs4jE+bnnRV9QqDxlZ/GCub+4
         12+pvbi4wOZzzVcGrjOrTZKqusvKEZPtNOk+0aO0XmkFfAlwdnKLHKHI+BGYj0TDoQOw
         YmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765849659; x=1766454459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQOYML69oTsOQ75vYxPwSIyfraEydi6o2qTswuNZTTg=;
        b=ExCwjwvoaVwFXPaVJQ9tx3axwPTHVZh/PZ5RvntEdxF/PBLzpHwtZ4egPfsXbS1SI4
         PvUUawJHyR6E0HhgMIP2TQQGFsGrRdthQNuCKxW/kfQ7kqAIgEiHrraMJ8PIsK1BYF+M
         CDue5yHN7S14bN9Bkq01msBaD0+s5UftNnbphsanP5c7JJQ4Yxu4QKO4qNUPX2WPc7ZA
         WohUpnEw4hZWzRwOeWiYTtI5RMTu/B66Mg9jj7aYGdgoYEH4VD272FWSTUTF49ORm70M
         ddYWm+qCQEgSlEbnA0J8+e8oz4YYdhqKntgGsmbnOeRjSp9uXzbJjbLstHEJE8wMzwwK
         Ixhw==
X-Forwarded-Encrypted: i=1; AJvYcCUxMfUb5J1yaH8B21CdkR4fB9a8PSNmbaZMPEPSd+DOoyxkfcK1cStOUanzYnhJj4bGfzvXW8qQ09N8yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxP9ED/35UXFrhjcvfM9fgJvJf+A/iMcYPg9m5b/LEtzUt1ZPa
	qiho9B2WWEiLlI5E6DpS7YGnUgUkRtg8fltpNz49vQj/POPfDHV3feEKpoeZTRdC9N8=
X-Gm-Gg: AY/fxX7fpOG5BTgV6bU+1Ic3lpF4KN1PUasWIBbBKN66nXFGBuIbtzjhRhYVBOpzoFB
	n7UhHbw3I7lv4EVhoNur8qog9q7ojIgrmJkSlaKpKhp9Qhny+UFlb1QXybMpuDOHQxZMXYSVHyt
	A2FYM38yXTNYsJXzpQ2iOTOkdLf48BCzWXFNBvTb3FvgjGhYv/KfnzUTxqeOonrZr3BNQrqUSTB
	4dLLacgBUayb9Tml4lb6fE1+WdN/GvooZqwPNUxJTsA8B4/MWi0KlUfD3yQrhT6BkqiM4Ep3vF0
	dqwxJja7Zt3n2AzF+cGNRDQZuM1z6CKMUjprZ6pgl3BcV/Cc3kzn16Iltxe+PNgTcVBQHYllE8h
	64+m23AtQO8PtItO6mxheCHIIQpjRiI1/1KgU6x+FtLIpx4fbQxIBAsrvsbYIwI7TLi11v9qnEd
	SSmBk46rkF+at8YVq8R1tbgl6/LNIWyiqOar06zM3U+YEs
X-Google-Smtp-Source: AGHT+IFb4p41Qgk4jrG7oAwM1kTzSPIz8GaGD809Q++LMxasrDyli3QXNwxda2W99S4WH1s8MPX1mQ==
X-Received: by 2002:a05:6a20:3945:b0:34f:b50e:e2e2 with SMTP id adf61e73a8af0-369afa01a2cmr11969729637.58.1765849658920;
        Mon, 15 Dec 2025 17:47:38 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2c963b53sm13632790a12.36.2025.12.15.17.47.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Dec 2025 17:47:38 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andii@kernel.org,
	andybnac@gmail.com,
	apatel@ventanamicro.com,
	ast@kernel.org,
	ben.dooks@codethink.co.uk,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	charlie@rivosinc.com,
	cl@gentwo.org,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	cyrilbur@tenstorrent.com,
	daniel@iogearbox.net,
	debug@rivosinc.com,
	dennis@kernel.org,
	eddyz87@gmail.com,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	martin.lau@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	puranjay@kernel.org,
	pulehui@huawei.com,
	ruanjinjie@huawei.com,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	sdf@fomichev.me,
	song@kernel.org,
	tglx@linutronix.de,
	tj@kernel.org,
	thuth@redhat.com,
	yonghong.song@linux.dev,
	yury.norov@gmail.com,
	zong.li@sifive.com
Subject: [PATCH v3 0/3] RISC-V: add percpu.h to include/asm
Date: Tue, 16 Dec 2025 09:47:18 +0800
Message-Id: <20251216014721.42262-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_174742_704320_2F78F362 
X-CRM114-Status: UNSURE (   6.68  )
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

v1->v2:
1. Support percpu add/and/or operations for non-ZABHA
2. Implement optimization: store percpu offset in thread_info

v2->v3:
1. Fix this_cpu_cmpxchg128() compilation issue when
system_has_cmpxchg128() is unsupported
2. Fix sparse warning issues

Yunhui Cui (3):
  riscv: remove irqflags.h inclusion in asm/bitops.h
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/bitops.h      |   1 -
 arch/riscv/include/asm/percpu.h      | 248 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   5 +-
 arch/riscv/kernel/asm-offsets.c      |   1 +
 arch/riscv/kernel/smpboot.c          |   7 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 269 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
