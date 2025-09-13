Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FE8CAC582
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwZ4k/wGaSRQUk0Hsj73cNUX6fFW9KES8WL2scMqJ6s=; b=ICWAtGFtLclz1u
	eohrDNlpLJRHAJY7MNJI7qwfksuSnanB6enumfKutyGqOpX4KcME0+lVHtwLPMIYX3IArc24SXkEb
	38qYGzqqAVPpf5vZStTBsPhGfz6fejOqXdfmyH5t3UdW5S23vL1fb5otGvsNkXJPuT3kydJlqdim6
	A7BFgvww11sBPEegg01gacNRhYahmSfbPNQ5Nxw5GFTJh++A5U0ZQASxjLT9J5mzy1z32w5U+V1/8
	gr1CM44SLSscFFOViHKZVdbeKATR/Gkyo3FSXp1gr5JFxsuR+u+O/ZitoGAmiebooAuyNe4FRtYh1
	CJrB5vwGHs3au/FzjGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEvN-0000000Caj0-2jft;
	Sat, 13 Sep 2025 01:19:33 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxEvL-0000000CahO-3UdH
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 01:19:33 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b07c38680b3so228178166b.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 18:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726370; x=1758331170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
        b=mW2jz9M+9z18sBgj2to3O4u3XW3UrXp83n39zD0ApRFnBTJ5VQuUD0lkZSS8iWBqiF
         5jpBL9f7z5+BFpm2YWRw+NH94Lu9BYRxP51+a59ue5xd8Cfqwo8vZCtEVzluuNHnPJig
         O2gS95RKJA/YU4jvAhUGp1ILmYSoyyYLE3oEjN/ia76m7WYx0+Tq0TNPznIyyU1/JHxy
         J9/XgGo+CIKSFtTe2BqWQoDQbRI81BAXWm95vw+ksRdu5LwvvGxd9MXhvzaRaU/JqePg
         u0uIQHjVV6ypCXgspJoUAkj/GYgBbYETNoWj+xRLu2FQfv7IaAjru6ie6Ln1XnnaMoLH
         Am6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726370; x=1758331170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
        b=Jik7NpOlOXroCDzSL02lJUs4fdnUcgROcn/lxpdpMkETkZTL9CDSmMHdgTGSl8kuUk
         tlvVLfTyiEg8xKNVJnwxFSkuhSxKRWK2iZBvT8Q61F9h2CjasAY2vXYaRrJWVIb212XX
         eJL/Ba4xh+4iZduOnArTJzX7BsB3S+JTPIm2A8WJXd4Jm70F3yaQzjGm/Acvax3aUyCt
         ZbjvwvRc4N4dQz/XNMEp22Iac15ylTAcanWKY5ui4b1umJNJMdxOunayUEyIMaAmMb12
         y8epJ5uM5odyD07chf0qQBObTBd6F1uqm0mh6p38JvsNPhyDnu3Do4uUa3sDM+h6bOAC
         QoWw==
X-Forwarded-Encrypted: i=1; AJvYcCVkv3AdpTS2YnEiAGVH3XTKsQLiw/4QLmLm+eDkQs40IaPK2+d/cTC7vfG/36NqvWZOsQSXZJxGbzHhUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI6259XvBPzzCBGSm+VQyrAxNdov3Of0NEsTMVkqEV9SToQ5oK
	d2AQ8NH6SXNZCu5yX4SDC6We3pEZqleO2g6bleim0IVuTOD0oHHRl0yh
X-Gm-Gg: ASbGnct91jeAZMHHVd01zmjkwEDujuXozlMNU0tDeaXoyxanc64TIsUag9ULplv2C8B
	dl2kp+eujVzbra3V7y2JHtVHkvefdqg9OzYk7WsJCBdzgU+gfTuq4OvRmsxDzoxqc6VLrR70iY9
	kBT6rtT+iUgZqERPEmvUn0sCWugNkrFXQGdX99ak1kdb4N8+b6PyL3J0MjBUkWnHfwlZF3x0/UU
	FDZC8YzdbEqgNfPXqOLUP6ylNvSuaJDb0QJxyZiFbzJ6uK7+lkV4d/X/wQcECz9IvCR0jbZqWVj
	ssZZYUY3lyZXFQ2OPXODtTIrp8+Eu2+t7Idc/rNNir+8ctR+iFHFV5Dx+FMz2oS/HQtE4IBIw7j
	8S52wjsaA74ewCYB4HCTCjG3oQPP7rQ==
X-Google-Smtp-Source: AGHT+IEzeVwYKpSq5hVwsza+AqQmwMGGceGxnApLyMFPwDCsoulMW4PoMJQ37ACnH/5BZ1euJLookQ==
X-Received: by 2002:a17:906:2493:b0:b04:9822:1ab4 with SMTP id a640c23a62f3a-b07c35fb2e4mr458597866b.27.1757726369974;
        Fri, 12 Sep 2025 18:19:29 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5bfsm465661666b.63.2025.09.12.18.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:19:29 -0700 (PDT)
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
Subject: [PATCH RESEND 36/62] init: make mount_root static
Date: Sat, 13 Sep 2025 00:38:15 +0000
Message-ID: <20250913003842.41944-37-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_181931_887438_8437A3A4 
X-CRM114-Status: GOOD (  12.08  )
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
index c722351c991f..7ec5ee5a5c19 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -381,7 +381,7 @@ static inline void mount_block_root(char *root_device_name)
 }
 #endif /* CONFIG_BLOCK */
 
-void __init mount_root(char *root_device_name)
+static void __init mount_root(char *root_device_name)
 {
 	switch (ROOT_DEV) {
 	case Root_NFS:
diff --git a/init/do_mounts.h b/init/do_mounts.h
index f291c30f7407..90422fb07c02 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,7 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
 /* Ensure that async file closing finished to prevent spurious errors. */
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
