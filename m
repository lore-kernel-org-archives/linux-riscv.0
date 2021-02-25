Return-Path: <SRS0=t5Vp=H3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CAEC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 10:34:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D9464EC8
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 10:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70D9464EC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qx6hSyeltiuGXhjQu7SyNVrb5L8wOp+ZIoWCOja24gg=; b=Z3VWlS/BQwsaZ8B+twtfLqKJy
	nrKdQPjy+3be8pzlEZ/FVpxqZKkQ3cc+KsPlXL/Bqb9MVnIBKQOs642itMr7L4cj3WTqtehuR2RHZ
	cFSkao/Hd6i58KSe8N33BoH9XtpxjnM9NY0BFFD9DOFxRjX5l3js9ciVk0Ztn9e2TeJuCBNuIB2+/
	xeIoWYK0Y/NZSBmaKm8paFRieDsDcwdTL3giQxbtLY5eLaUZEoYWp8DqFagzRrOHTnNexXJZeJumq
	R1gOjdpw/43Hzvh/6gc2IUCFCi/op32lJu131yadCXiWWdRHZoUBvxd4Yk97oetXoD9DwK4e3wgVv
	kNK9ULrRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFDyX-00040U-Px; Thu, 25 Feb 2021 10:34:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFDyU-0003zz-NU
 for linux-riscv@lists.infradead.org; Thu, 25 Feb 2021 10:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614249265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NA0XhNNgXWdKWddYRBJjHOR9CD09LFOv4oAxt+/QKh8=;
 b=WdDPOmJMbQqk2KIzJr4ckI2A0+ta0zHd1vnLd0BFaRrtSB//xK7HFmmhZuuiPPJylza3y0
 3x6sRE5UmHJPRwtIoQNx1VoNuwU3at0Smw31KGAOH6AdB7hPLFQ/piGPX3+JGdrBzfiS0e
 8nuIGRj6FcoZOTTduWukG9/SA31Bzew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-yrGz6ss2PRqE8fSc9ob9ug-1; Thu, 25 Feb 2021 05:34:21 -0500
X-MC-Unique: yrGz6ss2PRqE8fSc9ob9ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6854B19611A2;
 Thu, 25 Feb 2021 10:34:18 +0000 (UTC)
Received: from [10.36.114.58] (ovpn-114-58.ams2.redhat.com [10.36.114.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 658C619801;
 Thu, 25 Feb 2021 10:34:14 +0000 (UTC)
Subject: Re: [PATCH 2/3] Documentation: riscv: Add documentation that
 describes the VM layout
To: Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <20210225080453.1314-1-alex@ghiti.fr>
 <20210225080453.1314-3-alex@ghiti.fr>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <5279e97c-3841-717c-2a16-c249a61573f9@redhat.com>
Date: Thu, 25 Feb 2021 11:34:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225080453.1314-3-alex@ghiti.fr>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_053426_800579_D04C1632 
X-CRM114-Status: GOOD (  12.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

                  |            |                  |         |> + 
ffffffc000000000 | -256    GB | ffffffc7ffffffff |   32 GB | kasan
> +   ffffffcefee00000 | -196    GB | ffffffcefeffffff |    2 MB | fixmap
> +   ffffffceff000000 | -196    GB | ffffffceffffffff |   16 MB | PCI io
> +   ffffffcf00000000 | -196    GB | ffffffcfffffffff |    4 GB | vmemmap
> +   ffffffd000000000 | -192    GB | ffffffdfffffffff |   64 GB | vmalloc/ioremap space
> +   ffffffe000000000 | -128    GB | ffffffff7fffffff |  126 GB | direct mapping of all physical memory

^ So you could never ever have more than 126 GB, correct?

I assume that's nothing new.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
