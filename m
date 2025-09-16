Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43804CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 10:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Mime-Version:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=YLH6jcYrTOtLxGDz56L3hDJ9SZ1s/Bs5+gD77ajb6U8=; b=QvlHh3ElBMwVXY
	ROkNFpz9hmO65bGqWcu2YewajxpdJDKxOrYCxWDlfge9zN211DZciJUd8hJyX9zxVf8vXVlPbmm/U
	bWMqZ9oogAj37m+iuwcPy0gO7uuRc2wTNlK+0dWPM925PCHDJTkCCWfCF8fch5y7XtUDG+Bo6kJEJ
	FxpBy16yf9d3VRLQh051jvLcAB/3En6JCbPtaxSs4ph6NX8YGOQ6swfbwcITO/YSKd+chU7xlP0jN
	5IfEbTzwwndv8lA2Ui9dc24s2pa06CMqgnCbq6lgV3Um9Cx14gp2dW+eCYp1WNwf9FCp12fOdW0ya
	d7WraP8IXoxWCFRiLPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySuO-00000007Whp-1Qhb;
	Tue, 16 Sep 2025 10:27:36 +0000
Received: from out28-76.mail.aliyun.com ([115.124.28.76])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySuL-00000007Wfr-1XAD
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 10:27:35 +0000
Received: from LAPTOP-2KT3QRS7(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.egM8Sps_1758018443 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 16 Sep 2025 18:27:24 +0800
Date: Tue, 16 Sep 2025 18:27:23 +0800
From: "guoyaxing@bosc.ac.cn" <guoyaxing@bosc.ac.cn>
To: will <will@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	iommu <iommu@lists.linux.dev>, 
	tjeznach <tjeznach@rivosinc.com>, 
	joro <joro@8bytes.org>, 
	robin.murphy <robin.murphy@arm.com>, 
	paul.walmsley <paul.walmsley@sifive.com>, 
	palmer <palmer@dabbelt.com>, 
	aou <aou@eecs.berkeley.edu>, 
	alex <alex@ghiti.fr>, 
	anxu <anxu@bosc.ac.cn>, 
	wangran <wangran@bosc.ac.cn>
Subject: Re: Re: [PATCH v1 1/3] iommu/riscv: Add iommu perf driver
References: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>, 
	<aMfsj1U7NY2m68T4@willie-the-truck>
X-Priority: 3
X-GUID: 23D66E4B-AE8C-482B-9FA9-143F3F246F53
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.306[cn]
Mime-Version: 1.0
Message-ID: <202509161827232434929@bosc.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_032733_557337_6CF13C38 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

SGksIFdpbGwKCgpGcm9tOsKgV2lsbCBEZWFjb24KCgoKRGF0ZTrCoDIwMjUtMDktMTXCoDE4OjM4
CgoKClRvOsKgWWF4aW5nIEd1bwoKCgpDQzrCoGxpbnV4LXJpc2N2OyBpb21tdTsgdGplem5hY2g7
IGpvcm87IHJvYmluLm11cnBoeTsgcGF1bC53YWxtc2xleTsgcGFsbWVyOyBhb3U7IGFsZXg7IGFu
eHU7IHdhbmdyYW4KCgoKU3ViamVjdDrCoFJlOiBbUEFUQ0ggdjEgMS8zXSBpb21tdS9yaXNjdjog
QWRkIGlvbW11IHBlcmYgZHJpdmVyCgoKCk9uIE1vbiwgU2VwIDE1LCAyMDI1IGF0IDEwOjA5OjA5
QU0gKzA4MDAsIFlheGluZyBHdW8gd3JvdGU6CgoKCj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBh
IHBlcmZvcm1hbmNlIG1vbml0b3IgZHJpdmVyIGZvciBSSVNDLVYgSU9NTVUKCgoKPj4gaW9ocG0g
aW1wbGVtZW50aW9ucyB0aGF0IHN1cHBvcnQgaGFyZHdhcmUgcGVyZm9ybWFuY2UgY291bnRlcnMu
CgoKCj4+IFRoZSBkcml2ZXIgZXhwb3NlIFJJU0MtVi1JT01NVS1zcGVjaWZpYyBwZXJmb3JtYW5j
ZSBldmVudHMgKGVnLiBjeWNsZXMsCgoKCj4+IHRsYiBtaXNzIC4uLil0aHJvdWdoIHRoZSBMaW51
eCBwZXJmIHN1YnN5c3RlbSwgZW5hYmxpbmcgZGV2ZWxvcGVycwoKCgo+PiB0byBwcm9maWxlIGFu
ZCBvcHRpbWl6ZSBJL08gdHJhbnNsYXRpb24gcGVyZm9ybWFuY2UuCgoKCj4+CgoKCj4+IEtleSBm
ZWF0dXJlczoKCgoKPj4gLSBJbXBsZW1lbnRzIGEgcGVyZiBQTVUgZHJpdmVyIGZvciBSSVNDLVYg
SU9NTVUuCgoKCj4+CgoKCj4+IC0gRXhwb3NlcyBJT01NVSBwZXJmIGV2ZW50cywgc3VjaCBhcyAn
Y3ljbGVzJywgJ3RsYl9taXNzJy4uLiB2aWEKCgoKPj7CoMKgIC9zeXMvZGV2aWNlcy9yaXNjdi1p
b21tdS1wbXUvZXZlbnRzLywgYWxsb3dpbmcgdXNlIHdpdGggcGVyZgoKCgo+PsKgwqAgdG9vbHM6
CgoKCj4+wqDCoMKgwqAgcGVyZiBzdGF0IC1DIDAgLWUgcmlzY3YtaW9tbXUtcG11L2N5Y2xlcy8g
Li4uCgoKCj4+wqDCoMKgwqAgcGVyZiBzdGF0IC1DIDAgLWUgcmlzY3YtaW9tbXUtcG11L3RsYl9t
aXNzLyAuLi4KCgoKPj7CoMKgwqDCoCAuLi4KCgoKPj4gLSBTdXBwb3J0cyBldmVudCBmaWx0ZXJp
bmcgdGhyb3VnaCBjb25maWd1cmVhYmxlIGF0dHJpYnV0ZXMgZXhwb3NlZAoKCgo+PsKgwqAgaW4g
L3N5cy9kZXZpY2VzL3Jpc2N2LWlvbW11LXBtdS9mb3JtYXQvLCBpbmNsdWRpbmc6CgoKCj4+wqDC
oCBkdl9nc2N2LCBwdl9wc2N277yMZGlkX2dzY2lk77yMcGlkX3BzY2lk77yMaWR0IChyaXNjdiBp
b21tdSBzcGVjIDUtMjMpLgoKCgo+PgoKCgo+PiAtIEltcGxlbWVudHMgb3ZlcmZsb3cgaW50ZXJy
dXB0IGhhbmRsaW5nLgoKCgo+PgoKCgo+PiAtIEFkZHMgZGV2aWNlIHRyZWUgYmluZGluZyBzdXBw
b3J0IHZpYSBvcHRpb25hbCAncG11LW5hbWUnIHByb3BlcnR5CgoKCj4+wqDCoCBhbGxvd2luZyBw
bGF0Zm9ybS1zcGVjaWZpYyBJT01NVSBpbXBsZW1lbnRhdGlvbnMgdG8gc3BlY2lmeSBhIGN1c3Rv
bQoKCgo+PsKgwqAgZGVmaW5lZCBldmVudCBJRCBsaXN0LiBJZiBub3QgcHJvdmlkZWQsIHRoZSBk
cml2ZXIgZGVmYXVsdHMgdG8gb25seQoKCgo+PsKgwqAgc3VwcG9ydGluZyAnY3ljbGVzJy4gV2hl
biBzZXQgdG8gJ2R1bW15JywgaXQgZW5hYmxlcyBhbGwgOSBzdGFuZGFyZAoKCgo+PsKgwqAgZXZl
bnQgSURzIGFzIGRlZmluZWQgaW4gcmlzY3YgaW9tbXUgc3BlYyg1LTIzKS4KCgoKPj4KCgoKPj4g
U2lnbmVkLW9mZi1ieTogWWF4aW5nIEd1byA8Z3VveWF4aW5nQGJvc2MuYWMuY24+CgoKCj4+IC0t
LQoKCgo+PsKgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGVyZi5jIHwgNTM1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKCgoKPj7CoCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LXBlcmYuaCB8wqAgODggKysrKysKCgoKPj7CoCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmjC
oMKgwqDCoMKgIHzCoMKgIDggKwoKCgo+PsKgIDMgZmlsZXMgY2hhbmdlZCwgNjMxIGluc2VydGlv
bnMoKykKCgoKPj7CoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9yaXNjdi9pb21t
dS1wZXJmLmMKCgoKPj7CoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS1wZXJmLmgKCgoKwqAKCgoKPiBQTVUgZHJpdmVycyBhcmUgYmV0dGVyIHBsYWNlZCB1bmRl
ciBkcml2ZXJzL3BlcmYvCgoKCsKgCgoKCj4gKHRoZSBBcm0gU01NVXYzIFBNVSBkcml2ZXIgbGl2
ZXMgdGhlcmUsIGZvciBleGFtcGxlKS4KCgoKSSBkaWQgYSBxdWljayByZWFkaW5nIG9mIFNNTVUg
cG11IGRyaXZlciBpbiBkcml2ZXJzL3BlcmYvLiAgSG93ZXZlciwgSWYgdGhlIFJJU0MtViBJT01N
VSBQTVUgZHJpdmVyIGlzIHBsYWNlZCB1bmRlciBkcml2ZXJzL3BlcmYvIGFzIHRoZSBTTU1VIGRp
ZCwgaXQgd291bGQgY2F1c2UgYW4gb3ZlcmxhcCBpbiB0aGUgaW9tZW0gcmVzb3VyY2UgcmVnaW9u
IGJldHdlZW4gdGhlIHR3byBkZXZpY2VzKGlvbW11ICYgaW9tbXUgcG11KSwgYmVjYXVzZSBpdCBu
ZWVkcyB0byBzaGFyZSBpbnRlcnJ1cHQtcmVsYXRlZCByZWdpc3RlcnMgKHN1Y2ggYXMgdGhlIElQ
U1IgcmVnaXN0ZXIpIHdpdGggdGhlIG1haW4gSU9NTVUgZHJpdmVyLgoKWWF4aW5nIEd1bwoKCj4g
V2lsbAogCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
