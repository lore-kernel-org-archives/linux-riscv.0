Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3016BCD3436
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 09:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBbnw/XT8sef+GPp2zyMyzdMpkEGJG1vIEBDZ6vboww=; b=TfW953yl30ArwN
	xeISD3m2TR3PmSdsiK1AYe8XTFeUFpf/60EXnVEaD2yLfMHIilMXJHeJuxBrheM9+8s0quNI6GY2+
	PHA+1abu8qp/ygHBt9Y69xgd0GclWm96s2A3o10tF/vC+3ULlK1V14yIjzFHV/DWGU0duTp1t6ltN
	xNf7nAEXsKuW00aFMAydoLViZP0XcPpDoJEwU5fi7sTCGjBHkSI/M1rM9kvJm4EToKzMbJsJxuddR
	JIzp0EfeJTPKmrzSKh0zMzYUxQsq1/GxqRCYvdCl9b6gRgMcHpqQVZcjvkFLa6wYrK5yuWR4bWCkl
	aWfPAqoxkpaZcm4JpmxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYtR-00000000P2j-3OjV;
	Wed, 06 May 2026 09:50:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYtR-00000000P2V-1AJd
	for linux-riscv@bombadil.infradead.org;
	Wed, 06 May 2026 09:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=BmFwsaprKzSgwn+DsYymab/KLbRfM0GSbq53P4jOkps=; b=W+dxv1ggqbaRjQgBZcSpU8ybzM
	Z4l+qcas32SFf42YeH+mM15XgFqsR4k5ccoA76MzOaczl7jUI/pyhevNaDgAR8X9b0JRJzZznKeHy
	1fJ5YdQ7Su/lGVdl541RmJqO+kMEQzMM9nSdimLahQL0nPY1rH98rbcnncEfsiRnuKzWizaL4IYqL
	WsoqunSndJRy6gU6b7IouUZ/7qzW+vZo1cjp9GltFP8gXXbddjeEzdbKOLNvG4KqjgTvOYF6LeKOd
	JlMFd5sMXTkEeUZDlk/Jrnez2vY+9MoIeeRX7mDNI6fRTGlL9vhGb6y7IjTaiiypkUPDAqRU4nblF
	+2lh7EMg==;
Received: from sphereful.davidgow.net ([2404:9400:4:0:216:3eff:fee2:5328])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYtO-0000000197U-0Yla
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 09:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1778060522;
	bh=wxwOGGBU7axLHOdFPa8Se5eHpE8XygiR/3cms0LswXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kyldBCEYLgCseQC2d8Nx4xrvxim8GwyDqykJan+Gg2g/kODZSHPEgLMOWo++rloK7
	 5MBLIJXFZhSIiz/8dsUbomF9DeM7bEC3GF2VufWYc+zQwUliMRYOfIP4EaWovO7zrx
	 FbCuMokuwo+0HLfSXWfM0qlZXj/kYHLZan/LGV00l0v7SZeYDwpJuLNq89oUdtN3Jr
	 EjEqxmC4lYOoUhkPrAiwwN4V9VIJpMaqhj5ueY+Fie2eCCS7CqsV3oyYAnS6muCabC
	 49FOK7Pj/9t6nWKQLbchzHGw5vtPMUsnVJi8LVNp7zuerCfgv6xx2YKQxahzINCj5P
	 shv2KAGsA8Tyj8oMleK/kEStmzuXKdJKSqClzLPLstyzPytM2dHG++zxUJjXWqLfnU
	 +I/rrp9i/b4ljgYmhwO9Y6NsNu+Ggsz01TIr1AloeVIxeZn4UrXKKiEHUnvqOKqi7p
	 O+QkqNYdEyQ+r9cAXwz2QfPB/8vz7OoOo5v8niIlJ1/1LHSc9jmhclOa/VVBFoaEsi
	 RQwDNsFDtkxDsqX15u3QtB6hSvWd1PNusb1bDZjed5kOGlT010vb4eGGXPWWvYo1iy
	 V9YYo1l1nT/44F0aA0suDSXrb16m0skDTKOiJMigaxCxzG4g80l417sKbmoj5kRsOv
	 vBPWliIhXdcF5197Lz2MOajQ=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 4BE751E935B; Wed,  6 May 2026 17:42:02 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1778060330;
	bh=wxwOGGBU7axLHOdFPa8Se5eHpE8XygiR/3cms0LswXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SdlOkqYgmpbMQ90PDsf4vRNjySF2VWn2s6xItWSlRvy0nYeO3PGdxzlfpOW5vgtu5
	 if5hGy6bGoNdipM5VQuimgFIHIKNGdaOf4YHLD/yKZ9zJcTUB64QAGizb/oRwx+Ye7
	 EBESj8bLMqCfGXWYHAoHJBNvORT2jw0kIPdJbdcd0HF4AGRpM/kXrcn5sXP00+JKH5
	 I7gFjm7bxv07o23A4fCkIEWTkv4Cr3cV2pagCYU2FsvYSULSRKja7otRbXAjzHwllJ
	 LhRpWRfUVdVyqd59KqHhJSlBa7IFXkeH9EUvF0d+P1fE2HK77hNjDwY5Jb4e28YaNx
	 nRXi8j1lnAqoSYv5Hzln6sUO4HF1eRcT1YcgDK0EF2OXQhNxeO9qojKh37CVNzsDgU
	 JlHxWPo+kyarDMyhaRCycdqITYW24zyT89S14QlGZsZQo9+PkOvxx8Bl6byrLQwfpz
	 HA/GAysD6LLH5D3Dlp+ShA2aby8d6OQJpemmQvsJ4GmPqpCpw1p27I8U132VYpxfKF
	 2OeuXk29pGwkognpCJCRBoWdZyGkznpQy/dZepv+oAGB4dmHUpwLFIoLM/CFv2lYcT
	 bbCvdHx+egEMZyZmE+jALf8iR+mIDj8U75t/sVcSY6WWMfgwCcrDXNg8zVUEgi334P
	 yVORKeqjzNqR+fBkv/oKVcMo=
Received: from [IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d] (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 279381E934B;
	Wed,  6 May 2026 17:38:50 +0800 (AWST)
Message-ID: <47d78cad-0839-4602-9cb3-d1f672739e7e@davidgow.net>
Date: Wed, 6 May 2026 17:38:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Albert Esteve <aesteve@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Alessandro Carminati <acarmina@redhat.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
 <20260504-kunit_add_support-v8-3-3e5957cdd235@redhat.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260504-kunit_add_support-v8-3-3e5957cdd235@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_105010_751977_A8CF57F8 
X-CRM114-Status: GOOD (  17.04  )
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

TGUgMDQvMDUvMjAyNiDDoCAzOjQxIFBNLCBBbGJlcnQgRXN0ZXZlIGEgw6ljcml0wqA6Cj4gRnJv
bTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+IAo+IFRoZSBkcm1fdGVzdF9y
ZWN0X2NhbGNfaHNjYWxlIGFuZCBkcm1fdGVzdF9yZWN0X2NhbGNfdnNjYWxlIHVuaXQgdGVzdHMK
PiBpbnRlbnRpb25hbGx5IHRyaWdnZXIgd2FybmluZyBiYWNrdHJhY2VzIGJ5IHByb3ZpZGluZyBi
YWQgcGFyYW1ldGVycyB0bwo+IHRoZSB0ZXN0ZWQgZnVuY3Rpb25zLiBXaGF0IGlzIHRlc3RlZCBp
cyB0aGUgcmV0dXJuIHZhbHVlLCBub3QgdGhlIGV4aXN0ZW5jZQo+IG9mIGEgd2FybmluZyBiYWNr
dHJhY2UuIFN1cHByZXNzIHRoZSBiYWNrdHJhY2VzIHRvIGF2b2lkIGNsb2dnaW5nIHRoZQo+IGtl
cm5lbCBsb2cgYW5kIGRpc3RyYWN0aW9uIGZyb20gcmVhbCBwcm9ibGVtcy4KPiAKPiBUZXN0ZWQt
Ynk6IExpbnV4IEtlcm5lbCBGdW5jdGlvbmFsIFRlc3RpbmcgPGxrZnRAbGluYXJvLm9yZz4KPiBB
Y2tlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgo+IEFja2Vk
LWJ5OiBNYcOtcmEgQ2FuYWwgPG1jYW5hbEBpZ2FsaWEuY29tPgo+IENjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAZ21haWwuY29tPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gU2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+
IFNpZ25lZC1vZmYtYnk6IEFsZXNzYW5kcm8gQ2FybWluYXRpIDxhY2FybWluYUByZWRoYXQuY29t
Pgo+IEFja2VkLWJ5OiBEYXZpZCBHb3cgPGRhdmlkQGRhdmlkZ293Lm5ldD4KPiBTaWduZWQtb2Zm
LWJ5OiBBbGJlcnQgRXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+Cj4gLS0tCgpJJ20gaGFwcHkg
d2l0aCB0aGlzIGVpdGhlciB3aXRoIG9yIHdpdGhvdXQgdGhlIGV4dHJhIGNoZWNrIGZvciB0aGUg
Cndhcm5pbmcgY291bnQuCgpBY2tlZC1ieTogRGF2aWQgR293IDxkYXZpZEBkYXZpZGdvdy5uZXQ+
CgpXZSdsbCB0YWtlIHRoaXMgcGF0Y2ggaW4gdGhlIGt1bml0IHRyZWUgYWxvbmcgd2l0aCB0aGUg
cmVzdCBvZiB0aGUgCnNlcmllcyBvbmNlIGV2ZXJ5b25lJ3MgaGFwcHkuCgpDaGVlcnMsCi0tIERh
dmlkCgo+ICAgZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYyB8IDIzICsrKysr
KysrKysrKysrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2Ry
bV9yZWN0X3Rlc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fcmVjdF90ZXN0LmMKPiBp
bmRleCAxN2UxZjM0Yjc2MTAxLi44MThlMTZlODBjOGY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90ZXN0cy9kcm1fcmVjdF90ZXN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVz
dHMvZHJtX3JlY3RfdGVzdC5jCj4gQEAgLTQwOSw4ICs0MDksMTYgQEAgc3RhdGljIHZvaWQgZHJt
X3Rlc3RfcmVjdF9jYWxjX2hzY2FsZShzdHJ1Y3Qga3VuaXQgKnRlc3QpCj4gICAJY29uc3Qgc3Ry
dWN0IGRybV9yZWN0X3NjYWxlX2Nhc2UgKnBhcmFtcyA9IHRlc3QtPnBhcmFtX3ZhbHVlOwo+ICAg
CWludCBzY2FsaW5nX2ZhY3RvcjsKPiAgIAo+IC0Jc2NhbGluZ19mYWN0b3IgPSBkcm1fcmVjdF9j
YWxjX2hzY2FsZSgmcGFyYW1zLT5zcmMsICZwYXJhbXMtPmRzdCwKPiAtCQkJCQkgICAgICBwYXJh
bXMtPm1pbl9yYW5nZSwgcGFyYW1zLT5tYXhfcmFuZ2UpOwo+ICsJLyoKPiArCSAqIGRybV9yZWN0
X2NhbGNfaHNjYWxlKCkgZ2VuZXJhdGVzIGEgd2FybmluZyBiYWNrdHJhY2Ugd2hlbmV2ZXIgYmFk
Cj4gKwkgKiBwYXJhbWV0ZXJzIGFyZSBwYXNzZWQgdG8gaXQuIFRoaXMgYWZmZWN0cyBhbGwgdW5p
dCB0ZXN0cyB3aXRoIGFuCj4gKwkgKiBlcnJvciBjb2RlIGluIGV4cGVjdGVkX3NjYWxpbmdfZmFj
dG9yLgo+ICsJICovCj4gKwlrdW5pdF93YXJuaW5nX3N1cHByZXNzKHRlc3QpIHsKPiArCQlzY2Fs
aW5nX2ZhY3RvciA9IGRybV9yZWN0X2NhbGNfaHNjYWxlKCZwYXJhbXMtPnNyYywgJnBhcmFtcy0+
ZHN0LAo+ICsJCQkJCQkgICAgICBwYXJhbXMtPm1pbl9yYW5nZSwKPiArCQkJCQkJICAgICAgcGFy
YW1zLT5tYXhfcmFuZ2UpOwo+ICsJfQo+ICAgCj4gICAJS1VOSVRfRVhQRUNUX0VRKHRlc3QsIHNj
YWxpbmdfZmFjdG9yLCBwYXJhbXMtPmV4cGVjdGVkX3NjYWxpbmdfZmFjdG9yKTsKPiAgIH0KPiBA
QCAtNDIwLDggKzQyOCwxNSBAQCBzdGF0aWMgdm9pZCBkcm1fdGVzdF9yZWN0X2NhbGNfdnNjYWxl
KHN0cnVjdCBrdW5pdCAqdGVzdCkKPiAgIAljb25zdCBzdHJ1Y3QgZHJtX3JlY3Rfc2NhbGVfY2Fz
ZSAqcGFyYW1zID0gdGVzdC0+cGFyYW1fdmFsdWU7Cj4gICAJaW50IHNjYWxpbmdfZmFjdG9yOwo+
ICAgCj4gLQlzY2FsaW5nX2ZhY3RvciA9IGRybV9yZWN0X2NhbGNfdnNjYWxlKCZwYXJhbXMtPnNy
YywgJnBhcmFtcy0+ZHN0LAo+IC0JCQkJCSAgICAgIHBhcmFtcy0+bWluX3JhbmdlLCBwYXJhbXMt
Pm1heF9yYW5nZSk7Cj4gKwkvKgo+ICsJICogZHJtX3JlY3RfY2FsY192c2NhbGUoKSBnZW5lcmF0
ZXMgYSB3YXJuaW5nIGJhY2t0cmFjZSB3aGVuZXZlciBiYWQKPiArCSAqIHBhcmFtZXRlcnMgYXJl
IHBhc3NlZCB0byBpdC4gVGhpcyBhZmZlY3RzIGFsbCB1bml0IHRlc3RzIHdpdGggYW4KPiArCSAq
IGVycm9yIGNvZGUgaW4gZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IuCj4gKwkgKi8KPiArCWt1bml0
X3dhcm5pbmdfc3VwcHJlc3ModGVzdCkgewo+ICsJCXNjYWxpbmdfZmFjdG9yID0gZHJtX3JlY3Rf
Y2FsY192c2NhbGUoJnBhcmFtcy0+c3JjLCAmcGFyYW1zLT5kc3QsCj4gKwkJCQkJCSAgICAgIHBh
cmFtcy0+bWluX3JhbmdlLCBwYXJhbXMtPm1heF9yYW5nZSk7Cj4gKwl9Cj4gICAKPiAgIAlLVU5J
VF9FWFBFQ1RfRVEodGVzdCwgc2NhbGluZ19mYWN0b3IsIHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGlu
Z19mYWN0b3IpOwo+ICAgfQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
