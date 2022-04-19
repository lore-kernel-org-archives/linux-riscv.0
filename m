Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EACEC43217
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 19:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KeYnvH8ZQbkGA4EfoA/DCoxvkr1/fNA3ojYMeL/6yEI=; b=InyQYKhI9E9LH/
	FMvHFVRDcZJKFbGAf50/CH69oIgVJEqeqTNyGKR/uuKXOjnB/BxpGVhscAADw2IWrQ/uJp6Y/wUw5
	1rGBAX0D1OIp0YA86wPkgmCddoxJacpHzSBdzBLJNyxXGalR99CmfBpfaA8VDmhmMYGoIuLW0es8Q
	uo5R+j0s0M1HifhlFvwRHDs8DwW+7QLHSeg/WLbYDtcw/TWrlrMoZ4eQUwKA4VpCeHedWJDiq0tWW
	3D1QOTtP46j4SHL2HA5Lu+V3TZBCuZgsUGI5yQsqsSeb/O/kdjy8aIxSfhchzi5+psq8OePF57CSK
	LD4L5VUDDOigJUdHrhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngt56-005sml-Dm; Tue, 19 Apr 2022 19:00:08 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngt4T-005sRy-QH; Tue, 19 Apr 2022 18:59:32 +0000
Received: from zn.tnic (p200300ea971b5839329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:971b:5839:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DA1CB1EC0535;
 Tue, 19 Apr 2022 20:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1650394759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=yrDZi8RMHpoQYGjBhUR4MquierfF40OlMH05yPCr678=;
 b=NPvKM/Wy8mQo++H2OW7Voa1icNv7WJbylKqcGbmX9/8e2j/yCYoiJqcJ0+5o9B005Mpzj/
 TD+yw6C+vRnnfSqzgCvjEYc+SWyUsoaK+QzztzQGEAAJVJC2oEMbsbx74N6rtA0u15QPpf
 KNmXSR9VCSZUViMcCDgEmNh/kg8/la0=
Date: Tue, 19 Apr 2022 20:59:16 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "David S . Miller" <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-um@lists.infradead.org, X86 ML <x86@kernel.org>,
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v5 07/11] x86: use fallback for random_get_entropy()
 instead of zero
Message-ID: <Yl8GhNjwPLNiUfSZ@zn.tnic>
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-8-Jason@zx2c4.com>
 <Yl78gLLcSb3EHv0B@zn.tnic>
 <CAHmME9q03Je-ROzzHCgZC0vy1n=y8bsGBOAs8U_K_r3ebLNHbw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9q03Je-ROzzHCgZC0vy1n=y8bsGBOAs8U_K_r3ebLNHbw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_115930_066951_490968F6 
X-CRM114-Status: GOOD (  11.32  )
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

On Tue, Apr 19, 2022 at 08:38:41PM +0200, Jason A. Donenfeld wrote:
> I think I prefer doing (a), and leaving (b) for another time when you
> or another x86 maintainer can do so. But I'll do whichever you say.
> Which would you like?

We are switching all feature checks to cpu_feature_enabled() so you
might as well do the new preferred way of checking when adding a
new function and so that we have one less place to touch. Which is
appreciated. :)

Thx!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
