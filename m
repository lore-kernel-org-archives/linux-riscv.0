Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B03C7618E
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Apr 2023 07:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+574w6FeZPoil2a/RbEQgTEVBjHmzBlUXADq+vR8cLc=; b=NDfRjdvkVgWGXi
	r184ra5fFzTVsd3jAd5CXoIeOH2yQst1qi4YIfGm2iTBCYog6sl620RK9cHgphLjCwrOJw+6MWCU4
	5rBKfle8K3lN8vCuHMDrcDV6WIct0ag2YC+qRJzWN+cCU0sgeCYyb3FFaqbdvU9c9BeLg3XCjaOtf
	MBrei34Do/0SAZ72jcahxDT/g2GCLfdyDrUSAjYX4MpPyFEfbXrNoqyAmPgI3jrGPXw9n9NcrauUv
	yjBnHECvBMoaeqANGuLZw84gSlvP3A+e6KHy9I2htEijSr8xYhzha0PPFdyuVY86Cad0ZT4I734s4
	CbuwJku9buqHwtvYAZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pq7eq-00CV6S-1L;
	Sat, 22 Apr 2023 07:27:44 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pq7em-00CV5X-1W
	for linux-riscv@lists.infradead.org;
	Sat, 22 Apr 2023 07:27:42 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-506b20efd4cso4186754a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 22 Apr 2023 00:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1682148456; x=1684740456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhkFmfxnytE5muWdXVkGlZ2Sbu4thV49OIL2hGsAGJ4=;
        b=v/jUOM468Q3Udb2zDHspkAZ0P75nb8w6TpDFxGk4rhImYmvSHJDBcxuyZcS3+ESER/
         THWgYBsYV0m1uuJmRjKPdF4G/wMZerD6J93QRiQ6R/Gveav2d2tLV40BYUvc/bIaPbVR
         VswSJpUlN5dOhoYVWK2QWid8uSgXxENQdAiyVIpCP2wYJRHqQQXk9JthJLhwMr9fmoHO
         91YXeS5yXkoNgQzg8drLIOaqMG6Uk6pNKOGerO83T5yek8vop1CQAed6zX1NUApHY1ZI
         vn1OQh0WsElscVIQp7P87mCVunSc8mwwLSIYu8lzS3K2/Z6hmgcIA/HQf9FXDS0ypoyP
         /Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682148456; x=1684740456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhkFmfxnytE5muWdXVkGlZ2Sbu4thV49OIL2hGsAGJ4=;
        b=KkCa8RgcoD5BuigL0MYm8ry27WNefyNJrYCDs01QL3etLIVyJ/9Rl20N/FE/fhh3ZI
         EZH6DiBo6Akw8A0rPYwRV1iog3RgdVn3HKoxZkpxHhsZ9rHXXGmpGUCihTXkKRdayAnW
         m/m1By6gvj0Q6KPiCmHUFtZqH32rOb49G3s0jyNNsu8Bz2jXWC+7PUErYnrKRvNiG7iN
         +yQWQry+BA97d49i32mF9B4bRQ5OA4iJRa/c8m+Bee8t2xzHdJcaCb13lneVBlrYeqMT
         i6L3j+ZQ/8gBG82UIdA/UGu9LVY2iSKJgFUCdtxw3Pif+97EFrkCKSOLh5rEeTz7PYsq
         afuw==
X-Gm-Message-State: AAQBX9cyT624PRCk1iEhaW0T6Alj7ZPuQSZkkuux7KBG3V2anl4yyWxE
	rW4uteENE0MmMqQ7cRJooZxmC/pLADYjL96tMSvxkQ==
X-Google-Smtp-Source: AKy350bZDJGQjnrdUmB/xDz0wvEUG3fcoWed32w28NI+3771o1OkNFOccJYt49HOVd/UyLUsrwYnNBEDGF4iQOVihKo=
X-Received: by 2002:a17:906:269b:b0:94e:4fe5:613a with SMTP id
 t27-20020a170906269b00b0094e4fe5613amr4776175ejc.25.1682148456024; Sat, 22
 Apr 2023 00:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
 <CABgObfbPB2NYwDLHnQSW0gtw0AX96KbeNOQsszw0NqytObyfaQ@mail.gmail.com>
In-Reply-To: <CABgObfbPB2NYwDLHnQSW0gtw0AX96KbeNOQsszw0NqytObyfaQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 22 Apr 2023 12:57:23 +0530
Message-ID: <CAAhSdy2ywoeXG9At+9FoHmjmUM-Zjuz5L1a23fo00UxkQH_RLQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.4
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230422_002740_767051_CFBC28E4 
X-CRM114-Status: GOOD (  30.53  )
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

SGkgUGFvbG8sCgpPbiBTYXQsIEFwciAyMiwgMjAyMyBhdCA1OjA54oCvQU0gUGFvbG8gQm9uemlu
aSA8cGJvbnppbmlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gd2hpbGUgeW91
IGRpZCBmaXggdGhlIGJ1ZyB0aGF0IGNhdXNlZCB0aGUgbWFpbGluZyBsaXN0IGRhdGUgdG8KPiBk
aXNhcHBlYXIsIEkgbm90aWNlZCB0aGF0IHRoZXNlIHBhdGNoZXMgaGF2ZSBiZWVuIF9hcHBsaWVk
XyAobm90IGp1c3QKPiByZWJhc2VkKSBlYXJsaWVyIHRvZGF5LCBqdXN0IGEgZmV3IGhvdXJzIGJl
Zm9yZSBzZW5kaW5nIHRoZSBwdWxsCj4gcmVxdWVzdC4KPgo+IFRoZSBwdWxsIHJlcXVlc3Qgd2Fz
IHNlbnQgYXJvdW5kIG1pZG5pZ2h0LCBJbmRpYW4gdGltZSwgd2hpbGUgdGhlCj4gcGF0Y2hlcyB3
ZXJlIGFwcGxpZWQgYXJvdW5kIDUtNnBtLiBJICByZWNvZ25pemVkIHRoYXQgdGhpcyBpcyBub3Qg
YQo+IHJlYmFzZSBiZWNhdXNlIHRoZSBjb21taXQgZGF0ZXMgYXJlIGdyb3VwZWQgYWNjb3JkaW5n
IHRvIHRoZSB0b3BpY3NMCj4KPiAxNzozODo0MCArMDUzMCBLVk06IFJJU0MtVjogUmV0cnkgZmF1
bHQgaWYgdm1hX2xvb2t1cCgpIHJlc3VsdHMgYmVjb21lIGludmFsaWQKPiAxNzozODo0MiArMDUz
MCBSSVNDLVY6IEtWTTogQWxwaGFiZXRpemUgc2VsZWN0cwo+IDE3OjM4OjQ0ICswNTMwIFJJU0Mt
VjogS1ZNOiBBZGQgT05FX1JFRyBpbnRlcmZhY2UgdG8gZW5hYmxlL2Rpc2FibGUKPiBTQkkgZXh0
ZW5zaW9ucwo+IDE3OjM4OjQ2ICswNTMwIFJJU0MtVjogS1ZNOiBBbGxvdyBaYmIgZXh0ZW5zaW9u
IGZvciBHdWVzdC9WTQo+Cj4gMTc6NDU6MzkgKzA1MzAgUklTQy1WOiBBZGQgQUlBIHJlbGF0ZWQg
Q1NSIGRlZmluZXMKPiAxNzo0NTo0MiArMDUzMCBSSVNDLVY6IERldGVjdCBBSUEgQ1NScyBmcm9t
IElTQSBzdHJpbmcKPiAxNzo0NTo0NCArMDUzMCBSSVNDLVY6IEtWTTogRHJvcCB0aGUgX01BU0sg
c3VmZml4IGZyb20gaGdhdHAuVk1JRCBtYXNrIGRlZmluZXMKPiAxNzo0NTo0OCArMDUzMCBSSVND
LVY6IEtWTTogSW5pdGlhbCBza2VsZXRhbCBzdXBwb3J0IGZvciBBSUEKPiAxNzo0NTo1MSArMDUz
MCBSSVNDLVY6IEtWTTogSW1wbGVtZW50IHN1YnR5cGUgZm9yIENTUiBPTkVfUkVHIGludGVyZmFj
ZQo+IDE3OjQ1OjU0ICswNTMwIFJJU0MtVjogS1ZNOiBBZGQgT05FX1JFRyBpbnRlcmZhY2UgZm9y
IEFJQSBDU1JzCj4gMTc6NDU6NTggKzA1MzAgUklTQy1WOiBLVk06IFVzZSBiaXRtYXAgZm9yIGly
cXNfcGVuZGluZyBhbmQgaXJxc19wZW5kaW5nX21hc2sKPgo+IDE4OjEwOjI3IDIwMjMgKzA1MzAg
UklTQy1WOiBLVk06IFZpcnR1YWxpemUgcGVyLUhBUlQgQUlBIENTUnMKClRoaXMgd2FzIGJlY2F1
c2UgSSB3YXMgd2FpdGluZyBmb3IgQUNLIGluIG9uZSBvZiB0aGUgQUlBIHBhdGNoZXMKd2hpY2gg
SSByZWNlaXZlZCBqdXN0IGEgZmV3IGRheXMgYWdvLgoKPgo+IFdoYXQgdGhpcyBtZWFucywgaXMg
dGhhdCB0aGVyZSBpcyBubyB3YXkgdGhhdCB0aGVzZSBwYXRjaGVzIGhhdmUgYmVlbgo+IHRlc3Rl
ZCBieSBhbnlvbmUgZXhjZXB0IHlvdS4gUGxlYXNlIHRyeSB0byBwdXNoIHRvIHRoZSBrdm0tcmlz
Y3YvbmV4dAo+IGJyYW5jaCBhcyBzb29uIGFzIHBhdGNoZXMgYXJlIHJlYWR5LCBzaW5jZSB0aGF0
IG1ha2VzIGl0IGVhc2llciB0bwo+IHNwb3QgY29uZmxpY3RzIGJldHdlZW4gYXJjaGl0ZWN0dXJl
cy4KClN1cmUsIEkgd2lsbCBwdXNoIHRvIHJpc2N2X2t2bV9uZXh0IGJyYW5jaCBhcyBzb29uIGFz
IHBhdGNoZXMgYXJlCmFjY2VwdGVkIG9yIHF1ZXVlZC4KCj4KPiBJbiBmYWN0LCBzaW5jZSBSSVND
LVYgaXMgc3RpbGwgcHJldHR5IHNtYWxsLCBmZWVsIGZyZWUgdG8gc2VuZCBtZSBwdWxsCj4gcmVx
dWVzdHMgZXZlbiBlYXJseSBpbiB0aGUgZGV2ZWxvcG1lbnQgcGVyaW9kLCBhcyBzb29uIGFzIHNv
bWUgcGF0Y2hlcwo+IGFyZSByZWFkeS4KClN1cmUsIHRoaXMgc291bmRzIGdvb2QgdG8gbWUuCgpS
ZWdhcmRzLApBbnVwCgo+Cj4gUGFvbG8KPgo+IE9uIEZyaSwgQXByIDIxLCAyMDIzIGF0IDc6MzTi
gK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBQ
YW9sbywKPiA+Cj4gPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcgS1ZNIFJJU0MtViBjaGFuZ2VzIGZv
ciA2LjQ6Cj4gPiAxKSBPTkVfUkVHIGludGVyZmFjZSB0byBlbmFibGUvZGlzYWJsZSBTQkkgZXh0
ZW5zaW9ucwo+ID4gMikgWmJiIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPiA+IDMpIEFJQSBDU1Ig
dmlydHVhbGl6YXRpb24KPiA+IDQpIEZldyBtaW5vciBjbGVhbnVwcyBhbmQgZml4ZXMKPiA+Cj4g
PiBQbGVhc2UgcHVsbC4KPiA+Cj4gPiBQbGVhc2Ugbm90ZSB0aGF0IHRoZSBaaWNib3ogc2VyaWVz
IGhhcyBiZWVuIHRha2VuIGJ5Cj4gPiBQYWxtZXIgdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUgd2hp
Y2ggcmVzdWx0cyBpbiBmZXcKPiA+IG1pbm9yIGNvbmZsaWN0cyBpbiB0aGUgZm9sbG93aW5nIGZp
bGVzOgo+ID4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+IGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gPiBhcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4K
PiA+IEkgYW0gbm90IHN1cmUgaWYgYSBzaGFyZWQgdGFnIGNhbiBtYWtlIHRoaW5ncyBlYXN5Cj4g
PiBmb3IgeW91IG9yIFBhbG1lci4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+ID4KPiA+IFRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNmE4ZjU3YWUyZWIwN2FiMzlhNmYwY2Nh
ZDYwYzc2MDc0MzA1MTAyNjoKPiA+Cj4gPiAgIExpbnV4IDYuMy1yYzcgKDIwMjMtMDQtMTYgMTU6
MjM6NTMgLTA3MDApCj4gPgo+ID4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6Cj4gPgo+ID4gICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0YWdz
L2t2bS1yaXNjdi02LjQtMQo+ID4KPiA+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAy
ZjRkNThmNzYzNWFlYzAxNDQyOGU3M2VmNjEyMGM0ZDAzNzdjNDMwOgo+ID4KPiA+ICAgUklTQy1W
OiBLVk06IFZpcnR1YWxpemUgcGVyLUhBUlQgQUlBIENTUnMgKDIwMjMtMDQtMjEgMTg6MTA6Mjcg
KzA1MzApCj4gPgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gS1ZNL3Jpc2N2IGNoYW5nZXMgZm9yIDYuNAo+ID4K
PiA+IC0gT05FX1JFRyBpbnRlcmZhY2UgdG8gZW5hYmxlL2Rpc2FibGUgU0JJIGV4dGVuc2lvbnMK
PiA+IC0gWmJiIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPiA+IC0gQUlBIENTUiB2aXJ0dWFsaXph
dGlvbgo+ID4KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IEFuZHJldyBKb25lcyAoMSk6Cj4gPiAgICAgICBSSVND
LVY6IEtWTTogQWxwaGFiZXRpemUgc2VsZWN0cwo+ID4KPiA+IEFudXAgUGF0ZWwgKDEwKToKPiA+
ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQgT05FX1JFRyBpbnRlcmZhY2UgdG8gZW5hYmxlL2Rpc2Fi
bGUgU0JJIGV4dGVuc2lvbnMKPiA+ICAgICAgIFJJU0MtVjogS1ZNOiBBbGxvdyBaYmIgZXh0ZW5z
aW9uIGZvciBHdWVzdC9WTQo+ID4gICAgICAgUklTQy1WOiBBZGQgQUlBIHJlbGF0ZWQgQ1NSIGRl
ZmluZXMKPiA+ICAgICAgIFJJU0MtVjogRGV0ZWN0IEFJQSBDU1JzIGZyb20gSVNBIHN0cmluZwo+
ID4gICAgICAgUklTQy1WOiBLVk06IERyb3AgdGhlIF9NQVNLIHN1ZmZpeCBmcm9tIGhnYXRwLlZN
SUQgbWFzayBkZWZpbmVzCj4gPiAgICAgICBSSVNDLVY6IEtWTTogSW5pdGlhbCBza2VsZXRhbCBz
dXBwb3J0IGZvciBBSUEKPiA+ICAgICAgIFJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgc3VidHlwZSBm
b3IgQ1NSIE9ORV9SRUcgaW50ZXJmYWNlCj4gPiAgICAgICBSSVNDLVY6IEtWTTogQWRkIE9ORV9S
RUcgaW50ZXJmYWNlIGZvciBBSUEgQ1NScwo+ID4gICAgICAgUklTQy1WOiBLVk06IFVzZSBiaXRt
YXAgZm9yIGlycXNfcGVuZGluZyBhbmQgaXJxc19wZW5kaW5nX21hc2sKPiA+ICAgICAgIFJJU0Mt
VjogS1ZNOiBWaXJ0dWFsaXplIHBlci1IQVJUIEFJQSBDU1JzCj4gPgo+ID4gRGF2aWQgTWF0bGFj
ayAoMSk6Cj4gPiAgICAgICBLVk06IFJJU0MtVjogUmV0cnkgZmF1bHQgaWYgdm1hX2xvb2t1cCgp
IHJlc3VsdHMgYmVjb21lIGludmFsaWQKPiA+Cj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
c3IuaCAgICAgICAgICB8IDEwNyArKysrKysrKystCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oICAgICAgICB8ICAgOCArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
YWlhLmggICAgICB8IDEyNyArKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaCAgICAgfCAgMTQgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92
Y3B1X3NiaS5oIHwgICA4ICstCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
ICAgICB8ICA1MSArKysrLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jICAgICAgICAgICAg
ICAgfCAgIDIgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAgfCAg
IDIgKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL0tjb25maWcgICAgICAgICAgICAgICAgfCAgMTAgKy0K
PiA+ICBhcmNoL3Jpc2N2L2t2bS9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsKPiA+ICBh
cmNoL3Jpc2N2L2t2bS9haWEuYyAgICAgICAgICAgICAgICAgIHwgMzg4ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgICAgICAgICAg
ICAgICAgIHwgIDIyICstCj4gPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAgICAgICAgICAgICAg
ICB8ICAyOCArKy0KPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgICAgIHwg
MTk0ICsrKysrKysrKysrKystLS0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMgICAg
ICAgICAgICB8ICAgMSArCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAg
ICB8IDI0NyArKysrKysrKysrKysrKysrKysrKy0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmlfYmFzZS5jICAgICAgICB8ICAgMiArLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZtLmMgICAgICAg
ICAgICAgICAgICAgfCAgIDQgKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZtaWQuYyAgICAgICAgICAg
ICAgICAgfCAgIDQgKy0KPiA+ICAxOSBmaWxlcyBjaGFuZ2VkLCAxMTI5IGluc2VydGlvbnMoKyks
IDkxIGRlbGV0aW9ucygtKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV9haWEuaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS9h
aWEuYwo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
