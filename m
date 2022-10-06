Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4DBC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 07:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jNKemA3GW03zmKGgUzG0X4+Nd9hKtrYIHB6GAc4wYxI=; b=OPCPaLjNrmVJTV
	2Y4OM6ManUojp/AiJHZxydp1MXh/JQD1DmY5Fdak0Z9Bm17dggGs/T5XwoUn8G+Bh6a2WjaJKF/Os
	ybgKpHSFCg5zR/kmqXBUk+ZiZnD3wGjCbkJY0HvvLxQrAnkFba257P2MCflyjdO00IikFwlfbFa1F
	7fWcbPwbzer9hruFdUDlt2rUKD2HIZ2lQTFfVwCRbd+rw3jZA8P1dTG6Xa8P26tK5LcgfKjGkUBBN
	4xjGpCe6x4KfSo1qYc1cu8pbfqfmFV4ZRqyyfa6B4Ur596IXMGw6DObPeJODRhBKyaYzA7M8dnOJo
	AJzfAoKHO8WXu1jGKekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogKy0-000Jxs-Ar; Thu, 06 Oct 2022 07:06:48 +0000
Received: from forward104j.mail.yandex.net ([5.45.198.247])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogKxv-000Jw5-8X
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 07:06:46 +0000
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:7594:0:640:2d18:9252])
	by forward104j.mail.yandex.net (Yandex) with ESMTP id A67862F9A67A;
	Thu,  6 Oct 2022 10:03:00 +0300 (MSK)
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id yYZDPb1P4X-2vi0vajV;
	Thu, 06 Oct 2022 10:02:59 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1665039779;
	bh=5RTtbpB9MqKeuFtwCR+bpAvBlgufCwcN1kH3vcMsM+o=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=Ifrc/9hW4yrF4ki1RLIQujMFhYr0zxD7vN1d29GeqSFVmpauj+mKQsaWpLAAm6pWB
	 cij52U+cowo8cWFmWfkEl8+FwywXqJM5smUFfbFIQ8nAOcbiuDpBpS/SumP8MGFY0i
	 9kFhx2S/AzngcEJwgx4CguPKkYY99ipKxUgxWCOU=
Authentication-Results: iva6-2d18925256a6.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH] riscv: fix multi-letter extension compare
Date: Thu,  6 Oct 2022 10:02:56 +0300
Message-Id: <20221006070257.11632-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_000644_346263_19BA35D2 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Yury Norov <yury.norov@gmail.com>, Nikita Shubin <n.shubin@yadro.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, linux@yadro.com, Tsukasa OI <research_trasio@irq.a4lg.com>, Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Nikita Shubin <n.shubin@yadro.com>

Increment ext pointer to match letters after 'z' character, so it points
to actual extension name.

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
Hello Atish,

Sorry to blame you, but i double checked this and i don't see a way 
how extensions from device tree could be successfully matched with 
encoded ones without incrementing the ext pointer or prepending 
the encoded extensions with 'z' letter.

I have no idea how this could slip through review - am i missing something ?
---
 arch/riscv/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3b5583db9d80..031546052dc0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -199,6 +199,7 @@ void __init riscv_fill_hwcap(void)
 				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
 				set_bit(*ext - 'a', this_isa);
 			} else {
+				ext++;
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
