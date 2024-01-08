Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4211BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 11:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhjlBAygnj1/sEf4qsa6F3hrSpyEIsPDK6SDqcJrNw0=; b=kIcqSGPVUtJFUF
	h64Vv6GJFQc/XgHetEP6hmCggO5jz4oJ1/Jjr6yHxjkXRt3DaWGDrPgQv5w+Az3nmz2TLCCEx8Ede
	nN04L4wLGiYS28pBQra3AbyAbuxO/LazZHCi2zHOXVEoziqLkHyxgZ9hnHbUUTPdqvUI72TeiGPBW
	UBivDm8Fy03pDOZtqqU9/5xlzk847YDf27sRpFaMlX1vXLC9LavWHMOkR/aav9bQTJL7aa9qFFAJ7
	CVoHcVKZwDb/p0IMeVN1zQbX6+CMRJG3gn5M4+z/N/4HE/VJ50I9Defp2T2lMXjRn37aLIbegPMjL
	Jrd1Uz7bTdJ1/rPvF83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMnuc-004vd9-0v;
	Mon, 08 Jan 2024 11:35:22 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMnuZ-004vXs-1n
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 11:35:21 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-55590da560dso1912143a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 03:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704713715; x=1705318515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OXz+M+W1v8IkWUzljPV7N45CqW1f60s7WitH1y4Yico=;
        b=O44Bxg4wn44GXSHp8PjhGw0n4G/pfH0oMUpvzPSuYXJy1ZDqmz0hgznc1hMb5eFpTK
         0Fnnw54k3YC2m2BqJqf0ILmtnvchElz+eq2WM8K9p9nKdTNCTkOF77i7MbUdb2oP0bbY
         eZT7m7CvdgdvGlfJrWrUQ138A0Unlvkckt9+Q3Cvm4ax5Kc0I32HBk6eV9HGxjSDhzY2
         sSEFDXHHvu/G46mYgCLoq21dqQo6TQlOsf4OgUntA/I2MeQ6Vs7UNvP+B89dc9af5dzZ
         5S/xaOh+soczRtURpAmhpnH/uuFxfncgWJ56QJkMpplCCYcZZ9Kf8oj+JfhENhKfuQkd
         AgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704713715; x=1705318515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXz+M+W1v8IkWUzljPV7N45CqW1f60s7WitH1y4Yico=;
        b=fbQGlMQIrKloi15fykGeVpZVfNdWaJvUy+gX2R0Xu9G8lJF1R010Ly2NycVi6MT77a
         rVH0yB8y+U9p1Gynly0MYB7uAaFHRwaJyi+P3QpUT6YPMrIVmVoK46BvRneWdytNPs/l
         Lq88otLCJnC341Of3BUcHd12R4FBOmf5KjJd8bBzOdQ3HO/rriJx+Gko/Bt0nt10RWLn
         rlfX8kulNqLqeO6+LT91mlgsHIhjcCCtHV26nF+P/Kf19lFzXSGlz61IDMS/a+XgKlb5
         yxWrmd5HAdeMVjxwKlRSyJVczBjmHhxM8g1iRbsD/iVi/uT9FcDfYeiQumUJ1S/8YwX6
         SayQ==
X-Gm-Message-State: AOJu0Yy1bspBWjPhfB99gV+I3ukT9H8CPpTTRI8LuL271+rHJAJCkdzm
	kCd/1gIx8jKx15JN4gKBUB0wvY/o9r23f61t7fM92PhUq6A=
X-Google-Smtp-Source: AGHT+IGNFTf74SYqecew/zugquC+nKHg3U1rGduBdRyqSi2v04Wt1HCZM1c+hLYUJf5m9uXkjPyhsA==
X-Received: by 2002:a05:6402:b03:b0:557:427c:1c2c with SMTP id bm3-20020a0564020b0300b00557427c1c2cmr1797243edb.85.1704713715404;
        Mon, 08 Jan 2024 03:35:15 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ij15-20020a056402158f00b0055410f0d709sm4143181edb.19.2024.01.08.03.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 03:35:14 -0800 (PST)
Date: Mon, 8 Jan 2024 12:35:13 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, David.Laight@aculab.com, 
	Conor Dooley <conor@kernel.org>
Subject: Re: Re: [PATCH v3 0/2] Add Zawrs support and use it for spinlocks
Message-ID: <20240108-a56ba0dfd1779e4ab6893d16@orel>
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
 <ZTE7eUyrb8+J+ORB@andrea>
 <CAEg0e7jkTOn1pjO=+GaiCZJ9_Yd2NcB1GMG=Q6m3-r0+Q0OjGQ@mail.gmail.com>
 <ZTJUOji+B+dDbMKh@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZTJUOji+B+dDbMKh@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_033519_604013_5B4F2EA5 
X-CRM114-Status: GOOD (  22.66  )
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

On Fri, Oct 20, 2023 at 12:19:38PM +0200, Andrea Parri wrote:
> (Removing Heiko's @vrull address from Cc:, since it seemed to bounce, keeping
>  his @sntech address.)
> 
> > I had a quick look at your changes, and they look good to me.
> 
> Great.  Thank you for looking them over.
> 
> > Did you agree with Palmer about testing requirements?
> > I.e., do we need to run this on hardware that implements Zawrs in a
> > non-trivial way?
> 
> I didn't quite discuss such specific requirements or hardware implementations,
> but I agree that's a valid concern.  Not that I currently have access to such
> hardware; any further inputs/data will be appreciated.
> 
> > I can try to raise the priority on this here, but can't promise anything.
> > For me it is also ok if you take over this patchset.
> 
> Thanks.  Either way works for me.  No urgency from my side.  I'd say - let us
> leave this up to the community/other reviewers.  (IIUC, Palmer was recovering
> from a certain flu and might need more time than usual to get back here.)
>

Hi everyone,

I'm also interested in seeing this series resurrected and making progress
again. I'd be happy to help out in any way. It's not clear to me if it has
a current owner. If not, then I could start shepherding the patches with
their authorships intact.

I may be able to do some testing on an FPGA too.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
