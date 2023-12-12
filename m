Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E80C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QTFfOeHPQ8OGUgxTHL4f2UdIzNjxXxzQEKlGzfCa1vM=; b=kCmWjd3xX9XpUt
	du1h/jVLPSyeRaRMV0kaDz7QQ1nA+dAcFB99MqE3tVo4Yabwd2bKkF8Kx3N4gifGkcUcmHCV2zzaK
	iQIgHrr4wJbM9ziGmsS7gc557oRKQwsEWGLk2jqKqj+tclbgFepOLw9IDRyT9loQtI4LqqYwBDy6S
	2QMAQuqFbMniJYQwZ0RzmEI6BXygYwn86D4VmxiTaNoNdtEui3SXMBARE2H8wtGxYST2WUl9zRA/n
	J8iNhRa8rBeZu1KMc6XHsIvde4V/N0rQwqM0aYxHJEa/iz6K3fVE01sUsQa/loVfoKIgutw9qe6b4
	p0xkSsNlw10tZ27/jcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDAPG-00CpUT-2u;
	Tue, 12 Dec 2023 21:35:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDAPE-00CpP1-0E
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 21:35:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c19f5f822so35046765e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 13:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702416899; x=1703021699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=692HNWJOlFtonZp1MhpojM8sdqlm3KHIVwJ0Hg03uAs=;
        b=hBu/0OEldudpcs7zTzqLWl/8AacJykr6bx2etyISO7sm9uq8HGZeTqxRbcJ7mrDTMZ
         kr4Cd9k5Bkj2lZc9t8wWW5JLdckkJQeqOLmeqeL8hHvNT/HP1cw8S0Erk0NR+DX9HF2b
         75jAaSaJ6WEVztQRlc7+37/8VhskM5VxOgDabpnWMv5tEN6zbFNlbeWi4cqvH+sIE7X4
         pM4+4790I3+oGiZ8AhM230xfHULI08vWchImeZMQpyD1IBqbru5PWLxzQ5OWz7toDmsM
         RWI+EnH1PdAPbBjXdK2hR8l2ag5OgJYxTqtBNNqpQDAsZi0lKmI7CxJkI3Z0aN5fVHaY
         oAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702416899; x=1703021699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=692HNWJOlFtonZp1MhpojM8sdqlm3KHIVwJ0Hg03uAs=;
        b=tKPPoQSiE39bz0FM4M6EHe533TQVziq7KDX1jVUGvranhDO7A9JUz9X68hwz1hOqaT
         zBZlYWbrngSiLes9w5PAZ9NQBWpc9HVj9z3bbTwyfrsBjU+M7fGNiXRcTJJSQa3pjx/J
         bdz56TjTuSTxDtllbu/F24VZ/WToS8kmIWpvuKxraU19TkcoRn04xQpBc+VBTmbsRJ/7
         +LiUYMmOj9TjjM4SGo475kvwCnW3h9b/hgX61zclI2AmTViLan2aAq0A+nP7nbk5/8tr
         qthqhDqjvt0MEYa2VNwQszjSf0OODeN2hWnVbNuTAde3IYr5ix5W45CW2SCKggSUoxrh
         oF7Q==
X-Gm-Message-State: AOJu0YxM2VJaXf/k0lhlcsHbU9bPinBw0ZwCiAdKrNY2zwNmuPkTGFqw
	KCzJosUlK73B9piu5x2ZhTe1gw==
X-Google-Smtp-Source: AGHT+IFkzrnkDCYHfteg2uRMUBp/558DJ+5TYEbB94HHSPp6l/nbeDaimGFYdGQPy4EXupq5BMw1bw==
X-Received: by 2002:a05:600c:600b:b0:40b:5e4a:2374 with SMTP id az11-20020a05600c600b00b0040b5e4a2374mr3902004wmb.118.1702416899421;
        Tue, 12 Dec 2023 13:34:59 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id bg38-20020a05600c3ca600b0040b540ff0a5sm17655337wmb.19.2023.12.12.13.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 13:34:58 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 0/2] riscv: Enable percpu page first chunk allocator
Date: Tue, 12 Dec 2023 22:34:55 +0100
Message-Id: <20231212213457.132605-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_133508_109081_C5DD25A4 
X-CRM114-Status: GOOD (  12.75  )
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

While working with pcpu variables, I noticed that riscv did not support
first chunk allocation in the vmalloc area which may be needed as a fallback
in case of a sparse NUMA configuration.

patch 1 starts by introducing a new function flush_cache_vmap_early() which
is needed since a new vmalloc mapping is established and directly accessed:
on riscv, this would likely fail in case of a reordered access or if the
uarch caches invalid entries in TLB.
Note that most architectures do not include asm-generic/cacheflush.h so to
avoid build failures, this patch implements the new function on each of
those architectures. For all architectures except riscv, this new function
is implemented as a no-op to keep the existing behaviour but it likely
needs another implementation.

patch 2 simply enables the page percpu first chunk allocator in riscv.

Changes in v2:
- Rebase on top of 6.7
- Define flush_cache_vmap_early() for all architectures that do
  not include <asm-generic/cacheflush.h> to avoid build failures

Alexandre Ghiti (2):
  mm: Introduce flush_cache_vmap_early()
  riscv: Enable pcpu page first chunk allocator

 arch/arc/include/asm/cacheflush.h      | 1 +
 arch/arm/include/asm/cacheflush.h      | 2 ++
 arch/csky/abiv1/inc/abi/cacheflush.h   | 1 +
 arch/csky/abiv2/inc/abi/cacheflush.h   | 1 +
 arch/m68k/include/asm/cacheflush_mm.h  | 1 +
 arch/mips/include/asm/cacheflush.h     | 2 ++
 arch/nios2/include/asm/cacheflush.h    | 1 +
 arch/parisc/include/asm/cacheflush.h   | 1 +
 arch/riscv/Kconfig                     | 2 ++
 arch/riscv/include/asm/cacheflush.h    | 3 ++-
 arch/riscv/include/asm/tlbflush.h      | 1 +
 arch/riscv/mm/kasan_init.c             | 8 ++++++++
 arch/riscv/mm/tlbflush.c               | 5 +++++
 arch/sh/include/asm/cacheflush.h       | 1 +
 arch/sparc/include/asm/cacheflush_32.h | 1 +
 arch/sparc/include/asm/cacheflush_64.h | 1 +
 arch/xtensa/include/asm/cacheflush.h   | 6 ++++--
 include/asm-generic/cacheflush.h       | 6 ++++++
 mm/percpu.c                            | 8 +-------
 19 files changed, 42 insertions(+), 10 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
