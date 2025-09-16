Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68043CAC598
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3ngvPu5R43GgGAAe8AHn7WsFOs7hwN2PlkscdJv564=; b=CFH0H2/ybkXHhs
	0vunOKv8Hee0xgAYcR9EV7ywxzcp9WI3yRNJBiVncTusSlKHcEEYiwUGW3CPeDWGd7uMGdEMGxtxk
	9bnKVPSZzS7rV1O47aB65jRZIwx2BNa8WA/x6NBBzh7XWKfj/I0l94uaCGmAkhgX8lLQk8MHtIlU5
	dRVNBHZKDfp312nl8nY09JvC+HXo4R/vn1lL59v8d4M9JmZ1FMNxy9YJLbTDGT4CaxMCcb28MMYoP
	Nh0o8Uz9ULn507Vg9glbi/BYDhEVotNtUzauQ376PcD37apVzspIf6uEjOSC+vjKeWXty3md56N+q
	AldWHKOR+v1HP+qxwzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVNi-00000007sCA-0vOD;
	Tue, 16 Sep 2025 13:06:02 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVNf-00000007sAp-2bmd
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 13:06:00 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6061A340E10;
	Tue, 16 Sep 2025 13:05:58 +0000 (UTC)
Date: Tue, 16 Sep 2025 21:05:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Lee Jones <lee@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Alex Elder <elder@riscstar.com>,
	lgirdwood@gmail.com, alexandre.belloni@bootlin.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <20250916130553-GYC1255161@gentoo.org>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
 <7aba368e-709b-49b0-b62c-f2f8250c8628@sirena.org.uk>
 <20250916084229.GG1637058@google.com>
 <c8bcfff9-9d2a-426d-9df8-100efd2af64f@sirena.org.uk>
 <20250916122724.GB3585920@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250916122724.GB3585920@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_060559_682264_BD17EB5A 
X-CRM114-Status: GOOD (  18.57  )
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

Hi Mark, Jones,

On 13:27 Tue 16 Sep     , Lee Jones wrote:
> On Tue, 16 Sep 2025, Mark Brown wrote:
> 
> > On Tue, Sep 16, 2025 at 09:42:29AM +0100, Lee Jones wrote:
> > > On Thu, 11 Sep 2025, Mark Brown wrote:
> > > > On Thu, Sep 11, 2025 at 11:36:41AM -0500, Alex Elder wrote:
> > 
> > > > > How should these two patches be merged?  Mark has reviewed the
> > > > > regulator patch 3 and Alexandre has acked the RTC patch 4.
> > 
> > > > We'd both have been expecting them to go via MFD.
> > 
> > > Why?  I don't see any dependencies between them (usually a shared MFD
> > > header-file).  If there are no deps, it should be taken through its own
> > > repo, no?
> > 
> > I used to just apply things but at some point Linus complained about
> > cases where the MFD ended up not getting merged (missing the merge
> > window or whatever) so I've been treating them like they had an actual
> > dependency.
> 
> Not sure I've seen any of that from Linus, but I don't doubt you.  The
> MFD part has been merged now, so it's save to go ahead and apply the
> Regulator part.
> 

Forgive me to chim in..

To be honest, I don't really mind which tree the patch to go through.. 

But since the patch 3 has no build time dependency on previous two,
so it should be fair to take via pmu/regulator tree, I've done a check
locally which imply this..

What do you think, Mark?

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
