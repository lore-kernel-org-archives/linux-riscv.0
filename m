Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D37D1F9AA
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WzCXzBGWhRAJe70fkH381bdSvxYAm73vY+pe0Yjymo4=; b=a4gAjJTZBjD+k6
	j0WnSEBfX4rY16E73sq/kDy0vkrW/O8/UNnuevFQjA36lH6N9XT74/sGh3HI5/noAKXed5jhxWROC
	XPskKaqaFg+4JYr7Pffx/jp7wfuASYVKoIf9Ykj+wZNpC/VYUyX60E82H4oUPC5tYoIfv64iJHsxr
	R1h+W8uJgQ7s2dUfWprGbf6NIV+1EJXMdCBW8yMIAtdy9UBiVCFOtBqpGTxDr1lzWSs8eZYsS08iK
	zqb80vLGolQsprv8U1o8zQrJLaZJ01DkMQ/as9+3/4ZJ7mNab8iQkwmTOyy91+qug35iehbGvSzyS
	UYO5SaZSwsvkL9InhZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6P6-00000007pZB-2TuX;
	Thu, 04 Dec 2025 10:17:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6P3-00000007pYv-2ceo
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 10:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A126601B0;
	Thu,  4 Dec 2025 10:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E64C4CEFB;
	Thu,  4 Dec 2025 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764843456;
	bh=v52SFDURowFRdMULRhG8kjrdaOCOeP9fHkUhxwRA804=;
	h=From:To:Cc:Subject:Date:From;
	b=IHZfTd85ChaInOyNphBu+x+Ie9l0i63IWSsB8NINZT8i901DNyfDn1fPw7Ykfn+VA
	 sHai/AQaHrGAlMpTzFhmG0B3n8e1kmbXWPx1LdQp/d0JnL8hspJ6KhwcWCr/eX6O9K
	 bOCNJuuOWdGo5TgQJO2FduEBR18CgIDmgbFm0t9VQqhTfUfRFe2kJkqSfAfXkdhqgW
	 YVapBWjRPJviIQPdZ9xykW/r99F6hC4OBX5jtyiHnv1sWhvxxYqdJaBI2KSAD5CT23
	 52N1rP+MCLFoD48keb0UB31Cy8Bv3vWqpOb/k2eJV9JTKk2ZTg5TTzkEZMLAf8r8KF
	 WWdMkF2GYysrg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sumit Garg <sumit.garg@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Etienne Carriere <etienne.carriere@foss.st.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
Date: Thu,  4 Dec 2025 11:17:23 +0100
Message-Id: <20251204101730.1036671-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

From: Arnd Bergmann <arnd@arndb.de>

The tee_ioctl_object_invoke_arg structure has padding on some
architectures but not on x86-32 and a few others:

include/linux/tee.h:474:32: error: padding struct to align 'params' [-Werror=padded]

I expect that all current users of this are on architectures that do
have implicit padding here (arm64, arm, x86, riscv), so make the padding
explicit in order to avoid surprises if this later gets used elsewhere.

Fixes: d5b8b0fa1775 ("tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
The new interface showed up in 6.18, but I only came across this after
that was released. Changing it now is technically an ABI change on
architectures with unusual padding rules, so please consider carefully
whether we want to do it this way or not.

Working around the ABI differences without an ABI change is possible,
but adds a lot of complexity for compat handling.
---
 include/uapi/linux/tee.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index cab5cadca8ef..5203977ed35d 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -470,6 +470,7 @@ struct tee_ioctl_object_invoke_arg {
 	__u32 op;
 	__u32 ret;
 	__u32 num_params;
+	__u32 :32;
 	/* num_params tells the actual number of element in params */
 	struct tee_ioctl_param params[];
 };
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
