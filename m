Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F3FC001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 15:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6h1t6idgtIygUrG9z3Yeanoq1ddQCkPOphrHsHfvvA=; b=u36YVZcGU+IBcw
	GqTDNUkkHSdEAIjPBi1FeU07W55Qmh2VrvLRtRU/w64HlanMAIOyqZwGBTBhfYfdvNFtZzNCKmfQU
	8p0cIAegzllZW6FNep16Hkf2GJoDCCQsZsuZ3vTZmotknAp098s8ZwbudQ/CX5eQpREPRB1CJEUst
	bHlwXHePxru0dtlUJ40Ai/bGs+HiSNCu/a5eYVPKqlyLqekfGuXIdpl192zkO27rRSwFo9mrNsITQ
	vrtme5JWA7/wku56J7bjqEIboqmTQGOPem7aWgsxXzwzC7DmFHue5sK7PdTPl//GOS3MEP3vZYoIM
	WnalR+9iKF3sNl/pj4FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVHp-00GVNj-1K;
	Mon, 31 Jul 2023 15:58:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVHm-00GV6K-2l
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 15:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690819094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4fe6hbS0UUlu2v7dj0yh2sFuv9miEav3h35iCM+LzrA=;
	b=aUQq25fVqVWRGJcq14zax3WJWOdERpcRUDxaubSMjuwjb4gcPLAOGJbyxtCDwkniCKlJ3A
	34Ri8Ndk4IgrJ6ACHR9Izl47SEjcAo7ESiNsQo6KC2L9xOGNOPqpvy7Vg35yslyEbhA5Ms
	/snhZhML6Csfbsbcb9TXSuqmd5USAgY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-JzU865QnNiOC89_tng8RJA-1; Mon, 31 Jul 2023 11:58:12 -0400
X-MC-Unique: JzU865QnNiOC89_tng8RJA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-99bfe6a531bso158725266b.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 08:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690819091; x=1691423891;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fe6hbS0UUlu2v7dj0yh2sFuv9miEav3h35iCM+LzrA=;
        b=NtUP5VGhaA1RplzpWaGeh8JWv8FRSB55GfguplcQ+3R2gFENwRDRUjPhyaqbQTNAJ5
         5CDvoYGJ7Mns9Crq3pyn+1kdhX8tB/HOVXVx+jx673hH7vyZuZ8YFDS0Mp93frF+mvXX
         vFy4aHdNbg+EI3A9vX+qkDsHeKIM9mfIxoLpazwk1FA7gulHWWyBTSp5bUe98n7f+6lA
         gG3QC1Hrbq8nuM9mLaDxrQWpP9ViQ3kYnc01Zozx1cvrGgXyuc+VlFQk7iQeF6DT72RZ
         chvXiaLo4m0lS/ULHp4eio5H2SXRXb368dQTc/OgkcCg4SN8J8+7gUjq85QrM/ssYMtX
         Ulzw==
X-Gm-Message-State: ABy/qLbUijhlY0CcfphBSeNyfjdwEr3e1VVHb7R+7mj5JR9KOxIBBzvA
	rrggjH0Z3rkZGT+H+Gdd+4EGpgjrOukAcMlQAl2eCYOmBSlPZuJ3psaGQwpqdpT1dyICamviqQF
	lPUcpWULtlGpKsD4LbFkyD8QF0Pjq
X-Received: by 2002:a17:906:11:b0:993:f744:d235 with SMTP id 17-20020a170906001100b00993f744d235mr164022eja.6.1690819091658;
        Mon, 31 Jul 2023 08:58:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE4qcb0DCH0D/UYAr1wihMNcJs7WXVHvdtoT78VyrDkWJveoJUy2CwgTeDnMx93k7Ts+Uy66g==
X-Received: by 2002:a17:906:11:b0:993:f744:d235 with SMTP id 17-20020a170906001100b00993f744d235mr163994eja.6.1690819091362;
        Mon, 31 Jul 2023 08:58:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id f21-20020a170906139500b00992dcae806bsm6371003ejc.5.2023.07.31.08.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 08:58:10 -0700 (PDT)
Message-ID: <eb356cf1-c661-930b-2175-427a59267d1f@redhat.com>
Date: Mon, 31 Jul 2023 17:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Sean Christopherson <seanjc@google.com>,
 Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
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
 Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-7-seanjc@google.com> <ZMOJgnyzzUNIx+Tn@google.com>
 <ZMRXVZYaJ9wojGtS@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <ZMRXVZYaJ9wojGtS@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_085818_964582_8F6A85A6 
X-CRM114-Status: GOOD (  10.46  )
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

On 7/29/23 02:03, Sean Christopherson wrote:
> KVM would need to do multiple uaccess reads, but that's not a big
> deal.  Am I missing something, or did past us just get too clever and
> miss the obvious solution?

You would have to introduce struct kvm_userspace_memory_region2 anyway, 
though not a new ioctl, for two reasons:

1) the current size of the struct is part of the userspace API via the 
KVM_SET_USER_MEMORY_REGION #define, so introducing a new struct is the 
easiest way to preserve this

2) the struct can (at least theoretically) enter the ABI of a shared 
library, and such mismatches are really hard to detect and resolve.  So 
it's better to add the padding to a new struct, and keep struct 
kvm_userspace_memory_region backwards-compatible.


As to whether we should introduce a new ioctl: doing so makes 
KVM_SET_USER_MEMORY_REGION's detection of bad flags a bit more robust; 
it's not like we cannot introduce new flags at all, of course, but 
having out-of-bounds reads as a side effect of new flags is a bit nasty. 
  Protecting programs from their own bugs gets into diminishing returns 
very quickly, but introducing a new ioctl can make exploits a bit harder 
when struct kvm_userspace_memory_region is on the stack and adjacent to 
an attacker-controlled location.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
