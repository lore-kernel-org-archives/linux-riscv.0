Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D3CC47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 20:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oh8X8euNSgtQCg/7/BQTbZ9hjZ4aXDXJ5/jgjBeHiPY=; b=ngn9MCDUm1mnVO
	HOdRY0EhanKhoD5ai+FMnMewz9rTnSRgFhc7Wa05NIbrczsLihi8GgVSv3iE8z3Q57jnIUvGcVavb
	cGP0hx6EGb9hnE8E5KAZwU5qSwOz++k/aWI0g4Aq7KdAjXp7xgy3w/bCnwraCPdDaVprS81M/QefO
	3AbPnr9Nr2ZqV0dvWk2OI9hLfr/muYTaZLJf2ZgSIwGw87Rcfdn9xlfr/sh9yy19h5nl2Y2ciL44g
	h/7yOuyPWR0fN05rbezK/+sxIT6K+FW82jRpBWjNw+Sx/x/ndcIkIHNoq60Rxj+khGAxgYko0mzMC
	hA49gv1ufFDG+bJjZ4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1XE-0017CK-1t;
	Thu, 11 Jan 2024 20:20:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1X8-00177c-16;
	Thu, 11 Jan 2024 20:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B49E1B82143;
	Thu, 11 Jan 2024 20:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C575C43390;
	Thu, 11 Jan 2024 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705004407;
	bh=+QavJfo5shHsDI54vIkucOEkmDxcfkwD6QfPD3io40U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pz76U6jPieOUiWYaAgRMSZ0RaLxs3b1cj+yfIzSrgCEHRBjcAABzNWoHXXaVgbbVR
	 JNL9z6/6pKRr8TJbyGaLt7nR6s0+DfKU4aAcu4ZDw5Do5dHTvwf4BPKmoh0ZdmM/wj
	 jISSXv6Gt4afZr8OahwxcH5973TMwOHw2ZxyVygTiXXrAn8B+w5p4KN/47VPigb+oS
	 lYek+N6adK2I8qsxnhvl1i233QVbL1Z/OOAND2xJb1gcc/MqtuOAhpUYiVLBzA8k05
	 Pn5/fUyVcxSYy0zI54/QOKcb1yk1mCMG9Vo/M2TPP27bkS1dSLsIkepje263KX/Vl3
	 DZj5TG7UMZ1Rw==
Date: Thu, 11 Jan 2024 13:20:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Yonghong Song <yonghong.song@linux.dev>,
	clang-built-linux <llvm@lists.linux.dev>, patches@lists.linux.dev,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-s390 <linux-s390@vger.kernel.org>,
	Linux Power Management <linux-pm@vger.kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-efi <linux-efi@vger.kernel.org>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-arch <linux-arch@vger.kernel.org>,
	kasan-dev <kasan-dev@googlegroups.com>,
	linux-mm <linux-mm@kvack.org>, bridge@lists.linux.dev,
	Network Development <netdev@vger.kernel.org>,
	LSM List <linux-security-module@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, bpf <bpf@vger.kernel.org>
Subject: Re: [PATCH 1/3] selftests/bpf: Update LLVM Phabricator links
Message-ID: <20240111202003.GA3418790@dev-arch.thelio-3990X>
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
 <20240109-update-llvm-links-v1-1-eb09b59db071@kernel.org>
 <6a655e9f-9878-4292-9d16-f988c4bdfc73@linux.dev>
 <20240111194001.GA3805856@dev-arch.thelio-3990X>
 <CAADnVQKFv2DKE=Um=+kcEzSWYCp9USQT_VpTawzNY6eRaUdu5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAADnVQKFv2DKE=Um=+kcEzSWYCp9USQT_VpTawzNY6eRaUdu5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_122010_656773_1FD3B30D 
X-CRM114-Status: GOOD (  26.64  )
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

SGkgQWxleGVpLAoKT24gVGh1LCBKYW4gMTEsIDIwMjQgYXQgMTI6MDA6NTBQTSAtMDgwMCwgQWxl
eGVpIFN0YXJvdm9pdG92IHdyb3RlOgo+IE9uIFRodSwgSmFuIDExLCAyMDI0IGF0IDExOjQw4oCv
QU0gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBI
aSBZb25naG9uZywKPiA+Cj4gPiBPbiBXZWQsIEphbiAxMCwgMjAyNCBhdCAwODowNTozNlBNIC0w
ODAwLCBZb25naG9uZyBTb25nIHdyb3RlOgo+ID4gPgo+ID4gPiBPbiAxLzkvMjQgMjoxNiBQTSwg
TmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4gPiA+ID4gcmV2aWV3cy5sbHZtLm9yZyB3YXMgTExW
TSdzIFBoYWJyaWNhdG9yIGluc3RhbmNlcyBmb3IgY29kZSByZXZpZXcuIEl0Cj4gPiA+ID4gaGFz
IGJlZW4gYWJhbmRvbmVkIGluIGZhdm9yIG9mIEdpdEh1YiBwdWxsIHJlcXVlc3RzLiBXaGlsZSB0
aGUgbWFqb3JpdHkKPiA+ID4gPiBvZiBsaW5rcyBpbiB0aGUga2VybmVsIHNvdXJjZXMgc3RpbGwg
d29yayBiZWNhdXNlIG9mIHRoZSB3b3JrIEZhbmdydWkKPiA+ID4gPiBoYXMgZG9uZSB0dXJuaW5n
IHRoZSBkeW5hbWljIFBoYWJyaWNhdG9yIGluc3RhbmNlIGludG8gYSBzdGF0aWMgYXJjaGl2ZSwK
PiA+ID4gPiB0aGVyZSBhcmUgc29tZSBpc3N1ZXMgd2l0aCB0aGF0IHdvcmssIHNvIHByZWVtcHRp
dmVseSBjb252ZXJ0IGFsbCB0aGUKPiA+ID4gPiBsaW5rcyBpbiB0aGUga2VybmVsIHNvdXJjZXMg
dG8gcG9pbnQgdG8gdGhlIGNvbW1pdCBvbiBHaXRIdWIuCj4gPiA+ID4KPiA+ID4gPiBNb3N0IG9m
IHRoZSBjb21taXRzIGhhdmUgdGhlIGNvcnJlc3BvbmRpbmcgZGlmZmVyZW50aWFsIHJldmlldyBs
aW5rIGluCj4gPiA+ID4gdGhlIGNvbW1pdCBtZXNzYWdlIGl0c2VsZiBzbyB0aGVyZSBzaG91bGQg
bm90IGJlIGFueSBsb3NzIG9mIGZpZGVsaXR5IGluCj4gPiA+ID4gdGhlIHJlbGV2YW50IGluZm9y
bWF0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gQWRkaXRpb25hbGx5LCBmaXggYSB0eXBvIGluIHRoZSB4
ZHB3YWxsLmMgcHJpbnQgKCJMTE1WIiAtPiAiTExWTSIpIHdoaWxlCj4gPiA+ID4gaW4gdGhlIGFy
ZWEuCj4gPiA+ID4KPiA+ID4gPiBMaW5rOiBodHRwczovL2Rpc2NvdXJzZS5sbHZtLm9yZy90L3Vw
ZGF0ZS1vbi1naXRodWItcHVsbC1yZXF1ZXN0cy83MTU0MC8xNzIKPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4gPiA+Cj4gPiA+IEFj
ayB3aXRoIG9uZSBuaXQgYmVsb3cuCj4gPiA+Cj4gPiA+IEFja2VkLWJ5OiBZb25naG9uZyBTb25n
IDx5b25naG9uZy5zb25nQGxpbnV4LmRldj4KPiA+Cj4gPiA8c25pcD4KPiA+Cj4gPiA+ID4gQEAg
LTMwNCw2ICszMDQsNiBAQCBmcm9tIHJ1bm5pbmcgdGVzdF9wcm9ncyB3aWxsIGxvb2sgbGlrZToK
PiA+ID4gPiAgIC4uIGNvZGUtYmxvY2s6OiBjb25zb2xlCj4gPiA+ID4gLSAgdGVzdF94ZHB3YWxs
OkZBSUw6RG9lcyBMTFZNIGhhdmUgaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0QxMDkwNzM/IHVu
ZXhwZWN0ZWQgZXJyb3I6IC00MDA3Cj4gPiA+ID4gKyAgdGVzdF94ZHB3YWxsOkZBSUw6RG9lcyBM
TFZNIGhhdmUgaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC9lYTcy
YjAzMTlkN2IwZjBjMmZjZjQxZDEyMWFmYTVkMDMxYjMxOWQ1PyB1bmV4cGVjdGVkIGVycm9yOiAt
NDAwNwo+ID4gPiA+IC1fXyBodHRwczovL3Jldmlld3MubGx2bS5vcmcvRDEwOTA3Mwo+ID4gPiA+
ICtfXyBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvY29tbWl0L2VhNzJiMDMx
OWQ3YjBmMGMyZmNmNDFkMTIxYWZhNWQwMzFiMzE5ZAo+ID4gPgo+ID4gPiBUbyBiZSBjb25zaXN0
ZW50IHdpdGggb3RoZXIgbGlua3MsIGNvdWxkIHlvdSBhZGQgdGhlIG1pc3NpbmcgbGFzdCBhbG51
bSAnNScgdG8gdGhlIGFib3ZlIGxpbms/Cj4gPgo+ID4gVGhhbmtzIGEgbG90IGZvciBjYXRjaGlu
ZyB0aGlzIGFuZCBwcm92aWRpbmcgYW4gYWNrLiBBbmRyZXcsIGNvdWxkIHlvdQo+ID4gc3F1YXNo
IHRoaXMgdXBkYXRlIGludG8gc2VsZnRlc3RzLWJwZi11cGRhdGUtbGx2bS1waGFicmljYXRvci1s
aW5rcy5wYXRjaD8KPiAKPiBQbGVhc2Ugc2VuZCBhIG5ldyBwYXRjaC4KPiBXZSdkIGxpa2UgdG8g
dGFrZSBhbGwgYnBmIHBhdGNoZXMgdGhyb3VnaCB0aGUgYnBmIHRyZWUgdG8gYXZvaWQgY29uZmxp
Y3RzLgoKVmVyeSB3ZWxsLCBJJ3ZlIHNlbnQgYSBzdGFuZGFsb25lIHYyIG9uIHRvcCBvZiBicGYt
bmV4dDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnLzIwMjQwMTExLWJwZi11cGRhdGUtbGx2bS1w
aGFicmljYXRvci1saW5rcy12Mi0xLTlhN2FlOTc2YmQ2NEBrZXJuZWwub3JnLwoKQW5kcmV3LCBq
dXN0IGRyb3Agc2VsZnRlc3RzLWJwZi11cGRhdGUtbGx2bS1waGFicmljYXRvci1saW5rcy5wYXRj
aAphbHRvZ2V0aGVyIGluIHRoYXQgY2FzZSwgdGhlIG90aGVyIHR3byBwYXRjaGVzIGFyZSBmaW5l
IHRvIGdvIHZpYSAtbW0gSQp0aGluay4KCkNoZWVycywKTmF0aGFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
