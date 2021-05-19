Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE7CC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 12:47:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FEE2611BF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 12:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FEE2611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nObZ4eN51cmgp8TnU/L4BXYKeaIu1wbc0Emmls14Lr4=; b=is3iBSy9+l8AsJye6s/tX3egr
	Ohwwd7hIz7ZzramDFZM7XFfvBrHFBA6GJnAxtqnTy8GXGmQW7CgCNI4GZfoSa9P9OzOLXQe8WDZ8Y
	sIBP6h5kfYzFxvdH6nSPXPz9DhPYo6slHxZafo26tsIdzbcqP01R1VqMVCNy5931dod1XssmN1Uup
	UIdm6XVWLrCEWVjQN8cRBrIDLu6DDONVf4FLc65WtOMAtRpaQlph9IPZXpixslD5xVCAQQ9ZnoKzt
	4EGLhZ6RQF6JG9p0nOU0uwd2WQY9jGC+qkh1S44fs2MgFVtbu2E00sMZvFuw2HEJBZpmSrpHlFMah
	ohG5nGEdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljLb4-003xTo-Ld; Wed, 19 May 2021 12:46:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljKE4-003jsT-MF
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 11:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=NWPwTLXUbkkuBeNGwn+3y597gm6t7tmE54rpjMpE4pA=; b=2tRm7yehw155Ee3MBrbceTdskS
 JawxL6uHDiYdSLH2w/fLgzs9MvxsHSRdC0z1GagqKtI/6oJ711MPHvnyKHZeed0LpE7jfPPnADsoS
 4rsPzdRnEEboB0ORZzLmX1HjPdRVTbKoNaLalOrEEGmtQbZhZgn8n4fM/1aFSocvR4hIbIGsIbhZC
 Su/2dO5s4a5o4kERLN3q1psAXK2ncwXel/j7CVs5Vdhqus4AgdHrMiya7GQA1SavrZ/+NiDOVDlC2
 knQjt3QpftoxLh0W0QIJiGSrjwNJw7IFGuNemYrRtSxnNridWBv6nUwr1bTQngQmZXkzKvn0j6n0l
 cdyIGNDQ==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljKE1-00FOl5-CI
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 11:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621423130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NWPwTLXUbkkuBeNGwn+3y597gm6t7tmE54rpjMpE4pA=;
 b=RKWa2iA9rxg69RsfOxR9jwKscMv7Fhob28ukgfKT56LqXY+LuSIfkSuM7TyJgnF/l48eU9
 gQ8jEjZQenGDyyaK0IkqOulyzt0ePcT38Edurz8qcswlmtKsyBS3OTBtICpxUG6BIgkNkK
 FnhPQaZ1KwVtz90da/4f05znrC04xCQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-nl05T4yhMJaAbd-i3XTgxw-1; Wed, 19 May 2021 07:18:49 -0400
X-MC-Unique: nl05T4yhMJaAbd-i3XTgxw-1
Received: by mail-wr1-f72.google.com with SMTP id
 a9-20020adfc4490000b0290112095ca785so1799785wrg.14
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 04:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NWPwTLXUbkkuBeNGwn+3y597gm6t7tmE54rpjMpE4pA=;
 b=U9kurZfsjttxWXGflXWGS0jHb7jE8vC9tpgqRE00AoXAE+X9y9xm10uxfSwwiFcw5o
 c3kjFWCaz8RZWRErRDIfHODpTc69xXlH/CrjDdlLZGaA5yNQrV0NxCl9hV7kuq46Q6w8
 vPEfz9+Cb4k50qBVc+TliQGxv3qgNVv6SAzZsKaKMsmbTiq5PSLNbnP1JBdWBriUh/+P
 HGriRBJShxQ+n12pORdNlc6gkyzJjRFN0XiCfRNo7Z8hvj2dmmWbiIWuoyMl0x7stRmB
 Q0NEwl0GTdHYzD7ta9xlBB4ivKlb+Yt9s90AMzuEMnvfpOpnNQJLeTDtesDNtXmL0LWC
 KjDw==
X-Gm-Message-State: AOAM530dubd3BRIegTK4PIkOIXf/2cPFsuBo0b28VK1yRuZi8C4UUW/O
 bXJRegqRfwTbrKDIDdImAcSWDLlXeOVV0L4wvzyy14ovnlkEoOi2+xUcpSIyC6ANr2QVN25e25Y
 vSmiSdq8hJDe2yFbpUWhxKUw87p/4
X-Received: by 2002:a5d:6910:: with SMTP id t16mr13720345wru.416.1621423127667; 
 Wed, 19 May 2021 04:18:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsKGojU2DgZBTVi6QJ5uaGR/qngB2I/7EjHlNBsabqXVj4gNUE+e0fQBwiJa1DS8Rsi1PZLg==
X-Received: by 2002:a5d:6910:: with SMTP id t16mr13720320wru.416.1621423127405; 
 Wed, 19 May 2021 04:18:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v10sm28926558wrq.0.2021.05.19.04.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 04:18:46 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
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
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
Date: Wed, 19 May 2021 13:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKTsyyVYsHVMQC+G@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_041853_524272_F9F31E1E 
X-CRM114-Status: GOOD (  21.97  )
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

On 19/05/21 12:47, Greg Kroah-Hartman wrote:
>> It is not a dumping ground for stuff that arch maintainers can not seem
>> to agree on, and it is not a place where you can just randomly play
>> around with user/kernel apis with no consequences.
>>
>> So no, sorry, not going to take this code at all.
>
> And to be a bit more clear about this, having other subsystem
> maintainers drop their unwanted code on this subsystem,_without_  even
> asking me first is just not very nice. All of a sudden I am now > responsible for this stuff, without me even being asked about it.
> Should I start throwing random drivers into the kvm subsystem for them
> to maintain because I don't want to?:)

(I did see the smiley), I'm on board with throwing random drivers in 
arch/riscv. :)

The situation here didn't seem very far from what process/2.Process.rst 
says about staging:

- "a way to keep track of drivers that aren't up to standards", though 
in this case the issue is not coding standards or quality---the code is 
very good---and which people "may want to use"

- the code could be removed if there's no progress on either changing 
the RISC-V acceptance policy or ratifying the spec

Of course there should have been a TODO file explaining the situation. 
But if you think this is not the right place, I totally understand; if 
my opinion had any weight in this, I would just place it in arch/riscv/kvm.

The RISC-V acceptance policy as is just doesn't work, and the fact that 
people are trying to work around it is proving it.  There are many ways 
to improve it:

- get rid of it;

- provide a path to get an exception;

- provide a staging place sot hat people to do their job of contributing 
code to Linux (e.g. arch/riscv/staging/kvm).

If everything else fail, I guess we can place it in 
drivers/virt/riscv/kvm, even though that's just as silly a workaround. 
It's a pity because the RISC-V virtualization architecture has a very 
nice design, and the KVM code is also a very good example of how to do 
things right.

Paolo

> If there's really no other way to do this, than to put it in staging,
> let's talk about it.  But saying "this must go here" is not a
> conversation...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
