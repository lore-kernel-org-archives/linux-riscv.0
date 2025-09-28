Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E944CAC5BC
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 02:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylr6jhg8ZMHXtunQEEd5FPn7LNlyBYReE8KulaEQzig=; b=q3/mF9NcoSabke
	0CZVs1qvHyrQO+7mjv8NQfJWODkhODHn4cWwhfss22p0DATs3ipZN6MMMD6XPbMYzSfTSI2xe4w9o
	g8xob29S6r7OQrK2ruOu0aSqzuvf2CL70e910WxISEUEv5jARXffyKQo3J2xlsRoPFvoATrjP6Lnw
	nG2j27CRm3x4MpqpXejKSFxgXlB+jcfDDijIMtnhWHfR/H8pvSlfAKdtUkfblqLpZZKw8gEYh9QJo
	YNeQi2PIskO46OWRWCh6gczIlZS4plefCHbjwC75cCCSRd5LHJLl3YBo5tqSU4fybmPhJf3FDmEZH
	h7OrG6HkMtBsDN95JqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2hY9-0000000DJek-1U2P;
	Sun, 28 Sep 2025 02:54:09 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2hY6-0000000DJeN-3gGQ
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 02:54:08 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 19F74340E37;
	Sun, 28 Sep 2025 02:54:04 +0000 (UTC)
Date: Sun, 28 Sep 2025 10:54:00 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250928025400-GYB1330052@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927105616-GYB1338789@gentoo.org>
 <F076AA5B04CF3445+aNiMlrTNTdI7H4PI@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F076AA5B04CF3445+aNiMlrTNTdI7H4PI@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_195406_942595_62866E57 
X-CRM114-Status: GOOD (  24.05  )
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

SGkgVHJveSwKCk9uIDA5OjE3IFN1biAyOCBTZXAgICAgICwgVHJveSBNaXRjaGVsbCB3cm90ZToK
PiBPbiBTYXQsIFNlcCAyNywgMjAyNSBhdCAwNjo1NjoxNlBNICswODAwLCBZaXh1biBMYW4gd3Jv
dGU6Cj4gPiBPbiAxMDowMiBUaHUgMjUgU2VwICAgICAsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4g
PiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBJMkMgUElPIGZ1bmN0aW9uYWxpdHkgZm9yIHRoZSBT
cGFjZW1pdCBLMSBTb0MsCj4gPiA+IGVuYWJsaW5nIHRoZSB1c2Ugb2YgSTJDIHdpdGggaW50ZXJy
dXB0cyBkaXNhYmxlZC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwg
PHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtazEuYyB8IDE2NCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0MCBpbnNlcnRpb25zKCsp
LCAyNCBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLWsxLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsxLmMKPiA+ID4gaW5kZXgg
NmI5MTg3NzBlNjEyZTA5OGI4YWQxNzQxOGY0MjBkODdjOTRkZjE2Ni4uZTQwM2ViN2Q2ZjMyOWY0
ZmU1YzUyNDJmOTRjYzIxMDk0ZGZmMTA1YyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1rMS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEuYwo+
ID4gPiBAQCAtOTcsNiArOTcsOSBAQAo+ID4gPiAgCj4gPiAuLgo+ID4gPiAgc3RhdGljIGludCBz
cGFjZW1pdF9pMmNfeGZlcl9tc2coc3RydWN0IHNwYWNlbWl0X2kyY19kZXYgKmkyYykKPiA+ID4g
IHsKPiA+ID4gIAl1bnNpZ25lZCBsb25nIHRpbWVfbGVmdDsKPiA+ID4gQEAgLTMxMCwxMCArMzY4
LDI4IEBAIHN0YXRpYyBpbnQgc3BhY2VtaXRfaTJjX3hmZXJfbXNnKHN0cnVjdCBzcGFjZW1pdF9p
MmNfZGV2ICppMmMpCj4gPiA+ICAKPiA+ID4gIAkJcmVpbml0X2NvbXBsZXRpb24oJmkyYy0+Y29t
cGxldGUpOwo+ID4gPiAgCj4gPiA+IC0JCXNwYWNlbWl0X2kyY19zdGFydChpMmMpOwo+ID4gPiAr
CQlpZiAoaTJjLT5pc19waW8pIHsKPiA+ID4gKwkJCS8qIFdlIGRpc2FibGUgdGhlIGludGVycnVw
dCB0byBhdm9pZCB1bmludGVuZGVkIHNwdXJpb3VzIHRyaWdnZXJzLiAqLwo+ID4gdGhlIGNvbW1l
bnQgaXMgc3VzcGljaW91cywgYW5kIHNlZW1zIHdyb25nLi4KPiA+ID4gKwkJCWRpc2FibGVfaXJx
KGkyYy0+aXJxKTsKPiA+ID4gKwo+ID4gSSBndWVzcyB0aGlzIGRvZXNuJ3QgZGlzYWJsZSBpbnRl
cnJ1cHQgaW4gdGhlIGhhcmR3YXJlIGxheWVyLCBpdCB3aWxsIHN0aWxsCj4gPiBmaXJlIGludGVy
cnVwdCBvbmNlIGVuYWJsZWQsIHNvIGluc3RlYWQgb2YgY2FsbGluZyBkaXNhYmxlX2lycSgpLCB3
aHkgbm90Cj4gPiBkZWFsaW5nIHdpdGggSVNSIHNldHRpbmcgb2YgdGhlIGNvbnRyb2xsZXI/IEkg
bWVhbiB0aG9zZSAiSUUgYml0cyIoaW50ZXJydXB0Cj4gPiBlbmFibGVpbmcpIG9mIElDUiBSRUdJ
U1RFUiwgZGlzYWJsaW5nIHRoZW0gc2hvdWxkIHByZXZlbnQgdGhlIGludGVycnVwdAo+ID4gdHJp
Z2dlcmVkPwo+IEZvciBleGFtcGxlLCB0YWtlIE1TRCAobWFzdGVyIHN0b3AgZGV0ZWN0KS4KPiBJ
ZiB3ZSBkaXNhYmxlIHRoaXMgaW50ZXJydXB0LCBldmVuIHRoZSBpbnRlcnJ1cHQgc3RhdHVzIGJp
dCB3aWxsIG5ldmVyIGJlIHRyaWdnZXJlZC4KTm8sIHRoaXMgaXMgbm90IHNvbWV0aGluZyBJIHVu
ZGVyc3RhbmQuLgo+IFRoZW4gaG93IGFyZSB3ZSBzdXBwb3NlZCB0byBrbm93IHdoZW4gdGhlIHRy
YW5zZmVyIGhhcyBjb21wbGV0ZWQ/Cj4gVGhhdOKAmXMgd2h5IHdlIGRpc2FibGUgdGhlIGdsb2Jh
bCBpbnRlcnJ1cHQgaGVyZSwgYnV0IHN0aWxsIGtlZXAgdGhlIHBlbmRpbmcgYml0LgpjaGVja2lu
ZyAxOC4xLjQuMSBJQ1IgUkVHSVNURVIsIHRoZXJlIGlzIE1hc3RlciBTdG9wIERldGVjZWQgRW5h
YmxlIC0gTVNERSAoQml0WzI2XSkgYW5kCk1hc3RlciBTdG9wIERldGVjZWQgSW50ZXJydXB0IEVu
YWJsZSAtIE1TRElFIChCSVRbMjVdKQp5b3UgY2FuIGRpc2FibGUgTVNESUUgYnV0IHN0aWxsIGVu
YWJsZSBNU0RFLCBhbmQgY2hlY2sgc3RhdHVzIG9mIE1TRCAoQklUWzI2XSkgb2YgSVNSIFJFR0lT
VEVSPwppdCBzaG91bGQgc3RpbGwgd29yayB3aXRoIGludGVycnVwdCBkaXNhYmxlZCwgb3RoZXJ3
aXNlIEknZCBjb25zaWRlciB0aGUgaGFyZHdhcmUgaXMgYnJva2VuLgoKLS0gCllpeHVuIExhbiAo
ZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
