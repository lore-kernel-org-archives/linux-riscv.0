Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FDBC43462
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 14:01:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C2161075
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 14:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07C2161075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benboeckel.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LwWIkcHSSXwiBwlXuZqjP5RrHylubTaeX7QQqdsVHRo=; b=QRCAP+1zLOeDcpKPIP+8X4t3m
	dD+sVKuq4qFu6MDSCcnk3IME0dsABhatkPglTvPxG9BB88eRwRwkL6LbP3kdLuFmDWIUEledQ3TNi
	Wnxwd+PiDM6iXm+NWRZFxjJeRm7+nKxs1ZfCAfNY321+vDycDHWRWfLmm99RjsEet7St6/1wi2psL
	4Q7yg1MCK9JBlqKVBAeDMCRUb60JGA8/6g8I9LGqyVOr5+WcihbGbhO8dci53qMB5esfDoLu8eHmu
	2N41M6QqtvVuZHisB7O1yDqiqlbv6YARGeRXl1b0plhLN5/rOuUQ1+UBQRarKfZ+cuA/Np1/MaKT/
	myObQvoSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg6Sz-00EYf0-Dw; Mon, 10 May 2021 14:01:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6Sk-00EYbd-Ah; Mon, 10 May 2021 14:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fwXudyHn8IUNsmfHA12W5pUxFzrIcUsJJs6niPOOwGc=; b=BuFc48NYmjMWQoN5kiDlVXFk5A
 gFkCypQ7EdQZaKaBQJEQsueG4RGN2wuCzq/M3M+X2PKiDfch/Ysx/Z6kfT4ZgX+iYGs+P8SyH38C+
 ayaAtvQXJ0InQOcI+y4cTONQtBBFOu6WoRn2RkArVpAlvpOufxWl0bSZtyxCpxewnaANyG4jU7GTr
 AxClKmqPt14zhzy3wpA87lJHItVWL3Uv+lvDdJvwEi9XqikLvNgNE3kUMgB3h8iDdKHP+zk8ro8iZ
 t98ILtUX5mUp4+L8NayCxjNwGXLoFxvQSUir9lZrIMaEcGbbnXa+vtxkOpbAzdKJRGpjb4nys99qh
 dRhC0Nqw==;
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6Sh-008mbV-IS; Mon, 10 May 2021 14:00:44 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 14AAD5807B2;
 Mon, 10 May 2021 10:00:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 10 May 2021 10:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fwXudyHn8IUNsmfHA12W5pUxFzr
 IcUsJJs6niPOOwGc=; b=gQh6u0zhPsG//1fbjCgHH3SUq5OZEixVi+ckcNcOvNr
 8f8S6u6OqczboxIeZQzxpdw3AUy1t45vyyuSQKDA1+yJJEqv0Na0yFB8YXQoxGQa
 A5mz/uekXLKQlXSBVpDzZgWHaTwxLQ8cfd/84Seg6MJA86M+DwrG/rxkfmjHnsDx
 Vsn+We4G3Oh5Yvv4HNwlluWEHPMQsGoYqOZqIpzyUGPfcSXaDfcxgaoBasafO20O
 Nia4uZb9+lsHdBKwEogjjnykkTJJzKThWOeq3e2hyjT/F/nLvkiGpnFJ0uMYCJ5w
 yhbph4b45d/9JdizeckN5aTq6WAACtGxOiZQK1Svtuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fwXudy
 Hn8IUNsmfHA12W5pUxFzrIcUsJJs6niPOOwGc=; b=FkYLunR8+bNyojGntZzlTv
 lNhoU5Ih8GFYdgqBiM9GEeBgkR7PC0rd49vKxgNK2oVHYiwvnJ0pFHee6wyNEefG
 07iyoKlPp2/47lNX2/0a3w6XYC3Muan3VrHn9DIyh2AJDD/sq19lwcD+nClmgOGW
 3kjTJut/WH9S1nO20R6vTeVSVeiFhLK/oh1ul5trEQZynTCu46HI2dcf9dXPVKk9
 sOjDpOdiQFUH6B6gq1Emr8rDL+S3scV3gAHdetS1J2hIDO0dgu0hscWNc8fHxaey
 25F3JvGPZJisNAQmAtq62YqH7TCAIzVvBqJwx8rI9Oyho2YDtxrFPxf1S0VsKOTA
 ==
X-ME-Sender: <xms:hDyZYCqZ48w__j-3J2DdcFFyCNO8Px1wZAdweI2vgyXQ5g_1A_avfw>
 <xme:hDyZYAoPMp-2hhXE5dIuFZVKJLDFR-LeVjsu56BtdhTJGnUi8Md4Pqb1pnf9Vqqdn
 t02Gw-Ku9S6gnwxX4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegkedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
 uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
 gvrhhnpeevffdtteetgfdttdekueefgedttddtueeugeekgeetffeuteffjeduieehhfek
 tdenucfkphepvdegrdduieelrddvtddrvdehheenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:hDyZYHO7a0I2ObO3iNQCJFMynfyvzQSxH3x8A4ShPc13xjvG6wh63A>
 <xmx:hDyZYB6OL9_iqJiCXEkFvw1uMnu0UHjkSyxn6Irx0qOidEFWAmkwbA>
 <xmx:hDyZYB472gSq8MYTawlNh6oofIzwaZQvJxltEegElvbnNVF17UiCaA>
 <xmx:hjyZYNFuZhUi4dOrdPamnliiTh3owe6Tf-ewK9C2k9SXGvHlGfVlTg>
Received: from localhost (unknown [24.169.20.255])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 10:00:35 -0400 (EDT)
Date: Mon, 10 May 2021 10:00:34 -0400
From: Ben Boeckel <me@benboeckel.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
 kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sgx@vger.kernel.org, linux-usb@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, netdev@vger.kernel.org,
 rcu@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <YJk8gkMlk8dtaEsz@erythro.dev.benboeckel.internal>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510135518.305cc03d@coco.lan>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_070043_690559_C259E406 
X-CRM114-Status: UNSURE (   7.84  )
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

On Mon, May 10, 2021 at 13:55:18 +0200, Mauro Carvalho Chehab wrote:
>     $ git grep "CPU 0 has been" Documentation/RCU/
>       Documentation/RCU/Design/Data-Structures/Data-Structures.rst:| #. CPU 0 has been in dyntick-idle mode for quite some time. When it   |
>       Documentation/RCU/Design/Data-Structures/Data-Structures.rst:|    notices that CPU 0 has been in dyntick idle mode, which qualifies  |

The kernel documentation uses hard line wraps, so such a naive grep is
going to always fail unless such line wraps are taken into account. Not
saying this isn't an improvement in and of itself, but smarter searching
strategies are likely needed anyways.

--Ben

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
