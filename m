Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5CBC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WD2uFiJ+VAqrf8KuuyvqIfkVym/8e72FScK+ly74quA=; b=q1CYUvs3wB3RBD
	O95eItKH2/lRTlOHcG6j6ZEcQ/ofAtBP+wCPfr61k+zBA7Vxj/y6puUmaY2R6RtZMW84rDDzB/xFW
	zepZxnOcAZzTgKQiDsF12kecX0wUiwv28WxIbiirIKjpy7mMBM3hfbgXwYTFgASCe7/0Rog8IktnX
	+v8grMmRuwAOPUTbxT8AFhhdIGRIL/fkXXgjvdZnlSdKG1bWKmo6DnHkNXPcgk8rlFKRMWTF6hgSK
	VXzqlI832B8c0tdJtGJDYTKPY16vuCfWWOfVum0TRtoWFv/Y6E4L0kzOdaJvCsTU7eGSSqCW6+Xik
	1gwwzwYPgtTKqIakxvKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMppn-005EOE-25;
	Mon, 08 Jan 2024 13:38:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMppl-005ENp-0R
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 13:38:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3374e332124so1737465f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 05:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704721104; x=1705325904; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK2J7JQv1ZAdDNEh+92PGoAd4LmyCEettK2mxhPngK4=;
        b=Z4QLpLnB6AbmK9HOBrQ/z/M0sfA/oulvxgsFUEMvmdsUdjEmVVJaZBuHBBL/EIF3OI
         A0eRwDvBxsMWuxzjyK3FmxRJsWARDk9Qt5fKjE0i5svQ0qpIuF6ZFpASh2fCY78WrCpU
         wlc+igDL74tfC9NiVdDomKexd2wmfVWvwWVjYPvWtijsLCerLT7KK+/9+TJzSoP9BaO6
         eR29ONwqA1Y10T8yYp64qeGStIdRxROeZzavMg/6601ifMy41VQffR19Yc4y3mRjzQRz
         q2x2HvqKRdkW6ZxpQMDMw1Zcbo4Qj7LI1pZfcO3l+B7vEwok+SGa/uNovpQ3tHSnDPgC
         M1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704721104; x=1705325904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK2J7JQv1ZAdDNEh+92PGoAd4LmyCEettK2mxhPngK4=;
        b=sX/hUtKtPEu04D6BSL9PPuY7kedD0gUuChWsyCQ7Xh2LCa7/NOnQ6epO5hWBM6x9HP
         5/Da7us/OJJbw1YBACl3RT67TcgOdgZNj/y7yM+E94rvNt0B3wR/4kTEF1oeSCl4GjoB
         niLVLp8V89kwrHjvSfRBUo8yKjIYNq9IDWflxPV7n36Ix7r3d5zmx3QNr/TQrKoYAKe9
         LUmv27lqGQ6cCt4PEwWdrk4pKiFyXHbmbBtLFwoZ5xLXjBz/+xc+GcLckVQD+VTN9Hds
         dS+PhO2pZzuWoTOs+FmHQrvlZgOfLyIAHV6ugeUKxaU6kBjvPkYeR4ZDiWbbN7//4hdS
         LAlA==
X-Gm-Message-State: AOJu0YyWuI9OVxybzMlTLLQFMHaIba5OMA+a5F8hOlEriaMyGVq2IS5a
	YkCsfU3kk+engoaR8NtGHHk=
X-Google-Smtp-Source: AGHT+IHKJi8PNbM7awjz8nccpNraSUGy9jGtjam7yUa+u7vu4K3tHYuUvXTtEmFKw6Gk1R65uXxUmw==
X-Received: by 2002:adf:e542:0:b0:336:68dd:c7e2 with SMTP id z2-20020adfe542000000b0033668ddc7e2mr1765269wrm.27.1704721104398;
        Mon, 08 Jan 2024 05:38:24 -0800 (PST)
Received: from andrea ([31.189.29.12])
        by smtp.gmail.com with ESMTPSA id b14-20020adff90e000000b003375c072fbcsm7131164wrr.100.2024.01.08.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 05:38:23 -0800 (PST)
Date: Mon, 8 Jan 2024 14:38:17 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, David.Laight@aculab.com,
	Conor Dooley <conor@kernel.org>
Subject: Re: Re: [PATCH v3 0/2] Add Zawrs support and use it for spinlocks
Message-ID: <ZZv6yR2sF3v78msA@andrea>
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
 <ZTE7eUyrb8+J+ORB@andrea>
 <CAEg0e7jkTOn1pjO=+GaiCZJ9_Yd2NcB1GMG=Q6m3-r0+Q0OjGQ@mail.gmail.com>
 <ZTJUOji+B+dDbMKh@andrea>
 <20240108-a56ba0dfd1779e4ab6893d16@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240108-a56ba0dfd1779e4ab6893d16@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_053829_232876_C07D0495 
X-CRM114-Status: GOOD (  17.60  )
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

Hi Andrew,

> > > I can try to raise the priority on this here, but can't promise anything.
> > > For me it is also ok if you take over this patchset.
> > 
> > Thanks.  Either way works for me.  No urgency from my side.  I'd say - let us
> > leave this up to the community/other reviewers.  (IIUC, Palmer was recovering
> > from a certain flu and might need more time than usual to get back here.)
> >
> 
> Hi everyone,
> 
> I'm also interested in seeing this series resurrected and making progress
> again. I'd be happy to help out in any way. It's not clear to me if it has
> a current owner. If not, then I could start shepherding the patches with
> their authorships intact.

This sounds great to me - please do!

I don't have additional information to provide about this matter.

Thanks!
  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
