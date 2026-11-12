Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E36B606A8A5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uNzuv+CL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UtK3EPii
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ClfKNqX1JyROoQtI499HnnUFsnGxNH7KDlxQjheFwU8=; b=uNzuv+CL9l8mvzaI86aY88Hh0H
	CAoLrkD9hoq7lMVJqK61l8UUt3878EkYUxJ8u3ohWeiOWqSbPAQJCWRX9BYDJWyuhIwOT6ee7MZYX
	A47uIKN/fyoKad94IuxpNz4MXeWWmoKXMcWocaVAiEXFTY+T4G+LWwYvO/24BHNbG5n5cpsL+NA+f
	L+OHAbz0YuWwxKxOXhAyPjOqJCRnwnM6aI8Y1Ho+NbAB70OJPDpJAGz8yLyh1/9V7L/YaeIxbWPDP
	LrSrTanRtXfxBs5nCTVdFrm8Y/BHmZRiTB3cZ8fGHG2hoBVcSb1x2uq4Z5mCqIyd9pP6REz5zFzBt
	SxteAMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSJ6-00000009ZuS-2I0L;
	Thu, 12 Nov 2026 10:45:30 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSJ1-00000009Zsh-3JQr
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 10:45:27 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-36dbde64409so8144307eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480323; x=1795085123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=UtK3EPiiAGbw+VKiWtUCpiufeerURyFpwr0wGG3v7EpaCI98EgBIL2arD17FpZYmie
         k7qldF1XLU9MFhkkavp2REzEGJ5SAwEjHT5AJNFvblnXzUDWX39xxIDUUQa1SV7wVpZ7
         wabDqUnYSm9mZRdHjF7Mj0MWDvNrMIBO9X1Cvw2VSEy1QuDzd4k/MI+fZ9+nHQDTm0zg
         a2nTEP8mRFaGg8tOPP3+k+YGj6onr6k47ErH+6zyarWJAsVgNWSYb6Wmg2j7xQ8iyHeF
         jMNAbcFH6a36564jvJGJsR9myYE01pzaaKu8uv7SmttJ5yKmdpxlUyVDoyidT0nIFfmP
         8NcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480323; x=1795085123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=wHeef+xd3NC3siUf+fy+PIVINrlrTBsfN2SOXTF3jRgCNh4Tm+Hik/nDNQaWvGPqoo
         9X7Tj5q43OjbKUlA0h6CYZVjrA4jOpXJ25HTbNK2i2eenwTnZNk4oZrYbH4kio48X3m6
         bmcMjXm9l7EmzsHwPWsOrkMULCf/ck3icRfZumhFplFU3h03vPNKDOfSmP+JhA6y+w5m
         AgQe739KcgjuKyPLlqQJASag1KwGGGqgzQhwj1RT8vxxXkFuldJ9LoTmHuWXcnHEwkJv
         EInSxDkR5+/XMLVCU5Fz1N3QwhTYl5zSxP1nYObeP4Zqoonr7b6WLDUnVYT0U5wIjRop
         2l6A==
X-Forwarded-Encrypted: i=1; AL+hErFlfM6+hhWpOvNWFDaJfgd8psaxWZrCoTW5Mlh1JVVTWr0jT7EEM8Dt/u2Vw1aRtacMJVwaWnA7djOZPA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9cDCpXi83A45sfDtU45YiD6ghH1Q9tAHp4iKf9jBVvdx3HE/Pf
	CNqAnV8tjzG6EPiJ05/k7Pdeh67hFkDB+q61Yem+wqHe6SU91nwSe8ESNJ20iUphhqE=
X-Gm-Gg: AYBFou1XQdHu4lP82292NkiQ4BvEe8EhdjR0CceQKLUlDcYeDjSKDUj+1W7ILobu/kq
	Z9B81vLNajA6uclvVnrXc34MX9zCUYcBDiQKL3rR9IW4IBTznfKgpWx7qkCCoC9wn9W13g8jF62
	zTQendJHc9OisCIn8AA9djJ+vDrvow8NbwupYtfqGxIzEdtmp42lHs7oRmoW2ifz01XT244oEQN
	5z8N+9+/On8E9xmU2KzAyxD3z37bdluJXXBkh+EVAZXxMf+GTtSdTUC1NPDNbB9WVcmZUIs3Sic
	MAi9AVxtDGI4hW3r7K24kCK2YE/0Za+1HgfMb6AXvNrF45j86HAPW/UcdixSXu2PhKQrZAixLdJ
	hjvDcS0NxLicj9RSUpq9gJCbHNU2pyJJ1SrfN5RX+mGzobpvW80XXKGWF1lWQ9MG0CDi7x9K1/W
	7V2N4qZRXusUNSl4Tiyd3x4SSI9t3jGY5nE+JHevFxoWAJSdJTAYEBdlP3/eT426v4D6kBvYyfA
	R6y2FbuXJOwczQIUuRYXZctLSvnerrZehUInysmMvD1gNdkVmPdLQbHTuBRYxaopOoByrWkaEGV
	bJf9SvZfHw56L5oKkW3Xxx8K12iu75iQISxlkp6VUxQuYTC3vz6Y/muuw8/6+Pn8AXE=
X-Received: by 2002:a05:693c:69c8:b0:369:fe81:a575 with SMTP id 5a478bee46e88-37686756684mr5116143eec.35.1794480322588;
        Thu, 12 Nov 2026 02:45:22 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.45.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:45:22 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	oleg@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	cuiyunhui@bytedance.com,
	dave@stgolabs.net,
	david.laight.linux@gmail.com,
	jszhang@kernel.org,
	tglx@kernel.org,
	conor.dooley@microchip.com,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v10 9/9] riscv: select HAVE_CMPXCHG_LOCAL
Date: Thu, 12 Nov 2026 18:41:49 +0800
Message-Id: <20261112104149.38589-10-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_024525_839937_2E142E5F 
X-CRM114-Status: UNSURE (   6.10  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Now that RISC-V provides this_cpu_cmpxchg(), select
HAVE_CMPXCHG_LOCAL so mm/vmstat.c and lib/percpu_counter.c can use
this_cpu_try_cmpxchg() instead of serializing per-CPU counter updates
with local_irq_save() and local_irq_restore().

Suggested-by: Davidlohr Bueso <dave@stgolabs.net>
Link: https://lore.kernel.org/r/20260826010748.zphu3wh2hlm4t4o2@offworld
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bde1f1885038f..458ef01e926a4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -155,6 +155,7 @@ config RISCV
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_BUILDTIME_MCOUNT_SORT
+	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
