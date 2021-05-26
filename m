Return-Path: <SRS0=lIhr=KV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EE1C2B9F7
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 03:32:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88B7613BF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 03:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B88B7613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fK5CwJuLKytBRQWz2NxHj8LzJitPrxfUYoJDmB1QT70=; b=H7dDL2xdsrBNMt
	lB5626G6vaMQ/wO/GB7Hs2MfQXOvjSZ0nNClYuz7j41kAM8p+m7R+DhLYHytGIMuUEd+/DnlcX6A5
	NS1y2IDyRZVcVDHt5O9NjV51eY8GKL35oi3HCmrhBfi4Alvvt4mELoab/Jwj7ogJbP5hiVFUjPH2T
	Ztf859aux2Z69GXYmCYo8KmzSjyzpTex8IjEK0962+vOqYsqQRO2bv1UbsYFUd4m7QaHiIiwLljt0
	nX3+u9ydqfA6P5ZMEEO1xHsYIXQoWR/8/awbrmcA7cUJLOlXbB0IcswHyCLNC9t9kNXw1Xb6romyW
	20oHiP5GLB649tauy5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llkHI-00AYtM-0G; Wed, 26 May 2021 03:32:16 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llkHF-00AYru-Fi
 for linux-riscv@lists.infradead.org; Wed, 26 May 2021 03:32:15 +0000
Received: by mail-pg1-x52a.google.com with SMTP id r1so9565194pgk.8
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 20:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wxfbfuufhoTIGsjrsGFVu7acYSXGtnsJ5ICdHv95D9o=;
 b=jGSFp5iSkMv39rgM1G1FN3ktf9i7NTuOcXy+xnIPw5C5clWkJ3/VPEAEQ2iNYo++PP
 M412ErWcC2+LQy+QQHLL25UEHWtFxiufaoc3CbSR4jMDpKuZmZvKi1rGl5OGjvSMJSHp
 P65agmEXr029ohl7fi4+f/hih6fN5DNqnYHTcil7IRsF5PUuKFTh0+swfYuo15dC9/dY
 Zbbr61EekjienrJngs7BzlYYbirCT3Z4lD6PqXvg2horsw99f5Pkstas5F3fHi9nRnjm
 DDvJlXXVoNz/+7L+oX+R3spUYNWk5eVw6jdW2FtVs94lDOLkS0RcLP/xFnxzQKecSjcO
 QfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wxfbfuufhoTIGsjrsGFVu7acYSXGtnsJ5ICdHv95D9o=;
 b=cetrAuHBOAiqf7QiIKyv0bFFzqh2J7zPJF2lb3Ud2pZtAm9HBIkbGJ/wbsQpCvIBya
 mB/G8Zh/vReXMCqulpqp80GNPCbDX9icanmpbq3U/mg5B+8XLxjEJb7KHe70irWlM7ai
 8yi9Ptthq/07zWx/YBLNKE0Bh/cDnrzjvxe0N8V16hxGbzWxx8IJUeUCRnEAwrIinike
 BBtjCxansznhTgPBw8SFnVCivBf57aNk6OOJApfVgBZ8sOJdWQuBuP5sssCYJblREkw5
 i9H/pFxqQU8WkFe3VUakw5tGTB8UQBND5VP3Ti7Gem/EhGue4WLR4/OvBtGIhFqHNEs4
 PbNw==
X-Gm-Message-State: AOAM533F/XE0Rlz6ZzWROFYDaLP/GWFSeauk2hOjo46ZxPzrcaAHbctR
 QNrDlq5xnahnLH20/6dKesDqGw==
X-Google-Smtp-Source: ABdhPJwwqmv5fOuZj2gTLWm1aPGOBcATAqRwutccEC1CahZaBcTt4uDeBD2JIpgKq+kcTEidz8j5qQ==
X-Received: by 2002:a63:3e8c:: with SMTP id
 l134mr22645757pga.202.1621999931722; 
 Tue, 25 May 2021 20:32:11 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id 23sm16088688pgv.90.2021.05.25.20.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 20:32:09 -0700 (PDT)
Date: Wed, 26 May 2021 09:02:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 bgolaszewski@baylibre.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 linux-gpio@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20210526033206.5v362hdywb55msve@vireshk-i7>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
 <253f218d-07ac-1963-75e1-9ac2d035437a@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <253f218d-07ac-1963-75e1-9ac2d035437a@metux.net>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_203213_581683_FC018D80 
X-CRM114-Status: GOOD (  16.58  )
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

On 25-05-21, 14:59, Enrico Weigelt, metux IT consult wrote:
> On 24.05.21 13:27, Viresh Kumar wrote:
> 
> Hi,
> 
> 
> > We (Linaro's Project Stratos
> > https://linaro.atlassian.net/wiki/spaces/STR/overview)
> >   are interested in this stuff. I was trying to look at the last status
> > of all this. Few
> > questions for you:
> > 
> > - Was the spec ever posted to virtio-dev list ? I thought that's the
> > very first step before
> > we merge the code.
> 
> I had posted some spec quite some time ago, but it wasn't in the form
> of patches against the .tex documentation files yet. It's been laying
> aside for quite a while, since I've been busy w/ other things.

Will you be fine if I take that up and restart the thread ?

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
