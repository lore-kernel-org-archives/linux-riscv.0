Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D0CC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 07:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTedaqz8CyEfhjpJ3Pw3gDWZibWmSSFMx9DwHMplTAs=; b=IeW6teGFJ//c+X
	nkCg6MpeZPPUe0kd9k6jYiNJKRs1xR0+6BXVt8MMl1ntwhli88B+wpYmFfCVT+58j0lO+MLU4f7WL
	BidMRcojZFY+iJGXmWBvLy9GpIfb7G+1XAMyu1S59U3oigS9jjSJkqBNIPuRRxYOetBIt3OFURcPf
	3s+nlQEsBFnZkDHq5bm/rAM4NKq8Vix5dQIQPtk60hgPZIpW6bNdbymZIa6WUMFs75rXKyUuVVOlH
	9V1mFci9LZEYu3FqLy0I+asv+ATW6o04atGIPE87Xzp6KNypGtCfOS7H+A1m1z0zhSwpi7trh6K2p
	meHVdCg2FV63FX0Ww3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMq0-006r0v-I7; Tue, 21 Feb 2023 07:13:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMpw-006qwe-NC
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 07:13:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id p16so290230wmq.5
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 23:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKUefFK9SiP/kDBGD+FrqYGyTRY+XtYHTqFfXzLRCic=;
        b=Wn/WwmyzxpAuhNVifq3JYfnKu8T/n2i/txGrpukajWWRJwYuCjQT2rjWs04z7XGtUx
         V5hazoONpR83YdFjd4oPC7KhWET8tvlpNJyz0kdw4Vd50KxRh0f3WNePwGB+tUdsZ4W/
         oLhrGc4DhkqoT93Hp5b3zyWPTYhOYyiPmLjDRLi6RTjwBM6JsPPTIrXaG2HP2Ot5yCmC
         h9HjtQBpH4iXY8GdIzaPeJ5olenWTLIoCktzV8KXLKw1yx/kOtjBght0vm2QuGDXNGwW
         7HrkSDSPEw22C2medMeG4ERmJkjkWpprGX1CSci82dWL/FM35rI8vH9Hj3F+Y4THzQYK
         N3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKUefFK9SiP/kDBGD+FrqYGyTRY+XtYHTqFfXzLRCic=;
        b=TABVQR5yI+L512dimXRuLd9eEvE2GoDrrc2/yVzr/PsdP7T31yRPSDnie6Y4nbWdTF
         Y0wNdh3ITuYDLlgxI8cwJUYwIzdDHNWpDGcCO/+fEwlZ80FHjff4m2CUm5hlHhgJfkny
         X4Svx3l9FbyyAyfm/OKNjVagKwUQYC4tatfm8rysXwmWcTxZ0YFPiS61oIdMc73RYq8D
         FrkEWKAl/xJNkB1VyqDoB0IOWSk5UkE6wyW29IHSt5WK4BBfT0oQc3Lng4h6jQjR9VuJ
         1UwX86r8tRqME5/53BmNeTnHv6V1fuGkOB0K4eErKMfzGIjrcXfSJ0BNYdxPLi4lBCt7
         OFrQ==
X-Gm-Message-State: AO0yUKU6tN8QhkPNXu5ZUk0ude/sgsHdrbsQPkrT62uO4Sd+xTDXA3o3
	qvVI/B8S5xab9jc8aQhAZdWy7b7p8Sav45/7sWCs7Q==
X-Google-Smtp-Source: AK7set+H1FIoSX3EEh1yGR9n51hoiM91i0p+8wSWyTcgIW4iRjlyf1gAZ3YDv3sxlv0ULcTUiG4yHijCYkpJw3gnib8=
X-Received: by 2002:a05:600c:600a:b0:3e4:2f8d:ae35 with SMTP id
 az10-20020a05600c600a00b003e42f8dae35mr386805wmb.185.1676963592042; Mon, 20
 Feb 2023 23:13:12 -0800 (PST)
MIME-Version: 1.0
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9> <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
In-Reply-To: <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Tue, 21 Feb 2023 08:12:58 +0100
Message-ID: <CAEg0e7hRjMSgYZbPTQztbQ3bGZf-r8wAfCK5ZnDXOcx27HcTCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: apatel@ventanamicro.com, pbonzini@redhat.com, atishp@atishpatra.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com, anup@brainfault.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_231316_783437_F9760C9B 
X-CRM114-Status: GOOD (  39.02  )
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

SGkgYWxsLAoKVGhlIFJJU0MtViBBcmNoaXRlY3R1cmFsIFJldmlldyBDb21taXR0ZWUgaGFzIGRp
c2N1c3NlZCB0aGUgY29uY2VybnMKcmVnYXJkaW5nIHRoZSBub24tcmF0aWZpZWQgY2hhcHRlcnMg
aW4gdGhlIEFJQSBzcGVjaWZpY2F0aW9uLgoKSGVyZSBpcyB0aGUgcmVsZXZhbnQgcXVvdGUgZnJv
bSB0aGUgbWVldGluZyBtaW51dGVzOgoiIiIKQWx0aG91Z2ggdGhlIEFkdmFuY2VkIEludGVycnVw
dCBBcmNoaXRlY3R1cmUgKEFJQSkgaGFzIGFscmVhZHkgcGFzc2VkCkFyY2hpdGVjdHVyZSBSZXZp
ZXcgKHdpdGggYSBtaW5vciBlZGl0IHN0aWxsIHBlbmRpbmcpLCB0aGUgY29tbWl0dGVlCmhhcyBz
b21lIHN1Z2dlc3Rpb25zIGFib3V0IGl0cyBmaW5hbCBzdGVwcyB0byByYXRpZmljYXRpb24sIHRv
IGF2b2lkCnRoZSBBSUEgZG9jdW1lbnQgaGF2aW5nIGEgbWl4dHVyZSBvZiByYXRpZmllZCBhbmQg
bm9uLXJhdGlmaWVkIGNvbnRlbnQ6CgotIFRoZSBBSUEgZG9jdW1lbnQncyByZW1haW5pbmcgZHJh
ZnQgY2hhcHRlciBvbiB0aGUgRHVvLVBMSUMsIHdoaWNoIGlzCiAgbm90IGN1cnJlbnRseSBvbiBh
IHBhdGggdG8gcmF0aWZpY2F0aW9uLCBjYW4gYmUgcmVtb3ZlZCB0byBhIHNlcGFyYXRlCiAgZG9j
dW1lbnQuCgotIFJhdGlmaWNhdGlvbiBvZiB0aGUgZnVsbCBBSUEgKHdpdGhvdXQgRHVvLVBMSUMp
IGNhbiBiZSBwb3N0cG9uZWQgdG8KICBjb2luY2lkZSB3aXRoIHJhdGlmaWNhdGlvbiBvZiB0aGUg
SU9NTVUgc3BlY2lmaWNhdGlvbiwgZ2l2ZW4gdGhhdAogIHRoZSBsYXR0ZXIgaXMgbm93IGV4cGVj
dGVkIGluIGEgcmVhc29uYWJsZSB0aW1lLCBhbmQgdGhlIEFJQSdzIGxhc3QKICBjaGFwdGVyIGNv
bmNlcm5pbmcgSU9NTVVzIGlzIGFscmVhZHkgc2NoZWR1bGVkIHRvIGdvIHRocm91Z2ggcHVibGlj
CiAgcmV2aWV3IGFuZCBiZSByYXRpZmllZCBvbmx5IHRvZ2V0aGVyIHdpdGggdGhlIElPTU1VIHNw
ZWNpZmljYXRpb24uCiIiIgoKVGhlIGZ1bGwgbWVldGluZyBtaW51dGVzIGNhbiBiZSBmb3VuZCBo
ZXJlOgogIGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVjaC1jaGFpcnMvbWVzc2FnZS8xMzgx
CgpCUgpDaHJpc3RvcGgKCk9uIFdlZCwgRmViIDE1LCAyMDIzIGF0IDQ6NDEgUE0gQ2hyaXN0b3Bo
IE3DvGxsbmVyCjxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+IHdyb3RlOgo+Cj4gT24gRnJp
LCBGZWIgMywgMjAyMyBhdCAxOjI1IEFNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5j
b20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgMjcgSmFuIDIwMjMgMjM6Mjc6MzIgUFNUICgtMDgw
MCksIGFwYXRlbEB2ZW50YW5hbWljcm8uY29tIHdyb3RlOgo+ID4gPiBXZSBoYXZlIHR3byBleHRl
bnNpb24gbmFtZXMgZm9yIEFJQSBJU0Egc3VwcG9ydDogU21haWEgKE0tbW9kZSBBSUEgQ1NScykK
PiA+ID4gYW5kIFNzYWlhIChTLW1vZGUgQUlBIENTUnMpLgo+ID4KPiA+IFRoaXMgaGFzIHByZXR0
eSBtdWNoIHRoZSBzYW1lIHByb2JsZW0gdGhhdCB3ZSBoYWQgd2l0aCB0aGUgb3RoZXIKPiA+IEFJ
QS1yZWxhdGVkIElTQSBzdHJpbmcgcGF0Y2hlcywgd2hlcmUgdGhlcmUncyB0aGF0IGFtYmlndWl0
eSB3aXRoIHRoZQo+ID4gbm9uLXJhdGlmaWVkIGNoYXB0ZXJzLiAgSUlSQyB3aGVuIHRoaXMgY2Ft
ZSB1cCBpbiBHQ0MgdGhlIHJvdWdoIGlkZWEgd2FzCj4gPiB0byB0cnkgYW5kIGRvY3VtZW50IHRo
YXQgd2UncmUgZ29pbmcgdG8gaW50ZXJwcmV0IHRoZSBzdGFuZGFyZCBJU0EKPiA+IHN0cmluZ3Mg
dGhhdCB3YXksIGJ1dCBub3cgdGhhdCB3ZSdyZSBkb2luZyBjdXN0b20gSVNBIGV4dGVuc2lvbnMg
aXQKPiA+IHNlZW1zIHNhbmVyIHRvIGp1c3QgZGVmaW5lIG9uIGhlcmUgdGhhdCByZW1vdmVzIHRo
ZSBhbWJpZ3VpdHkuCj4KPgo+IFRvIGF2b2lkIHRoZSBpbXByZXNzaW9uIHRoYXQgSSBkaWQgbm90
IHdvcmsgb24gdGhhdCwgaGVyZSBpcyB0aGUgdjIKPiBmcm9tIE5vdmVtYmVyLAo+IHRoYXQgYXR0
ZW1wdHMgdG8gZG9jdW1lbnQgdGhpczoKPiAgIGh0dHBzOi8vZ2NjLmdudS5vcmcvcGlwZXJtYWls
L2djYy1wYXRjaGVzLzIwMjItTm92ZW1iZXIvNjA3MzI2Lmh0bWwKPgo+IE15IHByb3Bvc2VkIHRl
eHQgd2FzOgo+ICtOb3RlLCB0aGF0IEFJQSBzdXBwb3J0IChAc2FtcHtTbWFpYX0gYW5kIEBzYW1w
e1NzYWlhfSkgaXMgYmFzZWQgb24gYW4gQUlBCj4gK3NwZWNpZmljYXRpb24sIHdoaWNoIGlzIGZy
b3plbiBidXQgY29udGFpbnMgZHJhZnQgY2hhcHRlcnMgKCJEdW8tUExJQyIgYW5kCj4gKyJJT01N
VSBTdXBwb3J0IikuCj4KPiBCdHcsIEkgZGlkIG5vdCBnZXQgYW55IGZlZWRiYWNrIG9uIHRoYXQg
cGF0Y2guCj4KPiBJIGFsc28gdHJpZWQgdG8gYWRkcmVzcyB0aGlzIG9uIHNwZWMgbGV2ZWwgKHRo
ZSBQUiBoYXMgYmVlbiBsaW5rZWQpIGFuZCByYWlzZWQKPiB0aGF0IHRvIHRlY2gtYWlhICh0aGUg
Y29udmVyc2F0aW9uIGhhcyBiZWVuIGxpbmtlZCkuCj4KPiBBbm90aGVyIHRoaW5nIHRoYXQgSSB3
YW50IHRvIGhpZ2hsaWdodCwgc2luY2UgaXQgd2FzIGRpc2N1c3NlZCBhIGxvdCByZWNlbnRseQo+
IChlLmcuIGp1c3QgYSBmZXcgbWludXRlcyBhZ28gaW4gdGVjaC1jaGFpcnMpLgo+IFRoZXJlIGlz
IGEgY2hhbmNlIG9mIGEgbGFzdC1taW51dGUgc3BlYyBjaGFuZ2Ugb2YgQUlBOgo+ICAgaHR0cHM6
Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFpYS9wdWxsLzM3Cj4KPiBCUgo+IENocmlzdG9waAo+
Cj4KPgo+ID4KPiA+Cj4gPiBJIGp1c3Qgc2VudAo+ID4gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyMzAyMDMwMDEyMDEuMTQ3NzAtMS1wYWxtZXJAcml2b3NpbmMuY29tLz4KPiA+IHdoaWNo
IGRvY3VtZW50cyB0aGF0Lgo+ID4KPiA+ID4gV2UgZXh0ZW5kIHRoZSBJU0Egc3RyaW5nIHBhcnNp
bmcgdG8gZGV0ZWN0IFNtYWlhIGFuZCBTc2FpYSBleHRlbnNpb25zLgo+ID4gPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4gUmV2
aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+IC0t
LQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgMiArKwo+ID4gPiAgYXJj
aC9yaXNjdi9rZXJuZWwvY3B1LmMgICAgICAgIHwgMiArKwo+ID4gPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jIHwgMiArKwo+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ID4gPiBpbmRleCA4NjMyOGUz
YWNiMDIuLjM0MWVmMzBhMzcxOCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+
ID4gPiBAQCAtNTksNiArNTksOCBAQCBlbnVtIHJpc2N2X2lzYV9leHRfaWQgewo+ID4gPiAgICAg
ICBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFLAo+ID4gPiAgICAgICBSSVNDVl9JU0FfRVhUX1NT
VEMsCj4gPiA+ICAgICAgIFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCwKPiA+ID4gKyAgICAgUklTQ1Zf
SVNBX0VYVF9TTUFJQSwKPiA+ID4gKyAgICAgUklTQ1ZfSVNBX0VYVF9TU0FJQSwKPiA+ID4gICAg
ICAgUklTQ1ZfSVNBX0VYVF9JRF9NQVgKPiA+ID4gIH07Cj4gPiA+ICBzdGF0aWNfYXNzZXJ0KFJJ
U0NWX0lTQV9FWFRfSURfTUFYIDw9IFJJU0NWX0lTQV9FWFRfTUFYKTsKPiA+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiA+
ID4gaW5kZXggMWI5YTVhNjZlNTVhLi5hMjE1ZWM5MjkxNjAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5j
Cj4gPiA+IEBAIC0xNjIsNiArMTYyLDggQEAgYXJjaF9pbml0Y2FsbChyaXNjdl9jcHVpbmZvX2lu
aXQpOwo+ID4gPiAgICogICAgZXh0ZW5zaW9ucyBieSBhbiB1bmRlcnNjb3JlLgo+ID4gPiAgICov
Cj4gPiA+ICBzdGF0aWMgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSBpc2FfZXh0X2FycltdID0g
ewo+ID4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzbWFpYSwgUklTQ1ZfSVNBX0VYVF9T
TUFJQSksCj4gPiA+ICsgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzYWlhLCBSSVNDVl9JU0Ff
RVhUX1NTQUlBKSwKPiA+Cj4gPiBUaGlzIHdpbGwgY29uZmxpY3Qgd2l0aCB0aGF0IElTQSBzdHJp
bmcgcmVmYWN0b3JpbmcgSSBqdXN0IG1lcmdlZC4gIEl0Cj4gPiBzaG91bGQgYmUgYSBwcmV0dHkg
bWVjaGFuaWNhbCBtZXJnZSBjb25mbGljdCwgYnV0IGlmIHlvdSB3YW50IHdlIGNhbiBkbwo+ID4g
YSBzaGFyZWQgdGFnIHdpdGggdGhlIGZpcnN0IGZldyBwYXRjaGVzIGFuZCBJIGNhbiBoYW5kbGUg
dGhlIG1lcmdlCj4gPiBjb25mbGljdCBsb2NhbGx5Lgo+ID4KPiA+ID4gICAgICAgX19SSVNDVl9J
U0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpLAo+ID4gPiAgICAg
ICBfX1JJU0NWX0lTQV9FWFRfREFUQShzc3RjLCBSSVNDVl9JU0FfRVhUX1NTVEMpLAo+ID4gPiAg
ICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdmludmFsLCBSSVNDVl9JU0FfRVhUX1NWSU5WQUwp
LAo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiA+IGluZGV4IDkzZTQ1NTYwYWYzMC4uM2M1
YjUxZjUxOWQ1IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiA+IEBAIC0y
MjgsNiArMjI4LDggQEAgdm9pZCBfX2luaXQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VYVF9NQVAoInppaGludHBhdXNl
IiwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSk7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgic3N0YyIsIFJJU0NWX0lTQV9FWFRfU1NUQyk7Cj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgic3ZpbnZh
bCIsIFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFNFVF9JU0FfRVhUX01BUCgic21haWEiLCBSSVNDVl9JU0FfRVhUX1NNQUlBKTsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VUX0lTQV9FWFRfTUFQKCJzc2FpYSIs
IFJJU0NWX0lTQV9FWFRfU1NBSUEpOwo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4g
PiAgI3VuZGVmIFNFVF9JU0FfRVhUX01BUAo+ID4gPiAgICAgICAgICAgICAgIH0KPiA+Cj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
