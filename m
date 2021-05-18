Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0886AC433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:29:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F5F16108D
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F5F16108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=34YG6uMxU4ogkwb+Pn96e2rxv7IhJC5tWpfpyK4NiPs=; b=mum8FzPosd76LQ+jKzGueIjph
	Jo4gazcbsusL6JCmMWJoctes8Mpv3pD2wBHqaDvz4zXdWdO1wDtsPMye3/dK08TeSKAPQng73J+3P
	xVQ5c3d/ZqA0598VlIho6EmUfUc1LNalSmSioaJsH+ripd14fhh0g43AxoI2439wzNqVzmG7SV1l5
	7osFpe+UODVoIm0qzY4FRFyu1DnC7RWYtT0YSw2pdykbzHWJiesa0JBAYFypc9b6QnzKrt/R7Na73
	rSjAXkUWerGTJsIIbwJ6ldcIJOyvHplZwaS2WopkpbDkSCSu/S8OOo1k1ORB0M8JyOPCnf+0K0qnZ
	058Iti5ug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwyU-000NpA-U0; Tue, 18 May 2021 10:29:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwwe-000NMh-5L
 for linux-riscv@desiato.infradead.org; Tue, 18 May 2021 10:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Th9b0uelp+zuS5Dolk9edCcQodErGvwWmi6QbbSzCQ8=; b=xcSTsYObqqsyI3h815JUq7S7lf
 BUJ8rPL83YRaBp5DMP0XeIsISdUYSkDMfkJr+UHNQ51zu6y5qgwj1kAJemu/gnh7Lv7QYzuct6LJs
 Np6oBLAp6C1DqvN0ayt/5F3//Yz5C6lX8NzpjFnlUzAevwqUCsC5sRQSVj7NhtsUAK9P/3rwunLdB
 4NjMoxyih2rddPncvNHh3gxoNNa4+Gm/E9zf6L9HwgzpMlu8gxcrSwhSXTk7Z85GZjSViNz2HbLlL
 oNcxajeHkJRbSXxnLfjZgxowcdgGiHm1DqOBpjOMMZFwtw30b2N8E+6dHjztqZ8Pt9u/as0owUH3p
 X8z61Viw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwwb-00EZ0P-Bx
 for linux-riscv@lists.infradead.org; Tue, 18 May 2021 10:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Th9b0uelp+zuS5Dolk9edCcQodErGvwWmi6QbbSzCQ8=;
 b=URi9Ua7Tc6lEMq6no4Vox78W0PP/jkxc3q6km7Ba2NiTJ4nzxL0Fj7IsAUSJneaKmttOZl
 Xu+DcrTw60gx9SoNvWstLZ5m8sWc8mQt0HXE+QLa/fYnL43bYMNGqktHtc7gzwORG8uG7X
 2BQuBHMOmNZr0XWk6aBfWsVzDIU4awE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-e3PmckmcOh6-NrVkv3EfxQ-1; Tue, 18 May 2021 06:27:16 -0400
X-MC-Unique: e3PmckmcOh6-NrVkv3EfxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 12-20020a1c010c0000b0290176491efde9so392864wmb.4
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 03:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Th9b0uelp+zuS5Dolk9edCcQodErGvwWmi6QbbSzCQ8=;
 b=AuiCQUDvxSvxYJxlIKENn2Ij0QqggNqesC1iLvmtXbcgiJv5MmtDKGfguBNiXQjmBw
 CONgDJdQ+eHevmiBkN7ONHFPBGxS1/QPPp+CugOu4M6AaPeplAojUBtE5YM0nhrNuzVe
 ns6vgdb2UWZdiOtaiM3K+6LDWzzbwdzWGvvCLHmxegl0nmk4pEG4SS2QvK/1AJMgkTJO
 csaSbgm+gekrbiQ0f6zHiJ5vIRlTvWfU7nXhfZaWxiuWw54M6MS63ZxaErF5/qdcxSwg
 Sj1tFLqmzIBX7PwL/YJovCifVFc9L1aFBxPPqJDKARn8okFvrvxFnE6PiPiNN7SBa5jl
 eDXQ==
X-Gm-Message-State: AOAM533yfKKy1OlOg99QmRGK4J2VZoOdPRKVKsCMan01RwSw0fb8PIbv
 55+IxSjqr1aUXMjdx7DsoMWT9uC1FLvSe2DGghgBmfHRSHF3QpeAZ46iWhm3qONjYJkboFZ+a39
 oJi9Ns9exSpf7bKqfQR28e9zF0PDM
X-Received: by 2002:a05:600c:35cc:: with SMTP id
 r12mr4525772wmq.157.1621333635631; 
 Tue, 18 May 2021 03:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL+bP4BGJ/+tDiLE4ZHcq1wv671RbTKwVIAcgFztdQnfjanbuq/Gm2r3B/QzaKSEduy6Y9Cg==
X-Received: by 2002:a05:600c:35cc:: with SMTP id
 r12mr4525739wmq.157.1621333635433; 
 Tue, 18 May 2021 03:27:15 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64fd.dip0.t-ipconnect.de. [91.12.100.253])
 by smtp.gmail.com with ESMTPSA id z3sm1173826wrq.42.2021.05.18.03.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:27:15 -0700 (PDT)
Subject: Re: [PATCH v19 6/8] PM: hibernate: disable when there are active
 secretmem users
To: Mark Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@kernel.org>
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
 Matthew Garrett <mjg59@srcf.ucam.org>, Michal Hocko <mhocko@suse.com>,
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
 <20210513184734.29317-7-rppt@kernel.org>
 <20210518102424.GD82842@C02TD0UTHF1T.local>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <47d0e5b1-ffee-d694-4865-8718619c1be0@redhat.com>
Date: Tue, 18 May 2021 12:27:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518102424.GD82842@C02TD0UTHF1T.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_032721_493180_B187B50E 
X-CRM114-Status: GOOD (  17.65  )
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

On 18.05.21 12:24, Mark Rutland wrote:
> On Thu, May 13, 2021 at 09:47:32PM +0300, Mike Rapoport wrote:
>> From: Mike Rapoport <rppt@linux.ibm.com>
>>
>> It is unsafe to allow saving of secretmem areas to the hibernation
>> snapshot as they would be visible after the resume and this essentially
>> will defeat the purpose of secret memory mappings.
>>
>> Prevent hibernation whenever there are active secret memory users.
> 
> Have we thought about how this is going to work in practice, e.g. on
> mobile systems? It seems to me that there are a variety of common
> applications which might want to use this which people don't expect to
> inhibit hibernate (e.g. authentication agents, web browsers).
> 
> Are we happy to say that any userspace application can incidentally
> inhibit hibernate?

It's worth noting that secretmem has to be explicitly enabled by the 
admin to even work.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
