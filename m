Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC02C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5w/WlJc7KAUL+M6dOTIS1ISvJwkSZwuwuNpRUZUxS0=; b=r+3P3e+lcujsYP
	k3RAN560Bgz62KD5IDHRjFNKknuYwidYB/4gYghoxUXgEqSwE+qSbA1FZfwqaqtXv306lGLO5HO04
	ktZwb/n76k2kI8PCrgpxaRIWNSgjeoNNYF2QrZMvxzpD+o2zQ4tHXsbMPwBj/WL2oiKFOaRszuBmZ
	noRfVRnLoiH0xTkJloMSmnfpa7pHYtf+0MAgzMWNYMNM42xrnNj2WF5bFqyatulGOzURjdCW+2xFB
	jNM3NDcNx21xW7OZV8iSnJgXSfJ7yYJH61e+O292iqZm7eQH5ZvKpk3+mWt6wsFuBogUg5tU7VSwV
	sF8m8vUF8Af6kkCgjSWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqe14-00B7kw-Nv; Fri, 26 Nov 2021 16:24:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqe10-00B7k2-DQ
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 16:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637943835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=keITFTEdFi5E9hp2LFE/RvLMU4rsiAlnNkpkNDD9Jvo=;
 b=a79KN8bEvfvP26dqUGgmeb33FtW0/klaUV+7uEm/HW3xHsfdvc9i7nTWd9HXFr1DiuQW5q
 UWv9C5lsFnAXAV396SkRwEsFwbodpWzQxCXQIDQl1Wk3Muuzr4G/pcErKcRYKzyv4H1+gW
 BGNl7fZOjcikxrimdTVWTgXzeBXLU8Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-r8icajrKONafwwVFQvpuaA-1; Fri, 26 Nov 2021 11:23:54 -0500
X-MC-Unique: r8icajrKONafwwVFQvpuaA-1
Received: by mail-ed1-f69.google.com with SMTP id
 i19-20020a05640242d300b003e7d13ebeedso8398405edc.7
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 08:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=keITFTEdFi5E9hp2LFE/RvLMU4rsiAlnNkpkNDD9Jvo=;
 b=FgQdHsg9+CL9vpTlpz2ppMhEHEwIagMJQgtEoZXF+hJJ6dqcxICG71Mx25Y+fs4LZe
 A8ihkl28B1WkILFpFy26205cvwAt/PgFlc++E9y6zh9h458J4ocQcpplWz0gqZxc68/C
 nNu6VHdv5rarkq1H/w++hobl1xUvuqCsVolTxYRt1CzdSqsuqeuVR7tksVihK0xpUd8+
 zrOV8+IX1RyADUTsyPj314jpMBpdhpgVN1D2cTAbxO+g9HIFlG0p5bInLrWm4iWpd7CY
 tNgk5apgtEMnYQQjU7yEDjMletp6grH+xbU6eU9/f99kkzYGQIGI0eLnreyyITtTUjXR
 3RCA==
X-Gm-Message-State: AOAM533YqG1H4FLTBkQC4+ue7Q5FfAQYBZX1yRNZ0brfUrGAq/05702E
 +TUy+ghb5ssDE2lw7Y/r3DZAcMRaVRrJPhuskv4fVYkrOGsJ/XpBexB2ch51q3c3/4deF+kGGsS
 Rlk5YS0KP2aqIBlmx/JtL+I76gI4YAoBBdmLNZGDEKhwC
X-Received: by 2002:a17:906:390:: with SMTP id
 b16mr38618829eja.522.1637943833293; 
 Fri, 26 Nov 2021 08:23:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/5Lm7haoggq+jLsvlVThHn5G2U/wwavJ0uSjFE0xk77eTpLkcug+uMs/Exh4ce7XHzo8pTVY4fEMtNQHx6II=
X-Received: by 2002:a17:906:390:: with SMTP id
 b16mr38618800eja.522.1637943833142; 
 Fri, 26 Nov 2021 08:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <mhng-ac32ff92-86cb-4377-ba63-de1856e84fb1@palmerdabbelt-glaptop>
 <CAJF2gTT90V6gQw12XZEXB1TJXb5QNdXM6qcfXh1yzWzDPExgPQ@mail.gmail.com>
 <20211102055857.GB26925@lst.de>
 <CAJF2gTSfp+JZ4YxiynVA4KO0Z4PwJ4_uF8UO3Tx3mDOHPnFTeQ@mail.gmail.com>
 <CA+YCwK=vMtKC0DrhSJ7apgZ4s4_8fzGoRxY2mKEjjyJZjNW2QQ@mail.gmail.com>
 <20211108075244.GA26350@lst.de>
In-Reply-To: <20211108075244.GA26350@lst.de>
From: Wei Fu <wefu@redhat.com>
Date: Sat, 27 Nov 2021 00:23:42 +0800
Message-ID: <CA+YCwKke6ER=Sv6O3zGkqvtfOvw+1VBR3-7w_SS_PTQyGBN=_w@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 0/2] riscv: add RISC-V Svpbmt Standard Extension
 supports
To: Christoph Hellwig <hch@lst.de>
Cc: Guo Ren <guoren@kernel.org>, Anup Patel <Anup.Patel@wdc.com>, 
 Atish Patra <Atish.Patra@wdc.com>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, liush <liush@allwinnertech.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_082358_567688_044166AD 
X-CRM114-Status: GOOD (  10.63  )
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

Hi Christoph,

On Mon, Nov 8, 2021 at 3:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sun, Nov 07, 2021 at 03:12:51PM +0800, Wei Fu wrote:
> > How about
> >
> > config RISCV_SVPBMT
> > bool
> > depends on 64BIT && MMU
> > default y
>
> Yes.  You can shorten this a bit more using def_bool if you want.
Sorry for the late reply, OK, fixing it now
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
