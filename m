Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102F9C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVSpRCFSAW9HLKCX+fuc2kho6URoghNFy2F9tY41aEg=; b=uV1a4YKXWVKZbQ
	KjZcAtLkpmFTrSCW8jAFZudAceLG13lppufZjWtQ4mRmgxofN+svbTIhk3Ns46UV42wuDOhySEsvJ
	4AaqRbaTxq4yfB+7Br6r+801bRGZRVV4tp1qv2XK5rcqmPR+ud4EXRiL4GnPhTcQS3VQ6QH3ES42K
	OCRyKATadxqJoln0ZJWV+guWZHGwSgfGstLVObo/5+qf6zmJ7lMFnj6vY+wUuK2xJ7qihk9yfPCnP
	ahNLqUt1mGT+/KcEfF+MuGlLMLAzIq2GdwqfJvz+xok3uh/MdFqeNUpl/5SWmrri76eMIwYc6CqBm
	tB1E0wtmI+9HFpBAqZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPQ5y-00422i-2e;
	Fri, 28 Jul 2023 16:13:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPQ5w-00421E-0U
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 16:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690560814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Dyh7+qatvQDKM5qDRHq8YkO5TCQeLww3uN1vYmzEUU=;
	b=JDkY0x11DPue2B7zgbfvSTctHF2nLb0vlVBbmrzahlW4PPQyOD18U+2YNhtq6XCY3cpDox
	+6hckE6pu3MDwQicFHao3ndEeD7uJvlr/XM9YToF9mW4G0CdE5PP80OYUj2nm15r/mXEvd
	VcZYhlvCMURE3r44tYduQe4spk5w0Z4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-iTUXSxdWO0KpzM-ZcroUjQ-1; Fri, 28 Jul 2023 12:13:30 -0400
X-MC-Unique: iTUXSxdWO0KpzM-ZcroUjQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bd6ea0d9eso131539866b.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 09:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690560809; x=1691165609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Dyh7+qatvQDKM5qDRHq8YkO5TCQeLww3uN1vYmzEUU=;
        b=SqhNY7PRhRyVFTpJPdY+esjOG+037JWcpkKE+y3RUEWsVbdIg4+RTVirBWB2L1G7Q7
         ZMa6I1DoEQi8Us3AXz0vTuWRZj2KbCycLE599scfu0CXE33+9GCpIGebrh8qa6dvAoyX
         DNrGxd+JG91vDuZhFIJRJe89GqDm8+w9C2HQyxPPTmxy0tu4L1lBGemd1+Y/I7vHpSBj
         A45uzfcKvl9sUfBNefat8AevrDdgbgUFOb17zNhtQSI4DUF3IuQVQJALHeL1H1kUd8iX
         3UOUZv82FzG69Gg88P82EsWtlwhVAuzHMduHIRYpSAzn1mM1xysl/26LNjQEVHhXmBv4
         I9VA==
X-Gm-Message-State: ABy/qLZayk5zyfMMrEHrB2vzF+pmnXwZjzZL6SlflLiv0NbFktWVTtza
	TUDn16+j7yCPG/7Pz2vFMw7ugrzQakpobDvATPXn5jrXpwegRG1Nf2HSTawskf/uFLGFPfNH3j4
	LE0kOeMGQfiajN3eeXYNb5pBIAJg9
X-Received: by 2002:a17:906:5354:b0:99b:efd3:3dcc with SMTP id j20-20020a170906535400b0099befd33dccmr1357349ejo.62.1690560809628;
        Fri, 28 Jul 2023 09:13:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHd2sX/AyGtIAscRR2p4pTksaGOsuCTBRQ37WpaEGChaEB1fcJtjozFJjrwhV4jFSHGD+pttg==
X-Received: by 2002:a17:906:5354:b0:99b:efd3:3dcc with SMTP id j20-20020a170906535400b0099befd33dccmr1357325ejo.62.1690560809219;
        Fri, 28 Jul 2023 09:13:29 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id gy26-20020a170906f25a00b00993470682e5sm2197928ejb.32.2023.07.28.09.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 09:13:28 -0700 (PDT)
Message-ID: <6da710cf-2bc0-bb6e-26f1-fba14ca767db@redhat.com>
Date: Fri, 28 Jul 2023 18:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
To: Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-11-seanjc@google.com>
 <20230725102403.xywjqlhyqkrzjok6@box.shutemov.name>
 <ZL/Fa4W2Ne9EVxoh@casper.infradead.org>
 <692b09f7-70d9-1119-7fe2-3e7396ec259d@suse.cz>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <692b09f7-70d9-1119-7fe2-3e7396ec259d@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_091336_278358_7D1CD776 
X-CRM114-Status: UNSURE (   9.53  )
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

On 7/28/23 18:02, Vlastimil Babka wrote:
>> There's even a comment to that effect later on in the function:
> Hmm, well spotted. But it wouldn't be so great if we now had to lock every
> inspected page (and not just dirty pages), just to check the AS_ bit.
> 
> But I wonder if this is leftover from previous versions. Are the guest pages
> even PageLRU currently? (and should they be, given how they can't be swapped
> out or anything?) If not, isolate_migratepages_block will skip them anyway.

No, they're not (migration or even swap-out is not excluded for the 
future, but for now it's left for future work.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
