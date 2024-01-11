Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E36C4725D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 00:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kX3ltOWbtftwtwKGfv2AfStj6X6EQhv+W3HrE6DEk0=; b=n1AlSWj0OrqC7s
	GzDGFZgn/SlN1O1v2nxLZfM7r6Kamej1mrQZx2NGT4k0D4tITsrytqeVKrFB10xnRE0J1ggceSHr/
	IL3/M/ECW4jLu0VbdDLaIuWsoZEta6ZkOFTfcPZEZoqD7+xhEvgfU6itwj1qGfoiupodo0ChHUx/C
	X7IAlbyCfQSCHG4qNHKqRObuDSBOgjdFbk2ay0igxg5CMaUheHj15EIlP9tr7ijWp+ZbpQosfnfis
	30rp88qN0IoAuoFWnHJkfIgXxZ4AdYIBEckP3iBc7S1pMhBBxKh2tnZ0OIJe4RWjKoiZnf6qr0d2w
	Quu7OECtBRHNNSdxD0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNiUj-00EofF-2a;
	Thu, 11 Jan 2024 00:00:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNiUg-00Eodu-2I;
	Thu, 11 Jan 2024 00:00:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 597C8CE1DBE;
	Thu, 11 Jan 2024 00:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222B1C433C7;
	Thu, 11 Jan 2024 00:00:13 +0000 (UTC)
Message-ID: <7e348eb3-bd34-4c66-9ed6-b5108da80486@linux-m68k.org>
Date: Thu, 11 Jan 2024 10:00:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Automated-testing] Call for nommu LTP maintainer [was: Re:
 [PATCH 00/36] Remove UCLINUX from LTP]
Content-Language: en-US
To: Niklas Cassel <Niklas.Cassel@wdc.com>, Rob Landley <rob@landley.net>
Cc: Petr Vorel <pvorel@suse.cz>, Tim Bird <tim.bird@sony.com>,
 Cyril Hrubis <chrubis@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>, Li Wang <liwang@redhat.com>,
 Andrea Cervesato <andrea.cervesato@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "automated-testing@lists.yoctoproject.org"
 <automated-testing@lists.yoctoproject.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik>
 <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik> <ZZvJXTshFUYSaMVH@yuki>
 <SA3PR13MB6372498CC6372F8B16237244FD6A2@SA3PR13MB6372.namprd13.prod.outlook.com>
 <20240110141455.GC1698252@pevik>
 <40996ea1-3417-1c2f-ddd2-e6ed45cb6f4b@landley.net>
 <ZZ8JbCPd3rq4u7iG@x1-carbon>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <ZZ8JbCPd3rq4u7iG@x1-carbon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_160022_944904_F5315B29 
X-CRM114-Status: UNSURE (   6.72  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 11/1/24 07:17, Niklas Cassel wrote:
> On Wed, Jan 10, 2024 at 01:23:51PM -0600, Rob Landley wrote:
>> UCLINUX is a long-dead distro. Linaro died in the dot-com crash and its founder
>> Jeff Dionne moved to Japan for his next gig and never came back. On the way out
>> he handed uclinux off to someone else, who didn't do a lot of work maintaining
>> it. Most of the actual support went "upstream" into various packages (linux and
>> busybox and gcc and so on) before the handoff, so you didn't NEED uclinux anymore.
> 
> s/Linaro/Lineo/

Lineo was not founded by Jeff Dionne, see https://en.wikipedia.org/wiki/Lineo
for its genisys. Maybe you are thinking of RT-Control.

Greg

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
