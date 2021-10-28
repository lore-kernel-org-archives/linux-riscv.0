Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359EEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 23:38:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8CC260E8B
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 23:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8CC260E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWP1wxAKJhxfqExIfz4jyfCOFyEYh7HhPBKgxB0eus0=; b=MBl1M9t0wH6MA3
	RpAHGQLIomFUkW0PEaB851E9t7vHqAhHuooQgrEFVw1ElpU8eQc+9QDJx1ao6C6XFPzSPqoofmdm5
	TTxX4lAJqjFLLa3iHjpMBTJzpuvVOJJz6pzpt6OAVNl6kr7LvDa/Rxxq8RG6k3NOjDKRWv6FYL7uL
	21AKJKuEPFLC+OH8X4Ctav6nP41BPyKvUWe+veAYqPAiYrCWqIHb6k/EdkwIqh8R5t5alI4Q5O7hy
	QVitiMnvm2ourAKV/6j6YivtsUuqhDPlWOM2z71QM1KrXGEYI0F3iDVpXAUzirKK3lkJvd72rfjz3
	e9GiGmTduYAR59p8fsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgEy6-009Ihc-B7; Thu, 28 Oct 2021 23:37:58 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgEy3-009IgX-OY
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 23:37:57 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id q74so13623221ybq.11
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 16:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cheY9bIPEAikUChpUOLiNCBs86TVcB1sR5Shc6iQ+Bg=;
 b=gUq7HVwr4laLdDA+DkVm3Vp/7rVb2c2ngZ2rzoWvp47loWw7K2pDLqjapDGL3+v5aw
 HprDuKOGdqpVnzO9szaYZiRVrP5maXpDrjj/j/I1Ntk17M6LFV5aplDuKHOrnSZ7lNkk
 RmXsndUujojn9L33QYe76+RTpfqhr6xgiBevI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cheY9bIPEAikUChpUOLiNCBs86TVcB1sR5Shc6iQ+Bg=;
 b=uu9TdcMcu2wuUsFA/vmlvC11PqRgh+iyb0X1YBTRnD9SzJ6ILlxEjD62ClYGaok3xR
 2kOzCoqfnXSnRe7KvEmvJhCHlBRsCwTI/BfKCuVnpWZ/c86/9ffhJyFaoo+6+pmCi5W0
 1tZKnl/5ezyfsTJayPBeo3bP9y8mJhxVAOsEypeUuhICkOiqjDYiSLLQL6+OVmQat02s
 liKZ2y3Xt89k99K9HQQhEqFUxWXqaVl7R2ZVqnoYE8L5vih1WkPK7EQRp/4jkk+kPqUx
 gNm/PbvDqg53ExrsnG1eNr+x5/YzAdvdmmksC1q5fVOmTNPi4d4BOxqDEszvqtoyCFCX
 VdEA==
X-Gm-Message-State: AOAM530Rye40r8ykYN776SFk7C8PU5HgmxgdVukCE70mmiBcjxoJKUNT
 xHT0YlJxN27n0V4H12sgN2kVaU1CeNHRrotv/qlE
X-Google-Smtp-Source: ABdhPJzSzknSU4EdecKlfWAUlLx9gBS4Hx80KVuVfnFb4yRPxWyPTPMNfFBpM+J1dEVoFJPcf22J0CA/PkPEBwzIyAU=
X-Received: by 2002:a25:bf8c:: with SMTP id l12mr7950987ybk.87.1635464273081; 
 Thu, 28 Oct 2021 16:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195350.242914-1-atish.patra@wdc.com>
 <20211025195350.242914-11-atish.patra@wdc.com>
 <YXsMtrmuavGAHk8S@Jessicas-MacBook-Pro.local>
In-Reply-To: <YXsMtrmuavGAHk8S@Jessicas-MacBook-Pro.local>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 28 Oct 2021 16:37:42 -0700
Message-ID: <CAOnJCULqwZvK52nczp2HNinDCBjThnbGbvJpAvdameny1fK4Vw@mail.gmail.com>
Subject: Re: [v4 10/11] riscv: dts: fu740: Add pmu node
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Atish Patra <atish.patra@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_163755_884460_F8898A7C 
X-CRM114-Status: GOOD (  24.15  )
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

On Thu, Oct 28, 2021 at 1:49 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On Mon, Oct 25, 2021 at 12:53:49PM -0700, Atish Patra wrote:
> > HiFive unmatched supports HPMCounters but does not implement mcountinhibit
> > or sscof extension. Thus, perf monitoring can be used on the unmatched
> > board without sampling.
> >
> > Add the PMU node with compatible string so that Linux perf driver can
> > utilize this to enable PMU.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > index abbb960f90a0..b35b96b58820 100644
> > --- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > @@ -140,6 +140,9 @@ soc {
> >               #size-cells = <2>;
> >               compatible = "simple-bus";
> >               ranges;
> > +             pmu {
> > +                     compatible = "riscv,pmu";
> > +             };
>
> This is a property of the user-replaceable firmware, not a property of
> the hardware,

It's a property of hardware that indicates that the hardware supports PMU.
Additionally, the counter overflow interrupt number needs to be
defined through the DT as well
so that a clean platform driver can be implemented.


so having this in the device tree under /soc, let alone
> hard-coded in Linux, is utterly wrong. Why can this not just be probed
> like any other SBI interface? The "Probe SBI extension" interface is
> precisely for this kind of thing.
>
SBI extension is anyways probed to verify if the firmware has PMU
extension or not.
However, adding the DT property allows different platforms (with or
without sscof extension)
to use the same code path.

> Jess
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
