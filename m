Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D407FC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 07:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsGkNYSp97THx63dVPcJ2HdVLWya0lj860n5qASZtZU=; b=YiEM8VUk9vJoSC
	1Vcxt8VOES/dGR46Q17o7VLpwT9MpiEdzS7eEP1MN8cBX4TJ+DMphmIfwxTuK6+IPclBl3stBoAIs
	ic7KJ5BaQqxRVwD0/MKhM544uh/UVjzXUpbOg1sqpzfKJYWI+pB/aSsqQWrMmZWg/PnUq5s+JkiVL
	XYoQIRKPPg53tQ2QFdG9KXzHokaho8wTe8MCv9jNJ3id1/2iz4SsPNsroNhn5iHgWY9rLhfrYCGzx
	c0gix8PN49doW6kdBtFBTlRZTqcs13ZdDcBi+bXZnAM7JCVbRveX7BGhr6YDbawAXYmEOpUV0FnEu
	DaPSlfx8G1O+Y7MLancg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyp7C-004eTY-36;
	Tue, 16 May 2023 07:28:58 +0000
Received: from forward500b.mail.yandex.net ([178.154.239.144])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyp7A-004eSb-0A
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 07:28:58 +0000
Received: from mail-nwsmtp-smtp-production-main-78.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:1105:0:640:2966:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTP id DF8B85EF91;
	Tue, 16 May 2023 10:28:51 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id nSV3CSKWqCg0-DhUBSVE8;
	Tue, 16 May 2023 10:28:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1684222131;
	bh=mzpiRSZ/fD821DfRNirdZySh3p7mxT8AYjDytGYaqGs=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=Gn+W4NLL18CiY1O70uUUIl8L0XBIDM3PXSV/jR77TnX/mZcJp7rEUCKZCm4L0d0Cy
	 6jZHupbS8YV2h/UF3LxpN7rjx4gLLHB7RCazGUDQlxnf9W/ocGxLyYvn+sw3pQ82Xo
	 2cVCrOLszjDUIRUHTD0Lw/0hT+eBSnwk171e6IuI=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.myt.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <680f2d5d146a38083a28198f1a8a3694654bf8f8.camel@maquefel.me>
Subject: Re: [PATCH 1/2] perf tools riscv: Allow get_cpuid return empty
 MARCH and MIMP
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Inochi Amaoto <inochiama@outlook.com>, Peter Zijlstra
 <peterz@infradead.org>,  Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho
 de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,  Jiri Olsa
 <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers
 <irogers@google.com>,  Adrian Hunter <adrian.hunter@intel.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Nikita Shubin <n.shubin@yadro.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Tue, 16 May 2023 13:28:50 +0300
In-Reply-To: <IA1PR20MB4953E8FFED81D5733DDFDA2DBB799@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20230516023714.306240-1-inochiama@outlook.com>
	 <IA1PR20MB4953E8FFED81D5733DDFDA2DBB799@IA1PR20MB4953.namprd20.prod.outlook.com>
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_002856_265115_0F3CABC6 
X-CRM114-Status: GOOD (  15.83  )
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

SGVsbG8gSW5vY2hpIEFtYW90byEKCk9uIFR1ZSwgMjAyMy0wNS0xNiBhdCAxMDozNyArMDgwMCwg
SW5vY2hpIEFtYW90byB3cm90ZToKPiBUaGUgVC1IRUFEIEM5eHggc2VyaWVzIENQVSBvbmx5IGhh
cyBNVkVORE9SIGRlZmluZWQsIGFuZCBsZWZ0IE1BUkNICj4gYW5kIE1JTVAgdW5pbXBsZW1lbnRl
ZC4KCkFjY29yZGluZyB0byB0aGUgZG9jcyB5b3UgY2FuIHN0aWxsIHJlYWQgdGhlbSwgYnV0IGl0
J3MgaGFyZHdpcmVkIHRvCjY0aDAuCgpIb3cgaXQncyBzdXBwb3NlZCB0byBkaXN0aW5ndWlzaCBj
OTA2IGFuZCBjOTEwIGZvciBleGFtcGxlID8KCj4gCj4gVG8gbWFrZSBwZXJmIHN1cHBvcnQgVC1I
RUFEIEM5eHggZXZlbnRzLiByZW1vdmUgdGhlIHJlc3RyaWN0aW9uIG9mCj4gdGhlIE1BUkNIIGFu
ZCBNSU1QLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBvdXRs
b29rLmNvbT4KPiAtLS0KPiDCoHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2hlYWRlci5jIHwg
NyArLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2hlYWRlci5j
Cj4gYi90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9oZWFkZXIuYwo+IGluZGV4IDRhNDE4NTY5
MzhhOC4uMDMxODk5YzYyN2Y2IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91
dGlsL2hlYWRlci5jCj4gKysrIGIvdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmMK
PiBAQCAtNTUsMTggKzU1LDEzIEBAIHN0YXRpYyBjaGFyICpfZ2V0X2NwdWlkKHZvaWQpCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGdvdG8gZnJlZTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSBp
ZiAoIXN0cm5jbXAobGluZSwgQ1BVSU5GT19NQVJDSCwKPiBzdHJsZW4oQ1BVSU5GT19NQVJDSCkp
KSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWFy
Y2hpZCA9IF9nZXRfZmllbGQobGluZSk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZiAoIW1hcmNoaWQpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBmcmVlOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIGlmICghc3RybmNtcChsaW5lLCBDUFVJ
TkZPX01JTVAsCj4gc3RybGVuKENQVUlORk9fTUlNUCkpKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWltcGlkID0gX2dldF9maWVsZChsaW5lKTsK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghbWlt
cGlkKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGdvdG8gZnJlZTsKPiAtCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoH0KCldoYXQgZG9lcyAvcHJvYy9jcHVpbmZvIHNob3dz
IG9uIGM5eHggPyBXaHkgY2FuJ3Qgd2UgdXNlIHplcm9lcyA/Cgo+IMKgCj4gLcKgwqDCoMKgwqDC
oMKgaWYgKCFtdmVuZG9yaWQgfHwgIW1hcmNoaWQgfHwgIW1pbXBpZCkKPiArwqDCoMKgwqDCoMKg
wqBpZiAoIW12ZW5kb3JpZCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8g
ZnJlZTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoYXNwcmludGYoJmNwdWlkLCAiJXMtJXMt
JXMiLCBtdmVuZG9yaWQsIG1hcmNoaWQsIG1pbXBpZCkKPiA8IDApCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
