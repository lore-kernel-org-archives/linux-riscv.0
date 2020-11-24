Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42905C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 07:21:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E70A20674
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 07:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R132N+tQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Uq5oLkUE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E70A20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qwAK9kzvj1dKXn8K7q5a483+KJahSecBhrri1QbrlRw=; b=R132N+tQ5u+Spg0fG60iE4Zma
	u7UhvySyFV3/yQh7SjF0kw/H6O2ZNfrstcmdwSY7iPlwmTydRhsay1y9FerJSaNy/LH6XSwo+qyhp
	cqfLS84cHF6D/iYj6D5XllZ2SfZEdO88J2zI0PKWyYcT87ayfOEy75NEC764U1nEK3HuWiUFaTJSd
	oy2cki06VHVOiyU0J+WRTA+IcwtnxHDcL4KcsZotS44ps1F25/FIR1OAxSZms2GGPWf0FySGpDhKp
	A6WRiSuadneF3iCZHnd6A43SZEMsJ2m3Jv8ssX+2c8m+61IkYzKxofNfFrBxnCg/4D2v9R3FkPr1K
	OV5ZiWHUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khSdj-0003xs-Tw; Tue, 24 Nov 2020 07:21:28 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khSdg-0003xE-19
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 07:21:25 +0000
Received: by mail-qk1-x742.google.com with SMTP id y197so19593682qkb.7
 for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2020 23:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hwdzYO346UPH60KVdrJ8QmKLumNSrWcU3AoIlBFc2rA=;
 b=Uq5oLkUEgN/xeTlb8kqe1FzJiCXT8XQK6oP0fgFnSM7HjShXe6GAKNxF0V79V+LmDE
 cc03QMu9Wim0GaVjxArrVhWs5UMHxOt0K6XNFiOUvbICbtTaiC0jHDKkBwzfrHRPAS1I
 Kphg5BdZxND8OJFyn/ly20+lRk8Evyn4FP0vASdcrgm0U3PS/Z6sdhFex/OP0clQWXta
 AN4j/HQ1cb/VFo3oHGjg5UsHO6SGqeng1Kt3LZuDH9LouKvuBCRpWGWUkY2pghUH3jX5
 AFXwQixYaRldt0QLteRkRJwXySBIi91PdPVdRAwGGD4JABqGW2GfqHQKpMzvn9eYWABA
 /imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hwdzYO346UPH60KVdrJ8QmKLumNSrWcU3AoIlBFc2rA=;
 b=ZbPLozlhzSTfsb6pa5nNh+nFpKruIMaKSTa7QrhRsxyPamsrSVsnPAy4spAHSIYCiH
 bUWgdsuj00N1s0BmGCULPSvnPNhdWXgzMrzQTWvQRg+B278Pzk05X6EkaQQ4lnDJ33p1
 nzJoWa1tWYU5Vn7+KgJTOqLVhui5pKYbQjFE9CLWtT/Sl+rdEJf4KYf5cdcQs5MKLOF6
 jCtR4NaLIUZbnKXF/eh7p2TNlgP2Iu6FtBCtWIkFi1U11C6ot6zjDlYDU1ZrafcJecid
 VufsAGE+kH2rGs19yT1O298Mga2LskQYVgAgc25CqVyYHf/eY8W/NjBtQ5FjvOCSuHvC
 si9Q==
X-Gm-Message-State: AOAM530GQvoa186eFaGVtXwbWQiANxXaJjAr34aYvw4T9Y++Ukkac28h
 mXFOBwgxRwbv+2V3avoUTfwSpPUAAzAtgzTAC+DGbQ==
X-Google-Smtp-Source: ABdhPJwXReb6PD+u0kjaMqn5kr+/X6Q1ukB2j7HBi88G+OCvOswXGEU91yPGqV4NQR2roDiwf9epmg63es4dJbeybbY=
X-Received: by 2002:a37:6c41:: with SMTP id h62mr3416405qkc.401.1606202480482; 
 Mon, 23 Nov 2020 23:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20201105000439.1491243-1-atish.patra@wdc.com>
In-Reply-To: <20201105000439.1491243-1-atish.patra@wdc.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Tue, 24 Nov 2020 15:21:08 +0800
Message-ID: <CAHCEehJnnytcvRr9OdXbdvzjJ9M2D4LBq4rN7TUXoW65nLx2ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Improve kernel section protections
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_022124_355306_FADBECBA 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <ren_guo@c-sky.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Miguel Ojeda <ojeda@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+IOaWvCAyMDIw5bm0MTHmnIg15pelIOmA
seWbmyDkuIrljYg4OjA15a+r6YGT77yaCj4KPiBUaGlzIHNlcmllcyBhaW1zIGF0IGltcHJvdmlu
ZyBrZXJuZWwgcGVybWlzc2lvbnMgYnkgZG9pbmcgZm9sbG93aW5nIHRoaW5ncy4KPgo+IDEuIFBy
b3RlY3Qga2VybmVsIHNlY3Rpb25zIGVhcmx5IGluc3RlYWQgb2YgYWZ0ZXIgL2luaXQuCj4gMi4g
UHJvdGVjdCAuaW5pdC50ZXh0ICYgLmluaXQuZGF0YSBzZWN0aW9ucyB3aXRoIGFwcHJvcHJpYXRl
IHBlcm1pc3Npb25zLgo+IDMuIE1vdmUgZHluYW1pYyByZWxvY2F0aW9uIHNlY3Rpb24gdG8gX2lu
aXQuCj4gNC4gTW92ZWQgLmluaXQgc2VjdGlvbnMgYWZ0ZXIgLnRleHQuIFRoaXMgaXMgd2hhdCBt
b3N0IG9mIHRoZSBvdGhlciBhcmNocwo+ICAgIGFyZSBhbHNvIGRvaW5nLgo+Cj4gQWZ0ZXIgYXBw
bHlpbmcgdGhpcyBwYXRjaCwgaGVyZSBhcmUgdGhlIGxpbmVhciBtYXBwZWQgc2VjdGlvbnMgd2l0
aCBub24tdWVmaSBib290Lgo+Cj4gLS0tWyBMaW5lYXIgbWFwcGluZyBdLS0tCj4gMHhmZmZmZmZl
MDAwMDAwMDAwLTB4ZmZmZmZmZTAwMDgwMDAwMCAgICAweDAwMDAwMDAwODAyMDAwMDAgICAgICAg
ICA4TSBQTUQgICAgIEQgQSAuIC4gWCAuIFIgVgo+IDB4ZmZmZmZmZTAwMDgwMDAwMC0weGZmZmZm
ZmUwMDBjMDAwMDAgICAgMHgwMDAwMDAwMDgwYTAwMDAwICAgICAgICAgNE0gUE1EICAgICBEIEEg
LiAuIC4gVyBSIFYKPiAweGZmZmZmZmUwMDBjMDAwMDAtMHhmZmZmZmZlMDAxMjAwMDAwICAgIDB4
MDAwMDAwMDA4MGUwMDAwMCAgICAgICAgIDZNIFBNRCAgICAgRCBBIC4gLiAuIC4gUiBWCj4gMHhm
ZmZmZmZlMDAxMjAwMDAwLTB4ZmZmZmZmZTAzZmUwMDAwMCAgICAweDAwMDAwMDAwODE0MDAwMDAg
ICAgICAxMDA0TSBQTUQgICAgIEQgQSAuIC4gLiBXIFIgVgo+Cj4gTGluZWFyIG1hcHBpbmcgd2l0
aCB1ZWZpIGJvb3QuCj4KPiAtLS1bIExpbmVhciBtYXBwaW5nIF0tLS0KPiAweGZmZmZmZmUwMDAw
MDAwMDAtMHhmZmZmZmZlMDAwODAwMDAwICAgIDB4MDAwMDAwMDA4MDIwMDAwMCAgICAgICAgIDhN
IFBURSAgICAgRCBBIC4gLiBYIC4gUiBWCj4gMHhmZmZmZmZlMDAwODAwMDAwLTB4ZmZmZmZmZTAw
MGMwMDAwMCAgICAweDAwMDAwMDAwODBhMDAwMDAgICAgICAgICA0TSBQVEUgICAgIEQgQSAuIC4g
LiBXIFIgVgo+IDB4ZmZmZmZmZTAwMGMwMDAwMC0weGZmZmZmZmUwMDEyMDAwMDAgICAgMHgwMDAw
MDAwMDgwZTAwMDAwICAgICAgICAgNk0gUFRFICAgICBEIEEgLiAuIC4gLiBSIFYKPiAweGZmZmZm
ZmUwMDEyMDAwMDAtMHhmZmZmZmZlMDNlNTM0MDAwICAgIDB4MDAwMDAwMDA4MTQwMDAwMCAgIDEw
MDI3MDRLIFBURSAgICAgRCBBIC4gLiAuIFcgUiBWCj4gMHhmZmZmZmZlMDNlNTM4MDAwLTB4ZmZm
ZmZmZTAzZTUzOTAwMCAgICAweDAwMDAwMDAwYmU3MzgwMDAgICAgICAgICA0SyBQVEUgICAgIEQg
QSAuIC4gLiBXIFIgVgo+IDB4ZmZmZmZmZTAzZTUzYTAwMC0weGZmZmZmZmUwM2U1M2MwMDAgICAg
MHgwMDAwMDAwMGJlNzNhMDAwICAgICAgICAgOEsgUFRFICAgICBEIEEgLiAuIC4gVyBSIFYKPiAw
eGZmZmZmZmUwM2U1NDAwMDAtMHhmZmZmZmZlMDNlNTQxMDAwICAgIDB4MDAwMDAwMDBiZTc0MDAw
MCAgICAgICAgIDRLIFBURSAgICAgRCBBIC4gLiAuIFcgUiBWCj4gMHhmZmZmZmZlMDNlNTQ1MDAw
LTB4ZmZmZmZmZTAzZTU0NjAwMCAgICAweDAwMDAwMDAwYmU3NDUwMDAgICAgICAgICA0SyBQVEUg
ICAgIEQgQSAuIC4gLiBXIFIgVgo+IDB4ZmZmZmZmZTAzZTU0OTAwMC0weGZmZmZmZmUwM2U1NGEw
MDAgICAgMHgwMDAwMDAwMGJlNzQ5MDAwICAgICAgICAgNEsgUFRFICAgICBEIEEgLiAuIC4gVyBS
IFYKPiAweGZmZmZmZmUwM2U1NGIwMDAtMHhmZmZmZmZlMDNmZDZkMDAwICAgIDB4MDAwMDAwMDBi
ZTc0YjAwMCAgICAgMjQ3MTJLIFBURSAgICAgRCBBIC4gLiAuIFcgUiBWCj4gMHhmZmZmZmZlMDNm
ZDZlMDAwLTB4ZmZmZmZmZTAzZmRlZTAwMCAgICAweDAwMDAwMDAwYmZmNmUwMDAgICAgICAgNTEy
SyBQVEUgICAgIEQgQSAuIC4gLiBXIFIgVgo+Cj4KPiBDaGFuZ2VzIGZyb20gdjItPnYzOgo+IDEu
IEFkZGVkIGZldyBleHRyYSBjb21tZW50cyB0byBjbGFyaWZ5IHJvZGF0YSBwZXJtaXNzaW9ucy4K
PiAyLiBDaGFuZ2VkIHRoZSBuYW1lIG9mIHRoZSBmdW5jdGlvbnMgc2V0X21lbW9yeV9kZWZhdWx0
IHRvIHNldF9tZW1vcnlfcndfbnguCj4gMy4gU3F1YXNoZWQgcGF0Y2ggMyY1IHRvZ2V0aGVyIGFz
IHRoZXkgZGVwZW5kIG9uIGVhY2ggb3RoZXIgdG8gYWxsb3cKPiAgICBiaXNlY3RhYmlsaXR5Lgo+
IDQuIFJlbW92ZWQgcmVkdW5kYW50IGFyZ3VtZW50cyBpbiBwcm90ZWN0X2tlcm5lbF90ZXh0X2Rh
dGEuCj4KPiBDaGFuZ2VzIGZyb20gdjEtPnYyOgo+IDEuIC5pbml0LnRleHQgc2VjdGlvbiBpcyBh
bGlnbmVkIHdpdGggU0VDVElPTl9BTElHTi4KPiAyLiAuaW5pdC50ZXh0IGlzIG1vdmVkIHRvIGJl
bG93IG9mIC50ZXh0IHNvIHRoYXQgLmhlYWQudGV4dCAmIC50ZXh0IGFyZSBpbgo+ICAgIG9uZSBz
ZWN0aW9uLgo+IDMuIFdlIGRvbid0IG5lZWQgR3VvJ3MgZml4IGZvciBzdGF0aWMgb2JqZWN0IGlz
c3VlLgo+IDQuIFJlYmFzZWQgb24gNS4xMC1yYzEuCj4KPiBBdGlzaCBQYXRyYSAoNSk6Cj4gUklT
Qy1WOiBNb3ZlIF9fc3RhcnRfa2VybmVsIHRvIC5oZWFkLnRleHQKPiBSSVNDLVY6IEluaXRpYWxp
emUgU0JJIGVhcmx5Cj4gUklTQy1WOiBBbGlnbiB0aGUgLmluaXQudGV4dCBzZWN0aW9uCj4gUklT
Qy1WOiBQcm90ZWN0IGFsbCBrZXJuZWwgc2VjdGlvbnMgaW5jbHVkaW5nIGluaXQgZWFybHkKPiBS
SVNDLVY6IE1vdmUgZHluYW1pYyByZWxvY2F0aW9uIHNlY3Rpb24gdW5kZXIgX19pbml0Cj4KPiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NlY3Rpb25zLmggICB8ICAyICsKPiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3NldF9tZW1vcnkuaCB8ICA0ICsrCj4gYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5T
ICAgICAgICAgICAgfCAgMSAtCj4gYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAg
fCAxOSArKysrKysrLS0KPiBhcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4Lmxkcy5TICAgICB8IDYz
ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gYXJjaC9yaXNjdi9tbS9pbml0LmMgICAg
ICAgICAgICAgICAgfCAyMSArKysrKysrLS0tCj4gYXJjaC9yaXNjdi9tbS9wYWdlYXR0ci5jICAg
ICAgICAgICAgfCAgNiArKysKPiA3IGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDM2
IGRlbGV0aW9ucygtKQo+CgpUZXN0IHRoaXMgc2VyaWVzIGluIHY1LjEwLXJjMyBpbiBRZW11IGFu
ZCBpdCB3b3Jrcy4KVGVzdGVkLWJ5OiBHcmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUu
Y29tPgoKVGhhbmsgeW91LiA6KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
