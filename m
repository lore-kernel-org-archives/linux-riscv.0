Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD50C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 22:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZoPAl+DJrLxsdNZnbCIlBVJ4Was7Hj0y0TKWqCt4MM=; b=gxJLJNZZ72xI+U
	yZNt1imeXznexUd3tkU4rzqLwci+DUz2zRLnnkZvq7PTPCalimWlxctY1HM2d8W6ZidzVin4NO2FA
	vs0Pwan6tOpHAVBsDi9QbY8q2tB0LOubpiaWEAyKDMN7o3szVpQDcXMy2zWzcuF5GbIcikUsFnUue
	qx+nU6a8D5QARmUSzt5Yu1dsjYTWhobRT6jxu4XslVQkmbFIlItt2p7BnCrUkm5jBjBQml99bo5RY
	uG3XjsR+Oho1ItOUAy0TPPWbl7A/wZ/UMIHW++zF9kftOkdbCTyZ/1I9dtW4Viyh5KG/9xWbu6V1a
	lVIFG/UwQ+hGDYA9WcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rd9-006mz5-85; Mon, 12 Dec 2022 22:50:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rd5-006mx4-ON
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 22:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670885434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SyXP7MS8bTF3RbvPik+WjzHwHuSSdP6S+AJrUdi5oEE=;
	b=J18LPgwNBiW1SMeSUrCZEdWKTjkBiaoWbx02W4Q104gaku8xXiM1xHtTOKeDvmtBAs4nvk
	gCzB67quGzeIdysB1b1xifOrz4VzmMUOlQfxrxr2zNQbLIjuBR34tVp7FKNo4sVSTQDOre
	hY7YHqVGcHItW1qmiBbNh2S/wPntzB0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-ryyk82_IMPCo-hvOJLT0gw-1; Mon, 12 Dec 2022 17:50:33 -0500
X-MC-Unique: ryyk82_IMPCo-hvOJLT0gw-1
Received: by mail-wm1-f69.google.com with SMTP id o34-20020a05600c512200b003d07ee4a667so57183wms.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 14:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyXP7MS8bTF3RbvPik+WjzHwHuSSdP6S+AJrUdi5oEE=;
        b=vUEEZo6BV7eULWOcf+YVQtnK3UVOum/Y9lz19F+MJt1Ltf6WylfOgj1WNUv6lIjkeU
         eyeL1Ji9fUiRxo6P28T4Vutf2GP4e2/Ss85Crz07RhN5+UikwViI/n8YBIWqWU09N/g5
         3I3QxBTolvy9/8UajyD7tqzV0oh3bB+dTdz4PtE2vvIhA8zk5Gi8UFq82Hn64jvmgaf+
         W1elAQks2bICOdZYujon5jxwJtKi9ndVbQqjmKux7ufuAfNMLIZmWWAqBnHpvpCqkm3m
         2NglpgV/TD2K+71T2ihQN/55O0z75WjgN+JxeHYNrNvLi5MRb6VIE9RTXud7a7QGE+xC
         Ic/g==
X-Gm-Message-State: ANoB5plBTC7yAsgcGIa1T4FdinKQSTPh+1VtPTR5V4f8GXcgEEiQqqMP
	3noybrjTyOfjxn53o8AvVA/IveR0x5HTLWOoOzjIlYe5lJdu6wgRWIGTyPtPiDFYFaVFHqhgYL1
	DviQ4VhzXCNCIifOulHQo4gDewTIt
X-Received: by 2002:a05:600c:4147:b0:3d2:2904:dfe9 with SMTP id h7-20020a05600c414700b003d22904dfe9mr2900906wmm.21.1670885432385;
        Mon, 12 Dec 2022 14:50:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6IZI0JQ674vEsdHgG0GiqLautfRb0p9b68d9OO4rhlD9rOnbnd3mXqInAe/GEdBqLbG8sv0g==
X-Received: by 2002:a05:600c:4147:b0:3d2:2904:dfe9 with SMTP id h7-20020a05600c414700b003d22904dfe9mr2900870wmm.21.1670885432160;
        Mon, 12 Dec 2022 14:50:32 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id n9-20020a05600c3b8900b003b4ff30e566sm199780wms.3.2022.12.12.14.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 14:50:31 -0800 (PST)
Message-ID: <01cb4882-7a06-176f-7d55-f80cca300ffd@redhat.com>
Date: Mon, 12 Dec 2022 23:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: Sean Christopherson <seanjc@google.com>,
 David Matlack <dmatlack@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
 "Yang, Weijiang" <weijiang.yang@intel.com>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, "Amit, Nadav"
 <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>,
 Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
 Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
 Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
 Krish Sadhukhan <krish.sadhukhan@oracle.com>,
 Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
 <Y5dnWgJ0ine55/hN@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
In-Reply-To: <Y5dnWgJ0ine55/hN@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_145035_917759_F23EEBF4 
X-CRM114-Status: GOOD (  14.95  )
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

On 12/12/22 18:39, Sean Christopherson wrote:
>> The notion of address spaces is already existing architecture-neutral
>> concept in KVM (e.g. see uses of KVM_ADDRESS_SPACE_NUM in
>> virt/kvm/kvm_main.c), although SMM is the only use-case I'm aware of.
> 
> Yes, SMM is currently the only use-case.

It's possible that in the future Hyper-V VTLs will also have per-level 
protections.  It wouldn't use as_id, but it would likely be recorded in 
the upper byte of the role.

I'm not sure if Microsoft intends to port those to ARM as well.

> My preference would be to leave .smm in x86's page role

What about defining a byte of arch_role and a macro to build it?


> Unless I'm missing something, e.g. a need to map GPAs differently for
> SMM vs. non-SMM, SMM could have been implemented with a simple flag
> in a memslot to mark the memslot as SMM-only.

Unfortunately not, because there can be another region (for example 
video RAM at 0A0000h) underneath SMRAM.

In fact, KVM_MEM_X86_SMRAM was the first idea.  It was uglier than 
multiple address spaces 
(https://lore.kernel.org/lkml/1431084034-8425-1-git-send-email-pbonzini@redhat.com). 
  In retrospect there were probably ways to mix the best of the two 
designs, but it wasn't generic enough.

> And separate address spaces become truly nasty if the CPU can access multiple
> protected regions, e.g. if the CPU can access type X and type Y at the same time,
> then there would need to be memslots for "regular", X, Y, and X+Y.

Without a usecase that's hard to say.  It's just as possible that there 
would be a natural hierarchy of levels.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
