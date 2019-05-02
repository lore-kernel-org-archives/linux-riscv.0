Return-Path: <SRS0=NPVC=TC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD837C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 May 2019 05:20:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A825A2081C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 May 2019 05:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qbhBwdMt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Pp94zrZb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A825A2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CBRTjtI//auLGXLKczjHCpkeKVbZBkcDWraBSff/l8M=; b=qbhBwdMtjHrQFN
	+aE5gXADNzhLCFUs62F467Yq7xo42eSefBUWVZEKkhJpe4/MVMydIh677s377RCa9NmDTvwWJeLLc
	9K3P8Bu30NuUs+EdeSXf3hyn9qtRRlmGLnZCiUa8KwMr5bG18s9SB97d5RVgRw6Kns6SlZKLPtzt3
	m1aER9ZYwKfDPKaNjm577pBX2riqsyxR/gdaseMvUrS7Jz4tzqm1QibZXJRILvDUBqu3EZcsUYTjI
	JqxkyQE56Lv4qiohjOPq1XERlYLC/kMR0fthvExxfIgFUkpNu8Xf3h/YKru+gC92V5whC72JFwBtQ
	QJAvNmCq4lHj0CYPQh3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM49R-0008M8-Uv; Thu, 02 May 2019 05:20:57 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM49O-0008L8-I4
 for linux-riscv@lists.infradead.org; Thu, 02 May 2019 05:20:56 +0000
Received: by mail-lf1-x141.google.com with SMTP id w23so890615lfc.9
 for <linux-riscv@lists.infradead.org>; Wed, 01 May 2019 22:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIi/hOFHGvpdd8ZxHC2xGumiE5Qm52H/+YsyA0Mp3wc=;
 b=Pp94zrZbK8g3TalKL/jsZNRTt4pXPht0+i7KnoqIMY9/CC4a0DOOp60lnG4VzQdpXF
 hVZxgfHMGyg3FMIAbiJq8apr5Rz/rGk4gH+RXUOU6jcsVkUpxt15xJbHkWIOIUJOdcFB
 bmzSzgOHdBlw3iYDI1J312zA29wxcay3MlZEpJDOPSpFeF1GIeWIxmx2Due3K1zH7cjm
 6EFPcChVg2PlyIadjhmY31ovtv3rj2w1oVl8L1SSxMSg5qFmSJ1paDXBolf0DE6bmly4
 AfdA6ti/fUfFvktiqUW06QgHrPC1cfZFi7IGK9YjSSUNSy49agm0LRhuHLDuZZJrPh67
 +43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIi/hOFHGvpdd8ZxHC2xGumiE5Qm52H/+YsyA0Mp3wc=;
 b=tSgTJ08Bua/Mwm3PpiXqT8JG1zfS5Ivba+WDqqFxx0rIrWE6b0diwMkirxFehQeldb
 VPlcQjJB21BRLBtiUWY8OyMItzwTp24O5twfB3GyQm6/A6knBJ3H4bwecM/5XyZExBcN
 3R5VTvpO7xxP49+435ErVBvJOrOTgL2KuxGxbo20SCjX/s43pgcESdaBWEV737hgrK3L
 ekmjoN3UiVNm91JaYx0GulnjjLjKlLCJsT5YHQ/dBAibVB3FIcHAU/ySHmHwWLdm9JH0
 yGD01NXA0JwZBiLnG1ayXLjHVNLCiZcjc2MP4+3SMcaqWWsI1yOU+Y8PufeCxni+qSeE
 rhdA==
X-Gm-Message-State: APjAAAUB4EN8kkdZ2yak7foQMAd94L3b/i5OBnm5FhCxpYaLTd2SC1aA
 Odcp1fes3j/vHeDP9+FKYmIHcdhOWuxIxcjFPJNz1w==
X-Google-Smtp-Source: APXvYqyUKgaXM4W3YewgggLouSmykoq3FIjWnoOWlifWkKdw/pR1z5cvvAGH8YKyQ4juApeiaTeRw96w/nvv+ylB6dQ=
X-Received: by 2002:a19:1dc3:: with SMTP id d186mr455221lfd.101.1556774449622; 
 Wed, 01 May 2019 22:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
 <1556171696-7741-2-git-send-email-yash.shah@sifive.com>
 <20190425101318.GA8469@e107155-lin>
 <CAJ2_jOEBqBnorz9PcQp72Jjju9RX_P8mU=Gq+0xCCcWsBiJksw@mail.gmail.com>
 <20190426093358.GA28309@e107155-lin>
 <CAJ2_jOEoD=Njp+L+H=jG59mA-j9SnwzyNmz7ECogWmbvei_f5Q@mail.gmail.com>
 <20190502004130.GA20802@bogus>
In-Reply-To: <20190502004130.GA20802@bogus>
From: Yash Shah <yash.shah@sifive.com>
Date: Thu, 2 May 2019 10:50:12 +0530
Message-ID: <CAJ2_jOETZa_oC-xSwfQVw-9Q6OivRG2R0rKMhwCk1knbxWJQVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_222054_628658_C3735588 
X-CRM114-Status: GOOD (  23.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 2, 2019 at 6:11 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Apr 30, 2019 at 09:50:45AM +0530, Yash Shah wrote:
> > On Fri, Apr 26, 2019 at 3:04 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > >
> > > On Fri, Apr 26, 2019 at 11:20:17AM +0530, Yash Shah wrote:
> > > > On Thu, Apr 25, 2019 at 3:43 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > > >
> > > > > On Thu, Apr 25, 2019 at 11:24:55AM +0530, Yash Shah wrote:
> > > > > > Add device tree bindings for SiFive FU540 L2 cache controller driver
> > > > > >
> > > > > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 53 ++++++++++++++++++++++
> > > > > >  1 file changed, 53 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > > > > new file mode 100644
> > > > > > index 0000000..15132e2
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > > > > @@ -0,0 +1,53 @@
> > > > > > +SiFive L2 Cache Controller
> > > > > > +--------------------------
> > > > > > +The SiFive Level 2 Cache Controller is used to provide access to fast copies
> > > > > > +of memory for masters in a Core Complex. The Level 2 Cache Controller also
> > > > > > +acts as directory-based coherency manager.
> > > > > > +
> > > > > > +Required Properties:
> > > > > > +--------------------
> > > > > > +- compatible: Should be "sifive,fu540-c000-ccache"
> > > > > > +
> > > > > > +- cache-block-size: Specifies the block size in bytes of the cache
> > > > > > +
> > > > > > +- cache-level: Should be set to 2 for a level 2 cache
> > > > > > +
> > > > > > +- cache-sets: Specifies the number of associativity sets of the cache
> > > > > > +
> > > > > > +- cache-size: Specifies the size in bytes of the cache
> > > > > > +
> > > > > > +- cache-unified: Specifies the cache is a unified cache
> > > > > > +
> > > > > > +- interrupt-parent: Must be core interrupt controller
> > > > > > +
> > > > > > +- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals)
> > > > > > +
> > > > > > +- reg: Physical base address and size of L2 cache controller registers map
> > > > > > +
> > > > > > +- reg-names: Should be "control"
> > > > > > +
> > > > >
> > > > > It would be good if you mark the properties that are present in DT
> > > > > specification and those that are added for sifive,fu540-c000-ccache
> > > >
> > > > I believe there isn't any property which is added explicitly for
> > > > sifive,fu540-c000-ccache.
> > > >
> > >
> > > reg and interrupts are generally optional for normal cache and may be
> > > required for cache controller like this. DT specification[1] covers
> > > only caches and not cache controllers.
> >
> > Are you suggesting something like this:
> >
> > Required Properties:
> > --------------------
> > Standard Properties:
>
> I don't think we need this separation.

Ok. Won't include this "Standard/Non-standard properties" separation
in the next revision of this patch.

>
> > - cache-block-size: Specifies the block size in bytes of the cache
> >
> > - cache-level: Should be set to 2 for a level 2 cache
> >
> > - cache-sets: Specifies the number of associativity sets of the cache
> >
> > - cache-size: Specifies the size in bytes of the cache
>
> What are the possible valid values for these? That's what's important.
> What the properties mean are already defined in the spec.

Sure, will mention the valid values for these properties.

>
> >
> > - cache-unified: Specifies the cache is a unified cache
> >
> > Non-Standard Properties:
>
> I wouldn't call these non-standard.
>
> > - interrupt-parent: Must be core interrupt controller
>
> This is implied.

Will remove this redundant description.

>
> > - reg: Physical base address and size of L2 cache controller registers map
> >
> > - reg-names: Should be "control"
>
> -names is not really needed when there is only 1 entry.

Will remove this property.

>
> >
> > - Yash
> > >
> > > --
> > > Regards,
> > > Sudeep
> > >
> > > [1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.2/devicetree-specification-v0.2.pdf

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
