Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CC9CD342C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 09:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znxfcb1GpJZBylKTa+BGAUdDddXUd3NYEJ7iHJ0CaXU=; b=Lb758rn5u9mN3P
	MJZo+Te2vuXG3ARNLZosF9yoQkKB5778GAlIJlW5jMHqluTfdAYPPN7q1Z2tvO19qLOyEx4w8H+rf
	0Oj3+51wYuEm0xHRZAs4UaS+Adsp6cGmg2E+t0s3Z1pOuZX8QOjD5rA7LAGb3DtHI2ZLcB2CGz7Ls
	Zanl1enalsFlSi73DBzXisAr2ePNQHyCOpVCCBeUfY9d+Fue9rD4gLWEW3YWz/Iyzw92h8OvIYWJ2
	+gqdgN+4z2SbGOXk7L4Qa55a/2y7Jphru0sFs2VTN8+2QUoRecoobg5Rn6PDre4PJWAAYTxfWnjmK
	KuaieptLhn/W9KneGUZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYtN-00000000P1C-2T6W;
	Wed, 06 May 2026 09:50:09 +0000
Received: from sphereful.davidgow.net ([2404:9400:4:0:216:3eff:fee2:5328])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYtM-00000000P0F-16fi
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 09:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1778060586;
	bh=ETJfHEFrnP7uwEuXnhfD4Juu41Z9IVYsTPtyUojN4Ls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gg2zOvzZ9CmK2QI6mhbsMpHzPjan/u6U9KLJUInmQCCJgVAuAGaMDYo2XzSzbnc6b
	 Zf6RzuOkoTgwq7jUTx/dCcTMHoq4t3FMX8ZdeJyiJ4EkmMhkaWJuX8kybh56/jPe7n
	 0o0UpIndFwWU+6yL9pXHcHppZUF1R9Rne/S4KHZZFJhvU1psiBdmjAGeyzfsDJufcT
	 pJT2wvvWl0aGkZ+4uz86H0x9bidRGIbBStV0MuAOSSQrRBU5mtRbSUGMiqxLoHZxXp
	 QBvxUe9Mxkc+1krDKg764K2RvHzoF2piUxKnMe5ri1zlPZbSYYQPzDCTTwnDXDXYu5
	 XI/eli4swkpkx7Z2eQpLUHniTLeUL7Bk0TQywbwdCiTyJycIFTS/Df6NT9mO6BkAH/
	 M6GDFPuGDBdlajJB5IPlpbuuxS/QCQV/vJK3OBWFNIhmsjm5mYCxqPclWTQXSNMV8e
	 cD9N3EErp2jC4IciIbm/M1VmkEu+r2HnQXLZlJOZuM+khoPz7qAlQuZtgkqoH/t6Nd
	 I6di/2SMsBHEgtky6X32iollkzSpf8Uviy3Tpec1WoyNkMyZbCbpvK0aHxVf7HrDpN
	 drflV4QJAd9lNVR2XgzniXq0Wp+gJ4FfFwDpDPogQQ3Nag4Cx6MEkwVxNgCleoTaxP
	 XZsn6aexfa1hKQEdUVX3nSic=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id B3F8B1E935F; Wed,  6 May 2026 17:43:06 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1778060332;
	bh=ETJfHEFrnP7uwEuXnhfD4Juu41Z9IVYsTPtyUojN4Ls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kpsixPmylB0V+dRd32N8gl5QYouI/mT0Gr4xvKSSZKRcR9jfgZqq/ItCBGAzdhpUy
	 97MynWIjsQAKdu6u93rZGz3wSEpT74sORdYEWxwAISJzKp/jsYQy4r+zcD/XN4x8or
	 IQg3smj8AnZUFrQgTGNDZ0yZpmz/JOVw2FjxmwENeAijqYMqDTMVT76VtU1NDmbB06
	 6Z4bvSCn9NXN88opGdeyVxAd8mIU2fHaUHZKLkCcJDG45p14lobHJmYYunHm4GL3XX
	 otLPaJbmNdYoLi87IMFMMYnteJ0uh2b3+Pizz9ZEKD1ok0GUGeheVIoDuwYPGPUpY8
	 f3TlhhQS/sYpNS4uPGaD76jbApZJZC9rw9HEUHo8Nw/B5IlyrecB3CIZnQ2Aba/qtb
	 2Y9KaCieioXCSHIsNY5DzmwaBVZhGizJJSN2TlKSIiTLJ9zLIpaGrOi9vt9lXLFZK3
	 wDUhoiZjH2HEtVsUzrrTsSnmZOqZleaGOzmlVtNA2qXSWL89TBQ0m/po1SUZoGagyp
	 pp+PPO76CEBmjXMFWTzNQOydgMBwcFvMeCAxdhfrk8eSou5jjkybFGOsTuhbDwdEdZ
	 vFW5+Dcz3duTxlS3xTrBeVD4mY9ZZRKFYWTsgbc4COYx8uV5Ue3CUhy0FiEd0++qkS
	 6/4suRNaadZ2GBZ+65hdkh/I=
Received: from [IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d] (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id BB24F1E934E;
	Wed,  6 May 2026 17:38:52 +0800 (AWST)
Message-ID: <428e61d7-bd94-4264-bf7b-950f1dea2da0@davidgow.net>
Date: Wed, 6 May 2026 17:38:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] kunit: Add documentation for warning backtrace
 suppression API
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
 Dan Carpenter <dan.carpenter@linaro.org>,
 Alessandro Carminati <acarmina@redhat.com>, Kees Cook <kees@kernel.org>
References: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
 <20260504-kunit_add_support-v8-4-3e5957cdd235@redhat.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260504-kunit_add_support-v8-4-3e5957cdd235@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_025008_494071_084688C6 
X-CRM114-Status: GOOD (  23.71  )
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
bTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+IAo+IERvY3VtZW50IEFQSSBm
dW5jdGlvbnMgZm9yIHN1cHByZXNzaW5nIHdhcm5pbmcgYmFja3RyYWNlcy4KPiAKPiBUZXN0ZWQt
Ynk6IExpbnV4IEtlcm5lbCBGdW5jdGlvbmFsIFRlc3RpbmcgPGxrZnRAbGluYXJvLm9yZz4KPiBB
Y2tlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgo+IFJldmll
d2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBTaWduZWQtb2ZmLWJ5
OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4gUmV2aWV3ZWQtYnk6IERhdmlk
IEdvdyA8ZGF2aWRnb3dAZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbGVzc2FuZHJvIENh
cm1pbmF0aSA8YWNhcm1pbmFAcmVkaGF0LmNvbT4KPiBSZXZpZXdlZC1ieTogRGF2aWQgR293IDxk
YXZpZEBkYXZpZGdvdy5uZXQ+Cj4gU2lnbmVkLW9mZi1ieTogQWxiZXJ0IEVzdGV2ZSA8YWVzdGV2
ZUByZWRoYXQuY29tPgo+IC0tLQoKVGhpcyBpcyBncmVhdCwgdGhhbmtzIQoKUmV2aWV3ZWQtYnk6
IERhdmlkIEdvdyA8ZGF2aWRAZGF2aWRnb3cubmV0PgoKQ2hlZXJzLAotLSBEYXZpZAoKPiAgIERv
Y3VtZW50YXRpb24vZGV2LXRvb2xzL2t1bml0L3VzYWdlLnJzdCB8IDYzICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMv
a3VuaXQvdXNhZ2UucnN0IGIvRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva3VuaXQvdXNhZ2UucnN0
Cj4gaW5kZXggZWJkMDZmNWVhNDU1MC4uMjU3MjRmN2U3Mjk2OSAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2Rldi10b29scy9rdW5pdC91c2FnZS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2Rldi10b29scy9rdW5pdC91c2FnZS5yc3QKPiBAQCAtMTU3LDYgKzE1Nyw2NyBAQCBBbHRlcm5h
dGl2ZWx5LCBvbmUgY2FuIHRha2UgZnVsbCBjb250cm9sIG92ZXIgdGhlIGVycm9yIG1lc3NhZ2Ug
YnkgdXNpbmcKPiAgIAlpZiAoc29tZV9zZXR1cF9mdW5jdGlvbigpKQo+ICAgCQlLVU5JVF9GQUlM
KHRlc3QsICJGYWlsZWQgdG8gc2V0dXAgdGhpbmcgZm9yIHRlc3RpbmciKTsKPiAgIAo+ICtTdXBw
cmVzc2luZyB3YXJuaW5nIGJhY2t0cmFjZXMKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gKwo+ICtTb21lIHVuaXQgdGVzdHMgdHJpZ2dlciB3YXJuaW5nIGJhY2t0cmFjZXMgZWl0
aGVyIGludGVudGlvbmFsbHkgb3IgYXMgYSBzaWRlCj4gK2VmZmVjdC4gU3VjaCBiYWNrdHJhY2Vz
IGFyZSBub3JtYWxseSB1bmRlc2lyYWJsZSBzaW5jZSB0aGV5IGRpc3RyYWN0IGZyb20KPiArdGhl
IGFjdHVhbCB0ZXN0IGFuZCBtYXkgcmVzdWx0IGluIHRoZSBpbXByZXNzaW9uIHRoYXQgdGhlcmUg
aXMgYSBwcm9ibGVtLgo+ICsKPiArQmFja3RyYWNlcyBjYW4gYmUgc3VwcHJlc3NlZCB3aXRoICoq
dGFzay1zY29wZWQgc3VwcHJlc3Npb24qKjogd2hpbGUKPiArc3VwcHJlc3Npb24gaXMgYWN0aXZl
IG9uIHRoZSBjdXJyZW50IHRhc2ssIHRoZSBiYWNrdHJhY2UgYW5kIHN0YWNrIGR1bXAgZnJvbQo+
ICtgYFdBUk4qKClgYCwgYGBXQVJOX09OKigpYGAsIGFuZCByZWxhdGVkIG1hY3JvcyBvbiB0aGF0
IHRhc2sgYXJlIHN1cHByZXNzZWQuCj4gK1RocmVlIEFQSSBmb3JtcyBhcmUgYXZhaWxhYmxlLCBp
biBvcmRlciBvZiBjb252ZW5pZW5jZS4KPiArCj4gKy0gU2NvcGVkIHN1cHByZXNzaW9uIGlzIHRo
ZSBzaW1wbGVzdCBmb3JtLiBXcmFwIHRoZSBjb2RlIHRoYXQgdHJpZ2dlcnMKPiArICB3YXJuaW5n
cyBpbiBhIGBga3VuaXRfd2FybmluZ19zdXBwcmVzcygpYGAgYmxvY2s6Cj4gKwo+ICsuLiBjb2Rl
LWJsb2NrOjogYwo+ICsKPiArCXN0YXRpYyB2b2lkIHNvbWVfdGVzdChzdHJ1Y3Qga3VuaXQgKnRl
c3QpCj4gKwl7Cj4gKwkJa3VuaXRfd2FybmluZ19zdXBwcmVzcyh0ZXN0KSB7Cj4gKwkJCXRyaWdn
ZXJfYmFja3RyYWNlKCk7Cj4gKwkJCUtVTklUX0VYUEVDVF9TVVBQUkVTU0VEX1dBUk5JTkdfQ09V
TlQodGVzdCwgMSk7Cj4gKwkJfQo+ICsJfQo+ICsKPiArLi4gbm90ZTo6Cj4gKyAgIFRoZSB3YXJu
aW5nIGNvdW50IG11c3QgYmUgY2hlY2tlZCBpbnNpZGUgdGhlIGJsb2NrOyB0aGUgc3VwcHJlc3Np
b24gaGFuZGxlCj4gKyAgIGlzIG5vdCBhY2Nlc3NpYmxlIGFmdGVyIHRoZSBibG9jayBleGl0cy4K
PiArCj4gKy0gTWFudWFsIG1hY3JvcyBhcmUgdXNlZnVsIHdoZW4gdGhlIHN1cHByZXNzZWQgcmVn
aW9uIGlzIGxhcmdlIGVub3VnaCB0aGF0Cj4gKyAgZXh0cmEgaW5kZW50YXRpb24gaXMgdW5kZXNp
cmFibGUsIG9yIHdoZW4gdGhlIHdhcm5pbmcgY291bnQgbmVlZHMgdG8gYmUKPiArICBjaGVja2Vk
IGFmdGVyIHN1cHByZXNzaW9uIGVuZHMuIGBgS1VOSVRfU1RBUlRfU1VQUFJFU1NFRF9XQVJOSU5H
KClgYCBtdXN0Cj4gKyAgYXBwZWFyIGJlZm9yZSBgYEtVTklUX0VORF9TVVBQUkVTU0VEX1dBUk5J
TkcoKWBgIGluIHRoZSBzYW1lIHNjb3BlLgo+ICsgIExpbWl0ZWQgdG8gb25lIHBhaXIgcGVyIHNj
b3BlLgo+ICsKPiArLi4gY29kZS1ibG9jazo6IGMKPiArCj4gKwlzdGF0aWMgdm9pZCBzb21lX3Rl
c3Qoc3RydWN0IGt1bml0ICp0ZXN0KQo+ICsJewo+ICsJCUtVTklUX1NUQVJUX1NVUFBSRVNTRURf
V0FSTklORyh0ZXN0KTsKPiArCQl0cmlnZ2VyX2JhY2t0cmFjZSgpOwo+ICsJCUtVTklUX0VORF9T
VVBQUkVTU0VEX1dBUk5JTkcodGVzdCk7Cj4gKwo+ICsJCUtVTklUX0VYUEVDVF9TVVBQUkVTU0VE
X1dBUk5JTkdfQ09VTlQodGVzdCwgMSk7Cj4gKwl9Cj4gKwo+ICstIERpcmVjdCBmdW5jdGlvbnMg
cmV0dXJuIGFuIGV4cGxpY2l0IGhhbmRsZSBwb2ludGVyLiBVc2UgdGhlbSB3aGVuIHRoZSBoYW5k
bGUKPiArICBuZWVkcyB0byBiZSByZXRhaW5lZCBvciBwYXNzZWQgYWNyb3NzIGhlbHBlciBmdW5j
dGlvbnM6Cj4gKwo+ICsuLiBjb2RlLWJsb2NrOjogYwo+ICsKPiArCXN0YXRpYyB2b2lkIHNvbWVf
dGVzdChzdHJ1Y3Qga3VuaXQgKnRlc3QpCj4gKwl7Cj4gKwkJc3RydWN0IGt1bml0X3N1cHByZXNz
ZWRfd2FybmluZyAqdzsKPiArCj4gKwkJdyA9IGt1bml0X3N0YXJ0X3N1cHByZXNzX3dhcm5pbmco
dGVzdCk7Cj4gKwkJdHJpZ2dlcl9iYWNrdHJhY2UoKTsKPiArCQlrdW5pdF9lbmRfc3VwcHJlc3Nf
d2FybmluZyh0ZXN0LCB3KTsKPiArCj4gKwkJS1VOSVRfRVhQRUNUX0VRKHRlc3QsIGt1bml0X3N1
cHByZXNzZWRfd2FybmluZ19jb3VudCh3KSwgMSk7Cj4gKwl9Cj4gICAKPiAgIFRlc3QgU3VpdGVz
Cj4gICB+fn5+fn5+fn5+fgo+IEBAIC0xMjExLDQgKzEyNzIsNCBAQCBGb3IgZXhhbXBsZToKPiAg
IAkJZGV2X21hbmFnZWRfc3RyaW5nID0gZGV2bV9rc3RyZHVwKGZha2VfZGV2aWNlLCAiSGVsbG8s
IFdvcmxkISIpOwo+ICAgCj4gICAJCS8vIEV2ZXJ5dGhpbmcgaXMgY2xlYW5lZCB1cCBhdXRvbWF0
aWNhbGx5IHdoZW4gdGhlIHRlc3QgZW5kcy4KPiAtCX0KPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9m
IGZpbGUKPiArCX0KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
