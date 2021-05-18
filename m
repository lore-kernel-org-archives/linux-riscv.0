Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFEAC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:17:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F23CD60BD3
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F23CD60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=re/pHtJuQ0mYzbFpBtSiaEgBWo5GqWnlPmL0q13mJ7E=; b=bxwZ/4d4RgHlF88JXCFiaQONY
	FsxpFoN0DeEhxZUciiBY1Q5YC1ty9YX0qxt7F80Ya3U84kcwd5pm0XaJSqIaJAOspSz19NF+pv90I
	0yuLvrThNfVQbkjK0tNPMhlREtXpIIfTb+nbLbTGxA4hG5DBeBEBv2JtQwDursBUxmtc50UTdeoBR
	CwU1zTSTy35ot2c8j3if1DaT/ybZ9vL7ljFcg55/skqt9IbT+jRmVilVTUrHMEwrdSG/SKWanCTK/
	OZXZuYXq3/C6EgJpYyB0z4Lf2wt1XlTcIetNEykgpriVqJSxzhFVoMpc2/FIU860FnyhAHkx3XQMR
	l3sRIRNdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwmc-000KGK-Iy; Tue, 18 May 2021 10:17:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwco-000HPd-9C
 for linux-riscv@desiato.infradead.org; Tue, 18 May 2021 10:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=dFkmeu2athwSt2LK0RUUi/E/grHFe/dKRRuvCpK8qJo=; b=cOVFHc938qesVzzbUzLYLjefZy
 ZijyFsWIrASNF+L8S4nM67qoas9mWam6+MwRt9efcWTadRW6Qslpt9XVIBo4+++TlGtXLoGcVyJe8
 5/hxpmto2z9qRN60O8xSpX2t5tqJjhen2Tp/C+WvcXibVuMu+AvTx7xpabgaTDnc1l25c+fCvt8F+
 69BSsGkyMT0k2xEZJ4HLuG/dQ2hJvXxVymqSFGHlQTu7QqhRmBP+rsTUrkWPBfkWA6MzMwFu3qyI6
 xB0JXkYbUq9r4iPI4KDTL6VCMOal1UrAe72Ey7MISzOk8L1WIFMs0IS6sZBms6bfbAFVtu7/Dm2h4
 LuFY5MUg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwck-00EXbX-Vw
 for linux-riscv@lists.infradead.org; Tue, 18 May 2021 10:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFkmeu2athwSt2LK0RUUi/E/grHFe/dKRRuvCpK8qJo=;
 b=gxDyXub6E2FHAH1ajjW9AsFdwlgRX02dDz2k9SIJUhNnhs8kEEdOL9xHfOn6x+J0u1zTUm
 EEAUAASgibvrepcVITsh7+Vu/UxUNy6+cEaQNV/s1OWRJ7xvXIPZ3sdwq5s9DBeCa4vv4B
 Oy9NFaQJ+NaaYac5negNVDJFgnmgChg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-9VR6ECTmMtGlhRoSFiSxqA-1; Tue, 18 May 2021 06:06:46 -0400
X-MC-Unique: 9VR6ECTmMtGlhRoSFiSxqA-1
Received: by mail-wr1-f72.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so5347574wrl.20
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 03:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dFkmeu2athwSt2LK0RUUi/E/grHFe/dKRRuvCpK8qJo=;
 b=QtGcAkbJ5NMNJO1IrIrINdaReH0ZcO8snabOgqgKCyxDZzHQWOfgB4gQL3m3uZA4Kq
 Kp8GMLaccxpbxJJf1uzHJfJSEnmyB3QaG1F9cUY7+pzqAsITXt4DN7648jYjVn1aIxYS
 ApXD6HeNatwpHGNS/TSa6eQ834ndHi0MRhQoF7Y2LtDVIjk+7Xh/EIHuas5/bH//xr5o
 K+33TYjbt30HeWgjARRqzJBGgplWGrP+NIcnqxP/Zp9awwq0YL/My19hXHc1jF4IoVh1
 Dp2gwAOkZE26U8a/kT/TU7HnwroyrJ1gxgDdf9PMpCSc3a+MOppPCQgz3oCwzqMc9m7t
 AWHA==
X-Gm-Message-State: AOAM5319BwXpfAxQcnhA9Lf4kl6KxVP98hhF8Ixa7JEOC/Qwi4AonWWG
 zadaIvlkd2hXz+Ay6ZnyxTIpaYBpe+bPvo/3UcBzW960ZcVHf1ZWFRlhjjkSWbupccniNiqdutO
 K3WdIxDB62XRnBKs+/93zcF+0X/Jz
X-Received: by 2002:a05:6000:1ac5:: with SMTP id
 i5mr5879841wry.6.1621332405357; 
 Tue, 18 May 2021 03:06:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiVxI2VqHM3UC3HkCv7YVP9ChZhf/paSvmhTbK/1R/b2aClM7EAkaKYj9OwIH5AzvG3tEX6Q==
X-Received: by 2002:a05:6000:1ac5:: with SMTP id
 i5mr5879787wry.6.1621332405164; 
 Tue, 18 May 2021 03:06:45 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64fd.dip0.t-ipconnect.de. [91.12.100.253])
 by smtp.gmail.com with ESMTPSA id f14sm8395872wry.40.2021.05.18.03.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:06:44 -0700 (PDT)
Subject: Re: [PATCH v19 5/8] mm: introduce memfd_secret system call to create
 "secret" memory areas
To: Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Christopher Lameter
 <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, "Kirill A. Shutemov"
 <kirill@shutemov.name>, Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Michael Kerrisk
 <mtk.manpages@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-6-rppt@kernel.org>
 <b625c5d7-bfcc-9e95-1f79-fc8b61498049@redhat.com>
 <YKDJ1L7XpJRQgSch@kernel.org> <YKOP5x8PPbqzcsdK@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8e114f09-60e4-2343-1c42-1beaf540c150@redhat.com>
Date: Tue, 18 May 2021 12:06:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YKOP5x8PPbqzcsdK@dhcp22.suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_030651_113336_06B21147 
X-CRM114-Status: GOOD (  22.40  )
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

On 18.05.21 11:59, Michal Hocko wrote:
> On Sun 16-05-21 10:29:24, Mike Rapoport wrote:
>> On Fri, May 14, 2021 at 11:25:43AM +0200, David Hildenbrand wrote:
> [...]
>>>> +		if (!page)
>>>> +			return VM_FAULT_OOM;
>>>> +
>>>> +		err = set_direct_map_invalid_noflush(page, 1);
>>>> +		if (err) {
>>>> +			put_page(page);
>>>> +			return vmf_error(err);
>>>
>>> Would we want to translate that to a proper VM_FAULT_..., which would most
>>> probably be VM_FAULT_OOM when we fail to allocate a pagetable?
>>
>> That's what vmf_error does, it translates -ESOMETHING to VM_FAULT_XYZ.
> 
> I haven't read through the rest but this has just caught my attention.
> Is it really reasonable to trigger the oom killer when you cannot
> invalidate the direct mapping. From a quick look at the code it is quite
> unlikely to se ENOMEM from that path (it allocates small pages) but this
> can become quite sublte over time. Shouldn't this simply SIGBUS if it
> cannot manipulate the direct mapping regardless of the underlying reason
> for that?
> 

OTOH, it means our kernel zones are depleted, so we'd better reclaim 
somehow ...

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
