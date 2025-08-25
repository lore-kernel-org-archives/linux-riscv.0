Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C314DCA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 19:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNd+yTdXD+z0RtO+cgg9F/ey55QybiQOI/AecVNmFMA=; b=MXtuddomoZODzG
	qkDcCgYJGsRnmm1QjTu13qZeYBc3VVW9MOfNo8m6lcaRP/Fv9VcykaRgo71WCioLYBXM9bI3wuD2A
	jTUEb/c5wnQi4eGpgiDaF1c1VHqWK8wBDtBz7hQIXM4WlOvIm0VR2G2a8FOjYQQJPMx3tn11tXoWD
	WyUw5YfbPSLgTIed5WfUw9T9OTSnD9ArNpQRL9i2ZSbR6P3mMZxyAzwxr5xwO1oxe9x91/ws3CcRW
	5aq079ETo8xJSrDCioAh8sHP3XPbdSpujgh7xDYwWsisQCVw5zshjJThLFDbWBXoWIjKzFAB2eStR
	zKr9fOxSEAFatdjuvRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcvQ-00000009KhS-1Awa;
	Mon, 25 Aug 2025 19:32:16 +0000
Received: from mta.outflux.net ([2001:19d0:2:6:c0de:0:736d:7471] helo=smtp.outflux.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcvO-00000009KgR-1h7C;
	Mon, 25 Aug 2025 19:32:15 +0000
Received: from auth (localhost [127.0.0.1]) (authenticated bits=0)
	by vinyl.outflux.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id 57PJVcXW012364
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 25 Aug 2025 12:31:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=outflux.net;
	s=2016010; t=1756150300;
	bh=Cc0A7KST88BbLESFvBNiNEgFzJEi7Yi2EVmfXhRgL6M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=dmm7Uk1rljY/b4/3j8njDIEy+Scks4cnfZAOL8qtbXCH9h9jV621co70Fuer5Vf17
	 2vNGEXeFRnmarqqQKCQXq3nlyBV+sTTzdmwDNFgEktyxTZkW7g83isIllAWQ5Jvik2
	 /8fn12aBvHvvu5EXYWBmhf7ySJSjrTUnGPHeNjnY=
Date: Mon, 25 Aug 2025 15:31:34 -0400
From: Kees Cook <kees@outflux.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Kees Cook <kees@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
User-Agent: K-9 Mail for Android
In-Reply-To: <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org> <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com> <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
Message-ID: <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
MIME-Version: 1.0
X-MIMEDefang-Filter: outflux$Revision: 1.316 $
X-HELO: [IPv6:::1]
X-Scanned-By: MIMEDefang 2.83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_123214_457925_1DE5E44C 
X-CRM114-Status: GOOD (  13.21  )
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

CgpPbiBBdWd1c3QgMjUsIDIwMjUgMTowMDoyMiBQTSBFRFQsIE1pZ3VlbCBPamVkYSA8bWlndWVs
Lm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4gd3JvdGU6Cj5PbiBNb24sIEF1ZyAyNSwgMjAyNSBh
dCA1OjM14oCvUE0gS2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBZZWFo
LCB0aGF0J3MgYSBnb29kIGlkZWEuIFdoYXQgdGhlIHJpZ2h0IHdheSB0byBkbyB0aGF0Pwo+Pgo+
PiBjb25maWcgQ0ZJX0NMQU5HCj4+ICAgICAgICAgYm9vbCAiVXNlIENsYW5nJ3MgQ29udHJvbCBG
bG93IEludGVncml0eSAoQ0ZJKSIKPj4gICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfU1VQUE9SVFNf
Q0ZJCj4+ICAgICAgICAgc2VsZWN0IENGSQo+Pgo+PiA/Cj4KPkkgZG9uJ3QgcmVjYWxsIHdoYXQg
aXMgdGhlIGlkaW9tYXRpYyBzb2x1dGlvbiBmb3IgcmVuYW1lcywgYnV0IEkKPnJlbWVtYmVyIExp
bnVzIHRhbGtpbmcgYWJvdXQgdGhpcyB0b3BpYyBhbmQgYWJvdXQgYXZvaWRpbmcgbG9zaW5nIG9s
ZAo+dmFsdWVzIGlmIHBvc3NpYmxlIChwZXJoYXBzIGdldHRpbmcgYSBuZXcgcXVlc3Rpb24gaW4g
YG9sZGNvbmZpZ2AgaXMKPk9LIGFzIGxvbmcgYXMgdGhlIGBvbGRkZWZjb25maWdgIHJlc3BlY3Rz
IHRoZSBvbGQgdmFsdWUpLgo+Cj5JIHRoaW5rIHlvdXIgc3VnZ2VzdGlvbiBhYm92ZSB3aWxsIHN0
aWxsIG1ha2UgaXQgYXBwZWFyIHR3aWNlIGluCj5gbWVudWNvbmZpZ2AgLS0gdGhlcmUgbWF5IGJl
IGEgd2F5IHRvIHBsYXkgd2l0aCB2aXNpYmlsaXR5IHRvIG1ha2UgaXQKPmJldHRlci4KPgo+QSBz
aW1wbGUgcG9zc2liaWxpdHkgSSBjYW4gdGhpbmsgb2YgKGFzc3VtaW5nIGl0IHdvcmtzKSBpcyBo
YXZpbmcgdGhlCj5DRkkgc3ltYm9sIGZvciB0aGUgdGltZSBiZWluZyBpbnRyb2R1Y2VkIGp1c3Qg
YXMgYSBgZGVmX2Jvb2wKPkNGSV9DTEFOR2AgZm9yIGEgZmV3IHJlbGVhc2VzIHNvIHRoYXQgcGVv
cGxlIGdldCB0aGUgbmV3IG9uZSBpbiB0aGVpcgo+Y29uZmlncy4KCkFoLCBJIHRoaW5rIHRoaXMg
d29ya3M6Cgpjb25maWcgQ0ZJX0NMQU5HCiAgICBib29sCgpjb25maWcgQ0ZJCiAgICBib29sICIu
Li4uIgogICAgZGVmYXVsdCBDRklfQ0xBTkcKCkkgd2lsbCBhZGQgdGhhdCBmb3IgdjIuCgotS2Vl
cwoKLS0gCktlZXMgQ29vawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
