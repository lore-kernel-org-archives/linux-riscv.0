Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCCFC636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 00:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4i0VKAJFTD937bmNl8prdm4Gewxh5We25+Pi4qIcBBc=; b=khF2J52i3Wdz0Z
	pG2MInromMxDIKiGPQcOj1jaaz4d1Koj079XZXwEeBMypLOOqfNNTL/nk4HLI4DY3SHJD6fBWLsXy
	2VrT1oMsRTLUsu3TjBuO+ju9l5qUQbu+bGH2/wFwx+s82z11cWSQXS6FxUQbIFFj/tIS6rAeboQJa
	xIPzNl78iX2KvT7c+5xCADuWeJnBeD+qB3l4Xiuoggy/qU79wTASCKv4UDcY3AwZoIkNvtVBIdWVa
	aZEfzTCgb1BaYtAB4hp2P4vkB2GKbaYA1PTFkh04CRxPoHFpN01m6xPP4Fb/jm9m2OMAe6c5S9pyW
	/4ADq19B63fuJnxeJwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN0YQ-009j84-JY; Wed, 01 Feb 2023 00:00:46 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN0YN-009j70-OY
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 00:00:45 +0000
Received: by mail-ej1-x62f.google.com with SMTP id me3so46543123ejb.7
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 16:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lRCOdD9CD/IiFJ43pipYPy+q1tidOpGH1rcqkIGuMSQ=;
        b=fL59Ab7RHJP0bfIYtovRgam/bmLVqgi/HuOZuRtvXpi8XPCKPsz19TVQkwQ/4pcElK
         nbpNee2j9nRk73RFGNcIlDQDDv7dgJ9GC8xvsYkG1wEa43drPEZkLrJIAfsAF0ElYFBV
         ZenNmi1Qr0FBP87JP4qtwax7RH2E68mH3aIp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRCOdD9CD/IiFJ43pipYPy+q1tidOpGH1rcqkIGuMSQ=;
        b=sSiZAkHU3n5wJFXEDeNqdozXc5Z4D18Cn/xaFBrQujSjysw2bpzmB83D5rDdznqWcw
         7XdtYEAb5kNH+hO5m4fXlMtCdZTNfplxWkadYeypLew4QTnF6V6Fc2Tl60RlWCC/2swS
         0TAAWLgaC1K4pxL3E+AmYKCH1W4Z03aMwX3vTqpfX7rKJVSKt7ju++c+O+nCkT2Rn9Fz
         eOb+DdkYGF745aF/7X8tzy1q6zzZNn/1D3ExaGr8sJLOGUErdqowOj11vDoCDMTt7ZJx
         N0LdwZVmgV9IuARz0SOY1gUB0WUE1Xg/b9RvKSwP4r0afESYywq9/FvzaVJTuSVCzExe
         rEgQ==
X-Gm-Message-State: AO0yUKU2zLQPcrIJjvLgNRw8Od1LLcdIQOyAov5T85KRMpftQ+VXERQb
	oY9NVe7Aw9h1sVL4GQDI2gTWe0//48doX5iTGX4=
X-Google-Smtp-Source: AK7set+Zs/OVGTp9PEPpnC5o4m8dOC5GhbW2UsWc4QiFJP3UhtkxIIjyWtPuyk8mfV37WdQFCq7RYQ==
X-Received: by 2002:a17:906:88a:b0:86f:1227:7a48 with SMTP id n10-20020a170906088a00b0086f12277a48mr290473eje.17.1675209640990;
        Tue, 31 Jan 2023 16:00:40 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id i9-20020a05640200c900b0049ef04ad502sm1247634edu.40.2023.01.31.16.00.40
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 16:00:40 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id mc11so24036337ejb.10
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 16:00:40 -0800 (PST)
X-Received: by 2002:a17:906:184a:b0:878:70c8:14f0 with SMTP id
 w10-20020a170906184a00b0087870c814f0mr84229eje.20.1675209639791; Tue, 31 Jan
 2023 16:00:39 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV> <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <Y9mM5wiEhepjJcN0@ZenIV>
In-Reply-To: <Y9mM5wiEhepjJcN0@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Jan 2023 16:00:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
Message-ID: <CAHk-=wjNwwnBckTo8HLSdsd1ndoAR=5RBoZhdOyzhsnDAYWL9g@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_160043_828131_9300D1F5 
X-CRM114-Status: GOOD (  13.15  )
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

On Tue, Jan 31, 2023 at 1:49 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Everything else seems to be going with EFAULT.

So I think fo kernel faults it's always basically up to the exception
handler, and sending a signal regardless of that is just wrong.

Of course, an exception handler might choose to send a signal, but it
just shouldn't be the do_page_fault() handler that does it.

For user faults, I think the rule ends up being that "if there's no
mapping, or if there is a protection fault, then we should do
SIGSEGV".

If there's an actual mapping in place, and the mapping has the right
permissions for the access, but fails for some *other* reason, then we
send SIGBUS.

So a shared mmap past the end of the file (but within the area that
was used for mmap) would SIGBUS, while a write to a read-only mapping
would SIGSEGV.

Things like unaligned accesses also might SIGBUS rather than SIGSEGV.

And I'm not surprised that there are exceptions to the rule, because
almost nothing really cares. In most situations, it's a fatal error.
And even when catching them, the end result is generally the same
(either "print out helpful message and die", or "longjump to some safe
code").

So most of the time it's probably not going to matter all that much
which signal gets sent in practice.

            Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
