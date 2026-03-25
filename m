Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1714DFEA810
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 06:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wezcfpSntD1DSzZqSS6/ZLEFEhOSdRehTACTMrB20/s=; b=KvoOUQmUYpVRJU
	bGpQm8kLHxOfigPP96D+VIw3JzHn6bHbGBl2ED/IzWZcrPjytkN6jrKjoczN3cGiP2D9qDyGwf38Q
	qg6T8U7Il94gpl2IKG9VeRsW8Tvne48CI8K+PVaOqgOHETJWx947bNl3TNGMB5+6mnHEA832djvu8
	98esRo8MOw7P/XXFBkoILts2p434PfTNTWH6vLsS9UOqz1wacefypmuKI2ux2UB06oWtK8m/eXm/c
	ZQKQyHBMUH7BwwNWTUR+0YSLbJUIuibXtKAyBfCoLzXmWEQdd56j1ImbpmruD/CZFspYA8MnMor6/
	i6/O+wKi+VTEtkUK9Uow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5HsF-00000002nPY-2kh7;
	Wed, 25 Mar 2026 06:37:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5HsB-00000002nOr-3E3q
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 06:37:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5C6443664;
	Wed, 25 Mar 2026 06:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F154C4CEF7;
	Wed, 25 Mar 2026 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774420666;
	bh=ZGxITZtXMJyi0rLNNXT23l4NyrRLV7JezCvW6G/F11w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGIbHMu4bZSK++1q0ZACYCqDEcOETLzBoJkW/iJDuYosU5JxLe2PGu7JliJTrMOAo
	 S2dRTTMYwr6xZU46JVjfW3LhoFmLaunIbdlwXBbBEWJLlmWrrPyeuB2Dj4mPCkCnqH
	 Pd9CI3u6DEaegGRiWnPuWx02LzKPeIV7q+hw3w7RCfJSp4MrK6Sp9nKJRrpuhgcTLJ
	 m8EvyKqvaAZlFyChg5+NpOEnVuWVDxWU1eQvDQsFjakH3J5phhj3KlXgFawX27Ft71
	 jF4s0wTCP1D9wNX/EtUN6Sq3USTWlaEQKxcPdIdAl+1UOPSrlOwlVxfT6UOs/n9iuc
	 2XV1HOCxyRFVQ==
Date: Tue, 24 Mar 2026 23:37:43 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [External] [PATCH RFC v2 08/17] RISC-V: QoS: add resctrl
 interface for CBQRI controllers
Message-ID: <acOCt91J7ddr9I7A@gen8>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org>
 <CAEEQ3wkvsY=1Ep4n35tR4AHor7D_ZE6oTqrbpXP7VwhUrzZqbw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wkvsY=1Ep4n35tR4AHor7D_ZE6oTqrbpXP7VwhUrzZqbw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_233747_848614_7BD6758F 
X-CRM114-Status: GOOD (  23.71  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgMTA6MDk6MDFBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIGludGVyZmFj
ZSBmb3IgQ0JRUkkgY29udHJvbGxlciBkcml2ZXJzIHRvIG1ha2UgdXNlIG9mIHRoZSByZXNjdHJs
Cj4gPiBmaWxlc3lzdGVtLgo+ID4KPiA+IENvLWRldmVsb3BlZC1ieTogQWRyaWVuIFJpY2NpYXJk
aSA8YXJpY2NpYXJkaUBiYXlsaWJyZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmlj
Y2lhcmRpIDxhcmljY2lhcmRpQGJheWxpYnJlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcg
RnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvcW9zL3Fvc19yZXNjdHJsLmMgfCAxMTkyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExOTIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9xb3MvcW9zX3Jlc2N0cmwuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3Fvcy9xb3NfcmVzY3RybC5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi5kNTAwMDk4NTk5ZDIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3Fvcy9xb3NfcmVzY3RybC5jCj4gPiBAQCAtMCwwICsxLDEx
OTIgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gPiAr
Cj4gPiArI2RlZmluZSBwcl9mbXQoZm10KSAicW9zOiByZXNjdHJsOiAiIGZtdAo+ID4gKwo+ID4g
KyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+ID4g
KyNpbmNsdWRlIDxsaW51eC9yaXNjdl9xb3MuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVzY3Ry
bC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ID4gKyNpbmNsdWRlIDxhc20vY3Ny
Lmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9xb3MuaD4KPiA+ICsjaW5jbHVkZSAiaW50ZXJuYWwuaCIK
PiA+ICsKPiA+ICsjZGVmaW5lIE1BWF9DT05UUk9MTEVSUyA2Cj4gPiArc3RhdGljIHN0cnVjdCBj
YnFyaV9jb250cm9sbGVyIGNvbnRyb2xsZXJzW01BWF9DT05UUk9MTEVSU107Cj4gCj4gV2UgY2Fu
IGdldCB0aGUgdG90YWwgbnVtYmVyIG9mIGNvbnRyb2xsZXJzLCBzbyB3ZSdsbCBhbGxvY2F0ZSBk
eW5hbWljYWxseS4KCkkndmUgbWFkZSBhIGxvdCBvZiBpbXByb3ZlbWVudHMgYnV0IGFtIHN0aWxs
IG1ha2luZyBtb3JlIGNoYW5nZXMgYmFzZWQKb24gdGhlIGZlZWRiYWNrIGZyb20gUmVpbmV0dGUg
YW5kIHlvdS4gSSdtIGhvcGluZyB0byBmaW5pc2ggYW5kIHNlbmQgYQpuZXcgcmV2aXNpb24gb2Yg
dGhlIHNlcmllcyBidXQgaW4gdGhlIG1lYW50aW1lIG15IHdvcmstaW4tcHJvZ3Jlc3MgaXMKYjQv
c3Nxb3NpZC1jYnFyaS1ycXNjIFsxXS4KCkkgaGF2ZSBkcm9wcGVkIHRoaXMgc3RhdGljIGFycmF5
IGFuZCBub3cganVzdCB1c2UgYSBsaXN0IG9mIGNvbnRyb2xsZXJzLgpJdCBpcyBwb3B1bGF0ZWQg
YnkgZHJpdmVycy9hY3BpL3Jpc2N2L3Jxc2MuYyBbMl0gYW5kIGl0ZXJhdGVkIHRocm91Z2ggYnkK
cW9zX3Jlc2N0cmxfc2V0dXAoKSBpbiBhcmNoL3Jpc2N2L2tlcm5lbC9xb3MvcW9zX3Jlc2N0cmwu
YyBbM10uCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3R0LWZ1c3RpbmkvbGludXgvdHJlZS9iNC9z
c3Fvc2lkLWNicXJpLXJxc2MKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS90dC1mdXN0aW5pL2xpbnV4
L2Jsb2IvYjQvc3Nxb3NpZC1jYnFyaS1ycXNjL2RyaXZlcnMvYWNwaS9yaXNjdi9ycXNjLmMKWzNd
IGh0dHBzOi8vZ2l0aHViLmNvbS90dC1mdXN0aW5pL2xpbnV4L2Jsb2IvYjQvc3Nxb3NpZC1jYnFy
aS1ycXNjL2FyY2gvcmlzY3Yva2VybmVsL3Fvcy9xb3NfcmVzY3RybC5jCgo+ID4gK3N0YXRpYyBp
bnQgcW9zX3Jlc2N0cmxfYWRkX2NvbnRyb2xsZXJfZG9tYWluKHN0cnVjdCBjYnFyaV9jb250cm9s
bGVyICpjdHJsLCBpbnQgKmlkKQpbLi5dCgo+IDEuIFdyYXAgdGhpcyBpbnRvIGEgZnVuY3Rpb24u
Cj4gCj4gMi4gQWxzbywgbXdlaWdodCBjb250cm9sbGVyIHN1cHBvcnQgbmVlZHMgdG8gYmUgYWRk
ZWQgaGVyZS4KPiBXZSBtYXkgbmVlZCB0byBhZGQgUkRUX1JFU09VUkNFX01CX1dFSUdIVCB0byB0
aGUgZW51bWVyYXRpb246Cj4gZW51bSByZXNjdHJsX3Jlc19sZXZlbCB7Cj4gLi4uCj4gUkRUX1JF
U09VUkNFX01CX1dFSUdIVCwKPiAuLi4KPiB9Owo+IAo+IDMuIFdlIG5lZWQgdG8gaW1wbGVtZW50
IGNicXJpX3NldF9td2VpZ2h0KCkgYW5kIGNicXJpX2dldF9td2VpZ2h0KCkuCgpJIHRoaW5rIHRo
aXMgY291bGQgYmUgYSBnb29kIHdheSB0byBpbXBsZW1lbnQgbXdlaWdodCBidXQgSSBhbSBwbGFu
bmluZwp0byBpbnRpYWlsbHkgc3VwcG9ydCBqdXN0SSB0aGluayB0aGlzIGNvdWxkIGJlIGEgZ29v
ZCB3YXkgdG8gaW1wbGVtZW50Cm13ZWlnaHQgYnV0IEkgYW0gcGxhbm5pbmcgdG8gaW50aWFpbGx5
IHN1cHBvcnQganVzdCByYndiCiAKPiA0LiBXZSBuZWVkIHRvIGFkZCBtb25pdG9yIGNvbnRyb2xs
ZXJzIChkb21haW5zKSBmb3IgYm90aCBjYXBhY2l0eSBhbmQgTUJXLgoKSSBkb24ndCB3YW50IHRv
IGF0dGVtcHQgdG8gc3VwcG9ydCBiYW5kd2lkdGggbW9uaXRvcmluZyB1bnRpbCB0aGVyZSBpcwpw
cm9ncmVzcyBpbiByZXNjdHJsIGZvciBzdXBwb3J0IG9mIGNwdS1sZXNzIG1lbW9yeSBkZXZpY2Vz
IGFzIHRoaXMgaXMgYQpjb25jZXJuIGZvciBtcGFtIHRvby4gSG93ZXZlciwgaXQgc2hvdWxkIGJl
IHBvc3NpYmxlIHRvIHN1cHBvcnQgY2FjaGUKb2NjdXBhbmN5IG1vbml0b3JpbmcuCgpbLi5dCj4g
PiArICAgICAgIHByX2luZm8oImV4cG9zZWRfYWxsb2NfY2FwYWJsZSA9ICVkIiwgZXhwb3NlZF9h
bGxvY19jYXBhYmxlKTsKPiA+ICsgICAgICAgcHJfaW5mbygiZXhwb3NlZF9tb25fY2FwYWJsZSA9
ICVkIiwgZXhwb3NlZF9tb25fY2FwYWJsZSk7Cj4gPiArICAgICAgIHByX2luZm8oImV4cG9zZWRf
Y2RwX2wyX2NhcGFibGUgPSAlZCIsIGV4cG9zZWRfY2RwX2wyX2NhcGFibGUpOwo+ID4gKyAgICAg
ICBwcl9pbmZvKCJleHBvc2VkX2NkcF9sM19jYXBhYmxlID0gJWQiLCBleHBvc2VkX2NkcF9sM19j
YXBhYmxlKTsKPiAKPiBPbmUgbGluZSBvZiBwcl9pbmZvPyBQcmludCB0b3RhbCBjb250cm9sbGVy
cywgY2FwYWNpdHkgYW5kIE1CVyBjb3VudHMKCkdvb2QgaWRlYSwgSSdsbCBkbyB0aGF0LgoKVGhh
bmtzLApEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
