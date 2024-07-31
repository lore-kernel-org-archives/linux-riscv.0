Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EAEC3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+VcgxGQgHwW/E/lmeicR3+bjMyM06fOS2nnToQzSZo=; b=ekuxoVLnwjymeW
	JLgDK8omlOr/J6sgpMTswNIdiDlGB4UHC2rx0iwauMqgV2FPIhhjd0WlXdQdm6MfcgHDBgI0GBjP6
	5NScQ6OF4iX4I/L/mmhOpJI+1HpbVYjsk908we2WkLLjRc9v7ZWIE8eafsxZqGzB68qtEOXc0y62B
	4O3VWv87pmRfEyYGLkThkHfZqZW1xDM4aITRHX2mLmaq007I4421A4onCN5n5pr1EhqzglFZXo9q0
	JERfMEzmP43uSoHIJ2A6xxZfmclnxOTjut7WP6dMVHV3W4QPRhLt2mwGAyEr6xLV0mublbi1NWs83
	NymMEStg7mduQyOrOQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5z3-00000000cKw-1WeB;
	Wed, 31 Jul 2024 09:51:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5yq-00000000cGz-01ul
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 09:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722419445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kF8YsGqLWNT4+a8R4w4P9MUEGEAYWYiYSABna27uXpU=;
	b=Dn9sN+xK/9kb1KlEyll9wIL7D8CDK+qVdUmD7CDfGK1eS01n5lGZRKIuKeXkBzNiP50FEF
	B1ZvTRWefeVdCaNexmXIIq33F2K5fG0Teg1MK+QZHdxCUtA/YddJmZhR/RPB07l0on8Lf/
	prR2eTGPSJyxOlmo7xNoWa6L2gw1aI0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-5B2UMvwiNKWjnpKxUQCkMQ-1; Wed, 31 Jul 2024 05:50:41 -0400
X-MC-Unique: 5B2UMvwiNKWjnpKxUQCkMQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7abee2b4b0so505337966b.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 02:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722419440; x=1723024240;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kF8YsGqLWNT4+a8R4w4P9MUEGEAYWYiYSABna27uXpU=;
        b=twX63wgmpduAy00aHHoIrx0BDUSPB0Olf6y2QAH+llexICt8gKYtbYKffrS76oyARv
         4Ov5pM40YA0VBYVCqslAMLnkQ6WSaElQWv7/ozfC5SYiwo3iN9nJ1aSILl83A0LRQSzN
         Q5sIYAglmDdyGBAHp1ZshBtNHgiOXKhZc5MKo4AbNMuFJI2qbRk/WmKXueJbLT1jitVH
         GUw8WL32tSe/qb3cZj8Zf3aBABVub0ImkDr0SeCjSSFXyemwhU90Mj6X979d/xCQQDzk
         QuQTfGJUlJEME6m7FfqNmzSC3AowuiMQpBAfOg9O0SqPrELoDtkRmQ281C3bWd3SR6cI
         1xQg==
X-Forwarded-Encrypted: i=1; AJvYcCUt0bghC1cmWn6sEdaXHuW0YJIC8d/PUuNCLg1Euinkwhu3XY80FyHF37ElhK0bUq2pmxHPY1RrB1/XgjYVkQ26MaR4Mv800MIVxqG3nubI
X-Gm-Message-State: AOJu0YztiBg9T2b3bI+nAhb2dZic+0hlGdhPu+wfDnB3jxRyVBOV4G9c
	RqE0Ya0zNNzLUiKBriXTVvUIKvPntGKJBB6ElOaDC0k+AT3FPt0AEwNmApm8G50CF0HDJagv3vT
	HXsq9MV6Nqckfmvb/m9bwa1GPvRrCcmraADlepzB/Byx4v4YZd2Kae3dIsxPIXGej5g==
X-Received: by 2002:a17:907:94cb:b0:a7a:bece:6223 with SMTP id a640c23a62f3a-a7d3ff7b8e4mr1064732066b.6.1722419440621;
        Wed, 31 Jul 2024 02:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm0sw2f7Q/hSxPLtTI3KYQw5uCrmW/NKDuI5rQ7HlgfsjazxGbnWK3KS2H8Xhx5SNKvtVQug==
X-Received: by 2002:a17:907:94cb:b0:a7a:bece:6223 with SMTP id a640c23a62f3a-a7d3ff7b8e4mr1064728266b.6.1722419440130;
        Wed, 31 Jul 2024 02:50:40 -0700 (PDT)
Received: from [192.168.10.81] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7acad93105sm746255566b.167.2024.07.31.02.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 02:50:39 -0700 (PDT)
Message-ID: <57ba7e1d-0121-4d71-89b8-c61c476ca724@redhat.com>
Date: Wed, 31 Jul 2024 11:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns
 that have a "struct page"
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-85-seanjc@google.com>
 <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
 <ZqlLWl0R1p41CS0O@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZqlLWl0R1p41CS0O@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_025048_309084_4F907D40 
X-CRM114-Status: GOOD (  10.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/30/24 22:21, Sean Christopherson wrote:
> On Tue, Jul 30, 2024, Paolo Bonzini wrote:
>> On 7/27/24 01:52, Sean Christopherson wrote:
>>> Now that KVM no longer relies on an ugly heuristic to find its struct page
>>> references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
>>> pfns, remove KVM's hack to elevate the refcount for pfns that happen to
>>> have a valid struct page.  In addition to removing a long-standing wart
>>> in KVM, this allows KVM to map non-refcounted struct page memory into the
>>> guest, e.g. for exposing GPU TTM buffers to KVM guests.
>>
>> Feel free to leave it to me for later, but there are more cleanups that
>> can be made, given how simple kvm_resolve_pfn() is now:
> 
> I'll revisit kvm_resolve_pfn(), Maxim also wasn't a fan of a similar helper that
> existed in v11.

FWIW kvm_resolve_pfn() is totally fine as an intermediate step.  Just 
food for thought for possible follow-ups.

>> Also, check_user_page_hwpoison() should not be needed anymore, probably
>> not since commit 234b239bea39 ("kvm: Faults which trigger IO release the
>> mmap_sem", 2014-09-24) removed get_user_pages_fast() from hva_to_pfn_slow().
> 
> Ha, I *knew* this sounded familiar.  Past me apparently came to the same
> conclusion[*], though I wrongly suspected a memory leak and promptly forgot to
> ever send a patch.  I'll tack one on this time around.

As you prefer.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
