Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AE3C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 01:50:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D7D6135F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 01:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D7D6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zl0bx7PqIUUVp+G7aHwiWCSdKkJ8x4fEVnwA97maZ1s=; b=njwWax1bK61nEpLYesgVwx4UZ
	/5br92/0Kz38XZvsZENwF4FLYfISSfMDjaS0PWmSjYIjaojDUJoENbqiv1c+xAWEKZMQBkc8YCJ4A
	JJbYco/Lxe1zKk4iCRvH/wBhMZWbH/et06Qx7nEjKfhY68bbt7O3AD1KtVl99pD2ASNJFQS8HCC5t
	8vO76TGYGjHfdb9r1noqEaA3s+JaP6g9Mj06op/4OM5/jW47t3yY5hzDd/mKjZAaohFHsbLo+YOHl
	xARzTmqsX3cze8ad9lbDPEj5ZYfDuzVYc1wR1zlHco3pKeOv/kwC0bFaOcBVPw5ilMrSmvIKpm8Y7
	Ab5fI+NvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljBLY-002OzQ-Ei; Wed, 19 May 2021 01:50:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljBLU-002OyR-GD
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 01:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oy9iy31YW42GgULMnDfqqrgoX8PmHZpkik30uv+f1aA=; b=suvoKTvClCPrcqBIGQ2K9NiYW2
 /YUnq92wStuDzW5+hNBamyB76UkRKI4wWt5FuVute8g0qnwFWa3E7EXaiF4hsqXuIlbmgPgZVYZwE
 Kd6BorMekGqhvAiiZHUfyVaUPHvavTx6J0MxfUJ2l2l7NVweKFiYp2qSabCJLZNDy2pBOOo/cxW3b
 fvIjUghysPw/U3VTmrhS8k9/Oj/pa6L3AxCR9kQV0hfQp1JFZYG2ggTG/Bdbrv5ds2WjLKlINZaXi
 SvOpMcJiJeZ1zPudmdTpjTs4ZIjPQrHStUJj1hB3jGz2UQ23IhsbRGmeTkq7Q1ye5A4OMfYc9Zqlb
 uWbSJ/Pg==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljBLQ-00F4Ip-Tl
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 01:49:58 +0000
Received: by mail-ed1-x529.google.com with SMTP id a25so13414171edr.12
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oy9iy31YW42GgULMnDfqqrgoX8PmHZpkik30uv+f1aA=;
 b=tvQ2E7Kd2+Hf+RN1JCJdnQu6RymaGP0zziznDt8ISnI+jG1I9F5rTtPCJWa6PikhKh
 XFhKmAAqHeMsUAOgy6hUDl59IPnHpchWu1cnHTyyjxMolBXIohuKR723SkE7OCNxzAbK
 oygZjSu1ZC0vRf3URWfxhzVNd3YMtTfsohBEjCi0q+/uREUxDQtHtMXYqH6q8d9eUBIB
 218/C9Rmj+pEf1HRmaUjm/IPbnYkBLCQnR3DkYGpm/9v4+VmsDb6lUfsBZ8rq8wjdtNW
 PEFTJvZlWna6c3qGn3K9JEbsQ5ZbIkKlwDebT3ZVImG1L8u/VdgWTl83Y5Z5wVd6ZNag
 17jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oy9iy31YW42GgULMnDfqqrgoX8PmHZpkik30uv+f1aA=;
 b=PTHc0ME82+UlEX/PvmWrR4bX/T9hRBDfIuxzhumRTiWx+mxaXNGmaraXQDwu6tDvwV
 Lrvl4yWhGvKVyRzjRTiIgAAeCxPpppy58mRDSz6uKjy5YK1qdc6BUhcPxy9P+DIqPAtr
 jU/1I/7rMu7957PQtJTHottnWkWdOtrD5ObQgo4oRzBM4xqNAj+FVuzPLsPKJQqRxcmh
 q1QHqJNbzzmlE1QLrmlV5Z4Hjdtka6aOc7NXyKTY5ukXGEP3wwUFv6QBngbYPK67hExg
 JYIrwClPN3oaAlX+G6WKFq4InfzxImepLBnZFRa+qtBkZ7U03GZ5IqDQuUGoD7PP3V4d
 lMvg==
X-Gm-Message-State: AOAM532hEJi2FXJDLYlXTfd+4V3oKuou9taACxjBgvlTwfbHeMA33H6N
 xoS8Sssi4kRiwp98roaTBj+UeV6kmLy7UNBEp0I9fA==
X-Google-Smtp-Source: ABdhPJzCebUO43WPo6zd3pAT6bxEi4LXjBLrk7zln8XX7z9KqzudweIVCjqD+YotU9S81wu4CFwPj9RiJ4aku6RH+xo=
X-Received: by 2002:a50:ff13:: with SMTP id a19mr10495865edu.300.1621388993652; 
 Tue, 18 May 2021 18:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-7-rppt@kernel.org>
 <20210518102424.GD82842@C02TD0UTHF1T.local>
 <d99864e677cec4ed83e52c4417c58bbe5fd728b1.camel@linux.ibm.com>
In-Reply-To: <d99864e677cec4ed83e52c4417c58bbe5fd728b1.camel@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 18 May 2021 18:49:42 -0700
Message-ID: <CAPcyv4hwZ2e-xzsySOjaJXDSXRKctsoGA5zW-enTn2Y9ezWPVw@mail.gmail.com>
Subject: Re: [PATCH v19 6/8] PM: hibernate: disable when there are active
 secretmem users
To: James Bottomley <jejb@linux.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Christopher Lameter <cl@linux.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Hagen Paul Pfeifer <hagen@jauu.net>, Ingo Molnar <mingo@redhat.com>,
 Kees Cook <keescook@chromium.org>, 
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>, 
 Matthew Garrett <mjg59@srcf.ucam.org>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@linux.ibm.com>, Michael Kerrisk <mtk.manpages@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>,
 Will Deacon <will@kernel.org>, 
 Yury Norov <yury.norov@gmail.com>, Linux API <linux-api@vger.kernel.org>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, 
 linux-nvdimm <linux-nvdimm@lists.01.org>, linux-riscv@lists.infradead.org, 
 X86 ML <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_184956_968771_28E7A104 
X-CRM114-Status: GOOD (  27.58  )
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

On Tue, May 18, 2021 at 6:33 PM James Bottomley <jejb@linux.ibm.com> wrote:
>
> On Tue, 2021-05-18 at 11:24 +0100, Mark Rutland wrote:
> > On Thu, May 13, 2021 at 09:47:32PM +0300, Mike Rapoport wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > >
> > > It is unsafe to allow saving of secretmem areas to the hibernation
> > > snapshot as they would be visible after the resume and this
> > > essentially will defeat the purpose of secret memory mappings.
> > >
> > > Prevent hibernation whenever there are active secret memory users.
> >
> > Have we thought about how this is going to work in practice, e.g. on
> > mobile systems? It seems to me that there are a variety of common
> > applications which might want to use this which people don't expect
> > to inhibit hibernate (e.g. authentication agents, web browsers).
>
> If mobile systems require hibernate, then the choice is to disable this
> functionality or implement a secure hibernation store.   I also thought
> most mobile hibernation was basically equivalent to S3, in which case
> there's no actual writing of ram into storage, in which case there's no
> security barrier and likely the inhibition needs to be made a bit more
> specific to the suspend to disk case?
>
> > Are we happy to say that any userspace application can incidentally
> > inhibit hibernate?
>
> Well, yes, for the laptop use case because we don't want suspend to
> disk to be able to compromise the secret area.  You can disable this
> for mobile if you like, or work out how to implement hibernate securely
> if you're really suspending to disk.

Forgive me if this was already asked and answered. Why not document
that secretmem is ephemeral in the case of hibernate and push the
problem to userspace to disable hibernation? In other words
hibernation causes applications to need to reload their secretmem, it
will be destroyed on the way down and SIGBUS afterwards. That at least
gives a system the flexibility to either sacrifice hibernate for
secretmem (with a userspace controlled policy), or sacrifice secretmem
using processes for hibernate.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
