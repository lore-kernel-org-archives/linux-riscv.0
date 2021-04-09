Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9540FC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 12:46:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C4C610CF
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 12:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C4C610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3FHo8ADxFJXhtkpSkZpQdjvrxnNwJWwMrV+Cc5f/cms=; b=BKD0hrJJG75Ej/cGp/ifDnsoj
	d8zF7r9vpXvyOy1JxsG9g8VrVLXYueNv6RQveSncBbPODL5yIDFtdUYxUWL0GxAZ1k8p2jZ2hDxIq
	CoZx6SCgtg/NqymHJrJtFm4xXF4Kg6ywiGC48kCyxReVw3Sd0xKo6/8RcEWn8cvWzcJiV2HuKngYQ
	BGP/cLy0/m/DmuX5sWYQCIj8juUtZsuFeZXro6sONeaBkbw4xNMK2yXC/qbLTjv4gZjcPta10P9xe
	3zbz1YQkXGEGN5JWqxvFNZzr0vEbSxrGNLSI9OF1vAps8yMCZZRWEhh64yoVywYaprZM9S+SgsX8A
	kxD0oXvqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUqWu-000m5l-F5; Fri, 09 Apr 2021 12:46:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUqWr-000m5P-J3
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 12:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=f+xd8ydLnyzhrcApE0s32pZuwoI7owl2AW9EUlJO53w=; b=A3iHRl93SsiU5vXmEz7f5r0ZAJ
 LetYpP/YjqptH7KAmcuEuciVjbIYuJQMa1m7Rd5BnCYzbLGgy4PVYmX9l63ms16uHlMYhv0YNmrwc
 HEIsabEOURo0DSd6AezCg2wo0xED0/h+XfMhBZgyOxjGyXnRNCNasPz3drFiUfaB+XHoHMuGScrG1
 s1lQcE7a6G5zxsorbQPW96ZUpsBYJXHoDszWYPpltrbRge7lyHFZxIFPafWU/exFMUzZuDS3dZwFO
 d/CVhopvU2RFjqDFn1kNaQgmFpQmUtgN1PQ5nQt18bm/TJXE10kXGHtSRWRyd63/dHOj1TFkKOLwS
 duMUtAyA==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUqWo-004WXl-VZ
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 12:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617972386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+xd8ydLnyzhrcApE0s32pZuwoI7owl2AW9EUlJO53w=;
 b=GaJWPoMglnlAgQCXI7OcXeO5TQahdIFieDJk2+/BCUK6nFnriICROpneTD0z6VJnPIlkQn
 D2R0+7jAgaoNTXeT2i3wqUIFOEt5JEL/f3DAAkkSc2uORsyMp33pcfxl3bNimmnzG/Qnzb
 Ih4VO0xRresXwV8X0lsEZRz0zCVznIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-gNrwR-0SPUSqTDOnc5osug-1; Fri, 09 Apr 2021 08:46:22 -0400
X-MC-Unique: gNrwR-0SPUSqTDOnc5osug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92EB28030A0;
 Fri,  9 Apr 2021 12:46:20 +0000 (UTC)
Received: from [10.36.115.11] (ovpn-115-11.ams2.redhat.com [10.36.115.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 618F819C66;
 Fri,  9 Apr 2021 12:46:18 +0000 (UTC)
Subject: Re: [PATCH v7] RISC-V: enable XIP
To: Mike Rapoport <rppt@linux.ibm.com>, Alex Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 Vitaly Wool <vitaly.wool@konsulko.com>
References: <20210409065115.11054-1-alex@ghiti.fr>
 <3500f3cb-b660-5bbc-ae8d-0c9770e4a573@ghiti.fr>
 <be575094-badf-bac7-1629-36808ca530cc@redhat.com>
 <c4e78916-7e4c-76db-47f6-4dda3f09c871@ghiti.fr>
 <YHBEsDuEvPAnL8Vb@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <e7e87306-bb04-2d4f-7e7f-aabd40dccb3b@redhat.com>
Date: Fri, 9 Apr 2021 14:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YHBEsDuEvPAnL8Vb@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_054627_122158_3352BDF1 
X-CRM114-Status: GOOD (  21.69  )
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

>>> Also, will that memory properly be exposed in the resource tree as
>>> System RAM (e.g., /proc/iomem) ? Otherwise some things (/proc/kcore)
>>> won't work as expected - the kernel won't be included in a dump.
>   
> Do we really need a XIP kernel to included in kdump?
> And does not it sound weird to expose flash as System RAM in /proc/iomem? ;-)

See my other mail, maybe we actually want something different.

> 
>> I have just checked and it does not appear in /proc/iomem.
>>
>> Ok your conclusion would be to have struct page, I'm going to implement this
>> version then using memblock as you described.
> 
> I'm not sure this is required. With XIP kernel text never gets into RAM, so
> it does not seem to require struct page.
> 
> XIP by definition has some limitations relatively to "normal" operation,
> so lack of kdump could be one of them.

I agree.

> 
> I might be wrong, but IMHO, artificially creating a memory map for part of
> flash would cause more problems in the long run.

Can you elaborate?

> 
> BTW, how does XIP account the kernel text on other architectures that
> implement it?

Interesting point, I thought XIP would be something new on RISC-V (well, 
at least to me :) ). If that concept exists already, we better mimic 
what existing implementations do.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
