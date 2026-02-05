Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB31EEA7951
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 01:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUlcyPtiXAGeAjq/1gV/LX78H6Zp654pblcUalllgOI=; b=j2I3xY7Yn5eJjS
	k+R4/XijwhofUz17mVtkDhATND1qxxErCzlw2oUUAqnO/1aUoQvJtMT59RDfZIMEUOweAnMO5ddC3
	475t41PV41poLEy0N4zKgKACJRH9TDHxijBmkcv/UdAhnehYLMWSi1lsVWsCxaKwhRNedkUGTYvKE
	pgYK61wtXqRDlmTkH6ti6t90VnTeKPUQ6eFLPZYR4OFRFZ4ADOSF7twF383N0sNVuxDhn7YRqkFkj
	dzrGkpfNk71a7Nx64lW9C8seM48TjdOG7qLuN/cP1VmwmnnIf515ohC7vvCnxLdKrG0YFhODLaFGC
	+elDr+ezfYWbPLQpcQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoct-00000009HzS-2Bc2;
	Thu, 05 Feb 2026 01:57:47 +0000
Received: from relay-us1.mymailcheap.com ([51.81.35.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnocp-00000009Hz5-0FDw
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 01:57:44 +0000
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id AB9A12239E
	for <linux-riscv@lists.infradead.org>; Thu,  5 Feb 2026 01:51:30 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.119.157])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 492522023C
	for <linux-riscv@lists.infradead.org>; Thu,  5 Feb 2026 01:51:00 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id B2ADA3E91A;
	Thu,  5 Feb 2026 01:50:50 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 9E85840073;
	Thu,  5 Feb 2026 01:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1770256244; bh=3tEL440Mn7AwTUWC7fSpvsRHAx2uqRnn/8weT1MhNwM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DavxXPNZZtWyCN+XS8J8LorVhbAvPvGyr8/sgJMYgXNjGpf3TBhKWDyMd0hwOCPPm
	 iGrGGO04FKIgMOkGXwEW3jPvac3+MDzLD/uHD/OHhE8KICYvRAhbi4m/H3oS3V9UML
	 UmAQ5eJQ8op/M4kVNxiQBiu03YbEfqzI2Khman3c=
Received: from [127.0.0.1] (unknown [117.151.13.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 661004017F;
	Thu,  5 Feb 2026 01:50:36 +0000 (UTC)
Message-ID: <35a29467-662d-4214-97a5-35d8ea92dbdb@aosc.io>
Date: Thu, 5 Feb 2026 09:50:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
To: Bibo Mao <maobibo@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260204113601.912413-1-liushuyu@aosc.io>
 <02f9aed7-d435-fd0b-4f7e-4b59dd62dcb2@loongson.cn>
From: liushuyu <liushuyu@aosc.io>
Content-Language: en-US-large, en-US
In-Reply-To: <02f9aed7-d435-fd0b-4f7e-4b59dd62dcb2@loongson.cn>
X-Rspamd-Queue-Id: 9E85840073
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,aosc.io:email,aosc.io:from_smtp,aosc.io:mid,aosc.io:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	SURBL_MULTI_FAIL(0.00)[aosc.io:server fail,mail20.mymailcheap.com:server fail,gitlab.com:server fail]
X-Rspamd-Action: no action
X-Rspamd-Server: nf2.mymailcheap.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_175743_165774_A69ECED0 
X-CRM114-Status: GOOD (  28.37  )
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

SGkgQmlibywKCj4gSGkgWml4aW5nLAo+Cj4gVGhhbmtzIGZvciBkb2luZyB0aGlzLgo+Cj4gT24g
MjAyNi8yLzQg5LiL5Y2INzozNiwgWml4aW5nIExpdSB3cm90ZToKPj4gVGhpcyBpb2N0bCBjYW4g
YmUgdXNlZCBieSB0aGUgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyB0byBkZXRlcm1pbmUgd2hpY2gK
Pj4gKHNwZWNpYWwpIHJlZ2lzdGVycyBhcmUgZ2V0L3NldC1hYmxlIGluIGEgbWVhbmluZ2Z1bCB3
YXkuCj4+Cj4+IFRoaXMgY2FuIGJlIHZlcnkgdXNlZnVsIGZvciBjcm9zcy1wbGF0Zm9ybSBWTU1z
IHNvIHRoYXQgdGhleSBkbyBub3QgaGF2ZQo+PiB0byBoYXJkY29kZSByZWdpc3RlciBpbmRpY2Vz
IGZvciBlYWNoIHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBa
aXhpbmcgTGl1IDxsaXVzaHV5dUBhb3NjLmlvPgo+PiAtLS0KPj4gwqAgRG9jdW1lbnRhdGlvbi92
aXJ0L2t2bS9hcGkucnN0IHzCoCAyICstCj4+IMKgIGFyY2gvbG9vbmdhcmNoL2t2bS92Y3B1LmPC
oMKgwqDCoMKgIHwgODcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCAy
IGZpbGVzIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdAo+PiBiL0RvY3VtZW50YXRp
b24vdmlydC9rdm0vYXBpLnJzdAo+PiBpbmRleCAwMWEzYWJlZjhhYmIuLmY0NmRkOGJlMjgyZiAx
MDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdAo+PiBAQCAtMzYwMyw3ICszNjAzLDcgQEAgVkNQ
VSBtYXRjaGluZyB1bmRlcmx5aW5nIGhvc3QuCj4+IMKgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
PiDCoCDCoCA6Q2FwYWJpbGl0eTogYmFzaWMKPj4gLTpBcmNoaXRlY3R1cmVzOiBhcm02NCwgbWlw
cywgcmlzY3YsIHg4NiAoaWYgS1ZNX0NBUF9PTkVfUkVHKQo+PiArOkFyY2hpdGVjdHVyZXM6IGFy
bTY0LCBsb29uZ2FyY2gsIG1pcHMsIHJpc2N2LCB4ODYgKGlmIEtWTV9DQVBfT05FX1JFRykKPj4g
wqAgOlR5cGU6IHZjcHUgaW9jdGwKPj4gwqAgOlBhcmFtZXRlcnM6IHN0cnVjdCBrdm1fcmVnX2xp
c3QgKGluL291dCkKPj4gwqAgOlJldHVybnM6IDAgb24gc3VjY2VzczsgLTEgb24gZXJyb3IKPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2t2bS92Y3B1LmMgYi9hcmNoL2xvb25nYXJjaC9r
dm0vdmNwdS5jCj4+IGluZGV4IDY1NmI5NTRjMTEzNC4uYmQ4NTVlZTIwZWUyIDEwMDY0NAo+PiAt
LS0gYS9hcmNoL2xvb25nYXJjaC9rdm0vdmNwdS5jCj4+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL2t2
bS92Y3B1LmMKPj4gQEAgLTMsNiArMyw3IEBACj4+IMKgwqAgKiBDb3B5cmlnaHQgKEMpIDIwMjAt
MjAyMyBMb29uZ3NvbiBUZWNobm9sb2d5IENvcnBvcmF0aW9uIExpbWl0ZWQKPj4gwqDCoCAqLwo+
PiDCoCArI2luY2x1ZGUgImFzbS9rdm1faG9zdC5oIgo+IEhhZCBiZXR0ZXIgcHV0IGFmdGVyICNp
bmNsdWRlIDxhc20vZnB1Lmg+LCBhbmQga2VlcCBhbHBoYWJldGljYWwgb3JkZXIuCj4+IMKgICNp
bmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgo+PiDCoCAjaW5jbHVkZSA8YXNtL2ZwdS5oPgo+PiDC
oCAjaW5jbHVkZSA8YXNtL2xidC5oPgo+PiBAQCAtMTQsNiArMTUsOCBAQAo+PiDCoCAjZGVmaW5l
IENSRUFURV9UUkFDRV9QT0lOVFMKPj4gwqAgI2luY2x1ZGUgInRyYWNlLmgiCj4+IMKgICsjZGVm
aW5lIE5VTV9MQlRfUkVHUyA2Cj4+ICsKPj4gwqAgY29uc3Qgc3RydWN0IF9rdm1fc3RhdHNfZGVz
YyBrdm1fdmNwdV9zdGF0c19kZXNjW10gPSB7Cj4+IMKgwqDCoMKgwqAgS1ZNX0dFTkVSSUNfVkNQ
VV9TVEFUUygpLAo+PiDCoMKgwqDCoMKgIFNUQVRTX0RFU0NfQ09VTlRFUihWQ1BVLCBpbnRfZXhp
dHMpLAo+PiBAQCAtMTE4Niw2ICsxMTg5LDcyIEBAIHN0YXRpYyBpbnQga3ZtX2xvb25nYXJjaF92
Y3B1X3NldF9hdHRyKHN0cnVjdAo+PiBrdm1fdmNwdSAqdmNwdSwKPj4gwqDCoMKgwqDCoCByZXR1
cm4gcmV0Owo+PiDCoCB9Cj4+IMKgICtzdGF0aWMgaW50IGt2bV9sb29uZ2FyY2hfd2Fsa19jc3Jz
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0Cj4+IF9fdXNlciAqdWluZGljZXMpCj4+ICt7Cj4+
ICvCoMKgwqAgdW5zaWduZWQgaW50IGksIGNvdW50Owo+PiArCj4+ICvCoMKgwqAgZm9yIChpID0g
MCwgY291bnQgPSAwOyBpIDwgQ1NSX01BWF9OVU1TOyBpKyspIHsKPj4gK8KgwqDCoMKgwqDCoMKg
IGlmICghKGdldF9nY3NyX2ZsYWcoaSkgJiAoU1dfR0NTUiB8IEhXX0dDU1IpKSkKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoaSA+PSBM
T09OR0FSQ0hfQ1NSX1BFUkZDVFJMMCAmJiBpIDw9Cj4+IExPT05HQVJDSF9DU1JfUEVSRkNOVFIz
KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFNraXAgUE1VIENTUnMgaWYgbm90IHN1
cHBvcnRlZCBieSB0aGUgZ3Vlc3QgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFr
dm1fZ3Vlc3RfaGFzX3BtdSgmdmNwdS0+YXJjaCkpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29udGludWU7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gVGhpcyBpcyB3b3JrYWJs
ZSwgZ2Nzcl9mbGFnIGNhbiBiZSBjaGFuZ2VkIHdpdGggc3RydWN0dXJlLCBhbmQgbmV3Cj4gZWxl
bWVudCAiaW50IHJlcXVpcmVkX2ZlYXR1cmVzIiBhZGRlZC4gSG93ZXZlciBpdCBkb2VzIG5vdCBt
YXR0ZXIsIGl0Cj4gY2FuIGJlIGRvbmUgaW4gbGF0ZXIuCj4KPiBDU1IgcmVnaXN0ZXJzIHJlbGF0
aXZlIHdpdGggbXNnaW50IGZlYXR1cmUgY2FuIGJlIGRvbmUgd2l0aCB0aGlzCj4gbWV0aG9kIGFs
c28uCj4KPiBIb3cgYWJvdXQgZGVidWcvd2F0Y2ggQ1NSIHJlZ2lzdGVycz8gY2FuIGl0IGJlIHNr
aXBwZWQgYWxzbz/CoCB0aGUgc2FtZQo+IE1FUlIgQ1NSIHJlZ2lzdGVycyB3aXRoIExPT05HQVJD
SF9DU1JfTUVSUiouCj4KPiBUaGUgQ1NSIHJlZ2lzdGVyIGxpc3QgZGlmZmVyZW5jZSBjYW4gYmUg
Y2hlY2tlZCB3aXRoCj4ga3ZtX2xvb25nYXJjaF9nZXRfY3NyKCkgaW4gcWVtdSBWTU0sIHdpdGgg
d2Vic2l0ZQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2Jsb2IvbWFz
dGVyL3RhcmdldC9sb29uZ2FyY2gva3ZtL2t2bS5jP3JlZl90eXBlPWhlYWRzwqAKPgpEbyB5b3Ug
dGhpbmsgZm9yIEtWTSBndWVzdHMsIHRoZSBvbmx5IENTUnMgbmVlZCB0byBiZSBzYXZlZCBhcmUg
bGlzdGVkCmF0Cmh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2Jsb2IvbWFz
dGVyL3RhcmdldC9sb29uZ2FyY2gva3ZtL2t2bS5jP3JlZl90eXBlPWhlYWRzI0wzNzUtNTQ0PwoK
VGhlbiB0aGUgY29uY2VybiBhYm91dCBlbWJlZGRpbmcgYSBiaWcgbGlzdCB3aWxsIGJlY29tZSB2
YWxpZCBhZ2Fpbi4KV2hhdCBkbyB5b3UgdGhpbms/Cgo+IFJlZ2FyZHMKPiBCaWJvIE1hb8KgCgpU
aGFua3MsCgpaaXhpbmcKCj4+ICvCoMKgwqDCoMKgwqDCoCBjb25zdCB1NjQgcmVnID0gS1ZNX0lP
Q19DU1JJRChpKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICh1aW5kaWNlcyAmJiBwdXRfdXNlcihy
ZWcsIHVpbmRpY2VzKyspKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVGQVVM
VDsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvdW50Kys7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKg
wqAgcmV0dXJuIGNvdW50Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBrdm1f
bG9vbmdhcmNoX251bV9yZWdzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPj4gK3sKPj4gK8KgwqDC
oCAvKiArMSBmb3IgdGhlIEtWTV9SRUdfTE9PTkdBUkNIX0NPVU5URVIgcmVnaXN0ZXIgKi8KPj4g
K8KgwqDCoCB1bnNpZ25lZCBsb25nIHJlcyA9Cj4+ICvCoMKgwqDCoMKgwqDCoCBrdm1fbG9vbmdh
cmNoX3dhbGtfY3Nycyh2Y3B1LCBOVUxMKSArIEtWTV9NQVhfQ1BVQ0ZHX1JFR1MgKyAxOwo+PiAr
Cj4+ICvCoMKgwqAgaWYgKGt2bV9ndWVzdF9oYXNfbGJ0KCZ2Y3B1LT5hcmNoKSkKPj4gK8KgwqDC
oMKgwqDCoMKgIHJlcyArPSBOVU1fTEJUX1JFR1M7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gcmVz
Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IGt2bV9sb29uZ2FyY2hfY29weV9yZWdfaW5kaWNl
cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdTY0IF9fdXNlciAqdWluZGljZXMpCj4+ICt7Cj4+ICvCoMKgwqAgdTY0
IHJlZzsKPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgaTsKPj4gKwo+PiArwqDCoMKgIGkgPSBrdm1f
bG9vbmdhcmNoX3dhbGtfY3Nycyh2Y3B1LCB1aW5kaWNlcyk7Cj4+ICvCoMKgwqAgaWYgKGkgPCAw
KQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGk7Cj4+ICvCoMKgwqAgdWluZGljZXMgKz0gaTsK
Pj4gKwo+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBLVk1fTUFYX0NQVUNGR19SRUdTOyBpKysp
IHsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZyA9IEtWTV9JT0NfQ1BVQ0ZHKGkpOwo+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKHB1dF91c2VyKHJlZywgdWluZGljZXMrKykpCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHJl
ZyA9IEtWTV9SRUdfTE9PTkdBUkNIX0NPVU5URVI7Cj4+ICvCoMKgwqAgaWYgKHB1dF91c2VyKHJl
ZywgdWluZGljZXMrKykpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVGQVVMVDsKPj4gKwo+
PiArwqDCoMKgIGlmICgha3ZtX2d1ZXN0X2hhc19sYnQoJnZjcHUtPmFyY2gpKQo+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIDA7Cj4+ICsKPj4gK8KgwqDCoCBmb3IgKGkgPSAxOyBpIDw9IE5VTV9M
QlRfUkVHUzsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWcgPSAoS1ZNX1JFR19MT09OR0FS
Q0hfTEJUIHwgS1ZNX1JFR19TSVpFX1U2NCB8IGkpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHB1
dF91c2VyKHJlZywgdWluZGljZXMrKykpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUZBVUxUOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArfQo+
PiArCj4+IMKgIGxvbmcga3ZtX2FyY2hfdmNwdV9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlscCwKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgaW9jdGwsIHVuc2lnbmVk
IGxvbmcgYXJnKQo+PiDCoCB7Cj4+IEBAIC0xMjUxLDYgKzEzMjAsMjQgQEAgbG9uZyBrdm1fYXJj
aF92Y3B1X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgciA9
IGt2bV9sb29uZ2FyY2hfdmNwdV9zZXRfYXR0cih2Y3B1LCAmYXR0cik7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsKPj4gwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgY2FzZSBLVk1fR0VUX1JF
R19MSVNUOiB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qga3ZtX3JlZ19saXN0IF9fdXNlciAq
dXNlcl9saXN0ID0gYXJncDsKPj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBrdm1fcmVnX2xpc3Qg
cmVnX2xpc3Q7Cj4+ICvCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBuOwo+PiArCj4+ICvCoMKgwqDC
oMKgwqDCoCByID0gLUVGQVVMVDsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChjb3B5X2Zyb21fdXNl
cigmcmVnX2xpc3QsIHVzZXJfbGlzdCwgc2l6ZW9mKHJlZ19saXN0KSkpCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKgwqAgbiA9IHJlZ19saXN0Lm47Cj4+
ICvCoMKgwqDCoMKgwqDCoCByZWdfbGlzdC5uID0ga3ZtX2xvb25nYXJjaF9udW1fcmVncyh2Y3B1
KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChjb3B5X3RvX3VzZXIodXNlcl9saXN0LCAmcmVnX2xp
c3QsIHNpemVvZihyZWdfbGlzdCkpKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHIgPSAtRTJCSUc7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAobiA8
IHJlZ19saXN0Lm4pCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKg
wqDCoMKgwqAgciA9IGt2bV9sb29uZ2FyY2hfY29weV9yZWdfaW5kaWNlcyh2Y3B1LCB1c2VyX2xp
c3QtPnJlZyk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoCB9Cj4+IMKgwqDC
oMKgwqAgZGVmYXVsdDoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHIgPSAtRU5PSU9DVExDTUQ7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
