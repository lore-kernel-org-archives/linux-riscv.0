Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F45C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 05:26:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3848960555
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 05:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3848960555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEepPBLKHLY9W6RSXuGiO0u8A3JGTWAjcYxfTdUqoJw=; b=aSQ1otwQUM9mnt
	TrauWnnqPlRa3K7RhA4mDC1oavoNrrz0g1TEpi6lvuAd6TQiA8R9LFz45LXqY7wQ8DZHDlBbn2JuF
	O6sYDLgixXUpipjTQYP03/I10GAAXfgM9gBVk3jHiTjvae7KbrfmMmEuNXanec9ISGNzb5reJxYD9
	eMtajdmu/fsrtKWnC9HadQPCLRkFcnJpO86lWDZTcLMRpbIUVoQtKgd+L0HVE18K5hI4MS+dlT41n
	r4siSMRUTqgEl7PSOJImUE4h+je4uVfeTT+QVXhDXeqcfKwVnV4oPC4LKvzvPp4tw9kqU2vwQx8c6
	0Asegqp72P2VuNkbCiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSule-006yU2-7w; Wed, 22 Sep 2021 05:26:02 +0000
Received: from forward106j.mail.yandex.net ([2a02:6b8:0:801:2::109])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSulX-006yTF-OA
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 05:26:00 +0000
Received: from myt6-43c1316fdabf.qloud-c.yandex.net
 (myt6-43c1316fdabf.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:370d:0:640:43c1:316f])
 by forward106j.mail.yandex.net (Yandex) with ESMTP id 7BDD5136A87F;
 Wed, 22 Sep 2021 08:25:48 +0300 (MSK)
Received: from myt5-cceafa914410.qloud-c.yandex.net
 (myt5-cceafa914410.qloud-c.yandex.net [2a02:6b8:c12:3b23:0:640:ccea:fa91])
 by myt6-43c1316fdabf.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 aeAFcq1fO2-PlD8hGMN; Wed, 22 Sep 2021 08:25:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1632288348; bh=T51rUNPVohQf+3lV1GDaVcNQ8Jynk/Br7M1fk9sxHeQ=;
 h=Message-ID:Subject:To:From:In-Reply-To:Cc:References:Date;
 b=kVVNjrWLABjth60iiq6/rI7wNDsrf8wtQE3jiJFWN9IFfl9wKMwY/ObWvd9xSbBI7
 T0XiwT2WbKtYQXJBIIYi1w6iPJc2QTdnd9q/IdsspgQlv2oHDAdEDHPPIL2S5QcEuh
 YAGM5Guw/vkXQCG9YolVo+ZNkJsCJ+Mwub7Rf47M=
Authentication-Results: myt6-43c1316fdabf.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by myt5-cceafa914410.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id Me1tdhdSba-Pkxqs8sr; Wed, 22 Sep 2021 08:25:46 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 22 Sep 2021 08:25:43 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atish.patra@wdc.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Anup Patel
 <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, "Darrick J. Wong"
 <djwong@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Jiri Olsa <jolsa@redhat.com>, John Garry
 <john.garry@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Nick
 Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [v3 01/10] RISC-V: Remove the current perf implementation
Message-ID: <20210922082543.71fc5619@redslave.neermore.group>
In-Reply-To: <238571632287002@mail.yandex.ru>
References: <20210910192757.2309100-1-atish.patra@wdc.com>
 <20210910192757.2309100-2-atish.patra@wdc.com>
 <238571632287002@mail.yandex.ru>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_222556_008263_DD0C4CBA 
X-CRM114-Status: GOOD (  15.16  )
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

T24gV2VkLCAyMiBTZXAgMjAyMSAwODoxMTo0NCArMDMwMApuaWtpdGEuc2h1YmluQG1hcXVlZmVs
Lm1lIHdyb3RlOgoKPiBIZWxsbyBBdGlzaC4KPiDCoAo+IDEwLjA5LjIwMjEsIDIyOjI4LCAiQXRp
c2ggUGF0cmEiIDxhdGlzaC5wYXRyYUB3ZGMuY29tPjoKPiAKPiA+IFRoZSBjdXJyZW50IHBlcmYg
aW1wbGVtZW50YXRpb24gaW4gUklTQy1WIGlzIG5vdCB2ZXJ5IHVzZWZ1bCBhcyBpdAo+ID4gY2Fu
IG5vdCBjb3VudCBhbnkgZXZlbnRzIG90aGVyIHRoYW4gY3ljbGUvaW5zdHJ1Y3Rpb25zLiBNb3Jl
b3ZlciwKPiA+IHBlcmYgcmVjb3JkIGNhbiBub3QgYmUgdXNlZCBvciB0aGUgZXZlbnRzIGNhbiBu
b3QgYmUgc3RhcnRlZCBvcgo+ID4gc3RvcHBlZC4KPiA+IAo+ID4gUmVtb3ZlIHRoZSBpbXBsZW1l
bnRhdGlvbiBub3cgZm9yIGEgYmV0dGVyIHBsYXRmb3JtIGRyaXZlciBpbiBmdXR1cmUKPiA+IHRo
YXQgd2lsbCBpbXBsZW1lbnQgbW9zdCBvZiB0aGUgbWlzc2luZyBmdW5jdGlvbmFsaXR5Lgo+IFlv
dXIgdjMgdmVyc2lvbiBzdGlsbCBicmVha3MgdGhlIGJ1aWxkIHdpdGggQ09ORklHX0JQRl9TWVND
QUxMCj4gZW5hYmxlZDogCj4ga2VybmVsL2V2ZW50cy9jb3JlLmM6IEluIGZ1bmN0aW9uICdicGZf
b3ZlcmZsb3dfaGFuZGxlcic6Cj4ga2VybmVsL2V2ZW50cy9jb3JlLmM6OTkxNDoxODogZXJyb3I6
IGFzc2lnbm1lbnQgdG8KPiAnYnBmX3VzZXJfcHRfcmVnc190IConIHtha2EgJ3N0cnVjdCB1c2Vy
X3JlZ3Nfc3RydWN0IConfSBmcm9tCj4gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSAnc3RydWN0
IHB0X3JlZ3MgKicKPiBbLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10gOTkxNCB8
IMKgwqDCoMKgwqDCoMKgwqBjdHgucmVncyA9Cj4gcGVyZl9hcmNoX2JwZl91c2VyX3B0X3JlZ3Mo
cmVncyk7IHwgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF4gCgpTb3JyeSBmb3Ig
dGhlIG5vaXNlLgoKRXZlcnl0aGluZyBjb21wbGllcyBmaW5lIC0gaSBtaXN0YWtlbiBhbmQgYXBw
bGllZCBvbGRlciB2ZXJzaW9uIGFnYWluLiAKCj4gWW91cnMsCj4gTmlraXRhIFNodWJpbi4KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
