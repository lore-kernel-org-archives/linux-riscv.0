Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8443C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efSapeCHtHP25SXzypl8JF9bR7kTZAVvFRHtoJjF8Fw=; b=ZpvF7Q6y8Xf+AI
	K3Znq2VuFNgEIwNqZ9iAD0yUuSif6zR6h6mIYmL7qy0L/Cs/4YL/+oE+q6Mb93uCazwM2rp+OsE9b
	z5PY3VWpjrD/651//Rn8GbRLb0LZlNTh7C2PB708WBpp0V6vVI8H+sYCnIlLvkRNQM9AFGoKWwp+p
	dcCADJNm0Bxt2LGY09xstrA1wExfShE5Qn3iLMlvQ27/ez6Kkb/p0zPLJuKRiLzUskd2L59ssBQS4
	YUZb1ty6cp+4+3aMHDQwkIyFWDs/PkSYyhH2nWUR1EVNp4u95q5i7guDLDQ4zDaLWtettYHmJ5TQJ
	6NlKOTBuzjsrj09feqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf0m7-0000000DiOF-2vKm;
	Fri, 16 Aug 2024 17:30:07 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf0m3-0000000DiNU-0n8l
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 17:30:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8FDE40002;
	Fri, 16 Aug 2024 17:29:55 +0000 (UTC)
Message-ID: <abec162e-f3f2-488c-83d9-be17257a5df8@ghiti.fr>
Date: Fri, 16 Aug 2024 19:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Add tracepoints for SBI calls and returns
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
References: <20240321230131.1838105-1-samuel.holland@sifive.com>
 <20240813-pony-truck-3e7a83e9759e@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240813-pony-truck-3e7a83e9759e@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_103003_387132_23147E38 
X-CRM114-Status: GOOD (  21.54  )
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

T24gMTMvMDgvMjAyNCAyMjoyNiwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFRodSwgTWFyIDIx
LCAyMDI0IGF0IDA0OjAxOjI1UE0gLTA3MDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+PiBUaGVz
ZSBhcmUgdXNlZnVsIGZvciBtZWFzdXJpbmcgdGhlIGxhdGVuY3kgb2YgU0JJIGNhbGxzLiBUaGUg
U0JJIEhTTQo+PiBleHRlbnNpb24gaXMgZXhjbHVkZWQgYmVjYXVzZSB0aG9zZSBmdW5jdGlvbnMg
YXJlIGNhbGxlZCBmcm9tIGNvbnRleHRzCj4+IHN1Y2ggYXMgY3B1aWRsZSB3aGVyZSBpbnN0cnVt
ZW50YXRpb24gaXMgbm90IGFsbG93ZWQuCj4+Cj4+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFu
ZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiBJIHNlZW0gdG8gaGF2ZSBiaXNlY3RlZCBh
IGJvb3QgZmFpbHVyZSBvbiB2Ni4xMS1yYyMgdG8gdGhpcyBjb21taXQsCj4gd2l0aCBhIGNyYXNo
IGJlZm9yZSB0aGUga2VybmVsIGV2ZXIgZ2V0cyB0byBvdXRwdXQgYW55dGhpbmcgLSBldmVuIG9u
Cj4gdGhlIGJvb3Rjb25zb2xlLiBGb3Igb25lIG9mIHRoZXNlIGNyYXNoZXMgSSBnb3QgdGhlIGJl
bG93ICh3aGljaCBpcwo+IGFjdHVhbGx5IFUtQm9vdHMgZXhjZXB0aW9uIGhhbmRsZXIpLCBidXQg
bW9zdCBvZiB0aGUgdGltZSAtIG5vdGhpbmcgYXQKPiBhbGwuIEknbGwgdHJ5IHRvIGRlY29kZWNv
ZGUgdGhhdCB0b21vcnJvdyBhbmQgZmlzaCBvdXQgYSBjb25maWcsIGJlY2F1c2UKPiB0aGlzIGlz
IGVpdGhlciBjb25maWcgb3IgdG9vbGNoYWluIGRlcGVuZGFudCAoSSBzYXcgaXQgaW4gd29yaywg
d2l0aCBhCj4gc2xpZ2h0bHkgZGlmZmVyZW50IGNvbmZpZyBldGMgdG8gd2hhdCBJIGhhdmUgaGVy
ZSkuCj4KPgo+IFN0YXJ0aW5nIGtlcm5lbCAuLi4KPiAgIAo+IFVuaGFuZGxlZCBleGNlcHRpb246
IExvYWQgYWNjZXNzIGZhdWx0Cj4gRVBDOiAwMDAwMDAwMDgwMjBlMDljIFJBOiAwMDAwMDAwMDgw
MjBlNTEwIFRWQUw6IGZmZmZmZmZmODFjYmYxZjAKPiBFUEM6IDAwMDAwMDAwNDA4YTAwOWMgUkE6
IDAwMDAwMDAwNDA4YTA1MTAgcmVsb2MgYWRqdXN0ZWQKPiAgIAo+IENvZGU6IDM1OTcgMDFhNCBi
NTgzIDFmNDUgNTYxMyAwMDM1IDlhNjEgOTViMiAoNjE4YykKPiAgIAo+ICAgCj4gcmVzZXR0aW5n
IC4uLgo+IHJlc2V0IG5vdCBzdXBwb3J0ZWQgeWV0Cj4gIyMjIEVSUk9SICMjIyBQbGVhc2UgUkVT
RVQgdGhlIGJvYXJkICMjIwo+Cj4KPiBDaGVlcnMsCj4gQ29ub3IuCgoKU28gSSBoYXZlIGp1c3Qg
aGl0IGEgc2ltaWxhciBpc3N1ZSB3aGlsZSBkZWJ1Z2dpbmcgdGhlIHN5emthbGxlciAKZmFpbHVy
ZS4gVGhlIHByb2JsZW0gaXMgdmlzaWJsZSB3aXRoIEtBU0FOLCBUUkFDRVBPSU5UUyBhbmQgClJJ
U0NWX0FMVEVSTkFUSVZFX0VBUkxZLgoKVGhlIGxhdHRlciBpcyBpbXBvcnRhbnQgc2luY2UgdGhp
cyBpcyB3aGVyZSB0aGUgdmVyeSBlYXJseSBzYmkgY2FsbCBpcyAKbWFkZSBpbiByaXNjdl9maWxs
X2NwdV9tZnJfaW5mbygpIAooaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTEt
cmMzL3NvdXJjZS9hcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jI0wzMikuCgpBbmQgc2lu
Y2Uga2VybmVsL3NiaS5jIGlzIGNvbXBpbGVkIHdpdGggS0FTQU4gaW5zdHJ1bWVudGF0aW9uLCBp
dCBmYWlscyAKdG8gYWNjZXNzIHRoZSBLQVNBTiByZWdpb24gYXMgaXQgaXMgbm90IHlldCBzZXQg
dXAgKHRoZSBNTVUgaXMgbm90IHVwIAp5ZXQpLiBTbyB0aGUgZm9sbG93aW5nIGZpeGVzIHRoZSBp
c3N1ZToKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSBiL2FyY2gvcmlz
Y3Yva2VybmVsL01ha2VmaWxlCmluZGV4IDA2ZDQwN2YxYjMwYi4uM2I5MjZjOTQ0NGQwIDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQorKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9NYWtlZmlsZQpAQCAtMzEsNiArMzEsNyBAQCBlbmRpZgogwqBpZmRlZiBDT05GSUdfS0FTQU4K
IMKgS0FTQU5fU0FOSVRJWkVfYWx0ZXJuYXRpdmUubyA6PSBuCiDCoEtBU0FOX1NBTklUSVpFX2Nw
dWZlYXR1cmUubyA6PSBuCitLQVNBTl9TQU5JVElaRV9zYmkubyA6PSBuCiDCoGVuZGlmCiDCoGVu
ZGlmCgpCdXQgSSBkb24ndCBsaWtlIHRoaXMgc29sdXRpb24gYXMgaXQgcmVtb3ZlcyBpbnN0cnVt
ZW50YXRpb24gZXZlcnl3aGVyZSAKaW4gdGhpcyBmaWxlLiBJJ2QgcmF0aGVyIG1vdmUgdGhlIF9f
c2JpX2VjYWxsKCkgaW50byBpdHMgb3duIGZpbGUgYW5kIApyZW1vdmUgdGhlIGluc3RydW1lbnRh
dGlvbiBoZXJlLgoKQENvbm9yIENhbiB5b3UgZ2l2ZSB0aGUgZGlmZiBhYm92ZSBhIHRyeSBhbmQg
c2VlIGlmIGl0IGZpeGVzIHlvdXIgaXNzdWU/CgpUaGFua3MsCgpBbGV4CgoKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
