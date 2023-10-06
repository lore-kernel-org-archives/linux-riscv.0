Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588C0E94104
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 19:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nx3O7fr3nrmFPMOpfnUMeKkNrmuOYsX09ZJaLW6Dx6c=; b=XBwg8QTUfgplrW
	0EWS0ciI4rqvdcJfIgepN8/3qUC5ndBzK0Xc1cX7mElBsgYkDXZYFJx+gkodrSLojWmqrPOBOXCjL
	oNqUB2Iae7mmD7z43hIuYq9C4/D1Yl+X8ZimD4diPa5swCCoKIr22yQqCpqALXV3P4EOcRrL1V+5g
	T7pfs4E02mL+oMA08vvYCdYTGYfGWew2pZ86F2fC6jv6czvVglSyXxZ+LXNScQWht3jKjuvAOQfXS
	1o8OjcVkojCx47tTuC7x+MCMUqdvM3Ecq2tBlRHQ9YtBQHj0/C1hcqDb2ccbAXb+Xs88LEvV7ORq1
	MAYpLWx3DF4/XYf81qQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoqne-006PPP-1n;
	Fri, 06 Oct 2023 19:47:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoqna-006PP0-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 19:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B7DACE28FB;
	Fri,  6 Oct 2023 19:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A23C433C7;
	Fri,  6 Oct 2023 19:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696621663;
	bh=h0DLLJZqCZlG+/BaIeE1qTGFs+lWvxzxYNkN6b5g38E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ni0MjEaHF+7SUg/jgNB0F/EFSlY5Rx7mXGORS93Lqm3ftLmTcwLCTzd8Gj3ruGldL
	 Lp/tD0zEJ7E2NsimLDKVwqvPLnk8PlIVT1e+7M0mllsQOE/T7g2WtRMMWLWsZ+2Ws/
	 /tCU2DcJj30lTM0LW/PcN29PoAihSRX4H53qCt/3vYxUlVG8zSglonRkAGGkQCkMN1
	 07wZT274f7iTthdaoWIxvTbtG3KpcNHnR9S3Sh9OafhmqXN7Ou49vBhfrJFThEO93L
	 L0MaK2akLYss4R49XnIF4jU+84tUjM/ZJNNqiN+itv3BJg+2s9SZSjVgej0wBh5Epz
	 5hIq5w+jxbbmA==
Date: Fri, 6 Oct 2023 19:47:41 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: He-Jie Shih <bignose1007@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Message-ID: <20231006194741.GA68531@google.com>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230914001144.GA924@sol.localdomain>
 <ZQJdnCwf99Glggin@ghost>
 <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
 <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_124746_720135_3F052C44 
X-CRM114-Status: GOOD (  19.16  )
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

On Fri, Sep 15, 2023 at 11:21:28AM +0800, Jerry Shih wrote:
> On Sep 15, 2023, at 09:48, He-Jie Shih <bignose1007@gmail.com> wrote:
> 
> > On Sep 14, 2023, at 09:10, Charlie Jenkins <charlie@rivosinc.com> wrote:
> > 
> >> On Wed, Sep 13, 2023 at 05:11:44PM -0700, Eric Biggers wrote:
> >>> On Tue, Jul 11, 2023 at 05:37:31PM +0200, Heiko Stuebner wrote:
> >>> 
> >>> Hi Heiko!  Are you still working on this patchset?  And which of its
> >>> prerequisites still haven't been merged upstream?
> >>> 
> >>> - Eric
> >> It is my understanding that Heiko is taking a break from development, I
> >> don't think he will be working on this soon.
> > 
> > We would like to take over these RISC-V vector crypto implementations.
> > Our proposed implementations is under reviewing in OpenSSL pr.
> > And I will check the gluing parts between Linux kernel and OpenSSL.
> 
> The OpenSSL PR is at [1].
> And we are from SiFive.
> 
> -Jerry
> 
> [1]
> https://github.com/openssl/openssl/pull/21923

Hi Jerry, I'm wondering if you have an update on this?  Do you need any help?

I'm also wondering about riscv.pm and the choice of generating the crypto
instructions from .words instead of using the assembler.  It makes it
significantly harder to review the code, IMO.  Can we depend on assembler
support for these instructions, or is that just not ready yet?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
