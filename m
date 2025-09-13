Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D841FCAC582
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrLl3jDO7EfKKOkdXsSjvL7xD809Ks9Nh2iYDC7SbWs=; b=k+x5Bcl/ajtNa5
	DVojlBB1Gh6gXKy67yE4EUjI1d1WwmZvl6k2gSkN0H1wynoqZmoE15ZPagpozNCHYVH9LOPk0c2br
	2SUEXpj1j1x28dz4OJLDe5AmLj/ee8yxRbwaQFL8agf5Bu6ETD3bo1fMQvZ2iqBvrLKjgC98nUcsw
	WStxWFdYGG9zvx4eQNQ4zhYgIYNX9uiRXToY4uEqIZhQbFdjlDqziwApBBTtGJ0idaP7rvlIwS0AA
	4q7gsVbmaf7AFiavRaZyvJbNA7VD5/u70tXiZ2N/ZIisuJb5XVD2I0xjk+KjipPKw1ItCkKTtKVv9
	9EekHTSwuK57V81A6Deg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEiZ-0000000CVl7-1yIS;
	Sat, 13 Sep 2025 01:06:19 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEiW-0000000CVjd-3FL6
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:06:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso4278900a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725575; x=1758330375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRKyxFwRI2Qz0k3ZoQpZ3VLrtZiB303jicB3H5rLu1o=;
        b=IN19wii6cBTF0yoMAxVLwt+XGc7ouNu8meKtdOlxMhwTHj7qKk8JNpouKDZN0wMe5L
         wxTuNrxWAf6Up42vD/UWMSMguu3O8DdTiXrr7a32ChZHXyYzcu8Aonm85d4IPG9nKAVY
         AzRIg9sSE+8xVQdtbUzHSfBBLvx3KypoXBB8s07nGzb3IjEbNLsgfnZzQRvDJl4ZTOqZ
         lR00opd8PeoR9Q4Yxq0BXSE4dSfgD8M+iHxJXNY8+pOoixZjWsGL2cCKhu2VNInKtucJ
         uho8KEC2/l87KBy0d5x2SDSnA78hmUZIujD12887eSSe4Nt5qXfrbYZEx2NqeVLtxoZ3
         2yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725575; x=1758330375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRKyxFwRI2Qz0k3ZoQpZ3VLrtZiB303jicB3H5rLu1o=;
        b=rYPKGxtAO/lYRgcSJmFoWt4SQ/m9d7+Gj6bP7HL5vUV78ldbsYR2FehF8oXItO8t5a
         CeaGtckA47xa9WaVwqzRryNETZOXnWQ7rv0TJUtn/UhRye8psqpGMgIpL1T/f8mvxQlK
         o4hVMGuB585QCMMR2g0EAGANwwnK3tjEcB+JjllABuVkvSRkdafywYeJXaUJB2EB7Rqv
         46xa/DVHkNFe2fTxKTWWkAccBF9GsXrG3Jd8+FPE+nb7FP58FdMDfdmTjqePQLhNo9Xk
         828uwBukRw/Q7yl/8/jC+9M8TJDLvKCmJT5eWRdbSkMd4XMZkRk8FXQxy+S+j4iXVAd+
         0JaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCeuoztv5SUYNtthm8vzJkagJ39kQapPgazzBSxn1FRcVeTSH4JNuYL3ifaH0xGtj3rk/JQx1q2L84fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YysfvxCCVuVrAKPwQMP0E+ZmneM9oggzH+7XG1MOI/OxwdeFoVA
	08qoQLN4az03jRzKI1vCq7wZExhOZupc93pdiedKHPXYHM+hHe9N6Jzh
X-Gm-Gg: ASbGncs8LStNy7tDIenZZhUCSenBnpxz0duHq42i+Bf9ykNk4Wc+flx0D0PORd+EpGB
	cwz/LfcelCpRgoJbOJYa0mLjAbiIlQdgp3UTnpq02/4CBl+JwSw+4qmUwLkkPMxAIVXniMKVylV
	XJD3yQVU/g4Ra1rzv1keleYnZaeVoLliiNAo1wKl+YAVi3tOWK0JnN67jBuvNy6zaFagYHxl/nr
	f9Hd4davpb2bF+VdV2gw8IdRixAUt2DbDZJf68xSYjAzPRieOVjNYJ3TWOJto3gtwrsKJF2H9oW
	Yl0+XvmhSucT6Lsq8lXTgEyOxBxZlIPLIMXdsN+oV2CfoiFxmbHokZs/ONT6238d8w4lYsGs1vy
	zXGrjiOXu0dIAcU0F5hZm5m2Rw6yNYw==
X-Google-Smtp-Source: AGHT+IFUls6LXsrCLze7uCxm9gIrKR+0qjIy+VauG9zkpfPwn7RwHzjJtZF9/Fq3L/RMfRZn925KxQ==
X-Received: by 2002:a17:907:c09:b0:b04:35c3:40b3 with SMTP id a640c23a62f3a-b07c384b024mr492655366b.15.1757725574734;
        Fri, 12 Sep 2025 18:06:14 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07d9e18c24sm112553466b.61.2025.09.12.18.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:06:14 -0700 (PDT)
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
Subject: [PATCH RESEND 24/62] init: remove wrong comment
Date: Sat, 13 Sep 2025 00:38:03 +0000
Message-ID: <20250913003842.41944-25-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_180616_817629_A4649CA6 
X-CRM114-Status: GOOD (  10.74  )
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

This comment is wrong. free_initrd_mem may be called
with crashk_end and initrd_end as arguments

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 include/linux/initrd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index e49c7166dbb3..4080ba82d4c9 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -6,7 +6,6 @@
 /* 1 if it is not an error if initrd_start < memory_start */
 extern int initrd_below_start_ok;
 
-/* free_initrd_mem always gets called with the next two as arguments.. */
 extern unsigned long initrd_start, initrd_end;
 extern void free_initrd_mem(unsigned long, unsigned long);
 
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
