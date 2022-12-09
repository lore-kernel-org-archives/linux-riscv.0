Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F56C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsj/aWnF5QpRgumCAvMXlwsOGko/y7kp43irLl8panc=; b=N6rfcZmltFEah+
	7UJOUR4afOnXFf0JrVQJZNszy02az1E2LFzxHcZwRU0ykZoqMJ0G3Dvg24Tt7Eha4j5S2SKbobnZf
	cLS7JSbm7hUThTmt6Fwud8CGa288g1U05aNEM7EBvIxf2qQvlT+aFOoZW2uqgIbRVBlu1KbYcHoxf
	f6ycZmwyh7X8O2lGGaGgucVzzB6K3gO3nIdX6+hCC6ubd00cGqpfYFsjlkQo5Kq5spmIQGWNYeSB1
	ve4rK+8kzx7G7f6HqZIDhXZJRbViM7O/x9atFGX3ZSOcL7eO4rUodDkokzAaUYo29bkZDOW+V2fAQ
	usl47sOSQf+u2O5EKwIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3cb8-007Ynh-P8; Fri, 09 Dec 2022 12:35:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3cb5-007YlH-Lr
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 12:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670589319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wx12DY/bW1ohcBhXEaD09HWTnTluJbFDvZtWQ3v9FbY=;
	b=J8LEmg8F+K9b+O5kosQOC890N1U6D8r5ZkK7TuhjN+sG+2s3hQHfg7sZwEuP/AgGxZs+19
	I9DuGYwbDB3ByVmcIOTFncO3OhR8SvV1QIGHaaMzNw1FlrVLHLZb8CWxRIHIVqV3LIBPBk
	U3wBD3qBZrvAqutslODJa9UgHVXkpqI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-Kmc4sVb0NpKV4nAASgSwwA-1; Fri, 09 Dec 2022 07:32:42 -0500
X-MC-Unique: Kmc4sVb0NpKV4nAASgSwwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0F95185A79C;
	Fri,  9 Dec 2022 12:32:41 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.193.168])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9385C2166B2B;
	Fri,  9 Dec 2022 12:32:37 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Andrew Waterman <andrew@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,  Vineet Gupta
 <vineetg@rivosinc.com>,  stillson@rivosinc.com,  Paul Walmsley
 <paul.walmsley@sifive.com>,  anup@brainfault.org,  atishp@atishpatra.org,
  guoren@kernel.org,  Conor Dooley <conor.dooley@microchip.com>,
  greentime.hu@sifive.com,  vincent.chen@sifive.com,  andy.chiu@sifive.com,
  arnd@kernel.org,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org,  bjorn@kernel.org,
  libc-alpha@sourceware.org,  christoph.muellner@vrull.eu,  Aaron Durbin
 <adurbin@rivosinc.com>,  linux@rivosinc.com
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
References: <b1dae947-d52a-d28e-5ddc-c1ad6d29828c@rivosinc.com>
	<mhng-84ad9495-ef4b-4343-89ee-dfe45ab69ff7@palmer-ri-x1c9>
	<CA++6G0D8RdjgvzQf-gMdakcF-Jj_PMjP=MBtAbSC0Qcu_WrTTQ@mail.gmail.com>
	<877cz0nbce.fsf@oldenburg.str.redhat.com>
	<Y5MoPdYimQtqQvkM@bruce.bluespec.com>
Date: Fri, 09 Dec 2022 13:32:33 +0100
In-Reply-To: <Y5MoPdYimQtqQvkM@bruce.bluespec.com> (Darius Rad's message of
	"Fri, 9 Dec 2022 07:21:17 -0500")
Message-ID: <874ju4lpum.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_043523_812016_DE13F95C 
X-CRM114-Status: GOOD (  15.76  )
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

* Darius Rad:

> On Fri, Dec 09, 2022 at 11:02:57AM +0100, Florian Weimer wrote:
>> * Andrew Waterman:
>> 
>> > This suggests that ld.so, early-stage libc, or possibly both will need
>> > to make this prctl() call, perhaps by parsing the ELF headers of the
>> > binary and each library to determine if the V extension is used.
>> 
>> If the string functions use the V extension, it will be enabled
>> unconditionally.  So I don't see why it's okay for libc to trigger this
>> alleged UAPI change, when the kernel can't do it by default.
>> 
>
> Because the call to enable can fail and userspace needs to deal with that.

Failure is usually indicated by an AT_HWCAP or AT_HWCAP2 bit remaining
zero, or perhaps a special CPU register (although that is more unusual).
It's possible to do this differently, but every mid-level startup code
will have to replicate it (the libcs, other run-time environments like
Go, and so on).

Still it's much better than executing the instruction to see if it
traps, so I won't complain too much.

Thanks,
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
