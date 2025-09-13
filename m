Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CAECA101F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tsug9/osS7Ey63gmRPgkEwCmefg1hq4x0vYztVaRTY=; b=qZzMTs0ZZVHRRT
	KKb2PHNSoTXs/ZRSC/B9iyHD562426H8EonGdHZSdTmoN68VrZryU27u0d52T+NN/qAOGo6307RBh
	PdfLKedZVcS7QgYJR2xqsV+FLE62Sn2EU56c2HJnbBWxuWH1ciCCXw73x3LHlSRD45OkG83uZ1uIs
	uuJorgt9qDom6K2QBwn+w+nA5xwHkNTS5cRHunY1FbupbQs9NUPAaRY2jU1584OXK4+0cQiNarajB
	fiQQh5F2CCu7Kg6fH5o1GrNKD7XgvxVIzHoO31N8ZinLXhOmMIUNg3TIZ04xKPicy1ecrXTIjNa4K
	7Py+fIc5jkLdP+Yzmz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEtH-0000000CZwP-2aWH;
	Sat, 13 Sep 2025 01:17:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEtE-0000000CZtF-1N6E
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:17:21 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b07c28f390eso259448266b.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726239; x=1758331039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOKK4KIFki64V1O84ArLWA6Jx4UbLCdmK3IY8vRFz3o=;
        b=VpdshuIOFQunxAVNnnW22h87XRKaMcskRK2uhbiwDyAVFCgG0YkFE2ocgCOv3tSgJk
         ld0n7w3dvE9ow6lfFv39TDemfrnWbAGe8eJ71x0Sh553Xh8/QY5HdX+dVwmnXSQq9A5v
         NPIWw5wUMdLm+g7gZw9KE6sCHFdxm+HzwOfL1PUno22f/cuFvq5++6GpLue26Xk9qQST
         LWqzeqRqHk+Yx/9bXvRt3Du6OT06VHHQyppmyIKZxQYpbIPjH6z1XfUHjnJYRv3swN15
         nf4rpM/umt7WOnKwoAcqeDx6DVD1AfoswMtpj+i9DMpO1mYnpAeK1yydsMV7ogRV9TEX
         fiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726239; x=1758331039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOKK4KIFki64V1O84ArLWA6Jx4UbLCdmK3IY8vRFz3o=;
        b=IYiyYRH59Y1ByfPQ+uFAciu/PhjMRBRflsG1URpQB5RD77a9etWBDfxcqEerzoIF0i
         vpohoK7NMd7JL2bgItEgVCWgut4fyAakMXwZyV7bXUWGMA8rOApa4cVsRoZCfIxv03m2
         ji0rP758EsqEFC3o9NOC+2PfwLSsdQ9uWhZ2fQpKh5PbziwDMZJKVtpHPC1MtuKg5Omw
         JeDE7G5dhHlmGlBA7/1mRoLVaUqUCNsbtxKHXJ9LJAjFbum+QkXo9LkFuGCCU5TM+iBY
         mUhPL5rSQeBFBX9pWAIj8maa9Yq+j4Owzyppq6YrlY9nlvm3/Fi0J0oXJFnIRjYVwPeg
         CGQw==
X-Forwarded-Encrypted: i=1; AJvYcCUXGpd1agtFAd7KsiKABdqKRMFlXLUgRUWGzjCwE+ktfz5vkbGd3lAcUUpX1xFuESenw+xcdS6ppqtSeA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2YKhYzioYlXMsJDNtlFxpIxdTeQTz+w387Ih2IdLVpRZrVB+W
	mZMxZBtNK8UpASne4gzsytMVUrygL5LzIBALKftqLFLqZPga6GOH6q1s
X-Gm-Gg: ASbGnctjds8O5NaWgUL3wQHPjPNaAeXzgRaewX25BholuyulnRyqXV2GG3dYwZ9QQpM
	8A9Mrlo1+xs09wOLONWU4YDCCpJ6VmOvr1RS8hVw2AjYCwjfQdotwUE/WuAeNymXWp0WGZzdJ+r
	aUOhjvaiwS3UchrAEKLWRmACukD3JRGaYz84QwLJGgwcap6KcxiG1eAOwpkW4FQPWg+6zqN3mRj
	eCULVxgbMkG57bTJXPUFbjDTBNfeijto/xd21hbxH0gf0Q/4m0d32zf273BRVT9QKBPXaVz9RFk
	IbULgL+cPSv48/7CtpVIx5gE+gbhqufPUt9AoVTWpYcfkkOMlPGtDaN40O463oD/HbHtx7iBplV
	gVOP/tob+gcrshfjVmho=
X-Google-Smtp-Source: AGHT+IGWcEC7VhNjJKZzReFkWP7F1gkqH4tvvChKQBMnzdm+44287e9kqOEvM9aYYFOmJE4OYY5/Qw==
X-Received: by 2002:a17:906:4788:b0:b04:b435:fc6b with SMTP id a640c23a62f3a-b07c3a79fefmr497358466b.60.1757726238469;
        Fri, 12 Sep 2025 18:17:18 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33ae181sm4478774a12.22.2025.09.12.18.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:17:17 -0700 (PDT)
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
Subject: [PATCH RESEND 34/62] init: inline create_dev into the only caller
Date: Sat, 13 Sep 2025 00:38:13 +0000
Message-ID: <20250913003842.41944-35-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_181720_384632_3D803808 
X-CRM114-Status: GOOD (  11.76  )
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
 init/do_mounts.c | 5 ++++-
 init/do_mounts.h | 6 ------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 5c407ca54063..60ba8a633d32 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -366,7 +366,10 @@ static int __init mount_nodev_root(char *root_device_name)
 #ifdef CONFIG_BLOCK
 static void __init mount_block_root(char *root_device_name)
 {
-	int err = create_dev("/dev/root", ROOT_DEV);
+	int err;
+
+	init_unlink("/dev/root");
+	err = init_mknod("/dev/root", S_IFBLK | 0600, new_encode_dev(ROOT_DEV));
 
 	if (err < 0)
 		pr_emerg("Failed to create /dev/root: %d\n", err);
diff --git a/init/do_mounts.h b/init/do_mounts.h
index 6c7a535e71ce..f3df9d697304 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -16,12 +16,6 @@ void  mount_root_generic(char *name, char *pretty_name, int flags);
 void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
-static inline __init int create_dev(char *name, dev_t dev)
-{
-	init_unlink(name);
-	return init_mknod(name, S_IFBLK | 0600, new_encode_dev(dev));
-}
-
 /* Ensure that async file closing finished to prevent spurious errors. */
 static inline void init_flush_fput(void)
 {
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
