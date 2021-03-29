Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D676C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:32:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CF5B61959
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 18:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CF5B61959
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pdXeenld8uvE9/9W32hLZoYmdODh13jYYfF6kXpL624=; b=lf8OWQyxGM2kz25yNW4XPQSOV
	GYsASzadrbXmj+FtUZmu3iO57fo/bcYX16L/oBn28WjXqHuZ0evcVwlHevXC4OLGJz03oGUoTMlfZ
	vMnAfCYwSgs3Gw0O7Hfeki69hcGZjOUpypM0c2+LXTTPpnebqOnPxQwTSPz4CgHAw3cQUIh9SOcTv
	EYXkcOPHOJmNMIieUbRbh+o7yffkEXst+g7uhQdrlpqH2M12vBmV84Edlu4OW8hd/hoAWKF6rMATY
	pyjKOZ3cCJQUJHJ4QLWpivAFgJaDfayZxwTMNUSpi31gniZ02DlLxl1/thSYxrD0CxaAtBvdzrZnb
	pPnH4XwNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQwg5-0014AC-V7; Mon, 29 Mar 2021 18:31:54 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQpHW-000aar-5e
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 10:38:04 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F88DP4njmz1qt3f;
 Mon, 29 Mar 2021 12:37:57 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F88DP3XYVz1r1M0;
 Mon, 29 Mar 2021 12:37:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id qHhjco2SiS_B; Mon, 29 Mar 2021 12:37:56 +0200 (CEST)
X-Auth-Info: SY4jm4BlGYZhw3PVScWDgiAb4jYC06Zb+UoxBWZYT/IpA/DcokoI2XiNNWuYVXSw
Received: from igel.home (ppp-46-244-184-171.dynamic.mnet-online.de
 [46.244.184.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 29 Mar 2021 12:37:56 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id E93BA2C3258; Mon, 29 Mar 2021 12:37:55 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Zong Li <zong.li@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Stephen Boyd <sboyd@kernel.org>,  Pragnesh Patel
 <pragnesh.patel@openfive.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org,  linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
 <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home>
 <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
 <874kgyfetu.fsf@igel.home>
 <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
X-Yow: I feel like I'm in a Toilet Bowl with a thumbtack in my forehead!!
Date: Mon, 29 Mar 2021 12:37:55 +0200
In-Reply-To: <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
 (Zong Li's message of "Mon, 29 Mar 2021 18:18:42 +0800")
Message-ID: <87h7kukzy4.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_113802_349407_AA7B69C8 
X-CRM114-Status: GOOD (  14.98  )
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

T24gTcOkciAyOSAyMDIxLCBab25nIExpIHdyb3RlOgoKPiBZZXMsIEkgY291bGQgZ2V0IHRoZSBu
ZXR3b3JrIHByb2JsZW0gYnkgdXNpbmcgdGhlIGRlZmNvbmZpZyB5b3UKPiBwcm92aWRlZCwgdGhl
IHN5c3RlbSBodW5nIHVwIHdoZW4gZXhlY3V0aW5nICdpZmNvbmZpZycgaW1tZWRpYXRlbHkKPiBh
ZnRlciBpbnN0YWxsaW5nIG1hY2IgZHJpdmVyIG1vZHVsZSwgdGhlIG5ldHdvcmsgY2FuIHdvcmsg
Ynkgb25seQo+IHJldmVydGluZyB0aGUgY29tbWl0IDczMjM3NGEwYjQ0MGQ5YTc5Yzg0MTJmMzE4
YTI1Y2QzN2JhNmY0ZTIuIEJ1dCB0aGUKPiBuZXR3b3JrIGlzIGZpbmUgYnkgdXNpbmcgdGhlIG1h
aW5saW5lJ3MgZGVmY29uZmlnLCB0aGlzIGlzIGEgbGl0dGxlCj4gYml0IHdlaXJkLCBJIHdpbGwg
Y2hlY2sgdGhhdCBhbmQgdHJ5IHRvIGZpbmQgdGhlIGRpZmZlcmVuY2UuCgpNeSBndWVzcyB3b3Vs
ZCBiZSB0aGF0IGl0IGlzIGFuIGluaXQgZGVwZW5kZW5jeSBwcm9ibGVtIGJldHdlZW4gdGhlIHBo
eQpkcml2ZXIgYW5kIHRoZSBjbG9jayBkcml2ZXIsIHdoaWNoIGNhdXNlcyB0aGUgY2xvY2sgdG8g
YmUgZW5hYmxlZCB0b28KbGF0ZS4KCkFuZHJlYXMuCgotLSAKQW5kcmVhcyBTY2h3YWIsIHNjaHdh
YkBsaW51eC1tNjhrLm9yZwpHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0RTUgNEQ2
OSAyNTEwICAyNTUyIERGNzMgRTc4MCBBOURBIEFFQzEKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBj
b21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
