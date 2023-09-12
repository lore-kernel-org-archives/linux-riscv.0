Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57B4EE49A4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJ+HvIqGkOkzwgbMsXeWKgAxySntQ8rhUlJtWAcEYPE=; b=N9aJPGzj5eF3Ha
	9FQPJLICit2ABAainlvAF8FmxPu5sROt2SZSX7NnM12gV/UpeYQRLDS2uF8IGwxAxGeiaSIl1SVmJ
	z2QzJtW2OEP77JjWFVWOV7rmKMKvPBh4DIKtTBBOP0Y40REOrvcCWGo8+XyLh71zHmH9bBXTrBreY
	xlV2+6jDp+rt1IwwHEurLq6A+YG4I4PuwbEUXDkmKof7kTTU3hLiFCaqmjVACjxLkUM/1JfqpNUbc
	7VrJH4m9i6mbXpxqFNnddImeznPJNCYVbbQoe48W9k7BYT3s9BZmF30JeNcK1pI38LnnbBgXREI9t
	FYVPMIR9I1RAVfb1PmEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgC9z-004DIA-1x;
	Tue, 12 Sep 2023 22:47:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgC9s-004DDK-2w;
	Tue, 12 Sep 2023 22:47:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so1846915e9.1;
        Tue, 12 Sep 2023 15:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558818; x=1695163618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT29HscYryKGVaLS4ITmGogx99J9Puoxilk7JdApwLE=;
        b=BiSDXMHajtxHfd83maBOxXA6EzN776zuBcm3ahY6bGSsQnpZIj+ytcwrW/uksaZ5Bh
         p3Rs9HKPHTEGjr1pE+CueEblgd69BR6URwXMuBotVyKkbdkQXnteEiS1klqKt0+6k03M
         S3sGv+oVARVNuLrVpMzXizgpGscRwtza3pt7yyMYJDyY2DeZ2A3u5cQGOKExCsltHaD/
         Clij1weqUZYUhXPZZY1/ZqxJD5lJvQ9G+uOtWEyM2CgNaLhbIQz+rD87YL7QIBLdMpul
         jq3isknsYc7aOHRlQUPHniCOc0RKfzNzrPJvzP914om3GPjPHBkPFiiSOxvswU0PilRe
         Ayfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558818; x=1695163618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sT29HscYryKGVaLS4ITmGogx99J9Puoxilk7JdApwLE=;
        b=LZDYWYaIdco0NurjcxeO69wF4spl+0UyK6gP80DqzNeu6jZSbKfdJtxCEt84HWSoO+
         rMJSLACut2wJB5pFzlamm7U1Ca9HqSlyOotnhUQu8rnWvzsSinwAxbi/SUf4PD2w3UeH
         ZzBlitvwDKrM3P11Ench9EeP2zsOtB1bfde9ogTpmdpmCl1SEf4mxYLnW/dEbb0+cPIJ
         UzvCChnPChddMv43vqozvTkcodZ/o9OhXt5Yv4NeHDAshalWnKl6swMH7DBbLM6RmJU8
         cm+yr3Qj2Pau9z60ZiIrWnC9I2+fh1pKfRcoxS4tuUVMfLainlQGDINlMK7e40xx5veK
         AFtQ==
X-Gm-Message-State: AOJu0YxUPKp8Uwt3s1GgOiglL7ydy9VONXc8yZhfzEnm+JI7kWF/8SM9
	eZ/r5dffsXZ24i/CRYkEqIk=
X-Google-Smtp-Source: AGHT+IGmXcseiJIR5TJ93E0zDMbc0daNf/KmJUUYoyIE/Gf3HMcwKKCMLML9MVROQedqC+pALyVq0A==
X-Received: by 2002:adf:dc85:0:b0:319:5234:5c92 with SMTP id r5-20020adfdc85000000b0031952345c92mr596882wrj.35.1694558818289;
        Tue, 12 Sep 2023 15:46:58 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:46:58 -0700 (PDT)
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
Subject: [PATCH bpf-next 2/6] bpf, x86-32: Always zero extend for LDX with B/W/H
Date: Tue, 12 Sep 2023 22:46:50 +0000
Message-Id: <20230912224654.6556-3-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230912224654.6556-1-puranjay12@gmail.com>
References: <20230912224654.6556-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_154700_945760_AF7B69CE 
X-CRM114-Status: GOOD (  11.33  )
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

The JITs should not depend on the verifier for zero extending the upper
32 bits of the destination register when loading a byte, half-word, or
word.

A following patch will make the verifier stop patching zext instructions
after LDX.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/x86/net/bpf_jit_comp32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
index 429a89c5468b..aef9183ff107 100644
--- a/arch/x86/net/bpf_jit_comp32.c
+++ b/arch/x86/net/bpf_jit_comp32.c
@@ -2050,8 +2050,6 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image,
 			case BPF_B:
 			case BPF_H:
 			case BPF_W:
-				if (bpf_prog->aux->verifier_zext)
-					break;
 				if (dstk) {
 					EMIT3(0xC7, add_1reg(0x40, IA32_EBP),
 					      STACK_VAR(dst_hi));
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
