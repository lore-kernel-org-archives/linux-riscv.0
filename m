Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5459DC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 13:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ekc9Ga+PCFvKPm/EsSzIp8zEwDcS873V1Rjyu3g5eMI=; b=Z8cu1RU6Po3388
	/MAQjys2wvO5yfgvrVLajMFEVenx0mqlnozK9ZhXFJZv9ZnEzo/c7vTqR8RoLkaSX6wkOXR7U2Cql
	xkTHvwPC3mPDnUNxCai+U4VYP7QEDG3K1v+uQbLZsOmZsqev1QSUghJa6244WkImzpcEoXq0qioAT
	AB5gupY6oScvG4b+AN21eRr1vKTCXRCH7m272yuy/SrerzGMFx//W6DmkNrNj6wC63rMrA1bMHSAG
	dEi2t+i86+f2/ChjqWxsYQdxOrzaMa5k0g+UlQml8Q85I2uuz5tbkx9ThYCUIdSdD+YQiSa3sl6MH
	JkceIq6l9NuOltHZDVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNaFn-00Gt8y-CW; Mon, 15 Aug 2022 13:35:39 +0000
Received: from forward501j.mail.yandex.net ([2a02:6b8:0:801:2::111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNa8W-00GnhN-1T
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 13:28:10 +0000
Received: from myt5-aad1beefab42.qloud-c.yandex.net (myt5-aad1beefab42.qloud-c.yandex.net [IPv6:2a02:6b8:c12:128:0:640:aad1:beef])
	by forward501j.mail.yandex.net (Yandex) with ESMTP id 006D362346E;
	Mon, 15 Aug 2022 16:28:01 +0300 (MSK)
Received: by myt5-aad1beefab42.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 9t3MXX2NvM-Rvh0ex7m;
	Mon, 15 Aug 2022 16:27:59 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1660570079;
	bh=fFBDJAUv3+NYO8fK5MxMGSwQlgTg0VDUZqjNCrIr6ys=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=IN6CJREbPLjNBkjiFwjZoXSjd4UP14C+tOE/8YsUQCk3zhIaURa3TA9NYrdTBpEOg
	 gZdwGexiNBR7dfM+7SBwOfo1odTTSmKJmdNzD7mdZrwwFGJuDmfHOHv87lXbo1m5Yq
	 Ur5TVsYHrOSpb+sEVwP+brF/X4TXku2JNknIAyH4=
Authentication-Results: myt5-aad1beefab42.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Date: Mon, 15 Aug 2022 16:27:55 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, linux@yadro.com, Genevieve
 Chan <genevieve.chan@starfivetech.com>, =?UTF-8?B?Sm/Do28gTcOhcmlv?=
 Domingos <joao.mario@tecnico.ulisboa.pt>, Nikita Shubin
 <n.shubin@yadro.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, Kautuk
 Consul <kconsul@ventanamicro.com>
Subject: Re: [PATCH v5] perf arch events: riscv sbi firmware std event files
Message-ID: <20220815162755.7ed970c6@redslave.neermore.group>
In-Reply-To: <Yvas60duFUkSzuz+@kernel.org>
References: <20220628114625.166665-1-nikita.shubin@maquefel.me>
	<20220628114625.166665-4-nikita.shubin@maquefel.me>
	<18c8e9c74955c08fdbd631a35c51b30f3cff3cd3.camel@ventanamicro.com>
	<20220811112303.4e5f0566@redslave.neermore.group>
	<Yvas60duFUkSzuz+@kernel.org>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_062808_702292_9463629A 
X-CRM114-Status: GOOD (  10.24  )
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

Hello Arnaldo!

> If I get this today it may even get into v6.0. :-)
> 
> Thanks,
> 
> - Arnaldo

Well... i missed it :), on the other hand this series depends on 
https://lkml.org/lkml/2022/7/27/23 
which hasn't been merged yet.

Just have sent a v6 series.

Thank you for review!

Yours, 
Nikita Shubin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
