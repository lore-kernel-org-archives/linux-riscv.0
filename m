Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326E6EA8543
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 22:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjgoDsG4odndyl/TjjfF5PiQzR0VZTUXSmC4nUE5fW8=; b=qsOmrsMvCKgfF5
	YdLeymuEVYIxv3mCtnZcw6e3Kl6HVXiLnCvNplJB+Cw8zyQSsRCX9Bt5J+NpoIRjWqm55M5oVe4JW
	h/AdqIs0xFcXi3Xr84Ok9s59b/2QKxKO6So4sJUgWDk0x78ZNG/FvaryXddvaBLy9z0JPP7Wqdfst
	KfuNlzTtuOM2+BrBL1lQuqSXLBTpwwYaM1EKxAfIQg89UxKbsaw4emdmIRNB6vi/H4bTyqIyzvd6m
	mJfxE4Wwuv46i+KpaSWyBJCjvIZ/con2Q8UGyO6F29E1bePOP1oZRLC5oUfaSEiO19AEoUQfO5yDS
	c31tU7BcVj8TqIAyyUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzMW4-00000006P6o-3dfj;
	Sun, 08 Mar 2026 22:22:29 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzMW1-00000006P5S-2NhD;
	Sun, 08 Mar 2026 22:22:26 +0000
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 42DD81B91B3;
	Sun,  8 Mar 2026 22:22:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id BD6C56000E;
	Sun,  8 Mar 2026 22:22:14 +0000 (UTC)
Message-ID: <9fd14d166e860f26febfbc9061a6dcae6a166961.camel@perches.com>
Subject: Re: [PATCH v2 phy-next 24/24] MAINTAINERS: add regexes for linux-phy
From: Joe Perches <joe@perches.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Date: Sun, 08 Mar 2026 15:22:13 -0700
In-Reply-To: <20260308205623.5trrqdmdrzj744hi@skbuf>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
	 <20260308114009.2546587-25-vladimir.oltean@nxp.com>
	 <ca170cbaf2f8bcbc89bbda68914d8e0d7640f0e7.camel@perches.com>
	 <20260308191017.kcyi7ka5pktq5jl4@skbuf>
	 <8c4c5d0c5d014d5cc19eb10906ca1bd83ffb3ce5.camel@perches.com>
	 <20260308205623.5trrqdmdrzj744hi@skbuf>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Stat-Signature: zgtxuwsb3363ai68tf6p7s8zp8seinzy
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: BD6C56000E
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19wsONHcaef5rI729O90pckRr9dLrQEYXs=
X-HE-Tag: 1773008534-677296
X-HE-Meta: U2FsdGVkX19zIqgNUKb+c+5Mu7Q3C+Gpl/B+X8eI5i6bGv7WE3zpj355qMm6YCbRSW7Vrhs2aumEBIt791syA8wOI3oaCj+46xwg3qNvWJkp2gLycZfqNtZEDdNuGCB0y349Wog5E09dSEbmxlYo3wEry6L0kQTHpHQi1eemnMz3eHRJ8lW0g+PBe0pZnw/seBVjwauSFyG+tNp9GhFkZXlt5WBWbJRv4eXsvXAwTvZLp/ToUvk9BlaA2J9NhuyWc4djQ+wNnPyIbjEf3YbjCt97pmlbZeZatO9Oxpnpbki4SgQq7YX4GOxv15JoA/1s08cXIoR5CaQiUuDxwOWahT02urVywBVxEzsYACoHDQg9R+OY8J92EbaYAELi/zOh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_152225_664156_C300E744 
X-CRM114-Status: GOOD (  17.14  )
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

On Sun, 2026-03-08 at 22:56 +0200, Vladimir Oltean wrote:
> On Sun, Mar 08, 2026 at 12:25:32PM -0700, Joe Perches wrote:
> > On Sun, 2026-03-08 at 21:10 +0200, Vladimir Oltean wrote:
> On Sun, Mar 08, 2026 at 11:40:44AM -0700, Joe Perches wrote:
> > > Perhaps if matching only the include uses:
> > > > (/ is escaped because get_maintainer is stupid)
> > > > something like:
> > > > 
> > > > K:	include\s*\<linux\/phy\/phy(?:-common-props|-provider)?\.h\>
> 
> > > Why is get_maintainer stupid?
> > 
> > The get_maintainer code used to match keywords is
> > 
> 	    foreach my $line (keys %keyword_hash) {
> 		if ($text =~ m/$keyword_hash{$line}/x) {
> > 
> > so it seems the first / in the K: <foo> regex would terminate
> > the match.
> > 
> > It might have been better to use a different delimiter.
> > Maybe:
> > 
> 		if ($text =~ m{$keyword_hash{$line}}/x
> 
> So why does it match in my example?

Not sure really.  But it does match exactly.
Maybe the regex code scans forward until the last /
as the / character is not a "real" metacharacter.

I added some test code and it produced:

line:	<+#include <linux/phy/phy.h>>
kw:	<(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)>
test:	<^[+-].*(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)>
match:	<+#include <linux/phy/phy.h>

From https://perldoc.perl.org/perlrequick

Not all characters can be used 'as is' in a match.
Some characters, called metacharacters, are considered special,
and reserved for use in regex notation. The metacharacters are

{}[]()^$.|*+?\

A metacharacter can be matched literally by putting a backslash before it:

"2+2=4" =~ /2+2/;    # doesn't match, + is a metacharacter
"2+2=4" =~ /2\+2/;   # matches, \+ is treated like an ordinary +
'C:\WIN32' =~ /C:\\WIN/;                       # matches
"/usr/bin/perl" =~ /\/usr\/bin\/perl/;  # matches

In the last regex, the forward slash '/' is also backslashed, because it is used to delimit the regex.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
