Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C822C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 10:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTAPtrdCXA+HJEiiwqEn48JERaz2wikb1OcrSxHkCZg=; b=mZZC5b6C+byeFW
	Qmseh11YOmaweBq6tJBE1c8EULNq+8HBIt6+K0bQmO7QwvXoudsKbUWbovFC+e/zQ/tvscZqcYgDJ
	NZ6Aer0pZJRRaF3OzBumu7mmGjKidJHCgltfwo8y29JwIs+e1BlQesc8tNVEvoqrmuxUT/gdU5NfZ
	KVOaxIRAHE0mrO24edbdp+7NgTAEHTdfx6pjHLyJSTRz6qIeUCBNwG0XvHlyUle8QJ1n9GDn+XXSi
	4/YjtaeRK2zu1jVCZCTOPW/3C4jsSJLN7fdUCVqr3GGjH7rSDyfGc6GZyo69OwrJflCHPPZfVNaeL
	6lnLkHWesxeHpNl930KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEqDp-00BiQq-QI; Tue, 01 Feb 2022 10:17:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEqDm-00BiP8-Tp
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 10:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643710628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rSMPibeU2/x9y1HGJmwIBX0MF6r0zdDZVn4ZSeYeqM=;
 b=KKHau7qAkDgCs2QivK4vOQkHxFS3EjzXXaR1GcNHX722bubn2gxChqU3vClnbFqJ4huZro
 Lq9mCZ9uivT3knumfWEcGiXEtMqEmuS4A1zcRM6sB2GUR3y3dCNIcu/PhrXarQvtUtbyn1
 DMTXYAk3gPXAWQOiuZ+faZd5ADGB4h0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-Tyvgnl-YN665da6hs5lmsA-1; Tue, 01 Feb 2022 05:17:05 -0500
X-MC-Unique: Tyvgnl-YN665da6hs5lmsA-1
Received: by mail-wr1-f70.google.com with SMTP id
 w19-20020adf8bd3000000b001df887ad0caso4472777wra.18
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 02:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1rSMPibeU2/x9y1HGJmwIBX0MF6r0zdDZVn4ZSeYeqM=;
 b=j4s8XufSdkEpIGsxMx49NmRdjdUcaqOuwwWJozzCl0TMLYJ7AOTel7S4x8tjlWojbi
 c+aMnSCutab+Ql3w1j3Q1lcQsUmTQdf+Nvn8nYHCAjXNfKDqXo3fT6rmk4Cv8FTa0TeA
 S9zEV0vMltbSisDda+PYc8NJRI7b2iPWY/1bw2APHQHdCJSFQj8Wk8xFcuC2Kwff6f2i
 hbdhOJ7U7/18zpSWV39XokioB75oGTCCjXDhreCQQnfr40osSO6XjySKKT4p867IvFeU
 Nt9MK2bQoz15tkbpuNUVpT/hBpjeTje1rwUd1jGy1BmiQXEgorWatfzHbP2gbffPjukh
 BDsQ==
X-Gm-Message-State: AOAM532OGbfF3Lx93unXSwv/NGBIDfhHe36KdE1B7u196veCfzKk29rE
 v0k2Ul7PiqXbpWgQtaI4Vz1tqhacHfcF3Lp0KNwJjpJHKwESYgg/K0Ta+gf0l0AekJHx4pax1+0
 WPBLUrlS8dDOYSnoDhnLnG5eaR9HK
X-Received: by 2002:adf:f54d:: with SMTP id j13mr20271528wrp.596.1643710624126; 
 Tue, 01 Feb 2022 02:17:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW9cnbVOET7eNHaJPpg1tW+PwHgA1p1BZnH/wRYWshALkMr1QDZjc+KGZLPaL4fKlWIFXhpA==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr20271503wrp.596.1643710623856; 
 Tue, 01 Feb 2022 02:17:03 -0800 (PST)
Received: from ?IPV6:2003:cb:c711:ba00:67b6:a3ab:b0a8:9517?
 (p200300cbc711ba0067b6a3abb0a89517.dip0.t-ipconnect.de.
 [2003:cb:c711:ba00:67b6:a3ab:b0a8:9517])
 by smtp.gmail.com with ESMTPSA id p2sm1600619wmc.33.2022.02.01.02.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:17:03 -0800 (PST)
Message-ID: <19907f0c-4d83-4d85-4233-f4ee727574a0@redhat.com>
Date: Tue, 1 Feb 2022 11:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
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
 <YfeARpenqPii1WQH@localhost.localdomain>
 <3be2e20c-f0b9-c080-adf4-b0e17c046eb0@redhat.com>
 <20220131094041.GA15392@linux>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220131094041.GA15392@linux>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_021711_065747_9D158B45 
X-CRM114-Status: GOOD (  20.25  )
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

On 31.01.22 10:40, Oscar Salvador wrote:
> On Mon, Jan 31, 2022 at 08:48:54AM +0100, David Hildenbrand wrote:
>> Hi Oscar,
> 
> Hi David :-),
> 
>> Right, and the idea is that the online state of nodes (+ node/zone
>> ranges) already has to be known at that point in time, because
>> otherwise, we'd be in bigger trouble.
> 
> Yeah, I wanted to check where exactly did we mark the nodes online,
> and for the few architectures I checked it happens in setup_arch(),
> which is called very early in start_kernel(), while driver_init()
> gets called through arch_call_rest_init(), which happens at the end
> of the function.
> 
> I am not sure whether we want to remark that somehow in the changelog,
> so it is crystal clear that by the time the node_dev_init() gets called,
> we already set the nodes online.
> 
> Anyway, just saying, but is fine as is.

I'll adjust the first paragraph to:

    ... and call node_dev_init() after memory_dev_init() from driver_init(),
    so before any of the existing arch/subsys calls. All online nodes should
    be known at that point: early during boot, arch code determines node and
    zone ranges and sets the relevant nodes online; usually this happens in
    setup_arch().

Thanks!

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
