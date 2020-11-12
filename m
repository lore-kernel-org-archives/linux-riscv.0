Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF27C388F7
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 20:15:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E879820A8B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 20:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lJSBmnIq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NItCVCD1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E879820A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:Date:Subject:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C9JQVYQh2mauxihKgS5cpbFSgf/BWTHcvybDSOoTqe0=; b=lJSBmnIqF7y6XG800hWDpa+w1
	qxopk7fQ4JnDMsFKrVPYfjiOdk3KW1V55MpwjHZ6up0hKHMKXZWnku1+kJth1FenaFbRItF+DVZGP
	+3xOiyWqujql1uDvmW/mzYj1MDx9N+SnYLuIeOvrIxKtZ+lvBofey9CA7uR/7lKgAeOjiZem5EdcO
	g4nh4AJGacf4pUWmjEeVsF+fybGkLOEAnH7o1FFZqHc4PgCV0yjsLgYLpR+g4NENdtoO4FAbHQZbd
	Lc/DbQtt8xUN/eYt6a7oVwAg748PXWnqgpilqbPTRwZ3XP8U7Mpx6CVWEC9PVgitKSHJmdqn86I/e
	sgCSx5WlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdJ0I-0006xl-EG; Thu, 12 Nov 2020 20:15:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdJ0A-0006uW-N5
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 20:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605212125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwJcHMqFNMjcwmrQqeZ7xQpjUn5kuh+iR2Mn5fyrgQY=;
 b=NItCVCD1R6U5xavZbzcma6jVC8ivaO0PedyhMrbZ1a4Y3jcCiBlKz/0OH+ZZ5u4k4WFhn4
 8kcKSVbovymha6GO69y8ihereRITl+ft+R26LxLmsSqngopyMy5LyuNzxn0IMdo009zc2J
 GbXJWpCgvYAD5Xn0vhVU0vR0D1wTj4c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-43a3kTGYMSeOQkg8AiGU0A-1; Thu, 12 Nov 2020 15:15:22 -0500
X-MC-Unique: 43a3kTGYMSeOQkg8AiGU0A-1
Received: by mail-wr1-f71.google.com with SMTP id c8so2471823wrh.16
 for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2020 12:15:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=vHPfrB8xVjlPFSCqejvi+QTUrEERRY3Dc+wUeNVcoBQ=;
 b=gZpfFG3jJFlzsRiDLJp62ngqYfJ4IUWYDXJQ8wLbgSenU+fKad9IBPRjPDXBne7xdD
 LKOy5aBLggxMRq5NVJrEJgB4SsJoihTrFLEK0iLILBnJaT96oADoY+QtunmRCdIqGIsE
 yxyNsSq29ECGYF8rjoYTQECaLCHt6PUWVcoNZYtaFs+jbtYmEaWrPEMHGTTB2Ww2Co2k
 uba3BlftQJcPqH3j3uqxfz0ZeYiBdUxO0B8nWY+NOy72o6vVBqSr6xdwj1Z2JbzEp3Li
 eBYcntdQuxhcSu+RjfUCEuPuz9oP4KmPXZzqtcJAC2L5TG6FPZyj8qERjnmUGSgK9uwZ
 fFFg==
X-Gm-Message-State: AOAM530KZbk1wKpbOIzFfBAwzFjOzvT4tGYDn2mWbvhJtTN1df+6vGVu
 65nJHQiOPq9Rmxohc7jl5DaeSu1FOoWtCPpAfGJ+ct3tbsbk+8Etx52fGz8hcDqEuti6RgBp9rQ
 wMYZSr4h6o2oaUIADQe5TCsHtNHul
X-Received: by 2002:adf:e350:: with SMTP id n16mr1455244wrj.419.1605212120779; 
 Thu, 12 Nov 2020 12:15:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxji2+rXiblNfD29iXHuiDwrhuPVpa0KNLoEK9tHEW4ondrhf0pVB9gNYs6gWjo3tNv0xhLcA==
X-Received: by 2002:adf:e350:: with SMTP id n16mr1455211wrj.419.1605212120462; 
 Thu, 12 Nov 2020 12:15:20 -0800 (PST)
Received: from [192.168.3.114] (p5b0c631d.dip0.t-ipconnect.de. [91.12.99.29])
 by smtp.gmail.com with ESMTPSA id
 35sm8578483wro.71.2020.11.12.12.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 12:15:19 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v8 2/9] mmap: make mlock_future_check() global
Date: Thu, 12 Nov 2020 21:15:18 +0100
Message-Id: <7A16CA44-782D-4ABA-8D93-76BDD0A90F94@redhat.com>
References: <20201112190827.GP4758@kernel.org>
In-Reply-To: <20201112190827.GP4758@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: iPhone Mail (18A8395)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_151526_886308_2E24117C 
X-CRM114-Status: GOOD (  24.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cj4gQW0gMTIuMTEuMjAyMCB1bSAyMDowOCBzY2hyaWViIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz46Cj4gCj4g77u/T24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMDU6MjI6MDBQTSArMDEw
MCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBPbiAxMC4xMS4yMCAxOTowNiwgTWlrZSBS
YXBvcG9ydCB3cm90ZToKPj4+IE9uIFR1ZSwgTm92IDEwLCAyMDIwIGF0IDA2OjE3OjI2UE0gKzAx
MDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4+IE9uIDEwLjExLjIwIDE2OjE0LCBNaWtl
IFJhcG9wb3J0IHdyb3RlOgo+Pj4+PiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4Lmli
bS5jb20+Cj4+Pj4+IAo+Pj4+PiBJdCB3aWxsIGJlIHVzZWQgYnkgdGhlIHVwY29taW5nIHNlY3Jl
dCBtZW1vcnkgaW1wbGVtZW50YXRpb24uCj4+Pj4+IAo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgIG1tL2ludGVy
bmFsLmggfCAzICsrKwo+Pj4+PiAgIG1tL21tYXAuYyAgICAgfCA1ICsrLS0tCj4+Pj4+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4+IAo+Pj4+
PiBkaWZmIC0tZ2l0IGEvbW0vaW50ZXJuYWwuaCBiL21tL2ludGVybmFsLmgKPj4+Pj4gaW5kZXgg
YzQzY2NkZGRiMGY2Li5hZTE0NmEyNjBiMTQgMTAwNjQ0Cj4+Pj4+IC0tLSBhL21tL2ludGVybmFs
LmgKPj4+Pj4gKysrIGIvbW0vaW50ZXJuYWwuaAo+Pj4+PiBAQCAtMzQ4LDYgKzM0OCw5IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBtdW5sb2NrX3ZtYV9wYWdlc19hbGwoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEpCj4+Pj4+ICAgZXh0ZXJuIHZvaWQgbWxvY2tfdm1hX3BhZ2Uoc3RydWN0IHBhZ2Ug
KnBhZ2UpOwo+Pj4+PiAgIGV4dGVybiB1bnNpZ25lZCBpbnQgbXVubG9ja192bWFfcGFnZShzdHJ1
Y3QgcGFnZSAqcGFnZSk7Cj4+Pj4+ICtleHRlcm4gaW50IG1sb2NrX2Z1dHVyZV9jaGVjayhzdHJ1
Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBmbGFncywKPj4+Pj4gKyAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgbGVuKTsKPj4+Pj4gKwo+Pj4+PiAgIC8qCj4+Pj4+ICAgICog
Q2xlYXIgdGhlIHBhZ2UncyBQYWdlTWxvY2tlZCgpLiAgVGhpcyBjYW4gYmUgdXNlZnVsIGluIGEg
c2l0dWF0aW9uIHdoZXJlCj4+Pj4+ICAgICogd2Ugd2FudCB0byB1bmNvbmRpdGlvbmFsbHkgcmVt
b3ZlIGEgcGFnZSBmcm9tIHRoZSBwYWdlY2FjaGUgLS0gZS5nLiwKPj4+Pj4gZGlmZiAtLWdpdCBh
L21tL21tYXAuYyBiL21tL21tYXAuYwo+Pj4+PiBpbmRleCA2MWY3MmIwOWQ5OTAuLmM0ODFmMDg4
YmQ1MCAxMDA2NDQKPj4+Pj4gLS0tIGEvbW0vbW1hcC5jCj4+Pj4+ICsrKyBiL21tL21tYXAuYwo+
Pj4+PiBAQCAtMTM0OCw5ICsxMzQ4LDggQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHJv
dW5kX2hpbnRfdG9fbWluKHVuc2lnbmVkIGxvbmcgaGludCkKPj4+Pj4gICAgICAgcmV0dXJuIGhp
bnQ7Cj4+Pj4+ICAgfQo+Pj4+PiAtc3RhdGljIGlubGluZSBpbnQgbWxvY2tfZnV0dXJlX2NoZWNr
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBmbGFncywKPj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
bGVuKQo+Pj4+PiAraW50IG1sb2NrX2Z1dHVyZV9jaGVjayhzdHJ1Y3QgbW1fc3RydWN0ICptbSwg
dW5zaWduZWQgbG9uZyBmbGFncywKPj4+Pj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
bGVuKQo+Pj4+PiAgIHsKPj4+Pj4gICAgICAgdW5zaWduZWQgbG9uZyBsb2NrZWQsIGxvY2tfbGlt
aXQ7Cj4+Pj4+IAo+Pj4+IAo+Pj4+IFNvLCBhbiBpbnRlcmVzdGluZyBxdWVzdGlvbiBpcyBpZiB5
b3UgYWN0dWFsbHkgd2FudCB0byBjaGFyZ2Ugc2VjcmV0bWVtCj4+Pj4gcGFnZXMgYWdhaW5zdCBt
bG9jayBub3csIG9yIGlmIHlvdSB3YW50IGEgZGVkaWNhdGVkIHNlY3JldG1lbSBjZ3JvdXAKPj4+
PiBjb250cm9sbGVyIGluc3RlYWQ/Cj4+PiAKPj4+IFdlbGwsIHdpdGggdGhlIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24gdGhlcmUgYXJlIHRocmVlIGxpbWl0cyBhbgo+Pj4gYWRtaW5pc3RyYXRvciBj
YW4gdXNlIHRvIGNvbnRyb2wgc2VjcmV0bWVtIGxpbWl0czogbWxvY2ssIG1lbWNnIGFuZAo+Pj4g
a2VybmVsIHBhcmFtZXRlci4KPj4+IAo+Pj4gVGhlIGtlcm5lbCBwYXJhbWV0ZXIgcHV0cyBhIGds
b2JhbCB1cHBlciBsaW1pdCBmb3Igc2VjcmV0bWVtIHVzYWdlLAo+Pj4gbWVtY2cgYWNjb3VudHMg
YWxsIHNlY3JldG1lbSBhbGxvY2F0aW9ucywgaW5jbHVkaW5nIHRoZSB1bnVzZWQgbWVtb3J5IGlu
Cj4+PiBsYXJnZSBwYWdlcyBjYWNoaW5nIGFuZCBtbG9jayBhbGxvd3MgcGVyIHRhc2sgbGltaXQg
Zm9yIHNlY3JldG1lbQo+Pj4gbWFwcGluZ3MsIHdlbGwsIGxpa2UgbWxvY2sgZG9lcy4KPj4+IAo+
Pj4gSSBkaWRuJ3QgY29uc2lkZXIgYSBkZWRpY2F0ZWQgY2dyb3VwLCBhcyBpdCBzZWVtcyB3ZSBh
bHJlYWR5IGhhdmUgZW5vdWdoCj4+PiBleGlzdGluZyBrbm9icyBhbmQgYSBuZXcgb25lIHdvdWxk
IGJlIHVubmVjZXNzYXJ5Lgo+PiAKPj4gVG8gbWUgaXQgZmVlbHMgbGlrZSB0aGUgbWxvY2soKSBs
aW1pdCBpcyBhIHdyb25nIGZpdCBmb3Igc2VjcmV0bWVtLiBCdXQKPj4gbWF5YmUgdGhlcmUgYXJl
IG90aGVyIGNhc2VzIG9mIHVzaW5nIHRoZSBtbG9jaygpIGxpbWl0IHdpdGhvdXQgYWN0dWFsbHkK
Pj4gZG9pbmcgbWxvY2soKSB0aGF0IEkgYW0gbm90IGF3YXJlIG9mIChtb3N0IHByb2JhYmx5IDop
ICk/Cj4gCj4gU2VjcmV0bWVtIGRvZXMgbm90IGV4cGxpY2l0bHkgY2FsbHMgdG8gbWxvY2soKSBi
dXQgaXQgZG9lcyB3aGF0IG1sb2NrKCkKPiBkb2VzIGFuZCBhIGJpdCBtb3JlLiBDaXRpbmcgbWxv
Y2soMik6Cj4gCj4gIG1sb2NrKCksICBtbG9jazIoKSwgIGFuZCAgbWxvY2thbGwoKSAgbG9jayAg
cGFydCAgb3IgYWxsIG9mIHRoZSBjYWxsaW5nCj4gIHByb2Nlc3MncyB2aXJ0dWFsIGFkZHJlc3Mg
c3BhY2UgaW50byBSQU0sIHByZXZlbnRpbmcgdGhhdCAgbWVtb3J5ICBmcm9tCj4gIGJlaW5nIHBh
Z2VkIHRvIHRoZSBzd2FwIGFyZWEuCj4gCj4gU28sIGJhc2VkIG9uIHRoYXQgc2VjcmV0bWVtIHBh
Z2VzIGFyZSBub3Qgc3dhcHBhYmxlLCBJIHRoaW5rIHRoYXQKPiBSTElNSVRfTUVNTE9DSyBpcyBh
cHByb3ByaWF0ZSBoZXJlLgo+IAoKVGhlIHBhZ2UgZXhwbGljaXRseSBsaXN0cyBtbG9jaygpIHN5
c3RlbSBjYWxscy4gRS5nLiwgd2UgYWxzbyBkb27igJh0IGFjY291bnQgZm9yIGdpZ2FudGljIHBh
Z2VzIC0gd2hpY2ggbWlnaHQgYmUgYWxsb2NhdGVkIGZyb20gQ01BIGFuZCBhcmUgbm90IHN3YXBw
YWJsZS4KCgoKPj4gSSBtZWFuLCBteSBjb25jZXJuIGlzIG5vdCBlYXJ0aCBzaGF0dGVyaW5nLCB0
aGlzIGNhbiBiZSByZXdvcmtlZCBsYXRlci4gQXMgSQo+PiBzYWlkLCBpdCBqdXN0IGZlZWxzIHdy
b25nLgo+PiAKPj4gLS0gCj4+IFRoYW5rcywKPj4gCj4+IERhdmlkIC8gZGhpbGRlbmIKPj4gCj4g
Cj4gLS0gCj4gU2luY2VyZWx5IHlvdXJzLAo+IE1pa2UuCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
