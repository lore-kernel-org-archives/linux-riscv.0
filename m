Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41539C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLk/6i1Cu+Xqohr7uCZxUCoKGIf+/iC512yfNEmwiKM=; b=Zul/uB1YCzdTVY
	9fHPkMuo778ep4d4YztbWpIu5HebCagAWxs2jM0j2liWKXvPBQu8zK4NLuQuACB/fKmj6xqJwgk+j
	HzkaUF8MYp/6nv78zPchj1O5l8NrD2Gjw7d7DX60fRcFfhGlJM/zybTn676N3SeDAdwH4SfJcQpXa
	j3nd6I8U3Ei8A4kSnR9gEgf4nKWbtqrpg+3egJFFfxkhBJ6T2Fu3cHWceDTOcUg5Jo+3g0OqDnk3u
	byp/KOd7U2C+2aO3GfRnRdqZ6os7Iw3VsljZWRa4BO57yW8eaEhhOEWB8Z61yYaLn5AioG0tikwo2
	WZ2euOHxdwn/Qq/PU/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poouT-002uin-1z;
	Tue, 18 Apr 2023 17:14:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poouQ-002uhu-1U
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 17:14:27 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-2f7c281a015so1671940f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681838063; x=1684430063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZc11MEoV1JrWm0UyoOIRAlBssx8JIBOhjzT0xozkHY=;
        b=MBxZVc8bEWalAaspvBxNQW4D3xWeHWtSQ99yB5U0RFM9GXQHnWFIiX4LyM+0qq1rx8
         5HrTH2/9AXhyB4LoePVjFr4Q510MjtFoIHDVS6ZbyKiHfWI0iM+5A0kxICqb0nPwZhFV
         ZiJBF6/A7qvEhqzoVOqlgBUR4JtxGga8iB6PhTPYu2RO/wAb36nwvniq4du2khcGC/S5
         arhWpZ3P/bQYuacT1acSa8oDlVjF7xJPWNBg5O1CJopCk4j8AtsD93W0UPY5vK+Y+Inh
         kUS5Wg0bTogvDRaiQbkyrLtdw6w9NzXMDwZ2XJId1dmakmvkEaZ/DKh27x3oKx9vHUO9
         4rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681838063; x=1684430063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZc11MEoV1JrWm0UyoOIRAlBssx8JIBOhjzT0xozkHY=;
        b=jAlFIM4CKaPWqXtjbYN7CpjvrgMoFR6xEV3mKc8ZvPp6v9NsaXuZRZLzOyINMKDrnI
         iaZy34gruWy+BDjO041EB7YCw4JtqNrDH8fXaqO80s3qxBOFQtxJL0eQlvsysausKfcI
         h+4uXy3KnNzHVT8ja44mKAyFZIGuWcw/29L8Jd3sO0L84Iww5ChyW7cyJ9O2GnYy1JLX
         +fb4Emd7Govhw0B7z+ThzDoOuYqpnOFWVuSWcxZyuh+tHNxYExXwfJm1MP826bHnxSGG
         XAv7w3n9pzjmv8M7Yc1MjcWO9BJJ4pOddDGToiQ/YZKJn4p5aqmt0pU9DXm2BrsGkqXx
         or6g==
X-Gm-Message-State: AAQBX9fJzlrCfeG3JKdzBxn4JQpHHlqQomNYuu31IEBTSOrKEFbRbRqf
	19QUsco2IJ+6l2NjAEDn7zbt7Zff+DSzD3XRpww=
X-Google-Smtp-Source: AKy350Y5pVt7R+F04NOaFVOwnrRzSEDfSJC7MErzOl+avLnnFNmBk+XlvvRUNl2BkYVtsI8XdatgNQ==
X-Received: by 2002:adf:f10f:0:b0:2f7:efb1:ec8c with SMTP id r15-20020adff10f000000b002f7efb1ec8cmr2230828wro.23.1681838063610;
        Tue, 18 Apr 2023 10:14:23 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d438d000000b002cff06039d7sm13479414wrq.39.2023.04.18.10.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 10:14:23 -0700 (PDT)
Date: Tue, 18 Apr 2023 19:14:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH kvmtool 2/2] riscv: add zicboz support
Message-ID: <rpqhta5gr53y4rub3abgrumzgtsuucefydyhwrkgzjldv3gow2@mpp7rh23nuaa>
References: <20230418142241.1456070-1-ben.dooks@codethink.co.uk>
 <20230418142241.1456070-3-ben.dooks@codethink.co.uk>
 <ub3varg6spvwh5ihma4ossabuvbuvyxst63pra7rm2lfrkychf@4olgfsvgnij2>
 <89499b40-c64e-3c0b-8ab6-ce84e94768d1@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89499b40-c64e-3c0b-8ab6-ce84e94768d1@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_101426_503535_95D2E3A4 
X-CRM114-Status: GOOD (  24.96  )
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

On Tue, Apr 18, 2023 at 06:05:57PM +0100, Ben Dooks wrote:
> On 18/04/2023 16:00, Andrew Jones wrote:
> > On Tue, Apr 18, 2023 at 03:22:41PM +0100, Ben Dooks wrote:
> > > Like ZICBOM, the ZICBOZ extension requires passing extra information to
> > > the guest. Add the control to pass the information to the guest, get it
> > > from the kvm ioctl and pass into the guest via the device-tree info.
> > > 
> > > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > > ---
> > >   riscv/fdt.c                         | 11 +++++++++++
> > >   riscv/include/asm/kvm.h             |  2 ++
> > >   riscv/include/kvm/kvm-config-arch.h |  3 +++
> > >   3 files changed, 16 insertions(+)
> > 
> > Hi Ben,
> > 
> > I have a patch almost identical to this one here
> > 
> > https://github.com/jones-drew/kvmtool/commit/f44010451e023b204bb1ef9767de20e0f20aca1c
> > 
> > The differences are that I don't add the header changes in this patch
> > (as they'll come with a proper header update after Linux patches get
> > merged), and I forgot to add the disable-zicboz, which you have.
> > 
> > I was planning on posting after the Linux patches get merged so
> > I could do the proper header update first.
> > 
> 
> I thought they had been, I just cherry-picked them (although I may
> have just used linux-next instead of linux-upstream). I've been testing
> this under qemu so it seems to be working so far with what i've been
> doing.

Yeah, just -next, so far. Thanks for the testing!

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
