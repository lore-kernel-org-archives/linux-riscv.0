Return-Path: <SRS0=8YMt=LE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441A6C47094
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jun 2021 17:21:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E432C61222
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jun 2021 17:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E432C61222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uETi1uQ+rXNXxARtmEW0DW352L1EbTTev2An+QqSIIk=; b=Um1oyCxBgLMqxk
	9tx3J7PTvNSeTE5VaUsXwvOFkjDJakIWrAH3a+FJhtqMVstLUH1j/qjcbMYBLibpNnuGap1hgzbM2
	J3KbFswRPNWycs8+VO0eBveVaMRgkp1rfaTRdzSLtC2wLhfme1T5JaYZ3lZkBALQhXtyrhvoLA3Ne
	fKEOAlUibiIW3ayP/YApt2TPN2jk3Dh3ygZjGp3D9xhGupOVPfvXDivEsPxUosx4Kn2dT9EMyHrE3
	MUh1iw7qTA1okeTD7FeGBX7xcdcbXN7i1Ad9YgQywFiPhhn54AIbDNVW79Vi2rWOzbeSBo4fhIpgN
	1jzzMB8V3q5n8CXWMXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrONA-001uky-Ex; Thu, 10 Jun 2021 17:21:40 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrON7-001ukA-TP
 for linux-riscv@lists.infradead.org; Thu, 10 Jun 2021 17:21:39 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so410025oth.8
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jun 2021 10:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g6SU8s5JZXBpJRY7xHwXt52gkhZm/7vIqjpkQlZi7O0=;
 b=XskWsx9d/db0Cvo+2d6zFcITph7oWit0sJgLFcCJ366DC2XAxdjdrj031Idd1JG0g9
 8HVfEijZ9TBI0p5y9rJDU8wI/tTt3iN55nxQSwkWdwoNWWSxlrDLe/5C5IQw6Ghbafj2
 ZtjbvvcUflV4s/k2UOcjvgl63dPTj7/dCNv+25EbcHciiHbuaPGTa6F84d0Nt6W35X20
 5r1fJJktMsh+4dyxyG/LTWX/n9F2Qh5fwR/XN/Hv5lx8+nj7WveBkyia/PcKOcyMZOjn
 WC4kRyMGKNkVfFKBnfJ5i1kQer+4mEOozAZMemLnlsiyYuwwSpP2gYgUXDeLF+TPCiaa
 I5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=g6SU8s5JZXBpJRY7xHwXt52gkhZm/7vIqjpkQlZi7O0=;
 b=jbxbV7Ou3QP5vRXjX8nJ/CCeq83pq9s01QA4L9FRsoPBzQddLQ4sFDNrsnDYM2lXmR
 6D3pq3cQizEztXKPlmR36HQpEkL/UiGvC4I0sU9zbrrywTEFg9JEgegXGe8/jVcw/AYF
 tGIODAnmBuZlIqVSoNpUdMJyoXutvL1PstmRUIXi/rahv6tCFGwKU6OVsq+R+P13lVC7
 uGR9K+ztd+YzqHB8q6EN29djqkbK08OtD12BDgjAkL5uBUiKl1qZeVtgsXgO6I1q4Lwk
 pXxLkepF2WsvNzoUtkcJdaXx90NznQcmF7iRSTBjPJ1hWYLMcqBjiG70u42dqt05l73l
 x+mg==
X-Gm-Message-State: AOAM533P7ap2cbOr75BKoLaZcIBcbJmlLZSR/K7jSk4N/LXApUxTM2J6
 YM4Eh2DztlPTDjbEaaD14j1hg5LA8tQ=
X-Google-Smtp-Source: ABdhPJwwYHm+SgYEfCq2WkycRNl6JVPdshm4tyzMX1ooyqkhQpHuvr1tl5O15Ig2i59bbURiL2Bkzg==
X-Received: by 2002:a9d:7282:: with SMTP id t2mr3382022otj.288.1623345636778; 
 Thu, 10 Jun 2021 10:20:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id o2sm634382oom.26.2021.06.10.10.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 10:20:36 -0700 (PDT)
Date: Thu, 10 Jun 2021 10:20:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Alex Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 1/3] riscv: Move kernel mapping outside of linear
 mapping
Message-ID: <20210610172035.GA3862815@roeck-us.net>
References: <mhng-90fff6bd-5a70-4927-98c1-a515a7448e71@palmerdabbelt-glaptop>
 <76353fc0-f734-db47-0d0c-f0f379763aa0@ghiti.fr>
 <a58c4616-572f-4a0b-2ce9-fd00735843be@ghiti.fr>
 <7b647da1-b3aa-287f-7ca8-3b44c5661cb8@ghiti.fr>
 <87fsxphdx0.fsf@igel.home> <20210610171025.GA3861769@roeck-us.net>
 <87bl8dhcfp.fsf@igel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bl8dhcfp.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_102137_989833_AE8B47BB 
X-CRM114-Status: GOOD (  10.95  )
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

On Thu, Jun 10, 2021 at 07:11:38PM +0200, Andreas Schwab wrote:
> On Jun 10 2021, Guenter Roeck wrote:
> 
> > On Thu, Jun 10, 2021 at 06:39:39PM +0200, Andreas Schwab wrote:
> >> On Apr 18 2021, Alex Ghiti wrote:
> >> 
> >> > To sum up, there are 3 patches that fix this series:
> >> >
> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210415110426.2238-1-alex@ghiti.fr/
> >> >
> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210417172159.32085-1-alex@ghiti.fr/
> >> >
> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210418112856.15078-1-alex@ghiti.fr/
> >> 
> >> Has this been fixed yet?  Booting is still broken here.
> >> 
> >
> > In -next ?
> 
> No, -rc5.
> 
Booting v5.13-rc5 in qemu works for me for riscv32 and riscv64,
but of course that doesn't mean much. Just wondering, not knowing
the context - did you provide details ?

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
