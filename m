Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34291CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH2lkZMEyYPduv0Ea7X99A3pTJ2HJomwUo61XmjD1UQ=; b=U9L+x5R2o7zGkE
	C2SJVF6T51aKkhTKGmuBZfFgmiOlSvz75+J9NM7hqK8MC/r2XPToC4VXkve0LQTa+CDN4atolXKz7
	LIb2a6wGBlL3hKmZqWcRSAAdiSJcItaqJ2sFUu1FCa8krBqXhNMBss43QB0907llRRismT/dejo4D
	2SUIlOBgUzPqKcAvMLW7BiS05Q/BkFyyqciY1KawIyx19b4kWlTwDVE0O4SqvFqbUxUn7MNfFw84V
	M9AKVre/p/vGnc7hIFHboexSJADLvuve2ti2JZYcum4mZVqXVCKAJWvv2R+M5cv2XjKi3xF63nZIa
	jXnMc3gpE9KtWRagB7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5Z-000000046cR-22Mf;
	Wed, 20 May 2026 09:19:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5W-000000046ZM-0PNV
	for linux-riscv@bombadil.infradead.org;
	Wed, 20 May 2026 09:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=; b=BKeE2oO/j3ntlpu4WzyeKuiC9r
	0vaMoPsJtJNfArSlL3Uu0+q/MIzmU9yDpXpKVmpeabH+rnMSpVAoWuIjnLnfiX/ko8vglPTyIkq1W
	/jCstxYBAH4oYugLMN5HAHXIzgThbBLOnFUHiG5VKi2fTyzUcSQskVpm2dC4WrydyGDDV8AfkcFib
	j2C4E0fIVbZ0IT15ptVmIAkv6UhSJQXiDXNeU1FnBs77V6eX+xjvBOt2sx14uyJT/V/3dqe09F6k3
	gx41bBSIToYvJyKXeYccOg6ScjY9in4zVhNxfFCqKyClLx8nbT+AJkMLHcYUF8D/GJkocbBAc2cRW
	y1cUNMFw==;
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5S-00000006xBJ-27i8
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 09:19:37 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so2171802b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 02:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268771; x=1779873571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=;
        b=UrGsCwAhe5LLei38v2Ny6ro2CWr3NLMkRhyohqx6MGpVdhjA3CpAuf2ig8kYkgfZL/
         H3YSk85j9V8FnWc38Yx1slfE2CAzqk7KRVtX/WoheUFOIqBHekakX9eGjhfI6FLYNuTW
         gCsiOvQh/eC/azlRNQKz4gPS9AOz1v9AUhgZKh0CYG8h+AQjbREZz5r/mgJ14nWcQFRn
         fu4vjXDqLJ4tNjMh5W1OySlK9Q/1L5UmeiKP9B4A6Dse7iVfsMlDAk//xjpa3W1uikUX
         t+SjONPZuAkyNsPYoRfHk4uhVCmTKXIzsnE+18q9jzbud5jGr2I3WdLjsJcOKrgAvcG7
         xkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268771; x=1779873571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=;
        b=Mfepv58CO+M9sFwe0eFWDWI26tV5kKj0aeg4cuHDmae06gq12ea0XjO585UA3mJVTb
         4ymS4/DAG6faRvIZeWSeLEiL16kb3+cQU3bHzMu945f47jbLcO01EkwlPZ9EQ+lGr+Rw
         6DD75+5ckIO2/17sj7vvDFNpEvxpnzLZJDLzzbyi63/8WKot8dQrXGMaEnjwiAfH4FQ8
         FoMXCP63/tR1xM/I1mk2aYDjh0ytWZZQZac+JEV64Bu/SfktdFxt4oM7mTHTh7+/3KKk
         Nm6S9qYDRjqp3zd6XRDT4s8u/0Uk7DkPaJCpD1QEN0yM/ZO3W1O1cz/DhDIVscpz3fyH
         20gQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IADjaTJT9ui3wMReNPMcj/lHmYoUXTu940n+TSVnBd8ANOACfZUozvRD6Xu30CeshLCR1HO4EsW1I7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgWZDPC1IHbfjXBF/D9uZQ07uHp6lkiIsYwjE28iL5U+ENQrvY
	1InT5qdfg1uUMxbsjF89wVWLOe5BY6yrMOQ+s/j+8/o3AWm8d0HHxxsb
X-Gm-Gg: Acq92OEf2/zE5WFFirN9gdAgbit7p3CUmhCQlR5zUKTTxUaXyxUPrnF+gTMJAmyYvx/
	ACgUHwFIB3w7UkBZbQ7schWtdt1qIm/yqRMFS20ma7WSIKtX/Jh0KFRXnTRtUXz5u8HhKiaXtzE
	TSyS2jDr8I35Zh0LEzVyCFEu9H6i6w1YiPB0hzbcTijqpI0U2f8ldZZzJa7hJbfkUofPna+DY0s
	tvWTawUGMJmQ3Bc90t5Dr/w5CRRNNno+H2zRLsPFXA9aa8me0A95AEVC3E/IZLbBxxT4OsJjYOz
	exf/HQnKOw0Iu6QkIv3uFZzW96G14doL+SnjrVnm7re22Ea+s2PGdoa2jBBW7+l0201AzAvwR0D
	hMuAOMXqQyiH0Zj93cQt1Au+cdYR8EwaYYQxAwYLDGrg3WphD1qV2lg0x9e7PFoLLVaxH4iOUOn
	R4mv7+fcrujn6IIWc5igU0D/z8FDdBYNfSwvwzeCoF2JQgZkTI
X-Received: by 2002:a05:6a00:90aa:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-83f33ccd856mr24019073b3a.39.1779268771454;
        Wed, 20 May 2026 02:19:31 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:30 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 3/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 20 May 2026 17:18:39 +0800
Message-ID: <20260520091844.592753-4-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_101934_853913_556AC2CF 
X-CRM114-Status: GOOD (  10.63  )
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

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem so the kernel can decide
whether a reserved area should be included in the kdump vmcore. Most
reserved regions are owned by devices and do not contain data useful
for kernel crash analysis, so excluding them by default is the right
behaviour.

Reusable CMA regions are different: pages in a CMA region are handed
back to the buddy allocator and may contain key data for crash
analysis, so set dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Link: https://lore.kernel.org/all/20260506144542.GA2072596-robh@kernel.org/
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..55a67cee41ea 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 03f52bd17120..eddec89eb414 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -579,6 +579,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
