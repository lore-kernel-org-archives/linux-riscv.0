Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FB1CAC582
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCs7ZGTli3JG/WJKsxxLuFNkdl3h0qIYBaM4qQdlEyg=; b=WfJXAS4i+tC8+H
	DiOKhwkn7AjyNM6E43kg4oolTUcWje08MX3PU7KFhRAaM3DRP1BH+n15Zw2GxUUqr2aeMcOOC47hf
	QvjljZTgga3J0mRK+JKWAlRfBYWoVTDkBvc9vZCBuj8xPbHXSgzSK9JxIz4yatYUeGlyVYPUuhHcb
	4xcs951dpr+dPvhemJosKmnAjnll8NRq9dK/2wAdtitwOJInuB9UkS6ZBrC6JKhh711pNmOr5QrhA
	hq1Du1QnzVyf2F0aJ32VAACpNPdu0bLFLHMYlOl0B4p76P4IeFniYUIElELOYW9UUL10LViP9NQJ+
	65Ddzlt2pyOQRK7Tcwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEuL-0000000CaJc-2IsT;
	Sat, 13 Sep 2025 01:18:29 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEuI-0000000CaGl-2k7d
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:18:28 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso3684532a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726305; x=1758331105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azZv/jvf6IRhG0wveCq5ECQcNHAHnPNLNif/IfsLlkA=;
        b=gcObzO/2l9gGH4skKnp9LQq1Cg5r+dokWql+YyAnbaLuvk0Q17RHWWQQop3epXt/3x
         tN6bmM+OfjCUHToJw+etICoUKc9tf9SpRzVZm7o/ADa7IWo8+4IKGBj0rI3m/OTHAIgS
         EGjYqQg4Fchee9SSbPPdN5YOdpx5LWBrvAAfUQQFMl90Qhaz1nKkD/UT3/eTmf58zhoS
         SY+APpTHJ1s9IJMscEnJwPriQy+5nhFIVQA92DgN4xJgSCKJBjZYqbQTP/I9Q8Dnue7C
         FbJCJ4JUVhh7EZk0MoYoe1P+azZVZR8eR7jqwkTMJ+yCXwP6I9UJiMeOpdxVyMbXBmqK
         Hmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726305; x=1758331105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azZv/jvf6IRhG0wveCq5ECQcNHAHnPNLNif/IfsLlkA=;
        b=masyRQ1zvNCZjQhzgHJ7J8yngvpYG2rSGG/TZCzzCkV/m4eTF66iZETqNICDClBVIC
         cDFGtbtwEMHkW9ptFuMiMUVXUX6m7YlcA9QHgPjEPqXWXsuPpKsfO7wB2aZgKv23i7Pe
         rcpeoTb2Nu9SRgrnWUQ+UM0XToUUkRYWOX7cZJkxRKX2pVeHHFTpADrpNyj/Z9OIf9uk
         sGtNf1PPYwMz0bu+R3GvLuzCU88u88HatJCocVu7Du6dbzwh6wsI9wogaZc2JSBu2Z2+
         cGzgUN2rrN99gpr9bbOb6QOrlyiSVYSH/PUPgGNkjLFdPq0I+vPlCXEGNtfZbdCTohwL
         daVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNmMHLn4bEiqcll8Qo5ws+pYuG3Al9Lbh43AopqKowW5/xdzafY7SZcpiUlSrvpbRYSv0RRoFAARHvKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoV0HHviUwkdlkh2c50DfsLvq3GimdXMc6MfM1lmMeCEhoB9Hq
	x94ixnfBcPKoXryLYnn8k/f8sTavMup5Fl6TRMCvHyRmRlk8BGacQuaW
X-Gm-Gg: ASbGncsiPnMjxgrT1xHAA+HyDuGLwENISxFi1EvVUCA1jwKYV+5clHaJymfsRAkfc7D
	XK+p9Y3GlWQAU8bYYKITyedTCtHiJuYNz1FX4zSFL4V6KVjImMCbFWgu1H4ScJUjNPcMeZ2QcsH
	50MAXBZVV59onRC+pegxuh5TMeP/vWy0CKt5KGfouv6s4EiZx+OdNhApsG5xHi6Sn47ORE4f1s7
	9ZfHdAhSD1aho2YChqLTnn8pdxywz5qNalJlsZ8vV1ifLlHWKDbTYs74ubP/BD7UIqxfZRCZHqq
	BVz1HLzoyO6cBDgZhiyE1ELN7Nn/qNcvkvtOWpKm+D3LpvNtI6UhRsOv+0W/+NEsJZZ7e5iNBR1
	cwKupCkKowUnOE1fz7qs=
X-Google-Smtp-Source: AGHT+IExQyu+Z7m4GD3MP2gVTN78xlktku98kUsQddou1aWuxY/hOtzAat6yYKAto7vnFggGkvcCIA==
X-Received: by 2002:a17:907:3f18:b0:b04:45e1:5929 with SMTP id a640c23a62f3a-b07c35cd746mr507554266b.28.1757726304508;
        Fri, 12 Sep 2025 18:18:24 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd309sm475244766b.53.2025.09.12.18.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:18:24 -0700 (PDT)
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
Subject: [PATCH RESEND 35/62] init: make mount_root_generic static
Date: Sat, 13 Sep 2025 00:38:14 +0000
Message-ID: <20250913003842.41944-36-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_181826_701277_A792BF33 
X-CRM114-Status: GOOD (  12.19  )
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

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts.c | 2 +-
 init/do_mounts.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 60ba8a633d32..c722351c991f 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -174,7 +174,7 @@ static int __init do_mount_root(const char *name, const char *fs,
 	return ret;
 }
 
-void __init mount_root_generic(char *name, char *pretty_name, int flags)
+static void __init mount_root_generic(char *name, char *pretty_name, int flags)
 {
 	struct page *page = alloc_page(GFP_KERNEL);
 	char *fs_names = page_address(page);
diff --git a/init/do_mounts.h b/init/do_mounts.h
index f3df9d697304..f291c30f7407 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,7 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-void  mount_root_generic(char *name, char *pretty_name, int flags);
 void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
