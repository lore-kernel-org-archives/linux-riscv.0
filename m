Return-Path: <SRS0=syY9=G4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782ABC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 17:18:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2179B22AAC
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 17:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2179B22AAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uTVSIJ8w2qKZ/vO20BFjvVpBnOs2Sxdtpsq0bAWNSjg=; b=qEHMmRuJrYSaHRHJ+D4FEadUT
	CSsZ4v2otwYZ8gg0Puj9Nn78SvQq84r7s52mzTaIiKzTXtTBJrFGzRN20EU35CkL5CQnxRCHPsz78
	hAxFNnqsvxnN9lZ7sk73X5HrjOpNzgcEPtbEpUC4/cu9YPLBE2FOFkQlojvqVCwetz39w11Lja6X1
	ru21LAGmH99vJOdLoFpoCQ+KWemR7elXFkNmHThxXw9FimlrhPd+e/wJsIG50JJfW2mTHm2ttSPZx
	rr6g6K5TB5RxXm6kqXfjjDg6JsvNBMisNlrDF8lzmBY4bkocBZbfc6+UTT3HTNA4hj4HoOZZ8rIBu
	XoFIQ/PgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l45VR-0007GV-27; Mon, 25 Jan 2021 17:18:25 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l45VM-0007Dn-5F
 for linux-riscv@lists.infradead.org; Mon, 25 Jan 2021 17:18:21 +0000
Received: by mail-lf1-x12f.google.com with SMTP id a12so10767208lfb.1
 for <linux-riscv@lists.infradead.org>; Mon, 25 Jan 2021 09:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NF3PAS9R3ZcPxx4Z5KTeI/YMZHaaDZloSJa4zd+LcN4=;
 b=dcojzpvBme3j+zUhY3ahCgy1OWbsKkFNmO1SmDOVx9o3VOdmi1r2YX6L0pn3CYTKxE
 UuzL4cx554sA9UWfceH335k9zgKeNdNZbQkg0ruEwHt2oD7i5VhQHFj8dho+iNbxnOIi
 kbP6D0HNZYkv/fCic1j5WVLYkd7Cr9blj/atVb/ioXbDyORifrO8kcGBh7MCL0flLrDK
 D2ZQOL0FlMXMeBJEJSv+/JfLGOP1UGbY+1X/Y5zaitRWa/9P2DldYEEdQW4OPBEOCyLf
 c+RRNgmCaHeK6qP/DS1Pp+OIpiTReTg8yF4kHgiTCvjQR1HWcMVRmJAgmErZ8wIE4wHP
 EOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NF3PAS9R3ZcPxx4Z5KTeI/YMZHaaDZloSJa4zd+LcN4=;
 b=CACNdOzc6LqNMFq6kPnIircggYeObOxxNPuHINANcM77at0McbSGOecAqdVeRIIuJ3
 vUyQTojLfycpDksk6ZE3/RHH7TcI8Ub6uKw/eBiuT6oTv/SLR4u3TNQ/vVRkJcBeMzRD
 vz1OWI65sHcPXAa+jUcsFBVW8AkACtyxBqyhNuWDhopkmjSKh+ZBNRKg3oPNzK60EnSF
 ja9nxOSB3jUmvjcpsm++JL3OHd0k7Z3xinKithi3rd4hL/9uPZf/AyOcjukBxZ9PMz/K
 taEsl4CTzJFxfklWHh6FknC3MkjPdy2rgDwLZCvjrKsYZJg9Zrsprwlly3nHRV5tg8a1
 SBVQ==
X-Gm-Message-State: AOAM5301PRmBsrfz2r5rpVDc5HnjCiGNFgArcCIDExUsRPUZOTIV+efH
 QgJm61z30EFprdk9k1C1hSdqROycmd61efGH/hFuMg==
X-Google-Smtp-Source: ABdhPJwZgyZD9DAvRTvevIrwihPTON7uK5jWWLxrkR+Wnn2HSb0H7RhPgRrIgLYR899I6nP8mpJ+rzybzF2sMZbacI0=
X-Received: by 2002:a05:6512:79:: with SMTP id
 i25mr660173lfo.549.1611595095275; 
 Mon, 25 Jan 2021 09:18:15 -0800 (PST)
MIME-Version: 1.0
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-9-rppt@kernel.org>
 <20210125161706.GE308988@casper.infradead.org>
In-Reply-To: <20210125161706.GE308988@casper.infradead.org>
From: Shakeel Butt <shakeelb@google.com>
Date: Mon, 25 Jan 2021 09:18:04 -0800
Message-ID: <CALvZod7rn_5oXT6Z+iRCeMX_iMRO9G_8FnwSRGpJJwyBz5Wpnw@mail.gmail.com>
Subject: Re: [PATCH v16 08/11] secretmem: add memcg accounting
To: Matthew Wilcox <willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_121820_222149_E2BD299F 
X-CRM114-Status: GOOD (  14.92  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux MM <linux-mm@kvack.org>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 8:20 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Jan 21, 2021 at 02:27:20PM +0200, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > Account memory consumed by secretmem to memcg. The accounting is updated
> > when the memory is actually allocated and freed.
>
> I think this is wrong.  It fails to account subsequent allocators from
> the same PMD.  If you want to track like this, you need separate pools
> per memcg.
>

Are these secretmem pools shared between different jobs/memcgs?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
