Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7D3C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 06:06:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B938260041
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 06:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B938260041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2c9P8lTz3Jub2NW94nZxATBKjzNjeln0mk1WE0zh/o=; b=3lpOW5fTqIbEGd
	dvZRKH8bELXs42cqRORlMZ9OMXrZTEmNCJ7aGvfuF5zscwHKI5+O9ue87qyMf/euZQs3KjGx8EoJE
	1tEv4kZe5O0BgZk7R5IpwS/7iwuoEy1kCCiZZPJAiC0BtWp7ntf6HojLHAQQUfGnhDEsQatgIENf1
	UYvcKCxx2YKLS1cPKXlsWAsH6OYa9kCnSUzOuaHYq5ZFEU1z7l1KovxEYvaJq60/bkyjUxtNni81Q
	mmvBZgEbU6calX3DYTur9ChCnmnPHDkBIEwwe/UW36T6TnU8zoNmqS1miXi9z25INhRScM0N2Fk/x
	NMYvfh0qFa5GnFtTFSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgL1a-009uip-3r; Fri, 29 Oct 2021 06:05:58 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgL1X-009uiD-3i
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 06:05:56 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id d10so10733130ybe.3
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 23:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ef7CgH5bstiFbSOUk78qZ1LgQ+HaUKVN7yqdDJbvgJM=;
 b=Lu4P/PB9F9ghzQlQ1gTf3elDPEt0VhIoLYh95RM87su3kRebBW0vq9G4CCKAYPcy6R
 wkQEqfeatb5Rz8ZoPPZqQNjN6n4ggXEmgDcY+rgzkpTnH3K0Lyuja8CkAHIwskQe6tmC
 l+xuWdDlokRksbYia9moXY+odalbngjOHN3oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ef7CgH5bstiFbSOUk78qZ1LgQ+HaUKVN7yqdDJbvgJM=;
 b=BP36cs1brMFQl43bdnlkFYtgcpBm/1LnpQecGWwygjTx8jzZdo1OzW1eGY4U0CTjKz
 W09Xn7HEkxXqkB3aCSTvmtkPYG4ltTPWCgJHOwXUvTRsOFOVW75Z/494ZbMhde5dNqCr
 o8eYbU0wHJ2rByDWFBT300mCOu76AdALY3xd38/0rZxuyOWdDhLDvLkXFLLaN6s2QSO7
 NfvDgrkXTjuQrOLHRd6aStK4Ihpj1YcCAYZMDkT/D+S/FmdjvZH2VsCMq4ERr9XEMkZW
 2PS/IkL3nr3A69DfMvmCwDJsWdcqRrW+Ir/wbOLAY019qubNLyez8L5prXNaW5eOsIz+
 N7AA==
X-Gm-Message-State: AOAM533fcXQkj/iangP/iP1RRCRQKDBh/xkU458nltPNxvzQMRAIAVGb
 6AUzNILgH1o6h8eB2BtK4zvzDRF3kGpcvWa/bx2u
X-Google-Smtp-Source: ABdhPJyAbwZ9hvTFa/radJfuWMS3aMdr2KxRKeUkW7bQFbqcD1sB+dxag58TbQt8Fx9iY4ymtLyrLQiBHBB94EUg6MQ=
X-Received: by 2002:a25:5341:: with SMTP id h62mr9970718ybb.481.1635487553445; 
 Thu, 28 Oct 2021 23:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195350.242914-1-atish.patra@wdc.com>
 <20211025195350.242914-11-atish.patra@wdc.com>
 <YXsMtrmuavGAHk8S@Jessicas-MacBook-Pro.local>
 <CAOnJCULqwZvK52nczp2HNinDCBjThnbGbvJpAvdameny1fK4Vw@mail.gmail.com>
 <EDB030D6-D37A-43D6-9027-222794FDA80D@jrtc27.com>
In-Reply-To: <EDB030D6-D37A-43D6-9027-222794FDA80D@jrtc27.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 28 Oct 2021 23:05:42 -0700
Message-ID: <CAOnJCUJjzmW=QobLPKAWYGppFeoJXjT2Ee6eG2-H=s2mnei=RQ@mail.gmail.com>
Subject: Re: [v4 10/11] riscv: dts: fu740: Add pmu node
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Atish Patra <atish.patra@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_230555_225483_666DAA80 
X-CRM114-Status: GOOD (  40.73  )
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

T24gVGh1LCBPY3QgMjgsIDIwMjEgYXQgNTowNyBQTSBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpy
dGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMjkgT2N0IDIwMjEsIGF0IDAwOjM3LCBBdGlzaCBQYXRy
YSA8YXRpc2hwQGF0aXNocGF0cmEub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIE9jdCAyOCwg
MjAyMSBhdCAxOjQ5IFBNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6
Cj4gPj4KPiA+PiBPbiBNb24sIE9jdCAyNSwgMjAyMSBhdCAxMjo1Mzo0OVBNIC0wNzAwLCBBdGlz
aCBQYXRyYSB3cm90ZToKPiA+Pj4gSGlGaXZlIHVubWF0Y2hlZCBzdXBwb3J0cyBIUE1Db3VudGVy
cyBidXQgZG9lcyBub3QgaW1wbGVtZW50IG1jb3VudGluaGliaXQKPiA+Pj4gb3Igc3Njb2YgZXh0
ZW5zaW9uLiBUaHVzLCBwZXJmIG1vbml0b3JpbmcgY2FuIGJlIHVzZWQgb24gdGhlIHVubWF0Y2hl
ZAo+ID4+PiBib2FyZCB3aXRob3V0IHNhbXBsaW5nLgo+ID4+Pgo+ID4+PiBBZGQgdGhlIFBNVSBu
b2RlIHdpdGggY29tcGF0aWJsZSBzdHJpbmcgc28gdGhhdCBMaW51eCBwZXJmIGRyaXZlciBjYW4K
PiA+Pj4gdXRpbGl6ZSB0aGlzIHRvIGVuYWJsZSBQTVUuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYt
Ynk6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPgo+ID4+PiAtLS0KPiA+Pj4gYXJj
aC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpIHwgMyArKysKPiA+Pj4gMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpCj4gPj4+IGluZGV4IGFiYmI5NjBmOTBhMC4uYjM1
Yjk2YjU4ODIwIDEwMDY0NAo+ID4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9m
dTc0MC1jMDAwLmR0c2kKPiA+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3
NDAtYzAwMC5kdHNpCj4gPj4+IEBAIC0xNDAsNiArMTQwLDkgQEAgc29jIHsKPiA+Pj4gICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDI+Owo+ID4+PiAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJzaW1wbGUtYnVzIjsKPiA+Pj4gICAgICAgICAgICAgIHJhbmdlczsKPiA+Pj4gKyAgICAgICAg
ICAgICBwbXUgewo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyaXNj
dixwbXUiOwo+ID4+PiArICAgICAgICAgICAgIH07Cj4gPj4KPiA+PiBUaGlzIGlzIGEgcHJvcGVy
dHkgb2YgdGhlIHVzZXItcmVwbGFjZWFibGUgZmlybXdhcmUsIG5vdCBhIHByb3BlcnR5IG9mCj4g
Pj4gdGhlIGhhcmR3YXJlLAo+ID4KPiA+IEl0J3MgYSBwcm9wZXJ0eSBvZiBoYXJkd2FyZSB0aGF0
IGluZGljYXRlcyB0aGF0IHRoZSBoYXJkd2FyZSBzdXBwb3J0cyBQTVUuCj4KPiBBbGwgUklTQy1W
IGhhcmR3YXJlIHByb3ZpZGVzIHRoZSBDU1JzLCB0aGV54oCZcmUgcGFydCBvZiB0aGUgcHJpdmls
ZWdlZAo+IHNwZWMgYW5kIG5vdCBtYXJrZWQgb3B0aW9uYWwuIEhvdyBtYW55IGFyZW7igJl0IGhh
cmQtd2lyZWQgdG8gemVybyBpcyB1cAo+IHRvIHRoZSBpbXBsZW1lbnRhdGlvbi4gQnV0IGV2ZW4g
dGhlbiB5b3UgY2Fu4oCZdCBrbm93IGZyb20gdGhlIGhhcmR3YXJlCj4gYWxvbmUgd2hhdCBpcyBz
dXBwb3J0ZWQ7IHRoZSBmaXJtd2FyZSBoYXMgdG8gZW5hYmxlIFMtbW9kZSAoYW5kCj4gVS1tb2Rl
KeKAmXMgYWJpbGl0eSB0byByZWFkIHRoZW0sIHNvIHlvdSBjYW7igJl0IGFzc3VtZSBhbnl0aGlu
ZyBpbiBhCj4gc3RhdGljIGRldmljZSB0cmVlIGhhcmQtY29kZWQgaW4gTGludXggYWJvdXQgd2hh
dCBmaXJtd2FyZSBoYXMgZG9uZS4KPiBTaW5jZSB5b3UgY3VycmVudGx5IGhhdmUgdG8gcXVlcnkg
dGhlIGZpcm13YXJlIHRvIGRldGVybWluZSB3aGF04oCZcwo+IGF2YWlsYWJsZSB0byB5b3UgYW55
d2F5LCBJIHNlZSBubyBiZW5lZml0IGZyb20gaGF2aW5nIGEgbm9kZSBpbiB0aGUKPiBkZXZpY2Ug
dHJlZSB0aGF0IHRlbGxzIHlvdSB5b3VyIGZpcm13YXJlICptaWdodCogaGF2ZSBjb3VudGVycyB5
b3UgY2FuCj4gdXNlLgo+Cj4gPiBBZGRpdGlvbmFsbHksIHRoZSBjb3VudGVyIG92ZXJmbG93IGlu
dGVycnVwdCBudW1iZXIgbmVlZHMgdG8gYmUKPiA+IGRlZmluZWQgdGhyb3VnaCB0aGUgRFQgYXMg
d2VsbAo+ID4gc28gdGhhdCBhIGNsZWFuIHBsYXRmb3JtIGRyaXZlciBjYW4gYmUgaW1wbGVtZW50
ZWQuCj4KPiBUaGUgaW50ZXJydXB0IG51bWJlciBpcyBzcGVjaWZpZWQgYXMgMTMgYnkgdGhlIFNz
Y29mbXBmIHNwZWMuCj4gQnV0IHRoYXTigJlzIG5vdCByZWxldmFudCBoZXJlLCB0aGUgRlU3NDAg
cHJlZGF0ZXMgYW5kIGRvZXNu4oCZdCBpbXBsZW1lbnQKPiBTc2NvZm1wZiwgbWVhbmluZyB0aGVy
ZSBpcyBubyBpbnRlcnJ1cHQgdG8gZXZlbiBkZWZpbmUgaGVyZS4gQW5kIGFzIEkKPiBzYWlkIG9u
IHRoZSBvdGhlciBwYXRjaCwgZG9u4oCZdCBjb25mbGF0ZSDigJxTQkkgUE1VIGZpcm13YXJlIGlu
dGVyZmFjZSBpcwo+IHN1cHBvcnRlZOKAnSBhbmQg4oCcU3Njb2ZtcGYgaXMgaW1wbGVtZW50ZWQg
aW4gdGhlIGhhcmR3YXJl4oCdOyB0aGUgZm9ybWVyCj4gc2hvdWxkIGJlIGRpc2NvdmVyZWQgYnkg
dGFsa2luZyB0byBmaXJtd2FyZSwgYW5kIHRoZSBsYXR0ZXIgc2hvdWxkIGJlCj4gZGlzY292ZXJl
ZCBsaWtlIGFueSBvdGhlciBleHRlbnNpb24gKGhvd2V2ZXIgdGhhdCBlbmRzIHVwIGhhcHBlbmlu
ZykuCgpQcmVzZW5jZSBvZiBzc2NvZiBleHRlbnNpb24gY2FuIGJlIGRpc2NvdmVyZWQgdGhyb3Vn
aCBnZW5lcmFsIGV4dGVuc2lvbgpkaXNjb3ZlcnkgbWVjaGFuaXNtIChwcm9iYWJseSBhIHNlcGFy
YXRlIERUIG5vZGUuLnRoYXQncyBhIHNlcGFyYXRlIGRpc2N1c3Npb24pLgoKSG93ZXZlciwgdGhl
IGludGVycnVwdCBudW1iZXIgZGlzY292ZXJ5IGhhcyB0byBiZSB0aHJvdWdoIERUIHNvIHRoZQpw
bGF0Zm9ybSBkcml2ZXIKY2FuIHByb2JlIHRoZSBEVCB0byBmaWd1cmUgb3V0IHRoYXQuCgo+Cj4g
Pj4gc28gaGF2aW5nIHRoaXMgaW4gdGhlIGRldmljZSB0cmVlIHVuZGVyIC9zb2MsIGxldCBhbG9u
ZQo+ID4+IGhhcmQtY29kZWQgaW4gTGludXgsIGlzIHV0dGVybHkgd3JvbmcuIFdoeSBjYW4gdGhp
cyBub3QganVzdCBiZSBwcm9iZWQKPiA+PiBsaWtlIGFueSBvdGhlciBTQkkgaW50ZXJmYWNlPyBU
aGUgIlByb2JlIFNCSSBleHRlbnNpb24iIGludGVyZmFjZSBpcwo+ID4+IHByZWNpc2VseSBmb3Ig
dGhpcyBraW5kIG9mIHRoaW5nLgo+ID4+Cj4gPiBTQkkgZXh0ZW5zaW9uIGlzIGFueXdheXMgcHJv
YmVkIHRvIHZlcmlmeSBpZiB0aGUgZmlybXdhcmUgaGFzIFBNVQo+ID4gZXh0ZW5zaW9uIG9yIG5v
dC4KPiA+IEhvd2V2ZXIsIGFkZGluZyB0aGUgRFQgcHJvcGVydHkgYWxsb3dzIGRpZmZlcmVudCBw
bGF0Zm9ybXMgKHdpdGggb3IKPiA+IHdpdGhvdXQgc3Njb2YgZXh0ZW5zaW9uKQo+ID4gdG8gdXNl
IHRoZSBzYW1lIGNvZGUgcGF0aC4KPgo+IFlvdSBkb27igJl0IG5lZWQgYSBkZXZpY2UgdHJlZSBm
b3IgdGhhdDsgdGhhdCBzYW1lIGNvZGUgcGF0aCBjYW4ganVzdCBiZQo+IOKAnHVzZSB0aGUgZXhp
c3Rpbmcgc3RhbmRhcmQgZmlybXdhcmUgaW50ZXJmYWNl4oCdLiBUaGF0IGFsc28gaGFzIHRoZQo+
IGJlbmVmaXQgdGhhdCBpdOKAmXMgbm90IHRpZWQgdG8gZGV2aWNlIHRyZWUgYW5kIHNvIHdvcmtz
IGlkZW50aWNhbGx5IGZvcgo+IEFDUEksIHJhdGhlciB0aGFuIG5lZWRpbmcgYW4gQUNQSSB2ZXJz
aW9uIG9mIGl0Lgo+CgpJIGRvbid0IGRpc2FncmVlIHdpdGggdGhhdCBhcmd1bWVudC4gSG93ZXZl
ciwgd2UgbmVlZCBhIERUIG5vZGUgZm9yCmludGVycnVwdCBudW1iZXIgYXMgZXhwbGFpbmVkIGlu
IHRoZSBhYm92ZS4KQSBEVCBiYXNlZCBwbGF0Zm9ybSBkcml2ZXIgYWxsb3dzIHVzIHRvIHByb3Zp
ZGUgYSB1bmlmaWVkIGNvZGUgcGF0aAp3aGljaCBjYW4gaGFuZGxlIGJvdGgga2luZHMgb2YgcGxh
dGZvcm1zIGRlc2NyaWJlZCBiZWxvdy4KCjEuIFBsYXRmb3JtcyB3aXRob3V0IHNzY29mIGV4dGVu
c2lvbgoyLiBQbGF0Zm9ybXMgd2l0aCBzc2NvZiBleHRlbnNpb24gdGhhdCByZXF1aXJlcyBhIERU
IG5vZGUgZm9yIGludGVycnVwdCBudW1iZXIKCk90aGVyd2lzZSwgdGhlIGRyaXZlciBoYXMgdG8g
ZG8gdGhlIGZvbGxvd2luZyB0aGluZ3MgaW4gb3JkZXIuCgoxLiBQcm9iZSBQTVUgZXh0ZW5zaW9u
CjIuIGZpcnN0IGNoZWNrIGlmIHNzY29mIGV4dGVuc2lvbiBpcyBwcmVzZW50IGluIHRoZSBzcGVj
aWFsIFJJU0MtViBJU0EKZXh0ZW5zaW9uIERUIG5vZGUgKHdoaWNoIGlzIHlldCB0byBmaW5hbGl6
ZSkKMy4gSWYgc3Njb2YgZXh0ZW5zaW9uIGlzIHByZXNlbnQgdGhlbiByZWdpc3RlciBmb3IgYSBE
VCBiYXNlZCBwbGF0Zm9ybSBkcml2ZXIuCjQuIE90aGVyd2lzZSwgcmVnaXN0ZXIgYSBzaW1wbGUg
cGxhdGZvcm0gZHJpdmVyLgoKSSBhbSBub3QgY29tcGxldGVseSBvcHBvc2VkIHRvIGRvaW5nIHRo
YXQgaWYgdGhlcmUgaXMgYSBzdHJvbmcKdGVjaG5pY2FsIGlzc3VlIHdpdGggdGhlIGN1cnJlbnQg
YXBwcm9hY2guCgo+IEkgc2VlIG5vdGhpbmcgaGVyZSB0aGF0IGNhbuKAmXQgYmUgZGlzY292ZXJl
ZCB0aHJvdWdoIHByZS1leGlzdGluZyBtZWFucy4KPiBJZiBpdCBjYW4gYmUgZGlzY292ZXJlZCB3
aXRob3V0IHVzZSBvZiB0aGUgZGV2aWNlIHRyZWUgdGhlbiBpdCBkb2VzIG5vdAo+IGJlbG9uZyBp
biB0aGUgZGV2aWNlIHRyZWU7IHRoZSBkZXZpY2UgdHJlZSBpcyBwdXJlbHkgZm9yIHRoaW5ncyB0
aGF0Cj4gY2Fubm90IG90aGVyd2lzZSBiZSBkaXNjb3ZlcmVkLgo+Cj4gSmVzcwo+CgoKLS0gClJl
Z2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
