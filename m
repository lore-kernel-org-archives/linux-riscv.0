Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413A0C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 14:17:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D370B60FF1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 14:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D370B60FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p8g597bpZzw8STFHzyszfIzn2ygWLafbqW5AXQXhoSM=; b=Mmdy48TMxrD+hbNIodGs4033T
	X4wb197Y0T3n/bL3rhTQAmDKsWVP7pvr6OVqXb1at5JuW+a0y9ldi367gU8OObY9VdMKREMuHlX7a
	TQgAsHQQOtk9lpdbQfOUOnsaRLqwyrKiXPLJXGw4nocNGTxxLQnixjQhB1M6zY+hz6ZHUJ1lvSS6j
	tL5WsCZIrN+/ANX+G9uIYCYuTi/+cstIWlDWYyNLn9PK8HRjlOfrQD5nF8mT0z+wdkXQoi4iEJ2kD
	tDrnTpg+Uo1CufW+WBMt/9VEf4+YeKMBNDl4h26Cw8A2ut68TMg4W9weVn+xmZAQnqk7kDdAo+T9L
	e49twtu7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUrwY-000tiB-8I; Fri, 09 Apr 2021 14:17:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUrwW-000tho-2R
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 14:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=7lJbgd2hYY827G0NWvg1oy4yBkmSJegYFDEkQ7hgRxA=; b=Km6miluSB5ONX2JizgFTm7O/dt
 E+vUJMZJggr5l2bcl1KXf7cZCfih4g5q+xk7xHJsa5IxotMBXMKdX5wdbZ5F5rusY7rFFYXYylz2V
 u7AifwXy6ABD/O0MWv1MKyIcHQCyONALOMYOUTki+z2dJiw0gXIkFPz41xS2Pte3NLwfiKR29nzux
 oDt7soG6vaYCxuXbsz4tLddRIK7besqGFdXht9rCMrgYZ4DfLMtR0ngbIKnwxlCExrh4ORrtP4dTu
 tgDSWhG9SEnUOXXxkFTSQzYIBmzB5r/9ypN5Y45fgGlUO6yeIfkTWzh20r8DVULAxeEOhUOnTqAIT
 yeZ8vQJA==;
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUrwT-004Zwy-6j
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 14:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617977819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7lJbgd2hYY827G0NWvg1oy4yBkmSJegYFDEkQ7hgRxA=;
 b=h9e/ZEl72YLGUXj77m1IkVw2xAwUyM+ZrpFcqLBz6XA9VWGPXC4XCGyYFDRtEjL25GQwHl
 Dl50wn0KegaICwJt5+Cb8pY4tcsx95oELEJth/AMQVUqZWjNAVY0E2t4zuZYGl2eG5bUNN
 mbpMwtSk+fM2ipE1lIEMgv9CSIqwNDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-CbpfF08qOAm3ydVeGePGJg-1; Fri, 09 Apr 2021 10:16:55 -0400
X-MC-Unique: CbpfF08qOAm3ydVeGePGJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39E0B807344;
 Fri,  9 Apr 2021 14:16:54 +0000 (UTC)
Received: from [10.36.115.11] (ovpn-115-11.ams2.redhat.com [10.36.115.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FF2A648A1;
 Fri,  9 Apr 2021 14:16:51 +0000 (UTC)
Subject: Re: [PATCH v7] RISC-V: enable XIP
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Alex Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 Vitaly Wool <vitaly.wool@konsulko.com>
References: <20210409065115.11054-1-alex@ghiti.fr>
 <3500f3cb-b660-5bbc-ae8d-0c9770e4a573@ghiti.fr>
 <be575094-badf-bac7-1629-36808ca530cc@redhat.com>
 <c4e78916-7e4c-76db-47f6-4dda3f09c871@ghiti.fr>
 <d4d771a8-c731-acaf-b42d-44800c61f2e6@redhat.com>
 <YHBgUs1JKvHWkG9F@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <2d442bca-c367-598c-b4ee-746925517118@redhat.com>
Date: Fri, 9 Apr 2021 16:16:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YHBgUs1JKvHWkG9F@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_071701_352609_57987821 
X-CRM114-Status: GOOD (  19.04  )
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

On 09.04.21 16:10, Mike Rapoport wrote:
> On Fri, Apr 09, 2021 at 02:07:24PM +0200, David Hildenbrand wrote:
>> On 09.04.21 13:39, Alex Ghiti wrote:
>>> Hi David,
>>
>> I assume you still somehow create the direct mapping for the kernel, right?
>> So it's really some memory region with a direct mapping but without a memmap
>> (and right now, without a resource), correct?
> 
> XIP kernel text is not a region in memory to begin with ;-)

I think that's the part that confused me. I thought it would be mapped 
somehow into physical address space and would be addressed like other 
memory -- just that reads would be rewired to go to flash.

> 
> It resides in a flash and it is executed directly from there without being
> relocated to RAM.
> 
> That's why it does not need neither direct mapping, nor struct pages.

Thanks for clarifying! :)

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
