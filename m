Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACDAD2CE12
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 17:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Il5FbogtEpzbpZE+zf/hGZceqES8X6xF+nYCU0LaQiM=; b=IAv1aYfPVCIB3f
	wtrRQOJoonOICXknY5zNcEjZn1JL7h3EFjRQeD7TNGBkykqOXDkW8B56aBtoI32og2W1lqQtJy87k
	6AXfQ4en1qiaBnMy0G3wUVTrc5lDgAQAH8VNISAogBKDS6/mi/VccrSHecO6qtivzh6vN+4bO7pij
	9cJXNKOwv9nXvtXNp2XPX+WKsuynJm27/p0/La1Eow3E09KwMXlmwS8ihFQ6R3qQMQGufIpDARtbp
	3psi0ecqAH0WE6Am9fPZjT3SJIGQ/iuESAXSV1MYdzgxM8uUMaGlxA6kWP2TkER0tr0pFn0OaEGX3
	/0/qx8Am8wpN+nhqU+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3J41-0000000BjZS-3Cug;
	Tue, 22 Oct 2024 17:53:01 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Iyb-0000000BiU0-3L3I
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 17:47:27 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so4423390a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729619244; x=1730224044; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ddUMQ7YsPimbk4F7Nb5pyH2YBrKesDZgI8kYiDJ2Fc=;
        b=Kt0x9P5jRCGR8CCrBt1s9Z55KVBEIhrQ+bkgTmq+GkME1c30t4UYHoMIKqwpY7So5e
         l8Y5n+U82KFbuoj/9vS7l1YzKlalqCgo0ArJs8bqvvZa4fqvHweLx6clBlPEby8uIn3R
         hhVfR1wN0xxBI4zbxnLSPPaw/GAzh7owuIyn7wvQi+I95ovLaN4x9wLJR77YvjzNp8BM
         umwC4BuACak6tcTVrsmqH5SmMRg6jBw434rIG5y54uCQGokPkGphCbGRRZy90+tuWACT
         FvOlDVhiYBgdLCcubnpbH80+MCnKsR6fCT2HuVlQ9vmdyuGbINBN4pseRw9kwrvpAvav
         TFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729619244; x=1730224044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ddUMQ7YsPimbk4F7Nb5pyH2YBrKesDZgI8kYiDJ2Fc=;
        b=ZGdus2bz/MRIZOoOqlMotf0iNg+rGWhpCdoKbgX491haniQd35gceXN38eDLgt31Tv
         XHVzYWjQybuOvtXy9nWxYltkScJD5CEgY3a4h+x4CWqRKr34dGyqdBFiXW44T1KSl7XS
         QUyuE5VXYgFcLqIVoWquFdeH3hqY6BFDQNx69WL2FbsYQya+rdWlu7EtE+50FPxVmFeq
         YJ1XNNS8N1qH/jjfROeHCWVhm9hOgwLWXZPx7Lmyvv3t7TuQZyC0BkxMAaFbUwuM4PtV
         zugURwlHZoXmy3Pzy7hnA3o2zYYIZWe250sLwfrIzH+fErWMxmI37+I2rowXCN3zG6G4
         f00g==
X-Forwarded-Encrypted: i=1; AJvYcCWRqmDsjEYMvAezukvzQ1Xk4+h/C+fjBM7tgQ3v1z4iZ+b4utEWj9fn1Ww8ADdp08vR4Zls20NSSeVTUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdJ1F49SV78KCL8poRq8G5LKCkuyjjdv0gcRWZ8uC5WSQcFNpr
	IDgoiQwdMz5Yr5OWZP4T55mUGJUsaxfDTdc0U+VyRifpgHtOI42oY/NWLhjcWQerNS4OHeQzLPW
	V76E/zKNyObHbNnpK01Pwj+svhtk=
X-Google-Smtp-Source: AGHT+IHYzZ1MPfouURSpXauQvjKpAqxHOZgCBInLj8fQ2B+q8L2j1IhoGXxHbfumGhFT2TP8+T2OX/YchRKQE6e2aiM=
X-Received: by 2002:a05:6a20:d528:b0:1d8:a899:8899 with SMTP id
 adf61e73a8af0-1d96dece18cmr3235223637.29.1729619244353; Tue, 22 Oct 2024
 10:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241021122112.101513-1-puranjay@kernel.org> <20241021122112.101513-5-puranjay@kernel.org>
 <CAEf4BzY1LgCF1VOoAQkMdDTx87C0mfyftMvhvVU4GpsFc6fw5g@mail.gmail.com> <mb61pa5ewbfpk.fsf@kernel.org>
In-Reply-To: <mb61pa5ewbfpk.fsf@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 22 Oct 2024 10:47:12 -0700
Message-ID: <CAEf4BzZ-gfBqez-QJCSRVOPnvz-inaiVdNGOFRCdc2KQbnmeZQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/5] selftests/bpf: Add benchmark for
 bpf_csum_diff() helper
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Eduard Zingerman <eddyz87@gmail.com>, Eric Dumazet <edumazet@google.com>, Hao Luo <haoluo@google.com>, 
	Helge Deller <deller@gmx.de>, Jakub Kicinski <kuba@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Martin KaFai Lau <martin.lau@linux.dev>, 
	Mykola Lysenko <mykolal@fb.com>, netdev@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Yonghong Song <yonghong.song@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_104725_876933_4C23B4E3 
X-CRM114-Status: GOOD (  29.70  )
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

T24gVHVlLCBPY3QgMjIsIDIwMjQgYXQgMzoyMeKAr0FNIFB1cmFuamF5IE1vaGFuIDxwdXJhbmph
eUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlpLm5ha3J5aWtv
QGdtYWlsLmNvbT4gd3JpdGVzOgo+Cj4gPiBPbiBNb24sIE9jdCAyMSwgMjAyNCBhdCA1OjIy4oCv
QU0gUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4g
QWRkIGEgbWljcm9iZW5jaG1hcmsgZm9yIGJwZl9jc3VtX2RpZmYoKSBoZWxwZXIuIFRoaXMgYmVu
Y2htYXJrIHdvcmtzIGJ5Cj4gPj4gZmlsbGluZyBhIDRLQiBidWZmZXIgd2l0aCByYW5kb20gZGF0
YSBhbmQgY2FsY3VsYXRpbmcgdGhlIGludGVybmV0Cj4gPj4gY2hlY2tzdW0gb24gZGlmZmVyZW50
IHBhcnRzIG9mIHRoaXMgYnVmZmVyIHVzaW5nIGJwZl9jc3VtX2RpZmYoKS4KPiA+Pgo+ID4+IEV4
YW1wbGUgcnVuIHVzaW5nIC4vYmVuY2hzL3J1bl9iZW5jaF9jc3VtX2RpZmYuc2ggb24geDg2XzY0
Ogo+ID4+Cj4gPj4gW2JwZl0kIC4vYmVuY2hzL3J1bl9iZW5jaF9jc3VtX2RpZmYuc2gKPiA+PiA0
ICAgICAgICAgICAgICAgICAgICAyLjI5NiDCsSAwLjA2Nk0vcyAoZHJvcHMgMC4wMDAgwrEgMC4w
MDBNL3MpCj4gPj4gOCAgICAgICAgICAgICAgICAgICAgMi4zMjAgwrEgMC4wMDNNL3MgKGRyb3Bz
IDAuMDAwIMKxIDAuMDAwTS9zKQo+ID4+IDE2ICAgICAgICAgICAgICAgICAgIDIuMzE1IMKxIDAu
MDAxTS9zIChkcm9wcyAwLjAwMCDCsSAwLjAwME0vcykKPiA+PiAyMCAgICAgICAgICAgICAgICAg
ICAyLjMxOCDCsSAwLjAwMU0vcyAoZHJvcHMgMC4wMDAgwrEgMC4wMDBNL3MpCj4gPj4gMzIgICAg
ICAgICAgICAgICAgICAgMi4zMDggwrEgMC4wMDNNL3MgKGRyb3BzIDAuMDAwIMKxIDAuMDAwTS9z
KQo+ID4+IDQwICAgICAgICAgICAgICAgICAgIDIuMzAwIMKxIDAuMDI5TS9zIChkcm9wcyAwLjAw
MCDCsSAwLjAwME0vcykKPiA+PiA2NCAgICAgICAgICAgICAgICAgICAyLjI4NiDCsSAwLjAwMU0v
cyAoZHJvcHMgMC4wMDAgwrEgMC4wMDBNL3MpCj4gPj4gMTI4ICAgICAgICAgICAgICAgICAgMi4y
NTAgwrEgMC4wMDFNL3MgKGRyb3BzIDAuMDAwIMKxIDAuMDAwTS9zKQo+ID4+IDI1NiAgICAgICAg
ICAgICAgICAgIDIuMTczIMKxIDAuMDAxTS9zIChkcm9wcyAwLjAwMCDCsSAwLjAwME0vcykKPiA+
PiA1MTIgICAgICAgICAgICAgICAgICAyLjAyMyDCsSAwLjA1NU0vcyAoZHJvcHMgMC4wMDAgwrEg
MC4wMDBNL3MpCj4gPgo+ID4geW91IGFyZSBub3QgYmVuY2htYXJraW5nIGJwZl9jc3VtX2RpZmYo
KSwgeW91IGFyZSBiZW5jaG1hcmtpbmcgaG93Cj4gPiBvZnRlbiB5b3UgY2FuIGNhbGwgYnBmX3By
b2dfdGVzdF9ydW4oKS4gQWRkIHNvbWUgYmF0Y2hpbmcgb24gdGhlIEJQRgo+ID4gc2lkZSwgdGhl
c2UgbnVtYmVycyB0ZWxsIHlvdSB0aGF0IHRoZXJlIGlzIG5vIGRpZmZlcmVuY2UgYmV0d2Vlbgo+
ID4gY2FsY3VsYXRpbmcgY2hlY2tzdW0gZm9yIDQgYnl0ZXMgYW5kIGZvciA1MTIsIHRoYXQgZGlk
bid0IHNlZW0gc3RyYW5nZQo+ID4gdG8geW91Pwo+Cj4gVGhpcyBkaWRuJ3Qgc2VlbSBzdHJhbmdl
IHRvIG1lIGJlY2F1c2UgaWYgeW91IHNlZSB0aGUgdGFibGVzIEkgYWRkZWQgdG8KPiB0aGUgY292
ZXIgbGV0dGVyLCB0aGVyZSBpcyBhIGNsZWFyIGltcHJvdmVtZW50IGFmdGVyIG9wdGltaXppbmcg
dGhlCj4gaGVscGVyIGFuZCBhcm02NCBldmVuIHNob3dzIGEgbGluZWFyIGRyb3AgZ29pbmcgZnJv
bSA0IGJ5dGVzIHRvIDUxMgo+IGJ5dGVzLCBldmVuIGFmdGVyIHRoZSBvcHRpbWl6YXRpb24uCj4K
ClJlZ2FyZGxlc3Mgb2Ygb3B0aW1pemF0aW9uLCBpdCdzIHN0cmFuZ2UgdGhhdCB0aHJvdWdocHV0
IGJhcmVseQpkaWZmZXJzIHdoZW4geW91IHZhcnkgdGhlIGFtb3VudCBvZiB3b3JrIGJ5IG1vcmUg
dGhhbiAxMDB4LiBUaGlzCndvdWxkbid0IGJlIHN0cmFuZ2UgaWYgdGhpcyBjaGVja3N1bSBjYWxj
dWxhdGlvbiB3YXMgc29tZSBzb3J0IG9mCmNyeXB0b2dyYXBoaWMgaGFzaCwgd2hlcmUgaXQncyBp
bnRlbnRpb25hbCB0byBoYXZlIHRoZSBzYW1lIHRpbWluZwpyZWdhcmRsZXNzIG9mIGFtb3VudCBv
ZiB3b3JrLCBvciBzb21ldGhpbmcgYWxvbmcgdGhvc2UgbGluZXMuIEJ1dCBJCmRvbid0IHRoaW5r
IHRoYXQncyB0aGUgY2FzZSBoZXJlLgoKQnV0IGFzIGl0IGlzIHJpZ2h0IG5vdywgdGhpcyBiZW5j
aG1hcmsgaXMgYmVuY2htYXJraW5nCmJwZl9wcm9nX3Rlc3RfcnVuKCksIGFzIEkgbWVudGlvbmVk
LCB3aGljaCBzZWVtcyB0byBiZSBib3R0bGVuZWNraW5nCmF0IGFib3V0IDJtbG4vcyB0aHJvdWdo
cHV0IGZvciB5b3VyIG1hY2hpbmUuIGJwZl9jc3VtX2RpZmYoKSdzCm92ZXJoZWFkIGlzIHRyaXZp
YWwgY29tcGFyZWQgdG8gYnBmX3Byb2dfdGVzdF9ydW4oKSBvdmVyaGVhZCBhbmQKc3lzY2FsbC9j
b250ZXh0IHN3aXRjaCBvdmVyaGVhZC4KCldlIHNob3VsZG4ndCBhZGQgdGhlIGJlbmNobWFyayB0
aGF0IGRvZXNuJ3QgYmVuY2htYXJrIHRoZSByaWdodCB0aGluZy4KU28ganVzdCBhZGQgYSBicGZf
Zm9yKGksIDAsIDEwMCkgbG9vcCBkb2luZyBicGZfY3N1bV9kaWZmKCksIGFuZCB0aGVuCmRvIGF0
b21pYyBpbmNyZW1lbnQgKmFmdGVyKiB0aGUgbG9vcCAodG8gbWluaW1pemUgYXRvbWljcyBvdmVy
aGVhZCkuCgo+IE9uIHg4NiBhZnRlciB0aGUgaW1wcm92ZW1lbnQsIDQgYnl0ZXMgYW5kIDUxMiBi
eXRlcyBzaG93IHNpbWlsYXIgbnVtYmVycwo+IGJ1dCB0aGVyZSBpcyBzdGlsbCBhIHNtYWxsIGRy
b3AgdGhhdCBjYW4gYmUgc2VlbiBnb2luZyBmcm9tIDQgdG8gNTEyCj4gYnl0ZXMuCj4KPiBNeSB0
aG91Z2h0IHdhcyB0aGF0IGJlY2F1c2UgdGhlIGJwZl9jc3VtX2RpZmYoKSBjYWxscyBjc3VtX3Bh
cnRpYWwoKSBvbgo+IHg4NiB3aGljaCBpcyBhbHJlYWR5IG9wdGltaXNlZCwgbW9zdCBvZiB0aGUg
b3ZlcmhlYWQgd2FzIGR1ZSB0byBjb3B5aW5nCj4gdGhlIGJ1ZmZlciB3aGljaCBpcyBub3cgcmVt
b3ZlZC4KPgo+IEkgZ3Vlc3MgSSBjYW4gYW1wbGlmeSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIDRC
IGFuZCA1MTJCIGJ5IGNhbGxpbmcKPiBicGZfY3N1bV9kaWZmKCkgbXVsdGlwbGUgdGltZXMgaW4g
YSBsb29wLCBvciBieSBjYWxjdWxhdGluZyB0aGUgY3N1bSBieQo+IGRpdmlkaW5nIHRoZSBidWZm
ZXIgaW50byBtb3JlIHBhcnRzIChjdXJyZW50bHkgdGhlIEJQRiBjb2RlIGRpdmlkZXMgaXQKPiBp
bnRvIDIgcGFydHMgb25seSkuCj4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1v
aGFuIDxwdXJhbmpheUBrZXJuZWwub3JnPgo+ID4+IC0tLQo+ID4+ICB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvTWFrZWZpbGUgICAgICAgICAgfCAgIDIgKwo+ID4+ICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYvYmVuY2guYyAgICAgICAgICAgfCAgIDQgKwo+ID4+ICAuLi4vc2VsZnRl
c3RzL2JwZi9iZW5jaHMvYmVuY2hfY3N1bV9kaWZmLmMgICAgfCAxNjQgKysrKysrKysrKysrKysr
KysrCj4gPj4gIC4uLi9icGYvYmVuY2hzL3J1bl9iZW5jaF9jc3VtX2RpZmYuc2ggICAgICAgICB8
ICAxMCArKwo+ID4+ICAuLi4vc2VsZnRlc3RzL2JwZi9wcm9ncy9jc3VtX2RpZmZfYmVuY2guYyAg
ICAgfCAgMjUgKysrCj4gPj4gIDUgZmlsZXMgY2hhbmdlZCwgMjA1IGluc2VydGlvbnMoKykKPiA+
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9iZW5jaHMv
YmVuY2hfY3N1bV9kaWZmLmMKPiA+PiAgY3JlYXRlIG1vZGUgMTAwNzU1IHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2JwZi9iZW5jaHMvcnVuX2JlbmNoX2NzdW1fZGlmZi5zaAo+ID4+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL2NzdW1fZGlmZl9i
ZW5jaC5jCj4gPj4KPiA+CgpbLi4uXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
