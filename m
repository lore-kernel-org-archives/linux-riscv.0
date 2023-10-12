Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D33FCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wU6DEMpckBCjXQB/ItnakfBgf32ZpXWGFdh0YF9sMfg=; b=QwPVlYZ0C5XAFh
	VUEkeO/Nneg1VpLHQ+aNXAU4x4brVgrCam7zZ9RMzuthWMY92Cg+lsktYY5v+06lax/8r2iar5Kmi
	Q9Nl0HDwNs93BY7s/LNPn1ADV1LVMLyd9brpU40Fp0cTkTineSlYUVGuP2Xd8qi796xLbUevTNUjI
	CWhcV4r06J7HHGL9eIOU5J2tFwm7UXHAHF+fAYOix6EkKo62BNDflp0pKb3x6jeaWuhy7M7b+OnSa
	x77rWsO1pe0t7ROKICTTzodtI6wmu9GQQrG7POLpCjMoKPnWXo0U9wiIxcr5KFiGICU+e4xvMFUNx
	y3XrxaIqkNBapFG6ml8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqswM-000fPH-0x;
	Thu, 12 Oct 2023 10:29:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqswK-000fOt-0E
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 10:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 678BE61D70;
	Thu, 12 Oct 2023 10:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C60CC433C8;
	Thu, 12 Oct 2023 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697106551;
	bh=pUW2UZ0iy4cmzd6/+KDXWEa/Dy0ELBQNtzS85l2Lunk=;
	h=From:To:Cc:Subject:Date:From;
	b=brE3CEeTWq27Cqw8KEMugSZoqYW30hCkl4n/stfchAv4ITSXMFJSE8EKQRRAjCFrn
	 AdOD0ZDpihTgzC9V36GYQ23NrFGDm186yigFclM080X2lmXPpu73yTJOCX3rAzbmBQ
	 l1dLuvqQjCAGHodCUUS6ezGo9yVtSX1IpTTySYLGav7LZkrRo3q9CJfd9UQzvl02SL
	 z7CJvRM4J0+Mtz6iKKAn0Vkniv80Rgt41ZvAdzMMyb3hubChs9OS7W0od5/E/A6/8R
	 /ejjo5niRARbD4QXsCST7aVe8ZeTeYpy5vs0/OzMeDSBg/iSPe2yQJuaFSDhEwK3Lv
	 SNnXAAoc66RIg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Gabriel Somlo <somlo@cmu.edu>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v2] riscv, qemu_fw_cfg: Add support for RISC-V architecture
Date: Thu, 12 Oct 2023 12:28:52 +0200
Message-Id: <20231012102852.234442-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_032912_196297_ACE752AC 
X-CRM114-Status: GOOD (  12.00  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKUWVtdSBmd19jZmcgc3Vw
cG9ydCB3YXMgbWlzc2luZyBmb3IgUklTQy1WLCB3aGljaCBtYWRlIGl0IGhhcmQgdG8gZG8KcHJv
cGVyIHZtY29yZSBkdW1wcyBmcm9tIHFlbXUuCgpBZGQgdGhlIG1pc3NpbmcgUklTQy1WIGFyY2gt
ZGVmaW5lcy4KCllvdSBjYW4gbm93IGRvIHZtY29yZSBkdW1wcyBmcm9tIHFlbXUuIEFkZCAiLWRl
dmljZSB2bWNvcmVpbmZvIiB0byB0aGUKcWVtdSBjb21tYW5kLWxpbmUuIEZyb20gdGhlIHFlbXUg
bW9uaXRvcjoKICAocWVtdSkgZHVtcC1ndWVzdC1tZW1vcnkgdm1jb3JlCgpUaGUgdm1jb3JlIGNh
biBub3cgYmUgdXNlZCwgZS5nLiwgd2l0aCB0aGUgImNyYXNoIiB1dGlsaXR5LgoKQWNrZWQtYnk6
ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IEFsaXN0YWly
IEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4KVGVzdGVkLWJ5OiBDbMOpbWVudCBM
w6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCnYyOiBGaXhlZCB0eXBvIChDbMOpbWVudCkKICAgIC4u
LmFuZCBjb2xsZWN0ZWQgQS1iL1QtYnMKLS0tCiBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcgICAg
ICAgfCAyICstCiBkcml2ZXJzL2Zpcm13YXJlL3FlbXVfZndfY2ZnLmMgfCAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2Zpcm13YXJlL0tjb25maWcgYi9kcml2ZXJzL2Zpcm13YXJlL0tjb25maWcKaW5kZXgg
YjU5ZTMwNDFmZDYyLi5mMDVmZjU2NjI5YjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZmlybXdhcmUv
S2NvbmZpZworKysgYi9kcml2ZXJzL2Zpcm13YXJlL0tjb25maWcKQEAgLTE1NSw3ICsxNTUsNyBA
QCBjb25maWcgUkFTUEJFUlJZUElfRklSTVdBUkUKIAogY29uZmlnIEZXX0NGR19TWVNGUwogCXRy
aXN0YXRlICJRRU1VIGZ3X2NmZyBkZXZpY2Ugc3VwcG9ydCBpbiBzeXNmcyIKLQlkZXBlbmRzIG9u
IFNZU0ZTICYmIChBUk0gfHwgQVJNNjQgfHwgUEFSSVNDIHx8IFBQQ19QTUFDIHx8IFNQQVJDIHx8
IFg4NikKKwlkZXBlbmRzIG9uIFNZU0ZTICYmIChBUk0gfHwgQVJNNjQgfHwgUEFSSVNDIHx8IFBQ
Q19QTUFDIHx8IFJJU0NWIHx8IFNQQVJDIHx8IFg4NikKIAlkZXBlbmRzIG9uIEhBU19JT1BPUlRf
TUFQCiAJZGVmYXVsdCBuCiAJaGVscApkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9xZW11
X2Z3X2NmZy5jIGIvZHJpdmVycy9maXJtd2FyZS9xZW11X2Z3X2NmZy5jCmluZGV4IGE2OTM5OWE2
YjdjMC4uMTQ0OGY2MTE3M2IzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Zpcm13YXJlL3FlbXVfZndf
Y2ZnLmMKKysrIGIvZHJpdmVycy9maXJtd2FyZS9xZW11X2Z3X2NmZy5jCkBAIC0yMTEsNyArMjEx
LDcgQEAgc3RhdGljIHZvaWQgZndfY2ZnX2lvX2NsZWFudXAodm9pZCkKIAogLyogYXJjaC1zcGVj
aWZpYyBjdHJsICYgZGF0YSByZWdpc3RlciBvZmZzZXRzIGFyZSBub3QgYXZhaWxhYmxlIGluIEFD
UEksIERUICovCiAjaWYgIShkZWZpbmVkKEZXX0NGR19DVFJMX09GRikgJiYgZGVmaW5lZChGV19D
RkdfREFUQV9PRkYpKQotIyBpZiAoZGVmaW5lZChDT05GSUdfQVJNKSB8fCBkZWZpbmVkKENPTkZJ
R19BUk02NCkpCisjIGlmIChkZWZpbmVkKENPTkZJR19BUk0pIHx8IGRlZmluZWQoQ09ORklHX0FS
TTY0KSB8fCBkZWZpbmVkKENPTkZJR19SSVNDVikpCiAjICBkZWZpbmUgRldfQ0ZHX0NUUkxfT0ZG
IDB4MDgKICMgIGRlZmluZSBGV19DRkdfREFUQV9PRkYgMHgwMAogIyAgZGVmaW5lIEZXX0NGR19E
TUFfT0ZGIDB4MTAKCmJhc2UtY29tbWl0OiAxYzhiODZhMzc5OWY3ZTViZTkwM2MzZjQ5ZmNkYWVl
MjlmZDM4NWI1Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
