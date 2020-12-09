Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01358C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 10:35:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD15023B6B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 10:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD15023B6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=26S/3c03cfaDanHaLshvmgl3iU0pm5vefLtQ008tzHE=; b=lPyUff8hqDzDUws/YDT4rz1jq
	JdFkCl7BhFQZC8G0vdDNd0wuuvg2HTbstrl+W9lP/AjapsRm3pUefKC9os+qvwx2rmXaxQGiNg+F/
	9Zv+6LjmY23r0TMRHlPx58un1Jt8cA7m41TONF8C03LBODRokQwuGctVwG4l11wMo6yKuGqyxW/LE
	H3qsJ7a9zbsL6OpZiTM6Rs9pC1xstyoUZQbarcFBR2c6zFAleoc3FCoA0mWAwb2+SX6tUPiJ+mY5K
	OCS5w/eICbBiaVlRJ40J5kiyVcomQvKYlZ3irjsaaVzJOhroDu5G2Zh+wE7Z98d9UyK7f79O7unJs
	vHGKFymVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmwoF-000065-Et; Wed, 09 Dec 2020 10:34:59 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmwoD-00005a-Gt
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 10:34:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC698AB63;
 Wed,  9 Dec 2020 10:34:53 +0000 (UTC)
Date: Wed, 9 Dec 2020 11:34:52 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201209103452.GH6564@kitsune.suse.cz>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <20201208101051.GC6564@kitsune.suse.cz>
 <dcc41cf3-ab2d-656e-6fa3-73f231bde92d@metux.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcc41cf3-ab2d-656e-6fa3-73f231bde92d@metux.net>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_053457_675948_8B308BD2 
X-CRM114-Status: GOOD (  15.67  )
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
Cc: stefanha@redhat.com, corbet@lwn.net, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 08, 2020 at 01:33:02PM +0100, Enrico Weigelt, metux IT consult =
wrote:
> On 08.12.20 11:10, Michal Such=E1nek wrote:
> =

> Hi,
> =

> > The console driver provides early console which should initialize
> > without any transport. I have not tested it actually works but the code
> > seems to be there to support this use case.
> =

> What does it do if it hasn't got any transport yet ?
> =

> Just eat the bits or buffer everything, until it gets a transportport
> and sends out later ?

Why would it need the transport?

It's not like the data goes through an actual PCI bus, it is only used
for discovering and configuring the device, right?

Then if you do ad-hoc configuration of the device you do not need the
trasport at all.

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
