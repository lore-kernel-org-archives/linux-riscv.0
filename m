Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2272FC433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 09:23:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B743C61168
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 09:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B743C61168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yUDpG/UrVxJakCcpVmmHQhPL/IRtMzQmHgQe+C3cAqQ=; b=TKI70Urf0QS+K3+n4w0Id1HPE
	wIfAy38GHRZnQhX2lO8rM+p3X76PW92s6MQpciRjUV4GPEyDPISBzprYGwyDO5LpGj7RYe27/8bcr
	JqzuCrjW8WRKhT52m7A4UdcFu2sVWcDqSG9wMAv6pKN+x86kGHwHD7I6N1+hBlIlcsBQcxMrMQL9w
	u9/l25Eiy6tQm5rPY8hRkXH2EiFn/CPD67Zm7qy+fNRnAG7j9fAFc0lLXdIRFk3PEsLmnmM+9n3zw
	x3WLsvIbsAaCrZg1CZd07wvysOyXxajP+SV7Lpp//rlZuS6iyK3fADjUCCxpjXWej+5+VCaUw2KAJ
	XBlTDRuBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldrGQ-00FsC4-16; Tue, 04 May 2021 09:22:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldrGD-00FsBO-QN; Tue, 04 May 2021 09:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2yQja4uMfhAKdF1tZgY2or2tYcZTif4zoYwhZKrenzY=; b=a5owa6YyOcJtHlJMIQVrYh+xPL
 gL9fFkESyHRrikCFUh+ipgeArTygF4nMNTbOsH46nTmhHNLza23yRoYU2SkiQiib9ohwHL3RJfx2D
 2bHzca6OljQzsNg+DYK1TxAKUQFIGwqvCd7vExd43UV0efZwrY/LzYc9wPFOlgMdtsjVJrSQzQVcO
 hpwzWQwJsZR7WsCzWoWWRmR+/VmCTUJQ7PFJokWeoBrg1CJtLtYHXIwYb1LbHtc6LcUXmpaOd3lVA
 POPX/333qDGNkpXlt0penXWsvPpoKoYfvMA/4FM0CrJxWet83jHeXuJVjqSxHcucENdFZxQr4vMrp
 FRWOPKqA==;
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldrGB-003r1H-6P; Tue, 04 May 2021 09:22:32 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CA8CAC1A;
 Tue,  4 May 2021 09:22:27 +0000 (UTC)
Date: Tue, 4 May 2021 11:22:25 +0200
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
Message-ID: <20210504092225.GS6564@kitsune.suse.cz>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
 <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_022231_403908_B82AE9BA 
X-CRM114-Status: GOOD (  19.72  )
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

On Tue, May 04, 2021 at 10:38:32AM +0200, Miguel Ojeda wrote:
> On Tue, May 4, 2021 at 9:57 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >
> > Some of us are a bit stuck as either customer refuses to upgrade
> > their build infrastructure or has paid for some old but safety
> > blessed version of gcc. These often lag years behind the recent
> > gcc releases :(
> 
> In those scenarios, why do you need to build mainline? Aren't your
> customers using longterm or frozen kernels? If they are paying for
> certified GCC images, aren't they already paying for supported kernel
> images from some vendor too?
> 
> I understand where you are coming from -- I have also dealt with
> projects/machines running ancient, unsupported software/toolchains for
> various reasons; but nobody expected upstream (and in particular the
> mainline kernel source) to support them. In the cases I experienced,
> those use cases require not touching anything at all, and when the
> time came of doing so, everything would be updated at once,
> re-certified/validated as needed and frozen again.

Except it makes answering the question "Is this bug we see on this
ancient system still present in upstream?" needlessly more difficult to
answer.

Sure, throwing out old compiler versions that are known to cause
problems makes sense. Updating to latest just because much less so.

One of the selling point of C in general and gcc in particular is
stability. If we need the latest compiler we can as well rewrite the
kernel in Rust which has a required update cycle of a few months.

Because some mainline kernel features rely on bleeding edge tools I end
up building mainline with current tools anyway but if you do not need
BTF or whatever other latest gimmick older toolchains should do.

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
