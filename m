Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89BBD6CFA4
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 20:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tHVwxhUV7wKSCuUqLG9QiwAGp8YBsXII/asjuH2VRYk=; b=mZjOhwKscozt8ZFtlwqlPpBHXJ
	xKvPxRKobwZFTLQe96XhKZ7nuQLrgVzpZHP5qwKy9UaVIk+pisu4JC4VWb+2n1qStjkVaa4Ulsc98
	wCjKWwv+WL7+pb2o5ICKoKg2CDgZYJ/psV+PouwPvHyKelYXlAaUwguk4SB3g8Ij4k9MgtZeqgHC9
	VGvFraACvXYSFxrHlTOdvnrlcg0JVXVZz8TT6DKUc0a1yWluBiSs0UU8mMKGtS5CNbCLL3nT1ACja
	w9kS9aDl7fRdia5fSw1ZjassNpE2sUyl35lPQHVXG/MtJnu+xIbnpdd5tiulPnKnsif12D94POJvp
	Tij3JERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj1KV-00000007kFJ-1knU;
	Thu, 22 Jan 2026 20:30:59 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj1KS-00000007kEd-3Lhw
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 20:30:58 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-93f500ee7b8so697255241.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 12:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769113855; cv=none;
        d=google.com; s=arc-20240605;
        b=FdMqa/YU/xy7IqiJV4AM9gxmDBJGenUKxxA+KRZUF/MYWGyBbkRN6TUt7Svw8luLpQ
         ED8iatdpBUVX8eSqb235ldtKQCKcoxrXfQnjG8JUVRFFKA9UADthzw1r8CAuCc6lMGCE
         4D/GFI4zY5/W4clHh4WSmF+almVxQml2vzmVWnR9PitmAXorb/BclW2DXruEW7h6wFQ7
         E8d3EavhEw32pbH3CJkRxr+dtC0oR2vA4O68XIEQIogjJmWQSaHP3yUHZo2RZIsJKzc7
         KpFd9JslGwx+rSWs9CThp4NyovMQSOYukX4ZyF9voy4qsRFIiaTYrTF1grgGc88/mGxC
         P32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=BQj97zlME5zzETPT7vCk6obWp/pKKcD8Mr+mou6nGos=;
        fh=rsK+wXQKUMnvsbi6rm7P4WwNqVNkhliXesOYdhw98E4=;
        b=dwSqER6427otXAYiPFB7hz7fNIZmLwf6y2XSm7KqN24dHtXEm/zm5z+kMIFXtb9fRG
         acz1yvWeufCEeTBv0fuvdcidq5QwI1jRqC27FFHQ/pN802r+pkmukcVxCKinaysoqvwA
         A5JAIutqY9LpzrX1/Vt1nlWYPOw0O5pmleOzphJNKlJ7lFFhTWlo6BcFjnqDOzF7DbRM
         LyNxO3xrX3U4HP0BpjcAKsrIeH3Rz49sbKdNEUGbvoXWOzL+rRJRthA5lpahx8hdL5ma
         p2/aQeSZtMK3uF4TVXH0wCpdZlBh6hzO03OY30hZMToHT86pOvWwKFN1PFTTHVQagZMn
         LNwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769113855; x=1769718655; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQj97zlME5zzETPT7vCk6obWp/pKKcD8Mr+mou6nGos=;
        b=Xoohmu4kEMdQStUxPvEPeK+QGx6NSrZ1LDGCCY6uYgXA/VLVskfeb7SeUkRtqr9SEx
         L2KVJikFW0AJUVpvp3fBGFTh1Ztmeo1jQ2c/0zR0gm4R551A/VyFCvnIrhuI0FqblFxc
         8MA6677pA3w51VvXXzRGLuefqFatyn6eGxcsCVATnSrusdjEwKrR/j2s42t//0Ib8YzA
         XTR7X4mwttF5OQcPwSxLkKnSOl4cFp2TVXkfzKZLgxp99ydlp+1UhrlXYnQrBl4UUexN
         gVLbpAQ8/2F71b9zTyGvyISKvfK1mBgsLDjmHNx+REF/1BkmpAEvBcYDPxeYxfXRAeIO
         qExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769113855; x=1769718655;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQj97zlME5zzETPT7vCk6obWp/pKKcD8Mr+mou6nGos=;
        b=B6rUBGIyudzdlqlRbmJmgnv7SeJV606paETxngHvUi3l4yn2xYd0F2gwJW9uFAzCJp
         tjrr+pIpknyRKwH9Amf2ScmGe6O88npwQFODoKLbQ6qj1XIP0BDlMceBs4wkez0ZfjFm
         iFGOEWxTS3/1F92XpOW96b97ffPwEZP354QZi3Wt4q2x4XJAUPGtJYXFs3mFsSPQKcBm
         SJR6Dux/5k/MOoCpVm02eedTjf9twBzB3Q7Q6VR2qqm4Gb6tuUMQcAy81GA0pbsugbfP
         oDHuIs0Efmz5y36QV/Ie8AoKp7cdLe1ltE0IhtT5PPnuyQJLDAAn6KHXxzwKKIsB8RNf
         jveg==
X-Forwarded-Encrypted: i=1; AJvYcCW07JBmgg97A9CPNxdR0b7Air2vm+t3Vx4qX8d42ZLW8Bn0CbVLcVWishsaGt36celkRvHB4+tabA7iZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRt1nxBuoJ9rEZuob+l8A9NcAtD1kXB7bA1lXDR0S/9S9cPwp3
	xZ1k1J2ekgJvnpOoZclMHnYepVPAbcfZ7hQteV7qKjQQUVsEwVk9Cij8Suc35R5WCWMIHhKxed3
	FSCQs0UWsVRccHJq51F/FRxwYsDRBJqLBtdjQ0Pmj
X-Gm-Gg: AZuq6aKX+LHXld6xLBsM91TAPSAgVqMKo/kgFpeePdtWgYKCMelNSODsrtD3gRA8Kfs
	GyUfSPpF21OtYvawlDBoGesQ+4nEvuM4nV9K2QBg7KR++3xqLXXLJCv+Eat/y8S+Udpr5Tzt8NV
	OpgBV0yyBkCMghy75cQ9F0ehGQl9q4UkTgi8Wakw9DXWYPP6Y6VwpVXMJpOQ7sj7LYxIED0+HF4
	+JWa9mllz5WhMfIrpp8pSgkCsAl6l3aUz98py5xIxJc8muyfBK7ukR872XIP5UkczBmsT7zrdmQ
	zxhBE75Q2ZJyhIkZCn2PE2XD
X-Received: by 2002:a05:6102:d89:b0:5ee:a8c4:18d4 with SMTP id
 ada2fe7eead31-5f54bd0c3f6mr359613137.35.1769113854610; Thu, 22 Jan 2026
 12:30:54 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 12:30:53 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 12:30:53 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <f2f2a6bd-5cb4-46c9-a0f8-3240670094b5@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <CAEvNRgEzVhEzr-3GWTsE7GSBsPdvVLq7WFEeLHzcmMe=R9S51w@mail.gmail.com>
 <a2b79af7-e5d1-4668-bff3-606f57d32dfc@amazon.com> <CAEvNRgF46M1jp0+eBu2wQMO7P1afyo00SOkENFwvB2KYX3dnFA@mail.gmail.com>
 <f2f2a6bd-5cb4-46c9-a0f8-3240670094b5@amazon.com>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 12:30:53 -0800
X-Gm-Features: AZwV_QhoTAbsDcZFNCQXVZ12J6m5MEBpBa-k8I2xwSPIY6AXvlNDgQnkgPrJ79I
Message-ID: <CAEvNRgEd=Uh09dU_P7_vvzRpOyMYd=OKazpkxzr=VLe5HcQhGw@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: kalyazin@amazon.com, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, 
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
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_123056_879431_B65EC490 
X-CRM114-Status: GOOD (  12.23  )
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

Nikita Kalyazin <kalyazin@amazon.com> writes:

>
> [...snip...]
>
>>>>> @@ -533,6 +580,8 @@ static void kvm_gmem_free_folio(struct folio *folio)
>>>>>         kvm_pfn_t pfn = page_to_pfn(page);
>>>>>         int order = folio_order(folio);
>>>>>
>>>>> +     kvm_gmem_folio_restore_direct_map(folio);
>>>>> +
>>>>
>>>> I can't decide if the kvm_gmem_folio_no_direct_map(folio) should be in
>>>> the caller or within kvm_gmem_folio_restore_direct_map(), since this
>>>> time it's a folio-specific property being checked.
>>>
>>> I'm tempted to keep it similar to the kvm_gmem_folio_zap_direct_map()
>>> case.  How does the fact it's a folio-speicific property change your
>>> reasoning?
>>>
>>
>> This is good too:
>>
>>    if (kvm_gmem_folio_no_direct_map(folio))
>>            kvm_gmem_folio_restore_direct_map(folio)
>
> It turns out we can't do that because folio->mapping is gone by the time
> filemap_free_folio() is called so we can't inspect the flags.  Are you
> ok with only having this check when zapping (but not when restoring)?
> Do you think we should add a comment saying it's conditional here?
>

I thought kvm_gmem_folio_no_direct_map() only reads folio->private,
which I think should still be there at the point of
filemap_free_folio().

>>
>> [...snip...]
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
