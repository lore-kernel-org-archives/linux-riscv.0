Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5083AC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:28:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB1DD207C8
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB1DD207C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T+frbwz9hrBXnZZ1MdHlvDIjIskLGcgHqIGUtRgFZ98=; b=KbtvSnsoS07PKn4hT1vqqiC/A
	d5of5xpbDKSPaB0MhaEz9N8VENq60ucBtZmRRZdU3UzERsOtxdGwjATeV6hCcQv/DAuWI2BeFMPem
	+rino4Tbu3pB4FNHjXn05a9o0tJ2MhEO1O5fppp/tIJ8g8FosD9pNxJY9xZ4NuFDgHuOe4xpO/dUv
	mqblIzwmo9OIHiagXeOTSYDiDSpBukTnQgPYWoOlF+2tawjCRSPGvcRacoH3fiYdZ3ROxsz7OoJ35
	x6Mkxp75Q2MGEgnTG99n9wWrdOJYhR51bZJGOzj6hhK+ctPI3ZLBJ3QGHaZDmiI8TC77h8C+yv3OV
	U8RXt6BXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl6SK-0006uC-Cd; Fri, 04 Dec 2020 08:28:44 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl6SH-0006tW-Bm
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 08:28:42 +0000
Received: from [192.168.1.155] ([95.114.158.118]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1McY0J-1kAPBb3rJt-00cyWv; Fri, 04 Dec 2020 09:28:31 +0100
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To: Michael Walle <michael@walle.cc>,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>
References: <20201127183003.2849-1-info@metux.net>
 <CAMpxmJXJLTzM20xLCoM4spjibXbA-FfdPmOBp1QcV+9cScNNMw@mail.gmail.com>
 <f14c0197-b346-7af5-9dd0-9b8018baaeaf@metux.net>
 <b287f185d554b5a87b82ea8ca79cb5a2@walle.cc>
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <8ab347b9-8b1a-f49f-d194-f98284fa6099@metux.net>
Date: Fri, 4 Dec 2020 09:28:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b287f185d554b5a87b82ea8ca79cb5a2@walle.cc>
Content-Language: tl
X-Provags-ID: V03:K1:dUT0JUegZ42giGfrKmvHoKDvhv2oHRjR2063rWeXiFKSlSKKSyF
 WV3WiUrtvsZF8oudGAy6r09BIw/6WCr/bvdKoDhqqeFsgRNMxZiIcr/bEbVJVAbNONrMlLL
 ZKyfCItATcn+5Cjf9IiwAlWeioaYBVHkZbBmOtEJMapTGLJGku2ayhdFc+ZdiwURrgBL1zQ
 eYyGWJ48hhAM00fOJggdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wJpMIBpJjRM=:Zv5F/JE0GNEQiLQcvQT3Kk
 pvvBPGjOoKfmD6WIu2hZZcnJuc4GTp8QcZIOCWowwKSVSAYayPuVlHPEQBSd5V6Q1xlMbogB1
 ZWbgeu2rVH0pueqyXhtJgRoLMTBBdPGQ8mirjUMQ7NR1LUc9HrN2CWbR/51Ggqh4j9F9o0MuA
 3acqKkusqAK1L0lguerq37BmBS7ugEVE4jJurmX+A4lhZ1+NNIpRcIr5sxHXQCmT/8aq/F1rJ
 KdlTugkX5k5yx9l+2MusPfQefa6xGnZpi5GRsi/CvyJh6aZDDuk3csd7iDLX6/IF/qYkGx6g1
 NFg6+7jGf9gJ+bSkiuomIcRIsWd9YFvB9RV/YO+OhY1uhUajnKCIsiRRG+YX2Unkn98FNq044
 wVDPk/nv94eA/WxauJpokuglPDiEl86izI+N7eEyp5db3b9Ziib556pDZqpfk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_032841_763746_90F00110 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-gpio <linux-gpio@vger.kernel.org>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-riscv@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDMuMTIuMjAgMjM6MzUsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gQW0gMjAyMC0xMi0wMyAy
MDowMCwgc2NocmllYiBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdDoKPj4gT24gMDIu
MTIuMjAgMTU6MTUsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnVmd2FsayA9IG5hbWVfYnVmZmVyOwo+Pj4+ICsKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3aGlsZSAoaWR4IDwgcHJpdi0+bnVtX2dwaW9zICYm
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBidWZ3YWxr
IDwgKG5hbWVfYnVmZmVyK2NmLm5hbWVzX3NpemUpKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW9fbmFtZXNbaWR4XSA9IChzdHJsZW4oYnVm
d2FsaykgPyBidWZ3YWxrCj4+Pj4gOiBOVUxMKTsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVmd2FsayArPSBzdHJsZW4oYnVmd2FsaykrMTsKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWR4Kys7Cj4+
Pgo+Pj4KPj4+IFNvbWV0aGluZydzIHdyb25nIHdpdGggaW5kZW50YXRpb24gaGVyZS4KPj4KPj4g
aSBkb250IHRoaW5rIHNvOiB0aGUgImJ1ZndhbGsgLi4uIiBsaW5lIGJlbG9uZ3MgdG8gdGhlIHdo
aWxlIGV4cHJlc3Npb24KPj4gYW5kIGlzIHJpZ2h0IHVuZGVyIHRoZSAiaWR4IiwgYXMgaXQgc2hv
dWxkIGJlLiBJIGRpZG4ndCB3YW50IHRvIGJyZWFrIHVwCj4+IGF0IHRoZSAiPCIgb3BlcmF0b3Iu
IHNoYWxsIGkgZG8gdGhpcyBpbnN0ZWFkID8KPiAKPiBPciBkb24ndCBicmVhayB0aGUgbGluZXMg
YXQgYWxsLiBCb3RoIGxpbmVzIGRvbid0IGFkZCB1cCB0byBtb3JlIHRoYW4KPiAxMDAgY2hhcnMs
Cj4gcmlnaHQ/CgpJSVJDIGNoZWNrcGF0Y2ggY29tcGxhaW5zIGF0IDgwIGNoYXJzLiBIYXMgdGhh
dCBiZWVuIGNoYW5nZWQgPwoKCi0tbXR4CgoKLS0gCi0tLQpIaW53ZWlzOiB1bnZlcnNjaGzDvHNz
ZWx0ZSBFLU1haWxzIGvDtm5uZW4gbGVpY2h0IGFiZ2Vow7ZydCB1bmQgbWFuaXB1bGllcnQKd2Vy
ZGVuICEgRsO8ciBlaW5lIHZlcnRyYXVsaWNoZSBLb21tdW5pa2F0aW9uIHNlbmRlbiBTaWUgYml0
dGUgaWhyZW4KR1BHL1BHUC1TY2hsw7xzc2VsIHp1LgotLS0KRW5yaWNvIFdlaWdlbHQsIG1ldHV4
IElUIGNvbnN1bHQKRnJlZSBzb2Z0d2FyZSBhbmQgTGludXggZW1iZWRkZWQgZW5naW5lZXJpbmcK
aW5mb0BtZXR1eC5uZXQgLS0gKzQ5LTE1MS0yNzU2NTI4NwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
