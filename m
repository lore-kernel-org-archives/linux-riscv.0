Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66C7D41173
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNmO5bulGJkAkHEXBSRZDgOTTguHReWE+bdPKY3BSHU=; b=IEbzTva0sNTiOO
	6xWhVEVFS6IVqwEF5XFN3fMO+MWstrB/YZysc8lZcGDNohJVBqRpObSwjg+DMGBbrdCR5hxGKoD5Z
	0LZYP2P6oiM0ebQNhfzNb6YP57toXF/bJTNRYrjUrL4rEbKDjF5wHkysFa5BGXXbVlkJ/EBAyYfAp
	oh/czujHP6S0LKKLhbqMAk21xZOkYWFQLJWbvJSQ68/TDGNip2bVTOY6Qvg34bGg1nlOgJLXQdZIn
	gJyvXAWAS+Sn3YIQJI2mpNhtF5bP25qUX4HRw5POBkKoOEDmQn355X7wwQOlP6Tr7R1yiwLBYsOgp
	5ZozOIWucx1IvgQ6j48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLOL-0000000CDNu-2XdN;
	Thu, 15 Jan 2026 11:19:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLOI-0000000CDNY-47LW
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 11:19:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso4342495e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 03:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768475989; x=1769080789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n5Iwv4OpzY/oyHRbv26E5R+0lDzShBgLxDUSDNn/6k=;
        b=Ys+BY8t2Ql6Nhar4IknwALfGB3vcYFQm428jaewplMDMZalbw+KgypAKd9gVNFAyMA
         CVve28Ff6d85vFVTOzEdbMHWMgXyEp5hpsbhoS+45fVezJGkahOF5U5dWgyjYthJY9/I
         /Cky6/4D0S7BPtWXNbcbbldy5Sw/Eo6FPLo31t04mKWGxezxKLqjoYXHSdusmXEDJsV2
         9ZTbaUsh6fU7ur1rCNOT6t5z5QMGjtv1ZWx6/cRCfNKho7xnp+Pp4DwO90ic7kcKI9Cp
         p14SxIr/N1l9HLgv0AQ3MQDWOC/vXFyOg8aUk57Y+47W9GF0qcwBtOZq4Cd1gCCGz7qn
         /zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768475989; x=1769080789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3n5Iwv4OpzY/oyHRbv26E5R+0lDzShBgLxDUSDNn/6k=;
        b=wNy3wJT3Yk/DqpghacLj7uV5OyWLrVmzdhIK1UMuNzpEHxXMN+dlaiT67NHabP+78W
         /hYjLG9dZ9s7Ya4rmtVhQjGy9pkf/o8a2kocftQdKjHt8NwcPBvT+c0bZy+l4uuwK76o
         /41pUXFOy7kfqKj3XBkIioO8gY7qdqWvKgUeSWcJg4Qz2zJ5JHXPKlEGX8IKDn7UXAmU
         NpgFv2O3VKcaBBsIIaK9N25jb248ggGn2aPPYTczcz+7QdJxohEvLqVE+yeKlLg+gwQs
         rwKgu5PlbeBpMlaiOGOxY71Pr/mK81qkQNv98mk4WeK1VlrF3RVmmtjRjITuvnMap9VV
         tflQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPrTB/KVJfuEGM+NbopMyZMPQeR4BpM+D8NkalYeBFnpH7vSWvig/4A/lSYxYLwiE7DOFmOX2mMTLeDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhIE0ko4AsazHdoto+jtG33pqBgMctNPdPEY3x9pALOWmVDgfA
	dk5Jr0XQnknbv8akNSBd8Xtsfk8PKqHoYokFSnFN9zU/jUPgW+yT8VZ+
X-Gm-Gg: AY/fxX7qycyst3l0wVv3wOXPGVv1Fezrkg1LHN6QJ8xerbbCFoexI5e+mTqRJxJFpqa
	0ZB1kc9khAYVf6uvHRi6BuPYcYRO/IrPbOnLvkBwuBr+4WZ8WZ5Q+6AZ1kDg5r1RYNt1bSGSeTp
	ONiO/sCjhcnioOhBuvOL9jiwLI8FSCEvPUstSpxHq6wVser9fTj6TAEzjq180cKcpi0w2hu7cEY
	YVBG9fhrCmphjuiJVRR8nkMmFv0cBdB7wua581ZvNxJea9nTIUWoEpqEYwoShrLngisuCPsLYtp
	I5iOwuJXf5CUyoNi7Xms6YTC4pSqIxMkMH881wWe02Sb+umVohB1d6/J4bzPhYBnVC/L8Stfcp4
	ZtLLdKoq+Et7Ru+yTwPVJ8WctWh9W94Q6c7PiMMuEnjK8IkeF87KAYDHb5tciWLKL+OU/nkf0hK
	pw9H9JEkIcN/FKQ/pqgjpEvL+NqJ8aBj3ekD8OgU+l9dA/CfvYLeP7
X-Received: by 2002:a05:600c:3b0c:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-47ee33b0db8mr58272745e9.35.1768475989020;
        Thu, 15 Jan 2026 03:19:49 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee2814587sm40841935e9.10.2026.01.15.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:19:48 -0800 (PST)
Date: Thu, 15 Jan 2026 11:19:47 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Feng Jiang <jiangfeng@kylinos.cn>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
 charlie@rivosinc.com, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: lib: optimize strlen loop efficiency
Message-ID: <20260115111947.54929ed0@pumpkin>
In-Reply-To: <d356705a-843c-06dc-38a3-77eae7d2ef59@kernel.org>
References: <20251218032614.57356-1-jiangfeng@kylinos.cn>
	<d356705a-843c-06dc-38a3-77eae7d2ef59@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_031951_058596_AF1225F1 
X-CRM114-Status: GOOD (  14.40  )
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

On Wed, 14 Jan 2026 19:03:17 -0700 (MST)
Paul Walmsley <pjw@kernel.org> wrote:

> On Thu, 18 Dec 2025, Feng Jiang wrote:
> 
> > Optimize the generic strlen implementation by using a pre-decrement
> > pointer. This reduces the loop body from 4 instructions to 3 and
> > eliminates the unconditional jump ('j').
> > 
> > Old loop (4 instructions, 2 branches):
> >   1: lbu t0, 0(t1); beqz t0, 2f; addi t1, t1, 1; j 1b
> > 
> > New loop (3 instructions, 1 branch):
> >   1: addi t1, t1, 1; lbu t0, 0(t1); bnez t0, 1b

Is that a change to the generic C code?
Testing (++sc)[-1] might do the trick without requiring the extra read
of the first location.

> > 
> > This change improves execution efficiency and reduces branch pressure
> > for systems without the Zbb extension.
> 
> Looks reasonable; do you have any benchmarks on hardware that you can 
> share?  Any reason why this patch stands alone and isn't rolled up as part 
> of your "optimize string function" series?

For 64bit you can do a lot better (in C) by loading 64bit words and doing
the correct 'shift and mask' sequence to detect a zero byte.
It usually isn't worth in for 32bit.

Does need to handle a mis-aligned base - eg by masking the bits off
the base pointer and or'ing in non-zero values to the value read from
the base pointer.

	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
