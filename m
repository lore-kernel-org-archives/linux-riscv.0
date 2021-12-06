Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819A6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOjYWCiGhSZ4Y5nivyl8rtJy0r/hshRpSNhPYL51Ve8=; b=VTpwR6wgj3nWwx
	rfKwBGvmuLUMhNXwpAxR+NNuIohGKaOwRdVuNtjjdOAP0K+RO/L/Z4EKpLyhHKim1o+H1vEFkseCD
	z5Ef427aDbkkMUlfsOCwgAbub1Asl0lRUc6CA+JiZAmaF2iuYlTn08vLtmd53rjq3oOoKX96HV9MO
	/ceIp2mTGQKtKmAS3BmXdOO0wUdsmK8HJfDHu4k7cGb+OH4jIUkFlEjpOxo3sBn5gLL3iSamVCY+B
	3Mm8CAG9OyjHQQfSgQXFDDoh5w+Ro3mWYhaiBr81WPcM4aPR7m0ywsjrG0j9OzRX/mmxX6ZrZmmiJ
	rU1zMb5EPiwSX420jzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muKjz-005gFQ-L1; Mon, 06 Dec 2021 20:37:39 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muKjx-005gEc-3u
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 20:37:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y12so47772155eda.12
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBLblKeg8CrULqFWVj7RAzFZmXmOvswPlK8gAVXpGvQ=;
 b=j4VEo5eVw1TtR0YsSabgZhAtbGEv6dWXafQlQs99qr1BPHoPLjjZ1fdWfnPVndnpii
 ebdq0ugWlyjmCQ4o27jqzmg/n5UUixZsG/vb4lH6DsoQoZXkAESKIwBiNjSLnAdeRtuc
 NvemIycmd820mZDlWH6BYGMkNj4KMVa78s+SbEyK/f8TVFuLi5G6WK1G9lTzPk0ZUt4U
 4fpbHdGd7AaqHwgOIa/NsNydocrNsPaVByELqK8k71S7/mVwZK/hzVfe1zyA76WQ2DMQ
 X1Hds3ZACRDogFxy6vi3gNA3YPjFJ+dA7UzfSyGgSumgCPdexmsKJjcZhlEvxkSvCeop
 YBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zBLblKeg8CrULqFWVj7RAzFZmXmOvswPlK8gAVXpGvQ=;
 b=8OjO4Bq4ufXz+4OlsTH/Ca5eFz8/L8Tae6ya7aVmggBzT44cE5AmntX3q4Z7N6xOSg
 fObwNjiNUUsCbwKsXDWWqHmdHtCBTziP7cwy9ZCj6QRIuttRqWJ3dBKgWzcL1fzYGHbf
 GEpqoa/qX235bDtjKSXab/nbUcsTG57UG3fRWqQlvsfwGhnwkoCql/ahz971F8sCxXZz
 kRSo+PH7WCdCoUgGsG/SCElq7L+22xMm3oeL+jsD/ohI4sD1D15zyPK1pjxnA3dGzbbV
 uGyDL6Ytdl+CgvFQjHHvfKGMormdvbHGU1kYzUkJxGiA7VJDoQdEXblyiLAY3VHlunZM
 9gdQ==
X-Gm-Message-State: AOAM533fOsxFs8HeIN7xv1Bxo0NnkldDGrtywVkiWsgYhrDf684wh9TF
 Wrjl9HIugEaAk07RBClWH3k=
X-Google-Smtp-Source: ABdhPJzrgo0Xi3nmEuzmb1ho2OIxbrUIKWnzhLf3x7/W+hp+MPI/n3GrzxQc508pMJcPgQlhyuhEbg==
X-Received: by 2002:a17:906:1396:: with SMTP id
 f22mr48685989ejc.228.1638823054885; 
 Mon, 06 Dec 2021 12:37:34 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id x22sm7091350ejc.97.2021.12.06.12.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 12:37:34 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: Ley Foon Tan <lftan.linux@gmail.com>,
 Matteo Croce <mcroce@linux.microsoft.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v5 3/3] riscv: optimized memset
Date: Mon,  6 Dec 2021 21:37:03 +0100
Message-Id: <20211206203703.67597-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFiDJ5-OJzWWR0hSZDsuAmxzxTE7cRR9Bsetpfh5vvrTxzkKPw@mail.gmail.com>
References: <CAFiDJ5-OJzWWR0hSZDsuAmxzxTE7cRR9Bsetpfh5vvrTxzkKPw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_123737_180001_22D5DBFD 
X-CRM114-Status: GOOD (  11.02  )
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

Hi Ley Foon,

You're right it doesn't boot for me either when building with

  make ARCH=riscv LLVM=1

The following patch fixes it for me though. In hindsigt it's perhaps a
bit surprising it works without -ffreestanding in GCC.

/Emil

---
 arch/riscv/lib/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index e33263cc622a..6dfa919d4cd6 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -4,4 +4,9 @@ lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE) += string.o
 
+# string.o implements standard library functions like memset/memcpy etc.
+# Use -ffreestanding to ensure that the compiler does not try to "optimize"
+# them into calls to themselves.
+CFLAGS_string.o := -ffreestanding
+
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
