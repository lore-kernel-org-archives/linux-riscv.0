Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A654C43638
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVH57TrpS5h8tRm0vvLbIiFm6hy6dftWhNkbckMRnM8=; b=agbG5fN3nHU0vj
	B47X+S2CZOB61aXXgl6nEJIyVwTJy28DnmmMvNUdjN0clb2ojyz6XnVBvrQOq2hKtryed6KS+lcGc
	Jyhg79HXCLKCmmiSDHhwu+5r+z7O0tcOLf4owvH5yxky1OnH3Wpc6/l58LdxBlHkv9ffrJ84Od+ke
	yTobe6bgwZ0/eU93V/Zor29eUJ0Fi0/bC6UPILksowF5MAXol8SPst54gMm1jqhybrCxHD+KsB2VH
	d+zRMOeGm5zHqNso+brPrBGk492fHXmxBGdWHlF8OocKJExJoX/7fqBmb2+GLeFllhghZW7yKVzV5
	2Of2M9n7lsq6fZzjRdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7og-0000000BUMG-3k4d;
	Fri, 26 Jun 2026 14:46:02 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7oe-0000000BULQ-0qNO
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 14:46:01 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782485154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLoe9hgpuLGAv9HcjQXiuki+Z1Eo9W05Z+080Efe+Rc=;
	b=xBmLvvo9VeLWl6aCPOHJfACC84T1J3BTjH51kQr8iuIJvUHkpL0TY/1jmfKt3pAIas6Dh6
	hMKA2it5f7Povtcv7HNEPaX/tbq52whxslXQwIYDMnFdkUFHHwDlaTZMjI6N1SUuxeL0dB
	Mk0ZoJAcKfnjrWev0iaDEvycix+RYjk=
Date: Fri, 26 Jun 2026 14:45:45 +0000
Message-Id: <DJJ28Z81JTQI.1SI0CNIP7W1JQ@linux.dev>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "ackerleytng@google.com" <ackerleytng@google.com>, "yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, "prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "thuth@redhat.com" <thuth@redhat.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "lenb@kernel.org" <lenb@kernel.org>, "pavel@kernel.org" <pavel@kernel.org>,
 "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Itazuri, Takahiro" <itazur@amazon.co.uk>
Subject: Re: [PATCH v12 09/16] KVM: arm64: define
 kvm_arch_gmem_supports_no_direct_map()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Brendan Jackman" <brendan.jackman@linux.dev>
To: "Marc Zyngier" <maz@kernel.org>, "Kalyazin, Nikita"
 <kalyazin@amazon.co.uk>
References: <20260410151746.61150-1-kalyazin@amazon.com>
 <20260410151746.61150-10-kalyazin@amazon.com>
 <86fr4o1ceu.wl-maz@kernel.org>
In-Reply-To: <86fr4o1ceu.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_074600_593107_7917F980 
X-CRM114-Status: UNSURE (   8.57  )
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

On Tue Apr 21, 2026 at 4:55 PM UTC, Marc Zyngier wrote:
> On Fri, 10 Apr 2026 16:19:24 +0100,
> "Kalyazin, Nikita" <kalyazin@amazon.co.uk> wrote:
>> 
>> From: Patrick Roy <patrick.roy@linux.dev>
>> 
>> Support for GUEST_MEMFD_FLAG_NO_DIRECT_MAP on arm64 depends on 1) direct
>> map manipulations at 4k granularity being possible, and 2) FEAT_S2FWB.
>> 
>> 1) is met whenever the direct map is set up at 4k granularity (e.g. not
>>  with huge/gigantic pages) at boottime, as due to ARM's
>> break-before-make semantics, breaking huge mappings into 4k mappings in
>> the direct map is not possible (BBM would require temporary invalidation
>> of the entire huge mapping, even if only a 4k subrange should be zapped,
>> which will probably crash the kernel). However, the current default for
>> rodata_full is true, which forces a 4k direct map.
>
> Where is this 4kB requirement enforced? Or is it that you means
> "PAGE_SIZE"?

Yeah I believe this means PAGE_SIZE and that it's effectively enforced
by checking can_set_direct_map() in
kvm_arch_gmem_supports_no_direct_map().

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
