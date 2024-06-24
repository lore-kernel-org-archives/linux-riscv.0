Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1C6C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 23:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RpzDsrsB+XoK10Rc2/IHShEjEPcwTmxyXgUNqg+zTCY=; b=Sz7kiBUP3LxJ1bVnTA+9oHxRKJ
	Rx4zmQHHskWAk3px/0jO5iG7sQNsPhUILREqFyE97Lcu283d1obwYISp4FCO0w+D3zClzFMNqHwQ9
	0TKorcGn2CnIuypDVgisP2QvEiPnkBPZ5oe7vWcGs+lzXcXeTyLf0fddxUmniI0f8hS/gie+ZyK/n
	m8qZP3Zbmvf8WeodAVeOOciR+3KeZoKssqcfQZW3IgyVlxfkHNuIu+9QLpuvKH0BqZwXYpqqaSwu6
	O1y8DXuYeLrKFvEinkeu83+jGXfm1vmxTvIpJ4+OM8kv16N70lYOiKbR338MICCn6K5rVukAIVnNp
	SIJtRicQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7R-00000000xsI-2hdn;
	Mon, 24 Jun 2024 23:29:05 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7O-00000000xqa-3VCC
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:29:04 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-6c7e13b6a62so6217240a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271741; x=1719876541; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FvMNQZepmevKVYCWA5Mvt/tIAvZEAV28z8ZXGZ1r5A=;
        b=W6LDBL9grG0BFsFEbKSTt/EoAU1X6agchh2ajF6S31F/QFQPD1rhnv77ekIdJs7cYX
         nlMYHPbpEqYa2OKTCgHb4va1hZ7AKsFC0Sb2I/fXyIqVh+poyiaZzMKI87k3kc7vNWjx
         eS/Vwrxj7vfBQxl1T3T01atetAOq9Ly/HuKJatSEjTIUQrHJTfd5RxghtYV51xfOlr2G
         L4t9ZVJnss0WVQFMAr/fQmSAvlJIX2f1zxpWhJNt9+KA5lCsbOAjWUwAYbKLpkiV+hBm
         1q6x5P7K4uynRFuJhgdxkb1PTtDgsmW3D8yrS0mHVm0YG3CzORlR8qj7Fwj7UEWZy5xt
         2Uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271741; x=1719876541;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FvMNQZepmevKVYCWA5Mvt/tIAvZEAV28z8ZXGZ1r5A=;
        b=iGWAOvZRbJAONI3VvQafkH99B7F7vEBDT9/cvCen2WxWFCRaUwrMmUi9Zedqzr41tR
         Ia2BLEVJotY1s31duyZha4k86CPdGBCrlNkL1DWv9bWUBY6sUV1qQjb3W2Hb37T8eVeE
         YutE8KJXzqYZtYSe4E8BYnAmsltCiMhhjSVDelujE34zRdo+xpBcBUtE6LHkp8c2PVnR
         oQrIY3f687DFnk+LGNevMcTW5f294RrpxL5qEnf8wF3P9PwWHS/N5BX6DA+SlfRLCE1c
         swGUZymNjxEB6rbH1owLTH/cXW1TRP9ZuncRd9ygMoSVz/xotn7MpH1WPQ0c9D65EFN1
         BjIA==
X-Forwarded-Encrypted: i=1; AJvYcCVgbhmGxs5FeS4l06Dbcm8wCYDoQ61jCDgLaG9sol588QP68YezeC8wUdZMu6MEYr8w3fq6XJQE9MxjGkA6S5HFy2uH+859Hv3N6lKNx0Qn
X-Gm-Message-State: AOJu0Yz3JfxZ06HNCXnDbuP6VTG9Cg97uOXa4YI/QRsn15zwCIKmbjsG
	37hDGzFaCeCXq99CzkDO7xfmX8zo5nA10wsQjbubXM2W+gW4CUcBmIx48qidV72Ce5nIsGFfSIi
	2gQ==
X-Google-Smtp-Source: AGHT+IEk+3lC5zdyxifyt4ii+6a16n1y8uZeO7DOAPkbXtiVBPE0qfgp7g0LpuESyv8BZuXBXF4M/RvaOF4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a02:4a7:b0:655:199c:eb1b with SMTP id
 41be03b00d2f7-71b5fe10537mr20071a12.10.1719271741168; Mon, 24 Jun 2024
 16:29:01 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:10 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-2-edliaw@google.com>
Subject: [PATCH v6 01/13] selftests/mm: Define _GNU_SOURCE to an empty string
From: Edward Liaw <edliaw@google.com>
To: linux-kselftest@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, usama.anjum@collabora.com, seanjc@google.com, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_162902_899365_73541864 
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

Use the more common "#define _GNU_SOURCE" instead of defining it to 1.
This will prevent redefinition warnings when -D_GNU_SOURCE= is set.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/mm/thuge-gen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftests/mm/thuge-gen.c
index d50dc71cac32..e4370b79b62f 100644
--- a/tools/testing/selftests/mm/thuge-gen.c
+++ b/tools/testing/selftests/mm/thuge-gen.c
@@ -13,7 +13,7 @@
    sudo ipcs | awk '$1 == "0x00000000" {print $2}' | xargs -n1 sudo ipcrm -m
    (warning this will remove all if someone else uses them) */
 
-#define _GNU_SOURCE 1
+#define _GNU_SOURCE
 #include <sys/mman.h>
 #include <linux/mman.h>
 #include <stdlib.h>
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
