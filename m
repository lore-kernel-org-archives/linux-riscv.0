Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3481061B2A
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 00:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DwRUPUtisr2BRR2X2l5oJrgVPqNMteWE3R1R5aYl3UU=; b=n03Zj6z7eH706kTDjmsOCeykeb
	v37rojeXKyujbyc1ksSMJoSwa05buWAfJIlxKZc5KdwofRveBbHV8BnGenqru+xffLiqARH1gcF/r
	I6w2q2RHAK3nRM10f5L1w2DBiRIV2lusYMY3MyJDDdzSYmpklTNspWxpB7UxrjKlZGXCdsiM26Fho
	JlTO9LCF0wbSLz2kwWDZeiZL7mJJWJdBjfwl4IOZ4ir0VCrepQxwej5n1jbVxkMSpNKGVc+5NziIe
	PtdD44lcLR+858bNqqKXa76LHUAkTNnyEz5xIHgDAqvVT70+1VFKn/ZEz18oMuUwPsPKIH5Zcy2yF
	KVsIuCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7MuW-0000000C40k-0dqj;
	Tue, 31 Mar 2026 00:24:48 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mBC-0000000HZzW-1kzr
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 20:47:20 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso289640241.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 13:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774298837; cv=none;
        d=google.com; s=arc-20240605;
        b=LfXzX0uYpImP9G+dtllpSv8dqMZkDli2pIPfrIJQH4BW09svvx4ICOAk9yIbnM2a54
         Qv4mx8v4EDOIdJz0I8Hwdb9rXLIib2xQeVdsCnQ8fke1s0OvZKiPbwiaNRD9ICpBJ/cU
         cTjYMdZqt4rgowtGIAy2ZfO16gRxm3q/gtXBv26f8EM9Q9zGdFPMae7YPxyVRyS748m4
         yQZz3MnuM5FIJKj2tPbnDw4TuP/Ml13AJ8ozwg2cNlvysGV2VRtzyQzALnl458BCfFdB
         FUnWQw7FJRT4bnN52MfEOhi21Y4fPJ7p+4OMEnj+uDQnN9bwUmBVY4EhJf+mY4Elm1hP
         xxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=yac1rrBqJSF3O+e4IwcngZ2ptSQxNGOfPE9KG9sOce8=;
        fh=BLKz86eZdfzSLIbUZEcjwWWL1c9WZiX1UlWSnCvlfVE=;
        b=B/dc8NqH6YwN1yyYOwkr+MdGVGURirP8Ij1Vubst72IAIJtwTzCRipgEiyms6QMDvA
         hQmu6IaM6xRKlB71zDgxMF8OEwnqj2PSwTTvoIrze7BrdVqVUYmT5ByySo+EyMN7NcE7
         oW92Tv2B8BPWbScTHSGTQt3HTr/Muikdo7aHKKegJ99Wdr0DDy/dOrPh3OKrweNDuPyg
         P9bWNHG0zvyXZ0bubfDYXiA22eEiO4KAmWCH7O4LxNOFziLCCe86nFqzdvuDXsynodNr
         I+crcW3U6x9R8V3ERs/BZypmbcNJNF+vk0mbgU2XJeUKNnlpmjefqZHohErJ8REeJDhG
         JrCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774298837; x=1774903637; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yac1rrBqJSF3O+e4IwcngZ2ptSQxNGOfPE9KG9sOce8=;
        b=S7DdI9PO7XM4pmUM3n33NetbBEu73MwiSmoEOUGpYDPUx/WPbkfHG7AmLj+ZrSmZKK
         UqewpopqqVSwNLMCfZX25LXsvHMXZKBwJK+83kfgHpkEWfCq9kBx1HGKyvgcrdlL/teM
         MSMSni+cdg3TdDSc6ieC8+MpGNQ3HZtKNhUGyCa2lkDJZ2K5QPUeu+l/SVPXq0ku0IN+
         hMBadVLsuilngwvsgIy35XgyQ3yUJ5NWgn7ZpzjAHrip3/Mh7GMqGBKLg0hUMkFyHoad
         hTqmB6spfSxAwReXiSvtNjz0rxc01Nc2UEpdIL+EqfZJ4pvEtYDCLycefj42Lq26j+HG
         1n/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774298837; x=1774903637;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yac1rrBqJSF3O+e4IwcngZ2ptSQxNGOfPE9KG9sOce8=;
        b=PMR4dEnUcS3ExYbBFrVZdG9pjAtK9lxceUpm4Pku82OD+T5ueiODAwhK/aMbwK5/T2
         1M6U0uXca2JHrsaBhN4wJ1E7bUQnF1VFLD/fj01xVR7m1dB/buAtUEENcNt+HgUnHtpF
         fZvpcfNemruGY2XmDHNwe8H8q/FNv3YpDgxdZXxiXaN+ByrMx6zdXWfZQeyAY8k4KkJP
         iiK3KS2tykM8mi6dqxrLv4m9ZDe8skOb8NKSVuIosHBGfOi1Gdf7/lfNsMn8MI+Mw/3S
         xWXjmTIXooXWPCbLq4mgQ5GU4cfc8lrOoPv78ZrbNHGK9axl8KjM39SlcDbRJ2AoJPff
         hogw==
X-Forwarded-Encrypted: i=1; AJvYcCXxybV/DKanXV6HZunWkuwBckRBF+gHfGE0M95IbwDZ2ao1CCIbuMZCS8/hL2opDZ8Wlx2EUcseXMT/Uw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9wz/XgP2AjmRuf0houWHl/zi06bgR1elz5dhvoJ4JoYVoRc6S
	xPP8TO5ATuOEe45yqWro9qfFHbu5+aZc7nsktT/5jS2ZdlgTMZ4jlqbwdeT6hKFLpkRsIRmFL+F
	K8RL9IW/7jSx21PyAAxD9HG1u41wN5WToushSYiPU
X-Gm-Gg: ATEYQzy2UK4pEjtIl0ZM1l86X8rVDQGwwEhJv/AiCsy2YYEJ32Vxx+TEitDWr3RtN3y
	nVJXSPMXcizL7/YfAjTcA/mNBO9d5ndLJEZ6cTkpcOHpiPkQDkfx0e4MkXopAo0g62g51m11J7/
	dm1Zt8+a/EThXCyYHjBGJxLfECerCSqCsZDPmgeNa/cECTcRDPxqh6/p8met0oeg1w9L6RhnZyi
	sGPXsVVTg5qBIxYNclpnRlwKm1l9QvWEAurhejVdZJyZ4CMdL5D+U0XuWVQl7QVurXdcBMP/rBt
	4i9KPjMXARuWilevYNoL4tUsOxRYTA/kuPIyGIa2IPEtDC2FvloVKcLLJsLU/JEIC4WkhQ==
X-Received: by 2002:a05:6102:4a86:b0:5ef:ac78:3c77 with SMTP id
 ada2fe7eead31-602aecd2a05mr6404753137.18.1774298836454; Mon, 23 Mar 2026
 13:47:16 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 13:47:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 13:47:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <50bfaeb5-551e-403f-bd00-a7d8b6bbf6e2@kernel.org>
References: <20260317141031.514-1-kalyazin@amazon.com> <20260317141031.514-11-kalyazin@amazon.com>
 <50bfaeb5-551e-403f-bd00-a7d8b6bbf6e2@kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 13:47:15 -0700
X-Gm-Features: AQROBzB7NM0e-Hubu0XRJL2ihJNatUocmuhRQlqLx8a7dgTL41taW0scozymRvQ
Message-ID: <CAEvNRgEXp6busURR20cazeG2DQWdU5=ZaJv21OcSq+mhVKwJ4g@mail.gmail.com>
Subject: Re: [PATCH v11 10/16] KVM: guest_memfd: Add flag to remove from
 direct map
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, "prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com" <urezki@gmail.com>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>, "osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org" <pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_134718_481606_235686DB 
X-CRM114-Status: GOOD (  16.30  )
X-Mailman-Approved-At: Mon, 30 Mar 2026 17:24:46 -0700
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

"David Hildenbrand (Arm)" <david@kernel.org> writes:

>
> [...snip...]
>
>> +static int kvm_gmem_folio_zap_direct_map(struct folio *folio)
>> +{
>> +	u64 gmem_flags = GMEM_I(folio_inode(folio))->flags;
>> +	int r = 0;
>> +
>> +	if (kvm_gmem_folio_no_direct_map(folio) || !(gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP))
>
> The function is only called when
>
> 	kvm_gmem_no_direct_map(folio_inode(folio))
>
> Does it really make sense to check for GUEST_MEMFD_FLAG_NO_DIRECT_MAP again?
>

Good point that GUEST_MEMFD_FLAG_NO_DIRECT_MAP was already checked in
the caller. I think we can drop this second check.

> If, at all, it should be a warning if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is
> not set?
>
> Further, kvm_gmem_folio_zap_direct_map() uses the folio lock to
> synchronize, right? Might be worth pointing that out somehow (e.g.,
> lockdep check if possible).
>
>> +		goto out;
>> +
>> +	r = folio_zap_direct_map(folio);
>> +	if (!r)
>> +		folio->private = (void *)((u64)folio->private | KVM_GMEM_FOLIO_NO_DIRECT_MAP);
>> +
>> +out:
>> +	return r;
>> +}
>> +
>> +static void kvm_gmem_folio_restore_direct_map(struct folio *folio)
>> +{
>
> kvm_gmem_folio_zap_direct_map() is allowed to be called on folios that
> already have the directmap remove, kvm_gmem_folio_restore_direct_map()
> cannot be called if the directmap was already restored.
>

This inconsistency was probably introduced by my comments [1] (sorry!)

I think the inconsistency here is mostly because
kvm_gmem_folio_zap_direct_map() is called from two places but restore is
only called from one place :P

[1] https://lore.kernel.org/all/CAEvNRgEzVhEzr-3GWTsE7GSBsPdvVLq7WFEeLHzcmMe=R9S51w@mail.gmail.com/

> Should we make that more consistent?
>
>
> Hoping Sean can find some time to review
>
> --
> Cheers,
>
> David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
