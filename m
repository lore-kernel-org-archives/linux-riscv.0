Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37ACD3EE8E
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5nZvInmkQYZ8rqw4tWi7qD8F8kK+t1NDl77FzEEFoms=; b=UiBORsEAm8ZOx4L3geihDnquyw
	7UFAlIkPA0mLiJYLmI2iHb7WsDAA/98tcXgrW9+KwXZpAgOKmiqzO4lBxBcUVMnWJ+qIl4XDp3aui
	eBjRY79/YOmtlMJwQW/GOiAWu2KvquxTT7qDMI7RCeK/0oZvBUKHt+HWHfhMo+ynzaZR6f1pONe3t
	XcFI4id6Gvq05KVkR8tWBWrhUUYay0Aav6VvQcM6cbAiC8KF1AoHlFV8bQrdRIfgsAqpjCYxS9GOS
	NXLWhxib7NyPIPyGY3Cxho1g33L0Ui4z4br2cKnlMPEUS3AED8GUahzguobtRV9/x/OVAGgFJ6O+7
	JJbIT+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixnZ-00000007Sws-3Mzk;
	Thu, 22 Jan 2026 16:44:45 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixnW-00000007Svl-1JlO
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 16:44:43 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-5eea9f9c29bso785908137.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 08:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769100280; cv=none;
        d=google.com; s=arc-20240605;
        b=gfIVOGJvsuHIezg603v7Dfp9ttq78XayD4/xRU7KRZtjN5prkJtuy7iuGgXAy8enU9
         +WioL6CQtFJQpNKtTuxUWXDHv9Xx0D+ZimqNB7FBhGbHgv7Qd6hjUL4lLOfYAABIpENN
         GbdGX0RJH9cweAmld2GhM/lgqGAN3Jt4iP/hjekwPI26xftlJi2t9d02GIXAcpC8H/oG
         1rupbbmI4010s5nPgCHaEbifEYJ+JGvYo5/azKlOpQU4VpJve5paJjY8aGGKLRK0svav
         zcwUZxBAPQ/Y9QZSN+E4NWctOaemj5n+elaekhbGsS8hwOEoAz4yWb6IpYwQR1plOC5M
         jGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=i278ipBKd9t4eNryNmv1UqNg417NlVEpdzsVGz5SQq0=;
        fh=pbxMKkeXg+xp3mjIeJXY8L4UfCKEF7Pi+c/bCVz/kmc=;
        b=CFqdRG6Qlb8nOEtuOHSO8J1y6oc8mOWDqGdGEDnFchtJaBYUyt7C2WdMffcI6GwQoG
         zDxDgnq+v1OXd1P6HxrCHtJrID8ZaP5J4mj3whI8twF8Hua46txIdUrIN2h5MsLmt7SB
         AdkC21zxnNjFP1/kZYIuUMkf78iyiGE1ZvTItiS5qSPXlQZ1GtpB/K8c2eUkcA0yhkoT
         jy7jmZshOwJWC+/k+9MwovInF6leqUOeSl93WK03IwwKIK8oVknETN9ltWRfM3QLoUvG
         XyVBPNpqNfKC2TKYTAXjr32M6J4VYltLcJLqO6CObg8KP/iQyeHop4ViydfxpdWXzqnm
         Gocw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769100280; x=1769705080; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=i278ipBKd9t4eNryNmv1UqNg417NlVEpdzsVGz5SQq0=;
        b=VFyyuDB6wp41PnMNjXHcPdmXCIgMmSeBnRttVdqQICM5O5XJghKcVzR4jZkKoNNavR
         srUxuVQQfp4obf3tOclFSEtvmewRZGeF/ay8c4ElPeS6VKBxsCHophfJV0sg/j0ZKfqs
         jQotJA5ejuKv0k+cIhCrzTHr5LVFJFfw22yH+JWDLlQy8RRNUxrXVixKA11CRtD90ziF
         wCLe/K5so7qIIugNMhgcJFuqt9UO0r2wpGNW2T9NvItAIxZc/Sj3BQaCfxzI9UMq+3li
         CJ5SqkQr91DAErxtcthS+kpqvB65hDafv9BCydqBbaeCjTjwVaPsTuFOzvwie3LNlxtc
         Cyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100280; x=1769705080;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i278ipBKd9t4eNryNmv1UqNg417NlVEpdzsVGz5SQq0=;
        b=cz9zt9jDnjNPrQzfCUEi2MN0lMWzXpDaZ13gYKInTTnbKKGPpXu1wg9/EFYyga93Hm
         Kt5Fldd5+kB7ptSdJ0Cl5t0m4Be+qdj2zEQpPWLWLWctNhygY/uXSCyZ66B3dhBYsPr8
         gEiz1E8cAtTn59YltNZ2N1Y0OEzQZ+vze6hRoMq8e77w7mS+/SiYKfI9vCB9n+AnyHkF
         5ClurqkPnKKhOqzJ84+JK7tIHteEFIoNW7B2TEHLL1uvWgzT5Pn6ipQPtJkhf3Ws+AIU
         E74BcqEe34cBRrcDx8IG1O9w7Plp9253ksp3/Uo1pfZ6hoEqpio0AEd0KAd51I6RPqYE
         M5/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqZtym02NmDoIIFLmuhMKztx7mzZtin+kZEBOZn3RhT5rGfLO1GSuu4c84s0o2ee9R5TzZaq7sv05xjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdaqlkeFfYRV4Nt1PDvrEZrZC2i91MLOgzP07cBcT/IuKQbEgQ
	sb5Cy5ZoYBgBlSwxpe2JpV+e+/qiNKDZDuyW2RhGcpPAk7AR+arJPDM9hv7Ghz0VcOUq1/XS9Md
	BUVMzW3iYvmxhpsrH4BbOdQGc/olkBABzYF6JgO8Z
X-Gm-Gg: AZuq6aI8Ik2+JcmAnhQ0zHrXYn+wWXnSoAIViWVpioGHrC+lXDj1WJef0CHhO9Xs3P3
	1vcbEStM54gMnK9Mc4JQxg1eXJYWjwVE1qzVXDrWKvJ9igZCHTvy4t1cMqbPvsnnsRgC8jpksSw
	kRR5nVNpB8WLsjvxMGwr3j18g2nxnvdWwiDGhcATIprg2eliN8N22Jsagl5WEHl6LyumWdTcl9t
	N3ckOIuh/QVI5rSQvykxh14P1zxjCTbPew0X/8rhZA3teQAkXaeppjpWjWtlVrZJlfxvw==
X-Received: by 2002:a05:6102:d89:b0:5ec:c528:4df8 with SMTP id
 ada2fe7eead31-5f54bc628cbmr124387137.28.1769100279450; Thu, 22 Jan 2026
 08:44:39 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 08:44:38 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 08:44:38 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <8c1fb4092547e2453ddcdcfab97f06e273ad17d8.camel@intel.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
 <CAGtprH_qGGRvk3uT74-wWXDiQyY1N1ua+_P2i-0UMmGWovaZuw@mail.gmail.com> <8c1fb4092547e2453ddcdcfab97f06e273ad17d8.camel@intel.com>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 08:44:38 -0800
X-Gm-Features: AZwV_QjFiVCL1GgMB61exuGngD3MnDbAOiFUMFZ1rYdJZrzTGdTea8E5DMfoinE
Message-ID: <CAEvNRgEbG-RhCTsX1D8a3MgEKN2dfMuKj0tY0MZZioEzjw=4Xw@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Annapurve, Vishal" <vannapurve@google.com>
Cc: "david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "jgross@suse.com" <jgross@suse.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "surenb@google.com" <surenb@google.com>, "riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "peterx@redhat.com" <peterx@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "ast@kernel.org" <ast@kernel.org>, "vbabka@suse.cz" <vbabka@suse.cz>, "pjw@kernel.org" <pjw@kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "willy@infradead.org" <willy@infradead.org>, "wyihan@google.com" <wyihan@google.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jmattson@google.com" <jmattson@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "luto@kernel.org" <luto@kernel.org>, "haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, "mhocko@suse.com" <mhocko@suse.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "song@kernel.org" <song@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "kernel@xen0n.name" <kernel@xen0n.name>, "hpa@zytor.com" <hpa@zytor.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "jthoughton@google.com" <jthoughton@google.com>, "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "peterz@infradead.org" <peterz@infradead.org>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shuah@kernel.org" <shuah@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, "xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "jannh@google.com" <jannh@google.com>, 
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_084442_387442_AEB40BD4 
X-CRM114-Status: GOOD (  21.05  )
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

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Fri, 2026-01-16 at 09:30 -0800, Vishal Annapurve wrote:
>> > TDX does some clearing at the direct map mapping for pages that
>> > comes from gmem, using a special instruction. It also does some
>> > clflushing at the direct map address for these pages. So I think we
>> > need to make sure TDs don't pull from gmem fds with this flag.
>>
>> Disabling this feature for TDX VMs for now seems ok. I assume TDX
>> code can establish temporary mappings to the physical memory and
>> therefore doesn't necessarily have to rely on direct map.
>
> Can, as in, can be changed to? It doesn't now, because the direct map
> is reliable today.
>
>>
>> Is it safe to say that we can remove direct map for guest memory for
>> TDX VMs (and ideally other CC VMs as well) in future as needed?
>
> Linux code doesn't need to read the cipher text of course, but it does
> need to help with memory cleaning on the errata systems. Doing a new
> mapping for each page getting reclaimed would add cost to the shutdown
> path.
>

Can we disable direct map removal for errata systems using TDX only,
instead of all TDX?

If it's complicated to figure that out, we can disable direct map
removal for TDX for now and figure that out later.

> Then there is the clfush. It is not actually required for the most
> part. There is a TDX flag to check to see if you need to do it, so we
> could probably remove the direct map accesses for some systems and
> avoid temporary mappings.
>
> So long term, I don't see a problem. For the old systems it would have
> extra cost of temporary mappings at shutdown, but I would have imagined
> direct map removal would have been costly too.

Is there a way to check if the code is running on the errata system and
set up the temporary mappings only for those?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
