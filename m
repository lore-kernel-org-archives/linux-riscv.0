Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933F2CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 18:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfc0UbY+YPX2wS0m4A0HYsYr5dR8JlK/YcoBYfeS0X0=; b=PJ1fOLa4rSwoTY
	RwtR+xgfL98B/34UnI/IbSOgGI0WGD5/tZx3rfzJ7xec/BXio4G+CrOxGMso7Ai+jRyBhszfrKC5c
	TgK5LKCmAWBxuNg7ypzLN/S38OMf11nM5fFucKW8HfQvLhWBHz48VurXYX0DhOrKiAC1psb0SUBlR
	pbx5X5yC57T7XdEMmo20wF95k6Pd1k/u3G+xR7QGuJB9CMeQgiCY0A1v344pZThvnGEDe235XjdD9
	0u2rvkewIvm4gBlTLAnxMN6taYXT+rRMdltx2tKyi7OGUueH6G2rgg3LnK0MEPnVbS6OefM1eMpnU
	avlJ1YnhzcLC7GGRSppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCi1Y-0000000CHCW-0AqH;
	Fri, 02 Oct 2026 18:30:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCi1V-0000000CHBe-1zYi
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 18:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790965820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
	b=WLA8PxGt8D2ZjXp6f1i9b3jxPHDcwG6XkNGwfI5u1+k9/2fg3H9GVU3VdP86Ebb1xIbCKc
	F4IamSUugE3kIL9bq6Y9qRuZU62KKPFR8hK2JGf189zKCGwBW1zEE3+B1ufpVze077VnnA
	KezUIeMkFXj6/F0TdLTkp15MxC6IyvA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-KDYORZc0OuKekw7z2KCeog-1; Fri, 02 Oct 2026 14:30:18 -0400
X-MC-Unique: KDYORZc0OuKekw7z2KCeog-1
X-Mimecast-MFC-AGG-ID: KDYORZc0OuKekw7z2KCeog_1790965818
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dea1b6c89so133281485a.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 11:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965818; x=1791570618;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
        b=wj8uLBiT05js86lSZAT8g11Qx6D/JXMGDIcTIE5ZZZzCZxT13QyEtyDVGqUyZ1JxAy
         DgMLPuZD5nLHSQhr7XWyh+glXfmkCab68xCaDVVWc1S1E3jQrcmFb2y9QklPQKmBpi1y
         +dNTS3nZQfdGB3X35d3nHQidDWCPjTFkN5wGFYFazJZ7b9Ifvv5ZmUSSeKq2MVCqWuVN
         pHCtY8bJB1ZPVNSbSNBQaKDgLMpZ29VW7lAJe0FZZwmu46mbhKCBImkhm6lp18PI8aZJ
         7Zbe9oHCHNhCSnJC4+Vzx9aWlbUgYNSTBaJTre9LpFZt7EyGQEvGAvodD16j4+snSKL/
         ZUDw==
X-Forwarded-Encrypted: i=1; AKwUvBwEWp4CaZ/NukkN2pwJkBkJVX4IUL6uyFX5OAd7GAMKz47U/65MKqD8t26KPNs07XVixEFhCUsM76SAHA==@lists.infradead.org
X-Gm-Message-State: AFuF++lQVEIQ8J4d/cEMh62bNukRZsKzN6sQpEZa+JqexjUvngoj2PDI
	Fz357KkXXb9QQOjrgLFscfCpaNzYW8xB8oq9HWL7MFbAqt7YLgw1sLGuCtxK0/R8dDUsRuDdLrN
	VeI0hAW4wdWou+HnyVp/MGPMe3OxgTw6k1GmNNaIFYL248cGXmnhSIkPBdSFHXoEJDPzkQw==
X-Gm-Gg: AYBFou1c4HbLcNHnvEArabV4tZ2hG2YgT7rdx6oF+95CQoTaDvh5Ko0Sy5Vz9fk5F+0
	e8RI0ojPhDwLznoEzBS/KW7OKijQnJNLKJu6AyinlWtJHYLOZIHSi012zwMmvz4uOo2Qhbec9cj
	lfdJxzchNhgTU1nAI8ypilyewbQzg3GrVA+uZO0VDXPD8fVVf2H4tN7uYkrKzH6M0euoRDKMKKq
	Nx5HS05y8vPmpF9pCc8oHMciyYKvw04wLiWJS5F/0aK/FIKKyUEhc7mwr3BsDEWd6Dh1iwWudup
	oZ/uVrXhDB6xrolRewwdj8xhBjcprCZk2UnOHcHmShCBz4EqvdiDHOBOfpEHvTsa3vuuhFSHeg=
	=
X-Received: by 2002:a05:620a:31a3:b0:930:9091:f0ce with SMTP id af79cd13be357-93cf16b3b8bmr674430585a.22.1790965817946;
        Fri, 02 Oct 2026 11:30:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:930:9091:f0ce with SMTP id af79cd13be357-93cf16b3b8bmr674421085a.22.1790965817184;
        Fri, 02 Oct 2026 11:30:17 -0700 (PDT)
Received: from redhat.com ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca0395dbsm285252285a.5.2026.10.02.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:30:15 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:30:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 00/23] Add basic clocks and resets for JHB100 SoC
Message-ID: <ar_4NBLHrq2W7_vc@redhat.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930-grafting-undertake-ff3e01060284@spud>
MIME-Version: 1.0
In-Reply-To: <20260930-grafting-undertake-ff3e01060284@spud>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZbOOyOfL8Ppm15V-sIjCgZ8NaXAAnN20FsUMQ8S6PiA_1790965818
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_113021_606607_2DA81009 
X-CRM114-Status: GOOD (  22.30  )
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

Hi Conor,

On Wed, Sep 30, 2026 at 11:43:22PM +0100, Conor Dooley wrote:
> FYI clock folks,
> 
> On Wed, Sep 30, 2026 at 05:42:54AM -0700, Changhuang Liang wrote:
> > The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> > subsystems:
> > 
> > The JHB100 SoC is divided into multiple subsystems, and basically
> > each subsystem includes a CRG(Clock and Reset Generator):
> >  - sys0crg/sys1crg/sys2crg/
> >  - per0crg/per1crg/per2crg/per3crg/
> >  - voutcrg
> >  - vcecrg
> >  - gpu0crg/gpu1crg
> >  - cpucrg
> >  - usbcrg
> >  - host0crg/host1crg
> >  - pcierpcrg
> >  - husb0crg/husb1crg
> >  - husbcmncrg
> >  - husbd0crg/husbd1crg
> >  - npucrg
> > 
> > In the current series, we will only add the following CRG:
> >  - sys0crg/sys1crg/sys2crg/
> >  - per0crg/per1crg/per2crg/per3crg/
> > 
> > The remaining CRG will be implemented in future series.
> > 
> > This series depends on the series:
> > https://lore.kernel.org/all/20260806122553.182449-1-changhuang.liang@starfivetech.com/
> > and it has been tested on the StarFive JHB100 EVB-1.
> 
> If this revision of the series is acceptable, I'd (although I'm not a
> listed driver maintainer) like to send you a PR as I've done in the past
> for Starfive stuff so that I can get some of these binding patches that
> contain headers as part of a shared tag to be able to unblock a bunch of
> the soc tree stuff. With conferences next week I understand that, with it
> being -rc5, it's probably this doesn't make v7.4 but I figured it was
> worth getting my intentions out there!

I am going through this series now, and I have a few minor changes to
the clk drivers themselves.

Feel free to send a pull for the bindings and headers though.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
