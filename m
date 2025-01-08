Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2233E77188
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIhlJKg12ipzmN/+XKhpWQ2AfHSlWp7rJNTg6DS/Cd0=; b=A23Rortzq/Sw5p
	+KBIfOcK3cLQzuLyhK9PtknpOgMQuZGR+soex8sMdc+B3C+Hmqg6AgONLxRn0JNSziruEQdNqv2TR
	E8ngPoInV+xrcpwHHzkrmmSuTn3YKoEnZ045vrVLK1bjzaXujttZucOr9DoxPNEEYusZZMGND2aaS
	FfW6icDLXYePnf920zrHLjN3+yxZowSXrBTNNqcpzNq5960YW/M6dCOiEU+Se0dZnxt2XvhAqULFp
	Q/5BpBZ1bCcEKvWKl4SBsiwMY81Etdrokc+LpGaRo8MOrKReOk34udblW8dbAvoItCpB5c5UE47Zp
	WwZ5/KO5Llgj0xvLngfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRVg-00000007ZWL-2DqG;
	Wed, 08 Jan 2025 08:33:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRTC-00000007Z3M-4Alp;
	Wed, 08 Jan 2025 08:31:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A875312FC;
	Wed,  8 Jan 2025 00:31:45 -0800 (PST)
Received: from [10.57.94.52] (unknown [10.57.94.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28A753F59E;
	Wed,  8 Jan 2025 00:31:08 -0800 (PST)
Message-ID: <7cf8fa3b-799f-415a-82a1-eee6b7b2e0f5@arm.com>
Date: Wed, 8 Jan 2025 09:31:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/17] x86: pgtable: convert __tlb_remove_table() to
 use struct ptdesc
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 agordeev@linux.ibm.com, alex@ghiti.fr, andreas@gaisler.com,
 palmer@dabbelt.com, tglx@linutronix.de, david@redhat.com, jannh@google.com,
 hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <39f60f93143ff77cf5d6b3c3e75af0ffc1480adb.1736317725.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <39f60f93143ff77cf5d6b3c3e75af0ffc1480adb.1736317725.git.zhengqi.arch@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_003119_078137_DFED265C 
X-CRM114-Status: UNSURE (   5.40  )
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

On 08/01/2025 07:57, Qi Zheng wrote:
> Convert __tlb_remove_table() to use struct ptdesc, which will help to move
> pagetable_dtor() to __tlb_remove_table().
>
> And page tables shouldn't have swap cache, so use pagetable_free() instead
> of free_page_and_swap_cache() to free page table pages.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Definitely a good idea to have split patch 11 from v4.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

- Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
