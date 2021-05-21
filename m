Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5D2C4707A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 17:21:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E06B860E0C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 17:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E06B860E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMcTKQ1RFk8+WEO43Lx/s+WuouMb54CyTEYbrIPtOSM=; b=d8aAC+0N1zez/kvBe0OgZ8EMKv
	KWVS648ZEGJEv2eGRMfL49AgOttYV6BvhvsSKgb5JDyuSgYFZVS3sa/37VY0JJkLqQB2UoKpJbIEz
	CNXZOM5MQmnrPG/2VmMZTP3gUxxaRe7h6ok2mbbUGtDjZpdYawdDcmkOWB5ZyeqC8am+8uUJqUsFE
	l/f4WoBjt9MSW+7WbJz99Q75khkkFialTpePdZJYhyRlhmfc2JUXdLWk/EdKH5NcsCgMwv7X8yqKh
	kvB8CqNTOlnupMZvlMdZOswGKQzm0nZUh0Hj9l9SQcVpYDgTfbHk35yIN+4ibldvn77SsrP2R/Tnb
	db2S0Y/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk8pz-000TAv-5i; Fri, 21 May 2021 17:21:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk8pv-000T9e-BH
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 17:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=qwR/0GNmU1erDIzfTwdpHCjLZxYNU+OZQVJXmXfAYfM=; b=2nokiKDWuYXXgq6vqa0jvhUu0p
 UqbNb5Ve0HjS0XaoGmB5L/0CdtsDWzLo8GX7/1uJGOkoa3w5GOlO8EL1Enh4sKcYnna1yKBAFavnK
 NzEvYRkcU3QeFfTKwhvmlnM2DPnt89B/f8BdZaGoj7EH4oguZGiiQcqfYoDm825EO0DaO0yFUKnbc
 KNDCGOA8FZY6uWp3cGKU2ybDXJwu/swrmVk3+DOsnPEIhyGog/hjS3RCmiNE936kvI8H1z+Ovh24p
 WaG+0nI2Im0J0WUDDZX4lH9uhkG0d8HrFav2+7oq+TCoUGDQFUoAv/cIh1bLE0EfXVGv/46cCZLof
 SmpGR6bg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk8ps-00HJ8W-Iv
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 17:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwR/0GNmU1erDIzfTwdpHCjLZxYNU+OZQVJXmXfAYfM=;
 b=CCihWsLBld0vIX6h828dfgM5/f81LWzCA2y4ZGnswJP9BSZQEUYCfom/XO1YBZhPqG0vjh
 ebc7huFLriC6ALJcr/qZor1TQISZvfKTuy69k8I/9zPWVcpOt0VdmbW01yJIhl7NXSCKq3
 4qZg+o9LU5pBr9+nKZEfJapZaZY+/KM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-B-7Vu3JkN9KENkC7ssWGeA-1; Fri, 21 May 2021 13:21:16 -0400
X-MC-Unique: B-7Vu3JkN9KENkC7ssWGeA-1
Received: by mail-ej1-f69.google.com with SMTP id
 e1-20020a170906c001b02903d958aadd4fso4986991ejz.23
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 10:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qwR/0GNmU1erDIzfTwdpHCjLZxYNU+OZQVJXmXfAYfM=;
 b=FMTlzE88XNxIVN8Ik1butMiZz0b36lDnY/QvBiVYcAU2Pk591yzy/C+ib/52xXvyd7
 x4EcuexlkkMSMLS4QFdprXSs1ebFSsBcDrt+FK2jsm/up+3/ESF7P31QEpGsEPxj81jb
 BQbjamkLKvlwviJ1dVlF4VmwtOVzBQuwIbna0poxeo7FodcuuKVIA/BmjAMuZnRrUpe/
 3G7l+QDxMP7qtZ1SeNc7sXfYxwpuWtNm7AQoBaY/5uKLrISHVJSK0dAsCwTRT7haXaog
 LmVZamsEGMDC3ZVYSTx3crynI8oJMQX8bHNQnO2aUvzFHJQXOBXnU52xoTfCExQXUwlJ
 P4yg==
X-Gm-Message-State: AOAM533um5ABeFdXTX8fxfiaBBoIu0e/JRCB8B93w5up0riLXmlC5uQu
 4sCZZ5QETbdc4BCqgyx5XW5if5eQM6rMxQXTzkQgQkGp27F3DHPBl8vB+Waf/HdTkhNTSvDiYYx
 fdnARoOmvO/AblQ1EXW/awL+/R7WQ
X-Received: by 2002:aa7:cd03:: with SMTP id b3mr12350063edw.206.1621617675165; 
 Fri, 21 May 2021 10:21:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs1PPEtRit2YsbPl3fyEJzFG+BMaVTPI5cJbO+TcDqnJ8UNSbmnYU1JgZsPGIv6fh/e498XA==
X-Received: by 2002:aa7:cd03:: with SMTP id b3mr12350048edw.206.1621617675016; 
 Fri, 21 May 2021 10:21:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m12sm4079494edc.40.2021.05.21.10.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 10:21:14 -0700 (PDT)
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 corbet@lwn.net, graf@amazon.com, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <mhng-37377fcb-af8f-455c-be08-db1cd5d4b092@palmerdabbelt-glaptop>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <ff55329c-709d-c1a5-a807-1942f515bba7@redhat.com>
Date: Fri, 21 May 2021 19:21:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <mhng-37377fcb-af8f-455c-be08-db1cd5d4b092@palmerdabbelt-glaptop>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_102120_715150_E3212EFA 
X-CRM114-Status: GOOD (  17.11  )
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

On 21/05/21 19:13, Palmer Dabbelt wrote:
>> 
> 
> I don't view this code as being in a state where it can be
> maintained, at least to the standards we generally set within the
> kernel.  The ISA extension in question is still subject to change, it
> says so right at the top of the H extension 
> <https://github.com/riscv/riscv-isa-manual/blob/master/src/hypervisor.tex#L4>
> 
>   {\bf Warning! This draft specification may change before being 
>   accepted as standard by the RISC-V Foundation.}

To give a complete picture, the last three relevant changes have been in
August 2019, November 2019 and May 2020.  It seems pretty frozen to me.

In any case, I think it's clear from the experience with Android that
the acceptance policy cannot succeed.  The only thing that such a policy
guarantees, is that vendors will use more out-of-tree code.  Keeping a
fully-developed feature out-of-tree for years is not how Linux is run.

> I'm not sure where exactly the line for real hardware is, but for
> something like this it would at least involve some chip that is
> widely availiable and needs the H extension to be useful

Anup said that "quite a few people have already implemented RISC-V
H-extension in hardware as well and KVM RISC-V works on real HW as 
well".  Those people would benefit from having KVM in the Linus tree.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
