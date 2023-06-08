Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4996C7EE2E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGUcoKFaqCCurbruTBt53Hsf3ns4fetTwXAbHn5qN3o=; b=JOUzAg2rk1Elw3
	dxxnvvInwsByRZ3LxpBd0O64AscxinU/3BYjVrmSUl/aQn4/AyeEywtKmhVYB2Te3UvlPmERJDCKh
	jgFq8PBs0Gl1EpATu+BGgcSVTqb5oNAD7UwM8QwtsO5QPq8t9y2RJM1oAM3R489dpjzbg/WuZVR2k
	6OxnndvfOybt3ambeeMfosXcutjhgMD6iytCR2D80zLrYo9frhz+tR1EJuM/fxd2TRNDGiF2ldrsq
	otFai0ksIhXjXyq4bQLsaiBt52cwrHhzj9CVWpcGVQYW6hwE/uBI17mF1B3Gcv+edJJt7rvLhKikE
	SLDtq0oCeqti8bW7dgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7L6p-00AIbs-00;
	Thu, 08 Jun 2023 19:15:47 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7L6m-00AIaF-06
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:15:45 +0000
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-33d5df1a862so4486725ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251740; x=1688843740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnuCWlLeGXkXzjrAZSc98CK+vugpSfbrMYt9DNWRMOE=;
        b=XuyAdlmmGd3yuCl6R7/sUQc4r7Iw6bMVSARj2v3ZruZP/BNlG8fYJJNHGc69jPonju
         eH8DJ2aTU5fpXbPsKrB6ahpnWt/meqeCXaqsdewUKe/p/4RuYXTpk5FBNdkmDmUKioPu
         7xORWM7U+j0okJFf5UZI+Ergnbolmu+EE6qmO3Ik/TxnbeqrqWSMp2e3XFj7oG/xj4JT
         w3B1xYb2gK5YlfwvIX39T/tuzzdTqfdU2TYCu898/xGWJLlmJyH5FkQbMc9IcqsHi/7p
         oAb/tuq6aACAXLCdh4K5xYnQdSYCGXkXGjSv7C8ewDEBn/w7ohlTPXkt/Xq79ctoiQpY
         Djvg==
X-Gm-Message-State: AC+VfDyY9w0qsNXbKPWpzaamIRgs/p3wAGbjS1hyVPXvAouxOuKWWjuv
	4fhZcEq+lkuEk5gY846s4MVcqBDmlA==
X-Google-Smtp-Source: ACHHUZ6vUrRrwwLFM+Hb3/loXcNPujVf20GEn/2hSQYhDLxez4ApnNr9gWsyMTIlALZzM/ichJLIqA==
X-Received: by 2002:a92:90c:0:b0:33b:ea2:fe6c with SMTP id y12-20020a92090c000000b0033b0ea2fe6cmr10362873ilg.24.1686251740495;
        Thu, 08 Jun 2023 12:15:40 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id e5-20020a02caa5000000b0040908cbbc5asm464387jap.68.2023.06.08.12.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:15:39 -0700 (PDT)
Received: (nullmailer pid 3254644 invoked by uid 1000);
	Thu, 08 Jun 2023 19:15:37 -0000
Date: Thu, 8 Jun 2023 13:15:37 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Sean Anderson <sean.anderson@seco.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alistair Francis <alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>, Leo <ycliang@andestech.com>, linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org, u-boot@lists.denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230608191537.GA3233857-robh@kernel.org>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud>
 <20230530-duller-reset-a34ae111f207@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230530-duller-reset-a34ae111f207@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_121544_071436_1EF24A5D 
X-CRM114-Status: GOOD (  26.13  )
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

On Tue, May 30, 2023 at 03:12:12PM +0100, Conor Dooley wrote:
> On Thu, May 18, 2023 at 10:42:34PM +0100, Conor Dooley wrote:
> > On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:
> 
> > > 
> > > Why not just have something like
> > > 
> > > mycpu {
> > > 	...
> > > 	riscv,isa {
> > > 		i;
> > > 		m;
> > > 		a;
> > > 		zicsr;
> > > 		...

I prefer property names be globally unique. The tools are geared towards 
that too. That's largely a symptom of having 0 type information in the 
DT.

For example if you had an extension called 'reg', it would be a problem.

> > > 	};
> > > };
> >
> > Naming of the node aside (perhaps that could be riscv,isa-extensions)
> > there's not something hitting me immediately as to why that is a no-no.
> > If the size is a concern, this would certainly be more efficient & not
> > like the probing would be anything other than trivial more difficult
> > what I have in my proposal.
> 
> Having started messing around with this, one of the main advantages, to
> me, of this approach is proper validation.
> cpus.yaml has additionalProperties: true in it, which would have had to
> be sorted out, or worked around, but creating a child-node with the
> properties in it allows setting additionalProperties: false.

That's an issue on my radar to fix. I started that for the Arm cpus.yaml 
a while back. Sadly it involves adding all the misc properties vendors 
added. It's not a lot, but still better to get in front of that for 
Risc-V.

> > Rob's AFK at the moment, and I was hoping that he would take a look at
> > the idea, so I won't respin til he is back, but I'll give this a go in
> > the interim.
> 
> Mechanically, the conversion of the patch isn't difficult, but I'll still
> wait for Rob to come back before sending a v2. But that v2 will more
> than likely implement your suggestion.

I haven't read the whole thread, but the initial proposal looks okay to 
me.

Another way you could do this is a list of strings:

riscv,isa-ext = "i", "m", "zicsr";

I think we have a helper to test is a string in the list.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
