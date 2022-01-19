Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DD8C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r58MR82UeehwMpojL7FqDUcJrslkmzV5sJ+/gRdXRks=; b=OGXlwhTpEangfRAksEyKt6lQZW
	e+yqsNUvuUX7sdTIOvRrelaRWZbpcGbRxErUohcHKre8PtncvlCta7ZpteOuB/LAyOQdd0BeHsC63
	oHuQA3E884OjPGXs90Hq+q9pyeFIvbF9Wux8oYuQTxcpjYh6wlzYMNko+Y+A4UV7zXxaZDQfzwawO
	+8Kv3cxieUePoY3ysOT32p23+Ow+p+7+2MgYu8HK+gtsaOXoxCXlOUfVm5EoFCAfBePsokkkw+mOE
	An30zkdrjz9WoicyKTGiYvDj2qLPcg40UXkWVP64rVFdtsbfHHP4DJzb1LqBQDFjDn+OodZ5RBq9H
	VSDztJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAD6k-006C16-UT; Wed, 19 Jan 2022 15:42:46 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAD6h-006Bwo-G9
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 15:42:45 +0000
Received: from [78.46.152.42] (helo=sslproxy04.your-server.de)
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1nAD6S-000FUR-0G; Wed, 19 Jan 2022 16:42:28 +0100
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1nAD6R-000O1M-Iy; Wed, 19 Jan 2022 16:42:27 +0100
Subject: Re: [PATCH riscv-next] riscv: bpf: Fix eBPF's exception tables
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 palmer@rivosinc.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Tong Tiangen <tongtiangen@huawei.com>
References: <20220110165208.1826-1-jszhang@kernel.org>
 <Ydxljv2Q4YNDYRTx@xhacker>
 <CAJ+HfNiS7Ss0FJowPUrrKvuC+1Kn9gXb=VqNoqh3eWJDu=m4Mg@mail.gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <1b104397-8cb7-c5c2-92cb-11ce56c9a8de@iogearbox.net>
Date: Wed, 19 Jan 2022 16:42:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAJ+HfNiS7Ss0FJowPUrrKvuC+1Kn9gXb=VqNoqh3eWJDu=m4Mg@mail.gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.3/26427/Wed Jan 19 11:42:43 2022)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_074243_578163_341577A6 
X-CRM114-Status: GOOD (  17.43  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMS8xOS8yMiAxMToyNCBBTSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBPbiBNb24sIDEwIEph
biAyMDIyIGF0IDE4OjA1LCBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+PiBPbiBUdWUsIEphbiAxMSwgMjAyMiBhdCAxMjo1MjowOEFNICswODAwLCBKaXNoZW5nIFpo
YW5nIHdyb3RlOgo+Pj4gZUJQRidzIGV4Y2VwdGlvbiB0YWJsZXMgbmVlZHMgdG8gYmUgbW9kaWZp
ZWQgdG8gcmVsYXRpdmUgc3luY2hyb25vdXNseS4KPj4+Cj4+PiBTdWdnZXN0ZWQtYnk6IFRvbmcg
VGlhbmdlbiA8dG9uZ3RpYW5nZW5AaHVhd2VpLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEppc2hl
bmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAKPiBOaWNlIGNhdGNoLCBhbmQgYXBvbG9n
aWVzIGZvciB0aGUgc2xvdyByZXNwb25zZS4KPiAKPiBBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Aa2VybmVsLm9yZz4KPiAKPj4+IC0tLQo+Pj4gICBhcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvbXA2NC5jIHwgMiArLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4+IGluZGV4IDY5YmFi
N2UyOGY5MS4uNDRjOTc1MzViYzE1IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb21wNjQuYwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+
Pj4gQEAgLTQ5OCw3ICs0OTgsNyBAQCBzdGF0aWMgaW50IGFkZF9leGNlcHRpb25faGFuZGxlcihj
b25zdCBzdHJ1Y3QgYnBmX2luc24gKmluc24sCj4+PiAgICAgICAgb2Zmc2V0ID0gcGMgLSAobG9u
ZykmZXgtPmluc247Cj4+PiAgICAgICAgaWYgKFdBUk5fT05fT05DRShvZmZzZXQgPj0gMCB8fCBv
ZmZzZXQgPCBJTlRfTUlOKSkKPj4+ICAgICAgICAgICAgICAgIHJldHVybiAtRVJBTkdFOwo+Pj4g
LSAgICAgZXgtPmluc24gPSBwYzsKPj4+ICsgICAgIGV4LT5pbnNuID0gb2Zmc2V0Owo+Pgo+PiBI
aSBQYWxtZXIsCj4+Cj4+IFRvbmcgcG9pbnRlZCBvdXQgdGhpcyBpc3N1ZSBidXQgdGhlcmUgd2Fz
IHNvbWV0aGluZyB3cm9uZyB3aXRoIG15IGVtYWlsCj4+IGZvcndhcmRpbmcgYWRkcmVzcywgc28g
SSBkaWRuJ3QgZ2V0IGhpcyByZXBseS4gVG9kYXksIEkgc2VhcmNoZWQgb24KPj4gbG9yZS5rZXJu
ZWwub3JnIGp1c3QgZm91bmQgaGlzIHJlcGx5LCBzb3JyeSBmb3IgaW5jb252ZW5pZW5jZS4KPiAK
PiBBRkFJSywgSmlzaGVuZydzIGV4dGFibGUgd29yayBpcyBzdGlsbCBpbiBQYWxtZXIncyBmb3It
bmV4dCB0cmVlLgo+IAo+IERhbmllbC9BbGV4ZWk6IFRoaXMgZUJQRiBtdXN0IGZvbGxvdyBjb21t
aXQgMWY3N2VkOTQyMmNiICgicmlzY3Y6Cj4gc3dpdGNoIHRvIHJlbGF0aXZlIGV4dGFibGUgYW5k
IG90aGVyIGltcHJvdmVtZW50cyIpLCB3aGljaCBpcyBpbgo+IFBhbG1lcidzIHRyZWUuIEl0IGNh
bm5vdCBnbyB2aWEgYnBmLW5leHQuCgpUaGFua3MgZm9yIGxldHRpbmcgdXMga25vdywgdGhlbiBs
ZXRzIHJvdXRlIHRoaXMgZml4IHZpYSBQYWxtZXIuIE1heWJlIGhlIGNvdWxkCmFsc28gYWRkIEZp
eGVzIHRhZ3Mgd2hlbiBhcHBseWluZywgc28gc3RhYmxlIGNhbiBwaWNrIGl0IHVwIGxhdGVyIG9u
LgoKQ2hlZXJzLApEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
