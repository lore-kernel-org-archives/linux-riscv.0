Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C99CD5BAB
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3C0HngyFERvu6/mnENqHY0O2hAPtTr1/QmJ7mqaIww=; b=hWqXhfX12hn/on
	qBT4g2Xdf1SEVEVrzvXpBDZSyJCDhkaN0FT0sK1YEYYalNsWpwPgpNRK7vtpAhzjuyKDgOBgysidB
	3kOORKlUMEwNwSpPlCxaN1pOKJCrQkVL5h8lQ/SA0UHQoLn5rNrBY1RhiFA05TLT2NfOMy9fyYXbp
	Z+b3uNbEzllyqSVPGfrAk/sEqtQLNJTZiMh8ADUA6untbzkJv4+XeiDTYBKei17iEOsVZJkXeNoqb
	jMcrkXA+R1Y8bt74DcbyAKl/RwdFfGveKojfETxQcCYY/2ZctaeVgEDQhEHgWwYXY9hrFtBiuZvsb
	+u7BSuGbf+yOqhkY5jIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR40l-0000000EfwJ-1GsH;
	Sun, 24 May 2026 08:16:39 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR40i-0000000Efvp-1K9a
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 08:16:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779610587; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cUOwPIx6qfiFmgLCH5f3QxNtUdUWMlcLeq+/824dVkd4j+AS+EcnDJcUlsA5KhfnowH+99Zu9asZcxv+8bIA9QeRGlb6ZGv1vb5oT78yQypTPlTSvT5qJYXJCl8cJMzfGNk7th7jwZemJFodGRFmgvWf/D2vUOypwO19e+xFB3w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779610587; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f+BcqMfSRMkHNRkV+bnfbEWhWrwUx4sqId1SmAVeFZA=; 
	b=dmC8iQDcB3WUrZgX9T0Pqs9fXuqSXhN/uRaXxOZqoFBMPVJMlFu93GJvpA5P1eYFw4PGhaqvFAY+yyd3OKsSjy8ILSDaCz12ReRf7U15trYjIaRd05QCw+U4ttOzXsgNrr4dZ0X1L2REYQSGRwEljQE5f3HRyVj7skKen8sg4mE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779610587;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=f+BcqMfSRMkHNRkV+bnfbEWhWrwUx4sqId1SmAVeFZA=;
	b=AedBdfyXsgDs6fl69lPu03X3jaQMDrHVby1SRFy69EV4IQjkerMKUcGdj/H+CU45
	z8DRnGJ1oUKVPf2QqwGUhNEkiz8Z9L2L+J8f68+gUVurFwoHvyDGjPIAyTwsEhJbvU6
	6yzaYu/R9fRE4HGsn4gMaQBDvmB5ys+wOrChUfLY=
Received: by mx.zohomail.com with SMTPS id 1779610584243760.6124410802614;
	Sun, 24 May 2026 01:16:24 -0700 (PDT)
Message-ID: <89885938-f126-4e1b-aedb-3edb2da5df2d@zohomail.com>
Date: Sun, 24 May 2026 16:16:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
 <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>
 <20260522-removed-lyricism-7c879febc3b3@spud>
 <1f74efd2-444f-4330-a1e8-62f75e85ecfa@zohomail.com>
 <20260523-punctual-backslid-712c06f0db61@spud>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20260523-punctual-backslid-712c06f0db61@spud>
Feedback-ID: zu08011227a77cded047123cf15881bd2500005897bdee7dc29404c51879fd2aa9d5b7ee1f6dec0232dff2a8:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_011636_416972_D8F0AD6B 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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


On 2026/5/23 22:02, Conor Dooley wrote:
> On Sat, May 23, 2026 at 03:00:15PM +0800, Xukai Wang wrote:
>> On 2026/5/23 04:39, Conor Dooley wrote:
>>> On Fri, May 22, 2026 at 08:59:12PM +0800, Xukai Wang wrote:
>>>> Fix all sparse warnings detected during LKP randconfig testing:
>>>> - Replace plain integer 0 with NULL.
>>>> - Add static modifier to k230_plls and k230_pll_divs.
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@intel.com/
>>>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>>> Forgot to reply earlier, but I went and squashed this in.
>> Thanks Conor!
> I dunno if you saw my message about giving what I have in my
> branches a go, but if you could try what's in the riscv-soc-for-next
> branch, that'd be great. Just to make sure that I have all the bits in
> place.
I have successfully tested your riscv-soc-for-next branch on K230
hardware. The clock controller probes correctly, and clk_summary shows
all PLLs and clocks are running as expected.

-- 
Best regards,
Xukai Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
