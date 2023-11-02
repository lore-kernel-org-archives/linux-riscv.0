Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D231C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbuIiR7P2q4g+XMx/qlikft0v59Ti7j2RClnwAU9N9A=; b=EjTPvmr7mW2kSL
	CZf0QxVyA+ch6dzOONi6OYIwI2D6eELIwp7+F9uVRKBBPjl2un/sRdxnEGzLkdkJ9qHEOu23nf9I8
	XKYwzrZoiLmFGCp4F4esrosb5EHWz+rl5lu4LhRs3VM7ET29FubT/sWMBCtduh0t6w1Ak9ZE8wU7Y
	eZ4t5sYYMdhCe4Acp3a+HfrWamLwx4dbz4rckChlRjUA3VVGmy5ihYhQzGxXYc0tAOgo+jTsxY9y8
	tRTXR9dZmFUyTpQNDhpti1omktSIGCoelXYibK+3wnWX56Svg11DngwdA1oTojNDWr5ckNUTBD0Vv
	IGwKjDn6C4+LrUeqpUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyVSU-009G8n-1C;
	Thu, 02 Nov 2023 11:01:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyVSP-009G43-35
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 11:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698922908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WEsP6UmyH+BX0JZ3F1lGKvqULOvcqKbb9QU0pxprrbY=;
	b=JSQ8ZzZRgLWbzhfCdaUcHK/rzyB19nqEoQFs4/2y4V5ys3awZbhIH8BNDepeMEPt+8tFSk
	Fi3oQZcmFiu3eR1EIq9NbXrQwgG0baZqr/JYUrKA2TMGoxhNNs2JXCkj+18sdeUMm1uZjI
	LcPrqAVKQQw1YrJpq2fTGWr6/NqlBno=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-JZzlUE_KPce9cM33aXqM4A-1; Thu, 02 Nov 2023 07:01:47 -0400
X-MC-Unique: JZzlUE_KPce9cM33aXqM4A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae0601d689so54684566b.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 04:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698922906; x=1699527706;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WEsP6UmyH+BX0JZ3F1lGKvqULOvcqKbb9QU0pxprrbY=;
        b=ApY4S48TKzMIXCXGtsliYZxqsBEIVzzjw9ZUVHEbwdMTSuzA4UlIjKtitKF6Eaad9E
         +NGoRcibV3DFCwsGNEMDPq678Ji5N5ilg4W9IBjVRxp06bkrvwTYJcstwxivOEBIdtxt
         3Le/hwczL2Axx+9x3hr/mSmrOZ00Ry+BRDJyZ72hvUPoht4BD0wkoTCHbXtvO8xRgnh/
         W/zGM3IuOiEA190hXix4iWdWO0EnnyTssjx6w//wmxxt+JipJIV1dqXK1QspY+LVWSh4
         O75F4hZutRs0oZshKozU2kadHchmA/w3swSDymYX1pML6QFiwLQAHP9twIuNgtQ6DkVk
         1/xw==
X-Gm-Message-State: AOJu0YzOIVGCl7Cc+yHGDD0A/ikIzly+SSfUahxueffbJgExo0+3mrCO
	QawQNbAE7TgL5TwOsIKUp1LbaRNj3F4qkJdj0L1h9CP0tKSNQFdVebEqLXvxRweIhhBQ/zD1hpJ
	0eEeJa0r2oUxF2NFyj5pID3N7DNvA
X-Received: by 2002:a17:906:d90:b0:9ba:a38:531e with SMTP id m16-20020a1709060d9000b009ba0a38531emr3519611eji.52.1698922905985;
        Thu, 02 Nov 2023 04:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr1MKwEsucdCPGHuXwuvbKOwjSvBNOm32t6vlzmUKLac2E5/jR4RLI2SEmoEufOHPDYy6Ibw==
X-Received: by 2002:a17:906:d90:b0:9ba:a38:531e with SMTP id m16-20020a1709060d9000b009ba0a38531emr3519582eji.52.1698922905598;
        Thu, 02 Nov 2023 04:01:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id a8-20020a170906684800b00993a37aebc5sm983006ejs.50.2023.11.02.04.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 04:01:44 -0700 (PDT)
Message-ID: <e6025e28-ea93-458b-887f-925eab7cf260@redhat.com>
Date: Thu, 2 Nov 2023 12:01:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
To: Sean Christopherson <seanjc@google.com>, Kai Huang <kai.huang@intel.com>
Cc: "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "maz@kernel.org"
 <maz@kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "willy@infradead.org" <willy@infradead.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "mic@digikod.net" <mic@digikod.net>,
 "liam.merwick@oracle.com" <liam.merwick@oracle.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Isaku Yamahata <isaku.yamahata@intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>, "tabba@google.com"
 <tabba@google.com>, "amoorthy@google.com" <amoorthy@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Vishal Annapurve <vannapurve@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
 "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
 "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
 "qperret@google.com" <qperret@google.com>,
 "dmatlack@google.com" <dmatlack@google.com>, Yilun Xu <yilun.xu@intel.com>,
 "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>,
 "ackerleytng@google.com" <ackerleytng@google.com>,
 "jarkko@kernel.org" <jarkko@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Wei W Wang <wei.w.wang@intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZUKMsOdg3N9wmEzy@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_040150_111468_8254D9E4 
X-CRM114-Status: UNSURE (   8.28  )
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

On 11/1/23 18:36, Sean Christopherson wrote:
> A good example is KVM_RUN with -EINTR; if KVM were to return something other than
> -EINTR on a pending signal or vcpu->run->immediate_exit, userspace would fall over.

And dually if KVM were to return KVM_EXIT_INTR together with something 
other than -EINTR.

> And purging exit_reason super early is subtly tricky because KVM's 
> (again, poorly documented) ABI is that *some* exit reasons are preserved 
> across KVM_RUN with vcpu->run->immediate_exit (or with a pending 
> signal). https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf@google.com

vcpu->run->immediate_exit preserves all exit reasons, but it's not a 
good idea that immediate_exit behaves different from a pending signal on 
entry to KVM_RUN (remember that immediate_exit was meant to be a better 
performing alternative to KVM_SET_SIGNAL_MASK).

In principle, vcpu->run->immediate_exit could return KVM_EXIT_INTR 
(perhaps even _should_, except that breaks selftests so at this point it 
is ABI).

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
