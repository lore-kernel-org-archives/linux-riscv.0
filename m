Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEA4C433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 12:18:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C267613AA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 12:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C267613AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4pPoYMl6uHYSb7fdhRxZ7+Wm0VtUy4g9EZzKUR1uLWc=; b=jrEZCSU0apnQkT7+k21kOuE0C
	DSFP2f86c6pAjRFWu7DIEGPvjBvce+lPdhcXzdBAu57sERI2KiR0dusDXp7t6BMz4HLSSqsq69307
	4XKi/3J/o74XKJRQBdqsvctXTlOh83S9FveZIzK1H+5DxJ7QtgKNIKi+sxQQsVjmSNEVnm8vKpMk9
	r8H99ntfyeNtqqm1tMh8TO8tfNVtSSFVFx+AA7+0UYDJVKO47FoCNjRU9QdCgshxAkJulnoPshSHM
	AxpPiJJ383oP2qAkzOmGQf92jmfKfoL+nm4NwpyyHypRJOPQJPLxnh1XgpwGGq6BNluMyFqfk427Y
	nw3+Gk2PA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldtza-00GAZw-J8; Tue, 04 May 2021 12:17:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldtzM-00GAZG-Gw; Tue, 04 May 2021 12:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=eDT+DJZ7O2KfKKhPn1AndeyZ5VeZy+lGlFfTrL/8u4E=; b=x2QmMcFmuPAGQ8zrwzy0j/jk4E
 qs/SuHiMpyjCPFnbXceg/a2cFu2Xcd7fVqrbkhwymi6YDdSzenHxWnClgwrMl4c6/y3n/qutcBhqq
 9Tk9jGiZ/2dwadDfvz0qm6vhKP/CSBoeV2Yi6YOVY61/xB/yMkecbmz/gOG/7z1RwcGAL2driCMsx
 +9Serp1DpYdKtO/yDPp7x0H6YTNw/2o/7Qrj9QOuJdqBFZOO1qiHSuSGokiFlT9w+KKwHAZ6BSiYH
 dFi5kIQlySl1rs/79W7bgi227z0OnaBMk0JcW5tqIcEkmO2J0cKk3DlA0kOiEoAcJQdlXxweeXDzq
 KuMXyAOQ==;
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldtzJ-003xfF-IC; Tue, 04 May 2021 12:17:19 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0178AE5E;
 Tue,  4 May 2021 12:17:15 +0000 (UTC)
Date: Tue, 4 May 2021 14:17:13 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210504121713.GT6564@kitsune.suse.cz>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
 <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
 <20210504092225.GS6564@kitsune.suse.cz>
 <CANiq72kHwAeQ+vhFqg9tiQA-QHEK_xvP_Sro-_c5LJ2XDzjzxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72kHwAeQ+vhFqg9tiQA-QHEK_xvP_Sro-_c5LJ2XDzjzxQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_051717_890314_559E5CC3 
X-CRM114-Status: GOOD (  19.11  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 04, 2021 at 02:09:24PM +0200, Miguel Ojeda wrote:
> On Tue, May 4, 2021 at 11:22 AM Michal Such=E1nek <msuchanek@suse.de> wro=
te:
> >
> > Except it makes answering the question "Is this bug we see on this
> > ancient system still present in upstream?" needlessly more difficult to
> > answer.
> =

> Can you please provide some details? If you are talking about testing
> a new kernel image in the ancient system "as-is", why wouldn't you
> build it in a newer system? If you are talking about  particular
> problems about bisecting (kernel, compiler) pairs etc., details would
> also be welcome.

Yes, bisecting comes to mind. If you need to switch the userspace as
well the bisection results are not that solid. You may not be even able
to bisect because the workload does not exist on a new system at all.
Crafting a minimal test case that can be forward-ported to a new system
is not always trivial - if you understood the problem to that extent you
might not even need to bisect it in the first place.

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
