Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04F5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 05:20:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D3761BFA
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 05:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59D3761BFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKGm9CS5r9xrziZbCa4FsrQWDax5UPJ9geOn37+qzXE=; b=LgiZHIDxoFZwp9
	xONsU7C94lb2ZewrPmVJWk4xYBvVeBpjpz7fVauVBtx9jBgsSQ8/u4jqzCVKXEot2YnMAVKMHnDsj
	sz0Az/zb9zF4agQ6CinICpn37k8ICxif7LH88hDCKrMh23KIPrNQ3krDCTCjXIblkrbHUGEXk3jOB
	yh7hoTcLQgUr6OYx4rnOq46c35GzbSbOSRBKIWinMQWUpUURlCQjw2lql+/taomLNzkmVFgrhGpy+
	Y5ef0KdxyOSrPgk8ksdYpvVpD0QwahkrjDSsZHTgt2TPzY5Z3mxp5kU0Kyypem0uO6ba53duOe1sJ
	7xAlbyG7nBAU77FabVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmqt1-000Hky-4N; Tue, 16 Nov 2021 05:20:03 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmqsn-000HjQ-Nw; Tue, 16 Nov 2021 05:19:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 31EF8806C;
 Tue, 16 Nov 2021 05:20:23 +0000 (UTC)
Date: Tue, 16 Nov 2021 07:19:43 +0200
From: Tony Lindgren <tony@atomide.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
Message-ID: <YZM/b2/F8xmK43vr@atomide.com>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
 <YYu4EglV7SBZU2Iy@ryzen>
 <CAGETcx_m3f5JgrKQXZ5DUxDkpGhAau9G8uYm8a0iQ8JbcD0Rtg@mail.gmail.com>
 <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_211949_865726_89B03DE0 
X-CRM114-Status: GOOD (  33.11  )
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

* Saravana Kannan <saravanak@google.com> [211115 20:19]:
> On Wed, Nov 10, 2021 at 12:24 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Wed, Nov 10, 2021 at 4:16 AM Abel Vesa <abelvesa@kernel.org> wrote:
> > >
> > > On 21-09-28 17:07:33, Saravana Kannan wrote:
> > > > fw_devlink could end up creating device links for bus only devices.
> > > > However, bus only devices don't get probed and can block probe() or
> > > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > > devices using the simple-pm-bus driver.
> > > >
> > > > However, there are instances of devices that are not simple buses (they get
> > > > probed by their specific drivers) that also list the "simple-bus" (or other
> > > > bus only compatible strings) in their compatible property to automatically
> > > > populate their child devices. We still want these devices to get probed by
> > > > their specific drivers. So, we make sure this driver only probes devices
> > > > that are only buses.
...
> > >
> > > This change is breaking the expected behavior for the already existent
> > > simple-bus nodes. All the simple-bus compatibles should be replaced now
> > > to simple-pm-bus. In my case, on some i.MX8 platforms, without the
> > > devlink, the devices suspend sequence changes (and even breaks).
> > >
> > > To avoid breaking the already existent simple-bus nodes, maybe the logic
> > > should've been reversed: keep the simple-bus as is and add another
> > > compatible, IDK, something like simple-trasnparent-bus, or something.
> >
> > The intent of this change IS to affect existing simple-bus nodes (but
> > not in the way it's affecting you). But if it's breaking stuff, we
> > obviously need to fix it.
> >
> > I have a hunch on what's going on in your case, but can you point me
> > to the specific simple-bus node that's getting affected? I'm expecting
> > it to be a simple-bus node that gets added AFTER this driver is
> > registered at device_initcall (module_init gets converted to
> > device_initcall).
> >
> > Also, can you try this hack patch to see if it helps your case?
> > https://lore.kernel.org/lkml/CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com/
> >
> > I have some thoughts on how I could fix this, but I need to think
> > about a few cases.

Not sure if this is related.. Some drivers need to be updated from
builtin_platform_driver_probe() to use builtin_platform_driver() when
switching to simple-pm-bus because of deferred probe. See more info
in commit e259c2926c01 ("PCI: pci-dra7xx: Prepare for deferred probe
with module_platform_driver").

Regards,

Tony

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
