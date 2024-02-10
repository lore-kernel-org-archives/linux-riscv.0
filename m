Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020E9C4829F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Feb 2024 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNUrsBV8koLgJTgtAEQjk4kSGYLx4/FGnes9RtwOvVM=; b=obitSfo0LGxy/R
	uhpLXxcXMIr9KZYxN1R3aUkF/WWX1Ikw5LusAsTqJ3UI32ZwY2RjXYL+ATQAgBrOqU5mNXo3y2R4J
	Sw+O1MIaYMRVb37MOLhdgBMEHYa0/o8rZXHGfuO27Ki9aTmBTSUSNhRTwQrsYD9ZfP09KZLxjjg2p
	52sulAGd2Jrmq7l7S+ioX0+Cy/658b+Tu2xCnMqyNkw+myf86mTAyLnFi7mMfRcFQVy1d3RYMESok
	zK8HeZ3LONumKvfrcXgkYVpaHijhOSw+9HnWR7q0uCz8hiIXpPqwoLVZc1Xl06zZqc8IEQtVR8Azj
	bysIyoAvTtGPnI6WZhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYi59-00000001O6z-1xRY;
	Sat, 10 Feb 2024 07:47:27 +0000
Received: from mail.envs.net ([5.199.136.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYi56-00000001O4R-0zDF;
	Sat, 10 Feb 2024 07:47:25 +0000
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id DE4E138A067D;
	Sat, 10 Feb 2024 07:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1707551242; bh=3RXoGcCjW+CB+wVoqLryQrySRvbelditpYUk0T7yTSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KDptHeRjyPkaRYgDgQJ76TMbGq2rsbc0AgiZQdCY1JOAdzUUBP4+RjmkgxBwk+Z4T
	 j1LGFsSoHsi7dXIAgAUbI/PPv5xfuDLWxP4xy8zkDFsW90QSwB5pLXrOkhMRao+XlL
	 KAGg3sF0YhX3cFUj7jBo9lVPvYfUmcRpz6Dlk3dlkBOPJkdR3HhxzbFttuK6GrofQY
	 ObwJoxqqdzPs/TeRoNi+Jn9jBlea4UDeZraoiBsmmwSyGY6ev426Owf0SUmoV+i3RR
	 OaHBBhn4elcui9shUMYi0MKJm8/fdLhF53D6fhPStFXiuMRn+EylTstmABQgAIluS2
	 k+BkRN8SrN9KqQntdQIwXQxV3M4XoETzxQqWgTPpLG+5rridntyZXpp9JG4db2uRBf
	 53smMVcv8z4u3nsFvR1BYtrtMOFXQdDNIkr8vIHR2Y4Fb9WClbM357GuFTdzDohLL3
	 ufzACtqqpgzpeAUIpB+hpnQys9UGaf19H5UEWoZBtp06T3Gxxhaq3RMkgzB2quBqMc
	 qLRu15nv/pXCuJxUSCsVfTbMkWHMyB4bG4gVLFKO2bEIjVS1ikgXoHx6r8+N90JWh3
	 W6U+HRvy34HObUcQk+4BHgKYhAFIqbkHlDApBHipsmz5NzMx1YZiZUH05xtydi02qS
	 1mp9NGb4qW3iB47WQjcJKO8A=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qlRMxgQ5V7Qg; Sat, 10 Feb 2024 07:47:13 +0000 (UTC)
Received: from xtexx.eu.org (unknown [223.73.102.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 10 Feb 2024 07:47:12 +0000 (UTC)
From: Zhang Bingwu <xtex@envs.net>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Zhang Bingwu <xtexchooser@duck.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 2/2] kbuild: Create INSTALL_PATH directory if it does not exist
Date: Sat, 10 Feb 2024 15:46:01 +0800
Message-ID: <20240210074601.5363-3-xtex@envs.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240210074601.5363-1-xtex@envs.net>
References: <20240210074601.5363-1-xtex@envs.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_234724_449920_03365518 
X-CRM114-Status: GOOD (  10.17  )
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

From: Zhang Bingwu <xtexchooser@duck.com>

If INSTALL_PATH is not a valid directory, create it, like what
modules_install and dtbs_install will do in the same situation.

Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>
---
 scripts/install.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/install.sh b/scripts/install.sh
index 9bb0fb44f04a..02b845e7ab33 100755
--- a/scripts/install.sh
+++ b/scripts/install.sh
@@ -20,6 +20,10 @@ do
 	fi
 done
 
+if [ "${INSTALL_PATH}" != "" ] && ! [ -e "${INSTALL_PATH}" ]; then
+	mkdir -p "${INSTALL_PATH}"
+fi
+
 # User/arch may have a custom install script
 for file in "${HOME}/bin/${INSTALLKERNEL}"		\
 	    "/sbin/${INSTALLKERNEL}"			\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
