Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3A0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 19:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A4C20643
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 19:44:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oJNhfYy/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4A4C20643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eik.bme.hu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ITGkSVWu8/cYzgZ+Yq1kuESbTJFuZ72Wb8AmfApl/7o=; b=oJNhfYy/ETVVuxrm4oXrH2jG2
	6W0FCBxaf+wjmye3ILDvcVsR5hswXX4SzYVv7uz/+T/EpKq6T87GyVztidmZSL3R4IUO3SmQGdrbQ
	IEx3uoPVEUJLBjBbydKGNyJebgcQF5BFNoRx2DM/F4B0EYGoJf5RBkTlArf/xb98ed/TP2iu/yvQW
	RS+Z5ZkY3Duc4k4WrGlUJuXqmpTaadzxo3qWkkh7ilOrOFQBNzNOEHe9y1+eCsJurVJO0BdLNvAhH
	TlEBn579OmrUKDoTWBysbylAT7aY8eD3NtVAjoK+jjeEeWKRzb0YaxgCIFPla0blTqiKL8RYuRW1/
	xy7Q8FgDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3QqJ-00073V-8c; Mon, 11 Mar 2019 19:44:11 +0000
Received: from zero.eik.bme.hu ([152.66.115.2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3Qpw-0006WM-3Z; Mon, 11 Mar 2019 19:43:52 +0000
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 94CB27456B3;
 Mon, 11 Mar 2019 20:33:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 73F847456B2; Mon, 11 Mar 2019 20:33:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 734E17456A0;
 Mon, 11 Mar 2019 20:33:39 +0100 (CET)
Date: Mon, 11 Mar 2019 20:33:39 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Pintu Agarwal <pintu.ping@gmail.com>
Subject: Re: [Qemu-devel] ssh session with qemu-arm using busybox
In-Reply-To: <CAOuPNLgobR4ejPs_ZUuXpRwkURH0sfb1LD27TKhGg=wrwhUvZg@mail.gmail.com>
Message-ID: <alpine.BSF.2.21.9999.1903112027050.69539@zero.eik.bme.hu>
References: <CAOuPNLgobR4ejPs_ZUuXpRwkURH0sfb1LD27TKhGg=wrwhUvZg@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_124348_723651_8F68176A 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kernelnewbies@kernelnewbies.org, qemu-devel@nongnu.org,
 open list <linux-kernel@vger.kernel.org>,
 =?EUC-KR?B?wPzB+L+1?= <jy0.jeon@gmail.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 11 Mar 2019, Pintu Agarwal wrote:
> I am sure, many of you people would have explored already "how to use
> ssh over qemu" and found a easy method.
> So, if anybody have easy setup please share with me.
>
> I could see that after adding "ip=dhcp" I get the eth0 interface like this:
> / # ifconfig
> eth0      Link encap:Ethernet  HWaddr 52:54:00:12:34:56
>          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
>          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>          RX packets:2 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:2 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:1000
>          RX bytes:1180 (1.1 KiB)  TX bytes:1180 (1.1 KiB)
>          Interrupt:22
>
> lo        Link encap:Local Loopback
>          inet addr:127.0.0.1  Mask:255.0.0.0
>          UP LOOPBACK RUNNING  MTU:65536  Metric:1
>          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:1000
>          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>
> But I could not ping it from ubuntu PC.

This should already be documented here:
https://wiki.qemu.org/Documentation/Networking

The default QEMU network is -net user slirp based networking that provides 
outbound connectivity from the virtual machine but no ping or inbound 
connections. I.e. you can ssh from your guest to your host (so you could 
use scp in your guest to copy files from your host) or use some other 
networking (such as tap) that allows the host to connect to guest (but 
then you'll need to arrange routing and dhcp if you want that on your 
host otherwise your guest will only see your host). Hope this helps.

Regards,
BALATON Zoltan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
