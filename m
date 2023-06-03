Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999D1C7EE24
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCD0+0BcZeVl5kjb/KB0PJTTkCXKRUcjP4qCKDbOuaw=; b=A3LhN3a1KGqmjt
	TADWs3BziGhqYks1NPiDJp67EgSZZcjmyiEXH5LUMckchkQzF99biQqg+cDhKgAVTk6z6Pb1SuZiV
	Sz+IAe3hJDsauw2KHp9QUtrmNz55f+zKkcSZsIW8FUpRccPo1+mc/BXGn2/McZq+F3aUC/Cg6ARKX
	87xhb5+q0XgtnTVf/AKIvUNVsd0Ye9lrWUg4zH1upKVCbJSRMo+QWQbrqADQga0tMS/d+OPKqhc1/
	x8l2y2i0xIWIIRT2FhVI3dYte6fAYeMGppv2UFX/ekTUOzfrecUNq6hcPgTvVbrc6gkiZJ+QatHti
	d/FlOzgUzdzyyuHOQyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MFa-0093E3-2c;
	Sat, 03 Jun 2023 08:04:38 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MFX-0093CY-10
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:04:37 +0000
X-QQ-mid: bizesmtp76t1685779463tf50ulh5
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:04:21 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: zT6n3Y95oi1dVQM7LOUCe4ZErci7J0hzthPkaKsmZlRivSBkUu9oKsHTpK5iT
	0ibxDOemCdi1l+T/yHYtBufVQx/bK105xvHta2f1ev1UfOGQW6UR4QI8ILpFABfBDs4Ldez
	PAIAwuuORwFw2j7gb6/FXc65FaEcYepkFvSrRQ+mRb0nTBmRtEeYBQdeoG5IsQTuHg6VWav
	0XZceUgZxFEPKf0G/yYLqWteHLu+lfLWS/+wYVs2QNOYFcxJMAnjdiSQk+lk6r2ocBR3AjR
	QLOOVtbExyU2MM7yVMPK98ZL0kXlKhtPYmONaR6j9SstlAplCc+Pims0s10/tmrw8QxRuiR
	IkIiRQzDdA2jVEQHfKba8VIwrwOw2Q6CM6UeZHSgi5U3tez1D1Ql2UI0yb7HcSFf3/LWydY
	mcX+sxskv5U=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11632177116397536855
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 03/12] selftests/nolibc: allow specify extra arguments for qemu
Date: Sat,  3 Jun 2023 16:04:10 +0800
Message-Id: <6763a735c95fe0fea8109450411c7501e02ce2b6.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_010435_667208_6991A3E7 
X-CRM114-Status: GOOD (  10.14  )
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

VGhlIG9wZW5zYmkgcGFja2FnZSBmcm9tIFVidW50dSAyMC4wNCBvbmx5IHByb3ZpZGVzIHJ2NjQg
ZmlybXdhcmVzOgoKICAgICQgZHBrZyAtUyBvcGVuc2JpIHwgZ3JlcCAtRSAiZndfLipiaW58Zndf
LiplbGYiIHwgdW5pcQogICAgb3BlbnNiaTogL3Vzci9saWIvcmlzY3Y2NC1saW51eC1nbnUvb3Bl
bnNiaS9nZW5lcmljL2Z3X2R5bmFtaWMuYmluCiAgICBvcGVuc2JpOiAvdXNyL2xpYi9yaXNjdjY0
LWxpbnV4LWdudS9vcGVuc2JpL2dlbmVyaWMvZndfanVtcC5iaW4KICAgIG9wZW5zYmk6IC91c3Iv
bGliL3Jpc2N2NjQtbGludXgtZ251L29wZW5zYmkvZ2VuZXJpYy9md19keW5hbWljLmVsZgogICAg
b3BlbnNiaTogL3Vzci9saWIvcmlzY3Y2NC1saW51eC1nbnUvb3BlbnNiaS9nZW5lcmljL2Z3X2p1
bXAuZWxmCgpUbyBydW4gdGhpcyBub2xpYmMgdGVzdCBmb3IgcnYzMiwgdXNlcnMgbXVzdCBidWls
ZCBvcGVuc2JpIG9yIGRvd25sb2FkIGEKcHJlYnVpbHQgb25lIGZyb20gcWVtdSByZXBvc2l0b3J5
OgoKICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2Jsb2IvbWFzdGVy
L3BjLWJpb3Mvb3BlbnNiaS1yaXNjdjMyLWdlbmVyaWMtZndfZHluYW1pYy5iaW4KCkFuZCB0aGVu
IHVzZSAtYmlvcyB0byB0ZWxsIHFlbXUgdXNlIGl0IHRvIGF2b2lkIHN1Y2ggZmFpbHVyZToKCiAg
ICAkIHFlbXUtc3lzdGVtLXJpc2N2MzIgLWRpc3BsYXkgbm9uZSAtbm8tcmVib290IC1rZXJuZWwg
L3BhdGgvdG8vYXJjaC9yaXNjdi9ib290L0ltYWdlIC1zZXJpYWwgc3RkaW8gLU0gdmlydCAtYXBw
ZW5kICJjb25zb2xlPXR0eVMwIHBhbmljPS0xIgogICAgcWVtdS1zeXN0ZW0tcmlzY3YzMjogVW5h
YmxlIHRvIGxvYWQgdGhlIFJJU0MtViBmaXJtd2FyZSAib3BlbnNiaS1yaXNjdjMyLWdlbmVyaWMt
ZndfZHluYW1pYy5iaW4iCgpUbyBydW4gZnJvbSBtYWtlZmlsZSwgUUVNVV9BUkdTX0VYVFJBIGlz
IGFkZGVkIHRvIGFsbG93IHBhc3MgZXh0cmEKYXJndW1lbnRzIGxpa2UgLWJpb3M6CgogICAgJCBt
YWtlIHJ1biBRRU1VX0FSR1NfRVhUUkE9Ii1iaW9zIC9wYXRoL3RvL29wZW5zYmktcmlzY3YzMi1n
ZW5lcmljLWZ3X2R5bmFtaWMuYmluIiAuLi4KClN1Z2dlc3RlZC1ieTogVGhvbWFzIFdlacOfc2No
dWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yYWI5NDEzNi1kMzQxLTRhMjYtOTY0ZS02ZDZjMzJlNjZjOWJAdC04Y2guZGUv
ClNpZ25lZC1vZmYtYnk6IFpoYW5namluIFd1IDxmYWxjb25AdGlueWxhYi5vcmc+Ci0tLQogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bm9saWJjL01ha2VmaWxlCmluZGV4IDQ3YzNjODkwOTJlNC4uNDQwODg1MzU2ODJlIDEwMDY0NAot
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUKKysrIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlCkBAIC02NCw3ICs2NCw3IEBAIFFFTVVf
QVJHU19taXBzICAgICAgID0gLU0gbWFsdGEgLWFwcGVuZCAicGFuaWM9LTEgJChURVNUOiU9Tk9M
SUJDX1RFU1Q9JSkiCiBRRU1VX0FSR1NfcmlzY3YgICAgICA9IC1NIHZpcnQgLWFwcGVuZCAiY29u
c29sZT10dHlTMCBwYW5pYz0tMSAkKFRFU1Q6JT1OT0xJQkNfVEVTVD0lKSIKIFFFTVVfQVJHU19z
MzkwICAgICAgID0gLU0gczM5MC1jY3ctdmlydGlvIC1tIDFHIC1hcHBlbmQgImNvbnNvbGU9dHR5
UzAgcGFuaWM9LTEgJChURVNUOiU9Tk9MSUJDX1RFU1Q9JSkiCiBRRU1VX0FSR1NfbG9vbmdhcmNo
ICA9IC1NIHZpcnQgLWFwcGVuZCAiY29uc29sZT10dHlTMCwxMTUyMDAgcGFuaWM9LTEgJChURVNU
OiU9Tk9MSUJDX1RFU1Q9JSkiCi1RRU1VX0FSR1MgICAgICAgICAgICA9ICQoUUVNVV9BUkdTXyQo
QVJDSCkpCitRRU1VX0FSR1MgICAgICAgICAgICA9ICQoUUVNVV9BUkdTXyQoQVJDSCkpICQoUUVN
VV9BUkdTX0VYVFJBKQogCiAjIE9VVFBVVCBpcyBvbmx5IHNldCB3aGVuIHJ1biBmcm9tIHRoZSBt
YWluIG1ha2VmaWxlLCBvdGhlcndpc2UKICMgaXQgZGVmYXVsdHMgdG8gdGhpcyBub2xpYmMgZGly
ZWN0b3J5LgotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
