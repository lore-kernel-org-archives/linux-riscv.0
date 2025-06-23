Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F53C7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 07:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVmcj+VX7/zDdqg6UHOw5a/cnYGIGXLCES96KvZWuDA=; b=MM4JYq28GwgenP
	6ksm25k1VC4Qw2mA9zaZn2gMBY+7VsQvqo/17ku1D8nknlywzd0ktVw6bLh3zAs+9VPoueqrXQS8s
	rMmGxwe2UzT5nobH2QDDvr3EbqvCHyHeCR3dGQjznZt3yP3rViMU45ORPBqWtA01j5baJ96lIV/J9
	Ylc7kGk7PQ5Cu0/Qr6C1bzgaxKIeAtcfYzsEzt/nXqBwjTSotOwiB49RYqPX7Xhlq7R4dJBujb5FX
	Q/OsWDzYntYegfy8FO+pT3KQ3BTdkdxiHTQCChpJxYNcDa/YsqvYXpgHSM7dgwWfGQN2CHmKTTCUu
	CFGewaDPZu4Ui0HuARCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbYy-00000001rR9-2CgZ;
	Mon, 23 Jun 2025 07:25:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbYw-00000001rPX-0ERD
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 07:25:55 +0000
Date: Mon, 23 Jun 2025 09:25:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750663550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEEedbKgnJXSwwOET8K6ArKbZhySAVPv7rRy/P6v38I=;
	b=4P6tWDa5iqxcS8J79zDiW4xQQhGBGFRetF41Y3n8Tz6T7cpAT4fbSYM7MpCh+XeOXwSjXm
	6ouIC3118X2ODK9+maLG2RiaNkV9CTNZ8DHB/2FuRorA13wnpBkq2YzAFFV3C/saVESmWz
	7KaNP9tR/zS/lGJdpWGf+Ikidsmuyl1PzBMPy7QiOvyaEbnRgyWJm3aIzeH+MCeLYCf3Hx
	ZI8hJS/AEagyYTe1gtldNEr6IN0w25aktWWw0mDoFnpF5DmJd3wEutkR6Iono64qQJYxN0
	e4O7l7sDsy9f79WC4yHcpwsE/OEtxHIt19VpNstAOcYKaVEIYlanHp613BwfZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750663550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEEedbKgnJXSwwOET8K6ArKbZhySAVPv7rRy/P6v38I=;
	b=xISzTlwP+QjoLV/MUD6z7R498BBYOZ84lByRmZpBlBH0Y1YvpZa4wXt9cp8WB2BWh6yD7D
	Ch6x2d0fCQPUeBCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexandre Ghiti <alex@ghiti.fr>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
Message-ID: <20250623080736-6f8f2389-4575-4508-8214-faeb10b4b241@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
 <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
 <20250612155635-ecade4e1-0235-464a-bcb3-293f7452510a@linutronix.de>
 <87cyaxp0df.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cyaxp0df.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_002554_233828_B982E694 
X-CRM114-Status: GOOD (  20.73  )
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

On Sat, Jun 21, 2025 at 05:42:20PM +0200, Thomas Gleixner wrote:
> On Thu, Jun 12 2025 at 16:21, Thomas Wei=DFschuh wrote:
> > On Thu, Jun 12, 2025 at 10:31:20AM +0200, Alexandre Ghiti wrote:
> > We could introduce per-architecture configuration. Essentially revertin=
g parts
> > of commit aff69273af61 ("vdso: Improve cmd_vdso_check to check all dyna=
mic relocations").
> > The final logic for the intermediary objects still needs to be more com=
plicated
> > than for the final .so as those contain relocations in the debug inform=
ation.
> >
> > Or we could add a C hostprog for validation.
> > That would be much more flexible than the inline shell command.
> > It would then also be easier to use an allow-list than the brittle deny=
-list.
> >
> > Or we don't do anything, relying on the selftests to detect miscompilat=
ions.
> =

> That's a bad idea :)

Fully agreed :-)

> > I'll run this by tglx. If somebody else has any opinions, I'm all ears.
> =

> This is all a mess because the relocation type numbers and their R_*
> names are not uniform accross architectures. Neither are the valid
> relocation types which are suitable for VDSO.

Ack.

> I don't think you can reasonably cover all of it with readelf and
> grep. I did some unrelated relocation analysis some time ago and I just
> modified the python script (yes, I hate to use libelf) to show case how
> insane this gets. This is just as much as I needed to analyse files
> compiled with some random cross gcc I had handy. But you surely get the
> idea.

Yes I get the idea. This is more or less exactly what I meant above with:
"Or we could add a C hostprog for validation."
More specifically my plan then is to write a C application that uses
<linux/elf.h> to do what your Python script does.
There should be no need to mess with libelf.

<snip>


Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
