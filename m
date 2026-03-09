Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31057FCA18E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 21:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzQq3HVVP4GpjAix22Tz2GRVbDelX52UQlTbHAMpHoA=; b=SOLWB0vKZHWQ7K
	uZzD0i8ZmYSU6KuyXjzE/W4h7nwyclehoWhk2j4pmStCKjTxvO0YQ0r2w6PN8rIr3pbgSXU3/VAMR
	EEsAOtYjrR0KxZ8w9gqzTLEk06oftPB0hkvt9xf9DYlWi/yRkfsmCvWRkX/BLgFflRgCrwy1c6afT
	Jarx35fWjuyEtJUdaJgC0yJ/nj7tBpVSOEzd59mZDYXp/1kA8ei6rvsuyIMkBots44L9HgMPzY0ta
	ifNjD0zRrkTtXilPH1Np60zpKp1AK2PYzHZMH0fcjxDDq8xJ887kPqbESJfZyP+34Mzk+GgXCSmw7
	VooJCQAvWob7nSWlLooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhyj-00000008Adb-2p8P;
	Mon, 09 Mar 2026 21:17:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhyf-00000008AcU-44Na
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 21:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773091044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qQL1VhgKHAA+ngckVrAOEKHHkR+ETQSpB8jOYFzaBGc=;
	b=CT+wVoqJ1BXgkLMWXrjKTnQKR8MlR12eRz4xFc2bqWkph2k5tMexh7Jq6Ye1vX1huoVxje
	LGe+Ioi9jFqERYHWpDgZfEdyw4EKFLfeAscQB+vl62y5h1V1uMpWyjJkvObz5FEZtpyWAn
	PzjMGo3uArQ3JL3A3tbIfG68ok3JIDY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-wZdb-sDrMdew9LZYqhpczA-1; Mon, 09 Mar 2026 17:16:02 -0400
X-MC-Unique: wZdb-sDrMdew9LZYqhpczA-1
X-Mimecast-MFC-AGG-ID: wZdb-sDrMdew9LZYqhpczA_1773090962
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a1f95aea0so346783236d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 14:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090962; x=1773695762;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQL1VhgKHAA+ngckVrAOEKHHkR+ETQSpB8jOYFzaBGc=;
        b=v389BUaf+PPCGuiaC7sVnlEtCcl6PlZK4aJkuVOPALfW9kbbrbZZzgw6/4W3Sw9Q2N
         mSGcAjTpAYA0FcOhPLJ6nJUjgYH7xJtRToTesEw6RBzqqjgPsVuN7deN1BqG0Wu3Yi9K
         XOFgfzWLqKNMXdSDL0TEAjbVoUID48TBfkr4eYKnpjSS0Ftk7DppfEC2JZFLm+h1Sxec
         TaEXRZWjZVx6F+uv14/z2zRmCGrjl5Hp1j/sEW/vIpD8gDd5Pdg3bXEo4Phv4XjykjQS
         HxTkDXwT4qoicax7CNV3o45OcLyD7szBt5GVewff6DGpBM7j08icimkgBoJjcDuAcvid
         7AwA==
X-Forwarded-Encrypted: i=1; AJvYcCUUgdxgz1y0dMXEV0FojrNn420vMIq+f/DagUjlqVG76iug+5KfGrigSFZgr6dIdJEs7JIKKHmE+MQfEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yysec6CoiLGd1coSmzpwzQQOwlGCOF+UikRXHirsDWsUMyG1HUo
	QEpnDq0a6jWACyS2p+NlkrhiZU3V9PH2bRSu0HDDvapN0UaV8ErUE3Vp9h3OpnofMeLR1uFI86j
	IAR3x5KBvQjW2+T2hRNf6rFizepBcJM6WXicSxP+2XU+U7cKIZSdch89zlBocuKMb4DmKaQ==
X-Gm-Gg: ATEYQzyPq66qMoYeyxW7jgSWDt7XOhl2/MsZ/3qnXigAjTotAiSs4Ydt+fPgQA/OZXy
	7MLLJm2blp5pqJSYBisaqGw7CtP7lsC5wYsfS0mkZtQpOBGRwv+WEbygUNV9ejdt8mjOa4mfXUF
	d1kNXacT0Y9kbWS6uTSPl5GQm0K4t1mPBlCLWK8IoHV9XalJbBuVm0mkxBadGhUwUkBH0bJZZeE
	CIrden8+2Q4ZfdOsUm5oDV8xUYf1HBmzlmvx2pij8COZcXY+S1ldAOb3zx1Pz1LktCgrzW4sIrk
	MUhpd9p+2IFTjcLEdtGZVt/1xHljG4ZnmRbRAyD3K7Ko9EhwTqNMjHV7yxKjltcCCwmCDU9vYKQ
	sFmi7lpuUwW5zF/Ae/oUiXFGbc06fjikYewnSjvUaISy7LWEkVWwve/6t
X-Received: by 2002:a05:6214:c68:b0:899:eff6:6e73 with SMTP id 6a1803df08f44-89a30a1e8d1mr193817676d6.7.1773090962407;
        Mon, 09 Mar 2026 14:16:02 -0700 (PDT)
X-Received: by 2002:a05:6214:c68:b0:899:eff6:6e73 with SMTP id 6a1803df08f44-89a30a1e8d1mr193817286d6.7.1773090962011;
        Mon, 09 Mar 2026 14:16:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a18140sm6725596d6.3.2026.03.09.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:16:01 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:15:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Drew Fustini <fustini@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, mpe@kernel.org, mpe@oss.tenstorrent.com,
	npiggin@oss.tenstorrent.com, agross@kernel.org,
	agross@oss.tenstorrent.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aa84jv9NkZnTgSLi@redhat.com>
References: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
 <20260306-atlantis-clocks-v8-3-6c9b14a4aa8e@oss.tenstorrent.com>
 <aa8pVqupeZr67bEd@x1>
MIME-Version: 1.0
In-Reply-To: <aa8pVqupeZr67bEd@x1>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sRAfBO9BE_DAop2Tfq8soeZ9tgz2rq9BuvYtelI-AbM_1773090962
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_141726_420201_14AD05D9 
X-CRM114-Status: GOOD (  18.34  )
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

On Mon, Mar 09, 2026 at 01:11:02PM -0700, Drew Fustini wrote:
> On Fri, Mar 06, 2026 at 11:12:19AM -0600, Anirudh Srinivasan wrote:
> > Add driver for clock controller in Tenstorrent Atlantis SoC. This version
> > of the driver covers clocks from RCPU subsystem.
> > 
> > 5 types of clocks generated by this controller: PLLs (PLLs
> > with bypass functionality and an additional Gate clk at output), Shared
> > Gates (Multiple Gate clks that share an enable bit), standard Muxes,
> > Dividers and Gates. All clocks are implemented using custom clk ops and
> > use the regmap interface associated with the syscon. All clocks are derived
> > from a 24 Mhz oscillator.
> > 
> > The reset controller is also setup as an auxiliary device of the clock
> > controller.
> > 
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  MAINTAINERS                             |   1 +
> >  drivers/clk/Kconfig                     |   1 +
> >  drivers/clk/Makefile                    |   1 +
> >  drivers/clk/tenstorrent/Kconfig         |  14 +
> >  drivers/clk/tenstorrent/Makefile        |   3 +
> >  drivers/clk/tenstorrent/atlantis-prcm.c | 870 ++++++++++++++++++++++++++++++++
> >  6 files changed, 890 insertions(+)
> 
> Hi Stephen, does it make sense for me to create clk branches [1] in the
> tenstorrent repo on kernel.org for Atlantis patches to go through?

I am not Stephen, but that's the approach that all of the other SoC
vendors use for the clk subsystem, so I would say yes.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
