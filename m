Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C215CC48BD1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 10:54:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86B3E61059
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 10:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86B3E61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D22EOxFV+GvQDnNGFGwGOnvylE69Idxn/ahZEMAIhXc=; b=XEBiZyBvrZhbMxQFs19ltBJIjX
	3sXNvhZaEyiadm86Lt8H1D0wvoA0pbk1ivC81Kb/NXXVIK1ATFZ/nwN7D5wHpZVQySehQEYNJtewR
	rrXIybvyZBDtuRL1E7ZDQh9sDSjvwqqX5Goq4iru5fgdGIttE2p4Qob5oPh2KmK3tIWgzeZo8eDWE
	javRzflsuTM1Cu7kPV7YoaGCk3laTLDzHI/s+7zYQEwbNhaYprhDoPa7QYYrf1GCV+x7hSuGYMTmG
	upTNr/3cJlZpJWJ7XPrDevDSb1NVuETGkmBWnSJU19xGA+e8vBoD7e2WfZGKfNkdTIBVmKAEg5d13
	yznpzF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvqg-00D9yF-Qg; Wed, 09 Jun 2021 10:54:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvqG-00D9jG-18
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 10:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623236027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBWPCdmnHsH7qQGe81DFl3a6ru5xcOhjproglm1WObM=;
 b=QwJC1ngmrfl3sXAyqcrsZkAJM99ohcRxRDGQleZHVOe0QHkYHaLEtaCAAJ18apqDQzAeTB
 ATFOm9v/nG3u4aAaOUZq6bxxP9i5dTJ63OKEuU5isVlfC7tS5vpOtkRnkcTvWp8KauoKGh
 t97ao11Pq+vy55nVK0dhgiHxIn+K/wE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-M6rF2zpmMNmAWqirSjuyww-1; Wed, 09 Jun 2021 06:53:43 -0400
X-MC-Unique: M6rF2zpmMNmAWqirSjuyww-1
Received: by mail-wr1-f70.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so10639535wrq.10
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jun 2021 03:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JBWPCdmnHsH7qQGe81DFl3a6ru5xcOhjproglm1WObM=;
 b=s8ht/RWUOaQT+QrjWM7rwO6PIMmFSid2pYJovMOzq0S6XUDTZzchU47PruG+1ganxH
 1lx/2kJ1LJjZfDML4MAcmMCD6r9iPZLF2L7copQnnEhK6qeIOwIebDHt9Buc7hYnDehW
 pBEn+VPXY4z5/uQrjcvLSPRQHlrXJGifr4wvHUZP6EjdL1uVvH5iC0yAqeNZIYJZIqul
 qjbSCpmDbJXetPxhpzmoG7Nspia0h8RzIuVJRWvr9vkBjQEw9BZQzBJZ1hZ/478Cdaki
 /YbVE3u9AiLxdlJEO2A7I2bWY23AZkyXNMGtZ/S7WUWvBqzUHgjRHCAGgboc9M4fchIq
 edtg==
X-Gm-Message-State: AOAM530JvrUnz2o/8+++hgih+pOpUqG9iek3qf3Wv6mlW2ARJy/12prm
 CyZIJu8aLGxxcXXDC69wQT0d2J26Qu+GfKyT3De9w/S5TT1vVPzN8fGs5gXAxPgUyH4EYv8jrHX
 ZO62mRFhx/Mt7UmlaBH05/jEOW1Y3
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr26766706wmr.137.1623236022753; 
 Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytaUEoH1yZlmOCQRNfd+wo+CI/GKYwuDVo1xp/A/CuJsfRh3qeLKHuz3pPcIzWarSKIwDzSA==
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr26766696wmr.137.1623236022628; 
 Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
 by smtp.gmail.com with ESMTPSA id
 v15sm1695174wrw.24.2021.06.09.03.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:53:42 -0700 (PDT)
Subject: Re: [PATCH 3/9] arc: remove support for DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jonathan Corbet
 <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-4-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e9ef94f5-02bc-920b-9e6a-2d234e5bbbc5@redhat.com>
Date: Wed, 9 Jun 2021 12:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-4-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_035348_200702_CBCD40FD 
X-CRM114-Status: GOOD (  11.23  )
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

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> in v5.11.
> 
> Remove the support for DISCONTIGMEM entirely.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
