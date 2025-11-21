Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9912CFC509
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 21:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Z+YfuLVtBUm3GlK14YjP/Z4XlTun7tbnq5EuCn3Nrk=; b=hpMEZRtlSgFInv
	LCC99Kjwa5kk6L3qZUxTk7ZySWEYMejHOpN8YFHxNDb8aFM+HO/V7zHBnChRkOsu1HaDGo/P0WdMI
	la5kzeANEGpCbER9iaU8Dmx+D1HX5aBKFaZ+A8JBN8DZ2cC4TdluUeJ9/flopIQbUUVX9gUXXm3ox
	Y56ZyJ2k++PlJUnDvM0ds0gbE60uBLcIvH0fRQ6pJRp9W+EfEjr2HTjyn6USQ9Bj7hnRSkMx4w+SU
	ebj5Zb0iZuCoq2omlt9nERI9SVcacyjedJo8f7l0kH56fz9a5Pg7vDO6Xd2UCq8fTtBMPOWHEKbke
	C88eS8/Oomd2ylTd9Tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMYUU-00000008zQ5-3sw4;
	Fri, 21 Nov 2025 21:16:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMYUS-00000008zPj-2Xzi
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 21:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 092B144322;
	Fri, 21 Nov 2025 21:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82571C4CEF1;
	Fri, 21 Nov 2025 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763759782;
	bh=FiypYvKf6VpX/fvafcOV0jwDzIXIP9N1G7YUY78Mgto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EeZF7r54BGm0ZwkzOfmMxiXjjvXXjgi8kjBuGCvx6FfJmz5IuUkElZmWMDFRioEBN
	 eNh7m8pYVvU2bKzA6IRZzDCclPgoY3SV2B+5SKe/ITnjjNE7n2RPCBUHO+J7xMOunz
	 ePaHzkX/wjfAfdM6UGtSXo5zoGn08giuehOto+pPoxtw2DK2FlWk9r//72uRliXIKE
	 YSXxilLFiklFM5UWSEolAtTtjkyMgGNXi1nZZV6D/tf9VwwadIJbWI8hYP+fOVbJmW
	 +2+C/wfQjj2Uhd8iOQvy3M8uVTRfpxbsPZWKKNXTr0vbpxFEFUS5rL39jYAYSnwPTD
	 9GLGkjRjFQx0w==
Date: Fri, 21 Nov 2025 13:16:21 -0800
From: Drew Fustini <fustini@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Joel Stanley <joel@jms.id.au>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Nicholas Piggin <npiggin@oss.tenstorrent.com>,
	Michael Neuling <mikey@neuling.org>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Paul Walmsley <pjw@kernel.org>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Tenstorrent Devicetree for v6.19
Message-ID: <aSDWpcjVT+pt1R7I@x1>
References: <aPUemXdOFZEdkayE@x1>
 <920f8f04-92dc-464f-807b-d09cc77c5532@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <920f8f04-92dc-464f-807b-d09cc77c5532@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_131624_689231_B3C4D58B 
X-CRM114-Status: GOOD (  17.37  )
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

On Fri, Nov 21, 2025 at 09:49:42PM +0100, Arnd Bergmann wrote:
> On Sun, Oct 19, 2025, at 19:23, Drew Fustini wrote:
> > Hi Arnd,
> >
> > Please pull these changes which add Tenstorrent as a vendor and enable
> > support for Blackhole. It adds the appropriate entries in MAINTAINERS.
> > The changes all come from a single series [1] posted by myself. Joel
> > Stanley has reviewed and tested all the patches. Rob acked or reviewed
> > all the bindings patches. W=1 dtbs_check and dt_binding_check produce
> > no warnings.
> >
> > [1] 
> > https://lore.kernel.org/linux-riscv/20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com/
> >
> > Thanks,
> > Drew
> >
> > The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> >
> >   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:tenstorrent/linux.git tags/tenstorrent-dt-for-v6.19
> >
> 
> I pulled this one manually as you had the wrong URL here, please
> use an https:// url for git pull. You can do this e.g. by adding
> 
> [url "https://github.com"]
>     insteadOf = git@github.com:
> 
> to your .gitconfig.
> 
>        Arnd

Sorry about that. I will make sure I give the correct url next time.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
