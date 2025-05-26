Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D3DC54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OevERVrECY1d+VcnMwVF6Kib5rLDY3dyP+XqoZDuD1o=; b=fh1cOi67hs80y8
	K485QCDbZtvKBqFvGTNo82BERj2zw6CKDgwANIYEmKnl/J03cbW83PpSAs0Dl9Mu7tBZrnrL0+aRE
	AfRLfaVEd3uhnwVLgvzH7zFqGZF2G+eDQgyApqCn5FewG2mA4BUueLmHtMNFOdj7TYniO95l8yCET
	zBvVoiNIomVrvDsbqfb3UfAIMyz4lhoGZNmJK8MRSu+H1wvxqnrd/lsQorPGAP9mTPQF5Z6MlglRF
	XPq+pdAMY6X69o0pJhkWEUkJ6M5K6pq4rFAR5PwMeAZ6+Ax96pkSglPves2mtElhHfzsKJd5j8lwL
	b+gy/oFm0Icov7blcdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZ0F-000000093Fb-3Qg1;
	Mon, 26 May 2025 14:40:35 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZ0C-000000093Dv-1zuH
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 14:40:33 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16709a31a;
	Mon, 26 May 2025 22:40:23 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH v4 0/4] Add SpacemiT K1 USB3.0 host controller support
Date: Mon, 26 May 2025 22:40:16 +0800
Message-Id: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFB9NGgC/12OQW6DMBBFr4JmXUfGGI/JKveoshjbQ7GqQGIDa
 RVx9zokq0qzeSP9p/eAzClyhmP1gMRrzHEaC+iPCvxA4xeLGAqDkqqVbY3CafFdi3D3jVgb0Sp
 pSUqFyhKUzTVxH3923+f5xYlvS9HOryc4yiz8dLnE+ViRM8F3ZDyq2ivmYA36ukWtEY0mNrbvO
 4cMT9cQ8zyl3z11bXbZu8r+qyonBRrZeeuIFJnTfVjmA4fl4Ec4b9v2B7jy5tz4AAAA
X-Change-ID: 20250517-b4-k1-dwc3-v3-5208a002728a
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748270423; l=3206;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=UwYs87yRsBWeAWhjsFHInESFLeGByLOKRNJA8pL/8tA=;
 b=VKhvsm5zyaoz+pOknrfYlyH+CSJHZUmJn4KRjwnhQm3gtswdUiMWtwRYa/PZcZFjqn0ibmCn1
 FMAG47sUzAHBen03n+EY+t1jemAzpmRu1L+H+tXCEDv1enfjEuAIhCZ
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHkwfVh5OTkhOGENLTxkeGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a970d099e7703a1kunm5f56ec4c12d97
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PyI6KQw4GjE*TQwsGisLFQMv
	AjEKFBVVSlVKTE9DSUxLT0hLSkNMVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFPQkhNNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_074032_738709_4EB04BCA 
X-CRM114-Status: GOOD (  10.83  )
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

VGhlIFVTQiAzLjAgY29udHJvbGxlciBmb3VuZCBpbiB0aGUgU3BhY2VtaVQgSzEgU29DWzFdIHN1
cHBvcnRzIGJvdGggVVNCMy4wCkhvc3QgYW5kIFVTQjIuMCBEdWFsLVJvbGUgRGV2aWNlIChEUkQp
LiBUaGUgUEhZIGludGVyZmFjZXMgcmVxdWlyZWQgZm9yIHRoZQpLMSBVU0Igc3Vic3lzdGVtIOKA
lCBQSVBFMyAoZm9yIFVTQiAzLjApIGFuZCBVVE1JKyAoZm9yIFVTQiAyLjApIOKAlCBoYXZlCmFs
cmVhZHkgYmVlbiBzdXBwb3J0ZWQgaW4gYSBzZXBhcmF0ZSBwYXRjaHNldCBbMl0uCgpUaGlzIGNv
bnRyb2xsZXIgaXMgY29tcGF0aWJsZSB3aXRoIERlc2lnbldhcmUgQ29yZSBVU0IgMyAoRFdDMykg
ZHJpdmVyLgpIb3dldmVyLCBjb25zdHJhaW50cyBpbiB0aGUgc25wcyxkd2MzIGJpbmRpbmcgbGlt
aXQgdGhlIGFiaWxpdHkgdG8gZXh0ZW5kCnByb3BlcnRpZXMgdG8gZGVzY3JpYmUgaGFyZHdhcmUg
dmFyaWF0aW9ucy4gVGhlIGV4aXN0aW5nIGdlbmVyaWMgRFdDMyBkcml2ZXIsCmR3YzMtb2Ytc2lt
cGxlLCBzdGlsbCBmdW5jdGlvbnMgYXMgYSBnbHVlIGxheWVyLgoKVG8gYWRkcmVzcyB0aGlzIGFu
ZCBwcm9tb3RlIHRyYXNpdGlvbiB0byBmbGF0dGVuZWQgZHdjIG5vZGUsIHRoaXMgcGF0Y2gKaW50
cm9kdWNlcyBkd2MzLWNvbW1vbiwgYnVpbGRpbmcgdXBvbiBwcmlvciB3b3JrIHRoYXQgZXhwb3Nl
ZCB0aGUgRFdDMyBjb3JlCmRyaXZlciBbM10uCgpUaGlzIHBhdGNoc2V0IGlzIGJhc2VkIG9uIHVz
Yi1uZXh0ICg2LjE1LXJjNikgYW5kIGhhcyBiZWVuIHRlc3RlZCBvbiBCYW5hbmFQaSBhbmQgSnVw
aXRlciBkZXZlbG9wbWVudCBib2FyZHMuCgpMaW5rOiBodHRwczovL2RldmVsb3Blci5zcGFjZW1p
dC5jb20vZG9jdW1lbnRhdGlvbj90b2tlbj1BakhEd3JXNzhpZ0FBRWtpSHJhY0JJOUhuVGIgWzFd
Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNDE4LWI0LWsx
LXVzYjMtcGh5LXYyLXYyLTAtYjY5ZTAyZGE4NGViQHdodXQuZWR1LmNuIFsyXQpMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MTQtZHdjMy1yZWZhY3Rvci12Ny0zLWYwMTVi
MzU4NzIyZEBvc3MucXVhbGNvbW0uY29tIFszXQoKU2lnbmVkLW9mZi1ieTogWmUgSHVhbmcgPGh1
YW5nemVAd2h1dC5lZHUuY24+Ci0tLQpDaGFuZ2VzIGluIHY0OgotIGR0LWJpbmRpbmdzIHNwYWNl
bWl0LGsxLWR3YzoKICAtIHJlb3JkZXIgcHJvcGVydGllcwogIC0gYWRkIHByb3BlcnRpZXMgb2Yg
cGh5cyAmIHBoeS1uYW1lcwogIC0gYWRkIHVzYiBodWIgbm9kZXMgaW4gZXhhbXBsZSBkdAotIGFk
ZCBzdXBwb3J0IGZvciBzcGFjZW1pdCxrMS1tYnVzCi0gZHdjMyBnZW5lcmljIHBsYXQgZHJpdmVy
OgogIC0gcmVuYW1lIGR3YzMtY29tbW9uLmMgdG8gZHdjMy1nZW5lcmljLXBsYXQuYwogIC0gdXNl
IFNZU1RFTV9TTEVFUF9QTV9PUFMgbWFjcm9zIGFuZCBkcm9wIFBNIGd1YXJkcwotIGR0czoKICAt
IHJlb3JkZXIgZHRzIHByb3BlcnRpZXMgb2YgdXNiIGR3YzMgbm9kZQogIC0gbW92ZSAiZHJfbW9k
ZSIgb2YgZHdjMyBmcm9tIGR0c2kgdG8gZHRzCi0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI1MDUxOC1iNC1rMS1kd2MzLXYzLXYzLTAtNzYwOWM4YmFhMmE2QHdodXQu
ZWR1LmNuCgpDaGFuZ2VzIGluIHYzOgotIGludHJvZHVjZSBkd2MzLWNvbW1vbiBmb3IgZ2VuZXJp
YyBkd2MzIGhhcmR3YXJlCi0gZml4IHdhcm5pbmdzIGluIHVzYiBob3N0IGR0LWJpbmRpbmdzCi0g
Zml4IGVycm9ycyBpbiBkdHMKLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjUwNDI4LWI0LWsxLWR3YzMtdjItdjEtMC03Y2IwNjFhYmQ2MTlAd2h1dC5lZHUuY24KCkNo
YW5nZXMgaW4gdjI6Ci0gZHQtYmluZGluZ3M6CiAgLSBhZGQgbWlzc2luZyAnbWF4SXRlbXMnCiAg
LSByZW1vdmUgJ3N0YXR1cycgcHJvcGVydHkgaW4gZXhtYXBsZQogIC0gZm9sZCBkd2MzIG5vZGUg
aW50byBwYXJlbnQKLSBkcm9wIGR3YzMgZ2x1ZSBkcml2ZXIgYW5kIHVzZSBzbnBzLGR3YzMgZHJp
dmVyIGRpcmVjdGx5Ci0gcmVuYW1lIGR0cyBub2RlcyBhbmQgcmVvcmRlciBwcm9wZXJ0aWVzIHRv
IGZpdCBjb2Rpbmcgc3R5bGUKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNTA0MDctYjQtazEtdXNiMy12My0yLXYxLTAtYmYwYmNjNDFjOWJhQHdodXQuZWR1LmNu
CgotLS0KWmUgSHVhbmcgKDQpOgogICAgICBkdC1iaW5kaW5nczogdXNiOiBkd2MzOiBhZGQgc3Vw
cG9ydCBmb3IgU3BhY2VtaVQgSzEKICAgICAgZHQtYmluZGluZ3M6IHNvYzogc3BhY2VtaXQ6IEFk
ZCBLMSBNQlVTIGNvbnRyb2xsZXIKICAgICAgdXNiOiBkd2MzOiBhZGQgZ2VuZXJpYyBkcml2ZXIg
dG8gc3VwcG9ydCBmbGF0dGVuZWQgRFQKICAgICAgcmlzY3Y6IGR0czogc3BhY2VtaXQ6IGFkZCB1
c2IzLjAgc3VwcG9ydCBmb3IgSzEKCiAuLi4vYmluZGluZ3Mvc29jL3NwYWNlbWl0L3NwYWNlbWl0
LGsxLW1idXMueWFtbCAgICB8ICA1NSArKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Vz
Yi9zcGFjZW1pdCxrMS1kd2MzLnlhbWwgIHwgMTE2ICsrKysrKysrKysrKysKIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzICAgIHwgIDUxICsrKysrKwogYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpICAgICAgICAgICAgICAgfCAgNjcgKysr
KysrKysKIGRyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA5ICsKIGRyaXZlcnMvdXNiL2R3YzMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYyAgICAgICAg
ICAgICAgIHwgMTg5ICsrKysrKysrKysrKysrKysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCA0ODgg
aW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IGFiNmRjOWE2YzcyMWMyZWVkODY3YzE1NzQ0
Nzc2NGFlNjhmZjliN2UKY2hhbmdlLWlkOiAyMDI1MDUxNy1iNC1rMS1kd2MzLXYzLTUyMDhhMDAy
NzI4YQoKQmVzdCByZWdhcmRzLAotLSAKWmUgSHVhbmcgPGh1YW5nemVAd2h1dC5lZHUuY24+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
