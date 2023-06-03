Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DE5C7EE24
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+38sxsL0YRWH0QzpWw8jiIwPlzCjKFzkN34g+rQiwY=; b=qCh5LxjMFPMq0F
	s5Ao5iHC+ozHQKUWHCwP5cRtpCtNwmtWpMnXPpGjxvUAp99pe+TcCyxMdYJso/rJgax6TdUSK3Z41
	1awBO9j2x0NxlSxbGDLdVWuWYtWH2dWItY+71USJEogCwwU7P5o4uBle2H60iPKMczLdvNS1LfLCc
	gCX4t2g114gkLQk2IAyt2D8XH88YEQjq5bushhCygomec052IpFj+LaLC+I4+alJqKljXTRu8hQjn
	G19Y9v6EpFDFd78fygzIeY17r0/Kjd590rHLjegera0cndWQtFpYYQEHlVh6NthDNYmxbo6wYai7l
	6PQVgRuZbOoRqXqoXERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MEJ-00932L-0N;
	Sat, 03 Jun 2023 08:03:19 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MEF-009314-2k
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:03:17 +0000
X-QQ-mid: bizesmtp88t1685779382tnnl2ip3
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:03:01 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: /+iK7ZpVlLQCQXqPSdOBhJJtHOaA/uGGRHPayXIRaGu+YhAFWsPazE+ULSLgS
	s96RiiK7GwzPd6n89GHKQ6SFyVzhAqWyrFlaMYaOWdhjhbHb+VixYEAYRUPKZ/rQtyNckdi
	Zi25NQ0xylNsTwAaSxVLoioPCOMe8dtaR7JxTZ1xYpMFZ283x4epDN6y5QixLz8+iZP0EfJ
	HvS+E4mwJnyo4BzYB8Dnvkv08tDSmnmlt5WxwR5X2dw2THx/n7ZPVm+0e8Wgc04QLzraW17
	ZNGSqreCAtS/IQdHnr/1E2GfnX2rLYl70mHTMeCkWhU9d+Udx4qEAgNftIJGCjPiNotnHYR
	f3WDBW5fL5oG0fLP3oLir4hW+hIQGRTVyTaQu9rpMwP+WLysZ3z9Hgl46OfyXFXNEC80Cml
	2uhx01xuDXA=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15194475891504528648
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 02/12] tools/nolibc: add missing nanoseconds support for __NR_statx
Date: Sat,  3 Jun 2023 16:02:04 +0800
Message-Id: <bcb69a382bbb68826f974ef4f521c8f1c60e47bc.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_010316_189126_2EC6F739 
X-CRM114-Status: UNSURE (   7.47  )
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

Q29tbWl0IGE4OWM5MzdkNzgxYSAoInRvb2xzL25vbGliYzogc3VwcG9ydCBuYW5vc2Vjb25kcyBp
biBzdGF0KCkiKQphZGRlZCBuYW5vc2Vjb25kcyBmb3Igc3RhdCgpIGJ1dCBtaXNzZWQgdGhlIHN0
YXR4IGNhc2UsIHRoaXMgYWRkcyBpdC4KClRoZSBzdHhfYXRpbWUsIHN0eF9tdGltZSwgc3R4X2N0
aW1lIGFyZSBpbiB0eXBlIG9mICdzdHJ1Y3QKc3RhdHhfdGltZXN0YW1wJywgd2hpY2ggaXMgaW5j
b21wYXRpYmxlIHdpdGggJ3N0cnVjdCB0aW1lc3BlYycsIHNob3VsZApjb252ZXJ0IGV4cGxpY2l0
bHkuCgogICAgLyogaW5jbHVkZS91YXBpL2xpbnV4L3N0YXQuaCAqLwoKICAgIHN0cnVjdCBzdGF0
eF90aW1lc3RhbXAgewogICAgCV9fczY0CXR2X3NlYzsKICAgIAlfX3UzMgl0dl9uc2VjOwogICAg
CV9fczMyCV9fcmVzZXJ2ZWQ7CiAgICB9OwoKICAgIC8qIGluY2x1ZGUvdWFwaS9saW51eC90aW1l
LmggKi8KICAgIHN0cnVjdCB0aW1lc3BlYyB7CiAgICAJX19rZXJuZWxfb2xkX3RpbWVfdAl0dl9z
ZWM7CQkvKiBzZWNvbmRzICovCiAgICAJbG9uZwkJCXR2X25zZWM7CS8qIG5hbm9zZWNvbmRzICov
CiAgICB9OwoKV2l0aG91dCB0aGlzIHBhdGNoLCB0aGUgc3RhdF90aW1lc3RhbXBzIHRlc3QgY2Fz
ZSB3b3VsZCBmYWlsIHdoZW4KX19OUl9zdGF0eCBkZWZpbmVkLgoKRml4ZXM6IGE4OWM5MzdkNzgx
YSAoInRvb2xzL25vbGliYzogc3VwcG9ydCBuYW5vc2Vjb25kcyBpbiBzdGF0KCkiKQpTdWdnZXN0
ZWQtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvM2EzZWRkNDgtMWFjZS00Yzg5LTg5ZTgt
OWM1OTRkZDFiM2M5QHQtOGNoLmRlLwpTaWduZWQtb2ZmLWJ5OiBaaGFuZ2ppbiBXdSA8ZmFsY29u
QHRpbnlsYWIub3JnPgotLS0KIHRvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oIHwgMzcgKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbm9s
aWJjL3N5cy5oIGIvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmgKaW5kZXggMWQ2ZjMzZjU4NjI5
Li4wMTYwNjA1NDQ0ZTcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCisr
KyBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCkBAIC0xMTYxLDIzICsxMTYxLDI2IEBAIGlu
dCBzeXNfc3RhdChjb25zdCBjaGFyICpwYXRoLCBzdHJ1Y3Qgc3RhdCAqYnVmKQogCWxvbmcgcmV0
OwogCiAJcmV0ID0gc3lzX3N0YXR4KEFUX0ZEQ1dELCBwYXRoLCBBVF9OT19BVVRPTU9VTlQsIFNU
QVRYX0JBU0lDX1NUQVRTLCAmc3RhdHgpOwotCWJ1Zi0+c3RfZGV2ICAgICA9ICgoc3RhdHguc3R4
X2Rldl9taW5vciAmIDB4ZmYpCi0JCQkgIHwgKHN0YXR4LnN0eF9kZXZfbWFqb3IgPDwgOCkKLQkJ
CSAgfCAoKHN0YXR4LnN0eF9kZXZfbWlub3IgJiB+MHhmZikgPDwgMTIpKTsKLQlidWYtPnN0X2lu
byAgICAgPSBzdGF0eC5zdHhfaW5vOwotCWJ1Zi0+c3RfbW9kZSAgICA9IHN0YXR4LnN0eF9tb2Rl
OwotCWJ1Zi0+c3RfbmxpbmsgICA9IHN0YXR4LnN0eF9ubGluazsKLQlidWYtPnN0X3VpZCAgICAg
PSBzdGF0eC5zdHhfdWlkOwotCWJ1Zi0+c3RfZ2lkICAgICA9IHN0YXR4LnN0eF9naWQ7Ci0JYnVm
LT5zdF9yZGV2ICAgID0gKChzdGF0eC5zdHhfcmRldl9taW5vciAmIDB4ZmYpCi0JCQkgIHwgKHN0
YXR4LnN0eF9yZGV2X21ham9yIDw8IDgpCi0JCQkgIHwgKChzdGF0eC5zdHhfcmRldl9taW5vciAm
IH4weGZmKSA8PCAxMikpOwotCWJ1Zi0+c3Rfc2l6ZSAgICA9IHN0YXR4LnN0eF9zaXplOwotCWJ1
Zi0+c3RfYmxrc2l6ZSA9IHN0YXR4LnN0eF9ibGtzaXplOwotCWJ1Zi0+c3RfYmxvY2tzICA9IHN0
YXR4LnN0eF9ibG9ja3M7Ci0JYnVmLT5zdF9hdGltZSAgID0gc3RhdHguc3R4X2F0aW1lLnR2X3Nl
YzsKLQlidWYtPnN0X210aW1lICAgPSBzdGF0eC5zdHhfbXRpbWUudHZfc2VjOwotCWJ1Zi0+c3Rf
Y3RpbWUgICA9IHN0YXR4LnN0eF9jdGltZS50dl9zZWM7CisJYnVmLT5zdF9kZXYgICAgICAgICAg
PSAoKHN0YXR4LnN0eF9kZXZfbWlub3IgJiAweGZmKQorCQkJICAgICAgIHwgKHN0YXR4LnN0eF9k
ZXZfbWFqb3IgPDwgOCkKKwkJCSAgICAgICB8ICgoc3RhdHguc3R4X2Rldl9taW5vciAmIH4weGZm
KSA8PCAxMikpOworCWJ1Zi0+c3RfaW5vICAgICAgICAgID0gc3RhdHguc3R4X2lubzsKKwlidWYt
PnN0X21vZGUgICAgICAgICA9IHN0YXR4LnN0eF9tb2RlOworCWJ1Zi0+c3RfbmxpbmsgICAgICAg
ID0gc3RhdHguc3R4X25saW5rOworCWJ1Zi0+c3RfdWlkICAgICAgICAgID0gc3RhdHguc3R4X3Vp
ZDsKKwlidWYtPnN0X2dpZCAgICAgICAgICA9IHN0YXR4LnN0eF9naWQ7CisJYnVmLT5zdF9yZGV2
ICAgICAgICAgPSAoKHN0YXR4LnN0eF9yZGV2X21pbm9yICYgMHhmZikKKwkJCSAgICAgICB8IChz
dGF0eC5zdHhfcmRldl9tYWpvciA8PCA4KQorCQkJICAgICAgIHwgKChzdGF0eC5zdHhfcmRldl9t
aW5vciAmIH4weGZmKSA8PCAxMikpOworCWJ1Zi0+c3Rfc2l6ZSAgICAgICAgID0gc3RhdHguc3R4
X3NpemU7CisJYnVmLT5zdF9ibGtzaXplICAgICAgPSBzdGF0eC5zdHhfYmxrc2l6ZTsKKwlidWYt
PnN0X2Jsb2NrcyAgICAgICA9IHN0YXR4LnN0eF9ibG9ja3M7CisJYnVmLT5zdF9hdGltLnR2X3Nl
YyAgPSBzdGF0eC5zdHhfYXRpbWUudHZfc2VjOworCWJ1Zi0+c3RfYXRpbS50dl9uc2VjID0gc3Rh
dHguc3R4X2F0aW1lLnR2X25zZWM7CisJYnVmLT5zdF9tdGltLnR2X3NlYyAgPSBzdGF0eC5zdHhf
bXRpbWUudHZfc2VjOworCWJ1Zi0+c3RfbXRpbS50dl9uc2VjID0gc3RhdHguc3R4X210aW1lLnR2
X25zZWM7CisJYnVmLT5zdF9jdGltLnR2X3NlYyAgPSBzdGF0eC5zdHhfY3RpbWUudHZfc2VjOwor
CWJ1Zi0+c3RfY3RpbS50dl9uc2VjID0gc3RhdHguc3R4X2N0aW1lLnR2X25zZWM7CiAJcmV0dXJu
IHJldDsKIH0KICNlbHNlCi0tIAoyLjI1LjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
