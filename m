Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6F71061B2C
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 00:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X2ptJRaBD+7nXfoDCPejRcHzu4+witl9wXyCjYbtJEo=; b=oaM87ls+O681PyFCYdj5PYV8YX
	iFFPm2PySRiCPwCGJ5eyC6KDGj1gNOAq3bQ/kIHJNDx5CXZeHqemPV8oxnK+FM9DZM0pLO41L3s7y
	X+VdQoVSoPxyAbkQr93lVm/+Uv/La+0fyCiONgBi7jMCAse4s8uYF1GmXS+5I0uy44GhgY7/TWEf8
	90tKYC4eVsriB+W2WtsT+pT8QrsqJbLrjKGhz1P1Z/ScJyK9dCufL/y9HKmJxq2ueTe3AbyaEpJBU
	3GsrpH1I93zxN+xMJhbrxQfuwDlgwbPXdckn5x3FI6yGB8Wn9My7VeC+FMIa8Uq3Xlu5c0lvOuSPe
	vZwa1iww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7MuV-0000000C40d-3cm2;
	Tue, 31 Mar 2026 00:24:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lns-0000000HYjm-2BmT
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Mar 2026 20:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:MIME-Version:References:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DfIEo8yQ3CK3TKTvqaXVb6LUrtHQE6Lxe6QzmQiMk8w=; b=KfovzETzXoRvgui1gBUeR4B3HR
	ihCVYVSJxULUOUW5iu8K7+9FZ0ayE2pnK7OJkjDYL1iDCmOVZxbNqvgXUvnYaoagLTBdHJOAzZ4ko
	+D0Nk8DwIOv0qz0SV36fQjtXtvSIACVMcwBdMYMHm7Ysrvs8mPBzN3Aq9QGi0OSg5E5GwTUTyps9G
	4Bqwqd6VQPbiH1ntqJe39U4NZxdaTTmmR8bKTDhO+osoF5I/VDgnvgYsG13FcMo3tcAfsRAR+U/hE
	y7iWEMdJuG0g6CZFffe+stuOmsXVQllrXSHSQrPLj6WU6huLsnejLVWjz5MgiuCBDVtIr0LdRdaX5
	zJF64zGA==;
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lnS-00000002Xi9-3vLM
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 20:23:11 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-5ffe41e8e83so2881442137.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 13:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774297365; cv=none;
        d=google.com; s=arc-20240605;
        b=j2Rz5T0QP94GhSuPdDNgWcrREmHfnL9Px7vSICuuyjSqDBJB09kYGTQPFraHEhE5FR
         tlQ3A3xJr/DiEDG+G98QM6VZ4dJpIDW22F+Hc5e+LbLn/w2TJ5tIAQqfCUraUaRhCFKd
         pQlH8WRrEEh+dNVI5/ttSysMOkI9YfpC7d+VXqpyr+kXS1ewSFxUNok5LH61o7K1EHKU
         9YYBwSvjVON43lsYM7JOogOZdq7FskLeUfrzkO1UNS+vUZJ68qA7UHvbt/kiPVVwtI27
         qZKai7cqbuZdgBhvuM5UTjsWo9D3eTMvZx26+TyLl6xEXGACBluvV2qJdsKfCWmJ5jR8
         UHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=DfIEo8yQ3CK3TKTvqaXVb6LUrtHQE6Lxe6QzmQiMk8w=;
        fh=OWHroIAfjUHXXNAoHYq701W2d+Gc+6Bmqs6uTE5zO1E=;
        b=QRNpz/qtITxIPIfvL2qLksuNL0e5alwwkHWqTigLVmMCCVwOVQGoThiguyDgr+5Mud
         8NSxrNY2NJLpl02Dkgpj5l15+betAvrjiYpD07THnYoWPJPjkGahzJNfInS5L5Rz2G6B
         pty5Fc7/pdNIDxCvkPNcqaw4Rsk6iwnKPSVHOnBD7nSWM/cod2UndEq6QCE/sB+bMeQN
         k0AA06fZxSDyJnnJ2k2zaMj14az1SOoKJtaQZBlSP/E5TiVOZqdR3xj9UCSjlNnFHBwV
         3L5UPxXbpDGX9cLhSKKsCA0UxDuMGMGTrnoWilnLHhysmLLlzp8PoQC6V8y53iyMdOBL
         sM/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774297365; x=1774902165; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DfIEo8yQ3CK3TKTvqaXVb6LUrtHQE6Lxe6QzmQiMk8w=;
        b=ErY6GLMmKVumPekkXCPJNe3jcfjXqjzBgOt0QRRpddOrCOtxN7cholEnFfUl4Gd442
         bLtridZBXh0toD7rXlC/dYNS3DkPhOPcmU4AIxkXX8zuNOn5CKEzn8dDuSbAbJs7lBoM
         Oi70f/tVb+B1FrsEKwdVP/bTxOzdgt3mjJ1EVJydi7CJUmkTtvsLRZGl+zVDOnhvUPgZ
         h5VCSVc05HfYRQTYYjWjki9L8suksZqEszkSL11GHFdCVIXWcV22lajwcPGN1Ky205FN
         I+ARSJfDssvFSHoPBgx6/qecvcJ3w8vGvSlO2QY20mnukj9URlRFuzzADuVL6JXrF+Zs
         RrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297365; x=1774902165;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfIEo8yQ3CK3TKTvqaXVb6LUrtHQE6Lxe6QzmQiMk8w=;
        b=kPkfJksQcotiOpyA5llVuM3p4i7zkl/K9A5NUvWWDl14LdboMNKi+HgAKRkff+N3T5
         23TE1UbdfxMUXp9SCCBgbKoE/HFdKJgbJg2+QlBkWwlzzcj+nRoPSsM0X9oA3d4wx7SG
         VyVsa+RvSrSG6DRTM/WZdX1eY/YdO2PqmPiqnnhuJaLzgDEe0ZI9uG4AAn+kKhQNNT4Y
         cdE513RJ3JguTIBYO+HZRBn9LgpmPEs4ZusLMix3AbnmCPl1Aj6bvt9fWqe642PpyX1z
         RG+zzRLlKE3J9vDFXp2NhYa0yJbqx9TkSpHX7kbZdHHlIhL7Yb1FRdd+z0z/B/yHphfo
         /ABg==
X-Forwarded-Encrypted: i=1; AJvYcCV+CPblUG4J96S8MbyBfGzghAZfTDQue0VMc9S8e02nR+tSi/x6hOXQfOHX9GY8ggXDbcsOXmS+FtImIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzniRS9FTDxdPj83GStol+81unp/NeO/YGfEyCGSzZ/VqruA9Sq
	fnZ/Kl74RnyNCgo7j1BHgpoF3IWoRdI5hMkIMN/1JBa0edkMK4S8hSgl+wm8XpPx5ifhCQzRVA/
	i5/nFNIUjNgyHYQ6aBLBwnwH/J5VyR/ATfpW6FEJi
X-Gm-Gg: ATEYQzx+PyLpu0uVxRyxoscBEpROH0QiCzc1fr8z2yqqVPyj9LczOlN04zfmqSY8++i
	Sxeo44ps75CrwUb1WdUWw/sHHA//anCa38eAPcr8O0AQPBgcJd3QCc7l2bdi5mELjNy7KtykRrU
	CUooDT2N452RqeAY4ceTQms9hexAuXu5IbTQfrMi1wH3TkzEx1QLbloCgBMfk1rlr4TFhZwSkLk
	xIy4dKsoH1o423GbAqQ/zYTUkA0EQpfe4EJXzPFESpD57XRLzCRomUu/bWs/MsLBy7GYf07vrwH
	brsBhjuyPtgbg5ZkshgQDHk4HXkFvyWOQHyZXXdKymmy56e4urKNhNQYbZNnmu7RkTMASg==
X-Received: by 2002:a05:6102:3a06:b0:602:8742:1fa with SMTP id
 ada2fe7eead31-60316013f44mr514571137.9.1774297364023; Mon, 23 Mar 2026
 13:22:44 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 13:22:43 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 13:22:43 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <0a14c10d-0dab-4b9c-85ec-e0ee25cd0db8@kernel.org>
References: <20260317141031.514-1-kalyazin@amazon.com> <20260317141031.514-6-kalyazin@amazon.com>
 <0a14c10d-0dab-4b9c-85ec-e0ee25cd0db8@kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 13:22:43 -0700
X-Gm-Features: AQROBzAJTtmZ8_CHcmYDgt7IaYmvr2Pi4WE03drdmWTq3AGR3rA_vEwuIGtsbTw
Message-ID: <CAEvNRgHqJGwmAfS8TuGBbUoQehpqY9GdtjUS=+Hc1ViK79RL4w@mail.gmail.com>
Subject: Re: [PATCH v11 05/16] mm/gup: drop local variable in gup_fast_folio_allowed
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
X-CRM114-CacheID: sfid-20260323_202247_024717_553748EF 
X-CRM114-Status: GOOD (  16.69  )
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

> On 3/17/26 15:11, Kalyazin, Nikita wrote:
>> From: Nikita Kalyazin <kalyazin@amazon.com>
>>
>> Move the check for pinning closer to where the result is used.
>> No functional changes.
>>
>> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
>> ---
>>  mm/gup.c | 23 ++++++++++++-----------
>>  1 file changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 5856d35be385..869d79c8daa4 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -2737,18 +2737,9 @@ EXPORT_SYMBOL(get_user_pages_unlocked);
>>   */
>>  static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>>  {
>> -	bool reject_file_backed = false;
>>  	struct address_space *mapping;
>>  	unsigned long mapping_flags;
>>
>> -	/*
>> -	 * If we aren't pinning then no problematic write can occur. A long term
>> -	 * pin is the most egregious case so this is the one we disallow.
>> -	 */
>> -	if ((flags & (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE)) ==
>> -	    (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE))
>> -		reject_file_backed = true;
>> -
>>  	/* We hold a folio reference, so we can safely access folio fields. */
>>  	if (WARN_ON_ONCE(folio_test_slab(folio)))
>>  		return false;
>> @@ -2793,8 +2784,18 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>>  	 */
>>  	if (secretmem_mapping(mapping))
>>  		return false;
>> -	/* The only remaining allowed file system is shmem. */
>> -	return !reject_file_backed || shmem_mapping(mapping);
>> +
>> +	/*
>> +	 * If we aren't pinning then no problematic write can occur. A writable
>> +	 * long term pin is the most egregious case, so this is the one we
>> +	 * allow only for ...
>> +	 */
>> +	if ((flags & (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE)) !=
>> +	    (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE))
>> +		return true;
>> +
>> +	/* ... hugetlb (which we allowed above already) and shared memory. */
>> +	return shmem_mapping(mapping);
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>
> I'm wondering if it would be a good idea to check for a hugetlb mapping
> here instead of having the folio_test_hugetlb() check above.
>

I think it's nice that hugetlb folios are determined immediately to be
eligible for GUP-fast regardless of whether the folio is file-backed or
not.

> Something to ponder about :)
>
> --
> Cheers,
>
> David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
