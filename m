Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D0FEE57CC
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TCFLOi4/y8t3kd5yzN+aGnyjk3w1QKyDDRaS/NMKGtY=; b=4xTuPF/D48ims/
	DfnnHenJdN3zeI5IKam2fLrThu/7USH6r5FOh1y/xAXqPSgIYDC50j5uunvPeLWBx1mt3m935WAvd
	oEHuY8/jOflKfDMATdALLLvTY0ErzRZCn4btOz4jKvEgRzQVVdYbN9H6F/nhpE/FQ4BbQKYstw10u
	9zSY9v0IldbZga8CM6HFPA3y+T3VAFcoFqjdRBGtkH+LqoxqjR6TvqVw0cORQu9nFrAogpVZTqzav
	rJQyZZTzIe829ijdegOyk5ShhKHM7lN92IoUsiO9QWvmyLXKannHaxrC/4ZuMbCFbpPBQpHfriq+O
	mHDkmpPUzomvyoVILJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgC9x-004DHB-2P;
	Tue, 12 Sep 2023 22:47:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgC9s-004DDF-0T;
	Tue, 12 Sep 2023 22:47:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4018af103bcso2036075e9.1;
        Tue, 12 Sep 2023 15:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558816; x=1695163616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5maphRaiJtxCw6vGqmBPcygT14ffJWcXjb1lb6GupVY=;
        b=GXwWhpwK0crRrXu07LHgy9ZGJfq3u0iXVcfVX6bsrCYUGpWmjoi5nDg1Wo8yaWo0IG
         oinsM0V3CPQr+Kw8tekVo9x8NgKYdkqTNPuYTFF7SFRi6ke8rnjXVPGdtIgzZEZUhnjy
         35NYOWvNARlCIdWeMwLjGyM9HVQ+E5rES1I1MY9aJurCMhqizVhxA6bisuJsvTwS1xPw
         CsCj9Q0y3x/aZ4nNynZTDkt2zwzzBRvafJFXtVPQWMIaf5DF/r0oOLvW48AB6/ZY+fET
         Cvgc9bM21L5Fj6p9lMdBRzFw/S1nfX3OsuttC71cVjplzoObKLIOqZNEVOt5M9tpvxo6
         A5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558816; x=1695163616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5maphRaiJtxCw6vGqmBPcygT14ffJWcXjb1lb6GupVY=;
        b=ogmrO439qMDy48YE9OY5wIrNvztY8xTjCeejtOAErRHasK6WmMICCBN/LYCiBW262A
         MjxNdHIHJW/gWvIfGE+NFYdU+2xYgFyCbivGd3kD5Ft/jvhJKLX03BGc9Vfs5yntPu0A
         qawsKaiGj3dCnbwASeuc5uwOKiA5uIaRXe6EG7CP3+LjFTfEFCmDVrta2jM2FHMUkWKA
         62qylY0S2/QnYSbs6sCyGNrrWUukfqKjoJRs+L0EdiDykti5fRHZ5Wc19aB+Df5MdO3t
         o8ZyGxkWb2/D8SaHmxdt7RpiuQXZ7z1j9siTt7IuhlwigTSOiYnh7Vp0JSv9H8Aiqcto
         GPNQ==
X-Gm-Message-State: AOJu0YxSrKS8IkMRhn5OrUsD5Zc4PfuvmrHnRQjMcvVPgWwNMUUpUjOj
	gG43LaBZe20oiq79FmU9/+c=
X-Google-Smtp-Source: AGHT+IFYGntNSfOXewM/tS8LvcLOqQgmS8ZJLgFgXfGLUpzIXraOzxew/iXIiOfAYDr2U/xwgoNtcg==
X-Received: by 2002:a05:600c:21cc:b0:401:c8b9:4b86 with SMTP id x12-20020a05600c21cc00b00401c8b94b86mr734598wmj.9.1694558815736;
        Tue, 12 Sep 2023 15:46:55 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:46:55 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shubham Bansal <illusionist.neo@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Wang YanQing <udknight@gmail.com>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next 0/6] bpf: verifier: stop emitting zext for LDX
Date: Tue, 12 Sep 2023 22:46:48 +0000
Message-Id: <20230912224654.6556-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_154700_696537_C54ED8D9 
X-CRM114-Status: GOOD (  11.15  )
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

All 64-bit architectures that support the BPF JIT do LDX + zero extension
with a single CPU instruction. Some 64-bit architectures like riscv64,
s390, mips64, etc. have bpf_jit_needs_zext() -> true. This means although
these architectures do LDX + zero extension with a single CPU instruction,
the verifier emits extra zero extension instructions after LDX | B/H/W.

After a discussion about this in [1], it was decided that the verifier
should not emit zext instructions for LDX and all JITs that can't do a LDX
+ zero extension with a single instruction should emit two instructions by
default for LDX.

All 32 bit JITs checked for ctx->prog->aux->verifier_zext and did not do
explicit zero extension after LDX if this is set by the verifier.

This patch series changes all applicable 32-bit JITs to always do a zero
extension after LDX without checking ctx->prog->aux->verifier_zext.

The last patch modifies the verifier to always mark the destination of LDX
as 64 bit which in turn stops the verifier from emitting zext after LDX.

These changes have not been tested because I don't have the hardware to do
so, I would request the JIT maintainers to help me test this. Especially,
the powerpc32 JTI where amount of code change is more.

[1] https://lore.kernel.org/all/CANk7y0j2f-gPgZwd+YfTL71-6wfvky+f=kBC_ccqsS0EHAysyA@mail.gmail.com/

Puranjay Mohan (6):
  bpf, riscv32: Always zero extend for LDX with B/W/H
  bpf, x86-32: Always zero extend for LDX with B/W/H
  bpf, parisc32: Always zero extend for LDX with B/W/H
  bpf, powerpc32: Always zero extend for LDX
  bpf, arm32: Always zero extend for LDX with B/H/W
  bpf, verifier: always mark destination of LDX as 64-bit

 arch/arm/net/bpf_jit_32.c         |  9 +++------
 arch/parisc/net/bpf_jit_comp32.c  |  9 +++------
 arch/powerpc/net/bpf_jit_comp32.c | 25 ++++++++-----------------
 arch/riscv/net/bpf_jit_comp32.c   |  9 +++------
 arch/x86/net/bpf_jit_comp32.c     |  2 --
 kernel/bpf/verifier.c             |  4 +---
 6 files changed, 18 insertions(+), 40 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
