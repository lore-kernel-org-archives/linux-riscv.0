Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D3BC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nXmK5Iff/RBRuhEx9Qm1fDTvAfKcdGkuNAX3CKB9Mxk=; b=l1uKej25Qp3M4Q
	sb53HjsUz9K6B042sgMHmB3qhDhFGY08tjLqoL98e4inBC3UHINH9Y6I5LhkSa/cIF+y8dewohj5t
	2WWCaivJcFgkgzrmYnNktrhG45vszzC2wwBf+2jTVFhPjBWwF3QLG09f2BbyakYCuPNURei9DhYp7
	OUHoFZfqj676RDTZ1hISRNfiDmVCuhfd+2d6PlkeB8j6zrtLhqq0TYn9KpdSztxRlQYMQZa43iV5Z
	W03hNqtMzmZd3BswTMN8kmL1pR5k3w8vN1U08RyjGhCkqfbvOgRC1eit13DF7SGU7ngrzKe+CYXAY
	DUqnnTk8nVI3iY6w5MGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weu5P-0000000206Y-4Bml;
	Wed, 01 Jul 2026 12:30:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weu5O-0000000205I-3va2
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=J5IzwYzPDTeWx7tKr7hSDF5l+BLDO1MD+S8kZpieZcM=; b=PVXv600i9brtXGzNOZOMNHB5Vo
	6EiLutlFePYq8sHdSaJ/oaUSnII7RFrZ+7vOrLnlJaf/mnySZieCSFdhgh1XLCPQuiL4V+G1xhnfm
	QDhMUzfcE+88n6AUxuChEf/ZJVaoRA2trd5zfnQe3Eb/Dc7E6I2VB678YAIXpr5YOal5tT44BkTTh
	CrIIJSxsWMvpnXzVRQrivclpfMSGBca4V7v+HwoiCEy98yu4/6mCuBjIdqncHzlOflrV569E736Ll
	eb1FEL0rCjxNLJSmOOnAq4lqQMFiJxC8Zwd0bXc9/D3jr4+5EJaGvg4Mplhzfgg4RrcmkKGHKPz+q
	oisQzayA==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weu5M-00000002kyj-0aOX
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:30:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c9c9916f75so2806915ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782909030; x=1783513830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5IzwYzPDTeWx7tKr7hSDF5l+BLDO1MD+S8kZpieZcM=;
        b=cNw1///7aaQCqpy5smvxXKm7gebLiWwuSxXi41mQfLfTn8yr5kLeC/0pHWHVd5FYmY
         8pYVFvPAvTVhiQsQC/LdZK0OyYQsh4Zav4riOQIUlpsikbNv5655D5fptAOdMvBEcVJw
         oibXD0m7I7HFXH8ICKpsULH98wlNC7m48bdzdjZRPpCHWYXffDoikcp5AzNC6aXkc45z
         xXdZasnupN6icCOfeibomt9NA+vJ01LdTA7JLOUngHbYpa2WfuQR8ZJgX+eFHQSvgQqO
         UGzoeWW6rQS9H04oK/m75MGVFR3nLGAherSZPDbtDXbaM7QxSBZeBMl62v6M8fbPEtx1
         R6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909030; x=1783513830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5IzwYzPDTeWx7tKr7hSDF5l+BLDO1MD+S8kZpieZcM=;
        b=BmQgeq79xT7Aascy4YRTFCXcZtxj4QzepRQbN98lkX3g256Rzx48H+aJUgNapXhY0J
         +H8xKIdvHeAjX0FoRKpzmgtvQbPcA2wF2K321SHjUtkIv9k7uLRbhaYaf89vhOUJv2HF
         HfZwV91u/cmYOsKVDMy1pWmmLfRPCe3Qvxv6oRU2PU/UxdryC5aD8sEoeQV8++ePZ++o
         PJfPdMnasoeFDCRvO9S8jFSMAmDCpVKQ4fXxQHzSTAe/3+TPl6WRecO2VSnYg0YEJn3s
         FylS8qyhkLkxWB7CExWNoKOcM2m1s36qiMCMkmD7jyhL8WJ8hvshH0b4fYJX5MvzIX5e
         j54g==
X-Forwarded-Encrypted: i=1; AHgh+RpMJXiitZwuuNaTimteTq0KjPv92AKd1lxwsMGellFXgi8MG6qh2JVVUkoChba6mxOglPD0JqNvUD2xcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLISiVk5rXIBkYBKSwxpCYvZG1VN/tuPi0DoifaQ5slCRE5Vha
	qGJcOqD+UwmlFv/YvbC1u5hoFAySv420Kc9RPH7NQt03mSPmN0NwI7NXoyhsWEOmwfE=
X-Gm-Gg: AfdE7cl4mmMM8XQW+GB9zUVoNxzZ0ETzV9IzYzN0A5ql05y6zokoC+XG3nvTWZhN3Dw
	mguJgWIzU1HIxKuiLT+ai6C8ZQNaoNK/jxPiV1BULW0d2/oL4QfSNC6Jki6qgNjMPkQBEtNh2+M
	om+tmNexXHSi9wba2cVzYmGnzrOFGRnGWT3Evjj/Wo2Ye3QnWUWGQTD4/+Y1eqS3n5zjB9sEfPZ
	imqVdrNrxRtO1Na9z6AML4c4SsZEUexsEzQH/KR18643+J4yFAdiIRhjlVmfHWReReUjsPvBBOX
	XQYCR7XcDYCXYSrfwy6apU6tSHWL4DGH9wyR+bTvuA9Y9TKEji4ZT9x08byBpjLyIa04TylpcTq
	O5F3XadtaN2wMcPwPyjnks1htNKlrPHvTS1KssbazDr3XF2SNNrZ42vbXO3UCsSLiQqfDHVAydu
	5k6gov+jLfnzUL2iT1zwel12n3w2eQPHmGOE8+D3BwcsrB0eO/a+N9FfuH
X-Received: by 2002:a17:902:d549:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2ca7e682ad6mr16606255ad.8.1782909030457;
        Wed, 01 Jul 2026 05:30:30 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca4bae1e2asm25166825ad.73.2026.07.01.05.30.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 05:30:29 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v6 0/3] riscv: fix PIO helpers and add optimized percpu ops
Date: Wed,  1 Jul 2026 20:29:45 +0800
Message-Id: <20260701122948.57584-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_133036_355939_3DCFB569 
X-CRM114-Status: UNSURE (   8.08  )
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

Changes in v6:
- Drop the extra PCI_IO_ADDR() helper; directly guard the RISC-V ins*/outs*
  helpers with CONFIG_HAS_IOPORT.
- Add the missing <asm/cmpxchg.h> include to arch/riscv/include/asm/percpu.h
  so cmpxchg_relaxed() and system_has_cmpxchg128() are visible.
- Clean up the two 8/16-bit LR/SC fallback asm blocks to use consistent
  old/new/field variable names.

Yunhui Cui (3):
  riscv: io: avoid null-pointer arithmetic in PIO helpers
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/io.h          |   8 +
 arch/riscv/include/asm/percpu.h      | 288 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   1 +
 arch/riscv/kernel/smpboot.c          |   8 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 317 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
