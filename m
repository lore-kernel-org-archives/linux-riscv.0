Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26D5D46BF9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 19:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pe0V7ubin3HW25YoXu5S7IzZSlOVlhD9KNVRYEEG1Js=; b=ra+5rreCErLHr8
	1wKDkXNVvw/JQUgxRQtBnyh6YZESrV0tXoQFFx6oF+s7/PvEMFiR4HEaKSd1aaQKFHgPtruA/hN4i
	RRnrbegV0XpCM2fuJH91XpQNybs0VmdG+dr816EQqlHTEqqk6pHA2gpbCghoZ8+Dvr5ex91selY+J
	3YrXSmoxUwvbucl0FONYMUNSdpBP3WDhN6tbLoonkETXf2FHMDnL3EgDuVoY5Zy+e1EhYYraovmQp
	C6AjFS2X0PphW0bmb+v2FPdBgXzJPkrzcQyQOHjcEkr1KSXKpqHOaMftqBipAVEVf0TgLtCNdtG43
	RqPaqBfx9lcxRxohN3zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBXP-0000000Gh95-1Cmv;
	Wed, 28 Jan 2026 19:49:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlBXM-0000000Gh8Y-1CPh
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 19:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1968342D95;
	Wed, 28 Jan 2026 19:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956C3C4CEF1;
	Wed, 28 Jan 2026 19:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769629751;
	bh=ZgURDPXZxdlzY1nCr7dFdlPZ+CG+p3tih0XcJrBxJSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkx+W8ykaiIAXPqelZuIfPFrrsGq5g6rbS4D8Jk/4FwLCUPyFtyLQbdRWVd5QVY0G
	 XOhZUqzVn1LqgIWGYrZDgEebxdC/KmN+dqrMiJ36UyI2+n1ywoBfPKW3kzUL4JwMSh
	 TWQu2/usGHuvucBrBEYtY1CuGbnwXZCIYuv9XxdIziZ1xHxgWV8GUsm4WaD8vJTtyI
	 ZjozH8/Y9OXlZkm/CQdngwr2lbuVJX3/CF01ddVSudhxRygFUhpXyXj8Bgbjk4WQim
	 HASeIQyrPngoVJoNEuDYWJ/Iq7mtUb/As6vyFCkXvux9Q53OAsVmr7xAByTYYFOlcx
	 bbpNtTZ7q9KSA==
Date: Wed, 28 Jan 2026 11:49:09 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v6 7/9] riscv: dts: thead: lichee-pi-4a: enable HDMI
Message-ID: <aXpoNTuziA2XOIuz@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-8-zhengxingda@iscas.ac.cn>
 <aXpbBq3TwuiP9Qry@x1>
 <aXpnTDSowoW+8UzN@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXpnTDSowoW+8UzN@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_114912_347336_AD37432F 
X-CRM114-Status: GOOD (  16.01  )
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
Cc: dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, Jonas Karlman <jonas@kwiboo.se>, Han Gao <gaohan@iscas.ac.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 28, 2026 at 11:45:16AM -0800, Drew Fustini wrote:
> On Wed, Jan 28, 2026 at 10:52:54AM -0800, Drew Fustini wrote:
> > On Fri, Jan 23, 2026 at 05:28:28PM +0800, Icenowy Zheng wrote:
> > > Lichee Pi 4A board features a HDMI Type-A connector connected to the
> > > HDMI TX controller of TH1520 SoC.
> > > 
> > > Add a device tree node describing the connector, connect it to the HDMI
> > > controller, and enable everything on this display pipeline.
> > > 
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > Tested-by: Han Gao <gaohan@iscas.ac.cn>
> > > Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > > ---
> > > No changes in v5.
> > > 
> > > Changes in v4:
> > > - Rebased on top of v6.19-rc1.
> > > 
> > > No changes in v2, v3.
> > > 
> > >  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 25 +++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > 
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> 
> I've applied this to tenstorrent-dt-for-next
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=tenstorrent-dt-for-next&id=0075f4c3aade0d436925026eaefb14be1ec52a69
> 
> Hopefully we can get some testing done with a next release once the driver patches hit next.

Sorry about my typo mistake. The correct branch is thead-dt-for-next

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
