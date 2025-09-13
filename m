Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FC2CAC582
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOuWpwcTWlLuiSAG3l726bQa9dTL4RGb7e5NKsv72+k=; b=DZyHthgJAKuOYJ
	S1Fn9ls4ibb6zsirjfg5TfaOhzbDpdx7XxP+rLlt3OBjXnFlGHtGb/C7Rd1otEFEGtKRGTWb4yr3E
	cTi/TsiW/+kqZX5h1uSdPPHUYywXudE4K/KAYDaL0HNKjTX/bxKwZsdms5uf8t11W9j01yugCLBsx
	FfZzEzb5MerbVGxUNL73Jl/MIUQoI8o2Ho5awrNS3oWbmcHqhLVBmuux3ulDMExX+CgyzBuxoh7OP
	a5rkCqYIe0fqp1QWxlK/GTRss2XqeLO5LwZXX4in0hob4w/omneDzkto4glujlhjbl3Vd5N1M9Sy3
	HqoCW67pTbVrCL5OoGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEow-0000000CYFK-1NXG;
	Sat, 13 Sep 2025 01:12:54 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEot-0000000CYCn-2s4s
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:12:52 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b07d01fd4fbso150673566b.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725970; x=1758330770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPS175BLdkdbkMvPyh09bMwfY79gXnuJYPms+9/x8xc=;
        b=Ke54ZzuMSSqzQtuK7Vd1KR0VHEx8UzZmbgxy1/QpZXpda3WQZDKIfRMN+ztVICrZmv
         ROIlr7eOhj4KbEO582GmKNZy3jFv/TLR7qBc3ncF5Yiy+knlEh765dUQ2nYrpLuwoWRb
         6UrIM+oLfyfBt06u5JZC0tWka1sgaNfBrjxRHXoBISDP4UNEoxnL7iJzP5T8qEW+NEf9
         WSeob8xwuf9zA/FnA/J06A6+sS7nSpb5ky4cvjyp2yxQlWniJglDxqPVmJZbhZB/lXzh
         9ud6+vv7KpY6YDpUTf7yKI0LZsEYlJTkCYmfgxwd9d0DMuJ+OXgUpAt2ZsGeYFEvWAq/
         8/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725970; x=1758330770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPS175BLdkdbkMvPyh09bMwfY79gXnuJYPms+9/x8xc=;
        b=wKtVwb5xhIFsxp21drCg6uZIFEb1cG0sN1BUP/koRvtnhSYgDFBkBiNdIAHfMRqCr6
         QLo4zXZBFGeMl+0fqZq11Zru0acR1qoxMFb5YrmnQKAIxwafeYeHBZKf+kN1N5GN8nBz
         rM+yV2sCoNLPBEazK9a30D9GAu3i0xc+hcjvxtKMn+pBbzssFi6iBKa51mhv7Ygp2IzS
         cp/u6umZ2icMEYNqNDU2NXR65p4BFKnXdkAVLzAvSmjvVpSWXKW98Z1ygqsqJlnXJ5XC
         QyngZeMJ1l3HKPObyb5VZ9XFueefaazFdjyuNAp2GBLUBggQMJ7Vm+CExXAJ9RM8Lr2F
         zdUw==
X-Forwarded-Encrypted: i=1; AJvYcCURPhk0vxUTR9QhQ5h2LbDPLDGn1C1AsKtFLsG2glYGupyUTs09hj3rNs9ncmYchmCauJfDRW+AOS1yZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvC4ZNhLyhsBszYvVd39biNzVVHhpE7U5xSQXMiEo5xeMr1tMz
	JgnPziT4LnAWFzvR4ohb14TVEursuYJBhe2/uJzyf/+jq4GVte7a3hYU
X-Gm-Gg: ASbGncutYHnYZhw8yZpfOYdppbEPuaGDIgPaXDcyUL0Q0+Y8LbaeMjzOJ7zq1tlaz32
	4+p25MS7dmEXHcOHThz3LkfrJwqCfA/X1UlHTkxui6YM2yybYGWxOcLMucY5NpVIuqFYmgDNY/h
	FvLMWokw0JUmW0mBerRZSiHNrcKwg1h0zgm4c0xubHezq+iQin9iGzGFNfy7GrZlwwgn/K/wfOF
	uhgphg9wxSj+LquKvdQVjErzF7qMjskeYSzcTP5lz6/OEQRiGNQd+WzP9Ew+kqyNvAkIdRKRqhi
	P5PDpPaA35c1K0Nsq3V61NqdMqzqhO1hmMxqSxxhhdXYJ4VqnCQzpKY9pneSiRiyBLb+GYBRil4
	tmSV6vhKDZmTDpRv0qtXzGUgi35Uym0N4FzqWwosy
X-Google-Smtp-Source: AGHT+IExCbHobezsJZBylPatDCb3rXiTmvHjuHynF55nxxCc14bpP2oPLB71sx+Li40Hkl4GjqRelQ==
X-Received: by 2002:a17:907:97d2:b0:b04:31c6:a434 with SMTP id a640c23a62f3a-b07c324cf12mr467235966b.0.1757725969783;
        Fri, 12 Sep 2025 18:12:49 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b30da327sm479612566b.11.2025.09.12.18.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:12:49 -0700 (PDT)
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
Subject: [PATCH RESEND 30/62] doc: remove documentation for block device 4 0
Date: Sat, 13 Sep 2025 00:38:09 +0000
Message-ID: <20250913003842.41944-31-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_181251_734586_7CBD3C0E 
X-CRM114-Status: GOOD (  11.57  )
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

It doesn't work. I tested this both in system booted
using initramfs and in system booted from real root
device directly

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/devices.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 27835389ca49..6ce0940233a8 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -138,12 +138,6 @@
 		number for BSD PTY devices.  As of Linux 2.1.115, this
 		is no longer supported.	 Use major numbers 2 and 3.
 
-   4 block	Aliases for dynamically allocated major devices to be used
-		when its not possible to create the real device nodes
-		because the root filesystem is mounted read-only.
-
-		   0 = /dev/root
-
    5 char	Alternate TTY devices
 		  0 = /dev/tty		Current TTY device
 		  1 = /dev/console	System console
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
