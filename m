Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB44C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 10:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnkOoLZGAZcaJ+1DoHcJDg5WEHu5Oa0nFpgo/zcmz54=; b=GMDPkl2I9SYScx
	3QQBm6t21VDAaexWAcWsoQijJlrKCs+Y+zFE44LNugEM4xHlP58Yfp1pXGFDXmw5yeQCgGcaBTx/9
	DgdlfLjjK2X6AKXiL2hfaTleQwLNN8UrZcYrBRAh3xA8iBB/J10nq4gYRYzeGSIixLa02hUdSJ2/U
	pVsnJfBaXChxdAM3q6Lo0Fwh7NhalLDU2Cfm0mbtz8KbGUlKmRhaFxf6WVDh797sJ1TTpxgoGMJ/0
	LrXgS5UpJT2N2vXWicSNgxKDjv8WvSIQM28bjnQsT6rXxNywauFTB4OqKzX5IcP0Tw+JxRLNLem9y
	5iMDM8kRI2k7gVJJTXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otR6L-00Ese3-0S; Fri, 11 Nov 2022 10:17:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otR67-00EsU0-LX
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 10:17:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id v1so5820833wrt.11
        for <linux-riscv@lists.infradead.org>; Fri, 11 Nov 2022 02:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BH/APi1a0PoKAJZknP8AkAonpu9TnXBBnNUq+HUkcwM=;
        b=4oOscMH7jU6ury8coe6FqLy7zK1XZNinWBvFR7izLUhT8UO+Uf7A34vnnALOX+0uZw
         6u0BzpFG7Xf65rlpJuAvjMgTNhVx/gSKcxgRlSDN2zH7W+6LI6BnNcuT8FnlleBan74e
         U+nnWKJgynFDrs5h1v4LHjxM1v+N8pvPWTcuhFJiAYBmZcFqEaaRiyqBxAjt+VLKVj27
         ymKqo1xHrZ7qEJ3SsTyk8ixNapD9K4j74hbbeGy2nwxMGfxLNJInz1YB3DFYiKEqav4a
         oeGBzhxJPbF4jd3XpyzDJKvMeI1dC4S63nsd7WzmmwS7/SrtVuS1+i59tvEjxRd8GW0+
         CSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BH/APi1a0PoKAJZknP8AkAonpu9TnXBBnNUq+HUkcwM=;
        b=EBlw+ldDh31JDsaqEowbdj6tWsh4EQrgVcAmNYRK2YKbo4XHRQyq4xcQIFcWFeIE7E
         XxnUSQ2Deod15UtCUSrivvQRJysWauZ406Da2fKuMymUJKJaGy47ebK3oATnVk1DNKLW
         yWhiaH2/TGMCUetSD7dZdnKOj8rkg3ybGKa/42Y14jtQHaQ9M73iOcBSX6k5enFuumuT
         ewcAbfObet4hLhy37Da7KFSTP0lJTu5KMASKKfBbWUYfyLDKfQbP/KBdYJY5B7/U3CvN
         vHcW5aP+pTJUReA/VOSl/52eVNnxhyVZ3+TCR+SYfEmMEYT/MRzXlj7jdMBkSqNu0oPU
         VFWg==
X-Gm-Message-State: ANoB5plFSXEzEvcSCCNlD4FDh3vM/AcCe2HrZ52XhjdH2pLG+Z4lrAFd
	ycZ+Vs/TyYpPmrerWNjBX62R3Q==
X-Google-Smtp-Source: AA0mqf4pSdxpuNsvbAiQ/VPT4Uicb2yIOEyOj0DptBJEnqY46AvxjvE1jv4RoOcak7HL0HGEg3fM1Q==
X-Received: by 2002:a05:6000:18cc:b0:236:6d79:b312 with SMTP id w12-20020a05600018cc00b002366d79b312mr805921wrq.699.1668161831083;
        Fri, 11 Nov 2022 02:17:11 -0800 (PST)
Received: from localhost ([95.148.15.66])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c2ca800b003b4a699ce8esm8500043wmc.6.2022.11.11.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 02:17:10 -0800 (PST)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <akpm@linux-foundation.org>,  <linux-mm@kvack.org>,
  <linux-arm-kernel@lists.infradead.org>,  <x86@kernel.org>,
  <catalin.marinas@arm.com>,  <will@kernel.org>,
  <anshuman.khandual@arm.com>,  <linux-doc@vger.kernel.org>,
  <corbet@lwn.net>,  <peterz@infradead.org>,  <arnd@arndb.de>,
  <punit.agrawal@bytedance.com>,  <linux-kernel@vger.kernel.org>,
  <darren@os.amperecomputing.com>,  <yangyicong@hisilicon.com>,
  <huzhanyuan@oppo.com>,  <lipeifeng@oppo.com>,  <zhangshiming@oppo.com>,
  <guojian@oppo.com>,  <realmz6@gmail.com>,  <linux-mips@vger.kernel.org>,
  <openrisc@lists.librecores.org>,  <linuxppc-dev@lists.ozlabs.org>,
  <linux-riscv@lists.infradead.org>,  <linux-s390@vger.kernel.org>,  Barry
 Song <21cnbao@gmail.com>,  <wangkefeng.wang@huawei.com>,
  <xhao@linux.alibaba.com>,  <prime.zeng@hisilicon.com>
Subject: Re: [External] [PATCH v5 0/2] arm64: support batched/deferred tlb
 shootdown during page reclamation
References: <20221028081255.19157-1-yangyicong@huawei.com>
Date: Fri, 11 Nov 2022 10:17:09 +0000
In-Reply-To: <20221028081255.19157-1-yangyicong@huawei.com> (Yicong Yang's
	message of "Fri, 28 Oct 2022 16:12:53 +0800")
Message-ID: <87pmdtztga.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_021722_055811_C3CDE00A 
X-CRM114-Status: GOOD (  16.28  )
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

Yicong Yang <yangyicong@huawei.com> writes:

> From: Yicong Yang <yangyicong@hisilicon.com>
>
> Though ARM64 has the hardware to do tlb shootdown, the hardware
> broadcasting is not free.
> A simplest micro benchmark shows even on snapdragon 888 with only
> 8 cores, the overhead for ptep_clear_flush is huge even for paging
> out one page mapped by only one process:
> 5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
>
> While pages are mapped by multiple processes or HW has more CPUs,
> the cost should become even higher due to the bad scalability of
> tlb shootdown.
>
> The same benchmark can result in 16.99% CPU consumption on ARM64
> server with around 100 cores according to Yicong's test on patch
> 4/4.
>
> This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
> 1. only send tlbi instructions in the first stage -
> 	arch_tlbbatch_add_mm()
> 2. wait for the completion of tlbi by dsb while doing tlbbatch
> 	sync in arch_tlbbatch_flush()
> Testing on snapdragon shows the overhead of ptep_clear_flush
> is removed by the patchset. The micro benchmark becomes 5% faster
> even for one page mapped by single process on snapdragon 888.
>
> With this support we're possible to do more optimization for memory
> reclamation and migration[*].

I applied the patches on v6.1-rc4 and was able to see the drop in
ptep_clear_flush() in the perf report when running the test program from
Patch 2. The tests were done on a rk3399 based system with benefits
visible when running the tests on either of the clusters. 

So, for the series,

Tested-by: Punit Agrawal <punit.agrawal@bytedance.com>

Thanks,
Punit

[...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
