Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA070C83000
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOfgKNwMSNXefnpGgyplt4Tv7LvegNUWseXADAPY1KE=; b=uDcMtqKj6CpIKj
	VZ6A+gO1o0IWkW9B2cRnLLXc3dERJsY9VEjwS+WE3TvWV3adTxUjAWTgDZpqyfWLrstdL2/TZ876y
	aFcH2U/4J/6iyH9JyyF8Mz8IhLnXTleOdk256AyMiQ+sJU6QV+iHGMRaFuOZgugczxYS/Nw3iF8oa
	Oee4DXAN/G1OtpRboFMe5jCZOTyVhFlwFWVX3ONM3DlmgTQB62qecAA12RcLuyFwgrFPTXBPX9wOr
	q/cGnn3ewFIWM8mM9h4UQZOwPy8iE1RQTMxCIJlKVifJrWFZEK93lX7hI7eIxgfTKMaA9fWQtDJtq
	3axq1xqugmNwqOj7ngPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6Fd-0000000EFpk-3i8x;
	Fri, 27 Jun 2025 10:24:09 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV55g-0000000E39n-49e7
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:09:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E8DE4390F;
	Fri, 27 Jun 2025 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9uNp3pSOKOY+7xgQJRed4d6tQE1Z/95H/ytYVA1aP4=;
	b=mFfQKfcl3D2l0CX/M/DsMOqgQmKpCXiZkVzEjyLaRhOl/YgLbjCSWTaB1hfkHECCNwKPcG
	49FfsPx8P/Davx9QVxGaPqNEYI+aXrJnMG1LjCAKxUmmL3Soj3HI9qrg4z/qi5RsT6mIT8
	YgkZkoVtzAHbpughCfOuT5/PF0A9eQgOjmiKE3SBqcmSRs8LExew9WAWjS3yKFSwnatuAP
	a2FiL8Mv+xEu29f17MonAjiDUn3SUS8UaLP3ByKDbBXPjaNqxi5zwqJ8CvqlfJuA2pnP8Y
	emvqE2PaPO+HsD8IXD6PTSgNt4Cmm94LSYhbDZznbaXo+z89I/SS66u8mFBfog==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:08:58 +0200
Subject: [PATCH net-next v2 12/18] net: macb: match skb_reserve(skb,
 NET_IP_ALIGN) with HW alignment
MIME-Version: 1.0
Message-Id: <20250627-macb-v2-12-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, 
 Harini Katakam <harini.katakam@xilinx.com>, 
 Rafal Ozieblo <rafalo@cadence.com>, 
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudegngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrt
 ghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_020949_182836_2E09BF3B 
X-CRM114-Status: GOOD (  16.25  )
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

SWYgSFcgaXMgUlNDIGNhcGFibGUsIGl0IGNhbm5vdCBhZGQgZHVtbXkgYnl0ZXMgYXQgdGhlIHN0
YXJ0IG9mIElQCnBhY2tldHMuIEFsaWdubWVudCAoaWUgbnVtYmVyIG9mIGR1bW15IGJ5dGVzKSBp
cyBjb25maWd1cmVkIHVzaW5nIHRoZQpSQk9GIGZpZWxkIGluc2lkZSB0aGUgTkNGR1IgcmVnaXN0
ZXIuCgpPbiB0aGUgc29mdHdhcmUgc2lkZSwgdGhlIHNrYl9yZXNlcnZlKHNrYiwgTkVUX0lQX0FM
SUdOKSBjYWxsIG11c3Qgb25seQpiZSBkb25lIGlmIHRob3NlIGR1bW15IGJ5dGVzIGFyZSBhZGRl
ZCBieSB0aGUgaGFyZHdhcmU7IG5vdGljZSB0aGUKc2tiX3Jlc2VydmUoKSBpcyBkb25lIEFGVEVS
IHdyaXRpbmcgdGhlIGFkZHJlc3MgdG8gdGhlIGRldmljZS4KCldlIGNhbm5vdCBkbyB0aGUgc2ti
X3Jlc2VydmUoKSBjYWxsIEJFRk9SRSB3cml0aW5nIHRoZSBhZGRyZXNzIGJlY2F1c2UKdGhlIGFk
ZHJlc3MgZmllbGQgaWdub3JlcyB0aGUgbG93IDIvMyBiaXRzLiBDb25jbHVzaW9uOiBpbiBzb21l
IGNhc2VzLAp3ZSByaXNrIG5vdCBiZWluZyBhYmxlIHRvIHJlc3BlY3QgdGhlIE5FVF9JUF9BTElH
TiB2YWx1ZSAod2hpY2ggaXMKcGlja2VkIGJhc2VkIG9uIHVuYWxpZ25lZCBDUFUgYWNjZXNzIHBl
cmZvcm1hbmNlKS4KCkZpeGVzOiA0ZGY5NTEzMWVhODAgKCJuZXQvbWFjYjogY2hhbmdlIFJYIHBh
dGggZm9yIEdFTSIpClNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8dGhlby5sZWJydW5AYm9v
dGxpbi5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmggICAgICB8
ICAzICsrKwogZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYyB8IDIxICsr
KysrKysrKysrKysrKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2Uv
bWFjYi5oIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgKaW5kZXggYWRjNzBi
NmVmZDUyYjBiMTFlNDM2YzJjOTViYjUxMDhjNDBmMzQ5MC4uZDQyYzgxY2Y0NDFjZTQzNWNhZDM4
ZTJkZmQ3NzliMGU2YTE0MWJmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2Fk
ZW5jZS9tYWNiLmgKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgKQEAg
LTUyMyw2ICs1MjMsOCBAQAogLyogQml0ZmllbGRzIGluIERDRkc2LiAqLwogI2RlZmluZSBHRU1f
UEJVRl9MU09fT0ZGU0VUCQkJMjcKICNkZWZpbmUgR0VNX1BCVUZfTFNPX1NJWkUJCQkxCisjZGVm
aW5lIEdFTV9QQlVGX1JTQ19PRkZTRVQJCQkyNgorI2RlZmluZSBHRU1fUEJVRl9SU0NfU0laRQkJ
CTEKICNkZWZpbmUgR0VNX1BCVUZfQ1VUVEhSVV9PRkZTRVQJCQkyNQogI2RlZmluZSBHRU1fUEJV
Rl9DVVRUSFJVX1NJWkUJCQkxCiAjZGVmaW5lIEdFTV9EQVc2NF9PRkZTRVQJCQkyMwpAQCAtNzMz
LDYgKzczNSw3IEBACiAjZGVmaW5lIE1BQ0JfQ0FQU19NSUlPTlJHTUlJCQkJQklUKDkpCiAjZGVm
aW5lIE1BQ0JfQ0FQU19ORUVEX1RTVUNMSwkJCUJJVCgxMCkKICNkZWZpbmUgTUFDQl9DQVBTX1FV
RVVFX0RJU0FCTEUJCQlCSVQoMTEpCisjZGVmaW5lIE1BQ0JfQ0FQU19SU0NfQ0FQQUJMRQkJCUJJ
VCgxMikKICNkZWZpbmUgTUFDQl9DQVBTX1BDUwkJCQlCSVQoMjQpCiAjZGVmaW5lIE1BQ0JfQ0FQ
U19ISUdIX1NQRUVECQkJQklUKDI1KQogI2RlZmluZSBNQUNCX0NBUFNfQ0xLX0hXX0NIRwkJCUJJ
VCgyNikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWlu
LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCmluZGV4IDQ4Yjc1
ZDk1ODYxMzE3Yjk5MjViMzY2NDQ2Yzc1NzJjN2UxODY2MjguLjU3OGU3MmM3NzI3ZDRmNTc4NDc4
ZmYyYjNkMGE2MzE2MzI3MjcxYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Nh
ZGVuY2UvbWFjYl9tYWluLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNi
X21haW4uYwpAQCAtMTMxNyw4ICsxMzE3LDE5IEBAIHN0YXRpYyB2b2lkIGdlbV9yeF9yZWZpbGwo
c3RydWN0IG1hY2JfcXVldWUgKnF1ZXVlKQogCQkJZG1hX3dtYigpOwogCQkJbWFjYl9zZXRfYWRk
cihicCwgZGVzYywgcGFkZHIpOwogCi0JCQkvKiBwcm9wZXJseSBhbGlnbiBFdGhlcm5ldCBoZWFk
ZXIgKi8KLQkJCXNrYl9yZXNlcnZlKHNrYiwgTkVUX0lQX0FMSUdOKTsKKwkJCS8qIFByb3Blcmx5
IGFsaWduIEV0aGVybmV0IGhlYWRlci4KKwkJCSAqCisJCQkgKiBIYXJkd2FyZSBjYW4gYWRkIGR1
bW15IGJ5dGVzIGlmIGFza2VkIHVzaW5nIHRoZSBSQk9GCisJCQkgKiBmaWVsZCBpbnNpZGUgdGhl
IE5DRkdSIHJlZ2lzdGVyLiBUaGF0IGZlYXR1cmUgaXNuJ3QKKwkJCSAqIGF2YWlsYWJsZSBpZiBo
YXJkd2FyZSBpcyBSU0MgY2FwYWJsZS4KKwkJCSAqCisJCQkgKiBXZSBjYW5ub3QgZmFsbGJhY2sg
dG8gZG9pbmcgdGhlIDItYnl0ZSBzaGlmdCBiZWZvcmUKKwkJCSAqIERNQSBtYXBwaW5nIGJlY2F1
c2UgdGhlIGFkZHJlc3MgZmllbGQgZG9lcyBub3QgYWxsb3cKKwkJCSAqIHNldHRpbmcgdGhlIGxv
dyAyLzMgYml0cy4KKwkJCSAqIEl0IGlzIDMgYml0cyBpZiBIV19ETUFfQ0FQX1BUUCwgZWxzZSAy
IGJpdHMuCisJCQkgKi8KKwkJCWlmICghKGJwLT5jYXBzICYgTUFDQl9DQVBTX1JTQ19DQVBBQkxF
KSkKKwkJCQlza2JfcmVzZXJ2ZShza2IsIE5FVF9JUF9BTElHTik7CiAJCX0gZWxzZSB7CiAJCQlk
ZXNjLT5jdHJsID0gMDsKIAkJCWRtYV93bWIoKTsKQEAgLTI3ODcsNyArMjc5OCw5IEBAIHN0YXRp
YyB2b2lkIG1hY2JfaW5pdF9odyhzdHJ1Y3QgbWFjYiAqYnApCiAJbWFjYl9zZXRfaHdhZGRyKGJw
KTsKIAogCWNvbmZpZyA9IG1hY2JfbWRjX2Nsa19kaXYoYnApOwotCWNvbmZpZyB8PSBNQUNCX0JG
KFJCT0YsIE5FVF9JUF9BTElHTik7CS8qIE1ha2UgZXRoIGRhdGEgYWxpZ25lZCAqLworCS8qIE1h
a2UgZXRoIGRhdGEgYWxpZ25lZC4gSWYgUlNDIGNhcGFibGUsIHRoYXQgb2Zmc2V0IGlzIGlnbm9y
ZWQgYnkgSFcuICovCisJaWYgKCEoYnAtPmNhcHMgJiBNQUNCX0NBUFNfUlNDX0NBUEFCTEUpKQor
CQljb25maWcgfD0gTUFDQl9CRihSQk9GLCBORVRfSVBfQUxJR04pOwogCWNvbmZpZyB8PSBNQUNC
X0JJVChEUkZDUyk7CQkvKiBEaXNjYXJkIFJ4IEZDUyAqLwogCWlmIChicC0+Y2FwcyAmIE1BQ0Jf
Q0FQU19KVU1CTykKIAkJY29uZmlnIHw9IE1BQ0JfQklUKEpGUkFNRSk7CS8qIEVuYWJsZSBqdW1i
byBmcmFtZXMgKi8KQEAgLTQxMDgsNiArNDEyMSw4IEBAIHN0YXRpYyB2b2lkIG1hY2JfY29uZmln
dXJlX2NhcHMoc3RydWN0IG1hY2IgKmJwLAogCQlkY2ZnID0gZ2VtX3JlYWRsKGJwLCBEQ0ZHMik7
CiAJCWlmICgoZGNmZyAmIChHRU1fQklUKFJYX1BLVF9CVUZGKSB8IEdFTV9CSVQoVFhfUEtUX0JV
RkYpKSkgPT0gMCkKIAkJCWJwLT5jYXBzIHw9IE1BQ0JfQ0FQU19GSUZPX01PREU7CisJCWlmIChH
RU1fQkZFWFQoUEJVRl9SU0MsIGdlbV9yZWFkbChicCwgRENGRzYpKSkKKwkJCWJwLT5jYXBzIHw9
IE1BQ0JfQ0FQU19SU0NfQ0FQQUJMRTsKIAkJaWYgKGdlbV9oYXNfcHRwKGJwKSkgewogCQkJaWYg
KCFHRU1fQkZFWFQoVFNVLCBnZW1fcmVhZGwoYnAsIERDRkc1KSkpCiAJCQkJZGV2X2VycigmYnAt
PnBkZXYtPmRldiwKCi0tIAoyLjUwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
