Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68558C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 06:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9IchJmCgPHL6Z16mGL7HCBZ1ftK5AQNaeL5MsKqUgY=; b=ZgNtNrFrLYgKnM
	C482z/iIMiBO9hijZNkVYvYcdEThB38NaZ7y4Cpy115FF5vonQX2Tpqws+EW/b5hvu2ZpSvL3mqD8
	UbwqA5ZhwOThPlWWkpAqyt4vG6X57jX/cQJuVZgRpwmKPYkincgxjMVMvE4+19CIxuotk7C9AAzUA
	zL/iqtEHPa4QxbPCEmhtq8OUO8z5vEZ85JjgMG809Q0G2ZSvdfS4kk8D/f68PFfgP5AqVJ6MbvYBm
	IsRCaQBe7xdVSPcch7tPaDO9mmNj8cRqXT9/luE1C5kb46+pDPWaOQBRpH2cgx1wW1gSKqCYC7mpW
	XVUGohoiYjyzYBV9h5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oySHg-00Dgmr-Mh; Fri, 25 Nov 2022 06:34:00 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oySHd-00DgjH-Bb
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 06:33:59 +0000
Received: by mail-pg1-x52f.google.com with SMTP id v3so3188512pgh.4
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 22:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/ipS5xq8tqsIVw21PIGkufcYomMyPXPLWE7IUkRZsw=;
        b=SI/dYgFfr+9OU2zMBI1hOsNYAkTmDPuJsVZZHcaNui0ExAgOR2Kxa/zRdgFcSFuFL3
         OjdZCxrDhmQZaEWvooPtgNL+OwVsH9g1OwDCIR85kwDI4RCNOZ3tXLdegdu5zPt1D8SL
         Y2uTSCUagYM8DsGVw+ipysGsEV6BziO4eAE5rRL4V2P5vUltYCojl16tq5qrj0/OBLmd
         TF2gLXa6sNCxfg/zsTalss8KYj/KrNPF5l5cMWUX2NB5e7f06NgKtsnB/Yr4sWGH6H/X
         oGS/Y1XymIlkXJwsCl8w5hU1gYdOx5gKrpWlRK6/91kALYeDnl17bHIH6WzCC1Pij0VQ
         Orjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/ipS5xq8tqsIVw21PIGkufcYomMyPXPLWE7IUkRZsw=;
        b=DYinRVTQiMpXoleg0UaUJ8XamiPJQiEzRPrCHLLZOKlkIz6Qc/+mEejPQYXP9xfsqf
         ZePcOpSWNNOETfKUvtvOahBhdj6VQM6Sz0Exlted8r6LWcAQJeyofWlXnT+hvZb/ArPx
         92j/rHcIHkJ+b33RJRSdG4YnvoNSLSMhdu40q/bSIZSt3ehJVzJfOVREX4IiGbabDEMN
         wdIx0Dpwl4AsibfG/vYzWbWA2vpwyH0glgn+13CfXT9voS6JQoFTjW8Q6rznOSkIFPWe
         E111xI0NyJ+N7nR2ekT3UCrDRN4NlF3EBOWRYaDwwIBVqzca/6MqBxbugyXW7tkT9WPN
         hdFg==
X-Gm-Message-State: ANoB5pnOYg3c4Ap1VtQ/V881gNKifOF7LDOVRfwR0k2+iJ6mT5sXxBeZ
	B7cM+/d7unSvfrBTDPgWr7NW1n6DMD+PFSLWPHQ=
X-Google-Smtp-Source: AA0mqf7UtjXPD9jRvkIiJ1P3N7aChtWKpM/6+/dcfib8pgz8vFMVfiUE1GG8K9D6clPKaWkHKniUyuedAgS6ZpL46aU=
X-Received: by 2002:aa7:824f:0:b0:56e:8ed7:569f with SMTP id
 e15-20020aa7824f000000b0056e8ed7569fmr9538472pfn.19.1669358034402; Thu, 24
 Nov 2022 22:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com>
 <20221123142025.1504030-2-suagrfillet@gmail.com> <CAJF2gTTwvApRaGhZJxOrdcjWUC9DN-WF_7EKcHXx5HZ9Jkd5EA@mail.gmail.com>
 <CAAYs2=ghhMmmrM4Bktvw9iGiajS5PLd1=Z61j2ZfhbhGUi4ekg@mail.gmail.com>
 <CAJF2gTTWSr0qYTnRORSexEHMqUt-Lj6xZd0O-fUgC+f74FfCZA@mail.gmail.com>
 <CAAYs2=ifvfY3QW07LXL+B6KH6b3EELMcXuz6ja_rYNE=G4+=qQ@mail.gmail.com> <CAJF2gTQ6hEyfpo1wTUp1UwAGP1kMpEYjLqR-fz6UrCMjHN1VuQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQ6hEyfpo1wTUp1UwAGP1kMpEYjLqR-fz6UrCMjHN1VuQ@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Fri, 25 Nov 2022 06:33:42 +0000
Message-ID: <CAAYs2=hNAwDk7=F077ityNykZJCCvGVyXsxRzZO3s7rKwOPpUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_223357_406035_D9771748 
X-CRM114-Status: GOOD (  33.37  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDI15pel5ZGo5LqUIDAz
OjEw5YaZ6YGT77yaCj4KPiBPbiBGcmksIE5vdiAyNSwgMjAyMiBhdCA5OjUzIEFNIFNvbmcgU2h1
YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDI05pel5ZGo5ZubIDE1OjMx5YaZ6YGT77yaCj4g
PiA+Cj4gPiA+IE9uIFRodSwgTm92IDI0LCAyMDIyIGF0IDE6MjcgQU0gU29uZyBTaHVhaSA8c3Vh
Z3JmaWxsZXRAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEd1byBSZW4gPGd1b3Jl
bkBrZXJuZWwub3JnPiDkuo4yMDIy5bm0MTHmnIgyM+aXpeWRqOS4iSAyMzowMuWGmemBk++8mgo+
ID4gPiA+ID4KPiA+ID4gPiA+IENvb2wgam9iLCB0aHguCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24g
V2VkLCBOb3YgMjMsIDIwMjIgYXQgMTA6MjAgUE0gU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21h
aWwuY29tPiB3cm90ZToKPiA+ID4gPiA+Pgo+ID4gPiA+ID4+IFRoaXMgcGF0Y2ggYWRkcyBEWU5B
TUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyBzdXBwb3J0IGZvciBSSVNDLVYuCj4gPiA+ID4g
Pj4KPiA+ID4gPiA+PiBzZWxlY3QgdGhlIERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExT
IHRvIHByb3ZpZGUgdGhlCj4gPiA+ID4gPj4gcmVnaXN0ZXJfZnRyYWNlX2RpcmVjdFtfbXVsdGld
IGludGVyZmFjZXMgYWxsb3dpbmcgdXNlcnMgdG8gcmVnaXN0ZXIKPiA+ID4gPiA+PiB0aGUgY3Vz
dG9tZWQgdHJhbXBvbGluZSAoZGlyZWN0X2NhbGxlcikgYXMgdGhlIG1jb3VudCBmb3Igb25lIG9y
Cj4gPiA+ID4gPj4gbW9yZSB0YXJnZXQgZnVuY3Rpb25zLiBBbmQgbW9kaWZ5X2Z0cmFjZV9kaXJl
Y3RbX211bHRpXSBhcmUgYWxzbwo+ID4gPiA+ID4+IHByb3ZpZGVkIGZvciBtb2RpZnlpbmcgZGly
ZWN0X2NhbGxlci4KPiA+ID4gPiA+Pgo+ID4gPiA+ID4+IFRvIG1ha2UgdGhlIGRpcmVjdF9jYWxs
ZXIgYW5kIHRoZSBvdGhlciBmdHJhY2UgaG9va3MgKGVnLiBmdW5jdGlvbi9mZ3JhcGgKPiA+ID4g
PiA+PiB0cmFjZXIsIGtbcmV0XXByb2JlcykgY28tZXhpc3QsIGEgdGVtcG9yYXJ5IHJlZ2lzdGVy
IGlzIG5vbWluYXRlZCB0bwo+ID4gPiA+ID4+IHN0b3JlIHRoZSBhZGRyZXNzIG9mIGRpcmVjdF9j
YWxsZXIgaW4gZnRyYWNlX3JlZ3NfY2FsbGVyLiBBZnRlciB0aGUKPiA+ID4gPiA+PiBzZXR0aW5n
IG9mIHRoZSBhZGRyZXNzIGRpcmVjdF9jYWxsZXIgYnkgZGlyZWN0X29wcy0+ZnVuYyBhbmQgdGhl
Cj4gPiA+ID4gPj4gUkVTVE9SRV9SRUdTIGluIGZ0cmFjZV9yZWdzX2NhbGxlciwgZGlyZWN0X2Nh
bGxlciB3aWxsIGJlIGp1bXBlZCB0bwo+ID4gPiA+ID4+IGJ5IHRoZSBganJgIGluc3QuCj4gPiA+
ID4gPj4KPiA+ID4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBn
bWFpbC5jb20+Cj4gPiA+ID4gPj4gLS0tCj4gPiA+ID4gPj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAg
ICAgICAgICAgICAgfCAxICsKPiA+ID4gPiA+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJh
Y2UuaCB8IDYgKysrKysrCj4gPiA+ID4gPj4gIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4u
UyAgfCA0ICsrKysKPiA+ID4gPiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
Cj4gPiA+ID4gPj4KPiA+ID4gPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4gPiA+ID4gPj4gaW5kZXggMzllYzhkNjI4Y2Y2Li5kMDgzZWMw
OGQwYjYgMTAwNjQ0Cj4gPiA+ID4gPj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiA+ID4g
Pj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiA+ID4gPj4gQEAgLTI3OCw2ICsyNzgsNyBA
QCBjb25maWcgQVJDSF9SVjY0SQo+ID4gPiA+ID4+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9S
VFNfSU5UMTI4IGlmIENDX0hBU19JTlQxMjgKPiA+ID4gPiA+PiAgICAgICAgIHNlbGVjdCBIQVZF
X0RZTkFNSUNfRlRSQUNFIGlmICFYSVBfS0VSTkVMICYmIE1NVSAmJiAkKGNjLW9wdGlvbiwtZnBh
dGNoYWJsZS1mdW5jdGlvbi1lbnRyeT04KQo+ID4gPiA+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVf
RFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTIGlmIEhBVkVfRFlOQU1JQ19GVFJBQ0UKPiA+ID4gPiA+
PiArICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTCj4g
PiA+ID4gPj4gICAgICAgICBzZWxlY3QgSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRCBpZiAhWElQ
X0tFUk5FTAo+ID4gPiA+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJT05fR1JBUEhfVFJB
Q0VSCj4gPiA+ID4gPj4gICAgICAgICBzZWxlY3QgSEFWRV9GVU5DVElPTl9UUkFDRVIgaWYgIVhJ
UF9LRVJORUwgJiYgIVBSRUVNUFRJT04KPiA+ID4gPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9mdHJhY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgK
PiA+ID4gPiA+PiBpbmRleCAwMWJlYmIyOGVhYmUuLmJlNGQ1NzU2NjEzOSAxMDA2NDQKPiA+ID4g
PiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gPiA+ID4gPj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4gPiA+ID4+IEBAIC0xMTQsNiAr
MTE0LDEyIEBAIHN0cnVjdCBmdHJhY2VfcmVnczsKPiA+ID4gPiA+PiAgdm9pZCBmdHJhY2VfZ3Jh
cGhfZnVuYyh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPiA+ID4g
PiA+PiAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBmdHJhY2Vfb3BzICpvcCwgc3RydWN0
IGZ0cmFjZV9yZWdzICpmcmVncyk7Cj4gPiA+ID4gPj4gICNkZWZpbmUgZnRyYWNlX2dyYXBoX2Z1
bmMgZnRyYWNlX2dyYXBoX2Z1bmMKPiA+ID4gPiA+PiArCj4gPiA+ID4gPj4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBhcmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2NhbGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVn
cywgdW5zaWduZWQgbG9uZyBhZGRyKQo+ID4gPiA+ID4+ICt7Cj4gPiA+ID4gPj4gKyAgICAgICAg
ICAgICAgIHJlZ3MtPnQxID0gYWRkcjsKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIb3cgYWJvdXQgcmVn
cy0+dDAgPSBhZGRyOyA/Cj4gPiA+ID4gPiBBbmQgZGVsZXRlIGFsbCBtY291bnQtZHluLlMgbW9k
aWZpY2F0aW9uLgo+ID4gPiA+ID4KPiA+ID4gPiBUaGUgZGlyZWN0X2NhbGxlciBoYXMgdGhlIHNh
bWUgcHJvZ3JhbSBsYXlvdXQgYXMgdGhlIGZ0cmFjZV9jYWxsZXIsIHdoaWNoIG1lYW5zCj4gPiA+
ID4gdGhlIHJlZyB0MCB3aWxsIG5ldmVyIGJlIGNoYW5nZWQgd2hlbiBkaXJlY3RfY2FsbGVyIHJl
dHVybnMuCj4gPiA+ID4KPiA+ID4gPiBJZiByZWdzLT50MCBjaGFuZ2VzIGhlcmUgYW5kIGZ0cmFj
ZV9yZWdzX2NhbGxlciBleGVjdXRlcyBganIgdDBgLAo+ID4gPiA+IGRpcmVjdF9jYWxsZXIgd2ls
bCBlbnRlciB0aGUgZGVhZCBsb29wLgo+ID4gPiA+Cj4gPiA+ID4gQWN0dWFsbHkgdGhlIHJlZyB0
MCBhbHdheXMgc2F2ZXMgdGhlIGFkZHJlc3Mgb2YgZnVuY3Rpb24gZW50cnkgd2l0aCA4Qgo+ID4g
PiA+IG9mZnNldCwgaXQgc2hvdWxkIG9ubHkKPiA+ID4gPiBjaGFuZ2VkIGJ5IHRoZSBJUE1PRElG
WSBvcHMgaW5zdGVhZCBvZiB0aGUgZGlyZWN0X29wcy4KPiA+ID4gSG93IGFib3V0Ogo+ID4gPiBz
dGF0aWMgaW5saW5lIHZvaWQgYXJjaF9mdHJhY2Vfc2V0X2RpcmVjdF9jYWxsZXIoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MsCj4gPiA+IHVuc2lnbmVkIGxvbmcgYWRkcikKPiA+ID4gewo+ID4gPiAgICAg
ICAgICAgICAgICByZWdzLT50MSA9IHJlZ3MtPnQwOwo+ID4gPiAgICAgICAgICAgICAgICByZWdz
LT50MCA9IGFkZHI7Cj4gPiA+Cj4gPiA+IGRpcmVjdF9jYWxsZXI6Cj4gPiA+IGFkZCBzcCxzcCwt
Pwo+ID4gPiBzZCB0MSw/KHNwKQo+ID4gZGlyZWN0X2NhbGxlciBhbHNvIHNlcnZlcyBhcyB0aGUg
Zmlyc3QgdHJhbXBvbGluZSBhcyBmdHJhY2VfY2FsbGVyLCBsaWtlIHRoaXM6Cj4gPiBgYGAKPiA+
IGZ1bmMgLS0gZGlyZWN0X2NhbGxlcgo+ID4gICAgICAgICAtLSBmdHJhY2VfW3JlZ3NdX2NhbGxl
cgo+ID4gYGBgCj4gPiBTbyB0aGUgdDEgaW4gdGhpcyBsaW5lIGhhcyB0byBiZSB0MCB0byBzYXZl
IHRoZSBQQy4KPgo+IGRpcmVjdF9jYWxsZXI6Cj4gYWRkIHNwLHNwLC0/Cj4gc2QgdDEsPyhzcCkK
PiBzZCB0MCwgPyhzbykKPiBzZCByYSw/KHNwKQo+IG1vdiB0MCwgdDEKVGhpcyBmb28gaXMgdGhl
IHRyYWNpbmcgZnVuY3Rpb24gYWxvbmcgd2l0aCB0aGUgZGlyZWN0X2NhbGxlciwKYW5kIGl0IGhh
cyB0aGUgc2FtZSBwYXJhbWV0ZXJzIGFzIHRoZSB0YXJnZXQgZnVuY3Rpb24uClNvIHRoZSB0MCBv
ciB0MSBoZXJlIG1lYW5zIG5vdGhpbmcgZm9yIHRoaXMgZm9vIGZ1bmN0aW9uLgoKTm8gb2ZmZW5z
ZSwgYnV0IHdoYXQncyB0aGUgcHVycG9zZSBvZiB0aGlzIG12IGluc3Q/Cj4gY2FsbCBmb28KPiBs
ZCB0MCw/KHNwKQo+IGxkIHQxLD8oc3ApCj4gbGQgcmEsPyhzcCkKPiBhZGQgc3Asc3AsPwo+IGpy
IHQxIC8vIDwtIGJhY2sgdG8gZnVuY3Rpb24gZW50cnkKV2hlbiBkaXJlY3RfY2FsbGVyIHdvcmtz
IGFzIHRoZSBmaXJzdCB0cmFtcG9saW5lCnRoZSBjb250ZW50IG9mIHQxIGhlcmUgbWVhbnMgbm90
aGluZyBmb3IgdGhlIHRhcmdldCBmdW5jdGlvbiwgbmVpdGhlcgpQQyBub3IgUElQLgo+Cj4KPiA+
ID4gc2QgcmEsPyhzcCkKPiA+ID4gY2FsbCBmb28KPiA+ID4gbGQgdDEsPyhzcCkKPiA+IEFuZCB0
aGlzIGxpbmUuCj4gPiA+IGxkIHJhLD8oc3ApCj4gPiA+IGFkZCBzcCxzcCw/Cj4gPiA+IGpyIHQx
IC8vIDwtIGJhY2sgdG8gZnVuY3Rpb24gZW50cnkKPiA+ID4KPiA+ID4gQW5kIGRlbGV0ZSBhbGwg
bWNvdW50LWR5bi5TIG1vZGlmaWNhdGlvbi4KPiA+ID4KPiA+ID4gPiA+Pgo+ID4gPiA+ID4+ICt9
Cj4gPiA+ID4gPj4gKwo+ID4gPiA+ID4+ICAjZW5kaWYgLyogQ09ORklHX0RZTkFNSUNfRlRSQUNF
X1dJVEhfUkVHUyAqLwo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gICNlbmRpZiAvKiBfX0FTU0VNQkxZ
X18gKi8KPiA+ID4gPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5
bi5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4gPiA+ID4gPj4gaW5kZXggNDY2
YzZlZjIxN2IxLi5iODljODVhNTg1NjkgMTAwNjQ0Cj4gPiA+ID4gPj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvbWNvdW50LWR5bi5TCj4gPiA+ID4gPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
bWNvdW50LWR5bi5TCj4gPiA+ID4gPj4gQEAgLTIzMyw2ICsyMzMsNyBAQCBFTkRQUk9DKGZ0cmFj
ZV9jYWxsZXIpCj4gPiA+ID4gPj4gICNlbHNlIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRI
X1JFR1MgKi8KPiA+ID4gPiA+PiAgRU5UUlkoZnRyYWNlX3JlZ3NfY2FsbGVyKQo+ID4gPiA+ID4+
ICAgICAgICAgU0FWRV9BQklfUkVHUyAxCj4gPiA+ID4gPj4gKyAgICAgICBSRUdfUyAgIHgwLCBQ
VF9UMShzcCkKPiA+ID4gPiA+PiAgICAgICAgIFBSRVBBUkVfQVJHUwo+ID4gPiA+ID4+Cj4gPiA+
ID4gPj4gIGZ0cmFjZV9yZWdzX2NhbGw6Cj4gPiA+ID4gPj4gQEAgLTI0MSw3ICsyNDIsMTAgQEAg
ZnRyYWNlX3JlZ3NfY2FsbDoKPiA+ID4gPiA+Pgo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gICAgICAg
ICBSRVNUT1JFX0FCSV9SRUdTIDEKPiA+ID4gPiA+PiArICAgICAgIGJuZXogICAgdDEsLkxkaXJl
Y3QKPiA+ID4gPiA+PiAgICAgICAgIGpyIHQwCj4gPiA+ID4gPj4gKy5MZGlyZWN0Ogo+ID4gPiA+
ID4+ICsgICAgICAganIgdDEKPiA+ID4gPiA+PiAgRU5EUFJPQyhmdHJhY2VfcmVnc19jYWxsZXIp
Cj4gPiA+ID4gPj4KPiA+ID4gPiA+PiAgRU5UUlkoZnRyYWNlX2NhbGxlcikKPiA+ID4gPiA+PiAt
LQo+ID4gPiA+ID4+IDIuMjAuMQo+ID4gPiA+ID4+Cj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4g
PiA+IC0tCj4gPiA+ID4gPiBCZXN0IFJlZ2FyZHMKPiA+ID4gPiA+ICBHdW8gUmVuCj4gPiA+Cj4g
PiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IEJlc3QgUmVnYXJkcwo+ID4gPiAgR3VvIFJlbgo+ID4g
VGhhbmtzLAo+ID4gU29uZwo+Cj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
