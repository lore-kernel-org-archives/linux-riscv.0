Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE23C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+9QK4zXeCIAiWEb6+XcaSASPT6grPOhehRJWGHE9zs=; b=wjEYYCgblBnq1G
	M9uV8A1ZPPZ13HTcV337D3if6p0AKJgQzeUXccD7pBiuIQt0ZgJV373jhcWEgoBqq1j0Nk7Fn0WP3
	MZoFJS54Lh6Uxw8Dt0w53RvXAer+i8+XJj3soLxwv9T8zL5wEOY/wwldcjbG9Vnft9ALC6g2gV0lc
	JjlHdS7pQIbLIxtQQ4HhNHcxeT3jysA1J7PS/CI4gF9KMCS8VPs5/T69FnIvl/60N5eux3ZaZiboP
	La8p5vVGXACBcM3bqrw3hBlMwDp5INoEATFe9fGAqEofXupO25ebQJCdHyCJJ/E4QE/SIReaovNRF
	fRdQ4ITDSEYKNNWocAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1recTw-00000001Ile-3tw5;
	Mon, 26 Feb 2024 15:01:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1recTt-00000001IkR-39e9
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 15:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B32660CF7;
	Mon, 26 Feb 2024 15:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB7AC433C7;
	Mon, 26 Feb 2024 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708959684;
	bh=PMR5Baugew8ZudeAt7adXe2sXDT+X7P1/vLWZeSRSj0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BuhmgDku9kaoBnzoc66cRL7wsx10AWfAgNlqyCjGlKGTBfBn4rrHryqrlSbOXi2Vx
	 Zai8l/4AYc9bXExiox+nV5iKy4JewRR8nt5pa3SpZthSK8mnslsYy+qnPvIJ6EuO0g
	 8flrRd6vr2nh/98VB4g1ddYh2HbHP3znVopIMa9M29JntY6JpG/EAbgjsfTM1eo9tC
	 568cpk6sg0I0MjzYYl26pTsaeA6CH8bJFgWpXqXTdaMV93X6l2W9N2by3WQHYnyFXX
	 VVsy/PEC5uWGuq88E+zw8QvGhGMz+eEYaqjaf+vMC3eTmutDfPEprbMKX5i4oEMxiL
	 WzcT4SSuKUnkw==
Message-ID: <595c5b83-79a8-4b68-bf34-32241c83544a@kernel.org>
Date: Mon, 26 Feb 2024 07:01:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Atish Patra <atishp@rivosinc.com>
References: <20240226140649.293254-1-cleger@rivosinc.com>
 <07675649-181a-4509-a595-d7ff9230e402@kernel.org>
 <90b440e9-65b1-4482-88d4-f06e76863aa6@rivosinc.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <90b440e9-65b1-4482-88d4-f06e76863aa6@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_070125_924899_6D73D002 
X-CRM114-Status: GOOD (  13.83  )
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

T24gMjAyNC8wMi8yNiA2OjU5LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gCj4gCj4gT24gMjYv
MDIvMjAyNCAxNTo1NywgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4+IE9uIDIwMjQvMDIvMjYgNjow
NiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pj4gRGVwcmVjYXRpb24gb2YgTk9NTVUgc3VwcG9y
dCBmb3IgcmlzY3Ygd2FzIGRpc2N1c3NlZCBkdXJpbmcgTFBDIDIwMjMKPj4+IFsxXS4gUmVhc29u
cyBmb3IgdGhpcyBpbnZvbHZlcyBsYWNrIG9mIHVzZXJzIGFzIHdlbGwgYXMgbWFpbnRlbmFuY2UK
Pj4+IGVmZm9ydHMgdG8gc3VwcG9ydCB0aGlzIG1vZGUuIHBzQUJJIEZEUElDIHNwZWNpZmljYXRp
b24gYWxzbyBuZXZlcgo+Pj4gbWFkZSBpdCB1cHN0cmVhbSBhbmQgbGFzdCBwdWJsaWMgbWVzc2Fn
ZXMgb2YgdGhpcyBkZXZlbG9wbWVudCBzZWVtcyB0bwo+Pj4gZGF0ZSBiYWNrIGZyb20gMjAyMCBb
Ml0uIFBsYW4gdGhlIGRlcHJlY2F0aW9uIHRvIGJlIGRvbmUgaW4gMiB5ZWFycyBmcm9tCj4+PiBu
b3cuIE1hcmsgdGhlIEtjb25maWcgb3B0aW9uIGFzIGRlcHJlY2F0ZWQgYnkgYWRkaW5nIGEgbmV3
IGR1bW15IG9wdGlvbgo+Pj4gd2hpY2ggZXhwbGljaXRseSBkaXNwbGF5cyB0aGUgZGVwcmVjYXRp
b24gaW4gY2FzZSBvZiBDT05GSUdfTU1VPW4uIFRoaXMgb3B0aW9uCj4+PiBpcyBzZWxlY3RlZCBp
bmRpcmVjdGx5IGJ5IENPTkZJR19SSVNDVl9NX01PREUgc2luY2UgYW4gb3B0aW9uIGNhbiBub3QK
Pj4+IHNlbGVjdCBhbm90aGVyIG9uZSBkaXJlY3RseSB3aXRoIGEgInNlbGVjdCIgaW4gY2FzZSBv
ZiBzdWNoIENPTkZJRz1uLgo+Pj4gQWRkaXRpb25hbGx5LCBkaXNwbGF5IGEgcHJfZXJyKCkgbWVz
c2FnZSBhdCBib290IHRpbWUgaW4gY2FzZSBvZiBOT01NVQo+Pj4gYnVpbGQgdG8gd2FybiBhYm91
dCB1cGNvbWluZyBkZXByZWNhdGlvbi4KPj4+Cj4+PiBMaW5rOiBodHRwczovL2xwYy5ldmVudHMv
ZXZlbnQvMTcvY29udHJpYnV0aW9ucy8xNDc4LyBbMV0KPj4+IExpbms6IGh0dHBzOi8vZ3JvdXBz
Lmdvb2dsZS5jb20vYS9ncm91cHMucmlzY3Yub3JnL2cvc3ctZGV2L2MvWmpZVUpzd2tuUTQvbS9X
WVJSeWxUd0FBQUogWzJdCj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+Cj4+Pgo+Pj4gLS0tCj4+PiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAg
ICB8IDggKysrKysrKysKPj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIHwgNCArKysrCj4+
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4gaW5kZXggYmZmYmQ4
NjlhMDY4Li44ZGE1OGMxMDJkM2YgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcK
Pj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4gQEAgLTIyMSw2ICsyMjEsNyBAQCBjb25m
aWcgQVJDSF9NTUFQX1JORF9DT01QQVRfQklUU19NQVgKPj4+ICAjIHNldCBpZiB3ZSBydW4gaW4g
bWFjaGluZSBtb2RlLCBjbGVhcmVkIGlmIHdlIHJ1biBpbiBzdXBlcnZpc29yIG1vZGUKPj4+ICBj
b25maWcgUklTQ1ZfTV9NT0RFCj4+PiAgCWJvb2wKPj4+ICsJc2VsZWN0IE5PTU1VCj4+PiAgCWRl
ZmF1bHQgIU1NVQo+Pj4gIAo+Pj4gICMgc2V0IGlmIHdlIGFyZSBydW5uaW5nIGluIFMtbW9kZSBh
bmQgY2FuIHVzZSBTQkkgY2FsbHMKPj4+IEBAIC0yMzYsNiArMjM3LDEzIEBAIGNvbmZpZyBNTVUK
Pj4+ICAJICBTZWxlY3QgaWYgeW91IHdhbnQgTU1VLWJhc2VkIHZpcnR1YWxpc2VkIGFkZHJlc3Np
bmcgc3BhY2UKPj4+ICAJICBzdXBwb3J0IGJ5IHBhZ2VkIG1lbW9yeSBtYW5hZ2VtZW50LiBJZiB1
bnN1cmUsIHNheSAnWScuCj4+PiAgCj4+PiArY29uZmlnIE5PTU1VCj4+PiArCWRlcGVuZHMgb24g
IU1NVQo+Pj4gKwlib29sICJOT01NVSBrZXJuZWwgKERFUFJFQ0FURUQpIgo+Pj4gKwloZWxwCj4+
PiArCSAgTk9NTVUga2VybmVsIGlzIGRlcHJlY2F0ZWQgYW5kIGlzIHNjaGVkdWxlZCBmb3IgcmVt
b3ZhbCBieQo+Pj4gKwkgIHRoZSBiZWdpbm5pbmcgb2YgMjAyNy4KPj4KPj4gMiB5ZWFycyBmcm9t
IG5vdyBpcyAyMDI2Li4uCj4gCj4gR3Vlc3MgSSdtIGEgYml0IHRpcmVkIC1fLScKCk9mZi1ieS0x
IGJ1Zy4gSXQgaGFwcGVucyA6KQoKPiAKPj4KPj4+ICsKPj4+ICBjb25maWcgUEFHRV9PRkZTRVQK
Pj4+ICAJaGV4Cj4+PiAgCWRlZmF1bHQgMHhDMDAwMDAwMCBpZiAzMkJJVCAmJiBNTVUKPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
c2V0dXAuYwo+Pj4gaW5kZXggNGY3M2MwYWU0NGIyLi44Nzk5ODE2ZWYwYTYgMTAwNjQ0Cj4+PiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9zZXR1cC5jCj4+PiBAQCAtMjk1LDYgKzI5NSwxMCBAQCB2b2lkIF9faW5pdCBzZXR1cF9hcmNo
KGNoYXIgKipjbWRsaW5lX3ApCj4+PiAgCXJpc2N2X3NldF9kbWFfY2FjaGVfYWxpZ25tZW50KCk7
Cj4+PiAgCj4+PiAgCXJpc2N2X3VzZXJfaXNhX2VuYWJsZSgpOwo+Pj4gKwo+Pj4gKyNpZiAhZGVm
aW5lZChDT05GSUdfTU1VKQo+Pgo+PiAJaWYgKCFJU19FTkFCTEVEKENPTkZJR19NTVUpKQo+Pgo+
PiB3b3VsZCBiZSBtb3JlIGVsZWdhbnQgaGVyZS4uLgo+IAo+IFN1cmUuCj4gCj4+Cj4+PiArCXBy
X2VycigiUklTQy1WIE5PTU1VIHN1cHBvcnQgaXMgZGVwcmVjYXRlZCBhbmQgc2NoZWR1bGVkIGZv
ciByZW1vdmFsIGJ5IHRoZSBiZWdpbm5pbmcgb2YgMjAyN1xuIik7Cj4+Cj4+IFdoeSBwcl9lcnIo
KSA/IHByX3dhcm4oKSBzZWVtcyBtb3JlIGFwcHJvcHJpYXRlLgo+IAo+IEFncmVlZC4KPiAKPiBU
aGFua3MsCj4gCj4gQ2zDqW1lbnQKPiAKPj4KPj4+ICsjZW5kaWYKPj4+ICB9Cj4+PiAgCj4+PiAg
Ym9vbCBhcmNoX2NwdV9pc19ob3RwbHVnZ2FibGUoaW50IGNwdSkKPj4KCi0tIApEYW1pZW4gTGUg
TW9hbApXZXN0ZXJuIERpZ2l0YWwgUmVzZWFyY2gKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
