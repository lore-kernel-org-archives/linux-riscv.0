Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD91C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POPRY7vYB4U0EkUiXD5Movrw7issO0a05F9tlpV+L2U=; b=EaaSBiGquZ7rcm
	pp3jrl+bK6+bd2J1WThpIzZAywSlkObkZ4eSoHbGuNjlPLwFqlnDmI8SxQplneWkpSJeBpdKhVpZy
	JZxezTojkrq80PfKJ8XoCHf6Tl54wIbyinyROscK2ZByrwYObVdVqr+W0DcSvBTMn0O2004WsjUh2
	imECMy8l+cI/w2TIQpFhD7ZMfcSb7Mn25Vwz3AJYk/C9YdAYbRtftOPhJbVy1MBvB43aOh5Pa8lDJ
	CNQSKdf4inNL6YvqzTFQiRY7N/A4SjGDl2wDUsD+eOPZ9v228Pi82Pr7VOcdnlhYnSQlexcCtBIzs
	7dZtZre9RHJFILBYQFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjgVI-00000001mGz-1jWH;
	Mon, 11 Mar 2024 14:19:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjgVF-00000001mFz-2iTl
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 14:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710166784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fjeIs11/GS4xnw7P/YbolbBH87bCSCu3+iV5r5aUsNM=;
	b=CdFGj9wyPEVEh4ceWF1leZnWGNyRQaBUTBMuCeWnDyEwIqJkmrWVH9eSdQnMGU6Z3gNdiN
	ZBtbdkHyiy1zOK6KxSCqJErrCTsiGw3xqunG7Jhw0KiwzG1VP3n8jgonbMDNCp41aa0kMr
	9rQO0qZ20g7matuJtNljUEmKrSuRjPs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-69PS1IMaOTuCR6HxNGjYFQ-1; Mon, 11 Mar 2024 10:19:31 -0400
X-MC-Unique: 69PS1IMaOTuCR6HxNGjYFQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d41fdaeea6so19586071fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 07:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710166770; x=1710771570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjeIs11/GS4xnw7P/YbolbBH87bCSCu3+iV5r5aUsNM=;
        b=CH5Z7TXfs+6hVEm413S+Wxk5slb4KhrkXWjbTH3WWP9NfBypKtK1hrGGYzkcLgHNFv
         I4m/YYOogewnANnoORQjYOiaq8FQdCl3eG2FbPmzIBxNqnnph9uni/G0DEOWMap+/5E+
         uLBOU2jLt/rXKE/QcvVegB4/w2xeNZPG8hkZ1tO7pAdk1s3txvVAtcip90l57B6T6dHC
         NqgPmJgvLXmG2axuAL9fTfd1PRnvh6zWl6CmZkoRwjGYFHf3JLM1cBBJB47sTj1MVQC3
         qm9uSo/us/pPLRVTeVII4M15bL3AWuqIR5KCIsrkpVr8v0lDo70ZMlE7gtby/BJvV+7P
         UafQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMZ3BSvmXZWsZsUXmRaWN0nZA+4TfiyDqBNe5RBKz+ItKoJOMoDjIQ5ihfIEsR8uvHhZKkxAhPjggwRK+G9mobP61BJJAidNYyRbl1+zFu
X-Gm-Message-State: AOJu0Yw0sn74S8bncqDeQAxJw45elF8ngARbAgKTYcKv7qsQ6fsjqbTM
	qS3zPbiw3StkTwg/a2rmJ9iTyZROe8RaLc5Kocmu/gclrvqylYT9Jitn42zBE0s1v9Sy1Y6GLkP
	Ktd2hvqp+xnKBLBFDL2YoVytFGEYHR+ht8qcv3U8DNxif3O47JpWEplBRNyuKWd29aA==
X-Received: by 2002:a2e:869a:0:b0:2d2:c8c1:d844 with SMTP id l26-20020a2e869a000000b002d2c8c1d844mr4073987lji.13.1710166770297;
        Mon, 11 Mar 2024 07:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHenKVxc5lk5fJfJlsecO5k6bHxo+uZ6RjbQWXqALB2AGcnuymWmVp/1W9o9nVZ3YZ3HK6MDA==
X-Received: by 2002:a2e:869a:0:b0:2d2:c8c1:d844 with SMTP id l26-20020a2e869a000000b002d2c8c1d844mr4073977lji.13.1710166769909;
        Mon, 11 Mar 2024 07:19:29 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.77.21])
        by smtp.googlemail.com with ESMTPSA id x21-20020aa7d395000000b00567fa27e75fsm2940331edq.32.2024.03.11.07.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 07:19:28 -0700 (PDT)
Message-ID: <f58fd876-3aa7-4c0c-80ef-586862ee9363@redhat.com>
Date: Mon, 11 Mar 2024 15:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] KVM/riscv changes for 6.9
To: Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>,
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Zen8qGzVpaOB_vKa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_071945_768910_E8E930AF 
X-CRM114-Status: GOOD (  19.04  )
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

On 3/7/24 18:43, Sean Christopherson wrote:
> E.g.
> if this were to happen with a less trivial conflict, the other sub-maintainer would
> be left doing a late scramble to figure things out just before sending their own
> pull requests.

Nah, either I would fix it, or I would look at an older tree from 
linux-next and ask whether it's okay to use that one.

>    tag kvm-riscv-6.9-1
>    Tagger:     Anup Patel<anup@brainfault.org>
>    TaggerDate: Thu Mar 7 11:54:34 2024 +0530
> 
> ...
> 
>    commit d8c0831348e78fdaf67aa95070bae2ef8e819b05
>    Author:     Anup Patel<apatel@ventanamicro.com>
>    AuthorDate: Tue Feb 13 13:39:17 2024 +0530
>    Commit:     Anup Patel<anup@brainfault.org>
>    CommitDate: Wed Mar 6 20:53:44 2024 +0530
> 
> The other reason this caught my eye is that the conflict happened in common code,
> but the added helper is RISC-V specific and used only from RISC-V code.  ARM does
> have an identical helper, but AFAICT ARM's helper is only used from ARM code.
> 
> But the prototype of guest_get_vcpuid() is in common code.  Which isn't a huge
> deal, but it's rather undesirable because there's no indication that its
> implementation is arch-specific, and trying to use it in code built for s390 or
> x86 (or MIPS or PPC, which are on the horizon), would fail.  I'm all for making
> code common where possible, but going halfway and leaving a trap for other
> architectures makes for a poor experience for developers.

I think it's okay if the _concept_ is reasonably arch-independent.  In 
that case, the first who uses it from arch-independent tests has to 
implement it for s390 and x86, but having a function in common code 
makes it possible to use it from the partly-arch-dependent tests such as 
arch_timer.c or get-reg-list.c.

(Now - that is _not_ the case here, because the function is only used in 
the aarch64 and RISC-V specific parts of the tests, but still to me it 
makes sense to have the prototype there).

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
