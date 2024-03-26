Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564D8C54E64
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 01:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOARCbyzKkCmEZA4oUFIOi1TwLyvC0hSWD0Gbw9+bn0=; b=OFN/qijNczc+mZ
	BMoPGy9WXR4OUsjP9zWTn4N1HczTCM2jZ7uek7xCEV60eGBdHxeYvf1C7PDm3gS7MQ64bQq7ahfMW
	h5hz9hOSU1i9DemUF8vhK6liN6G3FHJ7KYkaG/6Qe3VUzFoOjWDJW27diLgMuOZtbsJ7LBmZtDnxW
	H30xYcIysM/rOcokJfrXiUB3vGTSxcbv38OyznNIQav8YIz02faEsUvOgKFrdB7AScLJYlQ+uUGBb
	ZUw7N4ePACnGJ1JMt9GSz15LG9psdES9nK1GOhDGpx5A+vWAuTbOAcrngJG3VZi6rf5tJ8ipnJDGH
	jxJUruqrm8+JIlI1JYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rovKg-00000002afR-0ReS;
	Tue, 26 Mar 2024 01:10:30 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rovKb-00000002adY-3j2W;
	Tue, 26 Mar 2024 01:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2+G6lqjrPiGO7sJw8UoeY7bYbprZSC43xVHllYnfJhk=; b=rhJ7uKz/jNbiljxVy2Ig0qkt0g
	kvpuUE1lPLbwPzGEmAlvqhxspbyqAuhp3lvVu2/0lRADtNrnqN1QVyowSfck4x7sswZ3Mf2c+isL5
	JHZn0pHwYrSeW216yn4KsRHK18declY467zYpe1aGEz4NXQ34ztnSOhzbkext8kKJgZdEYIA3CDQl
	MqJkCcu19SKuJctfquerQaSbPbb9T0JPq0vVllSSIHhmlX5nSZbHfYt1w1RnUNz1OMZqjwluyIgKJ
	Z/NwN46y340x2/yIZMUl99PpWvJ+BJHNP4LRLQigoe4+IwdjCfowt9nl3g3oxJgDc06FTbUHhayoY
	+ROL5mmQ==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rovJx-00FHd6-1x; Tue, 26 Mar 2024 02:09:45 +0100
Message-ID: <7f6a223f-f432-4e1b-a67e-3816448224a1@igalia.com>
Date: Mon, 25 Mar 2024 22:09:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-6-linux@roeck-us.net>
 <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
 <e880828b-552e-488e-9f31-3989bec276ae@roeck-us.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <e880828b-552e-488e-9f31-3989bec276ae@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_181025_935471_2E78FB64 
X-CRM114-Status: GOOD (  15.39  )
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

T24gMy8yNS8yNCAxNjoyNCwgR3VlbnRlciBSb2VjayB3cm90ZToKPiBIaSwKPiAKPiBPbiBNb24s
IE1hciAyNSwgMjAyNCBhdCAwNDowNTowNlBNIC0wMzAwLCBNYcOtcmEgQ2FuYWwgd3JvdGU6Cj4+
IEhpIEd1ZW50ZXIsCj4+Cj4+IE9uIDMvMjUvMjQgMTQ6NTIsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6
Cj4+PiBUaGUgZHJtX3Rlc3RfcmVjdF9jYWxjX2hzY2FsZSBhbmQgZHJtX3Rlc3RfcmVjdF9jYWxj
X3ZzY2FsZSB1bml0IHRlc3RzCj4+PiBpbnRlbnRpb25hbGx5IHRyaWdnZXIgd2FybmluZyBiYWNr
dHJhY2VzIGJ5IHByb3ZpZGluZyBiYWQgcGFyYW1ldGVycyB0bwo+Pj4gdGhlIHRlc3RlZCBmdW5j
dGlvbnMuIFdoYXQgaXMgdGVzdGVkIGlzIHRoZSByZXR1cm4gdmFsdWUsIG5vdCB0aGUgZXhpc3Rl
bmNlCj4+PiBvZiBhIHdhcm5pbmcgYmFja3RyYWNlLiBTdXBwcmVzcyB0aGUgYmFja3RyYWNlcyB0
byBhdm9pZCBjbG9nZ2luZyB0aGUKPj4+IGtlcm5lbCBsb2cuCj4+Pgo+Pj4gVGVzdGVkLWJ5OiBM
aW51eCBLZXJuZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxsa2Z0QGxpbmFyby5vcmc+Cj4+PiBBY2tl
ZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgo+Pj4gU2lnbmVk
LW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+Pj4gLS0tCj4+PiAt
IFJlYmFzZWQgdG8gdjYuOS1yYzEKPj4+IC0gQWRkZWQgVGVzdGVkLWJ5OiwgQWNrZWQtYnk6LCBh
bmQgUmV2aWV3ZWQtYnk6IHRhZ3MKPj4+Cj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJt
X3JlY3RfdGVzdC5jIHwgNiArKysrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9yZWN0
X3Rlc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fcmVjdF90ZXN0LmMKPj4+IGluZGV4
IDc2MzMyY2QyZWFkOC4uNzU2MTRjYjRkZWI1IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rlc3Rz
L2RybV9yZWN0X3Rlc3QuYwo+Pj4gQEAgLTQwNiwyMiArNDA2LDI4IEBAIEtVTklUX0FSUkFZX1BB
UkFNKGRybV9yZWN0X3NjYWxlLCBkcm1fcmVjdF9zY2FsZV9jYXNlcywgZHJtX3JlY3Rfc2NhbGVf
Y2FzZV9kZXNjCj4+PiAgICBzdGF0aWMgdm9pZCBkcm1fdGVzdF9yZWN0X2NhbGNfaHNjYWxlKHN0
cnVjdCBrdW5pdCAqdGVzdCkKPj4+ICAgIHsKPj4+ICsJREVGSU5FX1NVUFBSRVNTRURfV0FSTklO
Ryhkcm1fY2FsY19zY2FsZSk7Cj4+PiAgICAJY29uc3Qgc3RydWN0IGRybV9yZWN0X3NjYWxlX2Nh
c2UgKnBhcmFtcyA9IHRlc3QtPnBhcmFtX3ZhbHVlOwo+Pj4gICAgCWludCBzY2FsaW5nX2ZhY3Rv
cjsKPj4+ICsJU1RBUlRfU1VQUFJFU1NFRF9XQVJOSU5HKGRybV9jYWxjX3NjYWxlKTsKPj4KPj4g
SSdtIG5vdCBzdXJlIGlmIGl0IGlzIG5vdCB0aGF0IG9idmlvdXMgb25seSB0byBtZSwgYnV0IGl0
IHdvdWxkIGJlIG5pY2UKPj4gdG8gaGF2ZSBhIGNvbW1lbnQgaGVyZSwgcmVtZW1iZXJpbmcgdGhh
dCB3ZSBwcm92aWRlIGJhZCBwYXJhbWV0ZXJzIGluCj4+IHNvbWUgdGVzdCBjYXNlcy4KPiAKPiBT
dXJlLiBTb21ldGhpbmcgbGlrZSB0aGlzID8KPiAKPiAgICAgICAgICAvKgo+ICAgICAgICAgICAq
IGRybV9yZWN0X2NhbGNfaHNjYWxlKCkgZ2VuZXJhdGVzIGEgd2FybmluZyBiYWNrdHJhY2Ugd2hl
bmV2ZXIgYmFkCj4gICAgICAgICAgICogcGFyYW1ldGVycyBhcmUgcGFzc2VkIHRvIGl0LiBUaGlz
IGFmZmVjdHMgYWxsIHVuaXQgdGVzdHMgd2l0aCBhbgo+ICAgICAgICAgICAqIGVycm9yIGNvZGUg
aW4gZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IuCj4gICAgICAgICAgICovCj4gCgpZZWFoLCBwZXJm
ZWN0LiBXaXRoIHRoYXQsIGZlZWwgZnJlZSB0byBhZGQgbXkKCkFja2VkLWJ5OiBNYcOtcmEgQ2Fu
YWwgPG1jYW5hbEBpZ2FsaWEuY29tPgoKQmVzdCBSZWdhcmRzLAotIE1hw61yYQoKPiBUaGFua3Ms
Cj4gR3VlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
