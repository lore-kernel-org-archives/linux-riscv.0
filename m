Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF29606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 03:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DLdBfO+X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=L8szFntg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Oz9MdVoZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jttBybzoVhgUWQqRKNtdz3ZUUoasFBmuD9knAwEk1SM=; b=DLdBfO+XwB+1KBA99W25HA75HU
	mYn3nvI8k/1JumICoA6O2LGC/0rtA+Z3f2END3djkugSqYuI1ZoFumTpmhhj/Xt19G/KCi4UIlCpv
	1PpXFrl0giPFQI/DGsjBX067of62Lbc9CJzCkLEmSX2uHbxqgSZRZ5CiPZVSEKUugnGPhiEGhgpmB
	18+HQvwiXkU5mwKW/t0XumlLLETU2c/kx9mmrRg97AnrEB5Ofj2XQmjsxHmyV+U/fmBeh4pFW2yiL
	xm9MLUhhz2ZXet2Zc8UGwr5KJQgOcRAmaJ6vEbArF+ySE48dULn/aQ0LQDkk+jklnIif4i50Iwlq4
	OYuJpZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTW7R-00000007bRC-0FXV;
	Wed, 18 Nov 2026 03:13:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTW7P-00000007bQS-25zH
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Nov 2026 03:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=L5q8BDBgXiYmhDXOEbr+29YbxI48AJAxwCUhEtoaisY=; b=L8szFntgQoNnoowGv2i0YY3RGJ
	u48MFZ4JFJzaZbh0bWbXCAi/sBRG3ZOOTgTQNyuTwYqIGIuTF/P4rMSUO4D12jKQjqpKTqIVFffTt
	4aZ9M+y2bK6vZ3JXdfHebkEEBA42LwgYK357T/oMo8JV2iGUzLJkGXdDFTWj0E7UYAW3p9Nl2Ycmu
	iMO9jNobDNtjQqpPieTeXdLvUeFELH3BSzUZpoPMlGNvj2NSl2V37+Nr6V2RUyzjWHKp2nhoIsxtr
	pA0e7tadoF4z/1C5fgTq/eKIjpF6PLIpLKUWXP4VxRVdf+0EQXgN7GCnJcKNYdatn2p6vRaFANy3O
	eGISHEpw==;
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTW7L-0000000Fbo2-2V1T
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 03:13:54 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-37198ed3727so1936933eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 19:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794971628; x=1795576428; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L5q8BDBgXiYmhDXOEbr+29YbxI48AJAxwCUhEtoaisY=;
        b=Oz9MdVoZs7wizhbZjlE9QqpY7/NvdylwBan/AnUro+pIk8t0vTqfEnvANsJphiPnhV
         bWJUNKiN18oLG2rfLSGwtgSUnABUu+lEciAJ3Pca2rK+i5j1NzoFm+p0oqjHcjuuhxU9
         GB0C/192oEHTW4cT1PqESCowywi8jV7MfsfThJVOmjdmue24/eL1I6k9dpJLFe1oqriV
         tCN2NsHU4+JaIIdEmj1cotAgidRuKbqnjVr4tPpNDhuw0ooaPJK5p8Wao/W5iGHv3BEp
         4Kb7NlNj/ovTwOwlcAnFR6X8UiNL96A2x6YzjTGo1k2ZUms52C/4n2o6CgGF1CEZiW9c
         m8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794971628; x=1795576428;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L5q8BDBgXiYmhDXOEbr+29YbxI48AJAxwCUhEtoaisY=;
        b=EMkIMaJLXClu72xiXNWtWpUj686jgEFSfeZGlehY6695RBWePff5B+ndKZzJmhwb+U
         G9TLcQZqr1/8Bo0Q8snoJWG6ZWS9lfstBHRLmi8zaque/FqLF2zN1hXndl8U0u6MhDAh
         7ctEYZxcU15glT/Nzcxl7jTteT6pMO0BOGUuvNWZVjHcUjg6hcx+bTIZSogELyDbRnSt
         irnjbqGCsaN+l+QbSwtiDLzT7cj0GYDJGbWp5fHHf2Rhbp4H9cjhTMr3UTbnX4YNDuGP
         xwTDsnD/Ch6dn0xTTt8wjsW+hat9NYpHqOjAgqEYGBFf+pdgTR/LRs0grdOt2rMTFh2A
         VpXw==
X-Gm-Message-State: APuU4Z9h/WvSKndqoTaYkbbS6JF37Bw6HDeTMoHz0VjByCnyrK7iISD4
	Y1nD6UYIK3aKtXkPtUskRmqWdrLAC3wOJc6Rc0jfQ7D3oTqZiHocK8B6n1P4pprZFeY8q1IJFBj
	Rql2Jd5M=
X-Gm-Gg: AYBFou3eIO1+TVhaSvr4g72qFrmsrvDMiBmezXjeIqoFmazkgIfuiVcEL5mN+Bj00Tu
	b2nywOPrrL/cSR+/Vskc/evPYr2FZk4QJeA8Z0hu1G88ERW/e1Jolsrp0XbzUpGUFXxQffXNJXJ
	EBhX+V3M7CEbN7celtMe2iQUo5NI8QxQfHWWoYHMfMQuGMfuvUmvbOVU+2CTNvpLN/bmA5xwcV2
	/l+mMv3VKLP7NeMqkmf8B1o8LBbrC8AfyKIYA81n8Bw0jCgK3+bZ2Goyz5FIc6VZ9OC3rSCS0ZD
	QD3wlScAKWGRVOxO09x1h5YcMVojQ28UlmXQ1vEf/79Aq3KnAiGHX6gByw3939Q+EQHgu94IFRR
	+5N1kRDa7ZSEy5QwhXApaziaZz6dTVlDjC2Wkius4xEYtBcg48Ytpu9+3JmWAlAvUbQSirCwZ5d
	sO1g8ujUt+OLBjFKz70g1ATRBbHbaCtkyDIXyXbwk7U3Wo3sTnf8NEnHMiYNDeUY5QJUmjPSL0C
	DxUs6mR9sbMxtJTTWpWuRrrtcnKKzMc8K25jYJWVjkgMqHl5e/7PlZC9ZyFCsJrjyPigorWU6ec
	2uLbc7SVA3h0Bs95Db4ZqgRtt1wTkGBYBJGlFnhlI5Zwjg==
X-Received: by 2002:a05:7022:2204:b0:192:a481:361 with SMTP id a92af1059eb24-1b543bab9b0mr1720933c88.7.1794971628351;
        Tue, 17 Nov 2026 19:13:48 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm2512908c88.4.2026.11.17.19.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:13:47 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v2 0/2] riscv: Add support for vector misaligned load/store
Date: Tue, 17 Nov 2026 19:13:43 -0800
Message-Id: <20261117-riscv-vector-misaligned-v2-0-0163d9430ca1@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOcX/WoC/3WNQQ6CMBBFr0Jm7ZgWoYgr72FYQBlgjIDpaKMhv
 bsF3bp8yf/vLSDkmAROyQKOPAvPU4R0l4Ad6qkn5DYypCo1WqsSHYv16Mk+ZocjS33jfqIW86w
 oDt1R2do0EN93Rx2/NvOl+rI8m2v8rbp1MbBEx3tLe73ufhVt/la8RoXGZm3slCpvirNwx572d
 h6hCiF8ANj4Q9DRAAAA
X-Change-ID: 20261109-riscv-vector-misaligned-54773f80ca6b
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Nylon Chen <nylon.chen@sifive.com>, 
 Yeting Kuo <yeting.kuo@sifive.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794971627; l=1965;
 i=nylon.chen@sifive.com; s=20260310; h=from:subject:message-id;
 bh=iXjcMyTOvfzIys2nrg1v5syp2opavv2ux8AuD7rDQMY=;
 b=R9MJURmXB4LQYZF+c4AKnz8C4a4tCB4yhpBjsH8VhlBxJ8bVtVRL8eHfhYW8kdF9RJ8s+9jgC
 gl58oWhLj6DD/WSeVrVu6pmPO8j/MeUjSvHljgwi9hsgwmcrqxheWrK
X-Developer-Key: i=nylon.chen@sifive.com; a=ed25519;
 pk=+xtFLLbXfGd50d5UhR9oBzLTh+JLft7T60t3u7YMZPI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_031352_235177_382FBDB8 
X-CRM114-Status: GOOD (  11.52  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds emulation support for misaligned RISC-V vector
load/store instructions, which may currently fault/trap without being
handled on hardware that does not provide misaligned vector memory
access support.

Patch 1 implements the trap handler, with emulators for vector
load/store covering unit-stride, strided, indexed (ordered and
unordered), segment, whole-register, and fault-only-first forms, for
both user and kernel mode traps.

Patch 2 adds a kselftest exercising these code paths across the
various vector instruction forms and element widths.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
Changes in v2:
- Fix riscv-allnoconfig build failure reported by the kernel test
  robot: build traps_v_misaligned.o under CONFIG_RISCV_VECTOR_MISALIGNED
  instead of CONFIG_RISCV_MISALIGNED, since the former already depends
  on CONFIG_RISCV_ISA_V, which declares the kernel_vector_begin()/
  kernel_vector_end()/riscv_v_enable()/riscv_v_disable() helpers the
  file uses.
- Link to v1: https://patch.msgid.link/20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com

---
Nylon Chen (2):
      riscv: traps: Add support for vector misalignment handler
      selftests/riscv: Add vector misaligned load/store tests

 arch/riscv/include/asm/vector.h                    |   4 +
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/traps_misaligned.c               |  39 +-
 arch/riscv/kernel/traps_v_misaligned.c             | 902 +++++++++++++++++++++
 tools/testing/selftests/riscv/vector/Makefile      |   5 +-
 .../testing/selftests/riscv/vector/v_misaligned.c  | 169 ++++
 .../testing/selftests/riscv/vector/v_misaligned.h  | 530 ++++++++++++
 7 files changed, 1647 insertions(+), 3 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261109-riscv-vector-misaligned-54773f80ca6b

Best regards,
--  
Nylon Chen <nylon.chen@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
