Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A03C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 17:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaZLe3vALCq973kBBSI4CB18EFe3fv302bGBW43IfGg=; b=fHZwYLyrnNx9w4
	ZuVT54SQSOS8TO9hTtMRaO2Q0MPI8w7F1jxz5/iGehyTfjjDy/oJP0pwkP4hDDU016nTlEp7BOuwu
	6XJ0ZYU134rgNdapsAtaLhGvqoiCjS8NyPMQxqucRsxPPO/IbzIfdwihwp7jwdMC9T19+DFZvhCnB
	OC2qn/f8bGvoavWcVGcWX0JaUYXH6AcSUP4WVbWIQ4z01UrDtoVy+ur7n9z4gXCJxtSrp5HHWxwmI
	DNshjBOOMSoWYaYfxvdN7waSrJBmQSzSzBVBecgWtcUpJRmMm3H/J6NWe5INWf0FAze0LVvFVy6xS
	6CitYMJ2OsQxVIW9dB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAj1-008I1V-0A;
	Wed, 19 Jul 2023 17:12:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAiy-008HzR-23
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 17:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689786747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkcPX3Osb4OA2D5IidduaA2zXjGkNlWKrQ0mhSge49c=;
	b=cGNDIaXhy7D+wLcAs5V5bHHj1KtmiHXpUMKPj8yIL+qFNzUKg9BDcm8qudPemQXzVI56g8
	eiIl+BVoCpZnuGOvxvWte14Nb18fJEU0Y99U0B0KwxLr48W92mjnhkDjPob/WrFQeWLG8X
	ZhkYqPcThKe78TPNpKhO77KNmmfvTzI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-7o7y8y-UMy279FUJzqz3WQ-1; Wed, 19 Jul 2023 13:12:24 -0400
X-MC-Unique: 7o7y8y-UMy279FUJzqz3WQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-987e47d2e81so419115866b.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 10:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689786743; x=1692378743;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkcPX3Osb4OA2D5IidduaA2zXjGkNlWKrQ0mhSge49c=;
        b=aFmid4vj03c452Cy9p0S3zk2j3iVKM4fXyhU2Pw0WfX4qKgAONda/Uj3BIJGjYfiFt
         qhLTOflKkDkZd5yp2Lo7hedbNL6hCQut93+FO2vVCe8npWmyWZPF78eyJXbqFzyUOtco
         zoKbbVfqbM6fMcBbwbEWnTKhiz5p7F9rWtKD2G/TPBBEgc0dUk1gYKZTEswWMsxgXBX5
         UwDkBc0JOsOHf8s+bObxWpCf0TKnnPbdWtRBH9RT/FN1IiPJl0BTUthXfBSl/gswWL9C
         JaMYFnSyipqI4WUgF+K4pmgzF6TQbbRZLtl/2KucNU+1zlnLAqkol6IdcKfuIToRJcJw
         q3tQ==
X-Gm-Message-State: ABy/qLbnPUgSNRfSn899x0fxsdBFUw7rPvOkuo8XCShjK/A+xeV2gN5l
	IzzoLeMdKF9rv1sJu/WYdVlR951WtbEw+YYENwlOg1hfOefuqlMK1ONIUwe0BvGQMgbEz+OPrPX
	voUD9lZkWb6VCVmb7OKftaJPW577V
X-Received: by 2002:a17:906:d84:b0:994:54ff:10f6 with SMTP id m4-20020a1709060d8400b0099454ff10f6mr2451586eji.30.1689786743718;
        Wed, 19 Jul 2023 10:12:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGz54zGhPvYMbmpFt53PQK6LgNX37cQEB9yNTieid5ItMiwID6yFOylHPqQjVFsqfqQ8BKwkQ==
X-Received: by 2002:a17:906:d84:b0:994:54ff:10f6 with SMTP id m4-20020a1709060d8400b0099454ff10f6mr2451551eji.30.1689786743496;
        Wed, 19 Jul 2023 10:12:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id h24-20020a1709063c1800b00989828a42e8sm2589100ejg.154.2023.07.19.10.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 10:12:21 -0700 (PDT)
Message-ID: <095133d1-ad3a-8b5d-d000-10b0b377c7b3@redhat.com>
Date: Wed, 19 Jul 2023 19:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 02/29] KVM: Tweak kvm_hva_range and hva_handler_t
 to allow reusing for gfn ranges
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
 <20230718234512.1690985-3-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-3-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_101228_771305_EB11915B 
X-CRM114-Status: UNSURE (   8.53  )
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
> Signed-off-by: Sean Christopherson<seanjc@google.com>
> ---
>   virt/kvm/kvm_main.c | 34 +++++++++++++++++++---------------
>   1 file changed, 19 insertions(+), 15 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
