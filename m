Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9C9C388F2
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 09:57:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCAFB221FA
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 09:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCaOLnl2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOqu7iq8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCAFB221FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQFRcpCIMRGP2szyjN/G38W2Z1n7pmnrkdyDKH193So=; b=RCaOLnl2Oy/BXaKoiDDtgWZlL
	yMWn2R/u/1EuPz0l2wcu3t4VJ0L7reG98cb9jkF15u9ID86HR5qvatt48lUojAO9XofSftFyu/H6K
	PiILRi9iR0vqdT8l2DrheM8Y4X5tlpZdxX6lEz2ECiOkXtQUL7SYTXXxT5riigqlICgz2F8q0CqDk
	Cbpt8DhLu0fSJjmEeu0JA7ee9ey4ATr4FDNDETFAg9+WeqszN/lBPRaicg1lTMpor34MfbNe9AX7g
	9wrfpjZhTFG6zPGwWh1o3hqTphIj5awGHGxcUCAhtpBSNd3KTGVEATze30WKHr4zbNuG5c8uGRBwv
	WNp/i5CSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayUS-0002WT-UJ; Fri, 06 Nov 2020 09:57:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaySX-0001c6-Am
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 09:55:32 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E42C721734;
 Fri,  6 Nov 2020 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604656503;
 bh=fq0Ui8t6PiSDl63PaQnqQ+wD7V5/mQ8ZBFhNNG3yCok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iOqu7iq8fkqhQinW+HWeXRONm4gVqP0ORpaGzDUMT9zotN8/ZoAt8k4smbdnLkRfA
 gQF4QwYnBsQf3JTygZryT4dYi6nYvqpqKGLuqzS6PEjkhnobvGexT83gHte/RclSzw
 WjuqDzk0ase4qrOZuSmZgJVWNdu/bBS1goiCMzjw=
Date: Fri, 6 Nov 2020 10:54:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/36] Rid W=1 issues from TTY
Message-ID: <20201106095450.GA2660312@kroah.com>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104193549.4026187-1-lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_045505_521218_DEBA3951 
X-CRM114-Status: GOOD (  11.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Robert Love <rlove@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Nick Holloway <alfie@dcs.warwick.ac.uk>, Russ Gorby <russ.gorby@intel.com>,
 Kevin Wells <kevin.wells@nxp.com>, -- <julian@uhunix.uhcc.hawaii.edu>,
 Andrew Morton <andrewm@uow.edu.eu>, Laxman Dewangan <ldewangan@nvidia.com>,
 Paul Mackerras <paulus@samba.org>,
 "David A. Hinds" <dahinds@users.sourceforge.net>,
 linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Bill Hawes <whawes@star.net>,
 Roland Stigge <stigge@antcom.de>, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jan Dumon <j.dumon@option.com>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Gerald Baeza <gerald.baeza@st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Marko Kohtala <Marko.Kohtala@hut.fi>, linux-media@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-msm@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linaro-mm-sig@lists.linaro.org,
 Stanislav Voronyi <stas@cnti.uanet.kharkov.ua>,
 "C. Scott Ananian" <cananian@alumni.princeton.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Andrew J. Kroll" <ag784@freenet.buffalo.edu>,
 processes-Sapan Bhatia <sapan@corewars.org>, Miloslav Trmac <mitr@redhat.com>,
 Mike Hudson <Exoray@isys.ca>, Joseph Barrow <d.barow@option.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 paulkf@microgate.com, Filip Aben <f.aben@option.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Jelinek <jj@ultra.linux.cz>,
 linuxppc-dev@lists.ozlabs.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Russell King <rmk@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 04, 2020 at 07:35:13PM +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.

Many of these now applied, please update the series against my
tty-testing branch and resend the rest.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
