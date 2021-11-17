Return-Path: <SRS0=ZoRk=QE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDE3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 11:26:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D48FE61B42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 11:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D48FE61B42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hjwv5MmhZTu58APvNO2lAHQrduNcTSUvdgyOcdI5n4=; b=tqJsF2kOyVAhlJ
	JInhJqt/Svg/tfUMqXsZH9CeJOesjibgi2vd5OPOZVPJphMYpp9I9aFtW6CsypwjbTWDvC9y2VDgZ
	7Seily5Fbe/BGYprjuoaqkaX3Rs37MKWVgbs/vXVVmbGzn30IZFJRo8XwDtrZVUlqxt/v41dSPst7
	do9v5uVdCk5EYr6Sfa85/HV/4KEdc6f9Pfk5Lzp6Wmlz34xIAMuiChJBurgTElfn7K7//7ferWsft
	QmPnXqFauwgM9v3dYAYSbEtICWTsNJBRTKHum7LvKNZc8Nlp7OmrXkAWosgesJDFtWu2Gj1csBQad
	vJI8vDV3a8SXiCBxqoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnJ4e-004aLE-3c; Wed, 17 Nov 2021 11:25:56 +0000
Received: from forward500o.mail.yandex.net ([2a02:6b8:0:1a2d::610])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnJ4a-004aGH-Bz
 for linux-riscv@lists.infradead.org; Wed, 17 Nov 2021 11:25:55 +0000
Received: from sas2-c390fc609500.qloud-c.yandex.net
 (sas2-c390fc609500.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:b7a3:0:640:c390:fc60])
 by forward500o.mail.yandex.net (Yandex) with ESMTP id 2A89F942247;
 Wed, 17 Nov 2021 14:25:43 +0300 (MSK)
Received: from sas2-e7f6fb703652.qloud-c.yandex.net
 (sas2-e7f6fb703652.qloud-c.yandex.net [2a02:6b8:c14:4fa6:0:640:e7f6:fb70])
 by sas2-c390fc609500.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 xInAjyEduW-PfC0a28r; Wed, 17 Nov 2021 14:25:43 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1637148343; bh=POxoiMZZw0JeWZ+RYJ6phO+AKvtO3iyR9pHij2i/wZc=;
 h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
 b=aNu1+WEObETBTo/K8xZJzx+aJwXmRfGCwoXRDPK+S+utoS1o+udUX/qC6s14a8Qc8
 NxuWji1SvjQvQLbtU/eAjTJJ7rmCezce9s/oa0sNh3PsZ1JPQFIpoZrE1S8DCqNq43
 Kqbgyw0lT/ca8Cj8wcXFXDSkXBYLWngDVNJc+1sk=
Authentication-Results: sas2-c390fc609500.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by sas2-e7f6fb703652.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 F7MoGHIEIq-PeTiFdRX; Wed, 17 Nov 2021 14:25:41 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Wed, 17 Nov 2021 14:25:39 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: =?ISO-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] RISC-V: Added HiFive Unmatched PMU events
Message-ID: <20211117142539.30fac060@redslave.neermore.group>
In-Reply-To: <20211116154812.17008-5-joao.mario@tecnico.ulisboa.pt>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-5-joao.mario@tecnico.ulisboa.pt>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_032552_993968_A09E4529 
X-CRM114-Status: UNSURE (   6.70  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxNiBOb3YgMjAyMSAxNTo0ODoxMiArMDAwMApKb8OjbyBNw6FyaW8gRG9taW5nb3Mg
PGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0PiB3cm90ZToKCkhlbGxvIE1hcmlvIQoKPiAr
ICB7Cj4gKyAgICAiRXZlbnROYW1lIjogIlVUTEJfTUlTUyIsCj4gKyAgICAiRXZlbnRDb2RlIjog
IjB4MDAwMjAwMiIsCj4gKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJVVExCIG1pc3MiCj4gKyAg
fQoKSSBkb24ndCBzZWUgc3VjaCB0aGluZyBpbiBGVTc0MCB2MXAzIG1hbnVhbCAtIGFtIGkgbWlz
c2luZyBzb21ldGhpbmcgPwoKWW91cnMsCk5pa2l0YSBTaHViaW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
