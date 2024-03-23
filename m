Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010CACD11DD
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 15:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LgdlqhEYP7UULN5cq+Zif+LJPbQLiYCsmmfDMvK30LE=; b=rwkwv8ELMI3y5o
	gt5ORkmGus0yfBl1owupmqc6hqPJ8mxSFM5D9WTn92bldUCbg+DcbzQwFwOrMrSWEsh53yL9mSdZG
	ua1fMfdSH3SeILcIpozhXQLDRd7pwQHVbtsu4JC29N5MZMhWJ5T0ccWH4+M9gT7I9IjLwh/vh+FWa
	axLPIowfx6CIQXYmJRYSiX2QEAg5cyNaNBRkltsYLLqZqQ27iV3CeTl8HMgbF82RtTQL7VofsKLlC
	cqSmSxAJUluAnuEO27vNvwcx17p0CpFc1dx43eybylAK2q8k9VXZC4n/wmUJfxkiC03EKzztA089l
	WY7b5xDF3IyIcb5L/mjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro3ab-0000000AfA9-36HW;
	Sat, 23 Mar 2024 15:47:21 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro3aY-0000000Af8y-0d1m
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 15:47:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33ed7ef0ae8so1938288f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2024 08:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711208835; x=1711813635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tMU5gNAuADzB5Tcq4mD6yx393J+u7FkWid9t2/0ApH0=;
        b=VgslhVDlnR1LfensSpBklpe/5lCyRvJpoTZPvaGyPvJQCucOqIUfBoFyuvzicS4+9I
         QdEg0AmjylUrQyIbgEX3xMicNdKFgxzxRqEB6FNmqBBXyd1D+9XsE2aLmwgjpuO40NeB
         +gK2ygs65Mdv2vJbYr1+zMiagudTlmz1Iir8aA0IoAA2+K63p9A4jLQsqUngRLAy9yhO
         W07Kgyho8Q7jVMRC+5bV1sL1Ym8qFqz0a++6EjqATcW5yUiUQku89EvO/hOhzMMB6XvJ
         2TfeEXc3rlDl/n8Tk3t2younNbri5o/aOq+0V3CIPmg4kSi8j9Ylg1lyfzcz8TrfijYL
         nOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711208835; x=1711813635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMU5gNAuADzB5Tcq4mD6yx393J+u7FkWid9t2/0ApH0=;
        b=rybPvVoFmAdDMoNL+trnQV+BvC30bXKtmnpAVqcFzX+ORUlyvNhfg3kUzWrlu56I5T
         DWZRUF9yDKZ1/V2SjlQgBGSbh5C13XwdyGLCIdIRYuE7Rix/tQJEDe/nbFWwYLwy8ERJ
         v/bDplwVFiMrjCwbhQgNMeN2Oz4mJJN3it8QUoO5PC4WAMEoKgFFNmzznJatENlGdSeA
         aY1vEO0pUJytp0SC6tmu+uxLLJrPcKqLpPbQHmWUl7mWd/ElHoZZC6kiEluHm5iYhHfh
         0XREkPlRB0mrz+hzmLV7ew+J9lJP/Jh1NGhJWx/FwqExF6m/3lZrAK1pI2D5aWTfpPRM
         Gs0A==
X-Forwarded-Encrypted: i=1; AJvYcCV7ZIF6k+aSapKpTGQJLqBbi/uvbXLLh6M+tUDU6/MY5xIZXmCWFQcU8UGFHWlQrp0HhuG42iB+2tqfYGOWsSuO7iydVFY9mi6C84fF2xga
X-Gm-Message-State: AOJu0YxYgPy9AiUYNgrgGG/7rGAnUMzG2YRsmK5gVqJt8ckEL4sZNvZB
	bn/rRurXaaH7NFgFYy7Ko5q/g4nNMAEzbZun9+mXCtyqM/Gn4B+w
X-Google-Smtp-Source: AGHT+IH/IKbgeQ/i+N5Wg6tsT0hn/z/Fll6a4YCP+GxaBGqM4pQZ/LTjS10uSGbsNkzc/9U74IyS8g==
X-Received: by 2002:a5d:6a0a:0:b0:33e:7979:edc6 with SMTP id m10-20020a5d6a0a000000b0033e7979edc6mr1887414wru.15.1711208834702;
        Sat, 23 Mar 2024 08:47:14 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id df10-20020a5d5b8a000000b0033e756ed840sm4676011wrb.47.2024.03.23.08.47.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Mar 2024 08:47:14 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next 0/2] bpf,riscv: Add support for BPF Arena
Date: Sat, 23 Mar 2024 15:46:50 +0000
Message-Id: <20240323154652.54572-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_084718_237342_A57C915F 
X-CRM114-Status: UNSURE (   8.27  )
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

This series adds the support for PROBE_MEM32 and bpf_addr_space_cast
instructions to the RISCV BPF JIT. These two instructions allow the
enablement of BPF Arena.

All arena related selftests are passing:

  root@rv-tester:~/bpf# uname -p
  riscv64
  root@rv-tester:~/bpf# ./test_progs -a "*arena*"
  #3/1     arena_htab/arena_htab_llvm:OK
  #3/2     arena_htab/arena_htab_asm:OK
  #3       arena_htab:OK
  #4/1     arena_list/arena_list_1:OK
  #4/2     arena_list/arena_list_1000:OK
  #4       arena_list:OK
  #434/1   verifier_arena/basic_alloc1:OK
  #434/2   verifier_arena/basic_alloc2:OK
  #434/3   verifier_arena/basic_alloc3:OK
  #434/4   verifier_arena/iter_maps1:OK
  #434/5   verifier_arena/iter_maps2:OK
  #434/6   verifier_arena/iter_maps3:OK
  #434     verifier_arena:OK
  Summary: 3/10 PASSED, 0 SKIPPED, 0 FAILED

This needs the following commit in bpf/bpf.git to work correctly:
https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=f7f5d1808b1b66935a24dd796dd1a0612ca9c147

Puranjay Mohan (2):
  bpf,riscv: Implement PROBE_MEM32 pseudo instructions
  bpf,riscv: Implement bpf_addr_space_cast instruction

 arch/riscv/net/bpf_jit.h        |   2 +
 arch/riscv/net/bpf_jit_comp64.c | 208 +++++++++++++++++++++++++++++++-
 arch/riscv/net/bpf_jit_core.c   |   3 +
 3 files changed, 210 insertions(+), 3 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
