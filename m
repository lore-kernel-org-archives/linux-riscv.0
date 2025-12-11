Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8389D41C3A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgUYhW8P0948rgVTHQLsTasqyKSGnYie9LBCMrSQGUg=; b=JOtLROn6wB9k+m
	oSNvHzUunw75mw2hmC++UP9m643YtXGQ3KhkFz8IQCbUsKdUcBXJZAK42TdkECmyG1D28mELzKXn6
	bdISM4dGPvWHboEFWEJanuFFfabFneLW+xmyZEyPnnym4P8lB6uI4CtbpWDmb8v6NTMY9Y4QDq+r0
	ME36mjQNZCuEQCQ+yNwJWWXyQuSHZ3dPCmyWyhSIy9HRMMWnocwjOpAFuoIta6Cq54PPWg9/zy85c
	TcxXYWuQ5gXE2uT3HfX2u9uUuBtHjMaqENSjOhG3xRQNSHLmLlF4gmwG2WNWBBxdzDDC1AgBfjcwY
	bVpIA0yqIPyQHKTZ5ySg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThD9-0000000GgXO-17g3;
	Thu, 11 Dec 2025 14:00:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThD7-0000000GgWj-1ME4
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 14:00:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DEE41688;
	Thu, 11 Dec 2025 05:59:51 -0800 (PST)
Received: from [10.57.90.205] (unknown [10.57.90.205])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05CCA3F73B;
	Thu, 11 Dec 2025 05:59:54 -0800 (PST)
Message-ID: <a063f6c5-2785-4a9f-8079-25edb3e54cef@arm.com>
Date: Thu, 11 Dec 2025 13:59:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/22] mm: Allow page table accessors to be
 non-idempotent
Content-Language: en-GB
To: Samuel Holland <samuel.holland@sifive.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-9-samuel.holland@sifive.com>
 <fbfef7fc-4030-462b-b514-498eea6620aa@arm.com>
 <c2597d43-d909-4259-bb5b-9294e4069385@kernel.org>
 <af8fd275-a34d-4b2f-8834-9c85dab2bbae@sifive.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <af8fd275-a34d-4b2f-8834-9c85dab2bbae@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_060001_463325_9456024F 
X-CRM114-Status: GOOD (  21.28  )
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

T24gMTEvMTIvMjAyNSAwMDozMywgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gT24gMjAyNS0xMS0y
OCAyOjQ3IEFNLCBEYXZpZCBIaWxkZW5icmFuZCAoUmVkIEhhdCkgd3JvdGU6Cj4+IE9uIDExLzI3
LzI1IDE3OjU3LCBSeWFuIFJvYmVydHMgd3JvdGU6Cj4+PiBPbiAxMy8xMS8yMDI1IDAxOjQ1LCBT
YW11ZWwgSG9sbGFuZCB3cm90ZToKPj4+PiBDdXJyZW50bHksIHNvbWUgZnVuY3Rpb25zIHN1Y2gg
YXMgcHRlX29mZnNldF9tYXAoKSBhcmUgcGFzc2VkIGJvdGgKPj4+PiBwb2ludGVycyB0byBoYXJk
d2FyZSBwYWdlIHRhYmxlcywgYW5kIHBvaW50ZXJzIHRvIHByZXZpb3VzbHktcmVhZCBQTUQKPj4+
PiBlbnRyaWVzIG9uIHRoZSBzdGFjay4gVG8gZW5zdXJlIGNvcnJlY3RuZXNzIGluIHRoZSBmaXJz
dCBjYXNlLCB0aGVzZQo+Pj4+IGZ1bmN0aW9ucyBtdXN0IHVzZSB0aGUgcGFnZSB0YWJsZSBhY2Nl
c3NvciBmdW5jdGlvbiAocG1kcF9nZXQoKSkgdG8KPj4+PiBkZXJlZmVyZW5jZSB0aGUgc3VwcGxp
ZWQgcG9pbnRlci4gSG93ZXZlciwgdGhpcyBtZWFucyBwbWRwX2dldCgpIGlzCj4+Pj4gY2FsbGVk
IHR3aWNlIGluIHRoZSBzZWNvbmQgY2FzZS4gVGhpcyBkb3VibGUgY2FsbCBtdXN0IGJlIGF2b2lk
ZWQgaWYKPj4+PiBwbWRwX2dldCgpIGFwcGxpZXMgc29tZSBub24taWRlbXBvdGVudCB0cmFuc2Zv
cm1hdGlvbiB0byB0aGUgdmFsdWUuCj4+Pj4KPj4+PiBBdm9pZCB0aGUgZG91YmxlIHRyYW5zZm9y
bWF0aW9uIGJ5IGNhbGxpbmcgc2V0X3BtZCgpIG9uIHRoZSBzdGFjawo+Pj4+IHZhcmlhYmxlcyB3
aGVyZSBuZWNlc3NhcnkgdG8ga2VlcCBzZXRfcG1kKCkvcG1kcF9nZXQoKSBjYWxscyBiYWxhbmNl
ZC4KPj4+Cj4+PiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBnb29kIHNvbHV0aW9uLgo+Pgo+PiBB
Z3JlZWQsCj4+Cj4+IMKgwqDCoMKgc2V0X3BtZCgmcG1kLCBwbWQpOwo+Pgo+PiBpcyByYXRoZXIg
aG9ycmlibGUuCj4gSSBhZ3JlZSB0aGF0IHRoaXMgcGF0Y2ggaXMgdWdseS4gVGhlIG9ubHkgd2F5
IEkgc2VlIHRvIGF2b2lkIGNvZGUgbGlrZSB0aGlzIGlzCj4gdG8gcmVmYWN0b3IgKG9yIGR1cGxp
Y2F0ZSkgdGhlIGZ1bmN0aW9ucyBzbyBubyBmdW5jdGlvbiB0YWtlcyBwb2ludGVycyB0byBib3Ro
Cj4gaGFyZHdhcmUgcGFnZSB0YWJsZXMgYW5kIG9uLXN0YWNrIHBhZ2UgdGFibGUgZW50cmllcy4g
SXMgdGhhdCBzb3J0IG9mCj4gcmVmYWN0b3JpbmcgdGhlIHJpZ2h0IGRpcmVjdGlvbiB0byBnbyBm
b3IgdjQ/CgpGcm9tIGEgcXVpY2sgbG9vayBhdCB0aGUgY29kZSwgSSB0aGluayB0aGF0IHNvbWUg
Y2FzZXMgYXJlIHNvbHZhYmxlIGJ5CnJlZmFjdG9yaW5nIHRvIHBhc3MgdGhlIHZhbHVlIGluc3Rl
YWQgb2YgdGhlIHBvaW50ZXIsIGFuZCBsZWF2ZSBpdCB0byB0aGUgaGlnaGVyCmxldmVsIGRlY2lk
ZSBob3cgdG8gcmVhZCB0aGUgdmFsdWUgZnJvbSB0aGUgcG9pbnRlciAtIGl0IGtub3dzIGlmIGl0
IGlzIHBvaW50aW5nCnRvIEhXIHBndGFibGUgb3IgaWYgaXQncyBhIChlLmcpIHN0YWNrIHZhbHVl
LgoKQnV0IHRoZSBtb3JlIEkgbG9vayBhdCB0aGUgY29kZSwgdGhlIG1vcmUgaW5zdGFuY2VzIEkg
ZmluZCB3aGVyZSBwb2ludGVycyB0bwpzdGFjayB2YXJpYWJsZXMgYXJlIGJlaW5nIHBhc3NlZCB0
byBhcmNoIHBndGFibGUgaGVscGVycyBhcyBpZiB0aGV5IGFyZSBIVwpwZ3RhYmxlIGVudHJ5IHBv
aW50ZXJzLiAoTWFpbmx5IHBtZCBsZXZlbCkuCgpJIHdvbmRlciBpZiB3ZSBuZWVkIHRvIGJpdGUg
dGhlIGJ1bGxldCBhbmQgZXhwbGljaXRseSBzZXBhcmF0ZSB0aGUgdHlwZXM/IEF0CmVhY2ggbGV2
ZWwsIHdlIGhhdmU6CgogMS4gcGFnZSB0YWJsZSBlbnRyeSB2YWx1ZQogMi4gcG9pbnRlciB0byBw
YWdlIHRhYmxlIGVudHJ5IF92YWx1ZV8gKGUuZy4gcG9pbnRlciB0byBwWFhfdCBvbiBzdGFjaykK
IDMuIHBvaW50ZXIgdG8gcGFnZSB0YWJsZSBlbnRyeSBpbiBIVyBwZ3RhYmxlCgpUb2RheSwgMSBp
cyByZXByZXNlbnRlZCBieSBwdGVfdCwgcG1kX3QsIGV0Yy4gMiBhbmQgMyBhcmUgcmVwcmVzZW50
ZWQgYnkgdGhlCnNhbWUgdHlwZTsgcHRlX3QqLCBwbWRfdCosIGV0Yy4KCklmIHdlIGNyZWF0ZSBh
IG5ldyB0eXBlIGZvciAzLCBpdCB3aWxsIGJvdGggZG9jdW1lbnQgYW5kIGVuZm9yY2Ugd2hlbiB0
eXBlIDIgb3IKdHlwZSAzIGlzIHJlcXVpcmVkLgoKZS5nOgoKLy8gcHRlX3Q6IGRlZmluZWQgYnkg
YXJjaC4KdHlwZWRlZiB1bnNpZ25lZCBsb25nIHB0ZV90OwoKLy8gcHRlcF90OiBuZXcgb3BhcXVl
IHR5cGUgdGhhdCBjYW4ndCBiZSBkZXJlZmVyZW5jZWQuCnN0cnVjdCBfX3B0ZXBfdDsKdHlwZWRl
ZiBzdHJ1Y3QgX19wdGVwX3QgKnB0ZXBfdDsKCi8vIGdldHRlci9zZXR0ZXIgcmVzcG9uc2libGUg
Zm9yIGNhc3QgJiBkZXJlZiBhcyBhcHByb3ByaWF0ZS4KcHRlX3QgcHRlcF9nZXQocHRlcF90IHB0
ZXApCnsKCXJldHVybiBSRUFEX09OQ0UoKihwdGVfdCAqKXB0ZXApOwp9CgppbnQgZG9fc3R1ZmYo
dm9pZCkKewoJLy8gdmFsdWUgb24gc3RhY2s6IG9rCglwdGVfdCBteXB0ZTsKCgkvLyBwb2ludGVy
IHRvIHZhbHVlIG9uIHN0YWNrOiBvawoJcHRlX3QgKnBteXB0ZSA9ICZteXB0ZTsKCgkvLyBoYW5k
bGUgdG8gZW50cnkgb24gc3RhY2s6IG5vdCBhbGxvd2VkIGJ5IGNvbXBpbGVyIQoJcHRlcF90IG15
cHRlcCA9ICZteXB0ZTsKCgkvLyBoYW5kbGUgdG8gZW50cnkgaW4gcGd0YWJsZTogb2sKCXB0ZXBf
dCBteXB0ZXAgPSBwdGVfb2Zmc2V0X2tlcm5lbCguLi4pOwoKCS8vIHJlYWQgdmFsdWUgb2YgcGd0
YWJsZSBlbnRyeTogb2sKCXB0ZV90IHZhbCA9IHB0ZXBfZ2V0KG15cHRlcCk7CgoJLy8gYXR0ZW1w
dCB0byBwYXNzIHBvaW50ZXIgdG8gc3RhY2sgdmFyaWFibGU6IG5vdCBhbGxvd2VkIGJ5IGNvbXBp
bGVyIQoJcHRlX3QgdmFsID0gcHRlcF9nZXQoJm15cHRlKTsKCgkvLyBhdHRlbXB0IHRvIGRpcmVj
dGx5IGRlcmVmZXJlbmNlIHB0ZXA6IG5vdCBhbGxvd2VkIGJ5IGNvbXBpbGVyIQoJcHRlX3QgdmFs
ID0gKm15cHRlcDsKfQoKCldlIGNvdWxkIGRvIHRoaXMgaW5jcmVtZW50YWxseSBieSBpbml0aWFs
bHkgdHlwZWRlZmluZyBwdGVwX3QgdG8gYmU6CnR5cGVkZWYgcHRlX3QgKnB0ZXBfdDsKClRoZW4g
d2UgY291bGQgZmxpcCB0aGUgc3dpdGNoIGFyY2gtYnktYXJjaCB0byBlbmFibGUgdGhlIHN0cm9u
Z2VyIGNoZWNraW5nLiBXZQpsaWtlbHkgd291bGRuJ3QgbmVlZCB0byBjb252ZXJ0IGFyY2hlcyB0
aGF0IGRvbid0IGNhcmUuCgpJIHRoaW5rIGJ5IGRvaW5nIHRoaXMsIGl0IHdpbGwgZXhwb3NlIGFs
bCB0aGUgY3VycmVudCBpc3N1ZXMgYW5kIGZvcmNlIHVzIHRvIGZpeAp0aGVtIHByb3Blcmx5LgoK
T24gdGhlIHJlbGF0ZWQgc3ViamVjdCBvZiBjb252ZXJzaW9uIHRvIHBYWHBfZ2V0KCk7IEkndmUg
YmVlbiBsb29raW5nIGludG8gdGhpcwphbmQgcGVyc29uYWxseSwgSSB0aGluayB3ZSBzaG91bGQg
aGF2ZSAyIGhlbHBlciBmbGF2b3VycyBhdCBlYWNoIGxldmVsOgoKIC0gcFhYZF9nZXQoKSAgICAg
IG9wdGltaXphYmxlIGJ5IGNvbXBpbGVyOyBkZWZhdWx0cyB0byBDIGRlcmVmZXJlbmNlCiAtIHBY
WGRfZ2V0X29uY2UoKSBzaW5nbGUtY29weS1hdG9taWMgYW5kIHVubW92YWJsZSBieSBjb21waWxl
cgoKSXQgc2ltcGxpZmllcyB0aGUgY29udmVyc3Rpb24gcHJvY2VzcywgYW5kIHJlZHVjZXMgdGhl
IHJpc2sgb2YgYnVncwpzaWduaWZpY2FudGx5IChnbyByZWFkIGFib3V0IHRoZSBhcm0zMiBpc3N1
ZXMgZGlzY3Vzc2VkIGluIEFuc2h1bWFuJ3Mgc2VyaWVzIGlmCnlvdSBoYXZlbid0IGRvbmUgYWxy
ZWFkeSkuCgpJIGFwcHJlY2lhdGUgdGhpcyBpcyBhbGwgcHJvYmFibHkgYSBsb3QgbW9yZSB3b3Jr
IHRoYW4geW91IHdvdWxkIHByZWZlciB0byBzaWduCnVwIGZvciwgSSdkIGJlIGhhcHB5IHRvIGNv
bGxhYm9yYXRlIGlmIHdlIGdldCBjb25jZW5zdXMgdGhhdCB0aGlzIGFwcHJvYWNoIG1ha2VzCnNl
bnNlLiBXaGF0IGRvIHlvdSB0aGluaz8KClRoYW5rcywKUnlhbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
