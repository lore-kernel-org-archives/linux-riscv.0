Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9859CCCF9FE
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIjwWXaPk8zIlRoK4dM/OvS9+B/xJmq0mcxph7Y9jqA=; b=1hHxOHXS3iZBep
	wkFAyR1gXJJp4Ce4mQIZlqmLlgBzxad1EWM05BEOKFY4omG2+T5weSjkxLQlJG8BNjwJYyh3mx8iI
	FoR/5hG91UCezPML0pBssIamaLWuuu02GB5AIZqHAw5E5h0D+uW1Uqx0AtEfvL1+N4vzaBtkU6hnO
	7v6jINAWYU0f00iflbJznAAMRh9Bh3ZTta2EHleGOghk+yx1y/lLT6bDGMBCxJ4DBMj5lfXEWYbze
	jHKnBRgiRFzSfk9yUmdbxTBIXFqyoiGf7JN9KpUXi1Ea5zQTaiM8BwPZB8gorcmtQsR2i5OCcjRkN
	Z1CKZaLXBOdpP0sK9POQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEovo-000000069EY-2ikc;
	Fri, 31 Oct 2025 13:12:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEovm-000000069Dt-0DIN
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 13:12:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2D794099E;
	Fri, 31 Oct 2025 13:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D93C4CEE7;
	Fri, 31 Oct 2025 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761916356;
	bh=1rwfYJBuNs8Xw9hEJc66YBPhOXArAPLszXsQFe7O3u8=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f9+EqC5WRd/sDGGwiZxzmEIndtVF8XVgbt/QJAmmE32q/tHDSPgrSri5+smmC9Pa7
	 Vw5PQPOByMkPiV2tZCIQ4UBk8NcQv3mOjXCCNxHJnG9StvNFkbeRDlIjmJ3wY+o1wt
	 XkbPK1hO+Db8xlGyDbC4CtrTRG4bYvHkrPM8fSd3Wo8JJcdUXaYVj8X8wcEMu4jKH1
	 mqtVuFEZ2JuWZ2ShshkYF6VgstGKmGNAu7nMCB3O8+mZ7WngZPXJjxj/IBKGCoQz5L
	 23pZbJayCZ1hz21HLTlKLefWh5GO1JM0sDRQdm2BA7ppe5jbwGV11II5hJ5E0WY/6+
	 FuWkEGy2sOM1g==
Message-ID: <4654398f-324c-4465-88eb-8cadde6160dc@kernel.org>
Date: Fri, 31 Oct 2025 14:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] rust: macros: Add support for 'imports_ns' to module!
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-modules@vger.kernel.org
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a@eucas1p2.samsung.com>
 <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com>
 <h3sivr3uuzr5oodqe326svchbw3rzo4f4nw4chpeee2jwzjq3j@bdtecauehkn4>
 <CANiq72nNxVJeMZdESrrB+LGmdRK+M5AGZbUw-x2aE-Qa-=HtJQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <CANiq72nNxVJeMZdESrrB+LGmdRK+M5AGZbUw-x2aE-Qa-=HtJQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_061238_110384_12B7EE5C 
X-CRM114-Status: GOOD (  14.48  )
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
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAzMS8xMC8yMDI1IDEzLjU3LCBNaWd1ZWwgT2plZGEgd3JvdGU6Cj4gT24gRnJpLCBPY3Qg
MzEsIDIwMjUgYXQgODo0N+KAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xlaW5la0BrZXJuZWwu
b3JnPiB3cm90ZToKPj4KPj4gSSBhbHJlYWR5IGFza2VkIHRoaXMgaW4gcmVwbHkgdG8gdGhlIGNv
dmVyIGxldHRlciwgYnV0IHRoZSBxdWVzdGlvbiB3YXMKPj4gbG9zdCBvbiB0aGUgd2F5IChubyBv
ZmZlbnNlISksIHNvIEknbSBhc2tpbmcgYWdhaW4uIEFzIGl0IG9ubHkgcmVhbGx5Cj4+IGFmZmVj
dHMgdGhpcyBwYXRjaCwgSSdtIGRvaW5nIHRoYXQgaGVyZToKPj4KPj4gQ2FuIEkgaGF2ZSBzb21l
IGJsZXNzaW5nIHRvIHRha2UgdGhpcyBwYXRjaCB2aWEgbXkgcHdtIHRyZWU/IFdvdWxkIHlvdQo+
PiBwcmVmZXIgYSB0YWcgdG8gYWxzbyBtZXJnZSBpdCBpbnRvIHlvdXIgdHJlZT8gVGhlbiBJIHdv
dWxkIGFwcGx5IGl0IG9uCj4+IHRvcCBvZiA2LjE4LXJjMSBhbmQgcHJvdmlkZSBhIHRhZyBmb3Ig
eW91IHRvIG1lcmdlLgo+IAo+IFNvdW5kcyBmaW5lIHRvIG1lLCBidXQgSSBhbSBDYydpbmcgdGhl
IG1vZHVsZXMgbWFpbnRhaW5lcnMgc2luY2UgdGhleQo+IHdlcmUgbm90LCBqdXN0IGluIGNhc2U6
Cj4gCj4gQWNrZWQtYnk6IE1pZ3VlbCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4KPiAKPiBJIHRo
aW5rIHdlIGRvbid0IG5lZWQgdGhlIHRhZy9tZXJnZSwgdW5sZXNzIHNvbWVvbmUgZWxzZSBpcyBs
b29raW5nIHRvCj4gdXNlIHRoaXMgKGlzIHRoZXJlIHN1Y2ggYSB1c2VyPyBJIG1heSBoYXZlIG1p
c3NlZCBpdCkuCj4gCj4gVGhhbmtzIQo+IAo+IENoZWVycywKPiBNaWd1ZWwKClV3ZSwgdGhhdCdz
IG9rYXkgZnJvbSBtb2R1bGVzIHNpZGU6CgpBY2tlZC1ieTogRGFuaWVsIEdvbWV6IDxkYS5nb21l
ekBzYW1zdW5nLmNvbT4KCkZZSSwgSSBoYXZlbid0IG1lcmdlZCBBbmRyZWFzJ3MgcGF0Y2hlcyAo
cnVzdDogZXh0ZW5kIGBtb2R1bGUhYCBtYWNybyB3aXRoCmludGVnZXIgcGFyYW1ldGVyIHN1cHBv
cnQpIHlldCwgd2hpY2ggYWRkIHJ1c3QvbWFjcm9zL21vZHVsZS5ycyB0byBvdXIKTUFJTlRBSU5F
UlMgZmlsZSBsaXN0LiBTbywgaXQncyBmaW5lIGZyb20gbW9kdWxlcyBzaWRlIHRvIGdvIHRocm91
Z2ggeW91ciB0cmVlLgpJIHdhcyBhaW1pbmcgdG8gbWVyZ2UgdGhlc2UgcGF0Y2hlcyBhbG9uZyB3
aXRoIHNvbWUgb3RoZXJzIGZvciB0aGlzIHdlZWsgYnV0CkkndmUgZm91bmQgYSByZWdyZXNzaW9u
IGluIGttb2QgdGVzdGluZyBpbnRyb2R1Y2VkIGluIHRoZSBsYXRlc3QgdjYuMTgtcmMxLAp3aGlj
aCBpcyB0YWtpbmcgbWUgc29tZSBleHRyYSB0aW1lLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
