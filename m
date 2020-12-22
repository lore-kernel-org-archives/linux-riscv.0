Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A015FC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 20:18:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 293F8229C5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 20:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 293F8229C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EoMtHD/orqRGbxtyqeJIJcTo5s4Lwrjqw8dpyG9v8HI=; b=GTbJC0le01NWOigrTsYXMLxqr
	Lr1vFJm8RObySqtTihmyRzR3VCaCcBSkE/D7WlClxszCyAE45hupum6krkfX2jPfWrRRyNoAh9ER7
	WoQNoMTKPW7dKg/gv36JQMNOuoKFVg44eIuoCr5e+/kBD/9aUIhJfeoA6DEejTKslei6p5MiKTIpo
	BvTK6ZTgkJ8trDicGfmtBk3ekWiD//GZvrkrPpvsZ8VU4Xy+KSsHCEnnjMFY+NnzbgCADh+XxxqPd
	iODBz51Tqgo8BUFnKjvdpsjYMAjAoRTTDdYnk4bizinyEXGRcXQnSgwMAUEJjxDptbToRzmvFJT+/
	aQzJGWqPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kro75-0006QM-0x; Tue, 22 Dec 2020 20:18:31 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kro73-0006Pr-CY
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 20:18:30 +0000
Received: by mail-il1-x129.google.com with SMTP id r17so13044873ilo.11
 for <linux-riscv@lists.infradead.org>; Tue, 22 Dec 2020 12:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=61XZrh1YB10uY1StvP1loF/iyVKygs3ZUWR3hwySAHk=;
 b=NFdFz8u4qhijlwrNi/wwgbjA8TcQxQfAzfRGXtWfRNLJNfxaIAQd017Wwj6EMq1PGo
 CMXEy7iB0LKB9BJi8emf7b6GmjW2zAz+uQ4yFHCeXb0JnJVv1GBjyL5aFBdo5Ho2Gdru
 RhdG6FaXU1cHsasyblyPvMqg3WgWt8yenjUd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=61XZrh1YB10uY1StvP1loF/iyVKygs3ZUWR3hwySAHk=;
 b=ft9Af8ytHlE7E3n+SuT5ryFWihFn+5DPX6HomYQqODS4ocmYjHZ77YSfuLw8R/BQQo
 miyETmqpQoRxP4/KDyoA5G6r/LsUqtrxRD+s9KJ80vm/Hu1RVK61fDGGJPkPBfVF2hVt
 p90ZTG3feSG5C6w+qRK7rjSkiscV7fxuA7xtGQMBhCEdCeA5R7glQ1+bs1Kj29ap8J00
 NHAl0k/dzbnDoQAU0vh+jRS52sZYvzEcOMa8InInVYljzSXhBbiqNLNVqVN4W1PC4eaj
 uAS+NEix9gR8XfQ9Je7FvY7psNZWib1Nj6FT5mDD0k/tcSiGVrtyUq2rf6fIesZdKJhZ
 bTjA==
X-Gm-Message-State: AOAM5301QJ7PFbeGg2l89uGacH3PWgxqwdPqKDfBmQlbLl2+mh2eXvMo
 XiTDSPzSiAz9Zj7BEOGRlKvOFXAcH7RHVi2ERAA5HKS+eup8xko=
X-Google-Smtp-Source: ABdhPJxsUyiaZFZ93r7DB7ujvo5noaSz8GqgAf9VvuyCCbtkc2nlJntGEay4eK+Gxd+dWjYtuaJU7/Qg2Hf3GDtDzxM=
X-Received: by 2002:a92:512:: with SMTP id q18mr22609039ile.147.1608668307542; 
 Tue, 22 Dec 2020 12:18:27 -0800 (PST)
MIME-Version: 1.0
References: <9b57034f-a4a0-1602-d331-5883f961cd7a@suse.com>
In-Reply-To: <9b57034f-a4a0-1602-d331-5883f961cd7a@suse.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Dec 2020 12:18:16 -0800
Message-ID: <CAOnJCU+RXxiP+_qK=H_d30tUg1-GMo5PDk+WBVFLumquXYUNNQ@mail.gmail.com>
Subject: Re: ftrace_init doesn't patch _mcount calls on boot
To: Varad Gautam <varad.gautam@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_151829_458180_8C41D789 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBEZWMgMjIsIDIwMjAgYXQgMjo1MyBBTSBWYXJhZCBHYXV0YW0gPHZhcmFkLmdhdXRh
bUBzdXNlLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IEknbSBvYnNlcnZpbmcgdGhlIGZvbGxvd2lu
ZyBvbiBxZW11IHdpdGggQ09ORklHX0RZTkFNSUNfRlRSQUNFPXk6Cj4KPiByb290QGRlYmlhbjov
c3lzL2tlcm5lbC9kZWJ1Zy90cmFjaW5nIyBlY2hvIGZ1bmN0aW9uID4gY3VycmVudF90cmFjZXIK
PiBbICAgNzMuNjc0MjY1XSAoX19fX3B0cnZhbF9fX18pOiBleHBlY3RlZCAoMDAwMDAwMTMgMDAw
MDAwMTMpIGJ1dCBnb3QKPiAoMDAwMDYwOTcgYTM4MDgwZTcpCj4gWyAgIDczLjY3NTE0NF0gLS0t
LS0tLS0tLS0tWyBmdHJhY2UgYnVnIF0tLS0tLS0tLS0tLS0KPiBbICAgNzMuNjc1NjY1XSBmdHJh
Y2UgZmFpbGVkIHRvIG1vZGlmeQo+IFsgICA3My42NzY1NDhdIFs8ZmZmZmZmZTAwMDAwMjAxMD5d
IF9zdGV4dCsweDEwLzB4M2MKPiBbICAgNzMuNjc3NjQxXSAgYWN0dWFsOiAgIDk3OjYwOjAwOjAw
OmU3OjgwOjgwOmEzCj4gWyAgIDczLjY3ODUzNF0gU2V0dGluZyBmdHJhY2UgY2FsbCBzaXRlIHRv
IGNhbGwgZnRyYWNlIGZ1bmN0aW9uCj4gWyAgIDczLjY3ODg0Ml0gZnRyYWNlIHJlY29yZCBmbGFn
czogODAwMDAwMDEKPiBbICAgNzMuNjc5MDg4XSAgKDEpCj4gWyAgIDczLjY3OTA4OF0gIGV4cGVj
dGVkIHRyYW1wOiBmZmZmZmZlMDAwMDA4MDIwCj4gWyAgIDczLjY3OTY4N10gLS0tLS0tLS0tLS0t
WyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4KPiBUaGlzIGNvbWVzIGZyb20gZnRyYWNlX2NoZWNr
X2N1cnJlbnRfY2FsbCgpLCB3aGljaCBlbnN1cmVzIHRoYXQgdGhlCj4gcGF0Y2ggdGFyZ2V0IGxv
Y2F0aW9uIGlzIHNldCB0byBOT1BzIGJlZm9yZSBwYXRjaGluZyBpdCB3aXRoIGEKPiBgYXVpcGMv
amFsciBNQ09VTlRfQUREUmAgc2VxdWVuY2Ugd2hlbiBmdHJhY2UgaXMgZW5hYmxlZAo+IChmdHJh
Y2Vfbm9wX2luaXRpYWxpemUgLT4gZnRyYWNlX2luaXRfbm9wIC0+IGZ0cmFjZV9tYWtlX25vcCAt
Pgo+IGZ0cmFjZV9jaGVja19jdXJyZW50X2NhbGwpLgo+Cj4gRHVtcGluZyBhIGZldyBmdW5jdGlv
biBwcm9sb2d1ZXMgZnJvbSBtZW1vcnkgYmVmb3JlIGVuYWJsaW5nIGZ0cmFjZSwgSQo+IHNlZSB0
aGF0IGJvb3QtdGltZSBwYXRjaGluZyBkaWRuJ3Qgd29yayBhcyBleHBlY3RlZC4gVGhlIGZ0cmFj
ZV9zdHViCj4gY2FsbCBzZXF1ZW5jZSBzdGlsbCBleGlzdHMsIHdoaWNoIHNob3VsZCBoYXZlIGJl
ZW4gcGF0Y2hlZCBvdmVyIGJ5IE5PUHMuCj4KPiAoZ2RiKSB4LzEwaSBibGtfcHV0X3JlcXVlc3QK
PiAgICAgWy4uLl0KPiAgICAgMHhmZmZmZmZlMDAwMzE2OWJhIDxibGtfcHV0X3JlcXVlc3QrMTQ+
OiAgICAgYXVpcGMgICByYSwweGZmY2YxCj4gICAgIDB4ZmZmZmZmZTAwMDMxNjliZSA8YmxrX3B1
dF9yZXF1ZXN0KzE4PjogICAgIGphbHIgICAgNDQ2KHJhKQo+Cj4gKGdkYikgZGlzYXMgYmxrX3B1
dF9yZXF1ZXN0Cj4gRHVtcCBvZiBhc3NlbWJsZXIgY29kZSBmb3IgZnVuY3Rpb24gYmxrX3B1dF9y
ZXF1ZXN0Ogo+ICAgICBbLi4uXQo+ICAgICAweGZmZmZmZmUwMDAzMTY5YmEgPCsxND46ICAgIGF1
aXBjICAgcmEsMHhmZmNmMQo+ICAgICAweGZmZmZmZmUwMDAzMTY5YmUgPCsxOD46ICAgIGphbHIg
ICAgNDQ2KHJhKSAjIDB4ZmZmZmZmZTAwMDAwN2I3OAo+IDxmdHJhY2Vfc3R1Yj4KPgo+IERpZ2dp
bmcgZnVydGhlciwgSSBmaW5kIHRoYXQgdGhlIGNvcHlfdG9fa2VybmVsX25vZmF1bHQoKSB3cmFw
cGVkIGluCj4gcGF0Y2hfaW5zbl93cml0ZSgpIHJldHVybnMgd2l0aG91dCB0aGUgd3JpdGUgZ29p
bmcgdGhyb3VnaC4gUmVwbGFjaW5nCj4gdGhpcyB3aXRoIGEgbWVtY3B5IGhvd2V2ZXIsIG1ha2Vz
IGZ0cmFjZSB3b3JrIGFzIGV4cGVjdGVkLgo+Cj4gSSdsbCBiZSBsb29raW5nIGludG8gcWVtdSdz
IGVtdWxhdGlvbiBmb3IgY29weV90b19rZXJuZWxfbm9mYXVsdCgpIG5leHQsCj4gYnV0IEknZCBs
aWtlIHRvIGNoZWNrIGlmIHNvbWVvbmUgZWxzZSBjYW4gcmVwcm9kdWNlIHRoaXMgYmVoYXZpb3Ig
d2l0aAo+IENPTkZJR19EWU5BTUlDX0ZUUkFDRT15Lgo+CgpEb2VzIHRoaXMgZml4IHRoZSBpc3N1
ZSA/CgpodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC8xMC8yMS83NwoKPiBLZXJuZWwgOgo+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Jpc2N2L2xpbnV4
LmdpdC9jb21taXQvP2g9Zm9yLW5leHQmaWQ9N2Q5NWE4OGY5MjU0YjcxMWEzYTk1MTA2ZmM3M2Y2
YTNhOTg2NmE0MAo+Cj4gVGhhbmtzLAo+IFZhcmFkCj4KPiAtLQo+IFNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSAo+IE1heGZlbGRzdHIuIDUKPiA5MDQwOSBOw7xybmJlcmcKPiBH
ZXJtYW55Cj4KPiBIUkIgMzY4MDksIEFHIE7DvHJuYmVyZwo+IEdlc2Now6RmdHNmw7xocmVyOiBG
ZWxpeCBJbWVuZMO2cmZmZXIKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2CgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
