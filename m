Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462D9CCD1BF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 21:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8BE/zrsOcxnpt1o1CwqsFdk96yshXeKSsLFwYO3z20=; b=AkBDaWWtcfQNse
	5XqTPn33W/wno4D55UmB1ZA1CTM6cwvkCeXYMPno0HntMs79eO5UxvXLnih6WE5m9jZ6iTdheexjo
	aQVF9+eRNGfmf7SDGep8LujFS33y5uJINLafTyBQjhaQYMojV5VWC3bdEO9ilfeYomuF08BjWAprC
	A7wuLlYPCGQZDnusqoFxdp9RM6jLTsoyjsFuHgatzmS/CmI7G0Egit10vgGNsoeRyW+rguCY2uHnU
	gry4vfYz/Ub9aUB8T9nZSIAGU1d4QpGPubbTtKtgWuZmvfBgkvdkyZ7hZr8RuiTANrG9+rykLQWFG
	2oH0F4dJy+cfRAiu+EKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2eC-00000007cfZ-1VQw;
	Thu, 23 Oct 2025 21:15:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2eA-00000007cfF-3fTb
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Oct 2025 21:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z6sEiHIDuaPc1r9BapkeRLwxlBj8uKP+Q15MeH29iBY=; b=lnOU+B7TlZ2WrLmZYn7ahzJvx2
	iimPjo6MrAV/0EX/+LhsDsoQvrz0ANXJO/03uBtWUn0U7kbaDFUdBlTkh1Wh307eH+ELEpB/nRPtP
	HSwlTPTLiBgOtrUWVbUAn4ALNqEH61JfNShCK2EVE2jPKpQF8mNhbAmLeRNwlfiRy68imN3a3Tw5q
	ipRmbiOKnAqrFTKtZg+s7xfJ3kXBGOT8RQZ2Z7DpEJ2TwBN2uLM1oelhZbQ6iCTnr9CV1dgPE6gEp
	qQ5i32j/sJHTy454Zlni5sw0jq30rIDmspcz76lSWGEM0XSPNYzpZc65XsU89WCp7FU4cbDhHn7dP
	/YBVYYBw==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1mT-00000001lT3-0LaM
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 20:19:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-428564f8d16so728113f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 14:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761254093; x=1761858893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6sEiHIDuaPc1r9BapkeRLwxlBj8uKP+Q15MeH29iBY=;
        b=AOiSM1X3ScYZBNIeIckcc/m0pZJsuSlGDyEMWzRijc5O11NQzzkfnJjJ9JTR0oRios
         6wsP+ZxuWMz0l/fXY8e+9GmxB9Z8JpthjUMwfC6fLoDA+6sMz2isCwgL8SFImSy45dBJ
         6HLFTBkB0JTGAh8ZKCReDcIH+vyiT6Ok0DLjZOsHxlyboCH5lHH5gj6+9NOtSJLqBN0U
         5mlCRWZrFSm2vkFeO070J9adbb/U1PV8mpCK8+YytzqfUdhjeOTq8vf8LAE+kD560OQa
         fPyTR3fuDQe0VX6AqAwoLJSkk9PFszz35ksQpQjNPAJasELMifJmOO9ySFX5rf3rzKEH
         5Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761254093; x=1761858893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6sEiHIDuaPc1r9BapkeRLwxlBj8uKP+Q15MeH29iBY=;
        b=I5oNzPCSkedM/bQwDROP48XspCec6+q7OKx/+B6DCD0GEr9Bme1vR9FTd98I28MdT5
         a0oYf3O24kA8agdawd7EplQfnN9N1vyrd6WR2Vnc9Hi6tBYEvJl78DbWW33hRkdeheS9
         s7lX2pyyXZY5312fSQxB7SybsVDCnJCPe6E9wqNjLtdmpFOCKX1avZZLrpW4dz+FuDyQ
         oY3Cd5kPFSFD++r1u/SyF8P4DiXWk3zcY9rbYXR8dDIYiiC/BiIT8Az3K5x/qNQAlXvo
         FHTPdXzLBCXCVkrZ2W1VmLoT4RwMB+upmIx9P1V/oVRI/CQB6MA3zjebkW84mL909sSf
         +fVg==
X-Forwarded-Encrypted: i=1; AJvYcCVhT+XmUb1wSOQbkGH/NUp+FDla+pgXPOa5hoQStN4bMTVXokaw1KZLMhLALhe2BYZMTt6QG3/dgrWbaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/skLSk9Aa0abozEjwaf109n0B0u30k7osC62z00oaglAz5XfO
	b7OHvPmouS6NWgLXsaaB0mHLAVR7SQVHsWbq7j91aXR3KSwwxQMR8U+R
X-Gm-Gg: ASbGnct0a2SCvEzQEBc8CHJs/UPenqAKo7rVIjvjzsIaxvNHAaYbERfm8uXNjTbZEjA
	vsEqgrmIeD81KY382YHUl6plLOoIX7wvzKe+RAf68MqQs+jVOrBBg1X9g8oO7Dea2ASImqHXoex
	ZjKhBVG6SaRzF8Ag9isYTLrpbetQovj8NE3wm6HupuZ15tZgwXv+F2++TEWOFXfwzwXoQxicRib
	6QAeiIJWx7Us2K6ZSX+s6f5lh1u1PtWZ0pvmi7XqUnX7SCVTOOHKXRQOf9EP/BqcWd/3Lv1kn2+
	BHkJRPXyKQo36igG82WcNQbkyaaVqFh0LLHf5+x+1dHw6jxNIqoLjZ2VdxALtNIgzJ/wRFV01fl
	dI5lKcrlS2CKD2/1CfRQO7UzZjO+L0nkH1rXEbQRGCnuU85rH9UAaBn+MtGhMFSmaGC3egoYaji
	R7R9amBomwRabeP2A2iPV5jw+i/zyvnn5zQfyMdS27ug==
X-Google-Smtp-Source: AGHT+IGk8eEDWy3Lb1qhGeYZ8N0urG/YCIu8xY7+WZCUmyVKdYxjr9Zc6A6l5BFcgm2g7Vw9SfAVXA==
X-Received: by 2002:a05:6000:1446:b0:427:374:d91e with SMTP id ffacd0b85a97d-4298f545550mr248975f8f.11.1761254093423;
        Thu, 23 Oct 2025 14:14:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897ff3f5sm5951290f8f.22.2025.10.23.14.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:14:53 -0700 (PDT)
Date: Thu, 23 Oct 2025 22:14:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML
 <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, kernel test robot
 <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
Message-ID: <20251023221450.1303003d@pumpkin>
In-Reply-To: <CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
References: <20251022102427.400699796@linutronix.de>
	<20251022103112.478876605@linutronix.de>
	<CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
	<873479xxtu.ffs@tglx>
	<CAHk-=wjoQvKpfB4X0ftqM0P0kzaZxor7C1JBC5PrLPY-ca=fnA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_211929_229877_60BD1E81 
X-CRM114-Status: GOOD (  14.50  )
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

On Thu, 23 Oct 2025 09:26:12 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, 23 Oct 2025 at 08:44, Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > But as you said out-of-line function call it occured to me that these
> > helpers might be just named get/put_user_inline(). Hmm?  
> 
> Yeah, with a comment that clearly says "you need to have actual
> performance numbers for why this needs to be inlined" for people to
> use it.

Avoiding an extra clac/stac pair for two accesses might be enough.
But for a single access it might be hard to justify.

(Even if 'return' instructions are horribly painful.
Although anyone chasing performance is probably using a local system
and just disables all that 'stuff'.)

> 
>            Linus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
