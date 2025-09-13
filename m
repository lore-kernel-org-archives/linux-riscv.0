Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F043DCA101F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 00:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7RYljoWUs+f3NsqHbNCppVGrIe4rWPm8JZ3NBuncfA=; b=48wIqGaLLf3fjC
	H2LtdcTCdBbdhzqUvrZeW8P8t/LMyhaENt9YfWkzYHuIFIMqPLsuxo3Ij5JlyDyK1EzgjNnjFk6lj
	6ZRMgFoMZ3wH1YMUMyWoZ14jJk0kfgy+oT0sRmCDBjBU2noPwLfF1JBvLLHDc+UVKj7E+mqG993uc
	NMUNkSEtaEr5ukBWqUBHOLeaCHse7PdihM7OsNKwFeBTeCP2T3HUUt72LHxJIl9SBLcd4o9Yi0KTP
	xGKklkH/W1EVLNCeggDoER0oln//1QwfxD8orBv3BhIn+i7is+hyhyqOXP4WH1jr+EvKdIXRPfflY
	A+Et7EuQMyj+aewyXuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxESh-0000000CPni-2y2e;
	Sat, 13 Sep 2025 00:49:55 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxESf-0000000CPlg-2MxA
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 00:49:55 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-620724883e6so4839171a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 17:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724592; x=1758329392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
        b=KsmZ2+qAVnpckB1Xu7m4VDjB29wboUPnG8ECEsFHT+20Dg/TpfiFVXRhP9rW2WGMjM
         TJ+n/cpUYxlAFYychQdqSGdVnoPcV39cPCCAzENtHGx2tPCB+dhvUP/+ZcxL2ZCtORc+
         UvYjzCC8BlcEs6D/vHV3GKQCf3ia9Rn8Lx+lzgClRWOMp/kXwMv84fMul7wzBWMUMK/c
         ixEYUHQMMDqJtV5MjWCcUHyzP+5ZQUsVsTqMZpymuX1O67d8a9A6C/SnhvdRnRNWQ8R5
         SanIZg1jdoMF2rbLP7Z8W5Z0f9u6M8B0n8e4zOFvg2oRrpQgl7SodhY+DWwkB4QGp3PY
         2Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724592; x=1758329392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
        b=GW12vjzxG5nA89+5ZMz5w9X2YY2Dt9g4Sz80G4Fxc3IPRUACD35c5iFV9W1VBI7rnj
         K5oH4MMykOQUXJ7GR/hVRuG9F4qzX1XJOxiao9nFDsC1AeLku5N+bSjQeWzlSuJ3ePUK
         jHiGD80nAuwJo4jaBYIcCmR41PujkAvJJhwvxHlnm/ld8ne2Mnu0jZe75uDS5DT7vBNP
         kigZTyBlAJZa2AWvF9FuVq0v6o7WxLbXZL129Iy7NwZnYn5rM2YjY00AeRY9hmCFGr5s
         96tqHtF90fLcLsn6Zk3EESFAeOogpzwF+mnu9J0gjLvQp21Q5TT6x5wGaBoYp9JfRZiF
         MycQ==
X-Forwarded-Encrypted: i=1; AJvYcCW945nEzsk7j25N5kNeyf7z7zyGJDfCFFb8SF9iJHug40jIvITotLKO9HZHBQ36bljKSKCn7qgGGDFk0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWzHtskE2ZEz0yEXwt4iHkA+HfK0qafFPQFMhaT8/JIzrmt5/Z
	oqFcf6/9ZUvFJ+2qYFivSZK98uiPysEa5/wrVz75I+NngdfrbcExXgaC
X-Gm-Gg: ASbGncsBxW4APsLdAaJt7+l1cPZDTq1f/lJBZS43s0UqWWJfEkRi/p2CdRS9TWbt0HK
	7SI4yUagVsv21a0Pi5X01Nm7zJTtv6PZLpUdKeZa7Pko+fVgh1YXNFRsw/GA4apUL+cmIui1wMf
	SdRFFnQ9R/qZ8BizbF8COO/bI/kQGmsHzf5DW2sUCkMFemHQltLzC1pwgbGezkOA5wqq9xE2Tfm
	5SzE0N++JDK9/Ksx2i+KqpYQhrLcYyorwO2pkVCmPVu0xCApHnH17+viA0z6X1P4eC1PG+HG3zo
	NqFYIUnuFEOui4eNaNrqBouXoyuixZCgH4uWk+kG/tW3y9HOsihGPAwhjEypihOGAJ0svxZnCTb
	tgabtbpcJiSGOdKDed5gqM2NhUFfHFw==
X-Google-Smtp-Source: AGHT+IFuaD6uE53o0kMUFqkBYFUIpIv4YZNYfnndGaXs7B0K4+B96SRU2dTVgEWhisS3xuLKgCtRtQ==
X-Received: by 2002:a05:6402:4316:b0:62e:df3b:79a6 with SMTP id 4fb4d7f45d1cf-62edf3b81cemr3814693a12.1.1757724591635;
        Fri, 12 Sep 2025 17:49:51 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3b6csm4149162a12.32.2025.09.12.17.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:49:51 -0700 (PDT)
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
Subject: [PATCH RESEND 09/62] arm: init: document rd_start (in param_struct) as obsolete
Date: Sat, 13 Sep 2025 00:37:48 +0000
Message-ID: <20250913003842.41944-10-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_174953_611788_2A6EA7CB 
X-CRM114-Status: GOOD (  11.50  )
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

It is unused now

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/arch/arm/setup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/setup.rst b/Documentation/arch/arm/setup.rst
index be77d4b2aac1..01257f30d489 100644
--- a/Documentation/arch/arm/setup.rst
+++ b/Documentation/arch/arm/setup.rst
@@ -86,7 +86,7 @@ below:
    initial ramdisk.
 
  rd_start
-   Start address in sectors of the ramdisk image on a floppy disk.
+   This is now obsolete, and should not be used.
 
  system_rev
    system revision number.
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
