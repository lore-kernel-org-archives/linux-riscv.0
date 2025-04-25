Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2778EC369D1
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 10:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkvBQCaxhq2atxNWiI173wEOk2znTVgS/BrvPh20YWc=; b=btvJOz8GcPVEhG
	sgBMDAuJnSSY6b6pgzUsUxUxyMxMh/x/nVgBqy6LvelLAPrNLm+JAKrzqxSOcGdWcOQzb70PxyM9b
	H5kKsXtjd45en2Is//1uNaFJavixquU8sk4v2cXqRLjfdz2gKurH7+M0Z1vPjcY/OhgAeGc+WNZYA
	+nQ1LSF9mMdmGtICGx5YtI4YptXKW0Cqpwyj+cMA/5ujm+cA2nsxlD+mi+CQ7IJHFm8WbOofHKrBr
	MgxhgN04BN++HLBqTj8KLtocKW2+qQYjXPpeXZO58PHURPxF2PcQQRQcGT8hQi0W3RY1kNW/aVBxI
	u1u3uYHS17WTxgV3YgnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Fxn-0000000GewV-1ylZ;
	Fri, 25 Apr 2025 10:07:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ewp-0000000GSsS-0PTW
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 09:02:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1112241f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 02:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745571734; x=1746176534; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUtCax9Xz79pqocOKSO+PWNehk8nJoFSaWWNyZR+sqk=;
        b=Ip81aRvU3xF8AqqeNLaNfT4bun8mDGteqgjiG/JYVhRjLExizkdtPbMqxSx8wP1JKZ
         u742Uy8YuRwbSrlQRv4G96SSnxVguk+SApc7kYAtD8SHIjFh6Z2M+LZMBq9/255VUptP
         zv8B0QZa1Mx1KfxeCMWjDvFN0vssS2GT+X4P7mrJF6VpLXFOkPeoT/+nkYQlYUR+LriG
         FLDCNUT8Fv8qCpXsjIMlXzv4WDsZV+G8V2FDRGGuZPY1KFpOeO9NjpJnpkMVdpi0m/gY
         pQ8dAWVggs/zud1vhFktzF7rdLpFchKpv4X3baz83upSkFMf57lP8AWJcHTZ7OhtxEW/
         Q6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571734; x=1746176534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUtCax9Xz79pqocOKSO+PWNehk8nJoFSaWWNyZR+sqk=;
        b=L68ifVTxMYo7cg52dI9XKAZLGPX4CuR5ynuE6TwfuPymHZ9G+dFe4N0wmVcFuci6dR
         sExstiNewT7aZuuQHA9AMVUxtzVrrNFoFeY5StiBNzsM88Rj2y4Q1SArlubZrspvXPfN
         aAjiIhkCiSqlBEy3zK66wXG3vTgU+/OhcGEVtIj3Wadiml8p0m5rUCU/nHKz75NCYysm
         Y7n6kZ5lIs7GU2D6M7/H7aKQ3647glUAVlAfDlHz1kKlJv+1mjcV0h44nM/ckw16UJoU
         vUBrJi49J1OSN0vMHkc4/4jOtkUJINpDzAy98TNlDx3jWksXIPBAA57RNuOxUGSTIUVP
         OAdw==
X-Forwarded-Encrypted: i=1; AJvYcCWcr3wUUN3m3h4HcasXYHf52yruFrosp4GoxGcYesX8Juuo/GGQDBZqrrKGUorrHIokmMUJs4Jn10/l9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmn69PDgUIKpuKbBo6y5+0PxIGcQsR/uQSVNpoZJPEGiGur0Fi
	uoS4B5eH0l0RSBDMRs3wLM2FURLBmZGdYGK9yr9gLsJ0GPZn9yvyTQCQv6l5VV6nuzItDDsoEES
	U
X-Gm-Gg: ASbGnct3r28lTCBw4gTkIvdar80iMmepLN+3t/WmoroazMamf61q/xviiypxbSppW7e
	yh+Y/BS0Gjwfi1WlWGvC/wmy+SoUPOHyJU41GbqmAANHjsAjrhcu+E6xYbn5gGiQxr0sPj7CG1f
	9aDB/AV6cDXkkjcRRT2bMx88hchnOAqMGSww+8IJ3wMa9rSZTbME2EGk97wmyQd9XaltNJODlBy
	71ctIxvXgioNGJhnqxW0X1y0lMRCCtGtVpV7CSEUhBcg8DV+alUjLC3KKhluAUNrRx2GKo1UNOW
	nuCzon4otiUfDYKhWpoa6lUvSnwoJpbulEKXs7dyFJU=
X-Google-Smtp-Source: AGHT+IHcaRb5pcjKTG+Y5h3Ih/yrwWqsjNfb1VbBSCFlmYmzhEmDkPcseYoWUd0DAhovc+dqSuA5vA==
X-Received: by 2002:a05:6000:2505:b0:391:412b:e23f with SMTP id ffacd0b85a97d-3a074e1a1bfmr1145277f8f.15.1745571733688;
        Fri, 25 Apr 2025 02:02:13 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4f88sm1689934f8f.29.2025.04.25.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:02:13 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:02:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Ryo Takakura <ryotkkr98@gmail.com>,
	alex@ghiti.fr, aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, jirislaby@kernel.org,
	john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Message-ID: <aAtPk6vxmIBdp1NT@pathway.suse.cz>
References: <20250405043833.397020-1-ryotkkr98@gmail.com>
 <20250405044338.397237-1-ryotkkr98@gmail.com>
 <2025040553-video-declared-7d54@gregkh>
 <397723b7-9f04-4cb1-b718-2396ea9d1b91@suse.cz>
 <2025042202-compare-entrap-0089@gregkh>
 <a7cf9864-6810-43d8-a7f6-f71cc1ee081c@suse.cz>
 <2025042252-geology-causation-a455@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2025042252-geology-causation-a455@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_020215_134003_6937B5ED 
X-CRM114-Status: GOOD (  41.23  )
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

On Tue 2025-04-22 15:16:21, Greg KH wrote:
> On Tue, Apr 22, 2025 at 03:07:54PM +0200, Vlastimil Babka wrote:
> > On 4/22/25 12:50, Greg KH wrote:
> > > On Tue, Apr 22, 2025 at 12:20:42PM +0200, Vlastimil Babka wrote:
> > >> 
> > >> I admit it's surprising to see such a request as AFAIK it's normally done to
> > >> mix stable fixes and new features in the same series (especially when the
> > >> patches depend on each other), and ordering the fixes first and marking only
> > >> them as stable should be sufficient. We do that all the time in -mm. I
> > >> thought that stable works with stable marked commits primarily, not series?
> > > 
> > > Yes, but when picking which "branch" to apply a series to, what would
> > > you do if you have some "fix some bugs, then add some new features" in a
> > > single patch series?  The one to go to -final or the one for the next
> > > -rc1?
> > 
> > As a maintainer I could split it myself.
> 
> You must not have that many patches to review, remember, some of us get
> a few more than others ;)
> 
> > > I see a lot of bugfixes delayed until -rc1 because of this issue, and
> > > it's really not a good idea at all.
> > 
> > In my experience, most of the time these fixes are created because a dev:
> > 
> > - works on the code to implement the feature part
> > - while working at the code, spots an existing bug
> > - the bug can be old (Fixes: commit a number of releases ago)
> > - wants to be helpful so isolates the fix separately as an early patch of
> > the series and marks stable because the bug can be serious enough in theory
> > - at the same time there are no known reports of the bug being hit in the wild
> > 
> > In that case I don't see the urgency to fix it ASAP (unless it's e.g.
> > something obviously dangerously exploitable) so it might not be such a bad
> > idea just to put everything towards next rc1.
> 
> Yes, but then look at the huge number of "bugfixes" that land in -rc1.
> Is that ok or not?  I don't know...
>
> > This very thread seems to be a good example of the above. I see the later
> > version added a
> > Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
> > which is a v5.2 commit.
> 
> Agreed, but delaying a known-fix for weeks/months feels bad to me.

I personally push rc1 regression fixes ASAP. But it has a cost.
I do extra careful review, testing, and still I am nervous of causing
a regression which might leak to a stable release.

IMHO, it is perfectly fine to delay fixes for bugs which
were there for months or years. For example, this patch fixes
a bug which has been in the driver since the beginning (2019).

I think that the root of the problem is in the view of the stable release
process. I am pretty conservative. My experience is that some problems
are caught only in the -rc phase when the kernel gets more testing.
I am not sure if stable -rc kernels get the same amount of testing.

Best Regards,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
