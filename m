Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F82C636D4
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 19:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zotLaka2cZCI1cERJiVZftqrgNzLSMUEuw+YOkqwVYI=; b=SMkT/l/kkkSnQZ
	sID4B1ZbdarJJdYLuq7rJRrt5ZqvJ6UISUfk+3PqsUXXCOQO8hGwsiWlBLWtHkxXufzu23nzLCw5L
	A5hL4jlqCi3Mzp3Gdu2YWcwMssXlPiPPPm8gxwj0u6l9ce25zJ+/vyGWxOuZoeh5K3KOVKOquXTX+
	3kJ4YDDFFME0yymywZW65ddKheY4+V0k7UMgYsXsWkufxGsAmYK6lzXOR0a6zYSZo3+mX4keukCPJ
	NUVE+xIAHJbs1cpXDbdvUC/7W77RNdCb/3yAcZbLaPLf3KY2qSgwmtb+Rl3V8ldHr4oIXZKmUTprh
	gWd8geTAN5VUAxdFP3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJ5s-00DQfA-9F; Wed, 01 Feb 2023 19:48:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJ5p-00DQec-TW
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 19:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675280907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+c79xB9zEm9gbVZK1/vCc0nmGWw5K68MnzSgOcRJD38=;
	b=JcRQbMHJYmeymltSUOs2n1NR6P8Hsh1ihvegc+xryf7yv9qmSoxhY/nFzVk0m/KR1ssE+h
	RGui/0Z+yN3ne3KCRWAegC4GBFXkMQ8/g4bseIolNYfO+JheLSLfbDi4zHwWfsQgKdOkUd
	siqFVch9zwjvuQBKKalMm8T0biUFMnE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-F5GXZDoCOFeFVi1PdHFPPQ-1; Wed, 01 Feb 2023 14:48:25 -0500
X-MC-Unique: F5GXZDoCOFeFVi1PdHFPPQ-1
Received: by mail-qt1-f197.google.com with SMTP id c16-20020ac85190000000b003b841d1118aso5922483qtn.17
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 11:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+c79xB9zEm9gbVZK1/vCc0nmGWw5K68MnzSgOcRJD38=;
        b=HHGp/qujqOSqnWMP6h1Wn5gFJmdAv9gWwBKhejRUqhnZAmJK8pBcSTflF4NK7vPFmn
         WKhtLY+ifMKCDJ4J9ieBmQRjpXMgkUu1jENbjkBf+yT6yNiKf/kYkyaDZBRbuJ99V0qK
         cy9rOR1bFXNUXY5xe5cQatoeoIKtlBNkoY8UVy03DTC6qfsTPgzVVtXF0nDe5QPDEho6
         wZ5XKrKOTMme4jqCTmfxe5yQwBw3vxPcQ787Cs1yXaueHd2pCdv3oHcGfCX1qZzjGbYS
         wKJEwb6G/nNvnk/YlEQEoRkshKBDzBflNaQH2ch8vJezrDEP/9XDfDbCFhTgMlIaU2q5
         NgTA==
X-Gm-Message-State: AO0yUKUcV0nMXQ6D+bw5eWEHK6RI3DQEmK/5XRRTxBYOLZBNDZIBHTKY
	fycApahyoR5hnrUMhJDVdIc88iV8DS7vD8OOGvT6AaBXNapP9eikU5O6IHjpSxcLQYseBhRF1r5
	tScmJkmmmGiAC//8RuKBAGmPWgCCo
X-Received: by 2002:ac8:4b79:0:b0:3b9:b801:8744 with SMTP id g25-20020ac84b79000000b003b9b8018744mr4668666qts.4.1675280905103;
        Wed, 01 Feb 2023 11:48:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+aCjVIaFs+qYlZN/COXif7CSKdOwvIaVTtsTOFsLRWV42aeSjrEadyR6ifeMCBEfyQD+z4OA==
X-Received: by 2002:ac8:4b79:0:b0:3b9:b801:8744 with SMTP id g25-20020ac84b79000000b003b9b8018744mr4668639qts.4.1675280904733;
        Wed, 01 Feb 2023 11:48:24 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
        by smtp.gmail.com with ESMTPSA id a3-20020a05620a16c300b0070495934152sm4421885qkn.48.2023.02.01.11.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 11:48:24 -0800 (PST)
Date: Wed, 1 Feb 2023 14:48:22 -0500
From: Peter Xu <peterx@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Message-ID: <Y9rCBqwbLlLf1fHe@x1n>
References: <Y9lz6yk113LmC9SI@ZenIV>
 <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
 <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <Y9mM5wiEhepjJcN0@ZenIV>
 <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_114830_140094_164F3031 
X-CRM114-Status: GOOD (  20.39  )
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

On Tue, Jan 31, 2023 at 04:00:22PM -0800, Linus Torvalds wrote:
> So most of the time it's probably not going to matter all that much
> which signal gets sent in practice.

I do also see a common pattern of the possibility to have a generic fault
handler like generic_page_fault().

It probably should start with taking the mmap_sem until providing some
retval that is much easier to digest further by the arch-dependent code, so
it can directly do something rather than parsing the bitmask in a
duplicated way (hence the new retval should hopefully not a bitmask anymore
but a "what to do").

Maybe it can be something like:

/**
 * enum page_fault_retval - Higher level fault retval, generalized from
 * vm_fault_reason above that is only used by hardware page fault handlers.
 * It generalizes the bitmask-versioned retval into something that the arch
 * dependent code should react upon.
 *
 * @PF_RET_COMPLETED:		The page fault is completed successfully
 * @PF_RET_BAD_AREA:		The page fault address falls in a bad area
 *				(e.g., vma not found, expand_stack() fails..)
 * @PF_RET_ACCESS_ERR:		The page fault has access errors
 *				(e.g., write fault on !VM_WRITE vmas)
 * @PF_RET_KERN_FIXUP:		The page fault requires kernel fixups
 *				(e.g., during copy_to_user() but fault failed?)
 * @PF_RET_HWPOISON:		The page fault encountered poisoned pages
 * @PF_RET_SIGNAL:		The page fault encountered poisoned pages
 * ...
 */
enum page_fault_retval {
	PF_RET_DONE = 0,
	PF_RET_BAD_AREA,
	PF_RET_ACCESS_ERR,
	PF_RET_KERN_FIXUP,
        PF_RET_HWPOISON,
        PF_RET_SIGNAL,
	...
};

As a start we may still want to return some more information (perhaps still
the vm_fault_t alongside?  Or another union that will provide different
information based on different PF_RET_*).  One major thing is I see how we
handle VM_FAULT_HWPOISON and also the fact that we encode something more
into the bitmask on page sizes (VM_FAULT_HINDEX_MASK).

So the generic helper could, hopefully, hide the complexity of:

  - Taking and releasing of mmap lock
  - find_vma(), and also relevant checks on access or stack handling
  - handle_mm_fault() itself (of course...)
  - detect signals
  - handle page fault retries (so, in the new layer of retval there should
    have nothing telling it to retry; it should always be the ultimate result)
  - parse different errors into "what the arch code should do", and
    generalize the common ones, e.g.
    - OOM, do pagefault_out_of_memory() for user-mode
    - VM_FAULT_SIGSEGV, which should be able to merge into PF_RET_BAD_AREA?
    - ...

It'll simplify things if we can unify some small details like whether the
-EFAULT above should contain a sigbus.

A trivial detail I found when I was looking at this is, x86_64 passes in
different signals to kernelmode_fixup_or_oops() - in do_user_addr_fault()
there're three call sites and each of them pass over a differerent signal.
IIUC that will only make a difference if there's a nested page fault during
the vsyscall emulation (but I may be wrong too because I'm new to this
code), and I have no idea when it'll happen and whether that needs to be
strictly followed.

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
