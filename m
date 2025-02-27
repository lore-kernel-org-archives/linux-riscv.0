Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DC3C021BE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4MEvgI6ohts17bSrs5C0LsjOIlOSFnfdQuvy5xUxvE=; b=T0xW//w5egS1Ul
	11a8xZG+yWtu0SJHAvL5veKE7qWn8JVi/3XnwUt6S9feO8F0isvsbRcbjUAPyVENI3OCY3PV6Joy1
	saN4qyjOh3pq10o3IS/SnMSUea05kKrXZEkK7SzIjNVE/0q1lofnPgZdZijmjx5Q+D+JEEs8rcBUO
	8ySQQymtuGFzxtD2TPYGrbmtW102IZoQ3ToJC8N2Vj7eV4iNR4rltJO/GeEpN+8eZchWouAY/fxjM
	Ick1UMVciNoSrPSSds6gzE4mrIld7kHUiRaiaog0Su3ecTbOmc/o/LILqV16r9V7Piqqf748OZebn
	uznB46ViY57DqxdgfOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZHL-00000006hPf-2Hvw;
	Thu, 27 Feb 2025 08:29:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZFn-00000006hAe-1Y3L;
	Thu, 27 Feb 2025 08:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8E285C0767;
	Thu, 27 Feb 2025 08:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7C8C4CEDD;
	Thu, 27 Feb 2025 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740644902;
	bh=mL+ScEVoosTCLqReMvWvb0hKdFm7SzXMaD7EnmZ5gQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UkCcNxAHNlb8KdOpVGBTAsjYUG5oG1EXqGPyEiclsxzBC4p+LOLBcG4nlsZ/bWo+k
	 W+AZVnrXuaRNp4mDR5r14XtUQsblr0rPT8GQGXSvmHHye9M6QtKrggxgtlCWPBRshH
	 VXHHQftNfX5UHocw4EVWQUQmUDQz4GzjrsIKq68nK/GgPYUU36Ou13zR4DA+XXyBwE
	 VnpTHUvNXXG1VQHUqqmr5E8R4xbVpPoN8BgaUYrbR3al/9qF/BSs/eqYzBZCgu+gBm
	 aUlhq9JEmKjqnqTOuaNi+lue7T7tGaier67NxH/nVOHEYQbBo2Sn4rUSxSu7KWkMMY
	 sFWAD4mVSBNWA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <linux-kernel@vger.kernel.org>,  <rust-for-linux@vger.kernel.org>,
  <x86@kernel.org>,  <linux-riscv@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <loongarch@lists.linux.dev>,
  <tglx@linutronix.de>,  <mingo@redhat.com>,  <bp@alien8.de>,
  <dave.hansen@linux.intel.com>,  <peterz@infradead.org>,  <hpa@zytor.com>,
  <paul.walmsley@sifive.com>,  <palmer@dabbelt.com>,
  <aou@eecs.berkeley.edu>,  <catalin.marinas@arm.com>,  <will@kernel.org>,
  <chenhuacai@kernel.org>,  <kernel@xen0n.name>,
  <tangyouling@loongson.cn>,  <hejinyang@loongson.cn>,
  <yangtiezhu@loongson.cn>,  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,
  <boqun.feng@gmail.com>,  <gary@garyguo.net>,  <bjorn3_gh@protonmail.com>,
  <benno.lossin@proton.me>,  <aliceryhl@google.com>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 0/5] rust: Add bug/warn abstractions
In-Reply-To: <20250227.155417.1610168537890385926.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Thu, 27 Feb 2025 15:54:17 +0900")
References: <yy_ESUuchCjlaGIJHzCPAcP_d9ucSD0CGXaoZNNkY7BmN5Ch1J8avsA9QpKO5LkTjlGpu99jl8NrFl5NFSQXuw==@protonmail.internalid>
	<20250213135759.190006-1-fujita.tomonori@gmail.com>
	<8734g0v6ke.fsf@kernel.org>
	<aPT3Afc47I_dmAxy1DPVKUobcIJLV0rRUOXJX-ab6IFWqflSxdlOVQdJT0rxYQHjDBeWHDFjWsdXfiCOZ5hPWg==@protonmail.internalid>
	<20250227.155417.1610168537890385926.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 27 Feb 2025 09:28:11 +0100
Message-ID: <87frjzu6zo.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_002823_482423_4712672F 
X-CRM114-Status: GOOD (  12.90  )
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

IkZVSklUQSBUb21vbm9yaSIgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyaXRlczoKCj4g
T24gV2VkLCAyNiBGZWIgMjAyNSAyMDozOTo0NSArMDEwMAo+IEFuZHJlYXMgSGluZGJvcmcgPGEu
aGluZGJvcmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPj4gSG93IGRvZXMgdGhpcyBzZXJpZXMgY29t
cGFyZS9vdmVybGFwIHdpdGggWzFdID8KPj4KPj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI0MTEyNi1wcl9vbmNlX21hY3Jvcy12NC0wLTQxMGI4Y2E5NjQzZUB0dXRhLmlvLwo+
Cj4gTm8gb3ZlcmxhcC4gRWFjaCBzb2x2ZXMgYSBkaWZmZXJlbnQgcHJvYmxlbS4gQm90aCBhcmUg
bmVjZXNzYXJ5Lgo+Cj4gVGhpcyBwYXRjaHNldCBlbmFibGVzIFJ1c3QgY29kZSB0byBjYWxsIEMn
cyBCVUcvV0FSTiBwcm9wZXJseS4KPgo+IEN1cnJlbnRseSwgUnVzdCdzIEJVRygpIGlzIGEgc2lt
cGxlIHdyYXBwZXIgZm9yIEMncyBCVUcoKQo+IChydXN0L2hlbHBlcnMvYnVnLmMpLiBJIGFkZGVk
IEJVRygpIHRvIHJudWxsJ3MgaW5pdCgpIGFuZCBnb3QgdGhlCj4gZm9sbG93aW5nOgo+Cj4gIyBp
bnNtb2QgL3Jvb3Qvcm51bGxfbW9kLmtvCj4gcm51bGxfbW9kOiBSdXN0IG51bGxfYmxrIGxvYWRl
ZAo+IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+IGtlcm5lbCBCVUcgYXQg
cnVzdC9oZWxwZXJzL2J1Zy5jOjchCj4gT29wczogaW52YWxpZCBvcGNvZGU6IDAwMDAgWyMxXSBT
TVAKPiBDUFU6IDAgVUlEOiAwIFBJRDogMzEgQ29tbTogaW5zbW9kIE5vdCB0YWludGVkIDYuMTQu
MC1yYzErICMxMDMKPiBSSVA6IDAwMTA6cnVzdF9oZWxwZXJfQlVHKzB4OC8weDEwCj4gKHNuaXAp
Cj4KPiBUaGlzIGlzIE5PVCBkZWJ1ZyBpbmZvcm1hdGlvbiB0aGF0IHdlIGV4cGVjdC4gVGhlIHBy
b2JsZW0gaXMgdGhhdAo+IEJVRy9XQVJOIGZlYXR1cmUgKGxpYi9idWcuYykgY2FuIG9ubHkgYmUg
dXNlZCBmcm9tIGFzc2VtYmx5Lgo+Cj4gVGhpcyBwYXRjaHNldCBpbmNsdWRlcyBvbmx5IHdhcm4o
KSBidXQgd2l0aCBidWcoKSBpbXBsZW1lbnRhdGlvbiBvbgo+IHRvcCBvZiB0aGlzIHBhdGNoc2V0
LCBJIGdvdDoKPgo+ICMgaW5zbW9kIC9yb290L3JudWxsX21vZC5rbwo+IHJudWxsX21vZDogUnVz
dCBudWxsX2JsayBsb2FkZWQKPiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0K
PiBXQVJOSU5HOiBDUFU6IDAgUElEOiAzMSBhdCAvaG9tZS9mdWppdGEvZ2l0L2xpbnV4LXJ1c3Qv
ZHJpdmVycy9ibG9jay9ybnVsbC5yczo0NiBfUk52WENzYWZVZzNvT1lpeDhfNXJudWxsTnRCMl8x
M051bGxCbGtNb2R1XQo+IE1vZHVsZXMgbGlua2VkIGluOiBybnVsbF9tb2QoKykKPiBDUFU6IDAg
VUlEOiAwIFBJRDogMzEgQ29tbTogaW5zbW9kIE5vdCB0YWludGVkIDYuMTQuMC1yYzErICMxMDQK
PiBSSVA6IDAwMTA6X1JOdlhDc2FmVWczb09ZaXg4XzVybnVsbE50QjJfMTNOdWxsQmxrTW9kdWxl
TnRDc2FZQmVLTDczOVh6XzZrZXJuZWwxM0luUGxhY2VNb2R1bGU0aW5pdCsweDcxLzB4NGYwIFty
bnVsbF9tb2RdCj4KPgo+IFRoZSBbMV0gcGF0Y2hzZXQgYWRkcyBhbiBhYnN0cmFjaXRvbiBmb3Ig
aW5jbHVkZS9saW51eC9vbmNlX2xpdGUuaCwKPiAnY2FsbCBhIGZ1bmN0aW9uIG9uY2UnIGZlYXR1
cmUsIHdpdGggcHJfKl9vbmNlKCkgaW1wbGVtZW50YXRpb24uCj4KPiBwcl8qX29uY2UoKSBqdXN0
IGNhbGxzIHByaW50aygpIG9uY2UuIFVubGlrZSBCVUcvV0FSTiwgbm8gZGVidWcKPiBpbmZvcm1h
dGlvbiAoY2FsbCBwbGFjZSwgcmVnaXN0ZXJzLCBzdGFjayB0cmFjZSwgZXRjKS4KPgo+Cj4gVGhl
IG9ubHkgY29ubmVjdGlvbiBiZXR3ZWVuIHR3byBwYXRjaHNldCBpcyB0aGF0IFdBUk5fT05DRSgp
IGNhbiBiZQo+IGJ1aWx0IG9uIHRvcCBvZiBib3RoIGxpa2UgdGhlIEMgc2lkZS4KCkF3ZXNvbWUs
IHRoYW5rcyBmb3IgZXhwbGFpbmluZyDwn5GNCgoKQmVzdCByZWdhcmRzLApBbmRyZWFzIEhpbmRi
b3JnCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
