Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C774CF3D5E9
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Mar 2026 05:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8EdFSEBrDVG2axCbELLaLieObKs2K8mWBswzba98Qc=; b=DCNVQgJR77fwqd
	/2YTdd/VWMZZuCG8eYwVpYD9A+dqAg5J+DhlTLd7ZxkbX5J3IoLQ1jpHeFDS0l/I7SleUBnNxvILf
	oBr7q400FzGKa37b6u6d3E5ojYNfwrrVLFt+F+oCHbU3QP8llhC9qtB+Xm63DXHNfv8GhW6DhPG+j
	nAJs/vXeiv1zTMV6PaWC7Chs4ZPaji9J/ifpXYj3mngemjC/d5DqhVH0xBwOnXeAxZfoU0ndKqQyX
	VUSPaxMuZMSUtGTBJkkXa1orkVEkTVb/UgBCue+gglz4kaF1IOf8vCwdmEpueJjA9r2DzCl8nYNcp
	EnWw1aluLpn5KsjDf6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jAS-00000009bvN-1iHC;
	Sun, 29 Mar 2026 05:58:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jAQ-00000009bv1-1XHf
	for linux-riscv@lists.infradead.org;
	Sun, 29 Mar 2026 05:58:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0933840E33;
	Sun, 29 Mar 2026 05:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A4DC116C6;
	Sun, 29 Mar 2026 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774763910;
	bh=fojIAIARbeeLN70cfaOpPb/P7/PMERluDOhkJ8dJ6w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxWl03Or51MD1rhCsEdjSAbEyQJ+RvZd9u5Lr4bX5ZjcFTqeJ7HLg/xrp1Vrzow22
	 2DOKkIqRJfEJXP2khwOlOR1ctiTddn12CMawF3Ji1kMZOPBERe3ex0wy6D8AkiF0lC
	 ++DPORHpPV5N9JXoDDK/Y0GdIlUT6hUvbY4U58kPZ0PhaZXhTFBUHIM/TkgI/xILYy
	 XgcQPIljE7w1THLhvykw+D2Tuy9jqEpBnL6y9L1KWL7ywgUJeWWUqUT/FNzJ6N6Z7B
	 7Q7VfWHGmvz/8JvAAK/fHsJkFOB8opMhjQF1G1o1fK+1g+9y4d1EmWHSuC36m1ACmj
	 dMUd5kEZvZyOg==
Date: Sat, 28 Mar 2026 22:58:28 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [External] [PATCH RFC v2 06/17] RISC-V: QoS: define CBQRI
 resctrl resources and domains
Message-ID: <aci_hDY4JB9zNTci@gen8>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-6-dca586b091b9@kernel.org>
 <CAEEQ3wmuAnHU1VBFDwbCBFb8j63ZcizJ3jEC2SiVWnoMPc4=SA@mail.gmail.com>
 <acOFef6f9og1hft2@gen8>
 <CAEEQ3w=zV1k+uea5D9tnO=O5X5LQUpyNVZi8V8TOANxXJQbg=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=zV1k+uea5D9tnO=O5X5LQUpyNVZi8V8TOANxXJQbg=w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_225834_446328_8B3AA7A0 
X-CRM114-Status: GOOD (  21.36  )
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

T24gVGh1LCBNYXIgMjYsIDIwMjYgYXQgMDQ6MzI6NDdQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV377yMCj4gCj4gT24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgMjo0OeKAr1BNIERy
ZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIE1h
ciAyNSwgMjAyNiBhdCAxMDozMTozOUFNICswODAwLCB5dW5odWkgY3VpIHdyb3RlOgo+ID4gPiBI
aSBEcmV3LAo+ID4gPgo+ID4gPiBPbiBUaHUsIEphbiAyOSwgMjAyNiBhdCA0OjI44oCvQU0gRHJl
dyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gRGVm
aW5lIGRhdGEgc3RydWN0dXJlcyB0byBlbmNhcHN1bGF0ZSB0aGUgcmVzY3RybCByZXNvdXJjZQo+
ID4gPiA+IGFuZCBkb21haW4gc3RydWN0dXJlcy4KPiA+ID4gPgo+ID4gPiA+IENvLWRldmVsb3Bl
ZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJyZS5jb20+Cj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJyZS5jb20+
Cj4gPiA+ID4gW2Z1c3Rpbmk6IHJlYmFzZWQgY3VycmVudCB1cHN0cmVhbV0KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4KPiA+ID4gPiAtLS0K
PiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcW9zL2ludGVybmFsLmggfCAyNyArKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMo
KykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9xb3MvaW50
ZXJuYWwuaCBiL2FyY2gvcmlzY3Yva2VybmVsL3Fvcy9pbnRlcm5hbC5oCj4gPiA+ID4gaW5kZXgg
ZmYyYzdlZmY1MGJlLi5jMDQwMmRkMDZjZmEgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvcW9zL2ludGVybmFsLmgKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9x
b3MvaW50ZXJuYWwuaAo+ID4gPiA+IEBAIC02NSw2ICs2NSwxMSBAQAo+ID4gPiA+ICAjZGVmaW5l
IENCUVJJX0JDX0FMTE9DX0NUTF9PUF9SRUFEX0xJTUlUICAgMgo+ID4gPiA+ICAjZGVmaW5lIENC
UVJJX0JDX0FMTE9DX0NUTF9TVEFUVVNfU1VDQ0VTUyAgMQo+ID4gPiA+Cj4gPiA+ID4gK2ludCBx
b3NfcmVzY3RybF9zZXR1cCh2b2lkKTsKPiA+ID4gPiArdm9pZCBxb3NfcmVzY3RybF9leGl0KHZv
aWQpOwo+ID4gPiA+ICtpbnQgcW9zX3Jlc2N0cmxfb25saW5lX2NwdSh1bnNpZ25lZCBpbnQgY3B1
KTsKPiA+ID4gPiAraW50IHFvc19yZXNjdHJsX29mZmxpbmVfY3B1KHVuc2lnbmVkIGludCBjcHUp
Owo+ID4gPiA+ICsKPiA+ID4gPiAgLyogQ2FwYWNpdHkgQ29udHJvbGxlciBoYXJkd2FyZSBjYXBh
YmlsaXRpZXMgKi8KPiA+ID4gPiAgc3RydWN0IHJpc2N2X2NicXJpX2NhcGFjaXR5X2NhcHMgewo+
ID4gPiA+ICAgICAgICAgdTE2IG5jYmxrczsgLyogbnVtYmVyIG9mIGNhcGFjaXR5IGJsb2NrcyAq
Lwo+ID4gPiA+IEBAIC0xMjUsNCArMTMwLDI2IEBAIHN0cnVjdCBjYnFyaV9jb250cm9sbGVyIHsK
PiA+ID4gPiAgICAgICAgIGJvb2wgbW9uX2NhcGFibGU7Cj4gPiA+ID4gIH07Cj4gPiA+ID4KPiA+
ID4gPiArc3RydWN0IGNicXJpX3Jlc2N0cmxfcmVzIHsKPiA+ID4gPiArICAgICAgIHN0cnVjdCBy
ZHRfcmVzb3VyY2UgICAgIHJlc2N0cmxfcmVzOwo+ID4gPiA+ICsgICAgICAgc3RydWN0IGNicXJp
X2NvbnRyb2xsZXIgY29udHJvbGxlcjsKPiA+ID4gPiArICAgICAgIHUzMiBtYXhfcmNpZDsKPiA+
ID4gPiArICAgICAgIHUzMiBtYXhfbWNpZDsKPiA+ID4gPiArfTsKPiA+ID4gPiArCj4gPiA+ID4g
K3N0cnVjdCBjYnFyaV9yZXNjdHJsX2RvbSB7Cj4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcmR0X2Rv
bWFpbl9oZHIgICAgICAgcmVzY3RybF9kb21faGRyOwo+ID4gPiA+ICsgICAgICAgc3RydWN0IHJk
dF9jdHJsX2RvbWFpbiAgcmVzY3RybF9jdHJsX2RvbTsKPiA+ID4gPiArICAgICAgIHN0cnVjdCBy
ZHRfbW9uX2RvbWFpbiAgIHJlc2N0cmxfbW9uX2RvbTsKPiA+ID4gPiArICAgICAgIHU2NCBjYm07
Cj4gPiA+ID4gKyAgICAgICB1NjQgcmJ3YjsKPiA+ID4gPiArICAgICAgIHU2NCAqY3RybF92YWw7
Cj4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgY2JxcmlfY29udHJvbGxlciAqaHdfY3RybDsKPiA+ID4g
PiArfTsKPiA+ID4gPiArCj4gPiA+Cj4gPiA+IENhbiB3ZSB0cmltIGRvd24gc29tZSBmaWVsZHM/
IEZvciBleGFtcGxlOgo+ID4gPiAgc3RydWN0IGNicXJpX3Jlc2N0cmxfcmVzIHsKPiA+ID4gICAg
ICAgICBzdHJ1Y3QgcmR0X3Jlc291cmNlICAgICByZXNjdHJsX3JlczsKPiA+ID4gLSAgICAgICBz
dHJ1Y3QgY2JxcmlfY29udHJvbGxlciBjb250cm9sbGVyOwo+ID4gPiAgICAgICAgIHUzMiBtYXhf
cmNpZDsKPiA+ID4gICAgICAgICB1MzIgbWF4X21jaWQ7Cj4gPiA+ICB9Owo+ID4gPgo+ID4gPiAg
c3RydWN0IGNicXJpX3Jlc2N0cmxfZG9tIHsKPiA+ID4gLSAgICAgICBzdHJ1Y3QgcmR0X2RvbWFp
bl9oZHIgICAgICAgcmVzY3RybF9kb21faGRyOwo+ID4gPiAgICAgICAgIHN0cnVjdCByZHRfY3Ry
bF9kb21haW4gIHJlc2N0cmxfY3RybF9kb207Cj4gPiA+ICAgICAgICAgc3RydWN0IHJkdF9tb25f
ZG9tYWluICAgcmVzY3RybF9tb25fZG9tOwo+ID4gPiAtICAgICAgIHU2NCBjYm07Cj4gPiA+IC0g
ICAgICAgdTY0IHJid2I7Cj4gPiA+ICAgICAgICAgdTY0ICpjdHJsX3ZhbDsKPiA+ID4gICAgICAg
ICBzdHJ1Y3QgY2JxcmlfY29udHJvbGxlciAqaHdfY3RybDsKPiA+ID4gIH07Cj4gPgo+ID4gQ2Fu
IHlvdSBleHBsYWluIHdoeSB5b3UgZG9uJ3QgdGhpbmsgdGhlc2UgYXJlIG5lZWRlZD8/Cj4gCj4g
VGhlIGZ1bmN0aW9uYWxpdHkgd29ya3Mgd2VsbCB3aXRob3V0IHRob3NlIGZpZWxkcywgZmVlbCBm
cmVlIHRvIHRyeS4KClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIEkgaGF2ZSByZW1vdmVk
IHRoZW0uCgo+IEJ0dywgd2hlbiBkbyB5b3UgcGxhbiB0byBzZW5kIHRoZSBuZXh0IHJldmlzaW9u
PwoKVGhlIGN1cnJlbnQgYnJhbmNoIGlzIGJhc2VkIG9uIDYuMTkgc28gSSBuZWVkIHRvIHJlYmFz
ZS4gSSBoYXZlCmFkZHJlc3Nlc2QgbW9zdCBvZiB0aGUgZmVlZGJhY2sgc28gZmFyIGV4Y2VwdCBm
b3IgdHJhY2tpbmcgZGVmYXVsdApjbG9zaWQvcm1pZCBmb3IgYSBjcHUuIEkgYW0gdGhpbmtpbmcg
SSBzaG91bGQgc2VuZCBhIG5ldyB2ZXJzaW9uIGFzIGl0CmhhcyBiZWVuIGEgbG9uZyB0aW1lIGFu
ZCBkZXNjcmliZSB0aGUgb3BlbiBpdGVtcyB0aGF0IEkgaGF2ZSBub3Qgc29sdmVkCnlldC4KClRo
YW5rcywKRHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
