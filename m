Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D5CC54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSK1UgGHFyRMDBFKO/M5cFkCrnDxfyAAJyjvoBBaBqY=; b=BfimFqS01v2AvT
	Rae507Q0Px7GHi2Uy0FYVy5T5VKHSVZvf0QOwQOzFXQRjgoxDC7WWoI2j8JrwfeKyFKTLMCglLoG8
	Na6+27dIWG9gBdB6Klz9BReNyEu2vasAji/rD6iBkSuzvVc68TyUV50eZV5T5mG3J65xHUst5WNI0
	Vyr/0rqdYMf5yCzfHVn3lQJZZutK9jPHSiKdnRtwvqoUNiSFC1ugTaNAmOgbms8L81NeQ/vf24w17
	GLyq625KRfyIMJ9oR6LqHcgr3h15TPsKLgQEnbghNK0IAK9Koz/LqPqnHGidHdg2MX7FqalVIQ9Ud
	STU35P+L+T5ODSL7tCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp617-00000008Mob-1isz;
	Wed, 29 Jul 2026 15:16:21 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp614-00000008MoH-11wj
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 15:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=9E5ALZ0/ODFdfRiIDSfcsJYZbOjkT0QKDIEAO2hfH9I=; b=IgNSIRBFWOL7iNGvwLRxojQAbX
	TsyaelWAJUrlTXEEdvpD4D+GqQsm5h2SrVsfplJY23Bb28GeAPsV+fzli1py4SjS0luKouqY5Id4S
	fh2/Qw12/L06nAPAC4VVIA1KMSfpZ+4+XdfrmcbryRuTw8AqUbvym8k3Zy8TiH7O3OmW/WR6CNrc8
	ce4wWEmaFGmC7TZ3pbuZ5xC99zHCBOR44io9VMfiX51qoKd0pKA3e9LoA8DDz7FEkwn5UL+8Bq5c3
	FOuRsDEl198uix3U9ycYRIOUxDI5csiDtc6rYlRkNW9Sc7XZq3ehlDrD1xG5T/vDh0Zm04++hobsN
	O27Osq9A==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp611-00000002emq-3aYy;
	Wed, 29 Jul 2026 17:16:15 +0200
Date: Wed, 29 Jul 2026 17:16:13 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <amoZPV-wdchZuCq_@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260729013240-GKF76518@kernel.org>
 <amnJH7rsvbtTUheL@aurel32.net>
 <20260729094301-GKG76518@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729094301-GKG76518@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_081618_284116_420D85D9 
X-CRM114-Status: GOOD (  17.44  )
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

Hi Yixun,

On 2026-07-29 09:43, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 11:34 Wed 29 Jul     , Aurelien Jarno wrote:
> > Hi Yixun,
> > 
> > On 2026-07-29 01:32, Yixun Lan wrote:
> > > Hi Aurelien,
> > > 
> > > On 23:05 Tue 28 Jul     , Aurelien Jarno wrote:
> > > > This series adds cpu scaling support for the Milk-V Jupiter boards.
> > > > 
> > > > The first commit adds it to the existing "Milk-V Jupiter (K1)" board.
> > > > 
> > > > The two following commits add a "Milk-V Jupiter (M1)" board, by moving
> > > > the common part, i.e. everything but the model name and the operating
> > > > point tables, in a shared DTSI file. This file is then included for both
> > > > K1 and M1 variants.
> > > > 
> > > > CPU frequency scaling was verified up to 1.8 GHz on the M1 board.
> > > > 
> > > Looks good to me, will queue for v7.3, thanks
> > > 
> > > Reviewed-by: Yixun Lan <dlan@kernel.org>
> > 
> > Thanks for the review. Unfortunately Sashiko pointed out issues in those 
> > patch series, including preexisting high severity issue that also affect 
> > the BPI-F3. I'll reply to the individual patches.
> > 
> No problem, I can wait for your v2 series, but may postpone to next merge
> window due to time constraints..

Yes, that's understandable. I have just posted a series posting the fix 
for all K1 boards [1]. Once it is applied the patch 1 ("riscv: dts: 
spacemit: Add cpu scaling for Milk-V Jupiter") can be applied.

Other patches definitely need a v2, I'll work on it, but it may take a 
bit more time.

Regards
Aurelien

[1] https://lore.kernel.org/spacemit/20260729150722.1598630-1-aurelien@aurel32.net/T/#t

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
