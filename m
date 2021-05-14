Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14398C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 09:41:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8528661415
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 09:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8528661415
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Du/xs96AEg8/PmQVpailhewo6FBeMxjbG0R3/GH782w=; b=FpZj8cC1TBhhPzzisIhcaio9L
	yiwVYGjzuPH18IwJZWbuFegd9/WMn1vSQSQ2UiKC60FjHS3nxvWjsEt0D54gGysP6hklAr/qRTUqA
	vD2g6ym23VZrVRwpy2wUzgVqWhRWNksJJNzYKC02vifiIhzlbXZZR6GPMPXZjQ3+cCSWih1L5KAIU
	AewngGTBg8TTOyCdAZ+cwWbJ5w9XdTaCOo+uX/XGFUjNCzM2rClOVXLr4uxS1bc74IyRQ4y169GlT
	AfSaFGbDYFK4JHPLkiL3S/upNJkDKsNWDA7z613w9vKUKtLQaDjgbCxm71VsoC1hfDE4XJxVito7Y
	rGx546UmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhUJl-007fQ4-Ec; Fri, 14 May 2021 09:41:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhUJZ-007fOq-SH
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 09:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=bvT1h5Dtf95/bClBJ8t/oO4/WMLk+en4nCrG5Kuj0DQ=; b=cVjMq78kSZICo1Wsn3rvbGLjx1
 f6udnK3pg8n1sAvqCrG4oPopy65Bd6XvoO1V3vdl6r4aUg5mDAzekomncVKeSuIQdZbHZ09HmxsWx
 VUEX8cIhzvKv7omTWJ8mjHLBKSDtl0rNMDDZAFA3Zna8a3rlOM8TuoESJl4S+Cf/ypY4VwKJyOlN0
 MeNFCqgVznwsJIUGIb56dmeXIO+3TPhuHuO0qicou4cs5LuA1XkAtCmy32R037A7rcRUlfEwi9tKZ
 xomU++z7AZKbicb7STpnCEK+A5PwOEKaf6sEmc/uvfRQjSDfmd1VFSdLb9waecb1M0qd2DchTbqqb
 ATlixBIw==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhUJV-00Brx2-V7
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 09:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620985256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvT1h5Dtf95/bClBJ8t/oO4/WMLk+en4nCrG5Kuj0DQ=;
 b=YHwHH2ihE7MF9kaK0vsik5rPLpZbkAUFbP8cqiMPKL842Jxo4sKcRWxdJaKlQxdLN0ogu5
 AhCDbUdwKZBMnFEFSiTR47nPfi/9qV7pOUIxsDX1FeV+S8ay0s+SgT0GdlGvkPlmz0S6Ij
 yW93BW+P5qecf0Cij/30E7Za6KCFfM8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-ba3qh5sBPZy0ds7mMkcuFg-1; Fri, 14 May 2021 05:40:55 -0400
X-MC-Unique: ba3qh5sBPZy0ds7mMkcuFg-1
Received: by mail-ed1-f72.google.com with SMTP id
 g7-20020aa7c5870000b02903888f809d62so16182305edq.23
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 02:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bvT1h5Dtf95/bClBJ8t/oO4/WMLk+en4nCrG5Kuj0DQ=;
 b=QUhv+10vsgmKZuljOuR0WXMAplMbGXdCEVLD2PhTjJJ49wVJS1bmmM5afaGDDisd4m
 I+D4Yty7g2+mTYQRAZEp/DKkYIQPDF3Dr9hIIne/50rXuEckLQJrmgkdTre1mATCPK3p
 DsDtjHyA7uA7NXw38Jl+M9oFdzaQ/5GKy5ksK0Vn+LjBpm4rIAbswaVCA60L+x7B6GMH
 /qlBtO+KfX/XlzETxRmfYVDVo1aUGkI+6t1a9go7xgqomU/7AKtHk8nROzUTX73H1lqm
 k+CDog+VH0cqTK9KZouU35Aj1M7nkdHZLuSXlehzz8fOBOrkC6ew3PLqq8yCH4MCbNrj
 dYng==
X-Gm-Message-State: AOAM5306ds3TKpwWlEqOPHrCQefjDTQKXS57tPRI7elnGSBvCg04bohJ
 feO8Mdepee2sslCzikuVYwCPNV29XKQD7Ciz3OMmGJYDu9UpYPwCoLDsb/eQumyee3MnhKpsnX5
 57QhLvbagGyo62ddRokBQtl7PRWct
X-Received: by 2002:a05:6402:2d6:: with SMTP id
 b22mr55674425edx.274.1620985253911; 
 Fri, 14 May 2021 02:40:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNzAwSfBkG72zB94sJxDLgDbZ+DEQn4gYm5J85sFFQeIUDMZK27eq70zvt8ZCsSnIvH+CO+w==
X-Received: by 2002:a05:6402:2d6:: with SMTP id
 b22mr55674419edx.274.1620985253764; 
 Fri, 14 May 2021 02:40:53 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6501.dip0.t-ipconnect.de. [91.12.101.1])
 by smtp.gmail.com with ESMTPSA id
 g10sm2885347ejd.109.2021.05.14.02.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 02:40:53 -0700 (PDT)
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, "Kirill A. Shutemov"
 <kirill@shutemov.name>, Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
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
 <20210513184734.29317-9-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v19 8/8] secretmem: test: add basic selftest for
 memfd_secret(2)
Message-ID: <a573f11d-7716-46cd-1d08-6840560d6877@redhat.com>
Date: Fri, 14 May 2021 11:40:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513184734.29317-9-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_024058_162826_49B4D6E6 
X-CRM114-Status: GOOD (  14.44  )
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

On 13.05.21 20:47, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The test verifies that file descriptor created with memfd_secret does not
> allow read/write operations, that secret memory mappings respect
> RLIMIT_MEMLOCK and that remote accesses with process_vm_read() and
> ptrace() to the secret memory fail.
> 

[...]

> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright IBM Corporation, 2020

2021 ?


-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
