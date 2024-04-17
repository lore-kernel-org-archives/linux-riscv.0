Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407FEC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZd+xvCb2Qxu8JfhjO2MDmc2Q//e1sqvJZM01sFQYEc=; b=4Oem/cBQtg6kwY
	mv8NLHva3IEAi0dh8BJZyWx2XkEJm6SfCXvOtNddgGrR0eqHs3P44z2rTrzFttVYZVH+43vcN18Ak
	Y7a49uH2XRaLv+sONE46FWOQV1y/aKzXro/N6OEvlIqrLA+0pbQqBbqOSv3ml/AtHN6DbmPCLsztY
	Vztk1v3qvgaeXH6HIttAzx5XTWTDs76Rj3f3BtketPWFLMjaAmHPRLg+FOQsXWSYCxxOK3BXYAMnt
	Rv9jvn4h1zpY52wnS3ln510/b/SdZfsnKvOAK7l8M5oa19xfnkXMXCBD1aYBPOAvLtFtJzeqBmMd8
	0uQF73mdfT3I+Z2hvVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7GT-0000000GbOA-28FI;
	Wed, 17 Apr 2024 15:32:01 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7GP-0000000GbMw-3iJW
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 15:31:59 +0000
Received: from cwcc.thunk.org (pool-173-48-113-2.bstnma.fios.verizon.net [173.48.113.2])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 43HFVM8p016211
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1713367886; bh=OUs4KkgaD/FpvJ+2NJzXqe7hy3aMJMIJWA9eaTknY8E=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=nMtnDykE1F1kxHm5GQfr4ZqPYU3K4i+JZ44Je1xsc+SeP+WWSIb60AnjNISDIjdih
	 Ih4ucOoOEjpm2vxAnjhJ6FsWtcVeJx/4+61j2OCSOnhDxtJuhT/msapmB/CpV6dEEP
	 4VQkk+Z1IczSdfxuRpDsu8XRMsZa6amXUgmYalqB6t87sglA+Br/ICuZj5cNWgkjsp
	 KGaxCjs7zVfxQl0u0k3rz3bW/2Ke7eGq5wze71vflPSO16lggQ3nIY0rm7UN7lQqm8
	 9HHg4MjglepgvNC8tSaEZlRyUQIeT6Lbochp4uvZ5bpYbfZlbduMxUTKurUDQCHaYa
	 09ARNt790bi+A==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 91D7115C0CBA; Wed, 17 Apr 2024 11:31:22 -0400 (EDT)
Date: Wed, 17 Apr 2024 11:31:22 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Nam Cao <namcao@linutronix.de>
Cc: Mike Rapoport <rppt@kernel.org>, Matthew Wilcox <willy@infradead.org>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Andreas Dilger <adilger@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240417153122.GE2277619@mit.edu>
References: <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
 <Zh6KNglOu8mpTPHE@kernel.org>
 <20240416171713.7d76fe7d@namcao>
 <20240416173030.257f0807@namcao>
 <87v84h2tee.fsf@all.your.base.are.belong.to.us>
 <20240416181944.23af44ee@namcao>
 <Zh6n-nvnQbL-0xss@kernel.org>
 <Zh6urRin2-wVxNeq@casper.infradead.org>
 <Zh7Ey507KXIak8NW@kernel.org>
 <20240417003639.13bfd801@namcao>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240417003639.13bfd801@namcao>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_083158_088900_1991094B 
X-CRM114-Status: UNSURE (   9.32  )
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

On Wed, Apr 17, 2024 at 12:36:39AM +0200, Nam Cao wrote:
> 
> However, I am confused about one thing: doesn't this make one page of
> physical memory inaccessible?

So are these riscv32 systems really having multiple terabytes of
memory?  Why is this page in the physical memory map in the first
place?

Inquiring minds what to know,

						- Ted

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
