Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3C2E87859
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPaqyBDN5TuWnnPA2pX0WGxUBCXf8S6hQ8Sn5Tyou+k=; b=WccDhcW9kIL8hM
	75wy6P7T6HxteWG8UQ3Mhg+ujIm3BszNJtw9H8YARscXbfaRF+gfyz3diLCKQecDPxV3PoV+a4qhJ
	itLLVv8mb62MU12yP+Qz3qha9cgB1yz2hJTwYkLtHegPOXCEKRFXP7nCczCf6Q+QQcv63HKBi296l
	HoWl2anD+wFNqbsIeaUAfTbJgPlqqUnO29esN+cTs4OkCwtf37eNiFhRd0a9PDH1Ezyt7+hrTENIS
	rSmyRoNep2Z3Mt+3AuO9F+TFuYcD2nR875VKRlqxp0DNAa5gxmMipdoTc59a36lMUWVPMAQghFqRK
	ncSeexp1yzIBjPwc6rRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMJf-00000007FaH-0ifv;
	Tue, 03 Feb 2026 19:44:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMJe-00000007Fa7-10fy
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 19:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45E4C600C4;
	Tue,  3 Feb 2026 19:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA57C19421;
	Tue,  3 Feb 2026 19:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770147841;
	bh=fDZMISdTU9j2DjE9ZWL42YJjivPjTuFE4AcisYh4X0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BerMWa4rXH0mZdU3u5pcACtA7edWYNUPYbTLnuEBlzts4s0hwAGCKrOI9p0KLNoD8
	 dQAlBZTTKitbG+x11kL6c9AK9qD+1kz3BNmal9R/BXedW3pF3p0FbQcjAdjEQ5X6p/
	 IpGwXj+d3/bKA8LWitWUNb20WdyTKDq8S/FsRFrw6dKbHe/K21GEvp/HbOZs3THzxY
	 wIhGduTEFZpac/6pRBeP9dRT0tIrldsPtTBg8NnIh4PSEW+Xhy2xEA50y/PkWHnFa8
	 TKglfYSWECel6OF6EEbkDdyTn8FMxnVloGYsb7/FlXdvGMAFw/YhPfTXXjeRsOnVt0
	 iYyc0aqbOfoPQ==
Date: Tue, 3 Feb 2026 11:43:58 -0800
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH RFC v2 03/17] RISC-V: Add support for srmcfg CSR from
 Ssqosid ext
Message-ID: <aYJP/tXv7UeSAJqy@x1>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-3-dca586b091b9@kernel.org>
 <CAEEQ3wmK_4y-woedO0htdh3tnO=4SEGwRUrDsGLYRWwsPF105w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wmK_4y-woedO0htdh3tnO=4SEGwRUrDsGLYRWwsPF105w@mail.gmail.com>
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

T24gTW9uLCBGZWIgMDIsIDIwMjYgYXQgMTI6Mjc6NTlQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV377yMCj4gCj4gT24gVGh1LCBKYW4gMjksIDIwMjYgYXQgNDoyOOKAr0FNIERy
ZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBBZGQgc3VwcG9y
dCBmb3IgdGhlIHNybWNmZyBDU1IgZGVmaW5lZCBpbiB0aGUgU3Nxb3NpZCBJU0EgZXh0ZW5zaW9u
Cj4gPiAoU3VwZXJ2aXNvci1tb2RlIFF1YWxpdHkgb2YgU2VydmljZSBJRCkuIFRoZSBDU1IgY29u
dGFpbnMgdHdvIGZpZWxkczoKPiA+Cj4gPiAgIC0gUmVzb3VyY2UgQ29udHJvbCBJRCAoUkNJRCkg
dXNlZCBkZXRlcm1pbmUgcmVzb3VyY2UgYWxsb2NhdGlvbgo+ID4gICAtIE1vbml0b3JpbmcgQ291
bnRlciBJRCAoTUNJRCkgdXNlZCB0byB0cmFjayByZXNvdXJjZSB1c2FnZQo+ID4KPiA+IFJlcXVl
c3RzIGZyb20gYSBoYXJ0IHRvIHNoYXJlZCByZXNvdXJjZXMgbGlrZSBjYWNoZSB3aWxsIGJlIHRh
Z2dlZCB3aXRoCj4gPiB0aGVzZSBJRHMuIFRoaXMgYWxsb3dzIHRoZSB1c2FnZSBvZiBzaGFyZWQg
cmVzb3VyY2VzIHRvIGJlIGFzc29jaWF0ZWQKPiA+IHdpdGggdGhlIHRhc2sgY3VycmVudGx5IHJ1
bm5pbmcgb24gdGhlIGhhcnQuCj4gPgo+ID4gQSBzcm1jZmcgZmllbGQgaXMgYWRkZWQgdG8gdGhy
ZWFkX3N0cnVjdCBhbmQgaGFzIHRoZSBzYW1lIGZvcm1hdCBhcyB0aGUKPiA+IHNybWNmZyBDU1Iu
IFRoaXMgYWxsb3dzIHRoZSBzY2hlZHVsZXIgdG8gc2V0IHRoZSBoYXJ0J3Mgc3JtY2ZnIENTUiB0
bwo+ID4gY29udGFpbiB0aGUgUkNJRCBhbmQgTUNJRCBmb3IgdGhlIHRhc2sgdGhhdCBpcyBiZWlu
ZyBzY2hlZHVsZWQgaW4uIFRoZQo+ID4gc3JtY2ZnIENTUiBpcyBvbmx5IHdyaXR0ZW4gdG8gaWYg
dGhlIHRocmVhZF9zdHJ1Y3Quc3JtY2ZnIGlzIGRpZmZlcmVudAo+ID4gdGhhbiB0aGUgY3VycmVu
dCB2YWx1ZSBvZiB0aGUgQ1NSLgo+ID4KPiA+IEEgcGVyLWNwdSB2YXJpYWJsZSBjcHVfc3JtY2Zn
IGlzIHVzZWQgdG8gbWlycm9yIHRoYXQgc3RhdGUgb2YgdGhlIENTUi4KPiA+IFRoaXMgaXMgYmVj
YXVzZSBhY2Nlc3MgdG8gTDFEIGhvdCBtZW1vcnkgc2hvdWxkIGJlIHNldmVyYWwgdGltZXMgZmFz
dGVyCj4gPiB0aGFuIGEgQ1NSIHJlYWQuIEFsc28sIGluIHRoZSBjYXNlIG9mIHZpcnR1YWxpemF0
aW9uLCBhY2Nlc3NlcyB0byB0aGlzCj4gPiBDU1IgYXJlIHRyYXBwZWQgaW4gdGhlIGh5cGVydmlz
b3IuCj4gPgo+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXNzcW9zaWQv
cmVsZWFzZXMvdGFnL3YxLjAKPiA+IENvLWRldmVsb3BlZC1ieTogS29ybmVsIER1bMSZYmEgPG1p
bmRhbEBzZW1paGFsZi5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLb3JuZWwgRHVsxJliYSA8bWlu
ZGFsQHNlbWloYWxmLmNvbT4KPiA+IFtmdXN0aW5pOiByZW5hbWUgY3NyLCByZWZhY3RvciBzd2l0
Y2hfdG8sIHJlYmFzZSBvbiB1cHN0cmVhbV0KPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGlu
aSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA3ICsrKysrKysKPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY3NyLmggICAgICAgfCAgOCArKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cHJvY2Vzc29yLmggfCAgMyArKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Fvcy5oICAg
ICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90by5oIHwgIDMgKysrCj4gPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvTWFrZWZpbGUgICAgICAgICB8ICAyICsrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcW9z
L01ha2VmaWxlICAgICB8ICAyICsrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcW9zL3Fvcy5jICAg
ICAgICB8ICA1ICsrKysrCj4gPiAgOSBmaWxlcyBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiA+IGluZGV4IDc2
NWFkMmRhYTIxOC4uZTk4ZDU1M2JkMGNhIDEwMDY0NAo+ID4gLS0tIGEvTUFJTlRBSU5FUlMKPiA+
ICsrKyBiL01BSU5UQUlORVJTCj4gPiBAQCAtMjI1MDUsNiArMjI1MDUsMTMgQEAgRjogICAgIGRy
aXZlcnMvcGVyZi9yaXNjdl9wbXUuYwo+ID4gIEY6ICAgICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11
X2xlZ2FjeS5jCj4gPiAgRjogICAgIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+Cj4g
PiArUklTQy1WIFFPUyBSRVNDVFJMIFNVUFBPUlQKPiA+ICtNOiAgICAgRHJldyBGdXN0aW5pIDxm
dXN0aW5pQGtlcm5lbC5vcmc+Cj4gCj4gSWYgeW91IGRvbuKAmXQgbWluZCwgdG8gaGVscCBzdXBw
b3J0IFJJU0MtViBRb1MgcmVzY3RybCBkZXZlbG9wbWVudCBhbmQKPiBlbnN1cmUgaW50ZXJmYWNl
IHN0YWJpbGl0eSwgY291bGQgeW91IHBsZWFzZSBhZGQgYW4gJ1I6JyBlbnRyeSB3aXRoIG15Cj4g
ZW1haWwgYWRkcmVzcz8KClN1cmUsIEkgd2lsbCBhZGQgaW4gbmV4dCByZXZpc2lvbi4KClRoYW5r
cywKRHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
