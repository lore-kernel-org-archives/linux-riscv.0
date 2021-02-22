Return-Path: <SRS0=ovIN=HY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1928C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 19:18:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7716D64D73
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 19:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7716D64D73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5zMiPEKfdd+QOJP2t146FR4xymAzvpiWystjqhsgFNk=; b=I3eZk0Cp9XgcecbVA6H44dIfr
	A/r8T5VWWwxMAOx8zu48+w3ijlPrJwEC0K25VeePpAxrSKvBSE4EPnYGKBBRPyTjGk16o1YjqeYj8
	jrVVbayH6mLoZxXWeLcNH08ZU0UR7aSbd5NyvodrjiMXH7aKS/80R9HaKp7SliJXN3hPMfTtLdLpP
	ecLOdfevU+NB5dzwB2dDzqAlyjNb8OGgGtR9be8JSdbqFLuN88YwkKDOoSpe3ivWFQrOUaZ7CdjWq
	aO5iUJJ1IxVdIEYYYoo48BN6R7LUJ7qLV0ZS4d8j8TMaziFccs8aufzUdGBiCWjSZtyXkAbi8wZVM
	qtDBRx9eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEGiV-0000Mo-G3; Mon, 22 Feb 2021 19:17:59 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEGiP-0000F2-Ra
 for linux-riscv@lists.infradead.org; Mon, 22 Feb 2021 19:17:55 +0000
Received: by mail-ej1-x630.google.com with SMTP id u20so30424559ejb.7
 for <linux-riscv@lists.infradead.org>; Mon, 22 Feb 2021 11:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mL0bjhfITdu5839ghM56EtmuJ0mV3o1IEyaUJSuFMFs=;
 b=0VKXgI+d4N8/TsZjQE/E5fkYxDFeC7KFxegFQ1tUDUQWXj1P6cXOsiH5slGqxqrmbb
 dBx4HcRD8Hzu5KRTHX5N1ybYz5yC5e7kYtwfTlsuU2esXKkYljaX8VDDRS1DaE/uHUin
 QAGppPvDyByXQFp+iE9GKGPwF3A2dB1mFytnHdtGJw+XJLGP5r33xK45enAbysyTaEHa
 57tTo6DZyOE+uYzDNdPTZAL71cYVMSUiSI5K7sek4p2eMAFj1YmFFfuyLNvbSLKSE5kW
 D+y3PQVbEo19hoNoanDSrLywkZqhcPGuG5KVCRRj/oMJKHnyCwkRLTAD6EZO4JnoconN
 aV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mL0bjhfITdu5839ghM56EtmuJ0mV3o1IEyaUJSuFMFs=;
 b=QOgPb4uyc6r3lLWR559ZzGitJPsm6eRmDXMWiC2tW487j1k2WQ8vBNtrRIlJn2/cnx
 o02Krhd5pbM4YQHu2tpvtU62JjVPUGidpTlU26M2Jl+KNo0L6gMRp2fJjpDCSWt3Owm2
 oSURbyg0v4A76q+xIXd5p3iY2ucjPocZ38b7lTtePSJZAGu0TM0DkD8mtdbW1WN3zvqp
 +AuM0KLEiNm2CbZSmJy4yjtVc/LpXkfpXGnE69EkAzVxMSgMhs8/OXgu+rV8cQAyPTHW
 zHj2D+swnTYuqLVx8NDsquNDkwEY5I6hHemsoT1KAhComDQS2ouGCce00JlYQhBo8dwp
 sfCw==
X-Gm-Message-State: AOAM5329Wikroe+4hz2fXBJinODJ5pWtU3KtvHb+SF9Eir5Yu+8bcdFw
 i55Ka3RtkWtwkOzqqmYswwhhgPgPO9j16jU7RVQWCQ==
X-Google-Smtp-Source: ABdhPJwkiWshDLTsz8a3A7EzLjYNcKqX6Z1F01E3QE0NjkocZdW4txgaDcjEXqIRRI2IV4obwnL12Zk+rIG7YnuhZ4g=
X-Received: by 2002:a17:906:8692:: with SMTP id
 g18mr22575502ejx.418.1614021471495; 
 Mon, 22 Feb 2021 11:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-9-rppt@kernel.org>
 <20210222073452.GA30403@codon.org.uk> <20210222102359.GE1447004@kernel.org>
In-Reply-To: <20210222102359.GE1447004@kernel.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 22 Feb 2021 11:17:46 -0800
Message-ID: <CAPcyv4hCXZFmeMkKxN54Yw3ZbvoYQ3Z9y9Ayv42i6u+24Bkmqg@mail.gmail.com>
Subject: Re: [PATCH v17 08/10] PM: hibernate: disable when there are active
 secretmem users
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_141754_020273_F2D7EC53 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux MM <linux-mm@kvack.org>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 linux-riscv@lists.infradead.org, Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Will Deacon <will@kernel.org>,
 X86 ML <x86@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Shakeel Butt <shakeelb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 22, 2021 at 2:24 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> On Mon, Feb 22, 2021 at 07:34:52AM +0000, Matthew Garrett wrote:
> > On Mon, Feb 08, 2021 at 10:49:18AM +0200, Mike Rapoport wrote:
> >
> > > It is unsafe to allow saving of secretmem areas to the hibernation
> > > snapshot as they would be visible after the resume and this essentially
> > > will defeat the purpose of secret memory mappings.
> >
> > Sorry for being a bit late to this - from the point of view of running
> > processes (and even the kernel once resume is complete), hibernation is
> > effectively equivalent to suspend to RAM. Why do they need to be handled
> > differently here?
>
> Hibernation leaves a copy of the data on the disk which we want to prevent.

Why not document that users should use data at rest protection
mechanisms for their hibernation device? Just because secretmem can't
assert its disclosure guarantee does not mean the hibernation device
is untrustworthy.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
