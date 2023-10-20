Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBBDC0032E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2dAxaYOdgN4cgGyQv0M+IRWK3Hd39wZuPJj1jANufk=; b=QeIz+UjuyCRDqN
	S7w6Ipkt5cdD8Lxp301iWpMfyNo3pp7mpFO4E/XeZ2XLZsg3BWeSHXdMXtiEHhQfh6Ie/NDzCswUW
	3CmiGthd+b7ayjrOS7/oWW1WAA92QBlMwb2ifyAkEc2X7nB89c3MzvyvJBzbPM9a1fINFIh0lxYbp
	TtPYnR98eZ39vIU4gdTWs/KIF046YWLlkQtkzCTROW5neM8zE1pbDCRRi7+kM3JSR6KCW20k7qat/
	/9VWTJX3SCyhRYhTGQluwWuAdipRxeCMC82Kn0N9rhX++G2RtHGJFKNld8O2GJ9YdpAjEExfvXelu
	6dYLXGmGVAGvSP+2fyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qts0a-002fbr-2z;
	Fri, 20 Oct 2023 16:05:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qts0W-002fao-2S;
	Fri, 20 Oct 2023 16:05:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11851143D;
	Fri, 20 Oct 2023 09:06:29 -0700 (PDT)
Received: from [192.168.1.13] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C2C63F5A1;
	Fri, 20 Oct 2023 09:05:41 -0700 (PDT)
Message-ID: <60497d6d-dfe3-4edc-9553-311fdd9c63d0@arm.com>
Date: Fri, 20 Oct 2023 18:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] cpufreq/cppc: set the frequency used for computing
 the capacity
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 sudeep.holla@arm.com, gregkh@linuxfoundation.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
 lenb@kernel.org, robert.moore@intel.com, lukasz.luba@arm.com,
 ionela.voinescu@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
 acpica-devel@lists.linuxfoundation.org, conor.dooley@microchip.com,
 suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-6-vincent.guittot@linaro.org>
 <CAJZ5v0hS7bdUv=-k4ut2Fw0LYfB7Hb1_rro7UOVTRq4=JLNchg@mail.gmail.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <CAJZ5v0hS7bdUv=-k4ut2Fw0LYfB7Hb1_rro7UOVTRq4=JLNchg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_090552_912145_21AFE96E 
X-CRM114-Status: GOOD (  21.32  )
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

SGVsbG8gVmluY2VudCwKCk9uIDEwLzE4LzIzIDE5OjI2LCBSYWZhZWwgSi4gV3lzb2NraSB3cm90
ZToKPiBPbiBXZWQsIE9jdCAxOCwgMjAyMyBhdCA2OjI14oCvUE0gVmluY2VudCBHdWl0dG90Cj4g
PHZpbmNlbnQuZ3VpdHRvdEBsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gU2F2ZSB0aGUgZnJlcXVl
bmN5IGFzc29jaWF0ZWQgdG8gdGhlIHBlcmZvcm1hbmNlIHRoYXQgaGFzIGJlZW4gdXNlZCB3aGVu
Cj4+IGluaXRpYWxpemluZyB0aGUgY2FwYWNpdHkgb2YgQ1BVcy4KPj4gQWxzbywgY3BwYyBjcHVm
cmVxIGRyaXZlciBjYW4gcmVnaXN0ZXIgYW4gYXJ0aWZpY2lhbCBlbmVyZ3kgbW9kZWwuIEluIHN1
Y2gKPj4gY2FzZSwgaXQgbmVlZHMgdGhlIGZyZXF1ZW5jeSBmb3IgdGhpcyBjb21wdXRlIGNhcGFj
aXR5Lgo+PiBXZSBtb3ZlZCBhbmQgcmVuYW1lZCBjcHBjX3BlcmZfdG9fa2h6IGFuZCBjcHBjX3Bl
cmZfdG9fa2h6IHRvIHVzZSB0aGVtCj4+IG91dHNpZGUgY3BwY19jcHVmcmVxIGluIHRvcG9sb2d5
X2luaXRfY3B1X2NhcGFjaXR5X2NwcGMoKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBH
dWl0dG90IDx2aW5jZW50Lmd1aXR0b3RAbGluYXJvLm9yZz4KPiAKPiBGb3IgdGhlIGNoYW5nZXMg
aW4gZHJpdmVycy9hY3BpL2NwcGNfYWNwaS5jIDoKPiAKPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5
c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPgo+IAo+PiAtLS0KPj4gICBkcml2ZXJzL2FjcGkvY3Bw
Y19hY3BpLmMgICAgICAgfCAgOTMgKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIGRyaXZlcnMv
YmFzZS9hcmNoX3RvcG9sb2d5LmMgICB8ICAxNSArKystCj4+ICAgZHJpdmVycy9jcHVmcmVxL2Nw
cGNfY3B1ZnJlcS5jIHwgMTQxICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAg
IGluY2x1ZGUvYWNwaS9jcHBjX2FjcGkuaCAgICAgICB8ICAgMiArCj4+ICAgNCBmaWxlcyBjaGFu
Z2VkLCAxMzMgaW5zZXJ0aW9ucygrKSwgMTE4IGRlbGV0aW9ucygtKQo+PgoKW3NuaXBdCgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL2FyY2hfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvYmFzZS9h
cmNoX3RvcG9sb2d5LmMKPj4gaW5kZXggOWEwNzNjMmQyMDg2Li4yMzcyY2U3OTFiYjQgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvYmFzZS9hcmNoX3RvcG9sb2d5LmMKPj4gKysrIGIvZHJpdmVycy9i
YXNlL2FyY2hfdG9wb2xvZ3kuYwo+PiBAQCAtMzUwLDYgKzM1MCw3IEBAIGJvb2wgX19pbml0IHRv
cG9sb2d5X3BhcnNlX2NwdV9jYXBhY2l0eShzdHJ1Y3QgZGV2aWNlX25vZGUgKmNwdV9ub2RlLCBp
bnQgY3B1KQo+PiAgIHZvaWQgdG9wb2xvZ3lfaW5pdF9jcHVfY2FwYWNpdHlfY3BwYyh2b2lkKQo+
PiAgIHsKPj4gICAgICAgICAgc3RydWN0IGNwcGNfcGVyZl9jYXBzIHBlcmZfY2FwczsKPj4gKyAg
ICAgICB1NjQgY2FwYWNpdHksIGNhcGFjaXR5X3NjYWxlOwoKSSB0aGluayBjYXBhY2l0eV9zY2Fs
ZSBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgdG8gMCBoZXJlLApzaW5jZSBpdCBpcyB1c2VkIHRvIGZp
bmQgdGhlIG1heCB2YWx1ZSBvZiByYXdfY2FwYWNpdHlbY3B1XS4KCj4+ICAgICAgICAgIGludCBj
cHU7Cj4+Cj4+ICAgICAgICAgIGlmIChsaWtlbHkoIWFjcGlfY3BjX3ZhbGlkKCkpKQo+PiBAQCAt
MzY1LDYgKzM2NiwxMCBAQCB2b2lkIHRvcG9sb2d5X2luaXRfY3B1X2NhcGFjaXR5X2NwcGModm9p
ZCkKPj4gICAgICAgICAgICAgICAgICAgICAgKHBlcmZfY2Fwcy5oaWdoZXN0X3BlcmYgPj0gcGVy
Zl9jYXBzLm5vbWluYWxfcGVyZikgJiYKPj4gICAgICAgICAgICAgICAgICAgICAgKHBlcmZfY2Fw
cy5oaWdoZXN0X3BlcmYgPj0gcGVyZl9jYXBzLmxvd2VzdF9wZXJmKSkgewo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmF3X2NhcGFjaXR5W2NwdV0gPSBwZXJmX2NhcHMuaGlnaGVzdF9wZXJm
Owo+PiArICAgICAgICAgICAgICAgICAgICAgICBjYXBhY2l0eV9zY2FsZSA9IG1heF90KHU2NCwg
Y2FwYWNpdHlfc2NhbGUsIHJhd19jYXBhY2l0eVtjcHVdKTsKPj4gKwo+PiArICAgICAgICAgICAg
ICAgICAgICAgICBwZXJfY3B1KGNhcGFjaXR5X3JlZl9mcmVxLCBjcHUpID0gY3BwY19wZXJmX3Rv
X2toeigmcGVyZl9jYXBzLCByYXdfY2FwYWNpdHlbY3B1XSk7CgpJIHRoaW5rIGNhcGFjaXR5X3Jl
Zl9mcmVxIGluIGluIEh6LCBzbyB0aGUgZnJlcSBzaG91bGQgYmUgbXVsdGlwbGllZCBieSAxMDAw
IC4KCldpdGggdGhlc2UgdHdvIG1vZGlmaWNhdGlvbnMsIHRoZSBwYXRjaGVzIHdvcmtlZCB3ZWxs
IG9uIGEgY3BwYy1iYXNlZCBwbGF0Zm9ybS4KClNvcnJ5IEkgZm9yZ290IHRvIGRldGFpbCB3aGF0
IGl0IHdhcy4gSXQncyBhIG1vZGlmaWVkIEp1bm8gd2l0aCBDUFBDIGVuYWJsZWQuIEFNVXMgYXJl
IG5vdAplbmFibGVkLCBzbyB0aGUgQ1BQQyBwZXJmb3JtYW5jZSBjb3VudGVycyBhcmUgbm90IGhh
bmRsZWQgY29ycmVjdGx5IGFuZCBGSUUgY2Fubm90IGJlIGVuYWJsZWQsCmJ1dCBpdCBpcyBwb3Nz
aWJsZSB0byBjaGFuZ2UgZnJlcXVlbmNpZXMuCgpUaGUgX0NQQyBvYmplY3RzIGFyZSBzZXR1cCBh
czoKbGl0dGxlIENQVXM6Ci0gbG93ZXN0X2ZyZXEgPSA0NTAgKE1IeikKLSBub21pbmFsX2ZyZXEg
PSA4MDAgKE1IeikKLSBoaWdoZXN0X3BlcmYgPSAzODMgKiAxMDAwCi0gbm9taW5hbF9wZXJmID0g
MzIyICogMTAwMAotIGxvd2VzdF9wZXJmID0gMTgxICogMTAwMAotIGxvd2VzdF9ub25saW5lYXJf
cGVyZiA9IDE4MSAqIDEwMDAKCmJpZyBDUFVzOgotIGxvd2VzdF9mcmVxID0gNjAwIChNSHopCi0g
bm9taW5hbF9mcmVxID0gMTIwMCAoTUh6KQotIGhpZ2hlc3RfcGVyZiA9IDEwMjQgKiAxMDAwCi0g
bm9taW5hbF9wZXJmID0gODMzICogMTAwMAotIGxvd2VzdF9wZXJmID0gNTEyICogMTAwMAotIGxv
d2VzdF9ub25saW5lYXJfcGVyZiA9IDUxMiAqIDEwMDAKCkFzIGEgcmVtYWluZGVyLCBhdmFpbGFi
bGUgZnJlcXVlbmNpZXMgYXJlOgotIGxpdHRsZSBDUFVzOiA0NTAsIDgwMCwgOTUwIE1IegotIGJp
ZyBDUFVzOiA2MDAsIDEwMDAsIDEyMDAgTWh6ClNvIHRoZSBwbGF0Zm9ybSBpcyBzZXR1cCB0byBo
YXZlIHRoZSBsYXN0IGZyZXF1ZW5jeSBhcyBhIGJvb3N0IGZyZXF1ZW5jeSAoZm9yIHRlc3Rpbmcp
LgoKLS0tLQoKSnVzdCB0byBtYWtlIGEgbm90ZSBvZiAyIHBvdGVudGlhbCBzaWRlLWlzc3VlcyBm
b3IgbGF0ZXIgKGluZGVwZW5kZW50IGZyb20gdGhlc2UgcGF0Y2hlcyk6CgotIFdoZW4gdGVzdGlu
ZyB3aXRoIGJvb3N0ZWQvbm9uLWJvc3N0ZWQgZnJlcXVlbmNpZXMsIGl0IGRpZG4ndCBzZWVtIHRo
YXQgY3B1X292ZXJ1dGlsaXplZCgpCiAgIHdhcyB0YWtpbmcgdGhlIG1heGltdW0gZnJlcXVlbmN5
IGludG8gY29uc2lkZXJhdGlvbi4gVGhpcyBtaWdodCBtZWFuIHRoYXQgd2hlbiBsb3dlcmluZyB0
aGUKICAgbWF4aW11bSBmcmVxdWVuY3kgb2YgYSBwb2xpY3ksIHRoZSBtYXhpbXVtIGNhcGFjaXR5
IG9mIHRoZSBDUFVzIG9mIHRoaXMgcG9saWN5IGlzIHVzZWQKICAgdG8gZGV0ZWN0IG92ZXItdXRp
bGl6YXRpb24uCiAgIEkgd291bGQgaGF2ZSB0aG91Z2h0IHRoYXQgdGhlIG92ZXItdXRpbGl6YXRp
b24gdGhyZXNob2xkIHdvdWxkIGJlIGxvd2VyZWQgYXQgdGhlIHNhbWUgdGltZS4KCi0gU2ltaWxh
cmx5IGZvciBFQVMsIHRoZSBlbmVyZ3kgY29tcHV0YXRpb24gZG9lc24ndCB0YWtlIGludG8gYWNj
b3VudCB0aGUgbWF4aW11bSBmcmVxdWVuY3kKICAgb2YgdGhlIHBvbGljeS4gVGhpcyBzaG91bGQg
bWVhbiB0aGF0IEVBUyBpcyB0YWtpbmcgaW50byBjb25zaWRlcmF0aW9uIGZyZXF1ZW5jaWVzIHRo
YXQKICAgYXJlIG5vdCBhY3R1YWxseSBhdmFpbGFibGUuCgoKUmVnYXJkcywKUGllcnJlCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
