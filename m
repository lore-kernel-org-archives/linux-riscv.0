Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D050C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQha+GyF1Xp5GSRFzG2AuY8UYHF6HpfUdPsvUHo8H1I=; b=OkpnUGz/qB6maf
	pBykGK41/RXJeuycI017PfYJcq9qq8WaEWkVC0kvDW81Ri6OHsalK5q/y6z0dLsYqnC6BVTpAuQeV
	RHFQV/MPq9//El+cihRkf0VCJaGtE1Hh9r7Q/sAhHt9CViNbXY6gBfpusR3YbgWe0Nx/5z2vAiBpy
	NC8w2dumFDhYirj4qOj37rkgfdjYNt0TjA17a/3W5+V+9UMC1BHC0G6SpQJ1l3K7YAhFtcDGumzFs
	gyLF9zNowQySwC+wIGfQeLGJ/0H5c4j2Nn8N8NcxUq+8UHcg1CqiwkJS/GSLOe8qKdWWN1yJDqczA
	JUcYT2fc3lbFChe2jvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFFxQ-00FNyE-12; Wed, 02 Feb 2022 13:46:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFFxN-00FNwo-5k
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 13:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643809555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxruncnGKSYEtQADjLUNkNWhCcGBbzpK2sbDwkeQUpo=;
 b=IvlHLOIoAfjxqUryG5VtmgReaCtzLoMtgEAAKndnl8Lqi914pDdVatgXRntOsQovBp53GE
 EyeC3I9hFv8V8pRcIotB0VS/+D0GazCr7QtuFhOA16z9du7/fUdOXcleb1D3uDxp0yBjcv
 uKzYQh460kzzs7wa0ybeaECp/Y3LALQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-14e-4-tzNZ-lIKzHumjObg-1; Wed, 02 Feb 2022 08:45:54 -0500
X-MC-Unique: 14e-4-tzNZ-lIKzHumjObg-1
Received: by mail-ej1-f71.google.com with SMTP id
 rl11-20020a170907216b00b006b73a611c1aso8129882ejb.22
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 05:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YxruncnGKSYEtQADjLUNkNWhCcGBbzpK2sbDwkeQUpo=;
 b=FGjJIRPHxkB/v3hXoXZJmn50Dsb4Whn25xfFraXfQXTibRMzyAMaJmFevFL30a4Cjc
 8KHELb0fzoPbnX/Ds72PISx98ndmjab+7o7qfwzxPvxvRbLeKtd+btuPtuIwAXLYuXwa
 bwWqu4Yjq2r/SBQw+JbilcmocRjHjj8nMP30znzGatrZaLQk6ryhcghHGGstqmLi3Mj6
 4NzSfhp+alz+R/J0xv2jH0kSSDiRnsRcAVyHD5M8FGheD2QRzsexBGYqvYdbcJRglZvm
 G9J9kYot4jK3RIY6aHBivHD6b6dq0i/V9wLVjjj/Pqd3koxJ5umD4TUquDRhgb1A0Nn2
 dyZg==
X-Gm-Message-State: AOAM530DORROC2UV1Af4U6xiFtBREc7/I8P3T7IRfs5V3zbhqQfJH/EB
 UoXa2iDOJaW4TQCr8+pP9RN3WQ5YsLa366d6wzLEWwu4Lo2lEbo3vbY+bFRfAdBQ+OJyX5d8cqi
 zR3RriYq52DMDCADYaajkpyC1YyKw
X-Received: by 2002:a05:6402:5248:: with SMTP id
 t8mr30084263edd.14.1643809552839; 
 Wed, 02 Feb 2022 05:45:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqE4L2UK0676VaeKIuCkwGMt3tw/zzsCSLR83dbtSZbWUp25WGEt3s5690JhdDTieh82ha0w==
X-Received: by 2002:a05:6402:5248:: with SMTP id
 t8mr30084241edd.14.1643809552570; 
 Wed, 02 Feb 2022 05:45:52 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:f800:a55c:e484:3cd9:3632?
 (p200300cbc709f800a55ce4843cd93632.dip0.t-ipconnect.de.
 [2003:cb:c709:f800:a55c:e484:3cd9:3632])
 by smtp.gmail.com with ESMTPSA id z8sm15746580ejc.151.2022.02.02.05.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 05:45:52 -0800 (PST)
Message-ID: <c25ad11e-6700-3a11-1a44-f69b4a7fc9e2@redhat.com>
Date: Wed, 2 Feb 2022 14:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
References: <20220128151540.164759-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220128151540.164759-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054557_332468_5E9A142D 
X-CRM114-Status: GOOD (  19.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 28.01.22 16:15, David Hildenbrand wrote:
> ... and call node_dev_init() after memory_dev_init() from driver_init(),
> so before any of the existing arch/subsys calls. All online nodes should
> be known at that point.
> 
> This is in line with memory_dev_init(), which initializes the memory
> device subsystem and creates all memory block devices.
> 
> Similar to memory_dev_init(), panic() if anything goes wrong, we don't
> want to continue with such basic initialization errors.
> 
> The important part is that node_dev_init() gets called after
> memory_dev_init() and after cpu_dev_init(), but before any of the
> relevant archs call register_cpu() to register the new cpu device under
> the node device. The latter should be the case for the current users
> of topology_init().
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: x86@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

If there are no further comments, then I'll resend as !RFC with a
slightly extended patch description, testing at least under arm64 and
ppc64 as they are relatively easy to test for me.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
