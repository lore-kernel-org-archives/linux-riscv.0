Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DE6CDB470
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qknnsfhZL/BsMiZiz8yKmmF8/HHZ+XgEHrKTipbtO4=; b=YFVptmXSS6c4V2
	M7KhZLA88jZOvkpQoe/4qPpmEa2qqfrULuAFhonFMKq4sYZLstwtk6YlAKP/aFlIXT/YeOKdsA8IL
	U+Y3d4b5i/FE982k8Fj0l7blt0KGrl1C4RkI82lPMLHmUWRvVxeeNCw7P46zeNopIhjyKT/3NUB1E
	AGWpjyWx6dpJIs1iXOnYhPTIvjAVZcOU4Y9nYbTQ/kF74zSg48pQ1zwZ65zMYpa5c12WojGYPV1Rc
	PcdeSz8IAiLNOkxsF3fdF4ZEduQcYkrU6eFYT/fanby3B5BPQONUpU+2Lmqg4hTvlpz8EXgiERB7S
	Bru2/DejDtaGNb/5SvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby5f-000000064C5-3NtZ;
	Tue, 23 Jun 2026 10:10:47 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby5d-000000064BF-2Aoh
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 10:10:46 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-37cb36ca63bso2798572a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 03:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782209444; x=1782814244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9xRyN5mmtNm+QB3YIDVLwBheiPW9GTxijNSPRoIWhA=;
        b=iOwLq3A9Mk34emsysJYnX2KmkczzdGk8zhrLdDhQfnK1Qly+Ie81pIOTxw7nOJlxYR
         mi0iKcK8WrHPYxbABg7UYS3hh7cJfgsTw11zBIA+A/Hh6ovtJFcqn5EALRCDBA9vBcK1
         IUAiyMCaUP5695mM+NIhUz6ohLro4hsswD7Bsz6EoVKrM7hd1YWhCq8rjWf5R4dcfUJG
         nH4tiuKCWyH32DVZoMxx9SlSZ1MMdN+217zNrI3/ARU2Xpdg0FmFsIxoyQsgwzCFpsmn
         kAh8KlKhHuToGHi2kdxdZXdLjxV3UwqX7RIuetwpwpYkz353CvEaMAAnxpurbm5jxuUP
         BATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209444; x=1782814244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9xRyN5mmtNm+QB3YIDVLwBheiPW9GTxijNSPRoIWhA=;
        b=eqrWMClK+siejUSMJy1m9FFKMDCjgHndCDHYLxiaIo2NXktF484hwAtSYLEk6jAT/v
         qx3HgpZvmpcmjnjGRBNCLM5HYEoyWmbKhoekp+vkSE0u3jDul952fhRvLUodxZ4qVWsa
         NTIs0AzM6mT7zXBXK3IDe7EfyZ5ODV2pnVrFVinMvPRaqXTfeNFJ9CagxtfSceDJpnfA
         Hs5rluUMXufKHMBrGs7pBxZksArT46cApsmhfw86yAwv7aBW2N3wdcaqn+R1SO5kjAun
         WDoa7uQjpc5RWAX4Qwn3+eiIEmiASJ3WToSeGjzgQ/XW4QHvmiLjErpmcJ55pkHKHlVp
         mKWw==
X-Forwarded-Encrypted: i=1; AHgh+RqBBwowEvXYmR1FMllntaq/DuBYzkrY6CoVgpr+n6LagUsdwW/zcTeNwguXCaVuuh70p8jPtOflpEna0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJM0W3zMP7xnm0RejBqZ4UxjfAVfWK2oZPW0FPKYKKmygy668C
	w5W3zaHNUPKdm1UdZo0RuL4dQIq0iq13VrkqnEFLJRctDKroRd6ATVIj
X-Gm-Gg: AfdE7clt06zhIvAF6ZBP9SGhRj6MrX9ZR4JzGbx56lIG1v5Fm4sfYPcPXolVaJ57+S6
	UhQvNkX+T8UvT/HzWmNPHU9ZwRa0QtsowIoksyAOyJXhs+pCickYUw5ceKVrp2x2OufJasB75Ap
	oDrh2vy02rulk1y5QAJ2dychJpuTlh8VFHFOv7TMvdmwUvxMAjBZRDrg2aAMOulocoEyvp13Emv
	W5cle6OOUfVtk3WCVnIk3jvwL47ASQyQabmPSC6YnjpKtjtwvdJpypsEQTq4fPlXD+vfMq0uprU
	XUs4n8HSiKrXzLGUSS4glAhs0kg3F2BYScckbTv1JZQiTS/Fzy8tjKRYpvuwnWxw6HCkYLZ5+G3
	UQBfA2pvaJJ7jgZbw8eoIp8hSxzZjfDL9BsSzx7O4S4bTxsKY9zi/FgjK+WkPoZQvbjXpJB4kpy
	KtC/k+2cjTgEmjgiH95ukbogvWVA4xdkyOP9WdaisH
X-Received: by 2002:a17:902:ec8f:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c7c99def24mr17988445ad.20.1782209444473;
        Tue, 23 Jun 2026 03:10:44 -0700 (PDT)
Received: from zhr-ThinkStation-K.mioffice.cn ([2408:8607:1b00:8:ede9:3e72:37cf:55a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f7e0asm118059125ad.30.2026.06.23.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:10:44 -0700 (PDT)
From: Hongru Zhang <zhanghongru06@gmail.com>
X-Google-Original-From: Hongru Zhang <zhanghongru@xiaomi.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	bhe@redhat.com,
	chentao@kylinos.cn,
	chrisl@kernel.org,
	jack@suse.cz,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	liyangouwen1@oppo.com,
	ljs@kernel.org,
	loongarch@lists.linux.dev,
	mhocko@suse.com,
	nphamcs@gmail.com,
	nzzhao@126.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	vbabka@kernel.org,
	wanglian@kylinos.cn,
	willy@infradead.org,
	youngjun.park@lge.com,
	zhanghongru06@gmail.com
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page fault performance
Date: Tue, 23 Jun 2026 18:10:09 +0800
Message-ID: <20260623101009.522775-1-zhanghongru@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d04f745d-eb3e-4d2c-8ea2-5fdcf2cf27b8@kernel.org>
References: <d04f745d-eb3e-4d2c-8ea2-5fdcf2cf27b8@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_031045_554431_416A6265 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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

On 6/23/26 10:02, David Hildenbrand wrote:
> I know that especially browser usually use fork servers: a tiny
> (single-threaded) process just to create new child processes. Any information
> regarding the apps above that use fork() on small vs. large processes?

I wrote a second BPF tool (fork_info) that captures nr_threads and
map_count (VMA count) from the calling process at the exact moment
fork() is triggered. Results from 3 representative apps:

  App (category)          Fork caller        Threads   VMAs
  -----------------------------------------------------------
  Taobao (shopping)       DaemonThread-6        526    8,987
  Amap (navigation)       DaemonThread-6        289    7,120
  UC Browser (browser)    OneNativeThread       350    8,144

These are all heavyweight multi-threaded processes (hundreds of threads,
7,000-9,000 VMAs), not fork servers.

> Above you write "some call fork() from multiple threads". Any further
> information on that?

Xiaohongshu (com.xingin.xhs, social media) is a clear example. In just
tens of seconds of normal usage, fork() was called 22 times from 4
different threads:

  PID     COMM            THREADS    VMAS
  4206    com.xingin.xhs       85    4,140
  4216    Thread-2208          85    4,157
  4208    Thread-2208          90    4,211
  5200    Thread-3200         337    6,519
  5200    Thread-3200         343    6,563
  5200    Thread-3200         361    6,769
  5200    Thread-3200         453    7,793
  5200    Thread-3200         450    7,779
  5202    Thread-2219         459    7,846
  5202    Thread-2219         462    7,875
  5202    Thread-2219         465    7,899
  4219    Thread-2219         465    7,903
  4219    Thread-2219         468    7,922
  5202    Thread-2219         467    7,917
  4219    Thread-2219         467    7,921
  4219    Thread-2219         468    7,929
  5202    Thread-2219         464    7,909
  5202    Thread-2219         460    7,889
  5202    Thread-2219         459    7,884
  4219    Thread-2219         433    7,771
  4219    Thread-2219         433    7,771
  4219    Thread-2219         434    7,778

The process grew from 85 threads / 4,140 VMAs at first fork to
434 threads / 7,778 VMAs at last fork, showing these are long-lived
heavyweight processes that fork repeatedly throughout their lifecycle.

Tracing tool:
  https://gist.github.com/zhr250/ba7725d0ea55594bcafd3cd4806eed98

Hongru

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
