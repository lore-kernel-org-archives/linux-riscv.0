Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D8FCD5BD0
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 17:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wt+WG6GIvtzeqAv2qlvKFKqlL7QuURZfvV0rUbv32zE=; b=4Hd7zKg4wuZGk/
	qQqmXVc6afHThZ1OER7AYmocmpOED98S2nZsPW+1Twcjw+tGeraXiZmJuoJ7LBzieY46UTejeGe5M
	TJnf//Kbk99nyiI1E5WL78Oj61WYEj34eFGvSj8evTNS1YGTlep8VGXLC7fMFjTs8PfEXf8aJwJ/L
	atqv6xft5D2CE8DuXCVC/WUvMEizvt84N0ZaWDEdKMi6xUwZfEB9V34PTYsvplkIDfdSfXQnsy5pU
	2EesFqNVdIDLAD7gXDbCd/btAR9VfPL2KmZuYg+nI2qyztdKjm71rhGGxQiEQ0j0PmHcUfSGS/jka
	5V09xtGEDiJeFpmr/cCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNkl-00000008z02-00VB;
	Sat, 30 May 2026 17:45:43 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNke-00000008yzX-2m4u
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 17:45:41 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260530174528euoutp013a8d6a958caeb03ea9125ddabbbec95c~0aO7ufGSy1072210722euoutp01U
	for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 17:45:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260530174528euoutp013a8d6a958caeb03ea9125ddabbbec95c~0aO7ufGSy1072210722euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1780163128;
	bh=bTDLJmGkDlSze5mlnTF045Cqf4W18oFetb77eOLT1x8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=DLs/iq2Uwd2IhWSAOl+8zQZEeaib+dwK5qtDl8BZ4AU2+3T/pSGDx1aF9gXo7O0HK
	 VkRIL0LPY6BsX7sl67Qr83Or1QN/glU4oeJpEbhIV97qJpmMSabbSXl6iDrAkVqhWp
	 4Ib6DZUVsKH6CGfEXBYY06PTJCCzj+dh3D70XYtE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260530174526eucas1p1c3685340ad4d1f8d44f7c77408102f2d~0aO5_XT4K2399623996eucas1p1y;
	Sat, 30 May 2026 17:45:26 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260530174525eusmtip1b099a5e622db8c74e1c2c6e57e01ef74~0aO41luc40897308973eusmtip1C;
	Sat, 30 May 2026 17:45:24 +0000 (GMT)
Message-ID: <5c017479-0d1b-434c-a859-7f52b25d7dfc@samsung.com>
Date: Sat, 30 May 2026 19:45:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] pwm: th1520: Remove requirement for
 mul_u64_u64_div_u64_roundup
To: Maurice Hieronymus <mhi@mailbox.org>, Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <47062326dcf87b605cf4def9835394551645caa5.camel@mailbox.org>
X-CMS-MailID: 20260530174526eucas1p1c3685340ad4d1f8d44f7c77408102f2d
X-Msg-Generator: CA
X-RootMTR: 20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec
X-EPHeader: CA
X-CMS-RootMailID: 20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec
References: <CGME20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec@eucas1p1.samsung.com>
	<20260525-pwm-th1520-fix-v1-1-814e537c6812@mailbox.org>
	<8857fc45-b787-4661-b27b-8976e655f7c9@samsung.com>
	<1f550af5b8d1fa2aaa9936d5b0010c156e0cb455.camel@mailbox.org>
	<58245ce0-7271-4b07-b866-0037ff68d92c@samsung.com>
	<47062326dcf87b605cf4def9835394551645caa5.camel@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_104537_308707_8806C476 
X-CRM114-Status: GOOD (  18.40  )
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

CgpPbiA1LzMwLzI2IDEyOjQxLCBNYXVyaWNlIEhpZXJvbnltdXMgd3JvdGU6Cj4+Cj4+IEFwb2xv
Z2llcywgSSBoYXZlIHRvIGNvcnJlY3QgbXkgc3RhdGVtZW50IGZyb20gYmVmb3JlIGFmdGVyCj4+
IGRpc2N1c3NpbmcKPiBObyB3b3JyaWVzIQo+PiB3aXRoIFV3ZS4gVGhlIHJlYXNvbiB0aGUgbWFj
cm8gd2FzIHVzZWQgaW4gdGhlIG1lbnRpb25lZCBkcml2ZXIgaXMKPj4gTk9UCj4+IHRoYXQgUFdN
IGNvbnRyb2xsZXJzIGhhdmUgNjQtYml0IHJlZ2lzdGVycyAtIFV3ZSBpc24ndCBhd2FyZSBvZiB0
aGF0Cj4+IGJlaW5nIGEgcmVhbCBwYXR0ZXJuIGVpdGhlciwgYW5kIEkgd2FzIGluZmVycmluZyBp
dCBmcm9tIHRoZSBjb2RlCj4+IHJhdGhlcgo+PiB0aGFuIGZyb20gaGFyZHdhcmUgcmVhbGl0eS4g
VGhlIGFjdHVhbCByZWFzb24gdGhlIG1hY3JvcyBnZXQgdXNlZAo+PiBpc24ndAo+PiB1bmlmaWVk
IGFjcm9zcyBkcml2ZXJzIGFuZCB3ZSBzaG91bGQgcGluIHRoYXQgZG93biBzZXBhcmF0ZWx5IHJh
dGhlcgo+PiB0aGFuIGJsb2NrIHlvdXIgcGF0Y2ggb24gaXQuCj4+Cj4+IFNvIHBsZWFzZSBob2xk
IG9mZiBvbiB0aGUgUnVzdCBoZWxwZXIgZm9yIG5vdyAtIHlvdXIgaW5pdGlhbCBwYXRjaAo+PiBt
aWdodAo+PiBiZSB0aGUgcmlnaHQgZGlyZWN0aW9uLgo+Pgo+IElzIHRoZXJlIGFueSBmdXJ0aGVy
IGNvbmNsdXNpb24gd2hpY2ggZGlyZWN0aW9uIGlzIHJpZ2h0PyBDYW4gd2UgbWVyZ2UKPiBteSBw
YXRjaCwgZG9lcyBpdCBuZWVkIHNvbWUgY2hhbmdlIG9yIGFyZSB3ZSBnb2luZyBkb3duIHRoZSBy
b2FkIHdpdGgKPiB0aGUgUnVzdCBoZWxwZXJzPwoKSSB0aGluayB0aGlzIHBhdGNoIGlzIGZpbmUg
dG8gbW92ZSBmb3J3YXJkLgoKV2Ugd2VyZSB3b25kZXJpbmcgaWYgdGhlcmUgd291bGQgYmUgYW55
IG5vdGljZWFibGUgZGlmZmVyZW5jZSBpbgpleGVjdXRpb24gc3BlZWQgYmV0d2VlbiB0aGUgNjQt
Yml0IGNvbXB1dGF0aW9ucyBhbmQgdGhlIG1peGVkCjMyLWJpdC82NC1iaXQgY29tcHV0YXRpb25z
LiBJIHJhbiBhIHByb2ZpbGUgb24gdGhlIHBsYXRmb3JtLCBhbmQgdGhlCnBlcmZvcm1hbmNlIHdp
dGggYW5kIHdpdGhvdXQgdGhlIHBhdGNoIGlzIGlkZW50aWNhbDoKCkhlcmUncyB0aGUgdGVzdCBJ
IHJhbgoKV0lUSCBQQVRDSAojIGh5cGVyZmluZSAtLXdhcm11cCAyIC0tcnVucyA0MCAnLi9wd210
ZXN0cGVyZicgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIAogIFRpbWUgKG1lYW4gwrEgz4MpOiAgICAgIDMuMzcwIHMgwrEgIDAuMDY5IHMg
ICAgW1VzZXI6IDAuMDY5IHMsIFN5c3RlbTogMy4zMTMgc10KICBSYW5nZSAobWluIOKApiBtYXgp
OiAgICAzLjI3MSBzIOKApiAgMy41NDcgcyAgICA0MCBydW5zCiAKV0lUSE9VVCBQQVRDSAojIGh5
cGVyZmluZSAtLXdhcm11cCAyIC0tcnVucyA0MCAnLi9wd210ZXN0cGVyZgogIFRpbWUgKG1lYW4g
wrEgz4MpOiAgICAgIDMuMzY4IHMgwrEgIDAuMDUxIHMgICAgW1VzZXI6IDAuMDU4IHMsIFN5c3Rl
bTogMy4zMjYgc10KICBSYW5nZSAobWluIOKApiBtYXgpOiAgICAzLjI3OCBzIOKApiAgMy41MTYg
cyAgICA0MCBydW5zCgpUaGUgZGVsdGEgaXMgY29tcGxldGVseSB3aXRoaW4gdGhlIG1hcmdpbiBv
ZiBlcnJvciwgY29uZmlybWluZyB0aGF0CjY0LWJpdCBtYXRoIGlzIGp1c3QgYXMgZmFzdCBhcyAz
Mi1iaXQgbWF0aCBvbiB0aGlzIGFyY2hpdGVjdHVyZSB1bmRlcgpzdGFuZGFyZCBsb2Fkcy4gSXQg
aXMgd29ydGggbWVudGlvbmluZyB0aGF0IHRvIGdldCBhIG1vcmUgbWVhbmluZ2Z1bApwZXJmb3Jt
YW5jZSBtZWFzdXJlbWVudCwgcHdtdGVzdHBlcmYgd291bGQgcHJvYmFibHkgbmVlZCB0byBiZSBt
b2RpZmllZAp0byBzdHJlc3MgdGhpcyBzcGVjaWZpYyBjb2RlIHBhdGggbXVjaCBtb3JlIGhlYXZp
bHkuCgpUaGF0IHNhaWQsIGZpdHRpbmcgaXQgaW50byAzMi1iaXQgd2hlcmUgYXBwcm9wcmlhdGUg
bWFrZXMgcGVyZmVjdCBzZW5zZQpmcm9tIGEgY29kZSBxdWFsaXR5IHBlcnNwZWN0aXZlLgoKUmV2
aWV3ZWQtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cgo+
IAo+IFRoYW5rcyEKPiAKPiBNYXVyaWNlCj4+Pgo+Pj4gTWF1cmljZQo+Pj4KPj4KPj4gQmVzdCBy
ZWdhcmRzLAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
