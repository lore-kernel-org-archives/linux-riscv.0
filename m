Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6410C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jul 2022 02:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aVHGd/kHr6wh7QAQ1nBbIiV8Q41sjcN5HANJelLaFE0=; b=bkg+8c2s7o34RQ
	uNgY3KCkYyY8JYIJio/o/CANbjQIOWZedo0LZipM/qNozbHxW43pkc4Y/0zJvVNFzxyQNNh91C25I
	FeV/i0kJJGEyMlHWIiZ6cgCAynYYkBLieJLkXAg0/UnnukcIU6dogn5kmWMz2Fkxe7D/Mmf0Xcdga
	d1nmRv9dGztFwuc4XxpyCdvqh1OEbPZxJ/7Yv+D/d+Hfa25+g4jhheF5VK0q/G2W+W1Aq2ypaHuzc
	GkeO3I2QvHa775DCuzlqk14l87e9XcP1drYYurovhzawMHu21DpvIyT1M6Lq1y1KWhq7CgJP+HFTY
	BUshbnc8DaFRNAQWZT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnhu-000o0G-Ck; Mon, 25 Jul 2022 02:20:30 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnhq-000nfF-P5
	for linux-riscv@lists.infradead.org; Mon, 25 Jul 2022 02:20:28 +0000
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-08.nifty.com with ESMTP id 26P2JX9c029536;
	Mon, 25 Jul 2022 11:19:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 26P2JX9c029536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1658715574;
	bh=SCnWUTOIqjfB89rOg7Ig7Vg8sxcS4A6+OR94yhgDrEQ=;
	h=From:To:Cc:Subject:Date:From;
	b=uvvfneWPq3Jp9S3lMU+YReM/b5EXCFXzf8KWkZsGnERpRGlKQxhlnMSPxspEpX9VP
	 gXJwFXjhqYPD//fvUIz312mXaG8YhPpGPCaUNe26MDKJO5RvxVygsQ/GDSJ9UM7Zuz
	 0LQsMVmgk1Ks80IaNgkb9YAaqkgj9GOId+IUMmhnS3BS3SeRmhdM2yYglANswDEnpH
	 KQXDmzs4HW1x0sCVod7Tf/atEU8cqxnEJucaN0glYXDvst+Gionle9jGmi2Q4DEl+J
	 accDGMlHs7JO59GAYqBZnS4OiWH1g0X8m6dq5HF1tuwu/008nKsn728cZo2wa/U9oQ
	 5LUGRLsBFdqjg==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Borislav Petkov <bp@suse.de>,
        Li Zhengyu <lizhengyu3@huawei.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv/purgatory: hard-code obj-y in Makefile
Date: Mon, 25 Jul 2022 11:19:01 +0900
Message-Id: <20220725021902.625630-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_192027_122440_61C573BD 
X-CRM114-Status: UNSURE (   7.95  )
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

The purgatory/ directory is entirely guarded in arch/riscv/Kbuild.
CONFIG_ARCH_HAS_KEXEC_PURGATORY is bool type.

$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) is always 'y' when Kbuild visits
this Makefile for building.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 arch/riscv/purgatory/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index d4df200f7edf..c2d14e2f345d 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -92,4 +92,4 @@ quiet_cmd_bin2c = BIN2C   $@
 $(obj)/kexec-purgatory.c: $(obj)/purgatory.ro $(obj)/purgatory.chk FORCE
 	$(call if_changed,bin2c)
 
-obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY)	+= kexec-purgatory.o
+obj-y += kexec-purgatory.o
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
