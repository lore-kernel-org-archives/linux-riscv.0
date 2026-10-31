Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3F3606A31D
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ihEOoDBO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGyptueK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URepJLCrDwQJKAgMSpsetTZGOgLCmwoha0P8fkMNnko=; b=ihEOoDBOyO+02FpF3nMjV1usT5
	yzQuVPvPXcFuK8fy9JnJ433sOo0ANqpNhyY0xrrSXXZ1Y5orDvG/XI+5coPh+sHWffCwQVbV7DbWt
	ZA1gqlS2pMUgj34XtO70CNquSiC9/fXnv1w737mWFw0pmSdBhzCddML+lXZHSKdTzq2WEvh5ItQUL
	XwzLKIlSZ75k0xhw2XHSR/DopcozBhMeejfOi4UXYSsqDlqkTvviOznTmKO3Bh+eU7Bxcu9bMmUsx
	OyWNX0O1ZPsb1oAtjC4kZlqTByjKNrqFlGFXzD5QujAXyevI8f79wy9P8Vsn7V/m27rVEsw7g0B2G
	ItYdUUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCtk-0000000DWcT-1MtI;
	Sat, 31 Oct 2026 17:29:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCth-0000000DWc8-2seG
	for linux-riscv@lists.infradead.org;
	Sat, 31 Oct 2026 17:29:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso11095675e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 31 Oct 2026 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793467779; x=1794072579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwRF56TcOm8rFLCnqU2JxOydhmu46zMDXK5qAXpa48g=;
        b=uGyptueKrY/oIYojDhWyP6cUqFjaBim5oayIgVBqq5KI9wa6cmLcWqMNPJkgG2aU5A
         i3Ycxm6CVIQIAF76oc9usvrOF2BYpm6RQHZFzs1kquziOkOHGG6FYcIgXOfXelaJCTCM
         SC+wNvZjwBGIHnbyuDSAt2j8797dzA/k4q5w1miOwFVbycLr3OxmWsN5r5Cy9JC+mpLP
         NgKx/vRrbdxCt087fPy/sZVAauQanwVuEgK6J9EL73apFXq09ElkcY+kZ8VOV4/kpxBQ
         EQ3blbkVzlhOJrZ6a4FkQDCtd3GU9ia4/kjmCxqvg7BKM+ZAJIj+Pi17YF2xBwP7feIx
         ZYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793467779; x=1794072579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwRF56TcOm8rFLCnqU2JxOydhmu46zMDXK5qAXpa48g=;
        b=dj7IzXbM4AA38s7helg7woRP60CUM6q5VnFINYJOZ5KvNFcumucey3OU0xF0VzctXL
         YDcHoz/L9OirOLfSq0VNLEoUKfBk8qeduqPXyyH6y+MR+jDFDfx+mgo9FNcruQY1OZIo
         ebsInyfGAcbe2N1zB8ZxkPZD8ZciPWfNdZSKtdIZXrCVziEAzSubb2An8OakS2owJGBa
         aTiEyoPUqNibPmwCm8kVavjsnf5W4AO8YebGQkwrbao2QUTLh9zrVijtbOmMDy9t6kjU
         ZDZT5Fwt1KgC8kLXVRobE2Yp6pj38QO00o/kYL6FXHOkevYpHuAL3GbzVCpQwRH73/Pa
         kKyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpKNcWlyZlfzV6llL5KFZE45PqyhjtBLjXJKPdlWC/rRA2IuoIoMbvGYdlhdWRUwLWyRD4Nyf/rbKaZw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIJBAVEj64bc50zlHakeAgfcrOpk8blZTaaW/kvOg8JDPwZERPi
	QnIANfrcopukejI7kSpYBmurouCLNbVvEmQSX9cM5jz5x8cZxjsrkpzH
X-Gm-Gg: AYBFou0i8HPQ0rnqNa7Wg/r22OCPKu+kAg6PXmr+n7MQv1cSkiLyEEpJGseBuLJ4fJG
	yiELGpSkJiOFdl9g336UQEf5QDP0+djTCPE932ErRCe8+Cui91/3E9uiptmIpPvvOYIFsF/U33E
	MvyMpUd3o7ITvpM6gCtF1JwV+A0jREzT49mH9/DqRQe5Ifib6W7fJ2eEHEhaOrU1nR9ofeVdFlc
	Z0xGVlIKKGoy48YBA2/1wszuvaRcT308HoYWgGynEw3s1W+h9/r0lm9jEG+0HEbqv4t26AaNop7
	AdPzkJ07CJA4+9rk0Fq1HyBIN8KSb9mhsrWMAcM4ea2VD90LVYlJcixMn0gSNFV+RDihcbK4NPf
	QpV3/sjfOyaAj6m9xqu0jPPU3V9Km0PC+on1z0ONKcrsY75SM/saBH9SnICmxXb9pK939RTtmvD
	Qvk55wfee9+E/NiAtdJOCgOlO/Kkpq4K+vv4ju8VBtuG7SQsxqxzDXX3HNgYLOUk/izqyLpEpd1
	OkTTCVlerILDRQgVt1E9oYPDsjnF665YJ96TEjh+OZadfm8JKDD2Eat7r87hqhKJVSnisRz8g1n
	C3ZWdPMIfaq+OOUeIHtFUCEI+L+pkMUVP4AqfQ3cjE4L2Djs0STMNxk8XL3KmHtWerVefe87fog
	LtTxmTSE4pDiUk8lTr4xwiEQX4ZZJF2xmmy6GqgWtYvoS9F134LdqTUWdIxKKT766oaHCxaIZGC
	KusIXZs0OKt2vHMmlM8+wyeP3GJ/o3Qlc=
X-Received: by 2002:a05:600c:8b63:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4ac17ff9d41mr121811015e9.20.1793467779294;
        Sat, 31 Oct 2026 10:29:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a81d-e001-9c9b-db33-f166-0fda.310.pool.telefonica.de. [2a02:3100:a81d:e001:9c9b:db33:f166:fda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm212352935e9.0.2026.10.31.10.29.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 10:29:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Waterman <andrew@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: mm: Skip the icache flush for special PTEs
Date: Sat, 31 Oct 2026 18:29:30 +0100
Message-Id: <20261031172930.835-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261017013634.792220-1-nickolai@csail.mit.edu>
References: <20261017013634.792220-1-nickolai@csail.mit.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_102941_769833_ADA03587 
X-CRM114-Status: UNSURE (   8.17  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 09:36:34PM -0400, Nickolai Zeldovich wrote:
> Mapping device memory executable crashes the kernel: an mmap() with
> PROT_EXEC of a physical range outside RAM, from /dev/mem, from a PCI
> BAR's sysfs resource file, from a frame buffer or from any driver whose
> mmap() uses remap_pfn_range(), io_remap_pfn_range() or vmf_insert_pfn(),
> oopses in flush_icache_pte() with the page table lock held

I hit the same oops on QEMU virt with an executable /dev/mem mapping of
0x200000, which is unassigned there. The kernel was abf8c33470f7 with
riscv64 defconfig and OpenSBI v1.8.1. The mmap() oopses in
flush_icache_pte() called from do_remap_pfn_range(), and init dies.

With this patch the mapping succeeds. Loads, stores and instruction
fetches through it raise access faults, which reach user space as
SIGSEGV.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
