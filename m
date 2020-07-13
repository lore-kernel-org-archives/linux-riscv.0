Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECBEC433F2
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 18:37:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DF9A207BC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 18:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1/0jz5tj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cs.washington.edu header.i=@cs.washington.edu header.b="eIJXO0/I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DF9A207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cs.washington.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d7BZUPdupNrmguk/MXhyE7zdJ32CIpMBmUnLPioJkow=; b=1/0jz5tjlnzfiPK9Tef5Dnj8MB
	6+2vCqFOTF7XzgHCojO96Zs+66/NMrepMJjBfp4gRlNfKojQSJoLIRPIZ2OmM9n/+t49tsAi9Asx6
	wRPFVdNRk9VpilpivUkBSU/37I3uYDqs7B9IsXqMjnqybOX5iyhOgTxp2GHHQuKUrSHWbrG1ETinH
	tiJCAPc8JhtBgrUMn9qJLXW8CMZLG1qAquruhUO8LZkahK/c++YE0L1Wk36BZT62ieepQOBz67N9K
	qK3OyLOIBZ55GgK+yjuAqOQzDvLQIyLThMKHXWWKbXrfuXwrFAEynwr0PKF4pATdrnDuF7vP55qsp
	VQq37wKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv3Kb-0007Kx-UI; Mon, 13 Jul 2020 18:37:37 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv3KW-0007Gi-Rz
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 18:37:35 +0000
Received: by mail-pj1-x102c.google.com with SMTP id gc9so289398pjb.2
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 11:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cs.washington.edu; s=goo201206;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ex9NjyWc3V6Bi5bAxe687NL7Tzc9ig6eAA5UMdHYprI=;
 b=eIJXO0/If0B5aBd44ahb08ihRI2GtsNKFQ7pTlz/wT6/TJjKzO502T7CJcvZe9WdR5
 u/qrS/5vxINqmyOT/yLBZZgVNkONvdkC5egbLzM2YycQsLldSIUq0FWKy51uV6YC91Lm
 9apZeRbnW6mztFt+DWU+E4jyvTyoU0WgWdnQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ex9NjyWc3V6Bi5bAxe687NL7Tzc9ig6eAA5UMdHYprI=;
 b=JKLjxdNF/eYNCYCZ0xJRPe17iKjy4EuKsg/ppwr5tt9UzA8KbzEzcyeJdpDrFULhjK
 iRxuvTutGe0dmxyay3C9PaTk6T8t3n0qPLmtbbnfPHTsUCP3uTLO2aMIoO/1usauVc10
 0bwkM8jtqOm8pfa7AlpsCn+viKCmQPdFWlXZ4QGk33P0woqItXAIms/Nli0sJ3bOrlGQ
 9+DDaX0BMcvDWoG+FpZsMN7i/MWUjJAfaSVXfBlnEZJMjkp/tmnDbJ99QTYC15aHO9H1
 4ROwUHmbBy810rOM9p8nNJf6zTCXXAnnJsevP/mdluRH7j0JRNTe5vAiUMtFRFFakuQ1
 1IjA==
X-Gm-Message-State: AOAM530+uSEJ2bGe0XbW/XImt2JJrqXe7bnfrhd5sbP9ErND4cfdkwCF
 xdU3g8+yI0viOBpzimOtgM9nPg==
X-Google-Smtp-Source: ABdhPJwJZ4LXHG3AEpB4QbfoNcdQpuRpmEWG4B06RaqAn3egDPdZSGr1tTw7ZyXyNVuR3iTm+ixTgg==
X-Received: by 2002:a17:90a:1b4a:: with SMTP id q68mr717791pjq.1.1594665444865; 
 Mon, 13 Jul 2020 11:37:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-53-94-119.hsd1.wa.comcast.net.
 [73.53.94.119])
 by smtp.gmail.com with ESMTPSA id ia13sm264985pjb.42.2020.07.13.11.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 11:37:24 -0700 (PDT)
From: Luke Nelson <lukenels@cs.washington.edu>
X-Google-Original-From: Luke Nelson <luke.r.nels@gmail.com>
To: bpf@vger.kernel.org
Subject: [RFC PATCH bpf-next 0/3] bpf,
 riscv: Add compressed instructions to rv64 JIT
Date: Mon, 13 Jul 2020 11:37:08 -0700
Message-Id: <20200713183711.762244-1-luke.r.nels@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_143733_019947_9E2ED637 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Borkmann <daniel@iogearbox.net>, Luke Nelson <luke.r.nels@gmail.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 KP Singh <kpsingh@chromium.org>, Yonghong Song <yhs@fb.com>,
 linux-riscv@lists.infradead.org, Andrii Nakryiko <andriin@fb.com>,
 Martin KaFai Lau <kafai@fb.com>, Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series enables using compressed riscv (RVC) instructions
in the rv64 BPF JIT.

RVC is a standard riscv extension that adds a set of compressed,
2-byte instructions that can replace some regular 4-byte instructions
for improved code density.

This series first modifies the JIT to support using 2-byte instructions
(e.g., in jump offset computations), then adds RVC encoding and
helper functions, and finally uses the helper functions to optimize
the rv64 JIT.

I used our formal verification framework, Serval, to verify the
correctness of the RVC encodings and their uses in the rv64 JIT.

The JIT continues to pass all tests in lib/test_bpf.c, and introduces
no new failures to test_verifier; both with and without RVC being enabled.

The following are examples of the JITed code for the verifier selftest
"direct packet read test#3 for CGROUP_SKB OK", without and with RVC
enabled, respectively. The former uses 178 bytes, and the latter uses 112,
for a ~37% reduction in code size for this example.

Without RVC:

   0: 02000813    addi  a6,zero,32
   4: fd010113    addi  sp,sp,-48
   8: 02813423    sd    s0,40(sp)
   c: 02913023    sd    s1,32(sp)
  10: 01213c23    sd    s2,24(sp)
  14: 01313823    sd    s3,16(sp)
  18: 01413423    sd    s4,8(sp)
  1c: 03010413    addi  s0,sp,48
  20: 03056683    lwu   a3,48(a0)
  24: 02069693    slli  a3,a3,0x20
  28: 0206d693    srli  a3,a3,0x20
  2c: 03456703    lwu   a4,52(a0)
  30: 02071713    slli  a4,a4,0x20
  34: 02075713    srli  a4,a4,0x20
  38: 03856483    lwu   s1,56(a0)
  3c: 02049493    slli  s1,s1,0x20
  40: 0204d493    srli  s1,s1,0x20
  44: 03c56903    lwu   s2,60(a0)
  48: 02091913    slli  s2,s2,0x20
  4c: 02095913    srli  s2,s2,0x20
  50: 04056983    lwu   s3,64(a0)
  54: 02099993    slli  s3,s3,0x20
  58: 0209d993    srli  s3,s3,0x20
  5c: 09056a03    lwu   s4,144(a0)
  60: 020a1a13    slli  s4,s4,0x20
  64: 020a5a13    srli  s4,s4,0x20
  68: 00900313    addi  t1,zero,9
  6c: 006a7463    bgeu  s4,t1,0x74
  70: 00000a13    addi  s4,zero,0
  74: 02d52823    sw    a3,48(a0)
  78: 02e52a23    sw    a4,52(a0)
  7c: 02952c23    sw    s1,56(a0)
  80: 03252e23    sw    s2,60(a0)
  84: 05352023    sw    s3,64(a0)
  88: 00000793    addi  a5,zero,0
  8c: 02813403    ld    s0,40(sp)
  90: 02013483    ld    s1,32(sp)
  94: 01813903    ld    s2,24(sp)
  98: 01013983    ld    s3,16(sp)
  9c: 00813a03    ld    s4,8(sp)
  a0: 03010113    addi  sp,sp,48
  a4: 00078513    addi  a0,a5,0
  a8: 00008067    jalr  zero,0(ra)

With RVC:

   0:   02000813    addi    a6,zero,32
   4:   7179        c.addi16sp  sp,-48
   6:   f422        c.sdsp  s0,40(sp)
   8:   f026        c.sdsp  s1,32(sp)
   a:   ec4a        c.sdsp  s2,24(sp)
   c:   e84e        c.sdsp  s3,16(sp)
   e:   e452        c.sdsp  s4,8(sp)
  10:   1800        c.addi4spn  s0,sp,48
  12:   03056683    lwu     a3,48(a0)
  16:   1682        c.slli  a3,0x20
  18:   9281        c.srli  a3,0x20
  1a:   03456703    lwu     a4,52(a0)
  1e:   1702        c.slli  a4,0x20
  20:   9301        c.srli  a4,0x20
  22:   03856483    lwu     s1,56(a0)
  26:   1482        c.slli  s1,0x20
  28:   9081        c.srli  s1,0x20
  2a:   03c56903    lwu     s2,60(a0)
  2e:   1902        c.slli  s2,0x20
  30:   02095913    srli    s2,s2,0x20
  34:   04056983    lwu     s3,64(a0)
  38:   1982        c.slli  s3,0x20
  3a:   0209d993    srli    s3,s3,0x20
  3e:   09056a03    lwu     s4,144(a0)
  42:   1a02        c.slli  s4,0x20
  44:   020a5a13    srli    s4,s4,0x20
  48:   4325        c.li    t1,9
  4a:   006a7363    bgeu    s4,t1,0x50
  4e:   4a01        c.li    s4,0
  50:   d914        c.sw    a3,48(a0)
  52:   d958        c.sw    a4,52(a0)
  54:   dd04        c.sw    s1,56(a0)
  56:   03252e23    sw      s2,60(a0)
  5a:   05352023    sw      s3,64(a0)
  5e:   4781        c.li    a5,0
  60:   7422        c.ldsp  s0,40(sp)
  62:   7482        c.ldsp  s1,32(sp)
  64:   6962        c.ldsp  s2,24(sp)
  66:   69c2        c.ldsp  s3,16(sp)
  68:   6a22        c.ldsp  s4,8(sp)
  6a:   6145        c.addi16sp  sp,48
  6c:   853e        c.mv    a0,a5
  6e:   8082        c.jr    ra

Luke Nelson (3):
  bpf, riscv: Modify JIT ctx to support compressed instructions
  bpf, riscv: Add encodings for compressed instructions
  bpf, riscv: Use compressed instructions in the rv64 JIT

 arch/riscv/net/bpf_jit.h        | 495 +++++++++++++++++++++++++++++++-
 arch/riscv/net/bpf_jit_comp32.c |  14 +-
 arch/riscv/net/bpf_jit_comp64.c | 287 +++++++++---------
 arch/riscv/net/bpf_jit_core.c   |   6 +-
 4 files changed, 650 insertions(+), 152 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
