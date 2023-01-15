Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438FBC46467
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 14:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cj+Zcz6N+vKBFdXOluil2B07nPQpKjon8YQqksBeoOQ=; b=vqVEJQMv+gBcQU
	4Mtu8nlHiibqyDkK6UptX+/C3FKrxd2/8t0u/sil1YNoRqGMGN/8+sOeY4jQ2oQ/qdfuZmmCVbZdR
	YKfDouzyZCQQx7dNCEb1C1bUSRjnKTYfsfkBdr1vdXAVrYUWyo10Tq/t3bbOl/5kapSF0aFRaQVKW
	/jkjhHmbSiTzIlb2rxuIiuzqCIEcvw6OI/4vaE9k+YrZurpvB2ScJQVZFl91gi1kK2YBUvwaT5ai4
	Vc/zxqJdzZlxwUBx30It03fN6YpmPuAl2B9VQSfdDVXA/nV3BTHYNzzkRHtWKCk7jy+F/YcKL8dqh
	3ZXzsLo71t+Tv1qJUAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH3hi-007QE2-D9; Sun, 15 Jan 2023 14:09:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH3he-007QDK-DW; Sun, 15 Jan 2023 14:09:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7BE960C4D;
	Sun, 15 Jan 2023 14:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E1AC433D2;
	Sun, 15 Jan 2023 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673791781;
	bh=zRcvm8EavOwpoEQYu0yKJXbKuP4uobFu5WALEjpcP2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Me+1CzjEHuvOGX9tmzeZvwmy5/Ye7+OtsoY4qhSzsvUluuntBMZ1kbsKyo4DZkpv3
	 8LHx+kzUAMUd4Qf9yUJsCRPG4RRXxmVooWzr3jOMA7UMr9lLUMW1PS4dopDMxkqj7+
	 3BnGofdmns+q2gJnKMgd2iZXZ1dyoW9UAr2jg1Q2dbcGvNNI928OF+pyKGTt36uH4C
	 AngzjQTQ+bFdxQiADUiLXSWnX41/QS4YDGosNavH1BjHb14X8wkAcu2Aubbl2irbVf
	 6rwBBW/RzYJPNHDltGMPBlWbutzQHG2jrHhr50PyytTzgwrrC08aejhj3HEDL3XZ/d
	 oqcEZFVj7mDWw==
Date: Sun, 15 Jan 2023 21:59:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
Message-ID: <Y8QGtlnZKk5rp+fg@xhacker>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-6-jszhang@kernel.org>
 <2398293.3Lj2Plt8kZ@diego>
 <20230112092136.f2g43hrhmrqouy4y@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230112092136.f2g43hrhmrqouy4y@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_060942_551944_4391E63A 
X-CRM114-Status: GOOD (  28.07  )
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

T24gVGh1LCBKYW4gMTIsIDIwMjMgYXQgMTA6MjE6MzZBTSArMDEwMCwgQW5kcmV3IEpvbmVzIHdy
b3RlOgo+IE9uIFRodSwgSmFuIDEyLCAyMDIzIGF0IDEyOjI5OjU3QU0gKzAxMDAsIEhlaWtvIFN0
w7xibmVyIHdyb3RlOgo+ID4gSGkgSmlzaGVuZy4KPiA+IAo+ID4gQW0gTWl0dHdvY2gsIDExLiBK
YW51YXIgMjAyMywgMTg6MTA6MTkgQ0VUIHNjaHJpZWIgSmlzaGVuZyBaaGFuZzoKPiA+ID4gcmlz
Y3ZfY3B1ZmVhdHVyZV9wYXRjaF9mdW5jKCkgY3VycmVudGx5IG9ubHkgc2NhbnMgYSBsaW1pdGVk
IHNldCBvZgo+ID4gPiBjcHVmZWF0dXJlcywgZXhwbGljaXRseSBkZWZpbmVkIHdpdGggbWFjcm9z
LiBFeHRlbmQgaXQgdG8gcHJvYmUgZm9yIGFsbAo+ID4gPiBJU0EgZXh0ZW5zaW9ucy4KPiA+ID4g
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4K
PiA+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
Cj4gPiA+IFJldmlld2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+ID4g
PiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCB8ICA5ICsr
LS0KPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICB8IDYzICsrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGhtbW0gLi4uIEkgZG8gc2VlIGEgc29t
ZXdoYXQgYmlnIGNhdmVhdCBmb3IgdGhpcy4KPiA+IGFuZCB3b3VsZCBsaWtlIHRvIHRha2UgYmFj
ayBteSBSZXZpZXdlZC1ieSBmb3Igbm93Cj4gPiAKPiA+IAo+ID4gV2l0aCB0aGlzIGNoYW5nZSB3
ZSB3b3VsZCBsaW1pdCB0aGUgcGF0Y2hhYmxlIGNwdWZlYXR1cmVzIHRvIGFjdHVhbAo+ID4gcmlz
Y3YgZXh0ZW5zaW9ucy4gQnV0IGNwdWZlYXR1cmVzIGNhbiBhbHNvIGJlIHNvZnQgZmVhdHVyZXMg
bGlrZQo+ID4gaG93IHBlcmZvcm1hbnQgdGhlIGNvcmUgaGFuZGxlcyB1bmFsaWduZWQgYWNjZXNz
ZXMuCj4gCj4gSSBhZ3JlZSB0aGF0IHRoaXMgbmVlZHMgdG8gYmUgYWRkcmVzc2VkIGFuZCBKaXNo
ZW5nIGFsc28gcmFpc2VkIHRoaXMKPiB5ZXN0ZXJkYXkgaGVyZSBbKl0uIEl0IHNlZW1zIHdlIG5l
ZWQgdGhlIGNvbmNlcHQgb2YgY3B1ZmVhdHVyZXMsIHdoaWNoCj4gbWF5IGJlIGV4dGVuc2lvbnMg
b3Igbm9uLWV4dGVuc2lvbnMuCj4gCj4gWypdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9Z
Nzd4eU5QTnFuRlFVcUF4QHhoYWNrZXIvCj4gCj4gPiAKPiA+IFNlZSBQYWxtZXIncyBzZXJpZXMg
WzBdLgo+ID4gCj4gPiAKPiA+IEFsc28gdGhpcyBlc3NlbnRpYWxseSBjb2RpZmllcyB0aGF0IGVh
Y2ggQUxURVJOQVRJVkUgY2FuIG9ubHkgZXZlcgo+ID4gYmUgYXR0YWNoZWQgdG8gZXhhY3RseSBv
bmUgZXh0ZW5zaW9uLgo+ID4gCj4gPiBCdXQgY29udHJhcnkgdG8gdmVuZG9yLWVycmF0YSwgaXQg
aXMgdmVyeSBsaWtlbHkgdGhhdCB3ZSB3aWxsIG5lZWQKPiA+IGNvbWJpbmF0aW9ucyBvZiBkaWZm
ZXJlbnQgZXh0ZW5zaW9ucyBmb3Igc29tZSBhbHRlcm5hdGl2ZXMgaW4gdGhlIGZ1dHVyZS4KPiAK
PiBPbmUgcG9zc2libGUgYXBwcm9hY2ggbWF5IGJlIHRvIGNvbWJpbmUgZXh0ZW5zaW9ucy9ub24t
ZXh0ZW5zaW9ucyBhdCBib290Cj4gdGltZSBpbnRvIHBzZXVkby1jcHVmZWF0dXJlcy4gVGhlbiwg
YWx0ZXJuYXRpdmVzIGNhbiBjb250aW51ZSBhdHRhY2hpbmcgdG8KPiBhIHNpbmdsZSAiZmVhdHVy
ZSIuIChJJ20gbm90IHNheWluZyB0aGF0J3MgYSBiZXR0ZXIgYXBwcm9hY2ggdGhhbiB0aGUKPiBi
aXRtYXAsIEknbSBqdXN0IHN1Z2dlc3RpbmcgaXQgYXMgc29tZXRoaW5nIGVsc2UgdG8gY29uc2lk
ZXIuKQoKV2hlbiBzd3RpY2hpbmcgcGd0YWJsZV9sNF9lbmFibGVkIHRvIHN0YXRpYyBrZXkgZm9y
IHRoZSBmaXJzdCB0aW1lLCBJCnN1Z2dlc3RlZCBiaXRtYXAgZm9yIGNwdWZlYXR1cmVzIHdoaWNo
IGNvdmVyIGJvdGggSVNBIGV4dGVuc2lvbnMKYW5kIG5vbi1leHRlbnNpb25zLWJ1dC1zb21lLWNw
dS1yZWxhdGVkLWZlYXR1cmVzIFsxXSwKYnV0IGl0IHdhcyByZWplY3RlZCBhdCB0aGF0IHRpbWUs
IGl0IHNlZW1zIHdlIG5lZWQgdG8gcmV2aXNpdCB0aGUgaWRlYS4KClsxXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIyMDUwODE2MDc0OS45ODQtMS1qc3poYW5nQGtlcm5l
bC5vcmcvCgo+IAo+IFRoYW5rcywKPiBkcmV3Cj4gCj4gPiAKPiA+IEluIG15IG9wdGltaXphdGlv
biBxdWVzdCwgSSBmb3VuZCB0aGF0IGl0J3MgYWN0dWFsbHkgcHJldHR5IG5lYXQgdG8KPiA+IGNv
bnZlcnQgdGhlIGVycmF0YS1pZCBmb3IgY3B1ZmVhdHVyZXMgdG8gYSBiaXRmaWVsZCBbMV0sIGJl
Y2F1c2UgdGhlbiBpdCdzCj4gPiBwb3NzaWJsZSB0byBqdXN0IGNvbWJpbmUgZXh0ZW5zaW9ucyBp
bnRvIHNhaWQgYml0ZmllbGQgWzJdOgo+ID4gCj4gPiAJQUxURVJOQVRJVkVfMigibm9wIiwKPiA+
IAkJICAgICAgImogc3RyY21wX3piYl91bmFsaWduZWQiLCAwLCBDUFVGRUFUVVJFX1pCQiB8IENQ
VUZFQVRVUkVfRkFTVF9VTkFMSUdORUQsIDAsIENPTkZJR19SSVNDVl9JU0FfWkJCLAo+ID4gCQkg
ICAgICAiaiB2YXJpYW50X3piYiIsIDAsIENQVUZFQVRVUkVfWkJCLCBDUFVGRUFUVVJFX0ZBU1Rf
VU5BTElHTkVELCBDT05GSUdfUklTQ1ZfSVNBX1pCQikKPiA+IAo+ID4gW3RoZSBhZGRpdGlvbmFs
IGZpZWxkIHRoZXJlIG1vZGVscyBhICJub3QiIGNvbXBvbmVudF0KPiA+IAo+ID4gU28gSSByZWFs
bHkgZmVlbCB0aGlzIHdvdWxkIGxpbWl0IHVzIHF1aXRlIGEgYml0Lgo+ID4gCj4gPiAKPiA+IEhl
aWtvCj4gPiAKPiA+IAo+ID4gCj4gPiBbMF0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvcGFsbWVyL2xpbnV4LmdpdC9jb21taXQvP2g9cmlzY3YtaHdwcm9i
ZS12MSZpZD01MTBjNDkxY2I5ZDg3ZGNiZGM5MWM2MzU1OGRjNzA0OTY4NzIzMjQwCj4gPiBbMV0g
aHR0cHM6Ly9naXRodWIuY29tL21taW5kL2xpbnV4LXJpc2N2L2NvbW1pdC9mNTdhODk2MTIyZWU3
ZTY2NjY5MjA3OTMyMGZjMzU4Mjk0MzRjZjk2Cj4gPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL21t
aW5kL2xpbnV4LXJpc2N2L2NvbW1pdC84Y2VmNjE1ZGFiMGMwMGFkNjhhZjI2NTFlZTViOTNkMDZi
ZTE3ZjI3I2RpZmYtMTk0Y2I4YTg2ZjlmYjliMDM2ODMyOTVmMjFjOGY0NmI0NTZhOWY5NDczN2Yw
MTcyNmRkYmNiYjllM2FhY2UyY1IxMgo+ID4gCj4gPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
