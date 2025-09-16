Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4ECCAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 17:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E602aOhYBiGsWGBI4dGbPW0IQqM6GigG5Uc3ApG1+70=; b=ju3NcB3pbriUOm
	mGrkwDHWuOlGOReytKn+37ZbuDgU3XIk3G6+gQqZXuituoDwcmnOpQWcyKlMjJWpxHyMpKR2Rnwii
	C+rQlJAAHGY9k60nErE1XgD6+kHqpRJFZ7t6q1KRgoRJVrkGe+da4vJVojn2Urzz2s756ThrAmpmt
	xdUz2v168bukykfFxOSyh1DDXuhJTsDVN9XXbnuy8Kpwmy0zoV4sipAyU6oo+YbrInBOQ+wON8rVP
	50uLgH6m4B4lByIQ/FVjUuLP0xw5PXaJFgarymXt9wWFgav1Fb5KoBHgkPPPLEQ+15xb/0FRYOkeS
	ZnKnTcVJyQlGfmFS34tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZiB-00000008fDv-2za2;
	Tue, 16 Sep 2025 17:43:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZi9-00000008fDC-1u5e
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 17:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F124640A95;
	Tue, 16 Sep 2025 17:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F753C4CEEB;
	Tue, 16 Sep 2025 17:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758044604;
	bh=o3gS1VZdjRA3/5Nl9Domri53vUtP+1xplx+0LVfixOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sh5JdfZf4uohwD4e74BHkhc0AsnbOwopGV9a/l8MPq55LZrNd43ccjyFhV5brrg/M
	 zfOtpcpwRX/8J6GuVxdEZXt+XWyNycR5bstN1O0OGEEEYQyAdAenRuy8loIXwwngPB
	 dE4oX+Rv1Qkh6egD67P8Q7oCi2x5OzRXStr4uIbw9SbvEyuP8EBYCZhCIkUPWP5I3q
	 GWYRovpjAXy37PavLxaIuh/wandY995VWmVXtl3fFqPbHD9yndHETPb0N+SBYuCvGf
	 yEiePaMI/X6TdKq5ZpQMBlRdwAWH9KuUMSvM+QKAFibAH5blKvU6haNhum+K0JGQnM
	 /JDtSl/6ve/+w==
Date: Tue, 16 Sep 2025 10:43:23 -0700
From: Drew Fustini <fustini@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
	Joel Stanley <jms@tenstorrent.com>, Joel Stanley <joel@jms.id.au>,
	Michael Neuling <mikey@neuling.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH 4/7] dt-bindings: timers: Add Tenstorrent Blackhole
 compatible
Message-ID: <aMmhu9ZfNnW+Zh8a@x1>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
 <20250913-tt-bh-dts-v1-4-ddb0d6860fe5@tenstorrent.com>
 <20250916134400.GA3654122-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250916134400.GA3654122-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_104325_509889_49EEA575 
X-CRM114-Status: GOOD (  17.51  )
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

On Tue, Sep 16, 2025 at 08:44:00AM -0500, Rob Herring wrote:
> On Sat, Sep 13, 2025 at 02:31:03PM -0700, Drew Fustini wrote:
> > From: Drew Fustini <dfustini@tenstorrent.com>
> > 
> > Document clint compatible for the Tenstorrent Blackhole A0 SoC.
> > 
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> >  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > index d85a1a088b35dabc0aa202475b926302705c4cf1..198146c59de0c95a2ffa052c8d4d7aa3f91f8e92 100644
> > --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> > @@ -36,6 +36,7 @@ properties:
> >                - starfive,jh7100-clint   # StarFive JH7100
> >                - starfive,jh7110-clint   # StarFive JH7110
> >                - starfive,jh8100-clint   # StarFive JH8100
> > +              - tenstorrent,blackhole-a0-clint # Tenstorrent Blackhole
> 
> We usually don't put Si versions (A0) in compatible strings unless later 
> versions changed in incompatible ways. Perhaps if you already knew that 
> B0 was different, then it would be appropriate. Or am I misunderstanding 
> what A0 means?
> 
> Rob

Okay, thanks for explaining. A0 is the silicon revision, and it is
currently the only version that exists. I was just trying to be as
specific as possible. I'm okay with dropping '-a0'.

Should I change the plic compatible to 'tenstorrent,blackhole-plic' too?

I see you gave a Rb for riscv/tenstorrent.yaml but that does have
'tenstorrent,blackhole-a0-card' and 'tenstorrent,blackhole-a0'. Should I
drop '-a0' from those too or leave as-is?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
