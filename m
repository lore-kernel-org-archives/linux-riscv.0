Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D76C5DF81
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 05:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3FUF/qXbF2KvnrdPLDtP45sy2XKY1i9JxCrBwLiUbs=; b=TUGtF1nyVy0Dz3
	l5gN5NkGJIi0eXNfts1fuxI0cBt406K+05KRYZ97MHIqJlTmOcPZahzzFTwMKxE+t7Gt3h2wzHpMe
	0DvgFq2J0IQSAu4iYHi326VhsW+Vi28abF0F6cFXPpg1Pg7EjHY+8Rhx4ton+B95O4DaSwlkIqwOy
	Co3aVtdCj6ew0EYs07oLP/YD27TXpJylVxv+VyjC4CtSPR55Wl1hYcbvpO81Watw3f289JM7vOYu1
	BYpkf38Q+2pekkAab6Dc5uoiLp537bz++ut+yqHDXUHzcRzPQFQZ8D4iemZcAaQwZf5UfeLKVdOe9
	J0asVulDmPbzlJxftlEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjU6-00000000AEh-1OOz;
	Tue, 25 Aug 2026 05:14:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjU2-00000000ADW-2aJo
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 05:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787634841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9OwnSzTLO9oC5dFpcmND+TzPw2bMH6k9WMlDpSF/Bk=;
	b=D/DfWQ1ojVexHfaX+44I0hDGOLd5IdoSKLR71/TQzVpNJ8h1Hw/d5nbwBSlx3hg1EvMDJE
	rb6fBJf7zpO/MAUbD2HNMRXA+ZMbvJPJNWUTF+vXqSBF+6fowabNf+Dxfx0fe9ToxpCTvy
	jTXI7uM4Qe1jCkWdBxDvdTzm17yJab0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-QLnOC-BxOVCwbhkYlvsoVw-1; Tue, 25 Aug 2026 01:13:59 -0400
X-MC-Unique: QLnOC-BxOVCwbhkYlvsoVw-1
X-Mimecast-MFC-AGG-ID: QLnOC-BxOVCwbhkYlvsoVw_1787634838
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so5534351a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 22:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634838; x=1788239638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9OwnSzTLO9oC5dFpcmND+TzPw2bMH6k9WMlDpSF/Bk=;
        b=NV+m0oxjXPBlz+RVsbnCB4AJFWYC9JClNk6FBaRUJX9yarTKmJuPHZbyumBb3DOcyb
         WQQ0IbUKvHoP374IIrwcrj3kB87YxTdcc30rhBf60IdtC0FQioalg3I1529rW9+ST5XH
         SjkrrpfLECfNVYWKNZS4923QKftJDkIBKE33DDfGXm77WpKoMOEPJWK7nt5/oMo8lCCf
         2Fn8+vQYPgA+Kg7CHCJsLJrrMjQWbtMhdjSt/9Y8bZktujkphqlA/pFRlhsv+xYtnz7x
         M/51EJVUmdUAd23Kw5kpix8aJYCz9h8LiWHlIedMKT2yrUIfUiC2zOHMBgNH9sDwIvgN
         m9FA==
X-Forwarded-Encrypted: i=1; AHgh+Roc2xveglCLiFXIJgSTmk8y8U2s+FqEpcrnTvjG4mjJ+NMdDW2gV7bhHGf8Eky2i0izzKZI8ONzyn5pMQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lSKneiEMxkr1c24Zg5gsd+mfU1Ie19nGn9X5PvbMUAUKiEXeIn
	8zriPXGBOdQYdzdyBgIqZc8M0uSq6nypLZ/O5ud6Wv0Ebv6+ZaE7vWf7u0ifOOkYzogcAntuuuk
	ZWQHUJqjZKFBaQxpFwc194CgD7KQvhfcomsNwyg9yAxlgNQzMrWju1siqAH/Tuw/r1wnWtw==
X-Gm-Gg: AR+sD130U7Rs295lZVuyVn6XCIqT032CXJLVdeOjMf3Umum8gR9CRDjxvvPC8xksn6C
	rn3nLSFxjx8gGo4b6FgUvshEh5t9Rq00P8YM9Fbb/K/5vxMV/poBcEGYFVnV+Yq+VJMrb71c2Sb
	B6FDYujRO57j3uhfRPtR2GvIe1JYz6TnfUjMxk2/FMKUIqxLt0KJUygF1eG/KvFgvXKR6F/l42P
	1vzFG1K44QucpoeyhkWEP3WMZOXnJlEs679RK2TGyySBKYoaLe31PIEabq2epBcEZd16MZXpgzl
	/SfRcIEf/IyHaDHahom0feW+XsQfiiTv4h2l+3gk6KdRoeYmmIS3m9Ha7Ytf4hnMjdS4NDAJu3I
	pK0p14yepiAZkQsVeBA==
X-Received: by 2002:a17:90b:184f:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-3964603084fmr8668912a91.0.1787634837957;
        Mon, 24 Aug 2026 22:13:57 -0700 (PDT)
X-Received: by 2002:a17:90b:184f:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-3964603084fmr8668825a91.0.1787634837463;
        Mon, 24 Aug 2026 22:13:57 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645da08desm2156603a91.17.2026.08.24.22.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 22:13:56 -0700 (PDT)
Message-ID: <06a45c67-2642-4efa-994a-ee50cd40a697@redhat.com>
Date: Tue, 25 Aug 2026 10:43:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] kexec: return -ENOEXEC from image probe functions
 on mismatch
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>,
 Philipp Rudo <prudo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Bradley Morgan <include@grrlz.net>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
 <20260821-mpilaniy-v3-1-76b355399d2e@redhat.com>
 <aoxQFxuzZ1AHmM8d@willie-the-truck>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <aoxQFxuzZ1AHmM8d@willie-the-truck>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5NQ8MvsTUE-VZYhk99QS2qccvDS4LyQeHZ9E2ttmD_4_1787634838
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_221402_740957_28669A09 
X-CRM114-Status: GOOD (  16.24  )
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

Hi Will,

On 24/08/26 7:37 pm, Will Deacon wrote:
> On Fri, Aug 21, 2026 at 07:19:57PM +0530, Mukesh Pilaniya wrote:
>> Several kexec_file_load() image probe functions return -EINVAL when
>> they do not recognize the image format.  A probe function that rejects
>> an image should return -ENOEXEC to indicate that the image is not a
>> recognized executable format.  -EINVAL implies a problem with the
>> syscall parameters, not with image recognition.
>>
>> kexec_image_probe_default() iterates through registered loaders and
>> returns the last probe's error code to the caller.  That error
>> propagates as the kexec_file_load() return value to userspace.
>> Returning -EINVAL from a probe when no loader matches is semantically
>> incorrect and misleads userspace about the nature of the failure.
>>
>> Return -ENOEXEC from all probe functions and their helpers when the
>> image format is not recognized.
>>
>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>> Reviewed-by: Philipp Rudo <prudo@redhat.com>
>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>> Reviewed-by: Bradley Morgan <include@grrlz.net>
>> ---
>>  arch/arm64/kernel/kexec_image.c   | 4 ++--
>>  arch/loongarch/kernel/kexec_efi.c | 4 ++--
>>  arch/riscv/kernel/kexec_image.c   | 4 ++--
>>  kernel/kexec_elf.c                | 4 ++--
>>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> Hmm, so after this patch, are there actually any implementations of .probe()
> that return anything other than 0 or -ENOEXEC? I couldn't spot any after
> a quick look.
> 
> Willkexec_elf_probe() can return -ENOMEM if memory allocation (kzalloc())
fails inside elf_read_phdrs(). This behavior was previously discussed in
the first patch of this series [1].

[1]
https://lore.kernel.org/all/0d7acb43-2eb4-44ec-9bfb-b89440afc605@redhat.com/#t


-- 
Regards,
Mukesh Pilaniya


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
