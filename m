Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F057C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 01:52:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A17560EDF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 01:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A17560EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xUPYd2AKs5ycJW/nbypYFdfuo0zPhHDiQR6i3iqq3E=; b=edaES6wkM6MG0U
	sAvgrKOUV8CjqRtw0fX13/NIwiQDveEUi+gJi8eCXfNeF2zbgVLaZdlikpVbC18HRf86RSJ9vLok3
	sqGcAATAQDqQ49zXZqKy0xFb/ahScF+8cJ+5cNA6f82ElbhudzBTM+x/bb65hf88fzOnnjqn2g4SP
	+orV1ebDK5+puVAIz8tqFv5bfK7df2b/cek+LoJF8C76WWjz1qUCf0bsTy4kBx3I3KltNPswxK7pL
	5Cd2wKq9ztaST+DBNOJcuqIXmp5kKT0grQfKu30T9/rG5i7Gfm1OnDIkkfOU6RL5XAEa/mRikRThZ
	+aVF//D623guFbhmatig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi5Rq-003ocD-Ui; Wed, 03 Nov 2021 01:52:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi5Rn-003obN-Lk
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 01:52:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32163610E7
 for <linux-riscv@lists.infradead.org>; Wed,  3 Nov 2021 01:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635904335;
 bh=GaFgSiGy9kAy7Yn9X8sF343u7JFI75FGbA1WsYDXMLc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LaJWHbYESYL1bOiAhHg1NJDL3eegy1nslt2I4q4AeicVc9GcbqVUVvMxJt5wV+2km
 r//I+asOFcX+b/aBUM+bSlBnJUv+eHzSWB8wjwHEE/li6/BDiFzi9JTAuyBLlcgmDQ
 /syw7gbaMwg5wi7n/QC68PfFul/On1I3eVHFRBGPXus2TxWxvUUq1qvUJ4KymIZNHE
 FLN6nwgdZE1uPf1RuiuUKo2n7qCd5a+H4GXumwIQp6Tlk3W2w6ob320o0oqi1gG4TG
 SWj3D5w+w6LeL0oM2y1BSZgaSmDOc3agUlO6oDwDnWOj7krZi3jgLoGa5bPP9ytdM6
 oogrDYrGdx9IA==
Received: by mail-vk1-f182.google.com with SMTP id bc10so584455vkb.1
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 18:52:15 -0700 (PDT)
X-Gm-Message-State: AOAM531RwDxcz0n0Thmu7WEnkZ5z0Wi7dfPkHwMReW8Orm/WdYoPLbvA
 71TDjrgSvpFdkfgI27Gtd+jqpWhVZCBRtGpo6oo=
X-Google-Smtp-Source: ABdhPJzfpWtVC3prOps6URHAro8Kyf0Vv19yRBoMep6kB+ZgpRAESNiCnCBxD9+MlDpvPjnNb3DCAscnC47d3CRnR8g=
X-Received: by 2002:a05:6122:1682:: with SMTP id
 2mr44599788vkl.22.1635904334250; 
 Tue, 02 Nov 2021 18:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-2-guoren@kernel.org>
 <CAJF2gTSDTXu7HsABTHfTbCd2TNpHBpzSMqYGh9Av8kzJ+6AOPw@mail.gmail.com>
 <CAL_JsqKRizEaqmgVnfMWr2A_AHMFLjDpYNTHahTLPgSAtGYCLg@mail.gmail.com>
In-Reply-To: <CAL_JsqKRizEaqmgVnfMWr2A_AHMFLjDpYNTHahTLPgSAtGYCLg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 3 Nov 2021 09:52:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR8YrHEP+yZc61-4uqxJTk6OYifBf-+xmyjQppnSAXuqw@mail.gmail.com>
Message-ID: <CAJF2gTR8YrHEP+yZc61-4uqxJTk6OYifBf-+xmyjQppnSAXuqw@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] dt-bindings: vendor-prefixes: add T-Head
 Semiconductor
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_185215_769608_618BD265 
X-CRM114-Status: GOOD (  19.23  )
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

On Tue, Nov 2, 2021 at 8:59 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Nov 1, 2021 at 9:21 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > Hi Rob,
> >
> > ping? If there is no problem, could you help pick up this patch into your tree?
>
> Generally DT patches go with the rest of the series. And you need to
> send them to the DT list so that automated checks run and they are in
> my review queue.
This patch would be separated from these patch sets. I would send it
to you separately next.

>
> >
> > On Sun, Oct 24, 2021 at 9:33 AM <guoren@kernel.org> wrote:
> > >
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Add vendor prefix for T-Head Semiconductor [1] [2]
> > >
> > > [1] https://github.com/T-head-Semi
> > > [2] https://www.t-head.cn/
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index a867f7102c35..f532a8830693 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -1169,6 +1169,8 @@ patternProperties:
> > >      description: Terasic Inc.
> > >    "^tfc,.*":
> > >      description: Three Five Corp
> > > +  "^thead,.*":
> > > +    description: T-Head Semiconductor Co., Ltd.
> > >    "^thine,.*":
> > >      description: THine Electronics, Inc.
> > >    "^thingyjp,.*":
> > > --
> > > 2.25.1
> > >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
