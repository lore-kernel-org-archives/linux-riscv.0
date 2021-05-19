Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FFDC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 13:29:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2FC60FF2
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 13:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D2FC60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s6u8nM7k6xTODs9E30JIfVhVILg0lSBkd/0UhvRhQR0=; b=bK6RzChWrw+MShI/H1NX70Lr8
	ynIw3KsjwU0VnHgd4n5J9If45l7XRFSdGoiHhm9YbonlkQeol7pzz1FD1MzxNFsjtpLDB8Rtj3BWz
	pbiNnhSYfc4q5dxb31EBTJXWneKiKNOWH7PB1SThFiRHvjiD87km2aAGsCv105z3/JFd+rVkjflzm
	/KOsu3gBYnp8Z6rAZYgR3KmygrpjFNtPa+hK/tcVNMYeWm/hEKNaIWNxcqYh2mDokRM7YsqkHWlc8
	2/4oLCHII1wfUPYr+ROC8+CD2V6cE9UQCl/djfGb5zz6kiuTtKFDEwMMafH2hKve7ctCd5LF82sk5
	O5TJX+s7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljMGa-00498N-TO; Wed, 19 May 2021 13:29:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljMGX-00497c-3s
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 13:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=Utix8t6spaKb207Zj7UyYQmhE/BXGv3+F72MAkz+g6c=; b=J/VUNlRg0nqtp0UihrYlDdv7tq
 +MpJ5/y0ofjFPaC9lpBnOVt1q2K/7dLyl239kBv8Mmfc2mYuRcs6S501DMErWNMzKny3iCYnip9F0
 hYoRQs+3f0xF5SLoCn2D9RrM6p21P0fz+IzbXzrdIB/fH66rgZlU8dZBONSLyzf8YWGXudwBD98gK
 X5wG92MP0b/t44ZeKPbmPSfo7LT71aFEGSRdNWT/+ZERrGC9kSnFJY6REFDvGOW7X2E/S3Eb+sLM+
 D0oOKb9z5TZwet/tsO1UNlG6YU9j6IW5IDzlxq/j+wC2NODEmbLLMyJ7djDdTVgNDiiwouQ2TK+GG
 kAE7UIKw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljMGU-00FVFz-BK
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 13:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621430973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Utix8t6spaKb207Zj7UyYQmhE/BXGv3+F72MAkz+g6c=;
 b=eWNubG+kwp2bAxH+bh8sElhEqVWUm04/GR2o5okzaHFPOsQSf5tIXRcEqeFqU7u8++e/zp
 SQdUOREC1sMWqfEojsInmGO1uWeREqEOxzweOmZz8e2/tQiq/gCclXtYcuLnyldZueGoLW
 fOw8HvdrrOcOYmOinNt/DI5f3dmlJxk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-J4w8QBgrOQqscAxc1EdFAw-1; Wed, 19 May 2021 09:29:28 -0400
X-MC-Unique: J4w8QBgrOQqscAxc1EdFAw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t5-20020adfb7c50000b029010dd0bb24cfso7159736wre.2
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 06:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Utix8t6spaKb207Zj7UyYQmhE/BXGv3+F72MAkz+g6c=;
 b=JnPhfNn/zBDb0T4wcpjwqA45UOwb+1T5rCXzU0fFspJillibWeERXNE6sOlpDkJEfT
 HJIeBzlZGdL4CtmmlLWk1OgEZqNXvM9x6fcSGpZ6kSYB8kz2Pi03/0pw97bkEvTRxNb6
 wxUlhvm3j8rjW6sbP9rNsltil0PyGtwPR4R9FsaNKmFhLHkELqnfXMjT3akaiSSz1GDP
 uonzOXRzRbxjWkJhwFzXMJN+IKoDQ3OqWYMtteViQ3OU+fiP66wiiv1BeD0ziiHGPFGA
 dCFZcL9FqswuLNBgwcE56VlYDWpzaVTHPY7roP/L/E+hNHVpUG/0Bqe3ZIQ7c5e70HWe
 hJWg==
X-Gm-Message-State: AOAM530jqsO3uSH6YIPobkB24nGPSpADfrzcvmJskw3SP0woYo9OJg/0
 bLfDs2uX2E/NfrsP+iU4W+4Xl16Ev/tiV95e2EYi7JoLv6WpA7z9mCAnMNxmlpbQ+17MhmCYTCc
 IRpY73YhzLhLRiXS81jfIcBELYs57
X-Received: by 2002:a5d:4946:: with SMTP id r6mr7406499wrs.123.1621430967435; 
 Wed, 19 May 2021 06:29:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5mZQHnE/EnIv4pnudlM+/lE7mYzi7oQJa6EidXFKUYAuQiAiWM9tIETxbilaUxzeh7C/zPA==
X-Received: by 2002:a5d:4946:: with SMTP id r6mr7406476wrs.123.1621430967215; 
 Wed, 19 May 2021 06:29:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l18sm25469067wrt.97.2021.05.19.06.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 06:29:26 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, Alexander Graf <graf@amazon.com>,
 Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-doc@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-staging@lists.linux.dev
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
 <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
 <YKUDWgZVj82/KiKw@kroah.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <daa30135-8757-8d33-a92e-8db4207168ff@redhat.com>
Date: Wed, 19 May 2021 15:29:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKUDWgZVj82/KiKw@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_062934_485878_9BED6337 
X-CRM114-Status: GOOD (  25.21  )
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

On 19/05/21 14:23, Greg Kroah-Hartman wrote:
>> - the code could be removed if there's no progress on either changing the
>> RISC-V acceptance policy or ratifying the spec
> 
> I really do not understand the issue here, why can this just not be
> merged normally?

Because the RISC-V people only want to merge code for "frozen" or 
"ratified" processor extensions, and the RISC-V foundation is dragging 
their feet in ratifying the hypervisor extension.

It's totally a self-inflicted pain on part of the RISC-V maintainers; 
see Documentation/riscv/patch-acceptance.rst:

   We'll only accept patches for new modules or extensions if the
   specifications for those modules or extensions are listed as being
   "Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
   course, maintain their own Linux kernel trees that contain code for
   any draft extensions that they wish.)

(Link: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/riscv/patch-acceptance.rst)

> All staging drivers need a TODO list that shows what needs to be done in
> order to get it out of staging.  All I can tell so far is that the riscv
> maintainers do not want to take this for "unknown reasons" so let's dump
> it over here for now where we don't have to see it.
> 
> And that's not good for developers or users, so perhaps the riscv rules
> are not very good?

I agree wholeheartedly.

I have heard contrasting opinions on conflict of interest where the 
employers of the maintainers benefit from slowing down the integration 
of code in Linus's tree.  I find these allegations believable, but even 
if that weren't the case, the policy is (to put it kindly) showing its 
limits.

>> Of course there should have been a TODO file explaining the situation. But
>> if you think this is not the right place, I totally understand; if my
>> opinion had any weight in this, I would just place it in arch/riscv/kvm.
>>
>> The RISC-V acceptance policy as is just doesn't work, and the fact that
>> people are trying to work around it is proving it.  There are many ways to
>> improve it:
> 
> What is this magical acceptance policy that is preventing working code
> from being merged?  And why is it suddenly the rest of the kernel
> developer's problems because of this?

It is my problem because I am trying to help Anup merging some perfectly 
good KVM code; when a new KVM port comes up, I coordinate merging the 
first arch/*/kvm bits with the arch/ maintainers and from that point on 
that directory becomes "mine" (or my submaintainers').

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
