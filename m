Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C125C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4roAcPz/k375Pzkxdj7RzlPwy/OQFBi8q18aCpIHnk=; b=lWUBU64pA8BEZA
	4b7A6F7q6qDr2g1jFQPCSoI+5MuYqdYyFN+xZ3stLN/jRnOLuBeqc92RP3cofaTbxA0pZadu7OXXE
	2Z8HxtGzejA9rRp3a99kDCOtVUUcmas3uhyRvhzSYs8iYA2lbfLG39Df+Di/xLfRmgGz9rGK4/TOm
	SXQaxOmjdg4LNo+d7GQzKzdir9zB9CVnlKpSXurS8MWnS30H6GIjOLYO41K0S4YZH6DEsNB31uUv1
	VN2nEXx5QV5IjirGJonlK2RqG2ge4uQeFptvV443eGwBSpkKDns5HDyKO6R1Vx8JcGvPF/fWoaO/C
	pMyCsKhJL0MY3J/vpvrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWcor-009cfe-5t; Mon, 27 Feb 2023 12:41:29 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWcon-009cec-GT
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 12:41:26 +0000
Received: by mail-pg1-x529.google.com with SMTP id p6so3478106pga.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8051CX7GPwWvxqPme+h1NtjPhHXl6yhdGNxnSFiTIOA=;
        b=DkVsZ7W6sLSIbxXqO3RoUSQbMxy+34TToWoKm83zULMAtyl1ogv9SxlV5LzIqI0lyP
         69NKWYIwkNWmBdOaWfGR4/pZ1TXJL273lB9247VA8pD50IIdZcQHJHCAGyDlBvuToTJq
         6tRcO44j60Agew8QWEjJUbShHfFjIkZnpEP4oX+UclT1W5vprZPTfsUucuLoCIh75Yyl
         6XUfq3vPoPlDtbrELgyTjeWySVIBbfhO0P5YgwqvzYLdCkVg1KbB7nf/U+iza0TLhIvQ
         /8iUib+n0EolvYMXtODbhqDZMOUaZEwp/R1qtbZbDSdOfvxAh5x2SPZNbzs+w+3MjpRw
         R3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8051CX7GPwWvxqPme+h1NtjPhHXl6yhdGNxnSFiTIOA=;
        b=g6ejYMJ91UVBeEWizFfpt6yoOhae47oCfuoOkfsYE1POb0UxcWOxPaiWVJDyrbH6cu
         GgxlH2IblDr/DEKA6d6dNGOdch9a83ktWSrZ2qGoRrmrl3mpNZsP30fJq3NLEZPdzMKn
         73XwEIjESw20aYKyTvCYqQwkBP7A9a+6Da5VAHUtAPNSfHYHXjq3GzRic9R9hGfrANIp
         5SavMpzI+JG+qinNXNxKHuf/5ZSbrYpjKrsb0upQComFaxmT5eDzfTCXcXWxVe7l9KeK
         Au9KcCda1Eo85jJ0dLqEytK9QGhY+YfpvDjorhT+ldlxR7FqW3xf6c/rrGeFHN3dI6h3
         Zt+g==
X-Gm-Message-State: AO0yUKUfaQsGHesegiQCQrzHLl0WDUQ5raxf+duYzVKyBatbhLs80jzv
	zlTCl385+quTGdA7nwpnpFKvK6dWWOeg4kFNKCM=
X-Google-Smtp-Source: AK7set+VPHNc0Uj3lGJtVWGyyyOmXD3p+bICegEcbCtoyyDOa/JLV6ZlwR96+FshBmRFyL71aTMFUEuoS6vHb1bDNu8=
X-Received: by 2002:a63:7556:0:b0:4fb:9902:fc4a with SMTP id
 f22-20020a637556000000b004fb9902fc4amr5794446pgn.10.1677501682153; Mon, 27
 Feb 2023 04:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20230227105941.2749193-1-suagrfillet@gmail.com> <Y/yagE7jfRGo1FgY@wendy>
In-Reply-To: <Y/yagE7jfRGo1FgY@wendy>
From: Song Shuai <suagrfillet@gmail.com>
Date: Mon, 27 Feb 2023 12:40:45 +0000
Message-ID: <CAAYs2=jSt9=d=N98DCVvtNA9FE6KcVYVdHPG-wpuDPknBFUndQ@mail.gmail.com>
Subject: Re: [PATCH] sched/doc: supplement CPU capacity with RISC-V
To: Conor Dooley <conor.dooley@microchip.com>
Cc: corbet@lwn.net, alexs@kernel.org, siyanteng@loongson.cn, robh@kernel.org, 
	palmer@rivosinc.com, leyfoon.tan@starfivetech.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_044125_582181_3E551205 
X-CRM114-Status: GOOD (  21.24  )
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4g5LqOMjAyM+W5tDLmnIgy
N+aXpeWRqOS4gCAxMTo1N+WGmemBk++8mgo+Cj4gT24gTW9uLCBGZWIgMjcsIDIwMjMgYXQgMDY6
NTk6NDFQTSArMDgwMCwgU29uZyBTaHVhaSB3cm90ZToKPiA+IFRoaXMgY29tbWl0IDdkMjA3ODMx
MGNiZiAoImR0LWJpbmRpbmdzOiBhcm06IG1vdmUgY3B1LWNhcGFjaXR5IHRvIGEKPiA+IHNoYXJl
ZCBsb2F0aW9uIikgdXBkYXRlcyBzb21lIHJlZmVyZW5jZXMgYWJvdXQgY2FwYWNpdHktZG1pcHMt
bWh6Cj4KPiBOb3QgcmVxdWVzdGluZyBhIHJlc3BpbiBmb3IgdGhpcywgYnV0IG1lbnRpb25pbmcg
Y29tbWl0IDk5MTk5NDUwOWVlOQo+ICgiZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgYSBjYXBhY2l0
eS1kbWlwcy1taHogY3B1IHByb3BlcnR5IikgaXMKPiBwcm9iYWJseSBtb3JlIHJlbGV2YW50IGFz
IGEganVzdGlmaWNhdGlvbiBmb3IgdGhpcyBjaGFuZ2UuCj4KVGhhbmtzIGZvciB5b3VyIGNvcnJl
Y3Rpb24sIEknbGwgcGF5IGF0dGVudGlvbiBuZXh0IHRpbWUuCgpJIGhhdmUgYSBxdWVzdGlvbiBh
Ym91dCB0aGUgcGF0Y2ggeW91IG1lbnRpb25lZDoKVGhlIHBhdGNoIHVzZXMgY3B1X3NjYWxlIHBl
cl9jcHUgdmFyaWFibGUgdG8gc3RvcmUgdGhlIENQVSBjYXBhY2l0eQp0aHJvdWdoIGFyY2hfdG9w
b2xvZ3ksCkJ1dCBhcmNoX3NjYWxlX2NwdV9jYXBhY2l0eSgpIGludGVyZmFjZSBzZWVtcyBub3Qg
ZGVmaW5lZCB0byBkZWxpdmVyCnRoZSBjcHVfc2NhbGUgdG8gdGhlIHNjaGVkdWxlcgpJbiBjb250
cmFzdCwgYXJtNjQgZGVmaW5lcyBpdCBhcyB0aGUgdG9wb2xvZ3lfZ2V0X2NwdV9zY2FsZSgpIGlu
IGl0cwphcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RvcG9sb2d5LmguCklzIHRoaXMgYW4gb3ZlcnNp
Z2h0IG9yIGEgcGFydGljdWxhciBwdXJwb3NlPwoKPiA+IHByb3BlcnR5IGluIHRoaXMgZG9jdW1l
bnQuCj4gPgo+ID4gVGhlIGxpc3Qgb2YgYXJjaGl0ZWN0dXJlcyB1c2luZyBjYXBhY2l0eS1kbWlw
cy1taHogb21pdHMgUklTQy1WLCBzbwo+ID4gc3VwcGxlbWVudHMgaXQgaGVyZS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICBEb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1jYXBhY2l0eS5yc3QgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQo+ID4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Nj
aGVkdWxlci9zY2hlZC1jYXBhY2l0eS5yc3QgfCAyICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vc2NoZWR1bGVyL3NjaGVkLWNhcGFjaXR5LnJzdCBiL0RvY3VtZW50YXRpb24vc2No
ZWR1bGVyL3NjaGVkLWNhcGFjaXR5LnJzdAo+ID4gaW5kZXggOGUyYjg1MzhiYzJiLi5lMmMxY2Y3
NDMxNTggMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1jYXBh
Y2l0eS5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vc2NoZWR1bGVyL3NjaGVkLWNhcGFjaXR5
LnJzdAo+ID4gQEAgLTI1OCw3ICsyNTgsNyBAQCBMaW51eCBjYW5ub3QgY3VycmVudGx5IGZpZ3Vy
ZSBvdXQgQ1BVIGNhcGFjaXR5IG9uIGl0cyBvd24sIHRoaXMgaW5mb3JtYXRpb24gdGh1cwo+ID4g
IG5lZWRzIHRvIGJlIGhhbmRlZCB0byBpdC4gQXJjaGl0ZWN0dXJlcyBtdXN0IGRlZmluZSBhcmNo
X3NjYWxlX2NwdV9jYXBhY2l0eSgpCj4gPiAgZm9yIHRoYXQgcHVycG9zZS4KPiA+Cj4gPiAtVGhl
IGFybSBhbmQgYXJtNjQgYXJjaGl0ZWN0dXJlcyBkaXJlY3RseSBtYXAgdGhpcyB0byB0aGUgYXJj
aF90b3BvbG9neSBkcml2ZXIKPiA+ICtUaGUgYXJtLCBhcm02NCwgYW5kIFJJU0MtViBhcmNoaXRl
Y3R1cmVzIGRpcmVjdGx5IG1hcCB0aGlzIHRvIHRoZSBhcmNoX3RvcG9sb2d5IGRyaXZlcgo+Cj4g
TXkgZ3JlcCBjbGVhcmx5IG1pc3NlZCB0aGlzIGNoYW5nZSwgdGhhbmtzLgo+IEZvciB0aGUgb25s
eSBwYXJ0IG9mIHRoZSBwYXRjaCBJIHVuZGVyc3RhbmQ6Cj4gUmV2aWV3ZWQtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBUaGFua3MsCj4gQ29ub3IuCj4K
CgotLSAKVGhhbmtzLApTb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
