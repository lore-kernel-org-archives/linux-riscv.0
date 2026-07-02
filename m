Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11120C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 02:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f8vlq52vBx8jawoOyzORx3xiBOvAk6mCs3eQ460DKIE=; b=JtsCyVGzmmyYro
	PP64RR5KEyyPB9L/cvrfWt2JSWo2a33DqT+k+Y8Dws6jW3AITwvCtVHRTpWLB8sAbkBx8E0d77dmW
	BMm9wrZ2wrDRuavHJS8E2zXU1ji57FM3Jl4TbCQWkiIwvtkPewkoS9s25kAwr7Fc1CaDzaKrJ5S0z
	ZOYJtMBxfEmqFSVECrdcfYyezFU7qfyNbMJ7rm2y7c/U3rglZgndQ+9AUX1V23iVpBNlldLhQ7AvD
	otE/6KC1uH6IjenfyS5lvK4O6jMmSJ7ggx1ma396Xm6IBovS61KFnlm0W6QriC+MBBK7gvF98NGUn
	lrRY9j8KTt9HguTlfmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7a9-00000003S6t-2fJt;
	Thu, 02 Jul 2026 02:55:17 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7a7-00000003S6W-0kt1
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 02:55:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-37ff798fe89so924398a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 19:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782960913; x=1783565713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzv59asYaYM1r1NY8KtOkB7QhvGiD1GkLe9qJuyqT78=;
        b=En0fbPc2eTLcU1cZD62EAgFAuXv6V0cEvnLVNfFy/4oujja4Xs+uuIzNvATp2pJfp4
         Di7QdCdulQKIzQS8721jl0ieeqgnjiv+98C2F25iwbFrYxMVac8V8FWMF9MaJCm+sOQg
         PjKnXz3w8kgOtQZenc6PQIMQtWEE4EdQs6ii5jd2SyNRjEprprxlS7OsjZYAq14L3es+
         UutNIa8x6iuoBD67MgNiATn13/PVVzFGDuc6ZAoNuFqOsoji+L75NpirzaRReKb/pkOo
         +7bWIqdHGqLEuYGerN7k+qWzLrUX4cGKh344tXzqAIt/+hqvmoh/7yY8pYJnv/TGdt7K
         e91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782960913; x=1783565713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bzv59asYaYM1r1NY8KtOkB7QhvGiD1GkLe9qJuyqT78=;
        b=OV0ZInz38a8/E/MF/FcnLXQR8/aM7cZkJf07Zac/uTYc3dw8tOwUj8CGZoBLCM/Asy
         NBBenWJ3zqXkmypctVhtGX1HaUoAyqDpAnZ/QQtY17ctKbWqbK98qZzLB14XrEjor3wV
         aChD1lRpK6ka8OVb5Oq/0WLU5vLQeQ2Po+l90WygZHcvJVVcMmnVxYg8hVRy8h1tTOlO
         Ry/57pYTNApxoP7orOTHkU/369Ir0gCvtZ8EBWNimI4hVUmiDkd8HbRZeH4q41m9Dk16
         qVProXqPog8Re6tsncnQd04kOM7voqEkKGle47OiYKrA+IMH4stSJalmDh1S2JFyTbyy
         QYJg==
X-Forwarded-Encrypted: i=1; AHgh+RqfI7KyaSAWffZdd8To0EuMOJt8HjY5HIpMYVoAFMIsiqE42hTNMIfffPSyDRBIHNR6M6Mj0zruBUXt0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSoWVro+VB682vYXRmNddNyQX/3vGKCmBSJthQtWU9kyX9L4Nb
	kV3oPbKGWHZeyRCd5I4+pgnJiT68o0cN3uLi0NES3aKNN67bqBRTDOgA8xnHVuvfR6Q=
X-Gm-Gg: AfdE7cl6el3nTBop8drbn5fPPNOXpGzrk1lczeOk/voF884sllvlYfs+ZOelQwLXujg
	vjYMZn7vkz/KzNw4Gft07a0Qwn5JlFFzedzr9BhYO9I3BK7kG56GqF7WLIkRoV7uD6xtod1Z9oZ
	v9f8kuQuFQrTNbMJga2sW99FCtlMvJNHmBg/rdLtYFt46LyYz4dS3mtPrSVJtDs8/P4/+vyg549
	JeduB0hg7AZi7ceslzXik9qFy+u49Yw2yDCOe2vp5lXoYVr8aAwpue9tvPwGWZulZQXx9+CQEid
	GFBfRce+jZqTscR+Fh+dLlhI38ue4nWAFtTFggcsauXNCUVVKYtvl99K5UUbr5cfnQ7p9MYL2lO
	1Vcy5WQwoH6nvCau3Gh8+xJODyEh23wBu2CR/Bbv6vkA40LOJ6+gQ8/Z/7XhovaiEQlEzNXw4dc
	eADfzbyI4FAEFACFFs+dPnNUjt7hsxKZHIr/B8cPH6a0sHk/BGlnk1rgua
X-Received: by 2002:a17:90b:580e:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-380a9e38790mr4709918a91.0.1782960912995;
        Wed, 01 Jul 2026 19:55:12 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm4358686eec.15.2026.07.01.19.54.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 19:55:12 -0700 (PDT)
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
Subject: [PATCH v7 0/3] riscv: fix PIO helpers and add optimized percpu ops
Date: Thu,  2 Jul 2026 10:54:40 +0800
Message-Id: <20260702025443.83389-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_195515_373203_E76E553E 
X-CRM114-Status: UNSURE (   7.98  )
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

Changes in v7:
- Address the Sashiko comment about inconsistent AND helper naming: rename
  the RISC-V internal percpu helpers from andnot to and, and make all
  this_cpu_and_*() wrappers pass the operand directly.  This is a readability
  cleanup only; the generated operations still implement the same plain AND
  semantics required by this_cpu_and().
- Undefine internal percpu helper macros prior to including <asm-generic/percpu.h>
  as recommended by bpf-ci/Sashiko review. This prevents macro leakage into the
  global namespace and has no impact on generated code or runtime behavior.

Yunhui Cui (3):
  riscv: io: avoid null-pointer arithmetic in PIO helpers
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/io.h          |   8 +
 arch/riscv/include/asm/percpu.h      | 300 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   1 +
 arch/riscv/kernel/smpboot.c          |   8 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 329 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
