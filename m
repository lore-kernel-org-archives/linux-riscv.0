Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5207C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 07:13:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43F266137D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 07:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43F266137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bBjCf6JLa7B6K8NwDicFGHnEym7ysKxrz6xfMB3eds=; b=CeUVOo2erttD5h
	Lkps49IAvNF9cXkc49zCnvH7g1VhvDPQBj3hrUXqWPwkqn/9DJhNMksb9WlSnn45iHt357LNQSttc
	VRzCJWm/gB24hC27LnP5fnvLNqyx/rgQvhtN2gajHNImRVwmbFk5mfFvACOZP6QbqnUF2KkYepoc6
	zgNnY786PO5UGSdSyBghRsuo78vO/sCuYZvQr3Zgb6qCXu21y5MmYRzZnI3NkUdwEalqfo5/0SKAZ
	GYglOhQl76PVaj1nRZ0ryKR22jXGlVq9e05y+CKKvtxIpfIrBea0+7m89gPGbK85AbaCoSyaCqPTn
	qG/SFU7BEhz3rfQqhuBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjcMY-00E2yV-KJ; Sun, 07 Nov 2021 07:13:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjcMV-00E2xS-Kq
 for linux-riscv@lists.infradead.org; Sun, 07 Nov 2021 07:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636269186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDFK4DQn9aozfzSTpRLPEP7Y2pv1h7xDJpMzzU0xL2E=;
 b=TgQu85TFFcI1GYi145daH/C24VV6KH51tbJ4QSk824iIOVVM3z/FOFqhelYBShnnQgeIB2
 zzEkIEF4M5Mgwur5NeYfG/TkxkGHk8D1cKzbpnVwCpJb5yaas4sDiecXROJ6njB6NcpMvp
 X+x7PE1UPvUrLjphlckC5ppW9GrvyZI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-7MCVQAGKNfi2M6IQ8GEQzQ-1; Sun, 07 Nov 2021 02:13:04 -0500
X-MC-Unique: 7MCVQAGKNfi2M6IQ8GEQzQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w12-20020a056402268c00b003e2ab5a3370so12367840edd.0
 for <linux-riscv@lists.infradead.org>; Sun, 07 Nov 2021 00:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vDFK4DQn9aozfzSTpRLPEP7Y2pv1h7xDJpMzzU0xL2E=;
 b=Ou1DsUZ0ae999OZlNoO+gZ1BayIVAVBCeWvGUxba3JetdJMqtFrM1Zk09mKbpFL/uC
 geJ1e3DODHNqiJ1FpwabdaMEbmfTCuEOcLj1lyBd6nYQ1qIdAq7p0jxpB5zWGlLfblet
 Ba6MHm4+oDwPvBOTb+o/YG+SlpM6w/7DfDz8tVvRbecj+QO1EYSttAuH/b6yy5co7+6P
 MZOirbb8QVKeCr3oRFQ3rcTYYzLrauLFia2sxU74gGmKlN4cGZf1tj+GZ8Z1WAFO230c
 uHSLy9Z0Dpzm/2otfv+HeODmVAfU7FLui0DVxKsHgxQq3Jl/othRNRk/gIxXfV1yGUYf
 4W5A==
X-Gm-Message-State: AOAM533G2bLtD8qjKwgJjZCpyBbLwuftA+G3RSsYBU3bi1S4KLumWhgq
 phhK9LgvDPfTW4/bSfBIoUt7Oal+f8qSfaMMqiJL3Xd0mhPmcw1veEhctCGsM48lyStGKriO0z1
 KFktRWBL8+ImsJ/D59weWbZi8UiuOuLnb/d4O0t11X5br
X-Received: by 2002:a05:6402:50ce:: with SMTP id
 h14mr56552170edb.228.1636269182855; 
 Sun, 07 Nov 2021 00:13:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0RnDZMu6KOmWFnlJgGjwa6lcFRu6lQ1A/f5D/m43sCA5y6L7mOgJfGHJgDdZWFeczlvmbPOV4l6ovhsCleG0=
X-Received: by 2002:a05:6402:50ce:: with SMTP id
 h14mr56552126edb.228.1636269182667; 
 Sun, 07 Nov 2021 00:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <mhng-ac32ff92-86cb-4377-ba63-de1856e84fb1@palmerdabbelt-glaptop>
 <CAJF2gTT90V6gQw12XZEXB1TJXb5QNdXM6qcfXh1yzWzDPExgPQ@mail.gmail.com>
 <20211102055857.GB26925@lst.de>
 <CAJF2gTSfp+JZ4YxiynVA4KO0Z4PwJ4_uF8UO3Tx3mDOHPnFTeQ@mail.gmail.com>
In-Reply-To: <CAJF2gTSfp+JZ4YxiynVA4KO0Z4PwJ4_uF8UO3Tx3mDOHPnFTeQ@mail.gmail.com>
From: Wei Fu <wefu@redhat.com>
Date: Sun, 7 Nov 2021 15:12:51 +0800
Message-ID: <CA+YCwK=vMtKC0DrhSJ7apgZ4s4_8fzGoRxY2mKEjjyJZjNW2QQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 0/2] riscv: add RISC-V Svpbmt Standard Extension
 supports
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, liush <liush@allwinnertech.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_001307_804424_892F8562 
X-CRM114-Status: GOOD (  10.20  )
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

SEkgR3Vv77yMIENocmlzdG9waCwKClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLgoKT24gVHVl
LCBOb3YgMiwgMjAyMSBhdCA0OjUxIFBNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90
ZToKPgo+IFRoeCBDaHJpc3RvcGgsCj4KPiBPbiBUdWUsIE5vdiAyLCAyMDIxIGF0IDE6NTkgUE0g
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTm92
IDAyLCAyMDIxIGF0IDEwOjA3OjU4QU0gKzA4MDAsIEd1byBSZW4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IFRvIHNlcGFyYXRlIE1NVSAmIG5vLU1NVSBjbGVhcmx5LCBJIHN1Z2dlc3QgZnV3ZWkgYWRkCj4g
PiA+ICNpZiBkZWZpbmVkKENPTkZJR182NEJJVCkgJiYgZGVmaW5lZChDT05GSUdfTU1VKQo+ID4K
PiA+IEFjdHVhbGx5IC0gZm9yIGRvY3VtZW50YXRpb24gcHVycG9zZXMgYSBuZXcgQ09ORklHX1JJ
U0NWX1NWUEJNVCB0aGF0Cj4gPiBkZXBlbmRzIG9uIDY0QklUICYmIE1NVSB3b3VsZCBwcm9iYWJs
eSBtdWNoIGJldHRlciBhcyBpdCBjbGVhcmx5Cj4gPiBkb2N1bWVudHMgdGhlIGludGVudCBoZXJl
Lgo+IE9rYXkKCkhvdyBhYm91dAoKY29uZmlnIFJJU0NWX1NWUEJNVApib29sCmRlcGVuZHMgb24g
NjRCSVQgJiYgTU1VCmRlZmF1bHQgeQoKCj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBS
ZW4KPgo+IE1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5Lwo+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
