Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D1ACAC582
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 00:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqgpplZ1AIFQHgQR76RB9Mje6rZgEcjdvdN0dAa1FH0=; b=GcRMydLiN7vaTJ
	OinFBoy69kk0vn5zpXDNHxDxV2cdiaqCMiZMHAI1dr1VRfjwWOOJnHgv45jOtHIBj/CSXABeG2HEa
	hO+DCtwj8XaQpsmtB3NYSlDE3/tp3BlM9Z55UpMuk5aG/urRlIdjdZvxswm042L6He3OeywWsR2pB
	hlZkBsYBd80pdd9EyB0bEJVlxO8DbcTyoULQ4upWcrhHaiivkeqpHF1wV10yePSzXpMOWp9D3S2Ke
	3retwbKorA9Wrvn79E7gyRVbXAz7/ZTpjYpN4PWQogmRDMWm8c9MQ+ScB7LEpBhB8qEL9thEcej5s
	XvkZrWIwrH7Cnth1+EZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxERd-0000000CPJM-3Wcl;
	Sat, 13 Sep 2025 00:48:49 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxERb-0000000CPH6-27Mr
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 00:48:48 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b0415e03e25so324087366b.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 17:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724526; x=1758329326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaXPZ8GS+1OiGE0ZCje70+VbQ3y123W+k6t1ILETLlQ=;
        b=DiB1WHpY3hl9urHfYoiGKQes/1+bZXlg0RRUxstjsS2LbN3XKKXMFIhSkyOS10254x
         LJLSX/2KBTV6scucfASjOgnMe81XNuRRgLkUgK0XcktazhYGCabb04SHgecNrpn50MbD
         9F1E0++oAHdNTzK1EIJ7QuCVOOxNLBMos+8AsEkuZyMcd/26s0uHUAp5uPxFaOVQkrcE
         s3jjjEZCDW1083p4vMaWyqH6FwyTqygLDIthfRV2TCO/Uy9KpSPVQ2QwdEBvsRG+Y0s/
         QjUbx8vhStrV5SbkNjbNeUFrxxLiDSvknIH7T8H3tGFUrHuNWnWM8xACK39wv0FdwKDK
         3/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724526; x=1758329326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaXPZ8GS+1OiGE0ZCje70+VbQ3y123W+k6t1ILETLlQ=;
        b=FvVf9jZE+50dEoJP8Z2xcU/kiSWiqpxu8O7jiJjjgB84qd5oN7FK7A83oDJL7OYfr/
         5efzoi9khPXsDDUuDbK427B2zsg1eogvO5iR9MyAWIJqQxkD0wrIt3PyUOGuW81DkmNW
         jvOBUYDigAHUIAQduyr6HoTl/OlwT/4iZWQBELJuVLI83YAJ94xfLanyY17NjmRWVgJY
         WR6Ku63Su5evvq2cbscD8HrrPZ+8iOrV59d0qme7rM0jB8mIe83BrTcc3hK5DH2w2BUK
         eW7EiZkWBP08wHJTL7gbUwn/bdQIcISVE+GdMAK2jmnuEkjwGmUMqYpvsTN5P1KQlZJn
         nRuA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ+Ch8vy1NjcjiS/Cp0/z0g9qlJf9DgFLZ+7Y9ZqOi+jGBFKnltBSRQb5WyXynkyJ+wYlXAdQSOSNgDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj7vVWhT/c5sP6ka3/SGOzKmKvaMNwcjk4hRt9EeJ8JnLam5GL
	vU1Uogen2x6IFuvxuGRmS1KIdGxiQ3dteG0PJSQGjG4OV5ih4zUriDql
X-Gm-Gg: ASbGncucZU3EckNz7sBKMYWKqy17ehfhnjruVxAfSHPijtYjU0deMt58fGbpgudaQJl
	6Cyxn4S3aQaMFdFHsknB2sG8SlzmQzBozK12kRiNUfQeSHfrkcDaaXBgEgZ+e7geyE7YkIoyKMX
	KFpK/O+hQBOTJ83KUSeLwN27NjlVKS7Q3IdtGlZsmFsxVUJCx0d3Migyjd6g1VtU4uf/fDbGhYY
	CEg+1DuuZM+c9UK4gsvuDDYlCwtDP8GcXHiWG0Jm67argHwChbh3Cj6hYNQPCxU5AeV3Z8xhTWO
	gNKISZqf1cr62BigIiAKz5ecGIKnQT/eQokyG+R2nkrdfxtqDRWIA7ING2T514jWTHdkIeYVvnj
	ZEPgxaBooMyQdl9gJZMM=
X-Google-Smtp-Source: AGHT+IG9OWg6vz1Y30fO80tUWulNMPWiUpAt7xVByuYcp52he6rblxs++6dTXTQkGfdvR2czpiOABA==
X-Received: by 2002:a17:907:d88:b0:af9:add3:6bbb with SMTP id a640c23a62f3a-b07c35fb469mr433586666b.29.1757724525627;
        Fri, 12 Sep 2025 17:48:45 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5bfsm461777466b.63.2025.09.12.17.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:48:45 -0700 (PDT)
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
Subject: [PATCH RESEND 08/62] arm: init: remove FLAG_RDLOAD and FLAG_RDPROMPT
Date: Sat, 13 Sep 2025 00:37:47 +0000
Message-ID: <20250913003842.41944-9-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_174847_558833_0B409455 
X-CRM114-Status: GOOD (  11.83  )
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

They are unused since previous commit

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/arch/arm/setup.rst | 4 ++--
 arch/arm/kernel/atags_compat.c   | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/arm/setup.rst b/Documentation/arch/arm/setup.rst
index 8e12ef3fb9a7..be77d4b2aac1 100644
--- a/Documentation/arch/arm/setup.rst
+++ b/Documentation/arch/arm/setup.rst
@@ -35,8 +35,8 @@ below:
     =====   ========================
     bit 0   1 = mount root read only
     bit 1   unused
-    bit 2   0 = load ramdisk
-    bit 3   0 = prompt for ramdisk
+    bit 2   unused
+    bit 3   unused
     =====   ========================
 
  rootdev
diff --git a/arch/arm/kernel/atags_compat.c b/arch/arm/kernel/atags_compat.c
index b9747061fa97..8d04edee3066 100644
--- a/arch/arm/kernel/atags_compat.c
+++ b/arch/arm/kernel/atags_compat.c
@@ -44,8 +44,6 @@ struct param_struct {
 	    unsigned long ramdisk_size;		/*  8 */
 	    unsigned long flags;		/* 12 */
 #define FLAG_READONLY	1
-#define FLAG_RDLOAD	4
-#define FLAG_RDPROMPT	8
 	    unsigned long rootdev;		/* 16 */
 	    unsigned long video_num_cols;	/* 20 */
 	    unsigned long video_num_rows;	/* 24 */
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
