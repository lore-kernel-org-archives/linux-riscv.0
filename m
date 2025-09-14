Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C060CAC58F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 03:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J48O0xik4UXz91gwRbF7GTYw9Mq8m2k5pjB8xWI2Rcw=; b=27o6ckATZu+VV/
	zvuLaRoe0y73cy5SSZhqN/xrUn2Ww+8EJMu0+UQVRfzsb3XLjtFE2bzrBZnSQKRFUFV9QRzvj8BN9
	msGwjlkrKr8tpYCZGTzByqjBr8Eu8p4/NVYN9Kk6+O9qHk9tGj6nV6ufjhYUiLjUGBaO/XBgYXjSj
	HBNMY3NOqEKNy9FrUlmxR1p+CkUWChxTrjWO+zGe/+gMRa8fFkk++23/di5nNHv/5C0yYIhtoYFVs
	AdpsLnC01jUP0/jq3FnURHTg/DTbrKUowUQRRqYq+Z83IteN42bhtVSoC1J4AP4lJrgWUySOPMof6
	nx35bzOCF84NO8xZQAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdqv-0000000HOCq-2k3P;
	Sun, 14 Sep 2025 03:56:37 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdqs-0000000HOB1-46gT
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 03:56:36 +0000
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso1757491a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 20:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822193; x=1758426993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukssGXUYVXOD0e/noqLCBxDtEOgQieVYL/7Zl394zX0=;
        b=UJqP8DKqOnRMWT2d4Q2KZGf0YyveGfFxnWnN7P+EWzLklMfXVk6/J3YwaSeKrHL5iX
         EDG5yXZ898QwC+rnNRBjvyGRqyXm6VpnORwMde2Z7XhLBlYYfURXiOwtVuF2CnPKosDO
         +vj19VcE9KU42VAbBLMNPtqr3GUEmz+dNu+37NesSJC1nqrkY+35+Q1X0MZMYthMehMt
         Grk6fFinB8nbdhEXMVWZC+z9kSmJsh86wG+PGPCvfwY0rdyAjLPE2l27axB2lLEFZyo+
         SjH4eK+1TYg32+ENdaH0sSkiZEYzMctomSSBfrwv6JP0dA6SUZpA5m2hY9H1vkgBDgb+
         LUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822193; x=1758426993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukssGXUYVXOD0e/noqLCBxDtEOgQieVYL/7Zl394zX0=;
        b=ePhxY+MtVBa4rsTwxsi9BfWKDpU08eQO8VqCUGrh7JzQOcyvbKvFlmjWE4yJlB/zyO
         L5AZ1JIX0RfUfafy9W580NlvQ3OK0+aqk19AWn7+HkspFFG63ETjpB1aYEOA4KZ0Q1v4
         jXmqkjrNHEfjgBmr3KvLPqVEjTSa3HJ64Gfggwh5qQlWRZVfk5nqsSlFq4u/7ZvPj7J9
         +clCpEMqJ7CVSpFOV+ArG106LAEQ8gFa32z3krcbAJGNN47OIobinlxKVHs27Bqp90oE
         xZm21yJfotW7a0i0awQYdwzGHTzzPfhe9hLRL55RqkTCcA0hzKbpMewxg8sc+C1KCd2D
         0bUw==
X-Forwarded-Encrypted: i=1; AJvYcCWpoJK7PTbvoXfnNehB9Jj7id2o8+OKLj8nBzTQrglzkOD6aHRGKMOUYLBGUuCNBxYWwgaHhAzJNoVzVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfrVXlrjKO1BMFitZ7CIhuSHIxr+AIoCsX4qn8G8HMUmQnVwU2
	L82vdy3HDAkutyTIFQo3+pxE2sCKSXwEm/sFCpVcg+BEdL0hGFhLhgnf
X-Gm-Gg: ASbGncsAEgWRh0Q2vTQcOgdL+8fI/uv0W48TB7YM6tSHIF24rSgqVYMugQlNfDyCOY2
	7HjUxEQVcxnwVxpcd98A/y8TIM8KVQqJSOW88JADFpKyNd5rGUz+ebTFIOqtbZtF+FiJ041Ic0D
	otP6TLKc9K9g4cK3GMkXFD+mftabot0S4ScGdOv4KJ2dNdpa+m//m0TKogE+cZ+7edQwvkiGYaH
	BJN36qKkh0VqQ5HQSwcEdORm5xfHF5rJ9/+nFNKUxoytc8wHaClLABMHy+RhSvXe9JeDvzBe4vA
	bLt3ObrtucuJo7xteavYcEfYFeJK3ehGUAdDRWVfJ0wYsW9NFwXOoNpF/UyX0hRd47Z7wwRE1XY
	UyrcgQ/UM/T8A3WuSRpc=
X-Google-Smtp-Source: AGHT+IEh42ac6WqH282xp0DieWYXKfg+ycti4urbWWAb1GXqLLNoKNDdAlfHKjc5T4lrTIZzL6YLwA==
X-Received: by 2002:a05:6402:2815:b0:61c:e1d6:6bf6 with SMTP id 4fb4d7f45d1cf-62ed80fd3fdmr8226990a12.7.1757822192729;
        Sat, 13 Sep 2025 20:56:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33ad2d6sm6510443a12.18.2025.09.13.20.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:56:32 -0700 (PDT)
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
Subject: [PATCH RESEND 48/62] init: fix comment
Date: Sun, 14 Sep 2025 06:56:26 +0300
Message-ID: <20250914035626.3718268-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205635_026904_4083BDFA 
X-CRM114-Status: GOOD (  11.31  )
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

Make #endif match #ifdef

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index cf19b7c0c358..30e94ebf4902 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -717,7 +717,7 @@ static inline bool kexec_free_initrd(void)
 {
 	return false;
 }
-#endif /* CONFIG_KEXEC_CORE */
+#endif /* CONFIG_CRASH_RESERVE */
 
 static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 {
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
