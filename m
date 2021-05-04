Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD91C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 10:59:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4983613BA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 10:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4983613BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7vfpl/bBbob8kINTbi/dY7u+Cvlr2J0ySrUZ9X7jlLI=; b=rM0q3BgQhE5o//G3+tfCNv1Wr
	x5PsRC2YtWk5YQwXdmb2BzN92iWpQMEVAypvu5BgMZWuf0nxK8/dClaDLiTkitWAGiARo/daAHpLc
	QTvtn9CIWzwi7jlC+LzBERrRdLyW+82WyZBkPre7+Kli1EpudYKrlmnBoU9ppyO1b5+ktoMty4M+t
	97iNgKYtbrQmfPZdRdl6PYFgN1Iadr6B3qoeU6s5DG2A2k+a6d6WxMJKPvaqJEvEOjgD7QWK/stVv
	khGr/gYhvUrURddOYmXNcazF8t10h4pbJ4KtjzvX/kFLj6ydL8hEgLtyBV2pSR1vi2sV5NFKuvvwD
	DO1WmPOHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldslk-00G1s6-0g; Tue, 04 May 2021 10:59:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldslh-00G1ry-Mi
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 10:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=r3B/fNK84CltMBPJVMASlwyz4bmYLgsBN7IeNMwteLY=; b=qFK7oW4brJJpCmMIoRFDX5eOAP
 QAonZwM8AQBSTbEIvgOX34noPd22Z9O10Iuh4xZt/IBKqfVIGJWjvIA+m0xp2oDmvQg7qWIguNbw1
 JLJrKx5cEoU0Ny4ezXw8Kq/bG3HPWESp7vnXmkhTAOZycb8SJ+fBU5BMhzhREkKY7ohrb2wQzC/wn
 wX4jJEchbH8qEk63i8XYyJ3Gxr4I4EA8QsQahpj3dubxcNuvcD5Lhw+bZi19RWvvPbh20n7qZoRO+
 Cq4rNFNeDrSAdSlBnCsxiPEzuN4WhSn8cVLt4VfI2pNQAwWl7Gd63yv1Elfz4aJKfHqlqHH4OkjwX
 +Kxg3lhQ==;
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsle-003uhI-EA
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 10:59:08 +0000
Received: by mail-qt1-x834.google.com with SMTP id o1so5932824qta.1
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r3B/fNK84CltMBPJVMASlwyz4bmYLgsBN7IeNMwteLY=;
 b=fYjOBRjkNxcEFYH/GZC2GUibotMx4lt0t8HlvtRV1msaEy7HFSquKGnQjm5nusthRn
 asH48V14SWbn9KKpIV7x79gyKtTtx5SV2TDrHeUht9ZNlL7fDB3jhCDMSpIyuJGgofvN
 XVGO6+ASgsfEvIW9UvfflNpPfhGX6mNfwxUhauKEopZJ4RsRCwjrz6Mux0toZgPaD1lA
 RZ5cMsWNiuGgX/WxCkNmv+ieg2nsRj4tymChF1frw8bEuI0/Wch04C4CFJlB5AUcDeb5
 yd65HZpxzvU5JwVqj9NXYkxJdUeF+dmwbfxEWRwpbExLEqBRM9XjIxOL9/CKzg3LL6ll
 j+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r3B/fNK84CltMBPJVMASlwyz4bmYLgsBN7IeNMwteLY=;
 b=GRTd+U1ILFFmJiIXWNIFZczs0pz0cg/13OoJ79cfEq6Rh89TFMLvd7swCA0g6crjsL
 7PWwmjukdQz1u2Lfxb0memVNe6yoyRxhLzIJcaT2VfNvPp7oQnovvmuyA3Xl/Boq/9Or
 b/5ddJVIqClOTvUTm6vBOeOrSqvy3Uut007JkgAEzI8JovEDzfkwQc+w773pboKNkoSh
 3uMWUEwAfQogQJIUJGKdRtIGJyVRSHVrW53BMB3tJqKcaAL35+Mdm9fgqVK0QdXtAi0Y
 4yB0mVPG95rTmNrI/qcUaNgroTKLXmpweSugY5234xhbDZRr8GidjdasH95sCzqWHmaj
 nB/w==
X-Gm-Message-State: AOAM533vJW8a3/6yYfQo+WqcUwx11SqgIMFThp3D9CgjPMXh5PDybXPW
 MfDUFotsV2nnX3var5MmGbC9cJWxvoNiDyWR80EioA==
X-Google-Smtp-Source: ABdhPJziNqv7NZ3RvX7OYxfEOn3d+D7csr2IH8GytFp9h9C3he0BUgktsCt8o1F76/bufM6qWmtrJwFoilBmBTj9qg4=
X-Received: by 2002:ac8:48d4:: with SMTP id l20mr21419522qtr.113.1620125941473; 
 Tue, 04 May 2021 03:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210406092634.50465-1-greentime.hu@sifive.com>
 <20210503164023.GA919777@bjorn-Precision-5520>
 <CAHCEeh+cMrEnHNG3W3ZNzdgT-m7BMorDawF6D8qkFYGg=RJMOw@mail.gmail.com>
 <20210504101201.GA20729@lpieralisi>
In-Reply-To: <20210504101201.GA20729@lpieralisi>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Tue, 4 May 2021 18:58:48 +0800
Message-ID: <CAHCEehJsUFxs71MuY5f4VbDT-NroCzJ=mnbbYYa4VwT-QWcQNw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com, 
 Erik Danie <erik.danie@sifive.com>, Zong Li <zong.li@sifive.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, alex.dewar90@gmail.com,
 khilman@baylibre.com, 
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_035906_505024_012BC581 
X-CRM114-Status: GOOD (  35.84  )
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

TG9yZW56byBQaWVyYWxpc2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+IOaWvCAyMDIx5bm0
NeaciDTml6Ug6YCx5LqMIOS4i+WNiDY6MTLlr6vpgZPvvJoKCj4KPiBPbiBUdWUsIE1heSAwNCwg
MjAyMSBhdCAwMzoyMDowMFBNICswODAwLCBHcmVlbnRpbWUgSHUgd3JvdGU6Cj4gPiBCam9ybiBI
ZWxnYWFzIDxoZWxnYWFzQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0NeaciDTml6Ug6YCx5LqMIOS4
iuWNiDEyOjQw5a+r6YGT77yaCj4gPiA+Cj4gPiA+IE9uIFR1ZSwgQXByIDA2LCAyMDIxIGF0IDA1
OjI2OjI4UE0gKzA4MDAsIEdyZWVudGltZSBIdSB3cm90ZToKPiA+ID4gPiBUaGlzIHBhdGNoc2V0
IGluY2x1ZGVzIFNpRml2ZSBGVTc0MCBQQ0llIGhvc3QgY29udHJvbGxlciBkcml2ZXIuIFdlIGFs
c28KPiA+ID4gPiBhZGQgcGNpZV9hdXggY2xvY2sgYW5kIHBjaWVfcG93ZXJfb25fcmVzZXQgY29u
dHJvbGxlciB0byBwcmNpIGRyaXZlciBmb3IKPiA+ID4gPiBQQ0llIGRyaXZlciB0byB1c2UgaXQu
Cj4gPiA+Cj4gPiA+IEkgZHJvcHBlZCB0aGlzIHNlcmllcyBiZWNhdXNlIG9mIHRoZSBidWlsZCBw
cm9ibGVtIEkgbWVudGlvbmVkIFsxXS4KPiA+ID4gSXQgd2lsbCBub3QgYmUgaW5jbHVkZWQgaW4g
djUuMTMgdW5sZXNzIHRoZSBidWlsZCBwcm9ibGVtIGlzIGZpeGVkCj4gPiA+IEFTQVAuCj4gPiA+
Cj4gPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEwNDI4MTk0NzEzLkdBMzE0
OTc1QGJqb3JuLVByZWNpc2lvbi01NTIwCj4gPiA+Cj4gPgo+ID4gSGkgYWxsLAo+ID4KPiA+IFRo
aXMgYnVpbGQgZmFpbGVkIGluIHg4Nl82NCBpcyBiZWNhdXNlIENPTkZJR19HUElPTElCIGlzIGRp
c2FibGVkIGluCj4gPiB0aGUgdGVzdGluZyBjb25maWcuCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcKPiA+IGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvS2NvbmZpZwo+ID4gaW5kZXggMGEzN2QyMWVkNjRlLi41NmI2NmUxZmVkNTMgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnCj4gPiArKysg
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnCj4gPiBAQCAtMzIzLDYgKzMyMyw3
IEBAIGNvbmZpZyBQQ0lFX0ZVNzQwCj4gPiAgICAgICAgIGRlcGVuZHMgb24gUENJX01TSV9JUlFf
RE9NQUlOCj4gPiAgICAgICAgIGRlcGVuZHMgb24gU09DX1NJRklWRSB8fCBDT01QSUxFX1RFU1QK
PiA+ICAgICAgICAgc2VsZWN0IFBDSUVfRFdfSE9TVAo+ID4gKyAgICAgICBzZWxlY3QgR1BJT0xJ
Qgo+Cj4gSSB0aGluayB0aGF0IGFuIGluY2x1ZGU6Cj4KPiAjaW5jbHVkZSA8bGludXgvZ3Bpby9j
b25zdW1lci5oPgo+Cj4gaW4gdGhlIGRyaXZlciB3b3VsZCBkby4gU3RpbGwsIEkgYmVsaWV2ZSB3
ZSBzaG91bGQgYWxzbyBhZGQgYQo+ICJkZXBlbmRzIG9uIiBpbiB0aGUgS2NvbmZpZyBlbnRyeSBy
YXRoZXIgdGhhbiBhICJzZWxlY3QiLgo+Cj4gUGxlYXNlIGxldCBtZSBrbm93IGFzIHNvb24gYXMg
cG9zc2libGUuCj4KCkhpIExvcmVuem8sCgpUaGFuayB5b3UgZm9yIHN1Z2dlc3RpbmcgdGhpcy4K
SSdsbCBhZGQgdGhlIGluY2x1ZGUgYW5kIHVzZSAiZGVwZW5kcyBvbiIgcmF0aGVyIHRoYW4gYSAi
c2VsZWN0IiBhbmQKc2VuZCB0aGUgdjYgcGF0Y2guCgo+IExvcmVuem8KPgo+ID4gICAgICAgICBo
ZWxwCj4gPiAgICAgICAgICAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCBQQ0llIGNvbnRyb2xsZXIg
c3VwcG9ydCBmb3IgdGhlIFNpRml2ZQo+ID4gICAgICAgICAgIEZVNzQwLgo+ID4KPiA+IEFmdGVy
IGFwcGx5aW5nIHRoaXMgY2hhbmdlLCBpdCBjYW4gYnVpbGQgcGFzcy4KPiA+Cj4gPiA+ID4gVGhp
cyBpcyB0ZXN0ZWQgd2l0aCBlMTAwMGU6IEludGVsKFIpIFBSTy8xMDAwIE5ldHdvcmsgQ2FyZCwg
QU1EIFJhZGVvbiBSNQo+ID4gPiA+IDIzMCBncmFwaGljcyBjYXJkIGFuZCBTUCBNLjIgUENJZSBH
ZW4gMyBTU0QgaW4gU2lGaXZlIFVubWF0Y2hlZCBiYXNlZCBvbgo+ID4gPiA+IHY1LjExIExpbnV4
IGtlcm5lbC4KPiA+ID4gPgo+ID4gPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiA+ID4gIC0gRml4IHR5
cG8gaW4gY29tbWVudHMKPiA+ID4gPiAgLSBLZWVwIGNvbW1lbnRzIHN0eWxlIGNvbnNpc3RlbnQK
PiA+ID4gPiAgLSBSZWZpbmUgc29tZSBlcnJvciBoYW5kbGluZyBjb2Rlcwo+ID4gPiA+ICAtIFJl
bW92ZSB1bm5lZWRlZCBoZWFkZXIgZmlsZSBpbmNsdWRpbmcKPiA+ID4gPiAgLSBNZXJnZSBmdTc0
MF9wY2llX2x0c3NtX2VuYWJsZSBpbXBsZW1lbnRhdGlvbiB0byBmdTc0MF9wY2llX3N0YXJ0X2xp
bmsKPiA+ID4gPgo+ID4gPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiA+ID4gIC0gRml4IFd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZSB3YXJuaW5nIGluIHByY2kgZHJpdmVyCj4gPiA+ID4KPiA+ID4gPiBD
aGFuZ2VzIGluIHYzOgo+ID4gPiA+ICAtIFJlbW92ZSBpdGVtcyB0aGF0IGhhcyBiZWVuIGRlZmlu
ZWQKPiA+ID4gPiAgLSBSZWZpbmUgZm9ybWF0IG9mIHNpZml2ZSxmdTc0MC1wY2llLnlhbWwKPiA+
ID4gPiAgLSBSZXBsYWNlIHBlcnN0bi1ncGlvcyB3aXRoIHRoZSBjb21tb24gb25lCj4gPiA+ID4g
IC0gQ2hhbmdlIERCSSBtYXBwaW5nIHNwYWNlIHRvIDJHQiBmcm9tIDRHQgo+ID4gPiA+ICAtIFJl
ZmluZSBkcml2ZXJzL3Jlc2V0L0tjb25maWcKPiA+ID4gPgo+ID4gPiA+IENoYW5nZXMgaW4gdjI6
Cj4gPiA+ID4gIC0gUmVmaW5lIGNvZGVzIGJhc2VkIG9uIHJldmlld2VycycgZmVlZGJhY2sKPiA+
ID4gPiAgLSBSZW1vdmUgZGVmaW5lIGFuZCB1c2UgdGhlIGNvbW1vbiBvbmUKPiA+ID4gPiAgLSBS
ZXBsYWNlIF9fcmF3X3dyaXRlbCB3aXRoIHdyaXRlbF9yZWxheGVkCj4gPiA+ID4gIC0gU3BsaXQg
ZnU3NDBfcGh5cmVncmVhZHdyaXRlIHRvIHdyaXRlIGZ1bmN0aW9uCj4gPiA+ID4gIC0gVXNlIHJl
YWRsX3BvbGxfdGltZW91dCBpbiBzdGVhZCBvZiB3aGlsZSBsb29wIGNoZWNraW5nCj4gPiA+ID4g
IC0gVXNlIGR3YyBjb21tb24gY29kZXMKPiA+ID4gPiAgLSBVc2UgZ3BpbyBkZXNjcmlwdG9ycyBh
bmQgdGhlIGdwaW9kXyogYXBpLgo+ID4gPiA+ICAtIFJlcGxhY2UgZGV2bV9pb3JlbWFwX3Jlc291
cmNlIHdpdGggZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZQo+ID4gPiA+ICAt
IFJlcGxhY2UgZGV2bV9yZXNldF9jb250cm9sX2dldCB3aXRoIGRldm1fcmVzZXRfY29udHJvbF9n
ZXRfZXhjbHVzaXZlCj4gPiA+ID4gIC0gQWRkIG1vcmUgY29tbWVudHMgZm9yIGRlbGF5IGFuZCBz
bGVlcAo+ID4gPiA+ICAtIFJlbW92ZSAicGh5ID8geCA6IHkiIGV4cHJlc3Npb25zCj4gPiA+ID4g
IC0gUmVmaW5lIGNvZGUgbG9naWMgdG8gcmVtb3ZlIHBvc3NpYmxlIGluZmluaXRlIGxvb3AKPiA+
ID4gPiAgLSBSZXBsYWNlIG1hZ2ljIG51bWJlciB3aXRoIG1lYW5pbmdmdWwgZGVmaW5lCj4gPiA+
ID4gIC0gUmVtb3ZlIGZ1NzQwX3BjaWVfcG1fb3BzCj4gPiA+ID4gIC0gVXNlIGJ1aWx0aW5fcGxh
dGZvcm1fZHJpdmVyCj4gPiA+ID4KPiA+ID4gPiBHcmVlbnRpbWUgSHUgKDUpOgo+ID4gPiA+ICAg
Y2xrOiBzaWZpdmU6IEFkZCBwY2llX2F1eCBjbG9jayBpbiBwcmNpIGRyaXZlciBmb3IgUENJZSBk
cml2ZXIKPiA+ID4gPiAgIGNsazogc2lmaXZlOiBVc2UgcmVzZXQtc2ltcGxlIGluIHByY2kgZHJp
dmVyIGZvciBQQ0llIGRyaXZlcgo+ID4gPiA+ICAgTUFJTlRBSU5FUlM6IEFkZCBtYWludGFpbmVy
cyBmb3IgU2lGaXZlIEZVNzQwIFBDSWUgZHJpdmVyCj4gPiA+ID4gICBkdC1iaW5kaW5nczogUENJ
OiBBZGQgU2lGaXZlIEZVNzQwIFBDSWUgaG9zdCBjb250cm9sbGVyCj4gPiA+ID4gICByaXNjdjog
ZHRzOiBBZGQgUENJZSBzdXBwb3J0IGZvciB0aGUgU2lGaXZlIEZVNzQwLUMwMDAgU29DCj4gPiA+
ID4KPiA+ID4gPiBQYXVsIFdhbG1zbGV5ICgxKToKPiA+ID4gPiAgIFBDSTogZnU3NDA6IEFkZCBT
aUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyCj4gPiA+ID4KPiA+ID4gPiAg
Li4uL2JpbmRpbmdzL3BjaS9zaWZpdmUsZnU3NDAtcGNpZS55YW1sICAgICAgIHwgMTEzICsrKysr
KysKPiA+ID4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA4ICsKPiA+ID4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5k
dHNpICAgIHwgIDMzICsrCj4gPiA+ID4gIGRyaXZlcnMvY2xrL3NpZml2ZS9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICB8ICAgMiArCj4gPiA+ID4gIGRyaXZlcnMvY2xrL3NpZml2ZS9mdTc0MC1w
cmNpLmMgICAgICAgICAgICAgICB8ICAxMSArCj4gPiA+ID4gIGRyaXZlcnMvY2xrL3NpZml2ZS9m
dTc0MC1wcmNpLmggICAgICAgICAgICAgICB8ICAgMiArLQo+ID4gPiA+ICBkcml2ZXJzL2Nsay9z
aWZpdmUvc2lmaXZlLXByY2kuYyAgICAgICAgICAgICAgfCAgNTQgKysrCj4gPiA+ID4gIGRyaXZl
cnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJjaS5oICAgICAgICAgICAgICB8ICAxMyArCj4gPiA+ID4g
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcgICAgICAgICAgICB8ICAgOSArCj4g
PiA+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL01ha2VmaWxlICAgICAgICAgICB8ICAg
MSArCj4gPiA+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYyAgICAg
ICB8IDMwOCArKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgZHJpdmVycy9yZXNldC9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gPiAgaW5jbHVkZS9kdC1iaW5k
aW5ncy9jbG9jay9zaWZpdmUtZnU3NDAtcHJjaS5oIHwgICAxICsKPiA+ID4gPiAgMTMgZmlsZXMg
Y2hhbmdlZCwgNTU1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvc2lmaXZl
LGZ1NzQwLXBjaWUueWFtbAo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jCj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+IDIu
MzAuMgo+ID4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
