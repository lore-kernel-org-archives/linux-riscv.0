Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4A1C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQHg2KAgB74MDDNCbOFW/jmurQr91Yp37Fs/0HliACo=; b=d9m9TLR12oawg2
	JyHbOcVb3+S69uHVvjk7IuKJ8KX+jdjqS9quoqmR+25XVtNJuTkIo4JicYuIZAHZuDovZWXR37xro
	DhVju1D3lcpMTnS6OpbX7kOnxcZAFSIq+FgalXLfqr/6UFANNnaKbrVtcisD/d1gIevqu2zhvf4HY
	Byj2IWJqf8osOJLayykoAAdzCXkYtfY0WnNNx/dp8BkazY3HqwoFNX2hQ+LeP8YaKCqODizlYv9RF
	t9wCOS9XT4DXDaktnjU8TfCos5NYSO8ld944mGQZoAbg7+tU1RlnNgdELlnc6VsyCYR/Em671/WeQ
	Aks3Z8ODm/oGJ9vwEltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjjh-002j8d-Ut; Tue, 03 Jan 2023 16:01:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCg38-0018Qm-RY
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 12:05:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 300B6612C3;
	Tue,  3 Jan 2023 12:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206C2C433EF;
	Tue,  3 Jan 2023 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672747545;
	bh=BbSLY1b6byZmGQc05X5BN64zeh0YRGMAJP0/SbbU3JU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QhE+NRBZq8OrNylqPT9lvf38CgQQGCh6husWdu5HCVnrg3JWvzVTCaaNSDcM1vjks
	 f/vqySnXb/jFVLAhQS2L5uLPOKD9KeYvB4KWjbmu8zpqTGsBTtx8bb5gpsEjlvl9Lk
	 YZaZBf2GvzBaC+evUCRbnwuJ5M3NWEUu82sNp4viBDnty0SVfFF4vZM1k5y9thCqOk
	 Pqc9JIIPF/R7jkbejKV81jirEGe6bwGHFC1400jG89Q/BpFzrzS3N3I7iislA+9EcC
	 Px5Y/8DX0w0KomRHDR582K3vYJlJKk8J/fCeAf4G+EhRj/Hr4qtS60feVPAlRurRbX
	 GIqN3WFiVDYnw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, Xu Kuohai <xukuohai@huawei.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [RFC PATCH RESEND bpf-next 1/4] bpf: Rollback to text_poke when
 arch not supported ftrace direct call
In-Reply-To: <0039743b-5837-c0d3-7574-7719698f9dc1@huaweicloud.com>
References: <20221220021319.1655871-1-pulehui@huaweicloud.com>
 <20221220021319.1655871-2-pulehui@huaweicloud.com>
 <a2bf7ed9-4977-608c-d5a5-8ee6a520cf52@huawei.com>
 <0039743b-5837-c0d3-7574-7719698f9dc1@huaweicloud.com>
Date: Tue, 03 Jan 2023 13:05:42 +0100
Message-ID: <87k023u8kp.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_040547_044170_5D13C2E5 
X-CRM114-Status: GOOD (  15.91  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IE9uIDIwMjIvMTIv
MjAgMTA6MzIsIFh1IEt1b2hhaSB3cm90ZToKPj4gT24gMTIvMjAvMjAyMiAxMDoxMyBBTSwgUHUg
TGVodWkgd3JvdGU6Cj4+PiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+Pj4K
Pj4+IFRoZSBjdXJyZW50IGJwZiB0cmFtcG9saW5lIGF0dGFjaCB0byBrZXJuZWwgZnVuY3Rpb25z
IHZpYSBmdHJhY2UgZGlyZWN0Cj4+PiBjYWxsIEFQSSwgd2hpbGUgdGV4dF9wb2tlIGlzIGFwcGxp
ZWQgZm9yIGJwZjJicGYgYXR0YWNoIGFuZCB0YWlsIGNhbGwKPj4+IG9wdGltaXphdGlvbi4gRm9y
IGFyY2hpdGVjdHVyZXMgdGhhdCBkbyBub3Qgc3VwcG9ydCBmdHJhY2UgZGlyZWN0IGNhbGwsCj4+
PiB0ZXh0X3Bva2UgaXMgc3RpbGwgYWJsZSB0byBhdHRhY2ggYnBmIHRyYW1wb2xpbmUgdG8ga2Vy
bmVsIGZ1bmN0aW9ucy4KPj4+IExldCdzIHJlbGF4IGl0IGJ5IHJvbGxiYWNrIHRvIHRleHRfcG9r
ZSB3aGVuIGFyY2hpdGVjdHVyZSBub3Qgc3VwcG9ydGVkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+PiAtLS0KPj4+IMKgIGtlcm5lbC9icGYv
dHJhbXBvbGluZS5jIHwgOCArKy0tLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEva2VybmVsL2JwZi90
cmFtcG9saW5lLmMgYi9rZXJuZWwvYnBmL3RyYW1wb2xpbmUuYwo+Pj4gaW5kZXggZDYzOTUyMTVi
ODQ5Li4zODYxOTdhNzk1MmMgMTAwNjQ0Cj4+PiAtLS0gYS9rZXJuZWwvYnBmL3RyYW1wb2xpbmUu
Ywo+Pj4gKysrIGIva2VybmVsL2JwZi90cmFtcG9saW5lLmMKPj4+IEBAIC0yMjgsMTUgKzIyOCwx
MSBAQCBzdGF0aWMgaW50IG1vZGlmeV9mZW50cnkoc3RydWN0IGJwZl90cmFtcG9saW5lIAo+Pj4g
KnRyLCB2b2lkICpvbGRfYWRkciwgdm9pZCAqbmV3X2FkCj4+PiDCoCBzdGF0aWMgaW50IHJlZ2lz
dGVyX2ZlbnRyeShzdHJ1Y3QgYnBmX3RyYW1wb2xpbmUgKnRyLCB2b2lkICpuZXdfYWRkcikKPj4+
IMKgIHsKPj4+IMKgwqDCoMKgwqAgdm9pZCAqaXAgPSB0ci0+ZnVuYy5hZGRyOwo+Pj4gLcKgwqDC
oCB1bnNpZ25lZCBsb25nIGZhZGRyOwo+Pj4gwqDCoMKgwqDCoCBpbnQgcmV0Owo+Pj4gLcKgwqDC
oCBmYWRkciA9IGZ0cmFjZV9sb2NhdGlvbigodW5zaWduZWQgbG9uZylpcCk7Cj4+PiAtwqDCoMKg
IGlmIChmYWRkcikgewo+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmICghdHItPmZvcHMpCj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT1RTVVBQOwo+Pj4gK8KgwqDCoCBpZiAoSVNf
RU5BQkxFRChDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMpICYmCj4+PiAr
wqDCoMKgwqDCoMKgwqAgISFmdHJhY2VfbG9jYXRpb24oKHVuc2lnbmVkIGxvbmcpaXApKQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHRyLT5mdW5jLmZ0cmFjZV9tYW5hZ2VkID0gdHJ1ZTsKPj4+IC3C
oMKgwqAgfQo+Pj4KPj4gCj4+IEFmdGVyIHRoaXMgcGF0Y2gsIGEga2VybmVsIGZ1bmN0aW9uIHdp
dGggdHJ1ZSB0cmFjZV9sb2NhdGlvbiB3aWxsIGJlIAo+PiBwYXRjaGVkCj4+IGJ5IGJwZiB3aGVu
IENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyBpcyBkaXNhYmxlZCwgd2hp
Y2ggCj4+IG1lYW5zCj4+IHRoYXQgYSBrZXJuZWwgZnVuY3Rpb24gbWF5IGJlIHBhdGNoZWQgYnkg
Ym90aCBicGYgYW5kIGZ0cmFjZSBpbiBhIG11dHVhbGx5Cj4+IHVuYXdhcmUgd2F5LiBUaGlzIHdp
bGwgY2F1c2UgZnRyYWNlIGFuZCBicGZfYXJjaF90ZXh0X3Bva2UgdG8gZmFpbCBpbiBhCj4+IHNv
bWV3aGF0IHJhbmRvbSB3YXkgaWYgdGhlIGZ1bmN0aW9uIHRvIGJlIHBhdGNoZWQgd2FzIGFscmVh
ZHkgcGF0Y2hlZAo+PiBieSB0aGUgb3RoZXIuCj4KPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3LiBB
bmQgeWVzLCB0aGlzIGlzIGEgYmFja3dhcmQgY29tcGF0aWJsZSBzb2x1dGlvbiAKPiBmb3IgYXJj
aGl0ZWN0dXJlcyB0aGF0IG5vdCBzdXBwb3J0IERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NB
TExTLgoKSXQncyBub3QgImJhY2t3YXJkIGNvbXBhdGlibGUiLiBSZWl0ZXJhdGluZyB3aGF0IEt1
b2hhaSBzYWlkOyBUaGUgQlBGCnRyYW1wb2xpbmUgbXVzdCBiZSBhd2FyZSBvZiBmdHJhY2UncyBz
dGF0ZSAtLSB3aXRoIHRoaXMgcGF0Y2gsIHRoZQp0cmFtcG9saW5lIGNhbid0IGJsaW5kbHkgcG9r
ZSB0aGUgdGV4dCBtYW5hZ2VkIG15IGZ0cmFjZS4KCkknZCByZWNvbW1lbmQgdG8gcmVtb3ZlIHRo
aXMgcGF0Y2ggZnJvbSB0aGUgc2VyaWVzLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
