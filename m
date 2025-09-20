Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A27CAC597
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 06:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzVvRcl+MCjlhUP9c9agGEzSl3L6cVCKT2eonueS6Bo=; b=HcDoNdSpoEv3cz
	IVLo4iTSmQcNVAF6I4F2TkWcsgkbIgg1hdSS9EJS8lz48HHWW5aKhrFQ/xKMARo7oay2VAS7I8OiM
	tbj+XbhVaw59BZ0TGBGReUBlWLbk6hENinN5kSzH8wvp+wX1CZ94mUK7CLIXwx2XOXaeZa08xm4U2
	0tYs2bO5JJZJJmDLn/NIicvKFzGayiisqh6Y/lyFw8XDd2QByycaDEiwezgbDRsGE3wdkPeUzaKJc
	wQJ9tLSGJQMziXpED0xa6Jte+cTf7uxtXeH0P7+98Jo95Y1phODG2zSGdHNXGEyAsVWPQ0Zcgw+X0
	yRFm0wBeqLIRm5kEXQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqiL-00000004rDp-39kE;
	Sat, 20 Sep 2025 06:04:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqiK-00000004rDf-2jmd
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 06:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F1BF6019D
	for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 06:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C9BC4CEFB
	for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 06:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758348291;
	bh=bUSo76FiAKZcTtDrgA2WJVYVNUq/3jJzR2LwBGYiPys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E87JIFfuz3gPrA5uk0Fal7g5QdzSXNMElDgzjPwklZSaCjTN0uJGTgxKfHx0qg49I
	 7NYlUWFm4BCurUCakVrCJVYmwCyhh7p8d2r2PPiaLqm2NSyP2k9o0M4MNoC8Eyn452
	 1CMZ8Rd05WCmiqOzbfawckGselSHfwpAdGQio5UBPA4+9rZw3rj2KW6lHTFVEAxgFZ
	 jfu2i+u6bI/WS0zbSLbsyr4wH468Ob1gVGbcZGeBtRbrJ9UxZCihXgG8HwLEp2kG0W
	 sVfBVbY5CSLIVNGvg4Grn+2+6bX1zTdgCfkqE5ZfWJAMjIBvC/WOaoCgHjSoe0Oabn
	 1/laTrDP+tAog==
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so974211f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 23:04:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6MoVBUfCxYGzCh7UwiuLyk9a/HpgwlEdTLTNpynq6FWX5KTjtqVFBqa0hLC4n6GxHcr2QdBU211t2gw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfn+nF9NK8LANsWNkzhUKeaFMiNEA/nUwxcEGJN3h0kCFF8Yc3
	L0beuK3EfkZQ11clqaZOLz6u94Lj+wGU2swXxrY6Pl4uic4nyZ2Ns3CHJdkkoLmZd99SDGdBPNC
	NQ08gf613DSakrTKT3x8pG+eHSPWC404=
X-Google-Smtp-Source: AGHT+IHVBstz0hyh2FjBGMmeldYqXqfklk1YzzcXGWCTr4A8BwrONyFaN+09clPKxJqBQbjEB4/rMmOa8D3VMOosbR4=
X-Received: by 2002:a05:6000:3109:b0:3ec:4fe:880 with SMTP id
 ffacd0b85a97d-3ee7c552822mr4209207f8f.1.1758348290125; Fri, 19 Sep 2025
 23:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
 <aLciY2putG8g2P9F@andrea> <aMoyntAydNMtcl+3@gmail.com> <aMw3504EwlnDOJI0@gmail.com>
 <CAPYmKFt=5=t_nxY4FadG0_vSgAu1tXyO15OCvo5x6QorqM+BAw@mail.gmail.com>
In-Reply-To: <CAPYmKFt=5=t_nxY4FadG0_vSgAu1tXyO15OCvo5x6QorqM+BAw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 20 Sep 2025 14:04:38 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRpnaL=K=qGLntG77X61n=Bc011Rq+6045D_HF_raeYYA@mail.gmail.com>
X-Gm-Features: AS18NWBczq_ysm8InHadaqF1t8jSqDooIQYfRrTjuTn5kR1Hlb7xDVelX9zqbVA
Message-ID: <CAJF2gTRpnaL=K=qGLntG77X61n=Bc011Rq+6045D_HF_raeYYA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 0/4] riscv: Add Zalasr ISA extension support
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Andrea Parri <parri.andrea@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com, 
	brs@rivosinc.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
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

T24gRnJpLCBTZXAgMTksIDIwMjUgYXQgMTE6MTjigK9BTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBHdW8gUmVuLAo+Cj4gVGhhbmtzIGZvciB5b3VyIGFk
dmljZS4KPgo+IE9uIEZyaSwgU2VwIDE5LCAyMDI1IGF0IDEyOjQ44oCvQU0gR3VvIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgU2VwIDE3LCAyMDI1IGF0IDEy
OjAxOjM0QU0gLTA0MDAsIEd1byBSZW4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgU2VwIDAyLCAyMDI1
IGF0IDA2OjU5OjE1UE0gKzAyMDAsIEFuZHJlYSBQYXJyaSB3cm90ZToKPiA+ID4gPiA+IFh1IEx1
ICg0KToKPiA+ID4gPiA+ICAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNpbmcgZm9yIFph
bGFzcgo+ID4gPiA+ID4gICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBaYWxhc3IgSVNBIGV4dGVu
c2lvbiBkZXNjcmlwdGlvbgo+ID4gPiA+ID4gICByaXNjdjogSW5zdHJvZHVjZSBaYWxhc3IgaW5z
dHJ1Y3Rpb25zCj4gPiA+ID4gPiAgIHJpc2N2OiBVc2UgWmFsYXNyIGZvciBzbXBfbG9hZF9hY3F1
aXJlL3NtcF9zdG9yZV9yZWxlYXNlCj4gPiA+ID4KPiA+ID4gPiBJbmZvcm1hbGx5IHB1dCwgb3Vy
IChMaW51eCkgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVsIHNwZWNpZmllcyB0aGF0IGFueQo+ID4g
PiA+IHNlcXVlbmNlCj4gPiA+ID4KPiA+ID4gPiAgIHNwaW5fdW5sb2NrKHMpOwo+ID4gPiA+ICAg
c3Bpbl9sb2NrKHQpOwo+ID4gPiA+Cj4gPiA+ID4gYmVoYXZlcyAiYXMgaXQgcHJvdmlkZXMgYXQg
bGVhc3QgRkVOQ0UuVFNPIG9yZGVyaW5nIGJldHdlZW4gb3BlcmF0aW9ucwo+ID4gPiA+IHdoaWNo
IHByZWNlZGUgdGhlIFVOTE9DSytMT0NLIHNlcXVlbmNlIGFuZCBvcGVyYXRpb25zIHdoaWNoIGZv
bGxvdyB0aGUKPiA+ID4gPiBzZXF1ZW5jZSIuICBVbmxlc3MgSSBtaXNzaW5nIHNvbWV0aGluZywg
dGhlIHBhdGNoIHNldCBpbiBxdWVzdGlvbiBicmVha3MKPiA+ID4gPiBzdWNoIG9yZGVyaW5nIHBy
b3BlcnR5IChvbiBSSVNDLVYpOiBmb3IgZXhhbXBsZSwgYSAicmVsZWFzZSIgYW5ub3RhdGlvbiwK
PiA+ID4gPiAuUkwgKGFzIGluIHNwaW5fdW5sb2NrKCkgLT4gc21wX3N0b3JlX3JlbGVhc2UoKSwg
YWZ0ZXIgcGF0Y2ggIzQpIHBhaXJlZAo+ID4gPiA+IHdpdGggYW4gImFjcXVpcmUiIGZlbmNlLCBG
RU5DRSBSLFJXIChhcyBjb3VsZCBiZSBmb3VuZCBpbiBzcGluX2xvY2soKSAtPgo+ID4gPiA+IGF0
b21pY190cnlfY21weGNoZ19hY3F1aXJlKCkpIGRvIG5vdCBwcm92aWRlIHRoZSBzcGVjaWZpZWQg
cHJvcGVydHkuCj4gPiA+ID4KPiA+ID4gPiBJIF90aGluayBzb21lIHNvbHV0aW9ucyB0byB0aGUg
aXNzdWUgYWJvdmUgaW5jbHVkZToKPiA+ID4gPgo+ID4gPiA+ICBhKSBtYWtlIHN1cmUgYW4gLlJM
IGFubm90YXRpb24gaXMgYWx3YXlzIHBhaXJlZCB3aXRoIGFuIC5BUSBhbm5vdGF0aW9uCj4gPiA+
ID4gICAgIGFuZCB2aWNldmVyc2EgYW4gLkFRIGFubm90YXRpb24gaXMgcGFpcmVkIHdpdGggYW4g
LlJMIGFubm90YXRpb24KPiA+ID4gPiAgICAgKHRoaXMgYXBwcm9hY2ggbWF0Y2hlcyB0aGUgY3Vy
cmVudCBhcm02NCBhcHByb2FjaC9pbXBsZW1lbnRhdGlvbik7Cj4gPiA+ID4KPiA+ID4gPiAgYikg
b24gdGhlIG9wcG9zaXRlIGRpcmVjdGlvbiwgYWx3YXlzIHBhaXIgRkVOQ0UgUixSVyAob3Igb2Nj
YXNpb25hbGx5Cj4gPiA+ID4gICAgIEZFTkNFIFIsUikgd2l0aCBGRU5DRSBSVyxXICh0aGlzIG1h
dGNoZXMgdGhlIGN1cnJlbnQgYXBwcm9hY2gvdGhlCj4gPiA+ID4gICAgIGN1cnJlbnQgaW1wbGVt
ZW50YXRpb24gd2l0aGluIHJpc2N2KTsKPiA+ID4gPgo+ID4gPiA+ICBjKSBtaXggdGhlIHByZXZp
b3VzIHR3byBzb2x1dGlvbnMgKHJlc3AuLCBhbm5vdGF0aW9ucyBhbmQgZmVuY2VzKSwgYnV0Cj4g
PiA+ID4gICAgIG1ha2Ugc3VyZSB0byAidXBncmFkZSIgYW55IHJlbGVhc2VzIHRvIHByb3ZpZGUg
KGluc2VydCkgYSBGRU5DRS5UU08uCj4gPiA+IEkgcHJlZmVyIG9wdGlvbiBjKSBhdCBmaXJzdCwg
aXQgaGFzIGZld2VyIG1vZGlmaWNhdGlvbiBhbmQgaW5mbHVlbmNlLgo+ID4gQW5vdGhlciByZWFz
b24gaXMgdGhhdCBzdG9yZS1yZWxlYXNlLXRvLWxvYWQtYWNxdWlyZSB3b3VsZCBnaXZlIG91dCBh
Cj4gPiBGRU5DRSBydywgcncgYWNjb3JkaW5nIHRvIFJWV01PIFBQTyA3dGggcnVsZSBpbnN0ZWFk
IG9mIEZFTkNFLlRTTywgd2hpY2gKPiA+IGlzIHN0cmljdGVyIHRoYW4gdGhlIExpbnV4IHJlcXVp
cmVtZW50IHlvdSd2ZSBtZW50aW9uZWQuCj4KPiBUaGUgZXhpc3RpbmcgaW1wbGVtZW50YXRpb24g
b2Ygc3Bpbl91bmxvY2ssIHdoZW4gZm9sbG93ZWQgYnkKPiBzcGluX2xvY2ssIGlzIGVxdWFsIHRv
ICdGRU5DRSBydywgcncnIGZvciBvcGVyYXRpb25zIGJlZm9yZQpZZXMsIGl0J3MgYWxzbyBzdHJp
Y3RlciB0aGFuIG9wdGlvbiBjKSwgdGhlIHNhbWUgYXMgIi5STC0+LkFRIiBzZXF1ZW5jZS4KCllv
dSBnaXZlIG91dCBhbm90aGVyIHJlYXNvbiBmb3Igb3B0aW9uIGMpLgoKPiBzcGluX3VubG9jawo+
ICBhbmQgYWZ0ZXIgc3Bpbl9sb2NrOgo+Cj4gc3Bpbl91bmxvY2s6Cj4gICAgIGZlbmNlIHJ3LCB3
Cj4gICAgIHNkCj4gc3Bpbl9sb2NrOgo+ICAgICBhbW9jYXMKPiAgICAgZmVuY2UgciwgcncKPgo+
IFRoZSBzdG9yZS1yZWxlYXNlIHNlbWFudGljcyBpbiBzcGluX3VubG9jaywgaXMgdXNlZCB0byBl
bnN1cmUgdGhhdAo+IHdoZW4gdGhlIG90aGVyIGNvcmVzIGNhbiB3YXRjaCB0aGUgc3RvcmUsIHRo
ZXkgbXVzdCBhbHNvIHdhdGNoIHRoZQo+IG9wZXJhdGlvbnMgYmVmb3JlIHRoZSBzdG9yZSwgd2hp
Y2ggaXMgYSBtb3JlIGNvbW1vbiBjYXNlIHRoYW4gY2FsbGluZwo+IHNwaW5fdW5sb2NrIGltbWVk
aWF0ZWx5IGZvbGxvd2VkIGJ5IHNwaW5fbG9jayBvbiB0aGUgc2FtZSBjb3JlLiBBbmQKPiB0aGUg
ZXhpc3RpbmcgaW1wbGVtZW50YXRpb24gJ2ZlbmNlIHJ3LCB3JyAnZmVuY2UgciwgcncnIGlzIHN0
cmljdGVyCj4gdGhhbiAnLmFxJyAnLnJsJy4gVGhhdCBpcyB3aHkgd2Ugd2FudCB0byBtb2RpZnkg
aXQuCj4KPiBJIGhhdmUgcmVpbXBsZW1lbnRlZCB0aGUgY29kZSBhbmQgaXQgbm93IGxvb2tzIGxp
a2UgdGhlIGF0dGFjaGVkIHRleHQKPiBmaWxlLiBJIHdpbGwgc2VuZCB0aGUgcGF0Y2ggb3V0IGxh
dGVyLgo+Cj4gQmVzdCBSZWdhcmRzLgo+Cj4gWHUgTHUKPgo+ID4KPiA+ID4KPiA+ID4gYXNtIHZv
bGF0aWxlKEFMVEVSTkFUSVZFKCJmZW5jZSBydywgdztcdFxuc2IgJTAsIDAoJTEpXHRcbiIsICBc
Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIFNCX1JMKCUwLCAlMSkgIlx0XG5ub3BcdFxu
IiwgICAgICAgICAgXAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBTQl9STCglMCwgJTEp
ICJcdFxuIGZlbmNlLnRzbztcdFxuIiwgIFwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
MCwgUklTQ1ZfSVNBX0VYVF9aQUxBU1IsIDEpICAgICAgICAgICBcCj4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIDogOiAiciIgKHYpLCAiciIgKHApIDogIm1lbW9yeSIpOyAgICAgXAo+ID4g
Pgo+ID4gPiBJIGRpZG4ndCBvYmplY3Qgb3B0aW9uIGEpLCBhbmQgSSB0aGluayBpdCBjb3VsZCBi
ZSBkb25lIGluIHRoZSBmdXR1cmUuCj4gPiA+IEFjcXVpcmUgWmFsYXNyIGV4dGVuc2lvbiBzdGVw
IGJ5IHN0ZXAuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAoYSkgd291bGQgYWxpZ24gUklTQy1WIGFu
ZCBBUk02NCAod2hpY2ggaXMgYSBnb29kIHRoaW5nIElNTyksIHRob3VnaCBpdAo+ID4gPiA+IGlz
IHByb2JhYmx5IHRoZSBtb3N0IGludmFzaXZlIGFwcHJvYWNoIGFtb25nIHRoZSB0aHJlZSBhcHBy
b2FjaGVzIGFib3ZlCj4gPiA+ID4gKHJlcXVpcmluZyBjZXJ0YWluIGNoYW5nZXMgdG8gYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS97Y21weGNoZyxhdG9taWN9LmgsCj4gPiA+ID4gd2hpY2ggYXJlIGFs
cmVhZHkgcmVsYXRpdmVseSBtZXNzeSBkdWUgdG8gdGhlIHZhcmlvdXMgWkFCSEEgcGx1cyBaQUNB
Uwo+ID4gPiA+IHN3aXRjaGVzKS4gIE92ZXJhbGwsIEknbSBub3QgdG9vIGV4aXRlZCBhdCB0aGUg
aWRlYSBvZiByZXZpZXdpbmcgYW55IG9mCj4gPiA+ID4gdGhvc2UgY2hhbmdlcywgYnV0IGlmIHRo
ZSBjb21tdW5pdHkgb3B0cyBmb3IgaXQsIEknbGwgYWxtb3N0IGRlZmluaXRlbHkKPiA+ID4gPiB0
YWtlIGEgY2xvc2VyIGxvb2sgd2l0aCBkdWUgY2FsbS4gIDstKQo+ID4gPiA+Cj4gPiA+ID4gICBB
bmRyZWEKPiA+ID4gPgo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiA+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiA+ID4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiA+ID4gPgo+ID4gPgo+ID4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cj4gPiA+CgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
