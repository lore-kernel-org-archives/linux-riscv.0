Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E48C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 02:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8/Ah/k5/GqZUpVjCScAXUOvYX2QdRV8TPR/vg1+ookM=; b=3K37BwhPx1OFtZ
	wNJk9unOuUVwdPcTq2fLuGa/nqG9jOxMBNM39FOyO1phyMe5u129IKB5pQvceWKJzda1wYBEGSrfr
	VvQq1ak7Hxm+Fwvt46XFp3if/XvNyVQE2Fwe5uxKSwbJDI91LMI9x5AgXsU+Qr09E1+6jlFKc/8N8
	ViuKuhkfagT+nKrleK0XKKk2AXrIMQpoFNW0ujLULwmYw/Ynp5PM+AJmhlViG+tWGfiXuITwhdUpJ
	RsFXKKnW6KdOOs9Bu0XM2LLMO0neFMPDhR7igYfmv6cHGZ0r1ZwutYEPckJ83y7cliqMjBdeFVDai
	iITWPLhtnuw2+frzL/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOr4y-00BxXl-0O;
	Thu, 27 Jul 2023 02:50:16 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOr4v-00BxX5-0w
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 02:50:15 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3a5ac8717c6so443566b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 19:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.washington.edu; s=goo201206; t=1690426212; x=1691031012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QspNxTEi/qT/BgadxTLzSVy271O3r6BuXIduCGxDThQ=;
        b=efxZRhLkLzlA3ccwQazCze+AE3jhUxZF0vLhd6J+9iDsHnSAmrjU9K3DluO7dKZHwB
         UxKYuDcrzLjb653pZPNHt0WYWdq+GR9OxaSW8kKZaItiAGblEU13aSjDND8Syk4dtVCH
         nwcRaQ1IqmcJGUYMecWRwdVX5vpousJa/f448=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690426212; x=1691031012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QspNxTEi/qT/BgadxTLzSVy271O3r6BuXIduCGxDThQ=;
        b=IunHgxRUMF53N7asyFjFIlsfcqLLc/6vhwACtdlQJAuSIiJCEzd5z2AIUVcgGaUPHQ
         trmwMaCNItU91AlcL+vrgkUsk+WaMqmJZZ2EsqS6MaN9UgA3/8zVyxakLVVdur8wqYxD
         eAbGLQIB7s4IXY1h8hacn1abWc5GzJgI9rJukF3yeL8rIRJGHW7xNtzTgtR4OUMwt78S
         sew1x6Hi0/RKn9tL2N0KbLvdSBMa5Yfp2G5/e1hSkrr+Q94JMMwvKpBBsrbpAMJY/9qf
         mXU6o9jKHKGegF0FvRWF6jajyMCwdGuahKuv24WydOx5kag65y2E3htZ0wiMFxSkL2mP
         nesw==
X-Gm-Message-State: ABy/qLbe4qrd83WZqoSb9XWzuTMdFlPQ7BomT3b/GQ7e40TNVibXqBrp
	Hol/kRvqyzBnAM/CIcSwXxiGlRife6DAKyuipMCXpA==
X-Google-Smtp-Source: APBJJlEXoJUhxPgiBoapPWNXWPOoG4MBDEOp2OM0y2T2xlmygi47Kcm0f/Z4g8ETBkWfrszT1jJT8A==
X-Received: by 2002:a05:6808:1a92:b0:3a1:ed1b:9541 with SMTP id bm18-20020a0568081a9200b003a1ed1b9541mr1443669oib.40.1690426211687;
        Wed, 26 Jul 2023 19:50:11 -0700 (PDT)
Received: from marth.. (75-172-111-252.tukw.qwest.net. [75.172.111.252])
        by smtp.gmail.com with ESMTPSA id f25-20020a633819000000b0055bf13811f5sm240782pga.15.2023.07.26.19.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 19:50:11 -0700 (PDT)
From: Luke Nelson <lukenels@cs.washington.edu>
X-Google-Original-From: Luke Nelson <luke.r.nels@gmail.com>
To: bpf@vger.kernel.org
Cc: Luke Nelson <luke.r.nels@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Xi Wang <xi.wang@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] riscv/bpf: Fix truncated immediate warning in rv_s_insn
Date: Wed, 26 Jul 2023 19:49:31 -0700
Message-Id: <20230727024931.17156-1-luke.r.nels@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_195013_385473_849E3348 
X-CRM114-Status: GOOD (  16.75  )
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

Sparse warns that a cast in rv_s_insn truncates bits from the constant
0x7ff to 0xff.  The warning originates from the use of a constant offset
of -8 in a store instruction in bpf_jit_comp64.c:

  emit(rv_sd(RV_REG_SP, -8, RV_REG_RA), &ctx);

rv_sd then calls rv_s_insn, with imm11_0 equal to (u16)(-8), or 0xfff8.

Here's the current implementation of rv_s_insn:

  static inline u32 rv_s_insn(u16 imm11_0, u8 rs2, u8 rs1, u8 funct3, u8 opcode)
  {
          u8 imm11_5 = imm11_0 >> 5, imm4_0 = imm11_0 & 0x1f;

          return (imm11_5 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) |
                 (imm4_0 << 7) | opcode;
  }

imm11_0 is a signed 12-bit immediate offset of the store instruction. The
instruction encoding requires splitting the immediate into bits 11:5 and
bits 4:0. In this case, imm11_0 >> 5 = 0x7ff, which then gets truncated
to 0xff when cast to u8, causing the warning from sparse. However, this is
not actually an issue because the immediate offset is signed---truncating
upper bits that are all set to 1 has no effect on the value of the
immediate.

There is another subtle quirk with this code, which is imm11_5 is
supposed to be the upper 7 bits of the 12-bit signed immediate, but its
type is u8 with no explicit mask to select out only the bottom 7 bits.
This happens to be okay here because imm11_5 is the left-most field in
the instruction and the "extra" bit will be shifted out when imm11_5 is
shifted left by 25.

This commit fixes the warning by changing the type of imm11_5 and imm4_0
to be u32 instead of u8, and adding an explicit mask to compute imm11_5
instead of relying on truncation + shifting.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307260704.dUElCrWU-lkp@intel.com/
In-Reply-To: <202307260704.dUElCrWU-lkp@intel.com>
Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>
Cc: Xi Wang <xi.wang@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>
---
 arch/riscv/net/bpf_jit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 2717f5490428..e159c6e3ff43 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -238,7 +238,7 @@ static inline u32 rv_i_insn(u16 imm11_0, u8 rs1, u8 funct3, u8 rd, u8 opcode)

 static inline u32 rv_s_insn(u16 imm11_0, u8 rs2, u8 rs1, u8 funct3, u8 opcode)
 {
-	u8 imm11_5 = imm11_0 >> 5, imm4_0 = imm11_0 & 0x1f;
+	u32 imm11_5 = (imm11_0 >> 5) & 0x7f, imm4_0 = imm11_0 & 0x1f;

 	return (imm11_5 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) |
 		(imm4_0 << 7) | opcode;
--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
