Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36093C197A0
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 19:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IO/FV1R50OtT4RTP9e3Hiev1+8l04phGKOJTEVtQA5E=; b=IRKK8OdS2EgZav
	tfBYfjp3WyMdtofZO7nijXtk0p3chYA6UDVrnN3qpe7uo8MYfRUbQfaXQKG8NdTmR4YKoQG1QMoJG
	q09j6ewUwN3eNlt3V7pJjegq+NDBzg2vu6czflTzO7DfQrpcpcOsZrKtWPK7uGh1idgu6LA+JbkEi
	6gqd7EXbCDrXl+TjUibQS72x3O5Z6yrnOPiMn4k+MUOMY1F7HQXvCU2lRGJJ9puz9RbQoroeqg5z4
	mwyBwemKpqV1LGrZLAQfpncV5Lx0mKxKbuPYv2i7i8FxKYImAb5+87E0nGYruH67ZKol2S08UP2Mk
	I2121Om1fMQsxv4FncHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r59nS-00EghU-24;
	Mon, 20 Nov 2023 19:19:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r59nP-00Eggh-2s
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 19:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 975DA614CA;
	Mon, 20 Nov 2023 19:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA452C433C8;
	Mon, 20 Nov 2023 19:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700507938;
	bh=8GrqBpx0HG1TFaZKdiHie469Wi/VanH3SYoEwrBLjtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nsgSdljj2y1K4QXuI0J47MilWCgnCZU0WD/Xv3w+9CbSg+ZcuApxMhkpOdOZt1BI0
	 DIjT6Y8bjiNEqkZt1fHfgRZJk+hFhaGhQ6GX0DHgUrEQuVzjCe1ulUo+ORF/SRnv08
	 Y8i4NUJIxX8INL+TH9feVjcji1HRJ1xb7eMzp64HI/Bel7W4tyPqFAXe0aOu4pvtrc
	 LcmwVK9q+9Gk1bkJkBnmmgNjIHkFyqX0hAlCIRY7KY/6iDAVv27vMul3n1eJwWkI33
	 fHAIEUPYV2vrgM2nBMzJue2p9Dow8h8rdZu2kJgg2NvmPQQTgYji09NJ/AVoNAO2FG
	 CYORXBPpNN96g==
Date: Mon, 20 Nov 2023 11:18:56 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au,
	davem@davemloft.net, andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 12/12] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
Message-ID: <20231120191856.GA964@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-13-jerry.shih@sifive.com>
 <20231102054327.GH1498@sol.localdomain>
 <90E2B1B4-ACC1-4316-81CD-E919D3BD03BA@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90E2B1B4-ACC1-4316-81CD-E919D3BD03BA@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_111859_993176_FE83F69C 
X-CRM114-Status: GOOD (  11.92  )
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

Hi Jerry!

On Mon, Nov 20, 2023 at 10:55:15AM +0800, Jerry Shih wrote:
> >> +# - RV64I
> >> +# - RISC-V Vector ('V') with VLEN >= 128
> >> +# - RISC-V Vector Cryptography Bit-manipulation extension ('Zvkb')
> >> +# - RISC-V Zicclsm(Main memory supports misaligned loads/stores)
> > 
> > How is the presence of the Zicclsm extension guaranteed?
> > 
> > - Eric
> 
> I have the addition extension parser for `Zicclsm` in the v2 patch set.

First, I can see your updated patchset at branch
"dev/jerrys/vector-crypto-upstream-v2" of https://github.com/JerryShih/linux,
but I haven't seen it on the mailing list yet.  Are you planning to send it out?

Second, with your updated patchset, I'm not seeing any of the RISC-V optimized
algorithms be registered when I boot the kernel in QEMU.  This is caused by the
new check 'riscv_isa_extension_available(NULL, ZICCLSM)' not passing.  Is
checking for "Zicclsm" the correct way to determine whether unaligned memory
accesses are supported?

I'm using 'qemu-system-riscv64 -cpu max -machine virt', with the very latest
QEMU commit (af9264da80073435), so it should have all the CPU features.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
