Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B30FC56201
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 00:07:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D2C0206C0
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 00:07:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aQVqq/Qh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="UcNa1hiK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D2C0206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=QUOhkBgzP6yAhOxRODJfMc686jFk1ed2EIvBWTZvQMk=; b=aQVqq/QhzhrDD1jeIJZnA3wNn
	/HCQS+LqTBitkXh/6Eu923yZBFjLLqwiGHqqp6YiLrYU8CeMYnCVQVOxHsbw79bZREi/t2zYbUYVt
	s0WeI1d6pJl3uK+UwQT2bq0NY3I6NQoHCEjNQkx0AatM9hc0fcU1XH2HhMdsivat+2VL+bE9wRhjN
	f0ua6FS6cmhf+cVv+Mu8k5xljpb99URrKsL7samJ5T4Ip0SxJwLQ1UUzfcvIr7p68FzAw4UFB13wy
	bxRRPSWg0UEoRQGD5ah5SN/ikWUGdeWg0HcF8PLIfFdlxiUSBRNyQ21gOQ5CneOVaY4oONz23g5to
	9l4id+Fuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki4oj-0003uq-Rl; Thu, 26 Nov 2020 00:07:21 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki4og-0003uR-Hv
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 00:07:19 +0000
Received: by mail-pl1-x644.google.com with SMTP id f5so210817plj.13
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 16:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lXKGFwlwk5BhnLTOpbOaW2N4zPIH8hU8zMiJmAIHSzM=;
 b=UcNa1hiKKrFYlPeAOBA52BSPUa2xFQ4A3OyNKpIrp7OUj0PSUhb9nDuKEjKwvz/aP1
 /Bx/xrcz2r/u24ScMRL7as3hV0D1TieEglnop9SXMgZJMPOkN3DtdaNbfsOJXvVSIU7X
 AAFvP8OmJ93oDMXs+llXaO+OWqwt0rTTjFn8yWM+/+KGqsY5je9IXlkWOG08aPU/HrmR
 P562toTIhxvVevj4sot64sz5Nur9qIkcjcxM89afF/W8RjYISkH1ukUqaH6+tep1Qr9s
 c0dybXURey+1cz6LU/rE0K+QLrbf0b2Km/So4KumMJ0bT6ypq8Go7O2jPHR3sb+9npoU
 iqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lXKGFwlwk5BhnLTOpbOaW2N4zPIH8hU8zMiJmAIHSzM=;
 b=S7cp3xoz06op6ypMHn/TGsaWJnc2+ZQN7UhoyD5+vHh/GOdeb7A4T2qPXAdFwZMC/Z
 7osT0IByk02LR6yaKrcZsZFNXjW3dXrr8+1rJPK28sbPLxcnrU7rJctzmhanKTEIGidu
 erxDVIyNSHcBmzHtXczLiWtl+m6ttNLX/4MnY6QcjAKucbJQIWM2vdFN9cirTJwDvkKV
 qH3XiJ18H0xWeNBRJ+WQmHhxpeiVjsM0vswYtReoE8IA3nZT3fWv0vWOW96TFQxm3yey
 eSV1qPtJBwxLtcf4qGvNPdTxQZ318AgU5LamURMb0mq5dCQamvDoRLROCK50grx7j5O+
 pUhw==
X-Gm-Message-State: AOAM531aclfZlkTnipiaL6g2fZ6lSCmHu/J7CiM6qJka/SdVMwHosUrC
 wjZj2rVdbN0Phh/u5hit3kvMWw==
X-Google-Smtp-Source: ABdhPJyvB7YW85IRla3uGns9Rt1ES3C2J2rlLJ6FQ6Vz6Un6ISz46ng2k6fWeN359MQKL8ccHtX9aA==
X-Received: by 2002:a17:902:b604:b029:da:3006:696e with SMTP id
 b4-20020a170902b604b02900da3006696emr344981pls.34.1606349235954; 
 Wed, 25 Nov 2020 16:07:15 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e5sm196699pjl.51.2020.11.25.16.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 16:07:15 -0800 (PST)
Date: Wed, 25 Nov 2020 16:07:15 -0800 (PST)
X-Google-Original-Date: Wed, 25 Nov 2020 16:07:12 PST (-0800)
Subject: Re: [PATCH v3 0/5] Improve kernel section protections
In-Reply-To: <CAHCEehJnnytcvRr9OdXbdvzjJ9M2D4LBq4rN7TUXoW65nLx2ZQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-82cf34ec-f691-4aaa-a702-c2a5bb91e59b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_190718_815050_AA923DD4 
X-CRM114-Status: GOOD (  16.89  )
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
Cc: aou@eecs.berkeley.edu, zong.li@sifive.com, anup@brainfault.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Atish Patra <Atish.Patra@wdc.com>, ren_guo@c-sky.com,
 Paul Walmsley <paul.walmsley@sifive.com>, ojeda@kernel.org,
 akpm@linux-foundation.org, walken@google.com, ardb@kernel.org, rppt@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMyBOb3YgMjAyMCAyMzoyMTowOCBQU1QgKC0wODAwKSwgZ3JlZW50aW1lLmh1QHNp
Zml2ZS5jb20gd3JvdGU6Cj4gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+IOaWvCAy
MDIw5bm0MTHmnIg15pelIOmAseWbmyDkuIrljYg4OjA15a+r6YGT77yaCj4+Cj4+IFRoaXMgc2Vy
aWVzIGFpbXMgYXQgaW1wcm92aW5nIGtlcm5lbCBwZXJtaXNzaW9ucyBieSBkb2luZyBmb2xsb3dp
bmcgdGhpbmdzLgo+Pgo+PiAxLiBQcm90ZWN0IGtlcm5lbCBzZWN0aW9ucyBlYXJseSBpbnN0ZWFk
IG9mIGFmdGVyIC9pbml0Lgo+PiAyLiBQcm90ZWN0IC5pbml0LnRleHQgJiAuaW5pdC5kYXRhIHNl
Y3Rpb25zIHdpdGggYXBwcm9wcmlhdGUgcGVybWlzc2lvbnMuCj4+IDMuIE1vdmUgZHluYW1pYyBy
ZWxvY2F0aW9uIHNlY3Rpb24gdG8gX2luaXQuCj4+IDQuIE1vdmVkIC5pbml0IHNlY3Rpb25zIGFm
dGVyIC50ZXh0LiBUaGlzIGlzIHdoYXQgbW9zdCBvZiB0aGUgb3RoZXIgYXJjaHMKPj4gICAgYXJl
IGFsc28gZG9pbmcuCj4+Cj4+IEFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2gsIGhlcmUgYXJlIHRo
ZSBsaW5lYXIgbWFwcGVkIHNlY3Rpb25zIHdpdGggbm9uLXVlZmkgYm9vdC4KPj4KPj4gLS0tWyBM
aW5lYXIgbWFwcGluZyBdLS0tCj4+IDB4ZmZmZmZmZTAwMDAwMDAwMC0weGZmZmZmZmUwMDA4MDAw
MDAgICAgMHgwMDAwMDAwMDgwMjAwMDAwICAgICAgICAgOE0gUE1EICAgICBEIEEgLiAuIFggLiBS
IFYKPj4gMHhmZmZmZmZlMDAwODAwMDAwLTB4ZmZmZmZmZTAwMGMwMDAwMCAgICAweDAwMDAwMDAw
ODBhMDAwMDAgICAgICAgICA0TSBQTUQgICAgIEQgQSAuIC4gLiBXIFIgVgo+PiAweGZmZmZmZmUw
MDBjMDAwMDAtMHhmZmZmZmZlMDAxMjAwMDAwICAgIDB4MDAwMDAwMDA4MGUwMDAwMCAgICAgICAg
IDZNIFBNRCAgICAgRCBBIC4gLiAuIC4gUiBWCj4+IDB4ZmZmZmZmZTAwMTIwMDAwMC0weGZmZmZm
ZmUwM2ZlMDAwMDAgICAgMHgwMDAwMDAwMDgxNDAwMDAwICAgICAgMTAwNE0gUE1EICAgICBEIEEg
LiAuIC4gVyBSIFYKPj4KPj4gTGluZWFyIG1hcHBpbmcgd2l0aCB1ZWZpIGJvb3QuCj4+Cj4+IC0t
LVsgTGluZWFyIG1hcHBpbmcgXS0tLQo+PiAweGZmZmZmZmUwMDAwMDAwMDAtMHhmZmZmZmZlMDAw
ODAwMDAwICAgIDB4MDAwMDAwMDA4MDIwMDAwMCAgICAgICAgIDhNIFBURSAgICAgRCBBIC4gLiBY
IC4gUiBWCj4+IDB4ZmZmZmZmZTAwMDgwMDAwMC0weGZmZmZmZmUwMDBjMDAwMDAgICAgMHgwMDAw
MDAwMDgwYTAwMDAwICAgICAgICAgNE0gUFRFICAgICBEIEEgLiAuIC4gVyBSIFYKPj4gMHhmZmZm
ZmZlMDAwYzAwMDAwLTB4ZmZmZmZmZTAwMTIwMDAwMCAgICAweDAwMDAwMDAwODBlMDAwMDAgICAg
ICAgICA2TSBQVEUgICAgIEQgQSAuIC4gLiAuIFIgVgo+PiAweGZmZmZmZmUwMDEyMDAwMDAtMHhm
ZmZmZmZlMDNlNTM0MDAwICAgIDB4MDAwMDAwMDA4MTQwMDAwMCAgIDEwMDI3MDRLIFBURSAgICAg
RCBBIC4gLiAuIFcgUiBWCj4+IDB4ZmZmZmZmZTAzZTUzODAwMC0weGZmZmZmZmUwM2U1MzkwMDAg
ICAgMHgwMDAwMDAwMGJlNzM4MDAwICAgICAgICAgNEsgUFRFICAgICBEIEEgLiAuIC4gVyBSIFYK
Pj4gMHhmZmZmZmZlMDNlNTNhMDAwLTB4ZmZmZmZmZTAzZTUzYzAwMCAgICAweDAwMDAwMDAwYmU3
M2EwMDAgICAgICAgICA4SyBQVEUgICAgIEQgQSAuIC4gLiBXIFIgVgo+PiAweGZmZmZmZmUwM2U1
NDAwMDAtMHhmZmZmZmZlMDNlNTQxMDAwICAgIDB4MDAwMDAwMDBiZTc0MDAwMCAgICAgICAgIDRL
IFBURSAgICAgRCBBIC4gLiAuIFcgUiBWCj4+IDB4ZmZmZmZmZTAzZTU0NTAwMC0weGZmZmZmZmUw
M2U1NDYwMDAgICAgMHgwMDAwMDAwMGJlNzQ1MDAwICAgICAgICAgNEsgUFRFICAgICBEIEEgLiAu
IC4gVyBSIFYKPj4gMHhmZmZmZmZlMDNlNTQ5MDAwLTB4ZmZmZmZmZTAzZTU0YTAwMCAgICAweDAw
MDAwMDAwYmU3NDkwMDAgICAgICAgICA0SyBQVEUgICAgIEQgQSAuIC4gLiBXIFIgVgo+PiAweGZm
ZmZmZmUwM2U1NGIwMDAtMHhmZmZmZmZlMDNmZDZkMDAwICAgIDB4MDAwMDAwMDBiZTc0YjAwMCAg
ICAgMjQ3MTJLIFBURSAgICAgRCBBIC4gLiAuIFcgUiBWCj4+IDB4ZmZmZmZmZTAzZmQ2ZTAwMC0w
eGZmZmZmZmUwM2ZkZWUwMDAgICAgMHgwMDAwMDAwMGJmZjZlMDAwICAgICAgIDUxMksgUFRFICAg
ICBEIEEgLiAuIC4gVyBSIFYKPj4KPj4KPj4gQ2hhbmdlcyBmcm9tIHYyLT52MzoKPj4gMS4gQWRk
ZWQgZmV3IGV4dHJhIGNvbW1lbnRzIHRvIGNsYXJpZnkgcm9kYXRhIHBlcm1pc3Npb25zLgo+PiAy
LiBDaGFuZ2VkIHRoZSBuYW1lIG9mIHRoZSBmdW5jdGlvbnMgc2V0X21lbW9yeV9kZWZhdWx0IHRv
IHNldF9tZW1vcnlfcndfbnguCj4+IDMuIFNxdWFzaGVkIHBhdGNoIDMmNSB0b2dldGhlciBhcyB0
aGV5IGRlcGVuZCBvbiBlYWNoIG90aGVyIHRvIGFsbG93Cj4+ICAgIGJpc2VjdGFiaWxpdHkuCj4+
IDQuIFJlbW92ZWQgcmVkdW5kYW50IGFyZ3VtZW50cyBpbiBwcm90ZWN0X2tlcm5lbF90ZXh0X2Rh
dGEuCj4+Cj4+IENoYW5nZXMgZnJvbSB2MS0+djI6Cj4+IDEuIC5pbml0LnRleHQgc2VjdGlvbiBp
cyBhbGlnbmVkIHdpdGggU0VDVElPTl9BTElHTi4KPj4gMi4gLmluaXQudGV4dCBpcyBtb3ZlZCB0
byBiZWxvdyBvZiAudGV4dCBzbyB0aGF0IC5oZWFkLnRleHQgJiAudGV4dCBhcmUgaW4KPj4gICAg
b25lIHNlY3Rpb24uCj4+IDMuIFdlIGRvbid0IG5lZWQgR3VvJ3MgZml4IGZvciBzdGF0aWMgb2Jq
ZWN0IGlzc3VlLgo+PiA0LiBSZWJhc2VkIG9uIDUuMTAtcmMxLgo+Pgo+PiBBdGlzaCBQYXRyYSAo
NSk6Cj4+IFJJU0MtVjogTW92ZSBfX3N0YXJ0X2tlcm5lbCB0byAuaGVhZC50ZXh0Cj4+IFJJU0Mt
VjogSW5pdGlhbGl6ZSBTQkkgZWFybHkKPj4gUklTQy1WOiBBbGlnbiB0aGUgLmluaXQudGV4dCBz
ZWN0aW9uCj4+IFJJU0MtVjogUHJvdGVjdCBhbGwga2VybmVsIHNlY3Rpb25zIGluY2x1ZGluZyBp
bml0IGVhcmx5Cj4+IFJJU0MtVjogTW92ZSBkeW5hbWljIHJlbG9jYXRpb24gc2VjdGlvbiB1bmRl
ciBfX2luaXQKPj4KPj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zZWN0aW9ucy5oICAgfCAgMiAr
Cj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oIHwgIDQgKysKPj4gYXJjaC9y
aXNjdi9rZXJuZWwvaGVhZC5TICAgICAgICAgICAgfCAgMSAtCj4+IGFyY2gvcmlzY3Yva2VybmVs
L3NldHVwLmMgICAgICAgICAgIHwgMTkgKysrKysrKy0tCj4+IGFyY2gvcmlzY3Yva2VybmVsL3Zt
bGludXgubGRzLlMgICAgIHwgNjMgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPj4gYXJj
aC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAgfCAyMSArKysrKysrLS0tCj4+IGFyY2gv
cmlzY3YvbW0vcGFnZWF0dHIuYyAgICAgICAgICAgIHwgIDYgKysrCj4+IDcgZmlsZXMgY2hhbmdl
ZCwgODAgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCj4+Cj4KPiBUZXN0IHRoaXMgc2Vy
aWVzIGluIHY1LjEwLXJjMyBpbiBRZW11IGFuZCBpdCB3b3Jrcy4KPiBUZXN0ZWQtYnk6IEdyZWVu
dGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4KPiBUaGFuayB5b3UuIDopCgpUaGFu
a3MsIHRoaXMgaXMgb24gZm9yLW5leHQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
