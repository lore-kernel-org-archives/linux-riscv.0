Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7865CAC582
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 03:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qIE9b3lRg511gIC/kszFjj8MpHIlXu1p1tYBriQGYg=; b=zawxmrnKlPdVwg
	sOEE0Xgn69gyYxEPLVYYmlAepMLbDLFr66GBk7sKIi2g82Zdkxhgs+5jllxw7XYCpv2Wfa+2Flgx9
	ZDbpRIN4gx5LIY/qBqCqb/2JiSI9aajGQOddAvEFbl/cXfy2qrf1Z4PxQ/OrzYDgSKRB2KzqnKB4t
	hcNBmN9Mv1UdE+slq6mnz4+lGRuH5Z8v34vdjZNwZ9eg/RRKNzZlMlsH0TbAscjuj5zpPtS3hWCck
	Q4Q+XLnsepztzrTHhcF4NgwSIqATjkZchyxUSu1EazusRMqokcV1T7hnzF0UeZ+T2PJ3x+1cFNOPh
	cNP/d/rhK1bb2eAHhRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdsL-0000000HP2N-0YGX;
	Sun, 14 Sep 2025 03:58:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdsJ-0000000HP16-3IhK
	for linux-riscv@bombadil.infradead.org;
	Sun, 14 Sep 2025 03:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=; b=QColxjZgeAjIbaOMMVJYQU6uU4
	LGXAD5B8czwyxwNI3UshCsionpECm8E/IOMKQ9XoHmEd3tUbGClix5ZWp31zO5Lez6fi4qZlMbOzb
	GWP6cwRw76mW01jIZpUCtll/DbTFp2mAlzfYpsueqsWuFBs7cdu/mmhkrOu5Morx5+jNCUB8salhN
	d5cFkcMS5Fb8IEr19wzjSDQJbXUfmrszVaKz0rAuUMte0EDsp8SFSBeHUoiCMVLybafVMzYOiUsx4
	GEDThPLPu2x6NyUb1TXgWcMuPQfMWvn8sgzzNW3S5q2QNOLPFoeF7E7nnrDLZ5m4Ez/a+6Lx4uOei
	dohHEJ7A==;
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdqL-00000006iFY-0Avd
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 03:58:02 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-62f1987d44fso903897a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 20:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822157; x=1758426957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=h6EPKt6qnlUc4SqLD/0WQS3xf3n6rglQ7DU1WVre9XnvCtohqMS2/cI++AeYjJnl9p
         Vn/9f6DPM9Ymv8+brq/t2EZhmeowTb8tqvFu/N1bo2dhLH5Fq1hSAJQKuKEVGqn7TAw+
         81KgEUQyTQsS+2ix9BKd2qAA6nWKm/WsbeFT0ME7Ysh8tPrfZC7PyNFAxal8PjN8GP+B
         FcM1LCF+GLWknYQyGsP/VrY/4336c67uvHVlcFOS5f2orfN0kDXxaBnQA70lSrfvn1Mz
         T3i9tvI3Gz0uTu1atZJ7LKE1S/ctHQdMtzDDwE77TkLagDlQvJ1EQYxRLwlMSvljzJdV
         lNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822157; x=1758426957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=Dogc+nEuMvotMAWieo1BbMjQpLKEPbc2PMXhJj7ZsNX1u+826KT9DIzaF/K0+aUdm8
         Oa7NIfV4NyxagCrX+7Y2yn7A6vQ/XLNRgKpAoNqSG1uhWVkcFMWMMJwP5GP119tK30AV
         W5XcMvS08kdoS5SF1I/iZJUDxJFqluoj+N+zZXy6nkXK1fajg73Pv+vOH/9tg5DpFeLK
         V/f/iM/Hr2TnePDNHkljosqmV0FOqZLrQ7aS2MwEEvj+fjbjAdtO2yU2dCVbxuktWPVw
         3TDYJuewIGciXd49NU9unqtfeaxcD9XCvngY5BW2n1cLt1LiAbB19qNVKuIEF5zQjKj4
         l3wg==
X-Forwarded-Encrypted: i=1; AJvYcCV+nEZA/Dy7G+B5ypnjgZw97A/KgUnly6QU5z/85NGxFEDyxHOkbnFZch1PESN602OoPgKKe9UvZcAtSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgtVnVlAGbMEVZCF6wMlYcLm41H2VjGW8fRISh8Y2oB0ja2D5P
	IJwnEtsYBHjN8NRrpDu5NmEUm5wXgEXS2onHqMCZRKWbxLKVXcqHyi/j
X-Gm-Gg: ASbGncsoIbVYtFfYc0fxp9kHrTI9Ore7apvrTM1/iAJJHF2w0vtw/EUDNqqbwTiQnqr
	j6JEgLXt68Wl2ClfUkxa/1CGMwa/fQv5H+5FkQh3lEqD6/SFchaeEXrRasXSiW3AmXUBRsz4olZ
	2TR5fWxAChvtCFbpR3PFV4dX0ffdI1Pe4PpUgo8fa72eVzvsa6w+4RSzb2o7OnBRVuOBB2qdhJR
	2fDGXxxsCtkBVHU60WLPjn6Orhh/5zJ4Ypmqzvovq/Ckksdpmk+8+2pda4L8jad/yfem+npGzMY
	WYATGhy0fcUI6NhJEsKdmZN776fcvL+87eRiHaIUZaoGpR/Io4FZ66ElblbwvcusIEOHjce4QR2
	3QW9QCRskxNaGU3j8fgU9LSi+55CqtA==
X-Google-Smtp-Source: AGHT+IHVlqrM3WGO2PMhAdJqFymXZDFmcHUFnmRqsIL52zZcyiB7/sntw8UcjJnO5qIuj3xo01B0kw==
X-Received: by 2002:a05:6402:278f:b0:62f:26f8:fea0 with SMTP id 4fb4d7f45d1cf-62f26f91103mr1500285a12.33.1757822156480;
        Sat, 13 Sep 2025 20:55:56 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62f2b2a8c38sm677327a12.31.2025.09.13.20.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:55:55 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 47/62] init: fix typo: virtul => virtual
Date: Sun, 14 Sep 2025 06:55:50 +0300
Message-ID: <20250914035550.3706342-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_045601_976326_63CE5E58 
X-CRM114-Status: GOOD (  12.53  )
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

Fix typo

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 8b648b09247a..cf19b7c0c358 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -636,7 +636,7 @@ void __init reserve_initramfs_mem(void)
 	phys_addr_t start;
 	unsigned long size;
 
-	/* Ignore the virtul address computed during device tree parsing */
+	/* Ignore the virtual address computed during device tree parsing */
 	virt_external_initramfs_start = virt_external_initramfs_end = 0;
 
 	if (!phys_external_initramfs_size)
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
