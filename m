Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E552DC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 11:27:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D56F60EB2
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 11:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D56F60EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SP3ZZJYyNPyiHsQB0DnjtWZqLH7/b9dE/a0UVlHSfwc=; b=js7mUqUMjuoENf
	pDDzKjYINhCGWxxfpPwBJvr92BHYOdZ1Ml9B/t9tLAwD1b9owYNHIo3ysWSqn8wgTXzH+HowsfF5t
	/eAjvSCm+n86lrbSWe4PUJeJZ/cwYOJ3RcVTPHvYQ5Hq9CTOL34jTdslSPe1iDMzSFNXwZ3jDxj7Y
	YAoQqPJki6eoFKVeut/wAaLSr9nrX3cFIq34tSOgBiBFSBDf0yP9q33tHL56eGerPvyaFw1hMMs0V
	VmFxIjYs/negDM+zk9h0Z5b6Milv06+yTkjVcc39V0Z9vzVSx1xwzqXPB/WnP+PVeG8yPlJkFQnMx
	WoHotmUE2Pk1mNMevunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7ylN-00B03Q-Me; Mon, 26 Jul 2021 11:27:13 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7ylL-00B02s-Oi
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 11:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627298823;
 bh=vZleZWIqfzP05PzxCCp/6U1s9aHGWqbfElJ3uiz9AOU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kSQuDKXX9c1mMwluZ0HYgkJgvE8mKAgh7o52SXqLEF3oZN9906Jx2dqEc85MfSC47
 4t4kXi43twIPD46Ezv66xpHro3XmQ9nMEBR0gdOI18plOg4tUBzI7AHQYIllq9SRqu
 F72u1iSC2R4qb+4CT2lRA5NOrlYmYiVa9KUVm/mQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from workstation.fritz.box ([88.152.144.157]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1M26rD-1m62xD3zHF-002WNl; Mon, 26 Jul 2021 13:27:03 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 2/2] riscv: defconfig: enable NLS_CODEPAGE_437, NLS_ISO8859_1
Date: Mon, 26 Jul 2021 13:26:47 +0200
Message-Id: <20210726112647.78561-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210726112511.78350-1-xypron.glpk@gmx.de>
References: <20210726112511.78350-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:s59V+JRRw4AVH2/7Y1aj9wuxkZntebT8SXNlG9rUnZK+pCRyYRE
 oKfxgb4/9VoiSkAd8vhTyo8nefWwURkAUnd5HXnlc7lzrlWvybAl77Ei7FxHD8FY7lpSvf/
 LyWNAbCpfs0u/42GSVq6DQtaQ9HNFQiqL3psuhI8W695tl2q21ew6gAZYkh6ixMkIiQd7fs
 /8WISPTXb3oXxWtb0CLDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7JdTz5Gze70=:tZqGADFJqJMjMYUF1bRUWm
 Pc7dHL3CECegDXQLkVeF/KktDUTqy3cbHqABJNuXM5mb57J2iNZg8OPfZsq1fH8MRl0QLjUm9
 kOYEjYPKs8pAwWBzPN6J2ypMV9bTxSs+BTVdCAFAIZDUUewigQq00RCial9eoNI6QqljPNttG
 vkogN7RRAnDbwYWsPZhkOY84eIxCpteJfI2cJdfW3XSUM5UnzdX6gs8534EN+iK4QCl3C2/wv
 ShhdbYzxv7UoOsbsj2YbOqAjlONFBpAESUtsj3Dnv1xopR7jiVQRBpULtxEQ/3TUxjCwlnZbr
 2mIUVxNx5D1l9PX/spsQopliaTqJHExXi6LXxvZo3KNMth/IamzRKaJFIR9RjVla9LMODHalC
 3pQ5SDmtb8SUK9g/iFN1BtYcT/+HT/pFfrX7YXlgkBkAa4umSwIgRM5WLrU3raOhf91KNrg4I
 dkdnA9oh71BP2NdaHeNHsQr1iJGPZLqhIJULc7n9NmVMu49BCkN4WcYR+oAQb2BHMdEg7iluK
 gM0162EmG8IOzllaEpLe8/D4YwoZcjqhRUf00yFmdMii2koH5wbdddJEhoXkrOf3wjzE+xohZ
 FaX4Wt/YyMnn4Y8VHrztvqemLrVTEE9d4Omh5p9FnmNwaiYNQYAWMlCSmv6fqKIwWvpBCj8HI
 M/uvsfamGnjz0RrKUyOPJJj93nJ+kA8AxgD9oC7bjBAT7iHgoVO5I9vT6kT5NrGmsbyhGGnib
 uH/R0ZNzO15BORJK4tP9qNqdmdgkDwO7en2L39RmrgR5Y+EXRREZaQAsa/a/9lCtu1dZoUkDe
 r+vnxzUQcRkGS6ChzF5P1wD721T2zypuCWAoLs9ZTMhzLwa50ikFyK0cv1A2tMHvwf1e4Xc+y
 cZyUHnY+3yavUh2iafHNbmA7eXXrksdqlKHxS0amIcTCr1LC0sSx6bdrcylucGwcSH6boUilW
 EvcMw3BZDqLXc9Lty4rME2/cZSqbF2EQSGlLnkcIfGCgvM3OJp7NnC5di5MYnDdzMTvdr2YVJ
 lBBPSpxpqbLkGs+MatuBY0n4fgU2XFlQMX0/QO8yt6N9cgwf8brp/q5Ary9kbfPWpocQ1wEEX
 gtpYf5pSdWSRf6Rq10jo8ab+SKmYMqM5svy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_042712_136926_B2DC904B 
X-CRM114-Status: UNSURE (   8.17  )
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

The EFI system partition uses the FAT file system. Many distributions add
an entry in /etc/fstab for the ESP. We must ensure that mounting does not
fail.

The default code page for FAT is 437 (cf. CONFIG_FAT_DEFAULT_CODEPAGE).
The default IO character set is "iso8859-1" (cf. CONFIG_NLS_ISO8859_1).

So let's enable NLS_CODEPAGE_437 and NLS_ISO8859_1 in defconfig.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 393bf3843e5c..1a3170d5f203 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -110,6 +110,8 @@ CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=m
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
