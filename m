Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7890C47087
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 11:56:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8236961186
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 11:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8236961186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfBg8R0f2+c/j7Rga0xL2AzCuiOAd/NYd1XYco7642o=; b=G0LC3R5mw7CEhSx/CX7bc8kJFi
	kTJJHxmvQt6M3wS2EsGF2WKCKWIYa7/KJqYgP02Pd6wdzWtZKkKn1tBH9nZ9DqM7kqmU/0LCJyeJa
	/2l+pHeScBFfHXuCYyP4TDF4wDiOtGLDQbjI+XqFC4ggwwtf6n89KerSuCtyorgl1qSq2ipSECURS
	MI5OfFFWpI83a1D8ruk2yScZz7WLqgIIKztYTF3cWQ7aAaO8uNIkyzKcI1S25n9ORmrsIonznvQe6
	ymc81xZltAHBICtdJa/0UytJHdDutpXQid0UDIl+WoaIScZNnLJn/jPZOWJdFhsVr3XUZX4zbCZ7K
	KNikpfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmb5e-00F80i-Ic; Fri, 28 May 2021 11:55:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmafB-00Eqdl-Mh
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 11:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622201303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+Ay7W48graQkpCe/otQyiwWe4qMEErEsA0X00IJFpQ=;
 b=At+fPuw2uPGObJg8gW30MnWX92hemxbeyR1KKHPAknlM4IqKqeT120MnEUjqA0VwpD7XA7
 Qu5idoRFNgmIYzKiF3KuQKzyWdaJGQdYfZAmXHZeP5uXBRANTi3XpWeD3p9GApdpGcMm/e
 cqSmoFXXV61IQDJFkLluEd9Q/jcyoXg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-_GzbzzUmO7ChSM_uhq0LTw-1; Fri, 28 May 2021 07:28:19 -0400
X-MC-Unique: _GzbzzUmO7ChSM_uhq0LTw-1
Received: by mail-wr1-f69.google.com with SMTP id
 f19-20020adfb6130000b02901121afc9a31so917368wre.10
 for <linux-riscv@lists.infradead.org>; Fri, 28 May 2021 04:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F+Ay7W48graQkpCe/otQyiwWe4qMEErEsA0X00IJFpQ=;
 b=n/4MufamGs4mamY4C4+l4oTT9m1IiucEbKb63ck+unb0BFzXvV3UwLXvZUp2GkluMF
 5LVsqJLCNQZVM0evnuN+jglTgymM6/G0PW8bWKFthyjfS2ehP2afIp83b+CjWU2gWevw
 Bkxz/a2ZbPZmjyxPa6Rd9YbUKe1DkmvaU0iSTZDJJMYlSJkcRouHRqmLX2SI3QjeA7p8
 8pBSP17uPiGz7qKebmyw8HmYSzJiIThrpsN0GsK0JZKicScJyGjE6ZRphPtKvXG1KQK2
 50n9MsQ2C228ZocQxB2IxsZqDTk3jC7xET9i0BlJVtTptvbTdJGipa9uqSsr9go/7r3x
 TuGQ==
X-Gm-Message-State: AOAM5304QWDqxAndWKi7hYewDknrl39/9Y1G9mxGceGXlBMecniZFGTN
 gMDtzDY1QkIaIC/rDOXTxf6kLabAgGlW5oGI1XGiQiRwq+473aUkAQPtoDbmJnpCDUA66icM9Ti
 BQJS2iKuOorIUuide6cKuVKZERHE9
X-Received: by 2002:adf:82ee:: with SMTP id 101mr1901196wrc.137.1622201298604; 
 Fri, 28 May 2021 04:28:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ9E8Pn8b5lSM/UPFzeTTHWAfOsnqJtchlkeZymXvBz2mocM/OaUOFK9IimeGq/X+/kUr5/Q==
X-Received: by 2002:adf:82ee:: with SMTP id 101mr1901174wrc.137.1622201298357; 
 Fri, 28 May 2021 04:28:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id 62sm2301476wrm.1.2021.05.28.04.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 04:28:17 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
 <CAAhSdy3RFGEq0+ZWUjsVCsmR8EvQzs6JOQMRXt7+92wNnCE27w@mail.gmail.com>
 <53424413-4a31-7a12-759a-49e3f41f11a@sifive.com>
 <9f107eaf-cc6e-d554-c923-62fb317c4d4b@redhat.com>
 <YLCvdmwPrm/S/GKg@kroah.com>
 <CH2PR04MB70782F16D88C700AB621D1B6E7229@CH2PR04MB7078.namprd04.prod.outlook.com>
 <YLC211VUeTrUdo3v@kroah.com>
 <efa8b40b-4c64-4323-7070-223329a52872@redhat.com>
 <YLDNEbm+M/geZkHG@kroah.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: arch/riscv/staging
Message-ID: <e6160b1f-7e13-d277-1996-fe1fefb75a73@redhat.com>
Date: Fri, 28 May 2021 13:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLDNEbm+M/geZkHG@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_042825_902850_3CFEA5D2 
X-CRM114-Status: GOOD (  16.45  )
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

On 28/05/21 12:59, Greg Kroah-Hartman wrote:
> On Fri, May 28, 2021 at 11:37:02AM +0200, Paolo Bonzini wrote:
>> On 28/05/21 11:24, Greg Kroah-Hartman wrote:
>>> Ok, as it sounds like this isn't going anywhere until the spec group
>>> gets their work done, you all should just wait as there's no real need
>>> for any kernel code here either, given that there can't be any hardware
>>> made until the spec is finished anyway.
>>
>> There's need for kernel code so that userspace tooling can be built upon it.
>> Not having the header files in Linus's tree makes it harder to merge RISC-V
>> KVM support in userspace.  KVM shields userspace from any future changes to
>> the hypervisor specification; the userspace API *is* based exclusively on
>> ratified specifications and there's no risk of breaking the ABI.
> 
> The "risk" is the kernel/hardware api, that seems to not be solid yet
> given the spec is not released so I understand why the riscv maintainers
> do not want to accept it.

The key word is "seems".  We _have_ worked on making the spec solid; no 
one that has actually done work on hypervisors for RISC-V believes that 
it is not solid.  No work has been done on the spec for one year 
*because there's no work to be done*.

So the people who actually do the work are twiddling thumbs and waiting 
for the freezing of all the dependent specs (of which there's a new one 
every time I check, because the goalposts for freezing the spec keep on 
being moved).  And at this point probably waiting for hell to freeze as 
well.

Anyway---I understand that you don't care (you shouldn't).  Just from my 
point of view it's ridiculous that I cannot merge code that is 
completely standalone just because it has one file in 
arch/riscv/include/asm/uapi, and that RISC-V maintainers cannot 
participate in the community the same way everyone else does.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
