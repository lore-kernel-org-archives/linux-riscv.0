Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EFEECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8p23h/ZgXkYep71gzgVyQeqPVlIXoQsdiXguO1ZKjk=; b=YGi9eSWxCklXnK
	DBKD9OFzOgWNzYV61eBwU4eTtEp41O81m6e03P2ypuOLsOeuUE/NizXninY5UaMv+0NrqcF8iFHeL
	qR9Nv6x8E91tYivTWhIkvboaDR4Gz7w2AP6xcr+zQ/cavIpQYn2909fmG8V0U4p0AwN9MIV8sKg2u
	M9HTL5aiXPFh2RdQRpG9zGeR8IttlvNDPCU7F8vHRy89+4VKVOMA4bqtoAL6AoXuIYwjaepmrwJ2M
	D6Bfy2BrC9S3z5uORIbYhbkDQ5A/i3zSTzlaUWZLR4zXzZa8wEFzL563OwE+HDKZ2ftRuMcuZF5gO
	zIKYfVaPEWde6ybfAOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDlv-005iTR-Tk; Mon, 05 Sep 2022 15:12:23 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVAFU-001DEg-4E
	for linux-riscv@bombadil.infradead.org; Mon, 05 Sep 2022 11:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ybLPBkYQrLI7KkBu1Eu5bzqHE+OSOrE+j7kblJyI2eA=; b=dnkAx4TgCRr287IAyCKzVqtGp/
	F0VmlVoSgneyz2KR7hxEocnxOI53xvLeuxENfkP3kn2/IMe/SvdOx0jlPbN1Ss9CQeAnmn0TXNhMr
	4Xnvj7HsPo+RcXS5HHCkpOsLkJXBG76PWqaWrTVaXhcrsmZxawKYYYYRwUDz7+xqdzM+QOzjNlJ2y
	z5dTDybcfKk+ITfZOxm40iBhf9TwErM5N38qaf+8224FKJ5taE7uusAHj2cr3gqVt0aRAzdoYIx/X
	Y0r8xy67NCmZ3yrsR1TskIykr66YXF7hLXLy1mjRZn384LWg058qjZtmNbUsyi6wVdVwGuH+79pPW
	4p5EJTyw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVAC5-009ZPC-J3
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 11:23:11 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oVABy-0005s7-0y; Mon, 05 Sep 2022 13:23:02 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, Conor.Dooley@microchip.com
Cc: guoren@kernel.org, apatel@ventanamicro.com, atishp@rivosinc.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] riscv: use BIT() marco for cpufeature probing
Date: Mon, 05 Sep 2022 13:23:01 +0200
Message-ID: <7693745.aoefvbuG5b@diego>
In-Reply-To: <1e61d31a-9bf5-af79-dbc4-87d63d24b497@microchip.com>
References: <20220905111027.2463297-1-heiko@sntech.de> <20220905111027.2463297-5-heiko@sntech.de> <1e61d31a-9bf5-af79-dbc4-87d63d24b497@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_122309_747351_0A1F1AE0 
X-CRM114-Status: GOOD (  18.07  )
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

Am Montag, 5. September 2022, 13:19:41 CEST schrieb Conor.Dooley@microchip.com:
> On 05/09/2022 12:10, Heiko Stuebner wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Using the appropriate BIT macro makes the code better readable.
> > 
> > Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> 
> Missing the cover-letter with the changelog?
> At least, I didn't get it in my inbox.

darn git send-email and its automatic selection ;-)

I.e. I _should_ have added you to the hard recipient list for my series
in the first place, but instead git send-email selected you based on
the Suggested-by ... but it looks like these selectoions don't get
applied to the cover-letter ... sorry about that


Heiko


> Either way,
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > ---
> >   arch/riscv/kernel/cpufeature.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 729f7a218093..08f7445985dc 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -289,10 +289,10 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
> >          u32 cpu_req_feature = 0;
> > 
> >          if (cpufeature_probe_svpbmt(stage))
> > -               cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
> > +               cpu_req_feature |= BIT(CPUFEATURE_SVPBMT);
> > 
> >          if (cpufeature_probe_zicbom(stage))
> > -               cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
> > +               cpu_req_feature |= BIT(CPUFEATURE_ZICBOM);
> > 
> >          return cpu_req_feature;
> >   }
> > --
> > 2.35.1
> > 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
