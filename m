Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790ADEA71AA
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Apr 2026 23:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWmJqAd/zfn74rkSnedOyKtRsIJW6BpT4zCxP+6iKbY=; b=00dJumGIfdz75d
	qwdllvAzjGpdqLQQuy+e7ofuVOuWzEKeZJANPzqGC+31Vnuso/8BO3c8dpIhw5IxINi/1L5iRIIMU
	EogTKqq6mtwePdcTPOIRUGPc2Wwcb8dWeol9xl2VbJUBFtIprDaF5h9s8Nzi3LERftG5iyRi3lBLc
	W5iz2nq/3O8F8sXaiJHYA4TSzhCbus1DJ9I5nYifkSR719J2umWhgLGhKLGLpuqYqjGozXU3c3pGD
	e5mBvx9Iy4sQnpntbfVX4kG0V6TjzHqUDIolK7PeeFckzXg1qfL+Ra/LhBs5o7fL7l7mlhU58MTC6
	a9iY1/OCEt0DszYU2ldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEb8y-0000000697F-3SQd;
	Sun, 19 Apr 2026 23:01:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDlE-0000000CSqB-32Xr;
	Fri, 10 Apr 2026 15:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=DewD7DK1ob/bc268SFd2/qF7WsGADICns3g/XEuN0nA=; b=gtNQBVdfPoJ4ZDoxIe4DFk1qJl
	NpZLOIYv8eIyhmC3tmn5bxrXL/qpLgSuWY6T6n0Bw9NDsRsMtcA0l+TpHNNReXT3dXBKjwGq2WrjP
	hEWPYZjJhqufazdh3lFiGR3yz+Lm8AXL93L37euEcHiJdpL9hInQ0D8XsMB4gIvMJG5tOnWgCvDos
	prTD3NEnQcp6TIWuufTd0eKdYH7TQ8iVezpObSVeWjcn5YJO/u3fEW3c69OToNv5HFCWAS2vMogkW
	U/rlE0skNluXVosSE9YCbXwvf3OFrirlkmneBVGCpSvmXlAfpH2k+SFjWgx3YM8x6VWlbocZ06BjW
	ARvVr+QQ==;
Received: from iad-out-007.esa.us-east-1.outbound.mail-perimeter.amazon.com ([3.221.209.22])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDlB-0000000Dls4-2xOM;
	Fri, 10 Apr 2026 15:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1775834825; x=1807370825;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=DewD7DK1ob/bc268SFd2/qF7WsGADICns3g/XEuN0nA=;
  b=CcIi3iYNLNgCSH931M2mLbVfDN/1PKcADwlSVhMgzne3oO1c4DlY51tT
   rQz1NTeTlin3b6Xu5c4eDXEysORinjS0Noip0N+o6Quh4nZQWxIPz+evw
   05X46htZsa6KrCag1ZWWuC5s5M5SPF6SYqhUItr+fdTa8ORqbKz/VoHcN
   s3vMtsbfFQt9zenxvgZBNph1nVjWXImw0/eTfchgQGT0oMflEbuJbsu02
   jCfUF5gJLswsiuVifmGfoYtEow/F/fMlUKYo0rJu6y2rZwbI3mAJw5pNn
   vJ8i6YNlBIv2Lub1GOy8sHSixMC0L0X5DbIIexLffGeLoQxGihh7hb7cq
   A==;
X-CSE-ConnectionGUID: gI4/W2RwTOG1O7PgCTUhgw==
X-CSE-MsgGUID: BLc77vy4SnqTbMYl2NOT7w==
X-IronPort-AV: E=Sophos;i="6.23,171,1770595200"; 
   d="scan'208";a="15990465"
Received: from ip-10-4-3-150.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.3.150])
  by internal-iad-out-007.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 15:27:04 +0000
Received: from EX19MTAUEA002.ant.amazon.com [52.94.133.129:20620]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.46.155:2525] with esmtp (Farcaster)
 id a191a26b-32aa-4efa-af7e-55c66dfde52b; Fri, 10 Apr 2026 15:27:03 +0000 (UTC)
X-Farcaster-Flow-ID: a191a26b-32aa-4efa-af7e-55c66dfde52b
Received: from EX19D027UEC003.ant.amazon.com (10.252.137.250) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 10 Apr 2026 15:26:58 +0000
Received: from [192.168.12.97] (10.106.82.30) by EX19D027UEC003.ant.amazon.com
 (10.252.137.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Fri, 10 Apr 2026
 15:26:45 +0000
Message-ID: <453fb48d-0f68-4947-bf9a-c2c9b017162d@amazon.com>
Date: Fri, 10 Apr 2026 16:26:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/16] mm/secretmem: make use of folio_{zap,
 restore}_direct_map
To: Ackerley Tng <ackerleytng@google.com>, "Kalyazin, Nikita"
	<kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, "prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com" <urezki@gmail.com>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>, "osalvador@suse.de" <osalvador@suse.de>, "pavel@kernel.org" <pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>
References: <20260317141031.514-1-kalyazin@amazon.com>
 <20260317141031.514-4-kalyazin@amazon.com>
 <CAEvNRgEBdi49ZkfGo0xmM+J1yzKOzfT2ThAXEN=S0j7vC7Fu3w@mail.gmail.com>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
Autocrypt: addr=kalyazin@amazon.com; keydata=
 xjMEY+ZIvRYJKwYBBAHaRw8BAQdA9FwYskD/5BFmiiTgktstviS9svHeszG2JfIkUqjxf+/N
 JU5pa2l0YSBLYWx5YXppbiA8a2FseWF6aW5AYW1hem9uLmNvbT7CjwQTFggANxYhBGhhGDEy
 BjLQwD9FsK+SyiCpmmTzBQJp2NfjBQkGQlIzAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQr5LK
 IKmaZPPNDAEAvsw8vEWj8ArWQ1QJNufjrvobU/cE8MLKdBxbSE8CyZQA/0BldKxNAtAwG4qw
 wCLxsZ5vBL3Zkh/PdvtFCj/VGscGzjgEY+ZIvRIKKwYBBAGXVQEFAQEHQCqd7/nb2tb36vZt
 ubg1iBLCSDctMlKHsQTp7wCnEc4RAwEIB8J+BBgWCAAmFiEEaGEYMTIGMtDAP0Wwr5LKIKma
 ZPMFAmnY1+MFCQZCUjMCGwwACgkQr5LKIKmaZPPQKgD/f3FtERbJ+LYHLSG/ZbLNAOLngUlQ
 qo5VfIyJOzeLzC0BAP2PIUFIHo7vmia/PXEmT+ve4c5rx+EkH/Dx1GRpjWoI
In-Reply-To: <CAEvNRgEBdi49ZkfGo0xmM+J1yzKOzfT2ThAXEN=S0j7vC7Fu3w@mail.gmail.com>
X-Originating-IP: [10.106.82.30]
X-ClientProxiedBy: EX19D005EUB004.ant.amazon.com (10.252.51.126) To
 EX19D027UEC003.ant.amazon.com (10.252.137.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_162706_021559_BD6575BD 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 19 Apr 2026 16:01:32 -0700
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
Reply-To: kalyazin@amazon.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 23/03/2026 18:46, Ackerley Tng wrote:
> "Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:
> 
>> From: Nikita Kalyazin <kalyazin@amazon.com>
>>
>> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
>> ---
>>   mm/secretmem.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/secretmem.c b/mm/secretmem.c
>> index fd29b33c6764..27b176af8fc4 100644
>> --- a/mm/secretmem.c
>> +++ b/mm/secretmem.c
>> @@ -53,7 +53,6 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>>        struct inode *inode = file_inode(vmf->vma->vm_file);
>>        pgoff_t offset = vmf->pgoff;
>>        gfp_t gfp = vmf->gfp_mask;
>> -     unsigned long addr;
>>        struct folio *folio;
>>        vm_fault_t ret;
>>        int err;
>> @@ -72,7 +71,7 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>>                        goto out;
>>                }
>>
>> -             err = set_direct_map_invalid_noflush(folio_address(folio));
>> +             err = folio_zap_direct_map(folio);
>>                if (err) {
>>                        folio_put(folio);
>>                        ret = vmf_error(err);
>> @@ -87,7 +86,7 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>>                         * already happened when we marked the page invalid
>>                         * which guarantees that this call won't fail
>>                         */
>> -                     set_direct_map_default_noflush(folio_address(folio));
>> +                     folio_restore_direct_map(folio);
>>                        folio_put(folio);
>>                        if (err == -EEXIST)
>>                                goto retry;
>> @@ -95,9 +94,6 @@ static vm_fault_t secretmem_fault(struct vm_fault *vmf)
>>                        ret = vmf_error(err);
>>                        goto out;
>>                }
>> -
>> -             addr = (unsigned long)folio_address(folio);
>> -             flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>        }
>>
>>        vmf->page = folio_file_page(folio, vmf->pgoff);
>> --
>> 2.50.1
> 
> Reviewed-by: Ackerley Tng <ackerleytng@google.com>

Thank you.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
