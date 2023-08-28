Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E35DC71153
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0OJRMac27o5tybicNhfaMvxjBgTkRaoSdyisV0ZDS4=; b=INbLL4gkzAi7Ax
	hzjmxSur5PNY+MTkp7KEJ8ruF7mKHOq/CixHS1GVgQ8DI+ZI3gGRiR+uecQuUN03QKDSWf0p277RG
	9iCJY+0PeR0laCm+e/X8TgA1fi7ZPrLSAE6fHuQ7Y7p6HYmF6i2Loy9ySkgWv75onrSPvOo68nso7
	D8gUF5V46wVk4i0wkF51PtNoc5LXoAhNyEarbgGz2WgYeVg/+BtOeeG7hFNNhGYM8p53ogoFSV4XK
	B8ZWcWcQXYAUZbN91CteibR4CkV/eEEKubeWCONfeLJ/pnbL6jFFRiGNk3vjo8RVL2BklFckJOzwG
	3IcCxFjjqe0zv4i5xdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaYm1-009FKg-01;
	Mon, 28 Aug 2023 09:43:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaYlw-009FJT-37
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 09:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693215780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=01IAJZlGxE3jZFYcWyiHELiJj0j7MGd1pqgzbgK/uXE=;
	b=V3qQFHVY0BCt1z6f/uWWfiYTw2dz8VWzDNoYPUZPszPd8BMlxJg9gnFnUIioOUH3jn2w6p
	jzvxBldRwsyMawVXoY3U+lXfmp86bIj1Cdv/xylXQoDhCrIspJs4oasrXbP8KnH/xI4cZy
	lZa657bZeGt4dGgfUQ1Hv+KcFlO+NkY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-aKmWqtQrOFym7C9xJcjr2w-1; Mon, 28 Aug 2023 05:42:54 -0400
X-MC-Unique: aKmWqtQrOFym7C9xJcjr2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CAC23C11C62;
	Mon, 28 Aug 2023 09:42:54 +0000 (UTC)
Received: from localhost (unknown [10.72.112.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B284640C6F4C;
	Mon, 28 Aug 2023 09:42:51 +0000 (UTC)
Date: Mon, 28 Aug 2023 17:42:48 +0800
From: Baoquan He <bhe@redhat.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	akpm@linux-foundation.org, catalin.marinas@arm.com,
	thunder.leizhen@huawei.com, dyoung@redhat.com, prudo@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] crash_core.c: remove unneeded functions
Message-ID: <ZOxsGIeYYvypf9op@MiWiFi-R3L-srv>
References: <20230827101128.70931-1-bhe@redhat.com>
 <20230827101128.70931-9-bhe@redhat.com>
 <15058508-9e21-0d10-4eca-2c8a5562d36c@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15058508-9e21-0d10-4eca-2c8a5562d36c@sifive.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_024301_073145_A32D5D6D 
X-CRM114-Status: GOOD (  16.60  )
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

On 08/28/23 at 12:26am, Samuel Holland wrote:
> Hi Baoquan,
> 
> On 2023-08-27 5:11 AM, Baoquan He wrote:
> > So far, nobody calls functions parse_crashkernel_high() and
> > parse_crashkernel_high(), remove both of them.
> 
> minor typo: should be parse_crashkernel_low().

Good catch, will update. Thanks.

> 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  include/linux/crash_core.h |  4 ----
> >  kernel/crash_core.c        | 18 ------------------
> >  2 files changed, 22 deletions(-)
> > 
> > diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> > index 2f732493e922..0c512a80a768 100644
> > --- a/include/linux/crash_core.h
> > +++ b/include/linux/crash_core.h
> > @@ -80,10 +80,6 @@ void final_note(Elf_Word *buf);
> >  int __init parse_crashkernel(char *cmdline, unsigned long long system_ram,
> >  		unsigned long long *crash_size, unsigned long long *crash_base,
> >  		unsigned long long *low_size, bool *high);
> > -int parse_crashkernel_high(char *cmdline, unsigned long long system_ram,
> > -		unsigned long long *crash_size, unsigned long long *crash_base);
> > -int parse_crashkernel_low(char *cmdline, unsigned long long system_ram,
> > -		unsigned long long *crash_size, unsigned long long *crash_base);
> >  
> >  #ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> >  #ifndef DEFAULT_CRASH_KERNEL_LOW_SIZE
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> > index 6bc00cc390b5..61a8ea3b23a2 100644
> > --- a/kernel/crash_core.c
> > +++ b/kernel/crash_core.c
> > @@ -323,24 +323,6 @@ int __init parse_crashkernel(char *cmdline,
> >  	return 0;
> >  }
> >  
> > -int __init parse_crashkernel_high(char *cmdline,
> > -			     unsigned long long system_ram,
> > -			     unsigned long long *crash_size,
> > -			     unsigned long long *crash_base)
> > -{
> > -	return __parse_crashkernel(cmdline, system_ram, crash_size, crash_base,
> > -				suffix_tbl[SUFFIX_HIGH]);
> > -}
> > -
> > -int __init parse_crashkernel_low(char *cmdline,
> > -			     unsigned long long system_ram,
> > -			     unsigned long long *crash_size,
> > -			     unsigned long long *crash_base)
> > -{
> > -	return __parse_crashkernel(cmdline, system_ram, crash_size, crash_base,
> > -				suffix_tbl[SUFFIX_LOW]);
> > -}
> > -
> >  /*
> >   * Add a dummy early_param handler to mark crashkernel= as a known command line
> >   * parameter and suppress incorrect warnings in init/main.c.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
