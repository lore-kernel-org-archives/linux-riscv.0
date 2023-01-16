Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DF0C46467
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKT3sOiMyKTkl6l2nQ1WSoftNXoqdZ1jXZHlVYj4RDs=; b=tffFEUPRnyOXY/
	/5C+rxO+9ohPO8lgUKIwx1c7GLefIvxDzvJRH/WIwm9YTrlc8aCUeT7i4EaAtG/Oho1vEFARskKv5
	mrS4PhCeqEiJPLx8XDym4or+j/2T+RbD5doWejCYjAYYsWsg2zKbq+bkhZh9iskL2LtShrqb3NJ24
	zahLdDN0KCAXf+q2STVE7cD6G+LCEgDx/DNZ29/WzblWkM1c3Kz/B+WaWaFAD94EeVrFZd6HMzywB
	nbtubBl2Q/JVBsnXKRdJf2HG0R1FpYkQjEQ/qH+US9CVlRVKY5E5epI1rfJ97liaFfftyuqha29Yl
	S1MMWm3hMLQtr42B6/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRsS-00BAz9-GC; Mon, 16 Jan 2023 15:58:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRsN-00BAxR-Ut
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 15:58:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 519FE61030;
	Mon, 16 Jan 2023 15:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74215C43398;
	Mon, 16 Jan 2023 15:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673884702;
	bh=t4kWO6RzYGVOXF7OBL8S5jRby3O+U8tlpoQh+00evO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WhVJ/wweeC1d7+vmLys3cy87idXZSvsxGv8ovyvUhrhSj/1KOZEENKX4ljEh/vaHj
	 5KSWoEI2B1qF5zpLPjLN/vAGCpuE3EOQ8UjjAUg1waQpQXRA+E7AphE675vVhLxQtI
	 tSxwO/KIApZXgxZw+5xh1jRMCXZaLOpEQF3LvnWXEwRhvFRVB6y6pdbF04X4yjghja
	 MiGlArgdb3/fXRHbDbwmMr8BhFliFtz3LQqTqF1+XpbRxZeUGdROj2Vtt4eSUslh3g
	 8LYqZ6UfmhvuExYZeuwW2oWWKkd/ZA8Vm2EpW+KtbajfX4Bbwjf/lmy8lV1NT3eJ57
	 6lRY/mcBt1Thg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH 3/4] riscv: vmlinux.lds.S: explicitly catch .riscv.attributes sections
Date: Mon, 16 Jan 2023 23:47:59 +0800
Message-Id: <20230116154800.2396-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116154800.2396-1-jszhang@kernel.org>
References: <20230116154800.2396-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_075824_045041_9D88EE8C 
X-CRM114-Status: UNSURE (   9.63  )
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

When enabling linker orphan section warning, I got warnings similar as
below:
riscv64-linux-gnu-ld: warning: orphan section `.riscv.attributes' from
`init/main.o' being placed in section `.riscv.attributes'

While I don't see any usage of .riscv.attributes sections' usage in
kernel now, just catch the sections so that we can enable linker orphan
section warning.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 6a250313b752..7eb3d25d0dae 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -146,6 +146,7 @@ SECTIONS
 	STABS_DEBUG
 	DWARF_DEBUG
 	ELF_DETAILS
+	.riscv.attributes 0 : { *(.riscv.attributes) }
 
 	DISCARDS
 }
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
