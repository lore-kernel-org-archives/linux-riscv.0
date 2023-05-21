Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3A9C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 11:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6BDDR1sEpGcF2iET8KydFMpcLsT7QdiUMpcgB7aAfc=; b=M51MMlnEDxBbZS
	hz/TdjoPKybR89l5096nRS8zDUY8Qvgp5p9oi32jiATaV23ZIBDkZQK7u3UIN/Ldm+3U+8tdu6t2L
	BaGRe+afGF0Fx8t5Q13bnrXITZdJVbUsJ9R16eGPgz8S8vOEZoh8X8+NqsA2A2br1Pp2tC+txyub6
	2BarIza2DgLCJOw8NVshQ4GeStGCE87AlGprFjEoT/KpG4Fim7z647EvOSi3xjY6bgUgmledm7lrT
	pkoJJ1Qj1AiKt+7AGDYGeLn7mOSd40h4N1ZqD1ePDsrYJ97MCKmh7KhVHWsV+DvbgioWSXFK+ucqZ
	sVrDswnNrFwJGmev3xZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0hX5-003nND-2v;
	Sun, 21 May 2023 11:47:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0hX3-003nLQ-1Y
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 11:47:26 +0000
Received: from ip5b412278.dynamic.kabel-deutschland.de ([91.65.34.120] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q0hWv-0008T6-1T; Sun, 21 May 2023 13:47:17 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-kernel@vger.kernel.org,
	christoph.muellner@vrull.eu,
	David.Laight@ACULAB.COM,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v3 1/2] riscv: don't include kernel.h into alternative.h
Date: Sun, 21 May 2023 13:47:14 +0200
Message-Id: <20230521114715.955823-2-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_044725_525077_07BD0057 
X-CRM114-Status: GOOD (  10.23  )
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

RnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxsLmV1PgoKVGhpcyBpbmNs
dWRlIGlzIG5vdCBjdXJyZW50bHkgbmVlZGVkIGZvciBhbHRlcm5hdGl2ZXMgYW5kIGNyZWF0ZXMK
cG9zc2libGUgaXNzdWVzIHdoZW4gd2Ugd2FudCB0byBhZGQgYWx0ZXJuYXRpdmVzIHRvIGRlZXBl
ciBrZXJuZWwKaW5mcmFzdHJ1Y3R1cmUuCgpUaGUgaXNzdWUgaW4gcXVlc3Rpb24gY2FtZSBmcm9t
IHRyeWluZyB0byBpbnRyb2R1Y2UgWmF3cnMgYWx0ZXJuYXRpdmVzLAp3aGljaCByZXN1bHRlZCBp
biBhIHNvbWV3aGF0IGNpcmN1bGFyIGRlcGVuZGVuY3kgbGlrZToKCkluIGZpbGUgaW5jbHVkZWQg
ZnJvbSAuLi9pbmNsdWRlL2xpbnV4L2JpdG9wcy5oOjM0LAogICAgICAgICAgICAgICAgIGZyb20g
Li4vaW5jbHVkZS9saW51eC9rZXJuZWwuaDoyMiwKICAgICAgICAgICAgICAgICBmcm9tIC4uL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vYWx0ZXJuYXRpdmUuaDoxNiwKICAgICAgICAgICAgICAgICBm
cm9tIC4uL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaDo4LAogICAgICAgICAg
ICAgICAgIGZyb20gLi4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9iYXJyaWVyLmg6MTUsCiAgICAg
ICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L2xpc3QuaDoxMSwKICAgICAgICAgICAg
ICAgICBmcm9tIC4uL2luY2x1ZGUvbGludXgvcHJlZW1wdC5oOjExLAogICAgICAgICAgICAgICAg
IGZyb20gLi4vaW5jbHVkZS9saW51eC9zcGlubG9jay5oOjU2LAogICAgICAgICAgICAgICAgIGZy
b20gLi4vaW5jbHVkZS9saW51eC9tbXpvbmUuaDo4LAogICAgICAgICAgICAgICAgIGZyb20gLi4v
aW5jbHVkZS9saW51eC9nZnAuaDo3LAogICAgICAgICAgICAgICAgIGZyb20gLi4vaW5jbHVkZS9s
aW51eC9tbS5oOjcsCiAgICAgICAgICAgICAgICAgZnJvbSAuLi9hcmNoL3Jpc2N2L2tlcm5lbC9h
c20tb2Zmc2V0cy5jOjEwOgouLi9pbmNsdWRlL2FzbS1nZW5lcmljL2JpdG9wcy9nZW5lcmljLW5v
bi1hdG9taWMuaDogSW4gZnVuY3Rpb24g4oCYZ2VuZXJpY190ZXN0X2JpdF9hY3F1aXJl4oCZOgou
Li9pbmNsdWRlL2FzbS1nZW5lcmljL2JpdG9wcy9nZW5lcmljLW5vbi1hdG9taWMuaDoxNDA6MjM6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhzbXBfbG9hZF9hY3F1
aXJl4oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIDE0MCB8ICAg
ICAgICAgcmV0dXJuIDFVTCAmIChzbXBfbG9hZF9hY3F1aXJlKHApID4+IChuciAmIChCSVRTX1BF
Ul9MT05HLTEpKSk7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn4KClNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5l
dT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmggfCAxIC0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9hbHRlcm5hdGl2ZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hbHRlcm5hdGl2ZS5o
CmluZGV4IDZhNDE1Mzc4MjZhNy4uMDU4ODVkZTYwNDhjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9h
bHRlcm5hdGl2ZS5oCkBAIC0xMyw3ICsxMyw2IEBACiAjaWZkZWYgQ09ORklHX1JJU0NWX0FMVEVS
TkFUSVZFCiAKICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+Ci0jaW5jbHVkZSA8bGludXgva2VybmVs
Lmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC9zdGRkZWYuaD4K
ICNpbmNsdWRlIDxhc20vaHdjYXAuaD4KLS0gCjIuMzkuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
