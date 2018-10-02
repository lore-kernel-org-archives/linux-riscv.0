Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223F1C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 16:44:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17BA2064A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 16:44:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N/n/PWqo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A17BA2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O0z0wJpo+ynVMN5GJzjnPovRnCykovWD7sQBxYX/kLc=; b=N/n/PWqoH6tO9X5ukkBIJkQTu
	ryyNSn/OXluU+/pVy3+eHgNHMUiNg7uxVgWrY09YItFQzVvx6vpaCSq+zx+lhEpxhbu3t2eAMj24g
	JBYXh5Pzl3soAYZ8+43n6A1yFi4oX7XkQYb1fMA3yi8YyAxBMg+PG2CXeQgRHcJRBv0AhvcRXonSY
	KIZlCxoL0xHHMaCKXNcjcN2TySP/o3iAwHusQx0nNT4HUMJAhggc4rU0/+/+3GilqXAOBCmZb2ith
	y6PGZmZBEPqYSFMUcCjRpabsujuH3g2TFoREyALxf5eDatoAxaOKxyrIGOC8EzT1gU5oRp0Ze5Bw2
	tYTyDHGoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7NmN-0002vP-Tw; Tue, 02 Oct 2018 16:44:11 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7NmK-0002u3-LY
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 16:44:10 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 w92Ghor9039932; Tue, 2 Oct 2018 19:43:54 +0300 (EEST)
X-AuditID: 8b5b9d4d-903ff70000000e62-d2-5bb3a0443035
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 B4.08.03682.440A3BB5; Tue,  2 Oct 2018 19:43:48 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id w92GhmLm019561; Tue, 2 Oct 2018 19:43:48 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 02 Oct 2018 19:43:48 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: Implement built-in command line feature
Organization: FORTH
In-Reply-To: <mhng-d047a199-9994-4150-95b0-72ad6c1ec96a@palmer-si-x1c4>
References: <mhng-d047a199-9994-4150-95b0-72ad6c1ec96a@palmer-si-x1c4>
Message-ID: <41abac95c55e46047e37ee77439bc4c9@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsXSHc2orOu6YHO0wY2jahZbf89it9j2uYXN
 ovndOXaLzRMWsDqweBzu+MLu8XDTJSaPzUvqPS41X2cPYInisklJzcksSy3St0vgyvh4dDVr
 wSveirOnt7M2MDZxdzFyckgImEhMX7+LuYuRi0NI4CijxMMNk9ggnIOMEis2rWKEqDKVmL23
 E8zmFRCUODnzCQuIzSxgITH1yn5GCFteonnrbGYQm0VAVeLh70VgNpuApsT8SwfB6kUE1CQO
 NR2BqveV2Db9PFiNsICLxLKvz8Di/ALCEp/uXmQFsTkF3CW+bDjNBGILCbhJHF2yhwXiBheJ
 5vffWSFuU5H48PsBO4gtKqAs8eLEdNYJjEKzkJw6C8mps5CcuoCReRWjQGKZsV5mcrFeWn5R
 SYZeetEmRnCQz/XdwXhugf0hRgEORiUe3oT5m6OFWBPLiitzDzFKcDArifD2JQKFeFMSK6tS
 i/Lji0pzUosPMUpzsCiJ8x5+ER4kJJCeWJKanZpakFoEk2Xi4JRqYJzgXJqqtrr50ky+LRM6
 tvs4f1P46b2dy89rY1jviQMbDJoOaVXMCnK7uCZexq8g4MY7oRTfJ/xLxYs3LHy5/+0ajlmr
 DV/917okzCqaX700lvndnbX7d57ijpVefFJ7XXUE39/9zauV9soLvWzXTLCYuaMo7ELXzRaL
 njC2mGyh1YedpzjcFVZiKc5INNRiLipOBAB65SdZbgIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_094409_086922_47447648 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002164348.09XtTB4rHrnM-__GL211QXbC3VR9uDYM_zKvC83Iigs@z>

zqPPhM65z4IgMjAxOC0xMC0wMiAxNzo1NiwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIFR1ZSwgMDIgT2N0IDIwMTggMDc6MDQ6NDkgUERUICgtMDcwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiBUaGlzIHBhdGNoIGVuYWJsZXMgdGhlIHVzZSBvZiBhIGJ1aWx0LWluIGtl
cm5lbCBjb21tYW5kIGxpbmUsIHdoaWNoIAo+PiBjYW4KPj4gb3B0aW9uYWx5IGFsc28gb3ZlcnJp
ZGUgdGhlIGNvbW1hbmQgbGluZSBwcm92aWRlZCBieSB0aGUgYm9vdCBsb2FkZXIuCj4+IAo+PiBT
aWduZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+IAo+IENo
cmlzdG9waCdzIGNvbW1lbnRzIGFyZSB2YWxpZCwgYnV0IEkgaGF2ZSBhIGJpZ2dlciBvbmU6IG91
ciBvcmlnaW5hbAo+IHBsYW4gd2FzIHRvIGZpeCB0aGUgZ2VuZXJpYyBzdXBwb3J0IGZvciBDT05G
SUdfQ01ETElORSwgYW5kIHdoaWxlIEknZAo+IHN0aWxsIHByZWZlciB0byBkbyB0aGF0IG91ciBv
cmlnaW5hbCBhdHRlbXB0IGdvdCBodW5nIHVwLiAgQSB3b3JraW5nCj4gaW1wbGVtZW50YXRpb24g
dHJ1bXBzIGEgY2xlYW4gb25lLCBidXQgSSdkIHN0aWxsIHByZWZlciB0aGUgY2xlYW4gb25lCj4g
aWYgeW91IGhhdmUgdGltZSB0byB0YWtlIGEgbG9vay4KPiAKPiBUaGUgb2ZmZW5kaW5nIGZ1bmN0
aW9uIGlzIGVhcmx5X2luaXRfZHRfc2Nhbl9jaG9zZW4oKSBpbgo+IGRyaXZlcnMvb2YvZmR0LmMu
ICBUaGUgaXNzdWUgaXMgdGhhdCB0aGlzIGlzIG9ubHkgY2FsbGVkIHdoZW4gYSBjaG9zZW4KPiBu
b2RlIGlzIHByZXNlbnQsIHdoaWNoIGRvZXNuJ3QgZ2V0IGNhbGxlZCAoYW5kIHRoZXJlZm9yIGRv
ZXNuJ3Qgc2V0Cj4gYm9vdF9jb21tYW5kX2xpbmUpIHdoZW4gdGhlcmUgaXMgbm8gL2Nob3NlbiBu
b2RlLiAgVGhlIGZpeCBtaWdodCBiZSBhcwo+IHNpbXBsZSBhcyBjaGVja2luZyBmb3IgYSAvY2hv
c2VuIG5vZGUgaW4gZWFybHlfaW5pdF9kdF9zY2FuX25vZGVzKCksCj4gYW5kIGNhbGxpbmcgdGhl
IENPTkZJR19DTURMSU5FIGhhbmRsaW5nIGlmIHRoZXJlJ3Mgbm8gL2Nob3NlbiBub2RlLgo+IAo+
IElmIHRoYXQncyB0b28gbXVjaCB3b3JrIEkgY2FuIGFkZCBpdCB0byBteSBUT0RPIGxpc3QsIGJ1
dCB0aGF0IG5ldmVyCj4gZ2V0cyBzaG9ydGVyIDopLiAgR2l2ZW4gdGhhdCBsYXN0IHRpbWUgd2Ug
dHJpZWQgbWVzc2luZyB3aXRoIHRoaXMgd2UKPiBicm9rZSB0aGluZ3MgbXVsdGlwbGUgdGltZXMs
IEknZCBwcmVmZXIgdG8gaGF2ZSB0aGlzIG9uIGZvci1uZXh0IGZvciBhCj4gYml0IGZpcnN0IGVp
dGhlciB3YXksIHNvIHRoZXJlJ3Mgbm8gYmlnIHJ1c2ggb24gbXkgZW5kLgo+IAo+IFRoYW5rcyBm
b3IgdGhlIHBhdGNoIQo+IAoKQUNLIEknbGwgd29yayBvbiB0aGF0IGluc3RlYWQsIGl0IG1ha2Vz
IG1vcmUgc2Vuc2UgaWYgd2Ugb25seSBnZXQgdGhlCmJvb3QgYXJndW1lbnRzIHRocm91Z2ggdGhl
IGRldmljZSB0cmVlLiBXZSdsbCBhbHNvIG5lZWQgdG8gZGVmaW5lCkNPTkZJR19DTURMSU5FX0VY
VEVORCBmb3IgdGhpcyB0byB3b3JrIGFzIGV4cGVjdGVkIHNvIEkgZ3Vlc3MgSSdsbCBzZW5kCmEg
c2VyaWVzIHRvIGFsc28gdHdlYWsgS2NvbmZpZyBhZ2Fpbi4gRG8geW91IHdhbnQgbWUgdG8gd29y
ayBvbiB0b3Agb2YKbXkgcHJldmlvdXMgS2NvbmZpZyBwYXRjaCBvciBzaG91bGQgSSBzZW5kIGEg
bmV3IHNlcmllcyBmcm9tIHNjcmF0Y2ggPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
