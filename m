Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF73D61028
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 17:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hf4D4ctD7nW5MyCD6yZvoC6FN1NF6yDqhL+icRItrNc=; b=cAixEIpLif7tA1
	FbVFg/mMbTkhw3g7W3bzejKWmg0v/DRTJKcBryzllHdOG9Moha4Wf2vQMb0vdl3z8q1EGqP6yWzCM
	Wk0cKnraa/IiYCZq8HKvZHuO3qV7Bcv6weY1364KlCqM6ui8b3gwnPUg2fPIbjr/f6Mi2xo1xeoxf
	0T6DSGc+PfelDfEinvMPvRtf8F6pdwvgnTe3P3s0290XH4uGcvmCb+vkT042fHOz/i15AVtExG32u
	Fd/OVzju5pYih69bCQdyt2+koD39q6sEDrKTyggK1X5zvnZLOqTjz7w7JvOEET+XCHRv32Z+53+FZ
	nvJmZ2GEqD6aqG/RngWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVTB-00000000OVO-0Fsm;
	Thu, 29 Jan 2026 17:06:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVT5-00000000OUj-2UIG
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 17:06:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2820153B;
	Thu, 29 Jan 2026 09:05:58 -0800 (PST)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC81F3F73F;
	Thu, 29 Jan 2026 09:06:02 -0800 (PST)
Message-ID: <2f1f48c6-ad75-4e7d-89a2-c93bb1c1d067@arm.com>
Date: Thu, 29 Jan 2026 17:06:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 4/7] dt-bindings: iommu: Add spacemit/t100 features
To: Conor Dooley <conor@kernel.org>, =?UTF-8?B?6YOR5b6L?=
 <lv.zheng@spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
 iommu <iommu@lists.linux.dev>,
 linux-perf-users <linux-perf-users@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 spacemit <spacemit@lists.linux.dev>, devicetree <devicetree@vger.kernel.org>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1769666438.git.lv.zheng@spacemit.com>
 <15209d7b8c5a5055f8944ab7261e440d70a18a03.1769666438.git.lv.zheng@spacemit.com>
 <20260129-evolution-femur-84eb5668f4a7@spud>
 <a4684b7f094a6a5ee87d9db722b75594f851b9fb.d4fb292a.1570.47af.8025.bf9af089dc8a@feishu.cn>
 <20260129-grandly-compare-e8e3a105f690@spud>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260129-grandly-compare-e8e3a105f690@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_090609_860027_BD35E8DF 
X-CRM114-Status: GOOD (  19.23  )
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

T24gMjkvMDEvMjAyNiA0OjQxIHBtLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MjksIDIwMjYgYXQgMDY6NDM6MDNQTSArMDgwMCwg6YOR5b6LIHdyb3RlOgo+Pj4gRnJvbTogIkNv
bm9yIERvb2xleSI8Y29ub3JAa2VybmVsLm9yZz4KPj4+IERhdGU6wqAgVGh1LCBKYW4gMjksIDIw
MjYsIDE4OjA4Cj4+PiBTdWJqZWN0OsKgIFJlOiBbUEFUQ0ggdjEuMSA0LzddIGR0LWJpbmRpbmdz
OiBpb21tdTogQWRkIHNwYWNlbWl0L3QxMDAgZmVhdHVyZXMKPj4+IFRvOiAiTHYgWmhlbmciPGx2
LnpoZW5nQHNwYWNlbWl0LmNvbT4KPj4+IENjOiAiVG9tYXN6IEplem5hY2giPHRqZXpuYWNoQHJp
dm9zaW5jLmNvbT4sICJKb2VyZyBSb2VkZWwiPGpvcm9AOGJ5dGVzLm9yZz4sICJXaWxsIERlYWNv
biI8d2lsbEBrZXJuZWwub3JnPiwgIlJvYmluIE11cnBoeSI8cm9iaW4ubXVycGh5QGFybS5jb20+
LCAiUm9iIEhlcnJpbmciPHJvYmhAa2VybmVsLm9yZz4sICJLcnp5c3p0b2YgS296bG93c2tpIjxr
cnprK2R0QGtlcm5lbC5vcmc+LCAiQ29ub3IgRG9vbGV5Ijxjb25vcitkdEBrZXJuZWwub3JnPiwg
IlBhdWwgV2FsbXNsZXkiPHBqd0BrZXJuZWwub3JnPiwgIlBhbG1lciBEYWJiZWx0IjxwYWxtZXJA
ZGFiYmVsdC5jb20+LCAiQWxiZXJ0IE91Ijxhb3VAZWVjcy5iZXJrZWxleS5lZHU+LCAiQWxleGFu
ZHJlIEdoaXRpIjxhbGV4QGdoaXRpLmZyPiwgIkppbmd5dSBMaSI8am9leS5saUBzcGFjZW1pdC5j
b20+LCAiWmhpamlhbiBDaGVuIjx6aGlqaWFuQHNwYWNlbWl0LmNvbT4sIDxpb21tdUBsaXN0cy5s
aW51eC5kZXY+LCA8bGludXgtcGVyZi11c2Vyc0B2Z2VyLmtlcm5lbC5vcmc+LCA8bGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZz4sIDxzcGFjZW1pdEBsaXN0cy5saW51eC5kZXY+LCA8ZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+Cj4+PiBPbiBUaHUsIEphbiAyOSwgMjAyNiBhdCAwMjow
OToxM1BNICswODAwLCBMdiBaaGVuZyB3cm90ZToKPj4+PiBBZGRzIGRldmljZSB0cmVlIGJpbmRp
bmdzIGZvciBTcGFjZW1pVCBUMTAwIHNwZWNpZmljIGZlYXR1cmVzLgo+Pj4+ICAgCj4+Pj4gdmVu
ZG9yLWhwbS1ldmVudHM6IEFsbG93IHZlbmRvciBldmVudHMgdG8gYmUgY3VzdG9taXplZCBpbiB0
aGUgZGV2aWNlCj4+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJlZS4KPj4+PiBn
bG9iYWwtZmlsdGVyOiBUaGUgZmVhdHVyZSBzYXZlcyBzaWxpY29uIGFyZWEgYnkgcmVkdWNpbmcg
ZmlsdGVycyB0bwo+Pj4+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9uZSBhbmQgdXNlIGl0IGFz
IGEgZ2xvYmFsIGZpbHRlciBhY3Jvc3MgYWxsIGV2ZW50cy4KPj4+PiAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBUaGlzIHVzdWFsbHkgaXMgc3VmZmljaWVudCBmb3IgcmVhbCBhcHBsaWNhdGlvbnMu
Cj4+PiAgIAo+Pj4gV2h5IGNhbiB0aGVzZSBub3QgYmUgZGV0ZXJtaW5lZCBmcm9tIGEgZGV2aWNl
IHNwZWNpZmljIGNvbXBhdGlibGU/Cj4+Cj4+IFRoZSBzcGVjaWZpY2F0aW9uIG9ubHkgZGVmaW5l
cyBsZXNzIHRoYW4gMTAgc3RhbmRhcmQgZXZlbnQgdHlwZXMgd2hpbGUgdGhlCj4+IHJlYWwgc2ls
aWNvbnMgc2hvdWxkIGhhdmUgaW1wbGVtZW50ZWQgbWFueSBvdGhlciBldmVudCB0eXBlcyBiYXNl
ZCBvbgo+PiB0aGVpciBtaWNyby1hcmNoaXRlY3R1cmUuIEkgdHJpZWQgdG8gcHJvdmlkZSBhIGNv
bW1vbiBtZWNoYW5pc20gZm9yIGFsbAo+PiB2ZW5kb3Igc3BlY2lmaWMgZXZlbnQgdHlwZXMgYWNy
b3NzIGRpZmZlcmVudCB2ZW5kb3JzLgo+IAo+IEdpdmVuIHRoYXQgdGhlIHZhcmlhbmNlIGlzIGJh
c2VkIG9uIHVhcmNoLCBpdCBzb3VuZHMgbGlrZSBpdCBjYW4gYmUKPiBkZXRlcm1pbmVkIGZyb20g
dGhlIGNvbXBhdGlibGUuCj4gCj4+IEl0IGlzIHNpbWlsYXIgZm9yIHRoZSBnbG9iYWwgZmlsdGVy
LCB0aGUgZ2xvYmFsIGZpbHRlciBtZWNoYW5pc20gYWN0dWFsbHkKPj4gY29tcGxpZXMgdG8gdGhl
IElPTU1VIHNwZWNpZmljYXRpb24sIHVzZXJzIGNhbiBhbHRlciB0aGUgaW9ocG1ldnQKPj4gcmVn
aXN0ZXJzIGFzIGlzIHdoYXQgaXMgc3BlY2lmaWVkIGluIHRoZSBJT01NVSBzcGVjaWZpY2F0aW9u
LiBJdCBvbmx5Cj4+IHByb3ZpZGVzIHNsaWdodCBhcHBsaWNhdGlvbiBkaWZmZXJlbmNlIGJldHdl
ZW4gdGhlIGZpbmFsIGVmZmVjdGlvbi4gVGh1cwo+PiB0aGlzIGNvdWxkIGFsc28gYmUgYSBub24t
ZGV2aWNlIHNwZWNpZmljIG9wdGlvbi4KPiAKPiBXaGF0IGlzIGEgInVzZXIiIGluIHRoaXMgY29u
dGV4dD8gR2l2ZW4geW91J3JlIHRhbGtpbmcgYWJvdXQgcmVkdWNpbmcKPiBzaWxpY29uIGFyZWEs
IGl0IHNvdW5kcyBsaWtlIHRoaXMgd2lsbCBiZSBzZXQgaW4gc3RvbmUgZm9yIGVhY2ggU29DLCBh
bmQKPiB0aGVyZWZvcmUgY2FuIGJlIGRldGVybWluZWQgYnkgY29tcGF0aWJsZS4gSWYgb3RoZXIg
ZGV2aWNlcyBkbyB0aGlzLAo+IHRoZXkgY2FuIGFsc28gZGV0ZXJtaW5lIGl0IGZyb20gdGhlaXIg
Y29tcGF0aWJsZS4KPiAKPiBQcm9wZXJ0aWVzIGZvciB0aGluZ3MgdGhhdCBjYW4gYmUgZGV0ZXJt
aW5lZCBiYXNlZCBvbiBjb21wYXRpYmxlIGFyZQo+IGdlbmVyYWxseSBub3QgcGVybWl0dGVkLCBz
byB5b3UnbGwgbmVlZCB0byBwcm92aWRlIGEgY29tcGVsbGluZwo+IHJhdGlvbmFsZS4gQ29tbW9u
IG1lY2hhbmlzbSBpc24ndCBvbmUsIHNpbmNlIGRldGVybWluaW5nIGJhc2VkIG9uCj4gY29tcGF0
aWJsZSB3b3VsZCBiZSBhIGNvbW1vbiBtZWNoYW5pc20gYmFzZWQgb24gbWF0Y2ggZGF0YSB0aGF0
IHBlb3BsZQo+IGNhbiB0YWNrIG9udG8gZm9yIHRoZWlyIGRldmljZXMuCgpBbHNvLCByZWludmVu
dGluZyBqZXZlbnRzIHZpYSBkZXZpY2V0cmVlIGlzIHByZXR0eSBncmltIGFueXdheSAtIHRoZSBQ
TVUgCmNhbiBzaW1wbHkgZXhwb3NlIGFuICJpZGVudGlmaWVyIiBhdHRyaWJ1dGUgdGhhdCB1bmlx
dWVseSBpZGVudGlmaWVzIHRoZSAKdmVuZG9yIGltcGxlbWVudGF0aW9uLCBhbmQgcGVyZiB0b29s
aW5nIGNhbiBtYXRjaCB0aGF0IHRvIGEgc2V0IG9mIGV2ZW50IApkZWZpbml0aW9ucyBpbiB1c2Vy
c3BhY2UsIHdpdGggdGhlIGFkZGVkIGJvbnVzIHRoYXQgamV2ZW50cyBjYW4gYWxzbyAKZW5jb2Rl
IG1lYW5pbmdmdWwgZGVzY3JpcHRpb25zLCBtZXRyaWNzIGFuZCBzdWNobGlrZS4gVGhlcmUgZG9l
c24ndCAKKm5lZWQqIHRvIGJlIGEgc3lzZnMgYWxpYXMgZm9yIGV2ZXJ5IHBvc3NpYmxlIGV2ZW50
LiBJIHNlZSB0aGUgUklTQy1WIApDUFUgUE1VcyBhcmUgYWxyZWFkeSBvbi1ib2FyZCB3aXRoIHRo
aXMgYXBwcm9hY2ggLSBub3RlIHRoZSAKIlVuaXQiLyJDb21wYXQiIG1hdGNoaW5nIGZvciBzeXN0
ZW0vdW5jb3JlIFBNVXMgaXMgYSBsaXR0bGUgZGlmZmVyZW50IApmcm9tIHRoZSBtYXBmaWxlIHVz
ZWQgZm9yIENQVXMsIGJ1dCBzZWUgb3RoZXIgYXJjaGl0ZWN0dXJlcyBmb3IgZXhhbXBsZXMuCgpU
aGFua3MsClJvYmluLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
