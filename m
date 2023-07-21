Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8A3EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAjIrX5LW9IwYEYTmUjVMfZ0I/AZauhEqaGuf8lnxIg=; b=3rV97wy/NX/NfG
	igTMFMnJfYg+xjp7eI07SZWc929aE1nogoz0oGi5/6bqNqlfWSpGLe+YP1cO1e4SPbmzk6eSxpjNs
	sI9zp2Hyjs/YG85098WrJ3K9gphq8ijXbFCBdLYGFzVpgxvFSS85FhtOOkPMeZwzqSipIGw/TbMlE
	ugFj1iYvJwU5wdtR6MEz7Qs9TRBfRtB1z6uWP9jt7o2rUcj5I4kKAFikNCQe9UwWh8E/YZL6tkB0i
	EEHuOWNBQLRc62Fqj1WEILkkjE3/M6wlZNSCUNHN54pB08bWe9UK8VHdNwRxbiZ/wuKUwg5dhAnGB
	l04a1Tug0RL4dDWyF+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrjG-00ENgm-1F;
	Fri, 21 Jul 2023 15:07:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrjD-00ENey-2W
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 15:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LT31EnQdwzSm3B5EwQJfjJehEaFosn84rDtB5FWxnI=;
	b=NbArCk/uVETr7FGx3n6NZP6Q+FqYZIGaM2sJynHi57b4KIobeOGnHYxBfHaUVs2SwlrZrY
	YmvLfGR6qTMk7mSz1820n770HRrK0mFMkJQG6q9S8yGna2tsolsOKc240wm7s4fuZV5+Wr
	ExPOSeCJE76J/bSvqxfKXq+GkwOD4gY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-e7VrRbXdOiuQhppYGUkDsg-1; Fri, 21 Jul 2023 11:07:32 -0400
X-MC-Unique: e7VrRbXdOiuQhppYGUkDsg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-51bef8bb689so3788865a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 08:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952051; x=1690556851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2LT31EnQdwzSm3B5EwQJfjJehEaFosn84rDtB5FWxnI=;
        b=dG2BY3QjRNhoRxz5UCZK8rUYhSUPjZ8LdPnSmDXY75r6/wMUS5uWcU0gt/tR0a8pFv
         g13KxxNG+rucFPY/yt+DQliP4ZvdRYuewLS/RSqNorHv6Udl+8nPQ53p5t58xNgYoUf6
         9ECTfb5wvds3BT9LBd0RFApfaQnlmqQz5H4MK4d2B/1AloxujZRxtabJkvj5miqN9a1u
         xDzIz/CftLdXmZOnZRYU/XhWwz80jwRKMEk9FEcz1T/eIwel6+X9KJjY2NLkn46Kk+0A
         Kn+TTGpAhUlugdr/NnhZ3PhgaIhd0ZBJJrVIhh+/fzXI+1XWV4JU+duq1v84RgEe02ff
         n2pA==
X-Gm-Message-State: ABy/qLZqR/leZktSoSsj1ApE1H/EkWNhd/sZEah2lZv1eWWv/CJ4n2dM
	drAjUnzdLAF2FecX536jpiPBh7l9nn3rJEhSAUwjOaJ0LcJ4mZTpVAYt5CS+JFqTPO8JMIwxljG
	r69lPboaGzLi/eKpJXO+UK1eY64jU
X-Received: by 2002:a05:6402:3596:b0:521:ae30:787d with SMTP id y22-20020a056402359600b00521ae30787dmr8297802edc.21.1689952051256;
        Fri, 21 Jul 2023 08:07:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEmyaXBPPcDeACqrampuhZk7coBp7sKkHctpw4dd03JKW9PMu58s3JgUnfUUPbC+bjZ7T2rgQ==
X-Received: by 2002:a05:6402:3596:b0:521:ae30:787d with SMTP id y22-20020a056402359600b00521ae30787dmr8297753edc.21.1689952050947;
        Fri, 21 Jul 2023 08:07:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id w10-20020aa7d28a000000b00521f4ee396fsm127596edq.12.2023.07.21.08.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 08:07:30 -0700 (PDT)
Message-ID: <84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com>
Date: Fri, 21 Jul 2023 17:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 13/29] KVM: Add transparent hugepage support for
 dedicated guest memory
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 Wang <wei.w.wang@intel.com>, Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-14-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-14-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_080735_895829_0A2D9FCD 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

On 7/19/23 01:44, Sean Christopherson wrote:
>   
> @@ -413,6 +454,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>   	u64 flags = args->flags;
>   	u64 valid_flags = 0;
>   
> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +		valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> +

I think it should be always allowed.  The outcome would just be "never 
have a hugepage" if thp is not enabled in the kernel.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
