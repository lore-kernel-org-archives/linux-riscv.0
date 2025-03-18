Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A00C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idLig5cZFKr9t9WEH66auIAbl2LJ0U8yKsfcHUETdfA=; b=2yifqWKtVsAprw
	+UdqP84ZfZ2qE7iZRnbCQvu5/OuzdMSQ4iq+pGNb66H3XlVQBgfflhsXwRGDnsnDfzFZrfEMi+T9/
	u/DghiFc+32luPhYM8+daReDThjLjJ3gxbBnzH9k6C+6uKJ1pZkHcXtG9dX5LJAq1WUqaDAEIhSRB
	Sl4CgJdlQNE0o8D/+L58bATTgDPXSdWn79rAa3vVL0pizrrqJWaqX/rULAImMXfNaLJWZtTZ4V73R
	Pfbj7hYB+82Q1rcJGWwGwx3XZepdhIrfJ115J1aWweoXvAOU7AVZu/B5Ci8mqOOArH0S2OEX/AR7c
	ik4reHLkjiBsPcvH24dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZNv-00000006RhF-0CEy;
	Tue, 18 Mar 2025 16:01:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZMD-00000006RNQ-22gY;
	Tue, 18 Mar 2025 15:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9BB8A48A95;
	Tue, 18 Mar 2025 15:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FD2C4CEDD;
	Tue, 18 Mar 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742313596;
	bh=wnqlTyxAgZ8CuVhXT9duPOO4NgjQBjimZKlWtsOUGPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVHlHUakLlfN9xeuBYO1EJf+5CyU+WJKRkilNy467a1BnupPF2HSzG6De1fpXKFV+
	 ix9jYHBoyySgyb6uel1Y6KTQEzU4+Rwm0HghzRyuSjF71hbCSnTEGnernC5xUEtu10
	 +UeOIc/V5TKw7+jkC51H/NeBuaIOzIXiqjJlwYzUGV3n3dFHQ9MxYqNWDakJi0E6hg
	 3eBuUyUh9Yz/C8EPNMpPnQhIe07ID+3WJ5N3wJyQiVpq4Skm6z+pxWjAjp5DobEjiB
	 6Jrg3x/R+DiIvD5NG4zUjWrrB/2tNu1hT+SvmfpVy3qQGAt9drIa3KhZDqAUmDABl/
	 j7eCAm37AJZIQ==
Date: Tue, 18 Mar 2025 15:59:47 +0000
From: Will Deacon <will@kernel.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <20250318155946.GC13829@willie-the-truck>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_085957_658954_21487E57 
X-CRM114-Status: GOOD (  25.34  )
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

T24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgMDU6NDA6NTlQTSArMDEwMCwgQWxlc3NhbmRybyBDYXJt
aW5hdGkgd3JvdGU6Cj4gT24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgMToyNeKAr1BNIFdpbGwgRGVh
Y29uIDx3aWxsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgTWFyIDEzLCAyMDI1
IGF0IDExOjQzOjIyQU0gKzAwMDAsIEFsZXNzYW5kcm8gQ2FybWluYXRpIHdyb3RlOgo+ID4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9idWcuaCBiL2FyY2gvYXJtNjQvaW5j
bHVkZS9hc20vYnVnLmgKPiA+ID4gaW5kZXggMjhiZTA0OGRiM2Y2Li4wNDRjNWUyNGExN2QgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vYnVnLmgKPiA+ID4gKysrIGIv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9idWcuaAo+ID4gPiBAQCAtMTEsOCArMTEsMTQgQEAKPiA+
ID4KPiA+ID4gICNpbmNsdWRlIDxhc20vYXNtLWJ1Zy5oPgo+ID4gPgo+ID4gPiArI2lmZGVmIEhB
VkVfQlVHX0ZVTkNUSU9OCj4gPiA+ICsjIGRlZmluZSBfX0JVR19GVU5DICBfX2Z1bmNfXwo+ID4g
PiArI2Vsc2UKPiA+ID4gKyMgZGVmaW5lIF9fQlVHX0ZVTkMgIE5VTEwKPiA+ID4gKyNlbmRpZgo+
ID4gPiArCj4gPiA+ICAjZGVmaW5lIF9fQlVHX0ZMQUdTKGZsYWdzKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+ID4gLSAgICAgYXNtIHZvbGF0aWxlIChfX3N0cmluZ2lmeShBU01fQlVH
X0ZMQUdTKGZsYWdzKSkpOwo+ID4gPiArICAgICBhc20gdm9sYXRpbGUgKF9fc3RyaW5naWZ5KEFT
TV9CVUdfRkxBR1MoZmxhZ3MsICVjMCkpIDogOiAiaSIgKF9fQlVHX0ZVTkMpKTsKPiA+Cj4gPiBX
aHkgaXMgJ2knIHRoZSByaWdodCBhc20gY29uc3RyYWludCB0byB1c2UgaGVyZT8gSXQgc2VlbXMg
YSBiaXQgb2RkIHRvCj4gPiB1c2UgdGhhdCBmb3IgYSBwb2ludGVyLgo+IAo+IEkgcmVjZWl2ZWQg
dGhpcyBjb2RlIGFzIGxlZ2FjeSBmcm9tIGEgcHJldmlvdXMgdmVyc2lvbi4KPiBJbiBteSByZXZp
ZXcsIEkgY29uc2lkZXJlZCB0aGUgY2FzZSB3aGVuIEhBVkVfQlVHX0ZVTkNUSU9OIGlzIGRlZmlu
ZWQ6Cj4gSGVyZSwgX19CVUdfRlVOQyBpcyBkZWZpbmVkIGFzIF9fZnVuY19fLCB3aGljaCBpcyB0
aGUgbmFtZSBvZiB0aGUKPiBjdXJyZW50IGZ1bmN0aW9uIGFzIGEgc3RyaW5nIGxpdGVyYWwuCj4g
VXNpbmcgdGhlIGNvbnN0cmFpbnQgImkiIHNlZW1zIGFwcHJvcHJpYXRlIHRvIG1lIGluIHRoaXMg
Y2FzZS4KPiAKPiBIb3dldmVyLCB3aGVuIEhBVkVfQlVHX0ZVTkNUSU9OIGlzIG5vdCBkZWZpbmVk
Ogo+IF9fQlVHX0ZVTkMgaXMgZGVmaW5lZCBhcyBOVUxMLiBJbml0aWFsbHksIEkgY29uc2lkZXJl
ZCBpdCBsaXRlcmFsIDAsCj4gYnV0IGFmdGVyIGludmVzdGlnYXRpbmcgeW91ciBjb25jZXJuLCBJ
IGZvdW5kOgo+IAo+IGBgYAo+ICQgZWNobyAtRSAiI2luY2x1ZGUgPHN0ZGlvLmg+XG4jaW5jbHVk
ZSA8c3RkZGVmLmg+XG5pbnQgbWFpbigpCj4ge1xucmV0dXJuIDA7XG59IiB8IGFhcmNoNjQtbGlu
dXgtZ251LWdjYyAtRSAtZE0gLSB8IGdyZXAgTlVMTAo+ICNkZWZpbmUgTlVMTCAoKHZvaWQgKikw
KQo+IGBgYAo+IAo+IEkgcmVhbGl6ZWQgdGhhdCBOVUxMIGlzIGFjdHVhbGx5IGEgcG9pbnRlciB0
aGF0IGlzIG5vdCBhIGxpbmsgdGltZQo+IHN5bWJvbCwgYW5kIHVzaW5nIHRoZSAiaSIgY29uc3Ry
YWludCB3aXRoIE5VTEwgbWF5IHJlc3VsdCBpbiB1bmRlZmluZWQKPiBiZWhhdmlvci4KPiAKPiBX
b3VsZCB0aGUgZm9sbG93aW5nIGFsdGVybmF0aXZlIGRlZmluaXRpb24gZm9yIF9fQlVHX0ZVTkMg
YmUgbW9yZSBjb252aW5jaW5nPwo+IAo+IGBgYAo+ICNpZmRlZiBIQVZFX0JVR19GVU5DVElPTgo+
ICAgICAjZGVmaW5lIF9fQlVHX0ZVTkMgX19mdW5jX18KPiAjZWxzZQo+ICAgICAjZGVmaW5lIF9f
QlVHX0ZVTkMgKHVpbnRwdHJfdCkwCj4gI2VuZGlmCj4gYGBgCj4gTGV0IG1lIGtub3cgeW91ciB0
aG91Z2h0cy4KClRoYW5rcyBmb3IgdGhlIGFuYWx5c2lzOyBJIGhhZG4ndCBub3RpY2VkIHRoaXMg
c3BlY2lmaWMgaXNzdWUsIGl0IGp1c3QKc21lbGxlZCBhIGJpdCBmaXNoeS4gQW55d2F5LCB0aGUg
ZGlmZiBhYm92ZSBsb29rcyBiZXR0ZXIsIHRoYW5rcy4KCldpbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
