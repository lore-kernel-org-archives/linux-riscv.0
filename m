Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4109EE57DF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 22:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVwF8t9HUYg+R+/AjX0EC5MVEo1mhY1RPaaxMSMnHNo=; b=bwcsZsFvDxk9Qa
	Yy45iGTThJTtE3dfZt8r1XSjw0O79tCzYXpHkdBwIq2f1N5/TPWLbr5ea4llUEJgM2q/PRv6RoUzh
	xagEivj4i6g5JFEZJUde+pbA5MVGmxNWQIWotgeFjIN2mRAaM0kLGCFXOlnaMJ42dubYQsQWAbD1N
	q6tsxpvD4aGLISW6xg8IPxoaI3UeOZfFT2WUDAH7ms44Ms4eMun/nQO7r8X8YqZOkXodu6pWhU/pt
	b3mMUBoHV3SzPcGwckAm2GWuSBKSTDvN8qOp/o2rtJfzW05nrH54iLtTFQr4Zi6Z4LSoGVA84A+f8
	+kvTBvVoYZSZ42hrAIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCA4-004DLz-1U;
	Tue, 12 Sep 2023 22:47:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgC9w-004DFG-1L;
	Tue, 12 Sep 2023 22:47:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31c7912416bso6595019f8f.1;
        Tue, 12 Sep 2023 15:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558822; x=1695163622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxeItlNv04+BjzshAn31wAsB9adLvt962s1bQaHQhqk=;
        b=FCXl2Q9dE+us5/A+btBzzZXOMUkxuB8YCqDuaDSQu+npSqI0+lBEkPbCeH/DuYCvtF
         TSorx3hF3CDclrkIBvOp5EsoW+PWWT25xd6plgHQ7Wnmz4XBMOTgPBzDkwWjxZVX3sGG
         qLnDeKoI4FYiuqoTS0hSaXLFtjMeFFzTdvXSUr6c6pGNwlHqjLPpa4e9g19cKdCEywmv
         ZFZUckLH+eG+Odcu441dN5eQzS3RhQJoGWxihluFrfnzqaU3FvmhioTr43g7WtvNrmHH
         ab/d6ljYLBezKTwkGYoLll9/rlpRJr1pxdVr+XhFJciKrlZka1fIAOKZsl8osmcE3R77
         N7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558822; x=1695163622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxeItlNv04+BjzshAn31wAsB9adLvt962s1bQaHQhqk=;
        b=Rb0HvObDO52hefWj/IESnKM64xIRmPY8MLUf/xNtVUhIIAzBhFSc0zhxakcNwM5gbZ
         ik3wxvrKSmBXo78gjckRDWDRVSTnYFN1L7bA4U8P3tYEWc8E7ApUMfm5TlNuGP7lHrL1
         EmVbRiJ2r+59sHRG1Kdn8DjsTUAI9jt+lOabTsKfZSltVyO1fflvY/zSoCaSeL0cgFj5
         MZKoRrYBZFb6tW5RKyhv6ZgoPy1UZVT8M18Jr37u+optt6PFGNPobj6R7WUrUQUywAxe
         e8NjQ/bRfYEPUTp8ksYioZM2oTxj7xWtuqKZuEmtO9aCDX/VU87Bi0/HlnCt+jtAnMDd
         qZtA==
X-Gm-Message-State: AOJu0Yw0AERVkboyLu/zQg8L7Vn3wb90xA8NhDXH2yKU3nZw+xDlfiX0
	1UwPiDlmS25xf1K6ro4YZg8=
X-Google-Smtp-Source: AGHT+IGIRL1pLS66Q0kL+tNt95f9G7dGNYYYAmglWQ49OAUKZ2P+a9yQAWCML5eZu0IFvzTnTl7LPw==
X-Received: by 2002:a5d:45d0:0:b0:31f:9838:dfc4 with SMTP id b16-20020a5d45d0000000b0031f9838dfc4mr646970wrs.33.1694558822455;
        Tue, 12 Sep 2023 15:47:02 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:47:02 -0700 (PDT)
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
Subject: [PATCH bpf-next 6/6] bpf, verifier: always mark destination of LDX as 64-bit
Date: Tue, 12 Sep 2023 22:46:54 +0000
Message-Id: <20230912224654.6556-7-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230912224654.6556-1-puranjay12@gmail.com>
References: <20230912224654.6556-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_154704_463017_D9BEA268 
X-CRM114-Status: GOOD (  10.81  )
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

All 64-bit JITs utilize a single instruction to load + zero-extend a
byte, word, or a half-word. The optimisation of emitting zext for LDX is
not useful for most of the JITs.

All the JITs that relied on the verifier for zero extension of LDX
desitination registers have been modified to always zero extend the
destination.

Now the verifier can safely mark LDX destination as 64-bit and stop
emitting zero-extension instructions for it.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 kernel/bpf/verifier.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index dbba2b806017..02a1ac1a1327 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -3028,9 +3028,7 @@ static bool is_reg64(struct bpf_verifier_env *env, struct bpf_insn *insn,
 		return false;
 
 	if (class == BPF_LDX) {
-		if (t != SRC_OP)
-			return BPF_SIZE(code) == BPF_DW;
-		/* LDX source must be ptr. */
+		/* LDX source must be a ptr. and LDX destination is always zero-extended. */
 		return true;
 	}
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
