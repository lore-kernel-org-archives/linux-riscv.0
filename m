Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42031C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0a2fWaAtaA01o3K0uwvoE3PfXgLYfaEnnsdZQNa3GeY=; b=NOpFwHDGHBOafp
	mPZ42W8EmNwYa9joy13hCQsGUrTdnD0Keq/VGFE4FxzHlJRj7CekAgTA6CasvDxcnFf13ncA1sZBB
	qnUiHZEZnoJ94rT0htYYwv2n1C/wSaIICmJblnFZhPtr8NH2atnzwvvKKx+jbGwwehjrIZgP/sMow
	+JPVg8KjeQtjyYSkcZ4dslzqZL/H7UI8Wan+Q90rDE6WnUnaS/9uQfrK6NEk0kSv/nLgzBjuK3Tug
	EJlAYnHqsYZUamFlq0uviGSs/SjmaDHS3IgRZhu60wka0U2MEbewp2UfPDfSRJr1AXjztZfNoJo7M
	NU0vUto+qq51cNmy2REA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rope6-00000001VMP-2ZXx;
	Mon, 25 Mar 2024 19:06:10 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rope3-00000001VFh-1Do9;
	Mon, 25 Mar 2024 19:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/cOCj+3wz4G6mk7yJiOWKe+zWsog28msEXqYEYYF/PM=; b=KrsZ3Dg+BwR2PxtUZN7tRdXRM/
	hzD6VT43T4jmCbBOlQa33Sar4qRrk34fr3Gcfdp4NQWyMpNKX4DH6J6albLyamFGb2CGEiZOtE5rW
	nfLSP5bRkADNvscY10NWmVllXMUJQDKsyuMyDODwaUtYaCGTGsGnQon7XaddORjvYOehlVXeE6sfa
	n/bIrGl+ZGAr/bWkdry+5ZKkzUgSzgmqpPyWvxvxDDYmJrN43CkrvCrpPuNbz7XsoF5Y7Liw6IIBe
	NgZRaSze46IWt9cBigdGv5ZmmlmhThf/TXsUVgjI26u4CbbOLSlCdcwSS/EtJiOUe4764vjuRvM+Q
	SpYZMTlA==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ropdK-00FBOo-Kv; Mon, 25 Mar 2024 20:05:23 +0100
Message-ID: <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
Date: Mon, 25 Mar 2024 16:05:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Guenter Roeck <linux@roeck-us.net>, linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
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
In-Reply-To: <20240325175248.1499046-6-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_120607_385118_DBA91F8C 
X-CRM114-Status: GOOD (  16.43  )
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

SGkgR3VlbnRlciwKCk9uIDMvMjUvMjQgMTQ6NTIsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gVGhl
IGRybV90ZXN0X3JlY3RfY2FsY19oc2NhbGUgYW5kIGRybV90ZXN0X3JlY3RfY2FsY192c2NhbGUg
dW5pdCB0ZXN0cwo+IGludGVudGlvbmFsbHkgdHJpZ2dlciB3YXJuaW5nIGJhY2t0cmFjZXMgYnkg
cHJvdmlkaW5nIGJhZCBwYXJhbWV0ZXJzIHRvCj4gdGhlIHRlc3RlZCBmdW5jdGlvbnMuIFdoYXQg
aXMgdGVzdGVkIGlzIHRoZSByZXR1cm4gdmFsdWUsIG5vdCB0aGUgZXhpc3RlbmNlCj4gb2YgYSB3
YXJuaW5nIGJhY2t0cmFjZS4gU3VwcHJlc3MgdGhlIGJhY2t0cmFjZXMgdG8gYXZvaWQgY2xvZ2dp
bmcgdGhlCj4ga2VybmVsIGxvZy4KPiAKPiBUZXN0ZWQtYnk6IExpbnV4IEtlcm5lbCBGdW5jdGlv
bmFsIFRlc3RpbmcgPGxrZnRAbGluYXJvLm9yZz4KPiBBY2tlZC1ieTogRGFuIENhcnBlbnRlciA8
ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sg
PGxpbnV4QHJvZWNrLXVzLm5ldD4KPiAtLS0KPiAtIFJlYmFzZWQgdG8gdjYuOS1yYzEKPiAtIEFk
ZGVkIFRlc3RlZC1ieTosIEFja2VkLWJ5OiwgYW5kIFJldmlld2VkLWJ5OiB0YWdzCj4gCj4gICBk
cml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5jIHwgNiArKysrKysKPiAgIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fcmVj
dF90ZXN0LmMKPiBpbmRleCA3NjMzMmNkMmVhZDguLjc1NjE0Y2I0ZGViNSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYwo+IEBAIC00MDYsMjIgKzQwNiwyOCBAQCBLVU5J
VF9BUlJBWV9QQVJBTShkcm1fcmVjdF9zY2FsZSwgZHJtX3JlY3Rfc2NhbGVfY2FzZXMsIGRybV9y
ZWN0X3NjYWxlX2Nhc2VfZGVzYwo+ICAgCj4gICBzdGF0aWMgdm9pZCBkcm1fdGVzdF9yZWN0X2Nh
bGNfaHNjYWxlKHN0cnVjdCBrdW5pdCAqdGVzdCkKPiAgIHsKPiArCURFRklORV9TVVBQUkVTU0VE
X1dBUk5JTkcoZHJtX2NhbGNfc2NhbGUpOwo+ICAgCWNvbnN0IHN0cnVjdCBkcm1fcmVjdF9zY2Fs
ZV9jYXNlICpwYXJhbXMgPSB0ZXN0LT5wYXJhbV92YWx1ZTsKPiAgIAlpbnQgc2NhbGluZ19mYWN0
b3I7Cj4gICAKPiArCVNUQVJUX1NVUFBSRVNTRURfV0FSTklORyhkcm1fY2FsY19zY2FsZSk7CgpJ
J20gbm90IHN1cmUgaWYgaXQgaXMgbm90IHRoYXQgb2J2aW91cyBvbmx5IHRvIG1lLCBidXQgaXQg
d291bGQgYmUgbmljZQp0byBoYXZlIGEgY29tbWVudCBoZXJlLCByZW1lbWJlcmluZyB0aGF0IHdl
IHByb3ZpZGUgYmFkIHBhcmFtZXRlcnMgaW4Kc29tZSB0ZXN0IGNhc2VzLgoKQmVzdCBSZWdhcmRz
LAotIE1hw61yYQoKPiAgIAlzY2FsaW5nX2ZhY3RvciA9IGRybV9yZWN0X2NhbGNfaHNjYWxlKCZw
YXJhbXMtPnNyYywgJnBhcmFtcy0+ZHN0LAo+ICAgCQkJCQkgICAgICBwYXJhbXMtPm1pbl9yYW5n
ZSwgcGFyYW1zLT5tYXhfcmFuZ2UpOwo+ICsJRU5EX1NVUFBSRVNTRURfV0FSTklORyhkcm1fY2Fs
Y19zY2FsZSk7Cj4gICAKPiAgIAlLVU5JVF9FWFBFQ1RfRVEodGVzdCwgc2NhbGluZ19mYWN0b3Is
IHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IpOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMg
dm9pZCBkcm1fdGVzdF9yZWN0X2NhbGNfdnNjYWxlKHN0cnVjdCBrdW5pdCAqdGVzdCkKPiAgIHsK
PiArCURFRklORV9TVVBQUkVTU0VEX1dBUk5JTkcoZHJtX2NhbGNfc2NhbGUpOwo+ICAgCWNvbnN0
IHN0cnVjdCBkcm1fcmVjdF9zY2FsZV9jYXNlICpwYXJhbXMgPSB0ZXN0LT5wYXJhbV92YWx1ZTsK
PiAgIAlpbnQgc2NhbGluZ19mYWN0b3I7Cj4gICAKPiArCVNUQVJUX1NVUFBSRVNTRURfV0FSTklO
Ryhkcm1fY2FsY19zY2FsZSk7Cj4gICAJc2NhbGluZ19mYWN0b3IgPSBkcm1fcmVjdF9jYWxjX3Zz
Y2FsZSgmcGFyYW1zLT5zcmMsICZwYXJhbXMtPmRzdCwKPiAgIAkJCQkJICAgICAgcGFyYW1zLT5t
aW5fcmFuZ2UsIHBhcmFtcy0+bWF4X3JhbmdlKTsKPiArCUVORF9TVVBQUkVTU0VEX1dBUk5JTkco
ZHJtX2NhbGNfc2NhbGUpOwo+ICAgCj4gICAJS1VOSVRfRVhQRUNUX0VRKHRlc3QsIHNjYWxpbmdf
ZmFjdG9yLCBwYXJhbXMtPmV4cGVjdGVkX3NjYWxpbmdfZmFjdG9yKTsKPiAgIH0KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
