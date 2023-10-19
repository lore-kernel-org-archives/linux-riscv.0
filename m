Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0A8CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 05:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rG617/KfD4R6sC0a5AH7wwfjbELoQ3uXyfDD5isqE6Q=; b=qZkpjXIO0DokNV
	FS7k9VIGsrR6KTaox3T73mhMcWfLcitvrqvqUCnmRFzMoMK/AexmD5BHML1206S+qadHSV6JnEw3A
	twLcwekalSY6ximvw9agkB5vl9ZJlXZ8EOJXzrFHzwDMNFtz371uEgcPuz4XRnVkrcs9Vw9Xa6/2X
	uD3wnL50BH/nubfuMRujtgsE9i2nk4Xq0eFXIjVpVrqtExDEKO0sbNyJConYfmNu+wv8I5CUC1e8U
	w7wMynpeCbIbk9jKuBA1CDcGsK5KYvy1X9HOOV3OX4c2O+8+5fsOuL1E7c+4sEX1l6IWxRm353Xyi
	zhRlcf+qotC5caUQt7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtM1p-00GQ5K-1g;
	Thu, 19 Oct 2023 05:57:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtM1k-00GPui-1f
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 05:57:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CC39AB82638;
	Thu, 19 Oct 2023 05:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97A2C433C7;
	Thu, 19 Oct 2023 05:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697695014;
	bh=uwIr5PLksnwLyxgqpvtx+QliRJtVX8iY9+2hAVOlS40=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Smj2XLAMaNBJ1/8/b0GDTW7Kox2CgBUOvlYD9PNeDgRBrWEmUCmfnRlP0oWmsR808
	 08jm9ZKZUsbpARNM8oqluOYrjMFym4ezH8hzYoonUL0pc5bu8JWNdiogCMVuez5p7n
	 0ENO7X9EDvNG7DkUGBce8+SzhBnmUiAmKALM6AGCI37CZTJJYQEWaJ0YY5y1zuXAWK
	 HwWHZU8/x+39fDDSQy1cWs8iy5H0mM+AKle6dcGnMB6G9rHMgnPUoH34l/ymfxeFXq
	 jzE4Vp6zgTmY4n9IsfO3MDrdoJ6HcN8idM2l6swOcRnXFT8Jlzlpp7SZMfTPtYRRYF
	 5eKVn0U6y5prQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v4 0/2] riscv: Add remaining module relocations and tests
In-Reply-To: <20231018-confidant-frostily-e8f4dbdcd478@spud>
References: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
 <20231018-smite-bungee-f46b15b4ce6f@spud> <ZTAWcX1qVhkC71BJ@ghost>
 <20231018-confidant-frostily-e8f4dbdcd478@spud>
Date: Thu, 19 Oct 2023 07:56:51 +0200
Message-ID: <87y1fzxiho.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_225700_890040_42690469 
X-CRM114-Status: GOOD (  24.96  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IE9uIFdlZCwgT2N0IDE4
LCAyMDIzIGF0IDEwOjMxOjI5QU0gLTA3MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPj4gT24g
V2VkLCBPY3QgMTgsIDIwMjMgYXQgMTI6MzU6NTVQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3Rl
Ogo+PiA+IEhleSBDaGFybGllLAo+PiA+IAo+PiA+IE9uIFR1ZSwgT2N0IDE3LCAyMDIzIGF0IDEw
OjM0OjE1UE0gLTA3MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPj4gPiA+IEEgaGFuZGZ1bCBv
ZiBtb2R1bGUgcmVsb2NhdGlvbnMgd2VyZSBtaXNzaW5nLCB0aGlzIHBhdGNoIGluY2x1ZGVzIHRo
ZQo+PiA+ID4gcmVtYWluaW5nIG9uZXMuIEkgYWxzbyB3cm90ZSBzb21lIHRlc3QgY2FzZXMgdG8g
ZW5zdXJlIHRoYXQgbW9kdWxlCj4+ID4gPiBsb2FkaW5nIHdvcmtzIHByb3Blcmx5LiBTb21lIHJl
bG9jYXRpb25zIGNhbm5vdCBiZSBzdXBwb3J0ZWQgaW4gdGhlCj4+ID4gPiBrZXJuZWwsIHRoZXNl
IGluY2x1ZGUgdGhlIG9uZXMgdGhhdCByZWx5IG9uIHRocmVhZCBsb2NhbCBzdG9yYWdlIGFuZAo+
PiA+ID4gZHluYW1pYyBsaW5raW5nLgo+PiA+ID4gCj4+ID4gPiBVTEVCMTI4IGhhbmRsaW5nIGlz
IGEgYml0IHNwZWNpYWwgYmVjYXVzZSBTRVQgYW5kIFNVQiByZWxvY2F0aW9ucyBtdXN0Cj4+ID4g
PiBoYXBwZW4gdG9nZXRoZXIsIGFuZCBTRVQgbXVzdCBoYXBwZW4gYmVmb3JlIFNVQi4gQSBwc0FC
SSBwcm9wb3NhbCBbMV0KPj4gPiA+IG1hbmRhdGVzIHRoYXQgdGhlIGZpcnN0IFNFVF9VTEVCMTI4
IHRoYXQgYXBwZWFycyBiZWZvcmUgYSBTVUJfVUxFQjEyOAo+PiA+ID4gaXMgdGhlIGFzc29jaWF0
ZWQgU0VUX1VMRUIxMjguCj4+ID4gPiAKPj4gPiA+IFRoaXMgY2FuIGJlIHRlc3RlZCBieSBlbmFi
bGluZyBLVU5JVCwgUlVOVElNRV9LRVJORUxfVEVTVElOR19NRU5VLCBhbmQKPj4gPiA+IFJJU0NW
X01PRFVMRV9MSU5LSU5HX0tVTklULgo+PiA+ID4gCj4+ID4gPiBbMV0gaHR0cHM6Ly9naXRodWIu
Y29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtZWxmLXBzYWJpLWRvYy9wdWxsLzQwMwo+PiA+ID4gCj4+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29t
Pgo+PiA+ID4gLS0tCj4+ID4gPiBDaGFuZ2VzIGluIHY0Ogo+PiA+ID4gLSBDb21wbGV0ZSByZW1v
dmFsIG9mIFJfUklTQ1ZfUlZDX0xVSQo+PiA+ID4gLSBGaXggYnVnIGluIFJfUklTQ1ZfU1VCNiBs
aW5raW5nCj4+ID4gPiAtIE9ubHkgYnVpbGQgVUxFQjEyOCB0ZXN0cyBpZiBzdXBwb3J0ZWQgYnkg
dG9vbGNoYWluCj4+ID4gPiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyMzEwMTYtbW9kdWxlX3JlbG9jYXRpb25zLXYzLTAtYTY2N2ZkNjA3MWU5QHJpdm9zaW5jLmNv
bQo+PiA+IAo+PiA+IE9uIHBhdGNoIDIvMjoKPj4gPiAKPj4gPiAuLi9hcmNoL3Jpc2N2L2tlcm5l
bC90ZXN0cy9tb2R1bGVfdGVzdC90ZXN0X3VsZWIxMjguUzoxODoxNzogZXJyb3I6IHVua25vd24g
cmVsb2NhdGlvbiBuYW1lCj4+ID4gLi4vYXJjaC9yaXNjdi9rZXJuZWwvdGVzdHMvbW9kdWxlX3Rl
c3QvdGVzdF91bGViMTI4LlM6MTk6MTc6IGVycm9yOiB1bmtub3duIHJlbG9jYXRpb24gbmFtZQo+
PiA+IAo+PiA+IFNhbWUgdG9vbGNoYWluIGNvbmZpZ3VyYXRpb24gaW4gdGhlIHBhdGNod29yayBh
dXRvbWF0aW9uIGFzIGJlZm9yZS4KPj4gPiAKPj4gPiBDaGVlcnMsCj4+ID4gQ29ub3IuCj4+IAo+
PiBXaGVyZSBkbyB5b3Ugc2VlIHRoaXMgZXJyb3I/IE9uIFBhdGNod29yayBJIHNlZSBhIHN1Y2Nl
c3MgWzFdLgo+PiAKPj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC1yaXNjdi9wYXRjaC8yMDIzMTAxNy1tb2R1bGVfcmVsb2NhdGlvbnMtdjQtMi05MzdmNWVm
MzE2ZjBAcml2b3NpbmMuY29tLwo+Cj4gSXQgd2FzIGEgZmFpbHVyZSB0aGlzIG1vcm5pbmchCj4g
U2VlCj4gPGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9saW51eC1yaXNjdi9hY3Rpb25z
L3J1bnMvNjU0OTI4MDc3MS9qb2IvMTc3ODU4NDQwMTM+Cj4KPiBJIHdvbmRlciBpZiB0aGVyZSBp
cyBzb21ldGhpbmcgd3Jvbmcgd2l0aCB0aGUgQ0kgY29kZSwgd2hlcmUgaXQKPiBlcnJvbmVvdXNs
eSByZXBvcnRzIHRoZSBzdGF0ZSBmcm9tIHByZXZpb3VzIHBhdGNoZXMgYW5kIHRoZW4gcnVucyB0
aGUKPiB0ZXN0cyBhZ2FpbiB3aXRoIHRoZSBuZXcgcGF0Y2hlcyBhbmQgcmUtcHVzaGVzIHRoZSBy
ZXN1bHRzLgo+Cj4gQmpvcm4sIGFueSBpZGVhPwoKVGhlIFBXIHN5bmNoZXIgdHJpZXMgdG8gcmV1
c2UgdGhlIEdpdGh1YiBQUiBicmFuY2ggZm9yIG5ld2VyIHZlcnNpb25zLgpTYXkgdGhhdCB2NCBo
YXMgc29tZSBzZXQgb2YgcmVzdWx0cywgYW5kIHY1IHNvbWUgc2V0IG9mIHJlc3VsdHMuIFRoZW4s
Cml0J2xsIGJlIGEgYml0IG9mIGZsdXggdW50aWwgdjUgaXMgZnVsbHkgYnVpbHQuCgpIbW0sIEkn
bGwgdHJ5IHRvIGltcHJvdmUgdGhhdC4gVGhlIFBXIHY0IHNob3VsZCBuZXZlciBnZXQgcmVzdWx0
cyBmcm9tClBXIHY1Li4uCgpGV0lXLCB0aGUgdjUgb2YgdGhlIHNlcmllcwpodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8/c2VyaWVzPTc5NDUyMSBo
YXMKYSBidW5jaCBvZiBlcnJvcnMuCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
