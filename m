Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ACDC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:45:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8CEE64F40
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8CEE64F40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wkm2mi2zvqF6bxUb5ckx9UMQJ/y+d9nMAViVGj0PtWg=; b=EbF8xOoRwSKxg5dnI1DcXyKD3
	iOq+Lv2YqeZH6bvbh2h0p89Qf3njs1wPpcvbN1dxa4CL8tnrF0sa1YKDOsS4Yt3VpnC2/Sdx/3wje
	/EUhDyuJu1VzaAcGYMcTCtltAbxYTtx2S4TDyWEyVuTB2K+Qs4ERyi+o3o+TiKqLCznm+eQWIkUI7
	C01GX/MyLQlS9bp2vVrdNeQeZicCXNezZzWtyAgBruQtaJiJHOxLFJo/6a8eitZ4f76SywcAui3PV
	Auoos0Ynd8mqaKc5UO5HEu/w7xrJJO0f8wKt4S7uN7uvjreh/XgAq2Nc8jVQghs6d492zKFtukcwE
	3eGcg6Qbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNAl0-006tdr-Mr; Fri, 19 Mar 2021 08:45:23 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNAkw-006tdR-IS
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 08:45:20 +0000
Received: by mail-oi1-x22b.google.com with SMTP id f9so3988398oiw.5
 for <linux-riscv@lists.infradead.org>; Fri, 19 Mar 2021 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b7wm5QMKB239t1tplTFKDCbeyIsyOshCN0mI6FznUvI=;
 b=rqA5ewD896q0KlEZ+3JV9R9sYifcOh0EgtP7oEHhvKGSKbqeg2wDrhvHiAKAZBZvtG
 FSEu/nrYDGDa9dsDXRVW1+72ceXlxq4ZiErhgV3wmd/dmDioWNyYSjV4IXVUr5xuGb+V
 t6H875aA8ostTholvNxDJZoePZxxoj1nQguMGo2AUtxxTFUPQJHYW8tjZQ5YMcjOva8s
 z0rN2c3EXCMo6fweaQoHCcu8Pmdt1oSIOyFkfRByYGWx7RyfuxHXjrhFQuQtVzHhSbuh
 4OXJAbiQ3y3/H2J4dpWOXrhCLdNfi0oRUO1vokBJdyIwjQSJBKTy2flRYUa/TedMIm4E
 ffrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b7wm5QMKB239t1tplTFKDCbeyIsyOshCN0mI6FznUvI=;
 b=koHmu2jLAV9Onx0FiZoKuGQFGvMY7lNTRctXmhPweMHzeMs5WbddWhmhWnOYP3MsLq
 S34h3jeqiLIo8wfo1dkFFrPryso+9cOPp3CkiCLMPUnzDHV9mDs8myWxKuhcpSX+fwNR
 ZiAdyPQ5sBz3Ti2D3v7L4ZYfJCEw6/HOOKgGN5uRpPaKGuZX8+NIBjoPnnL8J3WiKiYr
 sYUILQzEteu09+vhhmeE9j2429lAQF0Cnn5LqSTWO4g1+nQ6IDXBJXd9CdRhh/H6iNJh
 0WiR3J1WpT0cWV7DiKF6B/u0aiQq0UyZXjh81Ww5hmftwaSFE4PW22jNcjQgbqLbwQiY
 gPhA==
X-Gm-Message-State: AOAM533CsJQ13vaQiB5z4s7mgMhqTfwfQlCQdl4af/yt3JdT1M/fDXo5
 jMhFfVB42KzW+8BlvJqNE9SwEEQgfEAsBycWK4c=
X-Google-Smtp-Source: ABdhPJyJhsaTtn9yzl0Cx3+n8/FKJ740qWUy6C3Eh2DasLzrDrzNFMdDHV99sq3C2XmR4tUBWUILMAiO4wv7w6jw/n8=
X-Received: by 2002:aca:a9d8:: with SMTP id s207mr222332oie.18.1616143515761; 
 Fri, 19 Mar 2021 01:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <87tupl30kl.fsf@igel.home>
 <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
 <87o8fhoieu.fsf@igel.home>
 <CALecT5gY1GK774TXyM+zA3J9Q8O90UKMs3bvRk13yg9_+cFO3Q@mail.gmail.com>
In-Reply-To: <CALecT5gY1GK774TXyM+zA3J9Q8O90UKMs3bvRk13yg9_+cFO3Q@mail.gmail.com>
From: Yixun Lan <yixun.lan@gmail.com>
Date: Fri, 19 Mar 2021 08:42:25 +0000
Message-ID: <CALecT5g5NLYSemdb5i-n66vYmBTk1xNSLn24fDQgZ+uX6rmj4Q@mail.gmail.com>
Subject: Re: macb broken on HiFive Unleashed
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Claudiu.Beznea@microchip.com, linux-riscv@lists.infradead.org, 
 ckeepax@opensource.cirrus.com, andrew@lunn.ch, w@1wt.eu, 
 Nicolas.Ferre@microchip.com, daniel@0x0f.com, alexandre.belloni@bootlin.com, 
 pthombar@cadence.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_084518_827970_D0D0C24C 
X-CRM114-Status: UNSURE (   8.47  )
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

HI Andreas:

On Fri, Mar 19, 2021 at 8:28 AM Yixun Lan <yixun.lan@gmail.com> wrote:
>
> HI Andreas:
>
> On Wed, Mar 17, 2021 at 4:27 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> >
> > It turned out to be a broken clock driver.
> >
>
> what's the exact root cause? and any solution?
> seems I face the same issue, upgrade kernel to 5.11, then eth0 fail to bring up
>
oh, sorry for the noise, just saw you already commented in another thread..

https://lkml.kernel.org/r/87v99qyjaz.fsf@igel.home

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
