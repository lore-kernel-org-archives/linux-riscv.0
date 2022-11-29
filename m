Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BCDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 20:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVB8yFrVLC32ZGi2BHXNmZq8yydu7VD/4M5u8u2GDqo=; b=qeoNv7Xjf9/eD2
	Gn2lYt4CqHcTf5ZkU7xweqbjSdMrK4k6zKmF4jB60KBLcSg/9QC0UZhvowAa4tSkPyVzbtX6gprJ7
	VitHUoVBmPGF9yqyUTup0e2KiLA5ExrAz6NCq14m4Tva6DPf20FFm2Pr+I4vuWIosPSbKMt+h4Nxu
	ESznAi2/i62Efetl9kkPezn0yFpSalMTmRieKR1QllD2SQ21CuAK5Ob7oGL3xBmGeZMiLVD2Etdo9
	6RJXoOZ3YU8j2PWV4285rVnDh7cBK6dt8cCtxAAPoddx+oV4N42dePwu01IKy+1yAe2yHkqSeGCi3
	QKdrO8iaApd8M4vvkAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p06y3-00BFQN-7m; Tue, 29 Nov 2022 20:12:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p06y0-00BFOm-5F
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 20:12:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id q7so22992985wrr.8
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 12:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJycOauFyZwNNkHDpmb5bRTzGfzIc/uEFnDgjjtmSqg=;
        b=JtVTIPkFidXoYMZIYy6ZCTnvIxeoibz9mFkKieaL/7WWATuGTXYIxwCcfV+0o0jRZ9
         HJNFwd10qdZwfAeZY5VXAnhTDt/tCns29Z9Scc/tp+628w5nFmLn61mo9B62gWXMxGrM
         mJzUSf2tZPv9QPsVutHBHK9HFO4/wofE2c4HRIeSZptEnkd23a1eVMXdeOhNtzGTSnnn
         osZ3S2qwK5TTyHZtZhUm4qyJmS0mKPCOZ9pD3YTwRXUs5fYFKccJJulehpd2kLlufxCu
         1TqOKdSEEepjz1xXnZqWvfdDlng6tMja0jC7otUWMar6zciLOSIFG0W5XNKf90GWTBpL
         /QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJycOauFyZwNNkHDpmb5bRTzGfzIc/uEFnDgjjtmSqg=;
        b=0y7m06PTMiXFhxQseQPSsGjHk+OWBiZ0gTEgXKUtbZ+ZHVguCCgrXpWK+6kiwmNXVo
         mi0Qz1zBo0cTL8oaFZjBgddrbVJVsywVdYCZnvNVxjStX4Q7oV5H2hUB2h6tqkHJnYC6
         Ni/QMUIkib3DGk6a+8iHlkFelv3NR04EYF7p36CGXtxehN0nHHi2aaEwawBui0lGhRhM
         sWymfQ4E5EQykC18V+Qm37QTloOhjdZCOIHzBkEwMZMK+GkS1nVGvrlQScErFDmIXQqf
         tHBBV8bryg3Kce0cU7UTnY8mx8Lk+COJOxT/hdCBwssUROtfNbkvDDaMF/3HqMPrW6Zx
         93pQ==
X-Gm-Message-State: ANoB5pk8YJBSVUG3Z1MRVRlgtB4GiN/Whq4nSkcazUwEJP3rc22VDGjn
	Q8ngCPE6P8vVq0AoCLX5bTXdYQ==
X-Google-Smtp-Source: AA0mqf7cNyk5FdI45IztkswkGYEhDuNk+i5jNaCKp6pu0tDgKWGVjx2bvRX9V3EtyjFkPlLL5KRvhg==
X-Received: by 2002:a5d:6741:0:b0:242:1dbd:2b19 with SMTP id l1-20020a5d6741000000b002421dbd2b19mr5595087wrw.431.1669752746859;
        Tue, 29 Nov 2022 12:12:26 -0800 (PST)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id c12-20020adfed8c000000b00236b2804d79sm14469697wro.2.2022.11.29.12.12.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Nov 2022 12:12:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [QUERY]: Adding support for a platform
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CA+V-a8vT3AjnU1-s0k7ff0Y7WLofpHYnJPF+mKVnUspsrPvQtw@mail.gmail.com>
Date: Tue, 29 Nov 2022 20:12:25 +0000
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 binutils@sourceware.org,
 linux-riscv <linux-riscv@lists.infradead.org>
Message-Id: <4386F399-2862-4161-B303-8080EBEEA374@jrtc27.com>
References: <CA+V-a8uTdiWJSCdbukA1sndHxDXE_VV0Qzara_AQw2s2n6s6Lg@mail.gmail.com>
 <mhng-c2b3d5ca-288f-45b3-97f5-7c532db2e59f@palmer-ri-x1c9a>
 <CA+V-a8vT3AjnU1-s0k7ff0Y7WLofpHYnJPF+mKVnUspsrPvQtw@mail.gmail.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_121232_284986_BAB97D7B 
X-CRM114-Status: GOOD (  26.64  )
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

T24gMjkgTm92IDIwMjIsIGF0IDE5OjI4LCBMYWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5n
Z0BnbWFpbC5jb20+IHdyb3RlOgo+IAo+IEhpIFBhbG1lciwKPiAKPiBPb3BzIEkgc2hvdWxkIGhh
dmUgaW5jbHVkZWQgbGludXgtcmlzY3YgdG8gdGhlIENDIGxpc3QgaGVyZSAoZG9pbmcgaXQgbm93
KQo+IAo+IE9uIFR1ZSwgTm92IDI5LCAyMDIyIGF0IDc6MjAgUE0gUGFsbWVyIERhYmJlbHQgPHBh
bG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4+IAo+PiBPbiBUdWUsIDI5IE5vdiAyMDIyIDExOjE2
OjI5IFBTVCAoLTA4MDApLCBiaW51dGlsc0Bzb3VyY2V3YXJlLm9yZyB3cm90ZToKPj4+IEhpIEFs
bCwKPj4+IAo+Pj4gSWYgdGhpcyBpcyBub3QgdGhlIHJpZ2h0IHBsYWNlIHRvIGFzayB0aGlzIHF1
ZXN0aW9uIHBsZWFzZSBsZXQgbWUga25vdy4KPj4+IAo+Pj4gU28gd2UgaGF2ZSBhIFJJU0NWIHBs
YXRmb3JtIChSZW5lc2FzIFJaL0ZpdmUpIGZvciB3aGljaCB3ZSBuZWVkIHRvCj4+PiBhZGp1c3Qg
dGhlIFRFWFRfU1RBUlRfQUREUi4gU28gYmVsb3cgYXJlIG15IHF1ZXJpZXM6Cj4+PiAqIFdoYXQg
aXMgdGhlIHByb2NlZHVyZSBmb3IgdXBzdHJlYW1pbmc/Cj4+PiAqIEFyZSBwYXRjaGVzIGFjY2Vw
dGVkIGZvciBpbmRpdmlkdWFsIHBsYXRmb3JtcyAoZm9yIGFkanVzdGluZyBURVhUX1NUQVJUX0FE
RFIpPwo+PiAKPj4gSXMgdGhpcyBzdGlsbCByZWxhdGVkIHRvIHRoYXQgYnVnIHdpdGggdGhlIHN0
YXRpYyBiaW5hcmllcyB5b3UnZAo+PiBtZW50aW9uZWQgYmVmb3JlPyAgSSB0aGluayB3ZSdkIHJl
YWxseSBuZWVkIHRvIGZpZ3VyZSBvdXQgdGhlIHJvb3QgY2F1c2UKPj4gYmVmb3JlIHdlIGNhbiBt
YWtlIGEgcmVhc29uZWQgZGVjaXNpb24gaGVyZSwgbXkgZ3Vlc3Mgd291bGQgYmUgdGhhdAo+PiBj
aGFuZ2luZyBURVhUX1NUQVJUX0FERFIganVzdCB3b3JrcyBhcm91bmQgdGhlIHJlYWwgYnVnLgo+
PiAKPiBCZWxvdyBpcyB0aGUgcm9vdCBjYXVzZSBhbmQgdGhlIHNvbHV0aW9uOgo+IAo+IFRFWFRf
U1RBUlRfQUREUiBpcyB0aGUgc3RhcnQgb2YgdGhlIHRleHQgc2VnbWVudCBvZiBhbiBhcHBsaWNh
dGlvbi4KPiBUaGlzIGlzIGJlaW5nIHNldCB0byAweDEwMDAwIGZvciBSSVNDViBwbGF0Zm9ybXMu
Cj4gCj4gU28gd2hlbiBhbiBhcHBsaWNhdGlvbiBpcyBjb21waWxlZCB3aXRoIHRoZSBzdGF0aWMg
ZmxhZyB0aGUgbG9hZCB3b3VsZAo+IHN0YXJ0IGZyb20gMHgxMDAwMCAtIHh5eiAoZGVwZW5kaW5n
IG9uIHNpemUgb2YgdGhlIGFwcGxpY2F0aW9uKQo+IAo+IEVudHJ5IHBvaW50IDB4MTAxYzAKPiBU
aGVyZSBhcmUgNSBwcm9ncmFtIGhlYWRlcnMsIHN0YXJ0aW5nIGF0IG9mZnNldCA2NFByb2dyYW0g
SGVhZGVyczoKPiAgVHlwZSAgICAgICAgICAgT2Zmc2V0ICAgICAgICAgICAgIFZpcnRBZGRyICAg
ICAgICAgICBQaHlzQWRkcgo+ICAgICAgICAgICAgICAgICBGaWxlU2l6ICAgICAgICAgICAgTWVt
U2l6ICAgICAgICAgICAgICBGbGFncyAgQWxpZ24KPiAgTE9BRCAgICAgICAgICAgMHgwMDAwMDAw
MDAwMDAwMDAwIDB4MDAwMDAwMDAwMDAxMDAwMCAweDAwMDAwMDAwMDAwMTAwMDAKPiAgICAgICAg
ICAgICAgICAgMHgwMDAwMDAwMDAwMDU5YjQ4IDB4MDAwMDAwMDAwMDA1OWI0OCAgUiBFICAgIDB4
MTAwMAo+ICBMT0FEICAgICAgICAgICAweDAwMDAwMDAwMDAwNTliNjAgMHgwMDAwMDAwMDAwMDZh
YjYwIDB4MDAwMDAwMDAwMDA2YWI2MAo+ICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwMDFm
NjggMHgwMDAwMDAwMDAwMDAzNTI4ICBSVyAgICAgMHgxMDAwCj4gCj4gU28gZm9yIHRoZSBhYm92
ZSBhcHBsaWNhdGlvbiB3aGljaCBpcyBjb21waWxlZCBzdGF0aWNhbGx5IHdlIGNhbiBzZWUKPiB0
aGUgZW50cnkgcG9pbnQgaXMgMHgxMDFjMCBhbmQgbG9hZCAweDAwMDAwMDAwMDAwMTAwMDAuCj4g
Cj4gQW5kZXMgQVg0NU1QIGNvcmVzIGhhdmUgbG9jYWwgbWVtb3J5IElMTSBhbmQgRExNIHRoYXQg
YXJlIG1hcHBlZCBpbgo+IHRoZSByZWdpb24gSOKAmTBfMDAwM18wMDAwIC0gSOKAmTBfMDAwNF9G
RkZGIG9uIHRoZSBSWi9GaXZlIFNvQy4gV2hlbiB0aGUKPiB2aXJ0dWFsIGFkZHJlc3MgZmFsbHMg
aW4gdGhpcyByYW5nZSB0aGUgTU1VIGRvZXNuJ3QgdHJpZ2dlciBhIHBhZ2UKPiBmYXVsdCBhbmQg
YXNzdW1lcyB0aGUgdmlydHVhbCBhZGRyZXNzIGFzIHBoeXNpY2FsIGFkZHJlc3MgYW5kIGhlbmNl
Cj4gdGhlIGFwcGxpY2F0aW9uIGZhaWxzIHRvIHJ1biAocGFuaWNzIHNvbWV3aGVyZSkuCj4gCj4g
U28gdG8gYXZvaWQgdGhpcyBpc3N1ZSB3ZSBzZXQgdGhlIFRFWFRfU1RBUlRfQUREUiB0byAweDUw
MDAwIHNvIHRoYXQKPiB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIGFueSBzdGF0aWNhbGx5IGNvbXBp
bGVkIGFwcGxpY2F0aW9uIGRvZXMgbm90Cj4gZmFsbCBpbiB0aGUgcmFuZ2Ugb2YgSOKAmTBfMDAw
M18wMDAwIC0gSOKAmTBfMDAwNF9GRkZGLgo+IAo+IEVsZiBmaWxlIHR5cGUgaXMgRVhFQyAoRXhl
Y3V0YWJsZSBmaWxlKQo+IEVudHJ5IHBvaW50IDB4NTA0ZTQKPiBUaGVyZSBhcmUgNSBwcm9ncmFt
IGhlYWRlcnMsIHN0YXJ0aW5nIGF0IG9mZnNldCA2NAo+IAo+IFByb2dyYW0gSGVhZGVyczoKPiAg
VHlwZSAgICAgICAgICAgT2Zmc2V0ICAgICAgICAgICAgIFZpcnRBZGRyICAgICAgICAgICBQaHlz
QWRkcgo+ICAgICAgICAgICAgICAgICBGaWxlU2l6ICAgICAgICAgICAgTWVtU2l6ICAgICAgICAg
ICAgICBGbGFncyAgQWxpZ24KPiAgTE9BRCAgICAgICAgICAgMHgwMDAwMDAwMDAwMDAwMDAwIDB4
MDAwMDAwMDAwMDA1MDAwMCAweDAwMDAwMDAwMDAwNTAwMDAKPiAgICAgICAgICAgICAgICAgMHgw
MDAwMDAwMDAwMDU3ZGM4IDB4MDAwMDAwMDAwMDA1N2RjOCAgUiBFICAgIDB4MTAwMAo+ICBMT0FE
ICAgICAgICAgICAweDAwMDAwMDAwMDAwNTg1YjggMHgwMDAwMDAwMDAwMGE5NWI4IDB4MDAwMDAw
MDAwMDBhOTViOAo+ICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwMDRlZTAgMHgwMDAwMDAw
MDAwMDA2NGIwICBSVyAgICAgMHgxMDAwCj4gIE5PVEUgICAgICAgICAgIDB4MDAwMDAwMDAwMDAw
MDE1OCAweDAwMDAwMDAwMDAwNTAxNTggMHgwMDAwMDAwMDAwMDUwMTU4Cj4gICAgICAgICAgICAg
ICAgIDB4MDAwMDAwMDAwMDAwMDA0NCAweDAwMDAwMDAwMDAwMDAwNDQgIFIgICAgICAweDQKPiAK
PiBTbyBub3cgd2l0aCB0aGUgZml4IGZvciBzdGF0aWNhbGx5IGNvbXBpbGVkIGFwcGxpY2F0aW9u
cyB3ZSBjYW4gc2VlCj4gaXRzIG9mZnNldHRlZCBhbmQgZW50cnkgcG9pbnQgaXMgMHg1MDRlNCBh
bmQgbG9hZCBpcyBhdAo+IDB4MDAwMDAwMDAwMDA1MDAwMC4gU28gd2l0aCB0aGlzIHdlIGFyZSBm
b3Igc3VyZSB0aGUgTU1VIHdpbGwgYWx3YXlzCj4gdHJpZ2dlciBhIHBhZ2UgZmF1bHQuCgpXZWxs
IHRoYXTigJlzIGp1c3QgYSBibGF0YW50IHZpb2xhdGlvbiBvZiB0aGUgc3BlYy4gV2hhdCBoYXBw
ZW5zIGlmIGEKbWFsaWNpb3VzIChvciBidWdneSkgdXNlcnNwYWNlIGJpbmFyeSBnb2VzIGFuZCBh
Y2Nlc3NlcyB1bm1hcHBlZCBtZW1vcnkKaW4gdGhhdCByYW5nZT8gRG9lcyBpdCBhY3R1YWxseSBn
ZXQgYWNjZXNzIHRvIHRoaXMgSUxNL0RMTT8gSWYgc28KdGhhdOKAmXMgYSBnYXBpbmcgc2lkZSBj
aGFubmVsLgoKSmVzcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
