Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E6BCE7B19
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIaGTeWc6DqYSOr6FAsfmB2rSGlK2puL8yxGiqYWEjE=; b=FgSkJJy+CIdYxm
	ANkFx5dWeDMtt9GxauAC43/45Rv2KYJOdLStjKzfQSSrTJJjjofRIG5ngSAszwlkfmfQr7dGlBdo0
	cFH1i0fvlcRznmwAQVCjWWXK9sZS9h37gw3jwC8PHyz8VYfiJzwecF1wgSLFOipcb6XR9zEEw6e6D
	RKY6Whh0xOzhCKfBc5YJvQ1GlhtSvkWLzwMM8/6ZLNmJaagGL9I+YOkfN2WJpNC0O3STFizAb/gWN
	1PIEdX3abfojrxuV0OS0E/99Xq6S6ey4j6VzeuiQZqukseME5l5CCJ1RcsXdRKsHUmM5TtMqIQ36R
	TUdk4GQrKHwArWMtHDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZdt-0000000CTLO-3dWz;
	Fri, 06 Sep 2024 14:08:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZdp-0000000CTJE-3X2A
	for linux-riscv@lists.infradead.org;
	Fri, 06 Sep 2024 14:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1ED005C57C1;
	Fri,  6 Sep 2024 14:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD70CC4CEC4;
	Fri,  6 Sep 2024 14:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725631728;
	bh=/y/UqiYNJYSj4YSmig75Z6o0Ghm1ajTdKXOuhrekOdw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ubmNvtCpilRHsj7Xus8YQDC2qoYGmQPAc/rDpn0Ua6FyW8HYP74hBOgiTDR4T6pNg
	 tifCHe+EZY2kTYEna4qDRUKZBGRFchsF0ZKmp+NryT9czXh8UKs2xlp8csFNhSLFry
	 NLQPYIrTiBp4/hJYa1AHXmtlcFwEUm0Ot+T9TI0cX279T6xjPBR3DM23UUfVvAEXXL
	 BXxT22OgAkKQV/dIUJYeQ7c+Auja5BD6B0NvFEG56xxdk7/KupNitwHgX6/PWEn5ZV
	 r4u3souSQqQZN4iDDWJTANGKoT8yfw8Bz4a06eTK27LM00yG+/wACjAI9W5UzCpSP2
	 AUH/Z+EwRgchw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, Daniel Borkmann
 <daniel@iogearbox.net>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman
 <eddyz87@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Puranjay Mohan
 <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v3 00/10] Local vmtest enhancement and RV64
 =?utf-8?Q?enabled=F0=9F=98=81?=
In-Reply-To: <540dd7eb-1099-4c38-8004-1cb556b0b9be@huaweicloud.com>
References: <20240905081401.1894789-1-pulehui@huaweicloud.com>
 <e9816f7c-a603-c73e-5fcc-71bbcf6c6ca3@iogearbox.net>
 <540dd7eb-1099-4c38-8004-1cb556b0b9be@huaweicloud.com>
Date: Fri, 06 Sep 2024 16:08:44 +0200
Message-ID: <87bk10g9hv.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_070850_034594_7C11BDBF 
X-CRM114-Status: GOOD (  14.53  )
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

TGVodWksIERhbmllbCEKClB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JpdGVz
OgoKPiBPbiAyMDI0LzkvNiAyOjUyLCBEYW5pZWwgQm9ya21hbm4gd3JvdGU6Cj4+IE9uIDkvNS8y
NCAxMDoxMyBBTSwgUHUgTGVodWkgd3JvdGU6Cj4+PiBQYXRjaCAxLTMgZml4IHNvbWUgcHJvYmxl
bSBhYm91dCBicGYgc2VsZnRlc3RzLiBQYXRjaCA0IGFkZCBsb2NhbCByb290ZnMKPj4+IGltYWdl
IHN1cHBvcnQgZm9yIHZtdGVzdC4gUGF0Y2ggNSBlbmFibGUgY3Jvc3MtcGxhdGZvcm0gdGVzdGlu
ZyBmb3IKPj4+IHZtdGVzdC4gUGF0Y2ggNi0xMCBlbmFibGUgdm10ZXN0IG9uIFJWNjQuCj4+Pgo+
Pj4gV2UgY2FuIG5vdyBwZXJmb3JtIGNyb3NzIHBsYXRmb3JtIHRlc3RpbmcgZm9yIHJpc2N2NjQg
YnBmIHVzaW5nIHRoZQo+Pj4gZm9sbG93aW5nIGNvbW1hbmQ6Cj4+Pgo+Pj4gUExBVEZPUk09cmlz
Y3Y2NCBDUk9TU19DT01QSUxFPXJpc2N2NjQtbGludXgtZ251LSBcCj4+PiDCoMKgIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi92bXRlc3Quc2ggXAo+Pj4gwqDCoCAtbCA8cGF0aCBvZiBsb2Nh
bCByb290ZnMgaW1hZ2U+IC0tIFwKPj4+IMKgwqAgLi90ZXN0X3Byb2dzIC1kIFwKPj4+IMKgwqDC
oMKgwqDCoCBcIiQoY2F0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5yaXNj
djY0IFwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgY3V0IC1kJyMnIC1mMSBcCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IHNlZCAtZSAncy9eW1s6c3BhY2U6XV0qLy8nIFwKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC1lICdzL1tbOnNwYWNlOl1dKiQvLycgXAo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCB0ciAtcyAnXG4nICcsJyBcCj4+PiDCoMKgwqDCoMKgwqAg
KVwiCj4+Pgo+Pj4gRm9yIGJldHRlciByZWdyZXNzaW9uLCB3ZSByZWx5IG9uIGNvbW1pdCBbMF0u
IEFuZCBzaW5jZSB0aGUgd29yayBvZiByaXNjdgo+Pj4gZnRyYWNlIHRvIHJlbW92ZSBzdG9wX21h
Y2hpbmUgYXRvbWljIHJlcGxhY2VtZW50IGlzIGluIHByb2dyZXNzLCB3ZSBhbHNvCj4+PiBuZWVk
IHRvIHJldmVydCBjb21taXQgWzFdIFsyXS4KPj4+Cj4+PiBUaGUgdGVzdCBwbGF0Zm9ybSBpcyB4
ODZfNjQgYXJjaGl0ZWN0dXJlLCBhbmQgdGhlIHZlcnNpb25zIG9mIHJlbGV2YW50Cj4+PiBjb21w
b25lbnRzIGFyZSBhcyBmb2xsb3dzOgo+Pj4gwqDCoMKgwqAgUUVNVTogOC4yLjAKPj4+IMKgwqDC
oMKgIENMQU5HOiAxNy4wLjYgKGFsaWduIHRvIEJQRiBDSSkKPj4+IMKgwqDCoMKgIFJPT1RGUzog
dWJ1bnR1IG5vYmxlIChnZW5lcmF0ZWQgYnkgWzNdKQo+Pj4KPj4+IExpbms6IAo+Pj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwODMxMDcxNTIwLjE2MzAzNjAtMS1wdWxlaHVpQGh1
YXdlaWNsb3VkLmNvbS8gWzBdCj4+PiBMaW5rOiAKPj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTMz
MDgxNzIyNzZkYiBbMV0KPj4+IExpbms6IAo+Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9N2NhYTk3
NjU0NjVmIFsyXQo+Pj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2xpYmJwZi9jaS9ibG9iL21h
aW4vcm9vdGZzL21rcm9vdGZzX2RlYmlhbi5zaCAKPj4+IFszXQo+PiAKPj4gTmljZSB3b3JrISBO
ZXh0IHN0ZXAgaXMgdXBzdHJlYW0gQlBGIENJIGludGVncmF0aW9uPyA6KQo+Cj4gQ0MgQmrDtnJu
8J+YgQoKSW5kZWVkLCB2ZXJ5IG5pY2Ugd29yayEgRXZlcnkgeWVhciBpcyAiVGhlIHllYXIgb2Yg
UklTQy1WIEJQRiBDSQppbnRlZ3JhdGlvbiIuIDotUAoKPiBZZWFoLCB0aGF0J3Mgd2hhdCB3ZSdy
ZSBtb3N0IGxvb2tpbmcgZm9yd2FyZCB0byBhbmQgd2UndmUgYmVlbiB0cnlpbmcgdG8gCj4gbW92
ZSBmb3J3YXJkIHdpdGggdGhhdC4gVGhlcmUgYXJlIGN1cnJlbnRseSBzZXZlcmFsIG9wdGlvbnMs
IGJ1dCB0aGV5IAo+IGFyZSBub3QgdmVyeSBzdWl0YWJsZSB5ZXQuCj4KPiAxLiBDcm9zcy1wbGF0
Zm9ybSB0ZXN0aW5nIHdpdGggc3Vic2V0IG9mIHRlc3RzICh0ZXN0X3ZlcmlmaWVyICsgCj4gdGVz
dF9wcm9ncyksIGl0IHdpbGwgY29zdCBhIGJpdCBtb3JlIHRpbWUuCj4KPiB4ODZfNjQgaG9zdDoK
PiBTdW1tYXJ5OiA1MzYvMzU5NCBQQVNTRUQsIDY4IFNLSVBQRUQsIDAgRkFJTEVECj4gcmVhbCAg
ICAzMG0gMTguODhzCj4gdXNlciAgICA2bSA1Mi45N3MKPiBzeXMgICAgIDIxbSAzLjAzcwo+Cj4g
Mi4gQ3Jvc3MtcGxhdGZvcm0gdGVzdGluZyB3aWxsIHBhcmFsbGVsIG1vZGUsIGl0IHdpbGwgbWVl
dCBmbGFreSAKPiBwcm9ibGVtcyB3aGlsZSB0aGUgdGltZSBjb25zdW1lIGxvb2tzIGdvb2QuCj4K
PiB4ODZfNjQgaG9zdDoKPiByZWFsICAgIDdtIDQ1LjQycwo+IHVzZXIgICAgNm0gMTMuNTlzCj4g
c3lzICAgICAxNW0gNDEuMTJzCj4KPiAzLiBSZWFsIGJvYXJkIHRlc3RpbmcsIHdoaWNoIHJlbGll
cyBvbiBIeXBlcnZpc29yIEV4dGVuc2lvbiB0byBlbmFibGUgCj4ga3ZtIG9uIHFlbXUuIFdlIGFy
ZSBzdGlsbCB0cnlpbmcgdG8gZmluZCBhIHN1aXRhYmxlIGJvYXJkLgoKVGhlcmUncyBhIGJvYXJk
IGNvbWluZyBvdXQgc29vbmlzaCB3aXRoIEggLS0gbGV0J3MgaG9wZSBpdCBkb2Vzbid0IHN1Y2sh
CjstKQoKSSBoYXZlIGEgQ0kgcnVubmluZywgdGhhdCdzIHJ1bnMgYWxsIHRoZSBCUEYgdGVzdHMg
KGFuZCB0aGUgcmVzdCBvZgprc2VsZnRlc3QpIG9uIHZhcmlvdXMgdHJlZXMvYnJhbmNoZXMsIGFu
ZCBpdCB0YWtlcyAqaG91cnMqIG9uIFFFTVUgVENHClsxXSAodGhlIEdIIENJIGRvZXNuJ3QgcmVw
b3J0IGZhaWwvb2sgaW4gdGhlIFVJLCBzbyB5b3UgbmVlZCB0byBkb3dubG9hZAp0aGUgbG9ncyBb
Ml0gLS0gZmlsZW5hbWUgKmtzZWxmdGVzdC1icGYqKS4KCk9idmlvdXNseSB0aGlzIGlzIGEgbm8t
Z28gZm9yIHByZS1jb21taXQvcGF0Y2h3b3JrIENJLCBidXQgZm9yLCBzYXksCmEgbG9uZ2VyIHJl
bGVhc2UgdGVzdCAocG9zdC1jb21taXQpLCBzcGVuZGluZyBhIGNvdXBsZSBvZiBob3VycyBvbiBh
CnRlc3Qgd291bGQgcHJvYmFibHkgYmUgT0suCgpJZiB0aGVyZSdzIGEgcG9zdC1jb21taXQgQ0kg
cnVubmluZyBzb21ld2hlcmUsIG1heWJlIHdlIGNvdWxkIHBsdWcgaW4KUklTQy1WIEJQRiBRRU1V
IFRDRyB0ZXN0cyB0aGVyZT8gLi4uYW5kIHRoZW4gd2hlbiB3ZSBnZXQgcHJvcGVyIEgKbWFjaGlu
ZXMsIHdlIGNhbiBhZGQgUklTQy1WIHRvIE1ldGEncyBQVyBDSSBhcyB3ZWxsLgoKRGFuaWVsLCBp
cyB0aGVyZSBhICJyZWxlYXNlIHRlc3QgQ0kiIHJ1bm5pbmcsIG9yIGlzIHRoYXQgbW9zdGx5IG1h
bnVhbAp3b3JrPwoKQmrDtnJuCgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9s
aW51eC1yaXNjdi9hY3Rpb25zL3J1bnMvMTA3MjUyMzc4NjUvam9iLzI5NzQyNjMyMjIyI3N0ZXA6
NTozMApbMl0gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4LXJpc2N2L2FjdGlv
bnMvcnVucy8xMDcyNTIzNzg2NS9hcnRpZmFjdHMvMTg5OTQyMTg5NwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
