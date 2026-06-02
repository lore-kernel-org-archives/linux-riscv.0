Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA7FCD6E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 08:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Plrna6d60cUUFMK09GdEZBf1D7ZeCGs9qOOlCNHl2g8=; b=R/b7zyMJEpvo34
	jCa0mQs0YIijIbqPCX9+1seoZBXykbVvMCrLWEutJpSVdAH3AaaXCP+Q7iQXo9Od611v8+SoEUH3T
	BcSDOnhtZxu7ZcbMVHEquwC6zHGeIf07Fux9llUgTMZjSu5seDYGYRHbwgmzYqB4eKwbnnBe5n/k3
	G7fCPWCf9uZXoMGS1QmXA5LjBpCgcM+vKwdA46c6WvkeBVczLOuAu6K1gnGh4AlHQxA/0drUZk3LQ
	+5AOjPNromFVIFB3ECYd1BrgkEbUzB7E7MBf/RfhL6mOOF6TLccqPEkWLSfnycrGm495Il0wFiwti
	ffWzwbcEk4kQLDSR/tQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKOG-0000000CYZS-0wRU;
	Tue, 02 Jun 2026 08:22:24 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKOE-0000000CYYw-0wYh
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 08:22:23 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so707165a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388541; x=1780993341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=evjuzAv8DSTdE0Ve2B6VtbgLhoX9BoKz8McLMZToRaA=;
        b=SbPyGjCEwyjM3esp98pppFsvqtZvdmyuRwBroOFx50C7zozhceOiQPZwnI7xadYlCN
         lpkbiUayGkQwMVtEJwcuQ1xIaE675gKmfTSll7v8+ymndCOIIIW9lc6YwtjzblCh+p1p
         hXUA7a8ivZD5u3Ihc0i6fDhIMmB1SKuGHtpo8YDJXpPfTgjBdpW8h39C7Mw7S2qaBDuS
         1gfNO4ETYrMds4bnEf6N+eITOPZsGS/f8oY7GPF83WWcXr0GWvA3WAq+moUkveohISXA
         Z3S8XzM+oRgiFT8Kb8jfYLCDKAg4QzqKuRei7+X6uNZaz/SbuwvI2SJcgj1PAWhr0rZq
         TgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388541; x=1780993341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evjuzAv8DSTdE0Ve2B6VtbgLhoX9BoKz8McLMZToRaA=;
        b=MPY0EzQP0YBcMvyxQFdLrzS56Nor2DEdcwr1F2jMHiiy+lqUBeWQ2Mo/HXbhJyDBb/
         3LYmxpS3QziNPeF5mVST8FDtxkVhk/EiItPSCjPPe3H6hLPuuEOP5oGNS4zVc9df0DfL
         8HFK49J2cvbSSo9filtYJwhaiuu5TVn1x+ByjwcLfPnRpQxKQDRZ/aqpWfpIfId0muIo
         M/dQGeo3C+8s/+DL30UIVrISYVZnXQ2OfJ0xOAXyRJWUvuXMTw89l5Y8DRiUrqHbNzPq
         tDFvU9LAncCfJiopNPObwhJ0VAYLSThOGdzmlIJzK9fdB3bJJSH8IuEe1smPDCYO9Rff
         3yWg==
X-Forwarded-Encrypted: i=1; AFNElJ+hwjQVgUPxMMhbHLLkVItOyUNyNIYAle1IGmHWXRuM0ZGs5eZrGFcO2ca0xqhAzxwP8mA5/d9TG+xsxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBjfU45bjLPNd3ipY72dXuPxmBoaS1IPDR/+AOddW9I954SPeQ
	SZwa8PrCfjH/3f4nY3RdjWUEIwMpNG7l9ZE4SNBb70+ZX3xzMWIAUXw1
X-Gm-Gg: Acq92OHfkZCZFoUPDUa4hssbOQNed50oiDJRCyas5nhUzZKggsLXgxrOtxlOmjGuF22
	ctCIK2ka5gf5c1MK+F9ZUmxxO1Mpe6BRWAd7MHQxUa7cpEmc2kP3bC31l9fuZdbAceCWw0YB3QG
	e12kbqhnWLfCWTGr81uQ5FWuKj58/Rr7KMP0NvMMqD5zXbNdfqQ8t9kJTDHYufw8/TPBxcC/M8A
	3l1ACIq5KwrOqO95b5i2NoV/1Sn34ipy/5IVObPTVMS60HfCMjIdhZS1qIN1oz9MVadtV/bLTdK
	9gSkTSjwvJicJ8O9aH/+PfvdoAiUpEQSz7uJv6k816lh7MnPTkbpfMzVzUyabh+icxxg/e/vMRb
	XQG+8r4Nz5Sz9GySf+BjcySrCpmTyHn1GFtU46xJ2b2oOyK8NpATxP7pTBy53sfQlXLPsneHD1A
	mEYYkYvQ6kFTbT1fVUJLMrmCDp6OX/IJjInw==
X-Received: by 2002:a17:90a:d006:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-36dd98883ebmr2740656a91.15.1780388541458;
        Tue, 02 Jun 2026 01:22:21 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd931ab67sm1864181a91.16.2026.06.02.01.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:22:20 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:22:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board
 support
Message-ID: <ah6Se6TJM-wS8UVP@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <178038833103.2088679.3632311874557644565.b4-ty@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178038833103.2088679.3632311874557644565.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_012222_301157_90BE2781 
X-CRM114-Status: GOOD (  14.35  )
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

On Tue, Jun 02, 2026 at 04:19:05PM +0800, Inochi Amaoto wrote:
> On Sat, 30 May 2026 13:33:42 -0400, Joshua Milas wrote:
> > This adds an initial device tree for the Milk-V Duo S board
> > with support for reading from the SD card and network over
> > Ethernet. This is continued work from Michael Opdenacker's
> > v6 series [1] on the ARM64 and RISCV side. It has been tested
> > with ARM64 and RISCV64 to boot from an SD card, have networking,
> > and read I2C slave devices over i2c4.
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
>       https://github.com/sophgo/linux/commit/eeec80c3ce36ead24e2f53d88a24dac1e3de8041
> [4/5] riscv64: dts: sophgo: add SG2000 dtsi
>       https://github.com/sophgo/linux/commit/2145cd2f0082c11177b062e1ecbce121c3b50b43
> 
> Thanks,
> Inochi
> 

Please ignore this, I apply the wrong patch, A new thanks will be sent 
after I fix this. Sorry for the noise.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
