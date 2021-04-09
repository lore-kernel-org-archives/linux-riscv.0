Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A65C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 02:24:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7BC9610C7
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 02:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7BC9610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+V5xqUEU2CQLnmD8BU48uiY3nNg7PL7gg912KHdYEZQ=; b=Ov/TL03G4MvsE65N/lniLdlo6
	eVodVSrvRDeizU9qMpQMWa4ysvt7ZRyxDpyMkG7OMnIIxzHIQY/uEaEFHUYINeVY02x7fRHr3aRmT
	5VcPVQnmmwWAApQ4j/LYjEC541R67BKSUe7sBP8Uq+Sw9rDr2nUqTodHF58cBcBQ+jLnbq8BCxHM3
	+wXO+cF2Vg2MYkfCzYSfxGk4AF19LPXpeJioo4KiaIuu9WjJLIBR1i0G+jtTqPxSihlWC/dZ7ij75
	2RTMLBWGlWPF6o+iYqcWvX803Vf0xU31XbEWzJPPTgSqjeB3qkddF6kXkW6egoKqSzmTAZPMvoWBQ
	k0y220DFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUgoC-009i77-D8; Fri, 09 Apr 2021 02:23:44 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUgo6-009i61-NI
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 02:23:40 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id es6so1976056qvb.0
 for <linux-riscv@lists.infradead.org>; Thu, 08 Apr 2021 19:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dr8o5YF5yqQzC2Z1k+2QkLomm0GkPLRu2hgFbkn12/A=;
 b=Ly6yeXcWyzUsF37vzaewuSXMHg8oxjVmIMpbnu20lmjf2vDNQwHhcJZLJIRDtMamKE
 K5fqcZc3UR7MK8guEJoUxEN9fadEzvmO9H0JI8yTk84XkDtJa1wFiXpzUhpDYeSC7pWG
 IGdQADOzMvd4hpC4Vbkauk7WodpWYq8eT35sLO68e1F1yv1/iQMjayD7vTvSa4cvS46W
 zbd3tYCqDJk8QD7A2TCLlL1YKuLXSDp+KL83bqmsgMlpys3Yg+GzEwtVA2voaozzvJxO
 luDpwa7GFR8AT+1Ojm/+exEFo+cV6z7jBOPvz/3DjHBm8n9reY1bscWa/dQqyBj60mvw
 hlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dr8o5YF5yqQzC2Z1k+2QkLomm0GkPLRu2hgFbkn12/A=;
 b=OU3a3uHrnSi6QRrlym+vAmiFbAhncz0uZzttPGFTUKQ00Rin+ci8myqz+BILQV8U5e
 0xOIsAE0ri3pBFjODBs4uKfckF5NCFFUR7UcqipLlfm3pbzIPdoLCtJP/HfsTnhO2gW3
 1Xi/WrQbp9Gcfr64QZ9ISxsPzaa1OZXq7JRhFOi4DTvAPBZGi9aLlioHRw6xXs+/nm0T
 DrjsCVZ9Kbjq50JG2sEpdNUhGf/zRQMee1Z+ER9Czx+jCBT8mWFDEZszVzVwc78jI6uA
 DemBHCCBrfXXThwXcNGWylijzAlE2LD0MxsuyOyfTbAaeoO1/VPAfzjIHSpjb+ubLfUS
 fLfw==
X-Gm-Message-State: AOAM531ojfPH4ubOIXxDsGcIoCHSPLETCCPgB64F1E5ZoT7Br0uWfmvK
 Bb0O0LSDxA8V7dCTOYgRt8oOXKyvygySyFoMVsxYhg==
X-Google-Smtp-Source: ABdhPJxtimebsZ9qggqFtKnwApCerfHESWaJIl88HJu0Xf60B4QCcRWMzJJOSmFJIJ+fQt4BpDrO7Q3hF36KGFG+LhI=
X-Received: by 2002:a05:6214:f0d:: with SMTP id
 gw13mr11984953qvb.33.1617935012958; 
 Thu, 08 Apr 2021 19:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210406092634.50465-1-greentime.hu@sifive.com>
 <20210408162539.GA32036@lpieralisi>
In-Reply-To: <20210408162539.GA32036@lpieralisi>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Fri, 9 Apr 2021 10:23:21 +0800
Message-ID: <CAHCEehK5vf5V_6McexFQPbcxGeC2SEb_3SXiGc2ASkcELe3fXg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com, 
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
 linux-clk@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_032338_991268_C83194E0 
X-CRM114-Status: GOOD (  21.73  )
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
NOaciDnml6Ug6YCx5LqUIOS4iuWNiDEyOjI15a+r6YGT77yaCj4KPiBPbiBUdWUsIEFwciAwNiwg
MjAyMSBhdCAwNToyNjoyOFBNICswODAwLCBHcmVlbnRpbWUgSHUgd3JvdGU6Cj4gPiBUaGlzIHBh
dGNoc2V0IGluY2x1ZGVzIFNpRml2ZSBGVTc0MCBQQ0llIGhvc3QgY29udHJvbGxlciBkcml2ZXIu
IFdlIGFsc28KPiA+IGFkZCBwY2llX2F1eCBjbG9jayBhbmQgcGNpZV9wb3dlcl9vbl9yZXNldCBj
b250cm9sbGVyIHRvIHByY2kgZHJpdmVyIGZvcgo+ID4gUENJZSBkcml2ZXIgdG8gdXNlIGl0Lgo+
ID4KPiA+IFRoaXMgaXMgdGVzdGVkIHdpdGggZTEwMDBlOiBJbnRlbChSKSBQUk8vMTAwMCBOZXR3
b3JrIENhcmQsIEFNRCBSYWRlb24gUjUKPiA+IDIzMCBncmFwaGljcyBjYXJkIGFuZCBTUCBNLjIg
UENJZSBHZW4gMyBTU0QgaW4gU2lGaXZlIFVubWF0Y2hlZCBiYXNlZCBvbgo+ID4gdjUuMTEgTGlu
dXgga2VybmVsLgo+ID4KPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiAgLSBGaXggdHlwbyBpbiBjb21t
ZW50cwo+ID4gIC0gS2VlcCBjb21tZW50cyBzdHlsZSBjb25zaXN0ZW50Cj4gPiAgLSBSZWZpbmUg
c29tZSBlcnJvciBoYW5kbGluZyBjb2Rlcwo+ID4gIC0gUmVtb3ZlIHVubmVlZGVkIGhlYWRlciBm
aWxlIGluY2x1ZGluZwo+ID4gIC0gTWVyZ2UgZnU3NDBfcGNpZV9sdHNzbV9lbmFibGUgaW1wbGVt
ZW50YXRpb24gdG8gZnU3NDBfcGNpZV9zdGFydF9saW5rCj4gPgo+ID4gQ2hhbmdlcyBpbiB2NDoK
PiA+ICAtIEZpeCBXdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgd2FybmluZyBpbiBwcmNpIGRyaXZl
cgo+ID4KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAgLSBSZW1vdmUgaXRlbXMgdGhhdCBoYXMgYmVl
biBkZWZpbmVkCj4gPiAgLSBSZWZpbmUgZm9ybWF0IG9mIHNpZml2ZSxmdTc0MC1wY2llLnlhbWwK
PiA+ICAtIFJlcGxhY2UgcGVyc3RuLWdwaW9zIHdpdGggdGhlIGNvbW1vbiBvbmUKPiA+ICAtIENo
YW5nZSBEQkkgbWFwcGluZyBzcGFjZSB0byAyR0IgZnJvbSA0R0IKPiA+ICAtIFJlZmluZSBkcml2
ZXJzL3Jlc2V0L0tjb25maWcKPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gIC0gUmVmaW5lIGNv
ZGVzIGJhc2VkIG9uIHJldmlld2VycycgZmVlZGJhY2sKPiA+ICAtIFJlbW92ZSBkZWZpbmUgYW5k
IHVzZSB0aGUgY29tbW9uIG9uZQo+ID4gIC0gUmVwbGFjZSBfX3Jhd193cml0ZWwgd2l0aCB3cml0
ZWxfcmVsYXhlZAo+ID4gIC0gU3BsaXQgZnU3NDBfcGh5cmVncmVhZHdyaXRlIHRvIHdyaXRlIGZ1
bmN0aW9uCj4gPiAgLSBVc2UgcmVhZGxfcG9sbF90aW1lb3V0IGluIHN0ZWFkIG9mIHdoaWxlIGxv
b3AgY2hlY2tpbmcKPiA+ICAtIFVzZSBkd2MgY29tbW9uIGNvZGVzCj4gPiAgLSBVc2UgZ3BpbyBk
ZXNjcmlwdG9ycyBhbmQgdGhlIGdwaW9kXyogYXBpLgo+ID4gIC0gUmVwbGFjZSBkZXZtX2lvcmVt
YXBfcmVzb3VyY2Ugd2l0aCBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lCj4g
PiAgLSBSZXBsYWNlIGRldm1fcmVzZXRfY29udHJvbF9nZXQgd2l0aCBkZXZtX3Jlc2V0X2NvbnRy
b2xfZ2V0X2V4Y2x1c2l2ZQo+ID4gIC0gQWRkIG1vcmUgY29tbWVudHMgZm9yIGRlbGF5IGFuZCBz
bGVlcAo+ID4gIC0gUmVtb3ZlICJwaHkgPyB4IDogeSIgZXhwcmVzc2lvbnMKPiA+ICAtIFJlZmlu
ZSBjb2RlIGxvZ2ljIHRvIHJlbW92ZSBwb3NzaWJsZSBpbmZpbml0ZSBsb29wCj4gPiAgLSBSZXBs
YWNlIG1hZ2ljIG51bWJlciB3aXRoIG1lYW5pbmdmdWwgZGVmaW5lCj4gPiAgLSBSZW1vdmUgZnU3
NDBfcGNpZV9wbV9vcHMKPiA+ICAtIFVzZSBidWlsdGluX3BsYXRmb3JtX2RyaXZlcgo+ID4KPiA+
IEdyZWVudGltZSBIdSAoNSk6Cj4gPiAgIGNsazogc2lmaXZlOiBBZGQgcGNpZV9hdXggY2xvY2sg
aW4gcHJjaSBkcml2ZXIgZm9yIFBDSWUgZHJpdmVyCj4gPiAgIGNsazogc2lmaXZlOiBVc2UgcmVz
ZXQtc2ltcGxlIGluIHByY2kgZHJpdmVyIGZvciBQQ0llIGRyaXZlcgo+ID4gICBNQUlOVEFJTkVS
UzogQWRkIG1haW50YWluZXJzIGZvciBTaUZpdmUgRlU3NDAgUENJZSBkcml2ZXIKPiA+ICAgZHQt
YmluZGluZ3M6IFBDSTogQWRkIFNpRml2ZSBGVTc0MCBQQ0llIGhvc3QgY29udHJvbGxlcgo+ID4g
ICByaXNjdjogZHRzOiBBZGQgUENJZSBzdXBwb3J0IGZvciB0aGUgU2lGaXZlIEZVNzQwLUMwMDAg
U29DCj4gPgo+ID4gUGF1bCBXYWxtc2xleSAoMSk6Cj4gPiAgIFBDSTogZnU3NDA6IEFkZCBTaUZp
dmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyCj4KPiBJIGNhbiBwdWxsIHRoZSBw
YXRjaGVzIGFib3ZlIGludG8gdGhlIFBDSSB0cmVlIChidXQgd2lsbCBkcm9wIHBhdGNoIDYgLQo+
IGR0cyBjaGFuZ2VzKSwgaXMgaXQgT0sgZm9yIHlvdSA/IFBsZWFzZSBsZXQgbWUga25vdyBob3cg
eW91IHdvdWxkIGxpa2UKPiB0byB1cHN0cmVhbSBpdC4KPgoKSGkgTG9yZW56bywKClRoYW5rIHlv
dS4KSSBhbSBvayB3aXRoIGl0LiBTbyBJIHNob3VsZCBhc2sgUGFsbWVyIHRvIHBpY2sgcGF0Y2gg
NiBkdHMgY2hhbmdlcyB0bwpSSVNDLVYgdHJlZT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
