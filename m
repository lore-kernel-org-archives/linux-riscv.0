Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C2FC61DD9
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGRRGHypuxuB8ZMDtUPQTLfUqTi+f8exTVkGi81Bq2Y=; b=aQ8vnavx/kzQse
	dcUU2Eg4hcj/MsoV1lWjVfjduXg+mBd5LQLVaSXNBO/s9B+rMwBeFfqu85Gqogkzh5doRImD6jwv3
	sXwUayDz5RdEGrI9PmRTF0EdE12daADhDNPpwSHWL/12zUcJzR9zYcB7e8Jp1BvB/+H0lT3nIBNfe
	KoFr5U+4MEozJjpTXk69mR3G1TtP2qq5ikScLPswPj2BdQcxTjnPOntOevpjYseQOadFA37+zCxBR
	Ud8CEfvGe2wm0v05DLm8576jZO3/RlX9LrA4c10BhHqfq4zVWzCyJ4AB38pUyBofpy3R22I6Xl3c0
	2oJNOX97yrp5Gm4wPSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0MNv-000000079PD-2kUe;
	Sat, 29 Aug 2026 16:58:27 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0MNs-000000079Or-2MMR
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 16:58:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788022695; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YiT8gFXmzMQVyeqLt7nxxYDPkQJ64bcEgyY0TRj23f9Esi7u87jT8zG8Hdugp5McILbrPK4CNdNGmHQ3GXUqepLBKB1BhgvwGS2PgBC7ftfFrAhqSzDbAjLhKGFpXi+8JWavzRP5OsHX10eOMSqpq9WBdU4pa+n7HaQwtoD8Dcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788022695; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CjVd702NccuiO5wKzGeLMyGwfIQYzeuw9yTi4k9/VvM=; 
	b=ns1L7ps/IYTnH5iMfquqDOsBemIunAtW3BUMnqf6cGK+xbOCAzcVwvWU2j3SJN1xoql1Fh7wxcmiBw2M9xQucMif582iuBoqtqoCinwM6N47d0RGUYh2ZaJ35Vvu3+fRR41bEXtAwi/9QhBEJ8KIjtAS5pzsRhh+mUrn4g5vrSo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788022695;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=CjVd702NccuiO5wKzGeLMyGwfIQYzeuw9yTi4k9/VvM=;
	b=g3C7l7k2e/YLmRR5ZRiZ+WxQxoW4rFYHshU0yy73teYPQ/hpE48c4l2UfZYv3WB9
	9asgTSASX0FLRH+BQvcIMU47Fqwae5Y30XnZrNFbtvY2u8deoa1FejpBjt/NfpnvPO2
	kzC3OXlQuIdWai8TzZbYUpJ+IBcvFoJ/NwN4RJKM=
Received: by mx.zohomail.com with SMTPS id 1788022690786194.0425938326705;
	Sat, 29 Aug 2026 09:58:10 -0700 (PDT)
Date: Sat, 29 Aug 2026 16:57:49 +0000
From: Yao Zi <me@ziyao.cc>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Message-ID: <apMPjRICH06wAxPp@pie>
References: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/288.2.98
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_095824_680918_961F89EE 
X-CRM114-Status: GOOD (  13.58  )
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

T24gU2F0LCBBdWcgMjksIDIwMjYgYXQgMTI6MTU6MTBQTSArMDgwMCwgWXVrYWkgV3Ugd3JvdGU6
Cj4gVXBkYXRlIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi92bS1sYXlvdXQucnN0IHRyYW5zbGF0
aW9uLgo+IAo+IFVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21taXQgOTU0MjYwZmY1
YTQ2Cj4gKCJSZXZlcnQgIlJJU0MtVjogbW06IERvY3VtZW50IG1tYXAgY2hhbmdlcyIiKQo+IAo+
IFNpZ25lZC1vZmYtYnk6IFl1a2FpIFd1IDx4aWFveWV3dXouUnVzdGVyQGdtYWlsLmNvbT4KPiAt
LS0KPiAgLi4uL3poX0NOL2FyY2gvcmlzY3Yvdm0tbGF5b3V0LnJzdCAgICAgICAgICAgICB8IDE4
ICsrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9hcmNoL3Jpc2N2L3ZtLWxheW91dC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9hcmNoL3Jpc2N2L3ZtLWxheW91dC5yc3QKPiBpbmRleCA0YjlmNGRjZjZjMTku
LjBkMGVjOGVhNWQwNSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9hcmNoL3Jpc2N2L3ZtLWxheW91dC5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9hcmNoL3Jpc2N2L3ZtLWxheW91dC5yc3QKPiBAQCAtMTUsNyArMTUsNyBA
QCBSSVNDLVYgTGludXjkuIrnmoTomZrmi5/lhoXlrZjluIPlsYAKPiAgOuS9nOiAhTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgo+ICA65pel5pyfOiAxMiBGZWJydWFyeSAyMDIxCj4g
IAo+IC3ov5nku73mlofku7bmj4/ov7DkuoZSSVNDLVYgTGludXjlhoXmoLjkvb/nlKjnmoTomZrm
i5/lhoXlrZjluIPlsYDjgIIKPiAr6L+Z5Lu95paH5Lu25o+P6L+w5LqGIFJJU0MtViBMaW51eCDl
hoXmoLjkvb/nlKjnmoTomZrmi5/lhoXlrZjluIPlsYDjgIIKPiAgCj4gIDMy5L2NIFJJU0MtViBM
aW51eCDlhoXmoLgKPiAgPT09PT09PT09PT09PT09PT09PT09PQo+IEBAIC0yOCw5ICsyOCw5IEBA
IFRPRE8KPiAgNjTkvY0gUklTQy1WIExpbnV4IOWGheaguAo+ICA9PT09PT09PT09PT09PT09PT09
PT09Cj4gIAo+IC1SSVNDLVbnibnmnYPmnrbmnoTmlofmoaPmjIflh7rvvIw2NOS9jeWcsOWdgCAi
5b+F6aG75L2/56ysNjMtNDjkvY3lgLzpg73nrYnkuo7nrKw0N+S9je+8jOWQpuWImeWwhuWPkeeU
n+e8uumhteW8guW4uOOAgiLvvJrov5nlsIbomZoKPiAt5ouf5Zyw5Z2A56m66Ze05YiG5oiQ5Lik
5Y2K77yM5Lit6Ze05pyJ5LiA5Liq6Z2e5bi45aSn55qE5rSe77yM5LiL5Y2K6YOo5YiG5piv55So
5oi356m66Ze05omA5Zyo55qE5Zyw5pa577yM5LiK5Y2K6YOo5YiG5pivUklTQy1WIExpbnV4Cj4g
LeWGheaguOaJgOWcqOeahOWcsOaWueOAggo+ICtSSVNDLVYg54m55p2D5p625p6E5paH5qGj5oyH
5Ye677yMNjQg5L2N5Zyw5Z2A4oCc5b+F6aG75L2/56ysIDYzLTQ4IOS9jeWAvOmDveetieS6jues
rCA0NyDkvY3vvIzlkKbliJnlsIblj5HnlJ/nvLrpobXlvILluLjjgILigJ3vvJoKPiAr6L+Z5bCG
6Jma5ouf5Zyw5Z2A56m66Ze05YiG5oiQ5Lik5Y2K77yM5Lit6Ze05pyJ5LiA5Liq6Z2e5bi45aSn
55qE5rSe77yM5LiL5Y2K6YOo5YiG5piv55So5oi356m66Ze05omA5Zyo55qE5Zyw5pa577yM5LiK
5Y2K6YOo5YiG5pivIFJJU0MtVgo+ICtMaW51eCDlhoXmoLjmiYDlnKjnmoTlnLDmlrnjgIIKCkkg
dGhpbmsgY2hhbmdlcyBhYm92ZSBhcmUgcHVyZWx5IHN0eWxlIGltcHJvdmVtZW50cz8gSWYgc28g
cGxlYXNlCm1lbnRpb24gaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBpbnN0ZWFkIG9mIHNwZWNp
ZnlpbmcgaXQncyAidXBkYXRpbmciCm9ubHkuIFNlcGFyYXRlIHRoZSBjaGFuZ2VzIGludG8gYW5v
dGhlciBjb21taXQgbWlnaHQgaGVscCwgYnV0IEknbSBub3QKc3VyZSB3aGV0aGVyIGl0J3Mgd29y
dGggdGhlIGVmZm9ydC4KClJlZ2FyZHMsCllhbyBaaQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
