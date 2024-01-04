Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E72C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+fCSTlWE4PkNgfM/tJQNeERcgnd3UxH+TOOYgW2OuI=; b=3ShGTK0cjjPAg8
	g1aNuSPx0rJ7fdHdOHgqsQSoP96EoGrHR375g9Cz7Unw+Iq67RiWZ+i7xaHoFmsRNDUWmBxASQRA7
	SPTNDm024kddDkzcg5OixdVP35YS/PqOHu9zW0k6YuclSTfHd//EyzrCh8ktgogMBs0E9bFWZmvyv
	pCMjfGdvWL1+FvkUtvJafl+oxM29QbvvOIuOyFUyguice0K72w6GXvO2yCunPqDsW1E0T8iO0gWTM
	5mRmwM/BVnQcGg6gGWAsTl9lk3qBtvQg2NP1kz+1VM6q1z/NIcAiWXeTuJ7jFI2laa6yOpvnLTNYb
	Xjt6NR+5j6WuvZRtXcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTcQ-00F746-0M;
	Thu, 04 Jan 2024 19:43:06 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTcL-00F71V-0a
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 19:43:03 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-35fc1a1b52bso3299175ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 11:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704397378; x=1705002178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwpW8R3xYRcFeijiUFHaM884VPc1V+tX+SXLWnbPyzE=;
        b=vhBJtMQumhHUtxCyS/rHJHhsrYbzkgzYPVwax41GuYQkXjGeOc7zdBeqGHOw80SIBf
         RaG3ByEjHQlvgyEF3hU2qiTIzrf5NIZzUxlB9SZpPX1Jf7MNmfwdtOaQhwaxb12YquAL
         JbP4HXMIq6+iwAaU8/JywwEX8WnoYxkOCKWRtxgilzlRKwS7o2hA6vGI5EzSL4fF3bzY
         mnzXti38gq5c0cA1wH949qGcrzXRf7BIv0Pnfyy1iKrESbxaCf8RSJPYXv0G3Lk+ScPZ
         hApcXovsxwwH9j6wnNMKgTBl55UbyB5zjZ5qca6fktiTvUmJeGlzLxIDc+oJ3KSJx3ew
         mpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704397378; x=1705002178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwpW8R3xYRcFeijiUFHaM884VPc1V+tX+SXLWnbPyzE=;
        b=L0cW+AfJTRLb3X5sWeHWQpGR/x7LK4PHs6mRXWuwIEKu81Vg4+3tpWHT7rafPFiITI
         k9i6EMNXPJLabrZpD8Uz2zUXpQ612BCmMkHtag0RydbHgdySoKTZ7TUOamlAbuMwpRw6
         xgGXnsP1ncmNwALfCE2o2I58xAdQ8lxnAnzD6Lg2DEiRCjbxMtaY/gpOg6vW8IBSK1o+
         gFcztRJIw3tsbw0AucAY5bzxYdPvOSDf+OSlxE9EFWP4MkQb5QNd1YRgzEntfZGovaT0
         NwMZqtmX0Oc0XwGjoyooWQ9iVM3A/UFeRl9e1ld7OAAW+M8oAD3lixmJfco+/m9/yrdm
         htpQ==
X-Gm-Message-State: AOJu0YxAs3SCQuryS1LwySiYLr5xHPXSaJVsQn/1Nv72Vc8dk0U7CNby
	b/GEWvRBqtTIO8dD59h79HTOY+BzRVnDGA==
X-Google-Smtp-Source: AGHT+IHT5RafxhxVkhoC7ZCG7auu1NWdb7RZx+i84274U3eQ2c8mka4bV5n112vi+aMJBdUfbRUZxQ==
X-Received: by 2002:a05:6e02:170f:b0:35f:ca3f:fa67 with SMTP id u15-20020a056e02170f00b0035fca3ffa67mr1224476ill.43.1704397378523;
        Thu, 04 Jan 2024 11:42:58 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o10-20020a92daca000000b0035d0da89a0asm19606ilq.6.2024.01.04.11.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 11:42:58 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 04 Jan 2024 11:42:49 -0800
Subject: [PATCH v3 3/3] riscv: Fix relocation_hashtable size
MIME-Version: 1.0
Message-Id: <20240104-module_loading_fix-v3-3-a71f8de6ce0f@rivosinc.com>
References: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
In-Reply-To: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704397374; l=1020;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=js9HmT4o7o8yl7lcSP3vcOE6sOgYhIQV9xZrhoMilzw=;
 b=oUTjSCnJ23EEXgoFiAFQOCyorLMnwVgQFC3OVXHU3L3GlTodRKu31Mb8jIU/r+O//70Beb63d
 HTFAbKyU+gjDCurro3YjGZ65fM4ysi2YV+LUAPTAIcM8RdGWr0teXfJ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_114301_222523_6CB8E99F 
X-CRM114-Status: GOOD (  10.67  )
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

A second dereference is needed to get the accurate size of the
relocation_hashtable.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: d8792a5734b0 ("riscv: Safely remove entries from relocation list")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202312120044.wTI1Uyaa-lkp@intel.com/
---
 arch/riscv/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 32743180e8ef..ceb0adb38715 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -764,7 +764,7 @@ initialize_relocation_hashtable(unsigned int num_relocations,
 	hashtable_size <<= should_double_size;
 
 	*relocation_hashtable = kmalloc_array(hashtable_size,
-					      sizeof(*relocation_hashtable),
+					      sizeof(**relocation_hashtable),
 					      GFP_KERNEL);
 	if (!*relocation_hashtable)
 		return 0;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
