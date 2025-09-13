Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870A2CA101F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCMAe2NWMMFkv56YTkmcbs9hz75UdjuUjZ57DWHnH7c=; b=KuqErrF2dPWCQU
	jSPXn7Hr8frHIOeuMg/bx6MJjBFQr0VVWY3XcqM3N4Pu4apr9aCXczrsLGEr0LslXaVajLARzdWP7
	YTwIC9+HmmlVy73CpCR/8B8P1FSqU0I67eexNk/Ay74nK9S2FdqY63lY9AI7PeMjYNdZwgbce6f8y
	73ZLUpYMsHYDYyqCPnjPLaWw9jXz/02MXKKDX3rhmDl2/AYKZa4F7n0OrT2EzibCWSxMXz2SmfkWs
	3fPZH7tfGWslVsl8+qx4oP5Ymti4vq0Cad5zdvA4cW9O/7oxBnSwslc4fmfHVoGRZz6HuyiceXplb
	xr3cVhHdEGXWidwp9Uow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxElk-0000000CWxY-0oNY;
	Sat, 13 Sep 2025 01:09:36 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxElh-0000000CWwX-2mXe
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:09:34 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b02c719a117so429932266b.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725772; x=1758330572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
        b=KWxbBCe5mNyWB/52yitcrypithj7cDi8pq6avlkBl9bbn1SuSEskWOip4kDttgI1iT
         0j3e/3svG//PCbK8WtA+H+PxVwjS4svaqFKIfYZ6ySDDar0mHjfRUcQ/hIYw0KM2pIyu
         ZClgqvR4RxFjDGAv8Xw5yfPDdLtWFAtPyWJFv2uaAo8JVW2VD+DMncqSgc+Lxt3ieHDe
         bcWYP6wekwed1AKNyk8n8M3donxZm9FGWdUo0AIfzPIdKR/fBYUp/tlTfXKoUeDAyhB6
         BHsgvebmZLLeugnhoQRTxXu5yjeZahk4omCM4npouXVTxkobYFTO9gUVqIaRuI8qVwZI
         P7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725772; x=1758330572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
        b=Zkf5/7Jh4YYdB+A/F3iKtZh8tHYcU4szv7d77nzptUtZXB1drrifcj947GhGs8z5ta
         k5+IDEhhvohZU2fczY93zWQI26zC18vQActRdKApcuAFFS8xXznn+1FHmaX7SML9qGAo
         O+3qlT+fGGUgWi1UQBEmgB1MRNJE4N5OmmgvgSDxbz7zltna5cGZ7VApWH5GDahi3wNa
         Czso/JneuYklK/mG8RCL8xezfmeBnT7eZdBKvMZs59wjmOSnyjM3WY0PNWiTjIHt9TRj
         E9wwgbA192jLgayspZLlcQyDbdk19msvmn5srYvSpbIyEIctA+FoGkx+DKLCtzFktywL
         6owg==
X-Forwarded-Encrypted: i=1; AJvYcCURSIhg0FMBnOqqOSumYcIVvJ6BxhTXQkp5o9L6qwjg/Zlreh47q7q75SWFz7u6BTGWtSu27nhBWNhJtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFO6oEKUv/ARhPI6ghFEJdVqb89lwoDCoS4RUmbFrt1+cc2eI4
	hCUVa3HJh1uDMpWDrYuSh2IFksuF1FiC3GxEr/WnnIbufFcbSft+DamH
X-Gm-Gg: ASbGnctcYZ3AzQkmJ9UmxsOyhqYKUfyYtG8mHH7Zu/alXlNiiJSsvTGaN2cRT/c8xv0
	g/kurxB07qaiJkEz3GVb90A20AoRXUstinDzOLh1QwErWR2x9hj3FcznRa1qRqzUBFbXVfakMn8
	sr/WShmuGqrYnQdpEsL/AXRvg/XkzLM/OnvQb89BdY33WiQAEKPOLcGgJqx7FbIZLQPqlCLbWix
	ltvb9ZM3Y7jy/y/VFcXFEyUBDoABBj1olFvSJDtmYD5L7jzBgFDZj/v4C6fDz7coP8XoKPEPjYi
	KSpXlHKYBz6eRxOvRnhJja65rVzAxKaGaqXyLHGOU2a2sp7Rfnt2+qLLGHIPYfM2VuwKFgqJM2F
	LN0ioeNihduww5SUUpe4=
X-Google-Smtp-Source: AGHT+IHrHcZIQpP/M06nOcq3Snl8FXkxUTmgmKKbhKMXWfrO9iWe4P5Ilwjf7ocqvFrLGTk9+k818w==
X-Received: by 2002:a17:907:3d0c:b0:b04:250d:ee7 with SMTP id a640c23a62f3a-b07c37dca1emr487688066b.31.1757725771595;
        Fri, 12 Sep 2025 18:09:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07da7a8918sm104574066b.56.2025.09.12.18.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:09:31 -0700 (PDT)
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
Subject: [PATCH RESEND 27/62] init: alpha: remove "extern unsigned long initrd_start, initrd_end"
Date: Sat, 13 Sep 2025 00:38:06 +0000
Message-ID: <20250913003842.41944-28-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_180933_720007_D7BF2DA7 
X-CRM114-Status: GOOD (  10.01  )
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

These variables already declared in <linux/initrd.h>, which is
included

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/alpha/kernel/core_irongate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/core_irongate.c b/arch/alpha/kernel/core_irongate.c
index 05dc4c1b9074..3411564144ae 100644
--- a/arch/alpha/kernel/core_irongate.c
+++ b/arch/alpha/kernel/core_irongate.c
@@ -225,8 +225,6 @@ albacore_init_arch(void)
 	alpha_mv.min_mem_address = pci_mem;
 	if (memtop > pci_mem) {
 #ifdef CONFIG_BLK_DEV_INITRD
-		extern unsigned long initrd_start, initrd_end;
-
 		/* Move the initrd out of the way. */
 		if (initrd_end && __pa(initrd_end) > pci_mem) {
 			unsigned long size;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
