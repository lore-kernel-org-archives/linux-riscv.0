Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2117C3DA42
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 08:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNUrsBV8koLgJTgtAEQjk4kSGYLx4/FGnes9RtwOvVM=; b=Qs8v+4eHLPcpRu
	sT8fkE+CdfSse60W+yMg/9RpmtG+ELrXRY74cXdvAyDOnoR2ouBrQ0H1EBphAYDJXP/AxZxP5e/AF
	RIhCQTnDixorKvio3pH9XyPL3wt5Wn7TbyGI2ojvoh4JGnJ9n3hNTX9PIqCWCxA86Wn+GDP48RtIG
	KZ9jC1thU34lP0UdrBJwWs5Ouvq0P1g1gFJBeV3Rvki0YTKSGaevWs7QeCu8hW6iOU2kAbE2CtsLP
	TnHuEA6/ROY2BjZxiDK/8iJ+dL75yjoLv1ngC7744T+lxEfQiLI7SlEk5Nde1A0kJOIfhrPQwOXry
	hmtfVaL/DtW7ea/zDeCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSv4f-000000046vb-1eKL;
	Sun, 14 Jul 2024 08:59:17 +0000
Received: from mail.envs.net ([5.199.136.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSv43-000000046hQ-3F5u;
	Sun, 14 Jul 2024 08:58:41 +0000
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 5A89638A39A0;
	Sun, 14 Jul 2024 08:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1720947518; bh=3RXoGcCjW+CB+wVoqLryQrySRvbelditpYUk0T7yTSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yxeb2wDgejzOcVVnBnS/+WSj4hVrhCdfZp86xCr1uxSFHj3oyiRHXJuQZsPOdeFf+
	 QwsdEM4lYdILp7QQ7+gF4JHJFlZzIkglpVaa9Jth2npuU3GtpUq5C/O8U8PqAK52Xg
	 oEzKqdmTsD800zMMcQBsuxIcOHgJK67FM9gXEzAQJM3jOBb6rY8BYA9g5+OkIxMGDX
	 QIv6XcJ6tM0UIt4M1wsqBEgdDPznCePITV6kytVXayXeYGtCChVBzad0OUig9I2LN+
	 jffwEGwCw61rhGknsDSD4FlbN/fOpM27CaiWF5r0f5GsFGjkDUp7biL9Y44N1fMPoy
	 3XBEIBpoWSzO4s6XjJDn11MfzinWfrAohQ2m+mplZK0y+MCyeTdCkYUd2rjLn1Z68k
	 fgp04oFcNAj5XTLrDXxzE222ziQx3tel+Eevr1b2LfjSqZjqzfCutqejV6iG7kQIdv
	 691slFWz8P/RStIunv7yIp2HQOHn89RZubeDi/LphxRFvKTJvJ29yEcfSsgQKH6vsv
	 GPgvcZeAE2MByB8W8r0VKw5DJrKcZjAHQoDBUKKd3JVZrW+vMjLB1+y349YKr3jSkt
	 LdAX4sLLK++K613ZmI/6yp8P+fYm2mLrjNSiIrMcpCKUdQWGevpzh6Iuqpxe87iRws
	 CP0WcrxYs1ADXePPmP/CoQt8=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xu_dqvWydv6f; Sun, 14 Jul 2024 08:58:28 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sun, 14 Jul 2024 08:58:28 +0000 (UTC)
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
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 2/2] kbuild: Create INSTALL_PATH directory if it does not exist
Date: Sun, 14 Jul 2024 16:57:51 +0800
Message-ID: <20240714085751.176357-3-xtex@envs.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240714085751.176357-1-xtex@envs.net>
References: <20240714085751.176357-1-xtex@envs.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_015839_980539_9098286F 
X-CRM114-Status: GOOD (  10.36  )
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
