Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAC8CFD376
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 06:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGjrhxNopmOKRBWgXsxX/gNR1Jy8E0MXiZmkShdNAvU=; b=pSXKUxx1jXcVby
	O3i4vG1kW1naiRHxl2uAMre382dCuDQtEiALcXmdaNWk8WZ/MCnp8HQbdgMfmrjY92Fh5oCOlQ6E0
	L1d+6V6ujjadxS7F+zQ6vGh9ILtpAOO8Pzx6D4kGng67+3ByBXa/IpYKHUOMAxwq05I6MmuVpLUrD
	/Lro4FQBwjdh9IYpOAzTGKxhTeXVVqG3Hab5VGG547P2RWu6BjLsT3SMQhBXd95orQ/CJf2Qo+8bJ
	ePdt5/5eHVCt3S8i8ZfaOTxZ6Hh6zPxYZ5NQmlmd3pKlVharVJnQKlMjFrZXv+XjCu7FU7stEyWjX
	ErusXQP8ExaB++OuO3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJwY-00000004uJA-1z9m;
	Tue, 02 Dec 2025 06:32:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJwW-00000004uIz-2nU4
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 06:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B061760054;
	Tue,  2 Dec 2025 06:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154CDC4CEF1;
	Tue,  2 Dec 2025 06:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764657175;
	bh=uq4FzFhbXgEfjRtm0v8jPvu/3eFqEqCLEHIabRwZTMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLuJ0Ckm5IS7nlUqKLi3MCoZ31aWBOxanAN27rKbwY03DJG26511TZawyBvPHgKZK
	 ZN6qa+FfikT8uVMcvZNDtWVjcj3CT2mdNqi+czrktL9QusIdMPELIwXmDPJffg+bpu
	 KErw7lDbdliaGRVu8au8yuVGNxv8jf05s9D4Gwkd8GQg05Cg3SWlnFiQeakYaIcLSG
	 8B7TQ7+cFtH3Fv/hdz3D30e3i9RLjKQVofjKv1ZkwrBEiCS0M5e+k/+4XgCFkz3Pxo
	 ZGGraR5KWVe0hasmv4ivp55mSi3M4guLzpGpN52fd3fsQZDVsV/jMIilGy0eOsPbSi
	 fqfo2lCAcUBbg==
Date: Mon, 1 Dec 2025 22:31:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Jerry Shih <jerry.shih@sifive.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: riscv/chacha: Avoid s0/fp register
Message-ID: <20251202063103.GA100366@sol>
References: <20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn>
 <20251202053119.GA1416@sol>
 <80cb6553-af8f-4fce-a010-dff3a33c3779@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80cb6553-af8f-4fce-a010-dff3a33c3779@iscas.ac.cn>
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

On Tue, Dec 02, 2025 at 02:24:46PM +0800, Vivian Wang wrote:
> On 12/2/25 13:31, Eric Biggers wrote:
> > On Tue, Dec 02, 2025 at 01:25:07PM +0800, Vivian Wang wrote:
> >> In chacha_zvkb, avoid using the s0 register, which is the frame pointer,
> >> by reallocating KEY0 to t5. This makes stack traces available if e.g. a
> >> crash happens in chacha_zvkb.
> >>
> >> No frame pointer maintenence is otherwise required since this is a leaf
> >> function.
> > maintenence => maintenance
> >
> Ouch... I swear I specifically checked this before sending, but
> apparently didn't see this. Thanks for the catch.
> 
> >>  SYM_FUNC_START(chacha_zvkb)
> >>  	addi		sp, sp, -96
> >> -	sd		s0, 0(sp)
> > I know it's annoying, but would you mind also changing the 96 to 88, and
> > decreasing all the offsets by 8, so that we don't leave a hole in the
> > stack where s0 used to be?  Likewise at the end of the function.
> 
> No can do. Stack alignment on RISC-V is 16 bytes, and 80 won't fit.
> 

Hmm, interesting.  It shouldn't actually matter, since this doesn't call
any other function, but we might as well leave it at 96 then.  I don't
think this was considered when any of the RISC-V crypto code was
written, but fortunately this is the only one that uses the stack.

Anyway, I guess I'll apply this as-is then.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
