Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463E2C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 09:25:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB670601FF
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 09:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB670601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZSL9SRXO6rSTj2aA0m4hWEGAkxAqNWvOCzPMmyQkkPs=; b=QLAcRI/ARWCvckurCl3pYNoqA
	hveJtxlDZr/BWXWvvE+kZHbz7E575+qsWzN0tKmJ9KcA0s8NKKU74Lnpg3EBwXoEo97PZEGCfwoaW
	1Oa3quF2iE+tJ2HPBK+Cv+axKfpqb38LCqZPfnfzP7M7+S0jYwQQeVWLYb8yiq+7ds66qFWQzj2BG
	jxDsl00uNaKsyfgkrOivgA5jOP+gWRjzHz6EnuXUzigrkGfKJARt+BsP+prDD47yeBSI8U7ubEMKb
	XQZphbPQ7RxbEP/TPMdBzAm8oNGFPQ32sU/j20Lra/ytU6QMIhToM5MAX+SNzWyiH/8UQNKaU12vS
	zd5kIkRYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRX6C-0067XV-8W; Wed, 31 Mar 2021 09:25:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRX3D-0066wh-UF
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 09:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617182526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVTROcBb9bzk8v36Iv2BqaLwng0q/XnAhHIMpKNn/Ys=;
 b=e3+QYbI551uZlOAmfzq1fW8kWg/waJtouvvtRfZHbDhLqel5lySX6q/dOvIXO/Ivy44cNv
 fwuxaT972sc2nXpJ2/tpLM4Eu8x+5LSQ2wvEIiL/VV8hk7fo0zAzrN1/IHd7bi8SKwq8b6
 NzqEeJ/omCCMUH6w/5tFlQtrTeCrFD0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-p_fEi9NXMXyyl4FbHQXL9w-1; Wed, 31 Mar 2021 05:22:02 -0400
X-MC-Unique: p_fEi9NXMXyyl4FbHQXL9w-1
Received: by mail-ed1-f70.google.com with SMTP id i12so775671edu.23
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 02:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zVTROcBb9bzk8v36Iv2BqaLwng0q/XnAhHIMpKNn/Ys=;
 b=D1HKyLPLnU2fuG5evQVI8rePrG1AAzw2rNppXzRtaSujiRTtaAM4LDciCu0rFbOyOg
 DC2p1+RN24Xgq9AdalbB46WO2Cba/XR93sKICvuI0MW/k0XMswxgTOCkAtRo34NOm/+d
 PMxvYYPm1txObhaC6N6v6ujR6l82YT8RbRbHBDQWZh+ohhwCkFLexk0ss13HMIOumzwg
 FCAykaMkWqo6WlS9MZfHm25J6DbLUz41ddp5pP9iFNPFBBfAT67yjcIdfgHi7aJRjHdn
 wwCLTaxNI/YZXs2Gwm9mg1RomZWXngAz5shQxM5E0FticVr8MMlVsnU/eJn183+ZHk1/
 9akg==
X-Gm-Message-State: AOAM53309jkoBF+679M44lBTpVaJmildVBjA21O3HHp20uO1cphq4QPK
 noX5bF74p3heNlOK10A6qSxa3qyd23hEnx4vsq498g0MZDFV6QLASRBXK+yIKGnXC+bLIzIYdQa
 jzEOSNN/tGKnuOMu0BT+LefN0FwBH
X-Received: by 2002:a17:906:26c9:: with SMTP id
 u9mr2490737ejc.520.1617182521410; 
 Wed, 31 Mar 2021 02:22:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKa9uTF2uTziE05IHjX/X7hZq3YmL9WZwLFu1Pz7aA1dpsCjRo6rR9QXD1luH8TZAUg/dkxw==
X-Received: by 2002:a17:906:26c9:: with SMTP id
 u9mr2490728ejc.520.1617182521264; 
 Wed, 31 Mar 2021 02:22:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id q19sm786118ejy.50.2021.03.31.02.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 02:22:00 -0700 (PDT)
Subject: Re: [PATCH v16 00/17] KVM RISC-V Support
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Graf <graf@amazon.com>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv
 <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
References: <20210115121846.114528-1-anup.patel@wdc.com>
 <mhng-a4e92a0a-085d-4be0-863e-6af99dc27c18@palmerdabbelt-glaptop>
 <CAAhSdy0F7gisk=FZXN7jmqFLVB3456WunwVXhkrnvNuWtrhWWA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a49a7142-104e-fdaa-4a6a-619505695229@redhat.com>
Date: Wed, 31 Mar 2021 11:21:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0F7gisk=FZXN7jmqFLVB3456WunwVXhkrnvNuWtrhWWA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_102256_401312_C033C27B 
X-CRM114-Status: GOOD (  12.51  )
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

On 30/03/21 07:48, Anup Patel wrote:
> 
> It seems Andrew does not want to freeze H-extension until we have virtualization
> aware interrupt controller (such as RISC-V AIA specification) and IOMMU. Lot
> of us feel that these things can be done independently because RISC-V
> H-extension already has provisions for external interrupt controller with
> virtualization support.

Yes, frankly that's pretty ridiculous as it's perfectly possible to 
emulate the interrupt controller in software (and an IOMMU is not needed 
at all if you are okay with emulated or paravirtualized devices---which 
is almost always the case except for partitioning hypervisors).

Palmer, are you okay with merging RISC-V KVM?  Or should we place it in 
drivers/staging/riscv/kvm?

Either way, the best way to do it would be like this:

1) you apply patch 1 in a topic branch

2) you merge the topic branch in the risc-v tree

3) Anup merges the topic branch too and sends me a pull request.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
