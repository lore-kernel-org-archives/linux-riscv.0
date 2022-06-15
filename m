Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17F8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 21:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FrUiMpqP90WdoQDFiq5uTKS1Bcm0cqBpOMIygbrJUe0=; b=RA9iwURebXB1im
	1XyBJcnWDbN3iNOT2dmxXOHN6NHlCQZffhuhaEcS/XjcDWVLRDOoIsvQWBCwKoDg81CD3udvCYIru
	btm+B7Bhv3i0ZrGxmyqFweE/ce3/Mp86l9pr4tQIr/Arf9W6z7Y/d0Ll3bSAIXYRS3mq0exOKUggz
	m3V7vYVNHKjsrBVMaPy9rFUSAbOHN89KxlhXbdmbpTHhuUka/Wp+HFW3WdIlFd2uaNaHZlrYBt7Er
	mEJS+DytkGKUnZ+LdzjN8yOOS5CCMdPqxLxVBiHVe2x51NUmYbOG+1AM10tHWLdSHDZITj0/NTLvI
	UTvdKGbf6ZUNvC5J+sIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1aLJ-00GQBc-1L; Wed, 15 Jun 2022 21:14:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1aLG-00GQA5-8g
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 21:14:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id i15so11459962plr.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jun 2022 14:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jEvwh7jjqTyDCAEI1ndR/NudME1iPoWlHRWFbB9YcWY=;
        b=uOYK2DWfIE8/d63Ydv45JX8+RWnFlEjlJxAceq0s6Z2cHw7w1+kWfA9aCAe56SRsuF
         IF08W4wtTzF8kh0PLjzTw9uTtwc+MNV1yh0QSEgXwx5WNxbcAdZJRpO9tE+qI1Sb0wrr
         3puGEq39WsZBy2OC8oG+SxxlHT1LPkbguT+euJ5nK3a1A7ZhknBNCeFjsJAYLC4rN+Ws
         NQiyc/zW63G6PW5smPZMM0hUPMsx93ZOGVvRMPN06aj5z5eAsS94LO/mf6dzUhbuS+RQ
         WZP1z4USNBpX0vwnoenbkJ82eHkzRBSOqB1LifjA3Hz5AvfgAM4BVjVWzOi7MBpK1D0p
         ERrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jEvwh7jjqTyDCAEI1ndR/NudME1iPoWlHRWFbB9YcWY=;
        b=J1LWHr1tH33eXV6gh3ytta1Dr2n0345CydVCrhPdmwi4su5X3ve/p7kDD/H/gXFlvi
         cGTT3GQYWhgQT7UB+mCt0yrCWq38MLEW9mUeDXN6QAfVoBefY+m++TNqhqo8jwgqWGAZ
         xanBFCV1KPMEVxFImBnBc3g6mdswuVKg05lZep4XSEQ8OmnQ9Jdk5lseB48+1tGCUnD5
         2pyBnWSkv2AIxJGLffl2MTQTzWWSAmTmtqEAz3EAlfgSYfh5vHkBRxRrJ07gEsvjZiwN
         b4c8ab5vKYk0QPsAdOc333vqDUlorBhW74N1QGdUhT5g/JYK9NK7d4zR7cf+3I4PrzIb
         B3ZQ==
X-Gm-Message-State: AJIora96H1z6gTsMVTBIrG8GYOrHSdupPuSbYdHjsI7b/3oJoQb+FQzO
	PHYPIIgdtoJk9xVlfiEDNexNvg==
X-Google-Smtp-Source: AGRyM1v/q92BC+qegV0/rkeLooRV8EBVLRvekTsozRMiC5yWuNZQ7aLA0O84ZVeMYaOXigOk42ZyMg==
X-Received: by 2002:a17:90a:ba81:b0:1e8:36f2:5b36 with SMTP id t1-20020a17090aba8100b001e836f25b36mr12306903pjr.5.1655327658976;
        Wed, 15 Jun 2022 14:14:18 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id ix18-20020a170902f81200b0016362da9a03sm54409plb.245.2022.06.15.14.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 14:14:18 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Dao Lu <daolu@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Wei Fu <wefu@redhat.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH v3] arch/riscv: add Zihintpause support
Date: Wed, 15 Jun 2022 14:14:10 -0700
Message-Id: <20220615211415.3111271-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_141422_584889_195DFA4D 
X-CRM114-Status: GOOD (  16.47  )
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

SW1wbGVtZW50IHN1cHBvcnQgZm9yIHRoZSBaaUhpbnRQYXVzZSBleHRlbnNpb24uCgpUaGUgUEFV
U0UgaW5zdHJ1Y3Rpb24gaXMgYSBISU5UIHRoYXQgaW5kaWNhdGVzIHRoZSBjdXJyZW50IGhhcnTi
gJlzIHJhdGUKb2YgaW5zdHJ1Y3Rpb24gcmV0aXJlbWVudCBzaG91bGQgYmUgdGVtcG9yYXJpbHkg
cmVkdWNlZCBvciBwYXVzZWQuCgpSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4KVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgpTaWdu
ZWQtb2ZmLWJ5OiBEYW8gTHUgPGRhb2x1QHJpdm9zaW5jLmNvbT4KLS0tCgp2MSAtPiB2MjoKIFJl
bW92ZSB0aGUgdXNhZ2Ugb2Ygc3RhdGljIGJyYW5jaCwgdXNlIFBBVVNFIGlmIHRvb2xjaGFpbiBz
dXBwb3J0cyBpdAp2MiAtPiB2MzoKIEFkZGVkIHRoZSBzdGF0aWMgYnJhbmNoIGJhY2ssIGNwdV9y
ZWxheCgpIGJlaGF2aW9yIGlzIHVuY2hhbmdlZCBpZiBlaXRoZXIgdGhlCnN5c3RlbSBvciB0aGUg
dG9vbGNoYWluIGRvZXMgbm90IHN1cHBvcnQgWmlIaW50UGF1c2UKLS0tCiBhcmNoL3Jpc2N2L01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgNCArKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmggICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28v
cHJvY2Vzc29yLmggfCAxOSArKysrKysrKysrKysrKysrLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9j
cHUuYyAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMgICAgICAgICAgfCAgOCArKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9h
cmNoL3Jpc2N2L01ha2VmaWxlCmluZGV4IDM0Y2Y4YTU5ODYxNy4uNmRkYWNjNmY0NGI5IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKQEAg
LTU2LDYgKzU2LDEwIEBAIHJpc2N2LW1hcmNoLSQoQ09ORklHX1JJU0NWX0lTQV9DKQk6PSAkKHJp
c2N2LW1hcmNoLXkpYwogdG9vbGNoYWluLW5lZWQtemljc3ItemlmZW5jZWkgOj0gJChjYWxsIGNj
LW9wdGlvbi15biwgLW1hcmNoPSQocmlzY3YtbWFyY2gteSlfemljc3JfemlmZW5jZWkpCiByaXNj
di1tYXJjaC0kKHRvb2xjaGFpbi1uZWVkLXppY3NyLXppZmVuY2VpKSA6PSAkKHJpc2N2LW1hcmNo
LXkpX3ppY3NyX3ppZmVuY2VpCiAKKyMgQ2hlY2sgaWYgdGhlIHRvb2xjaGFpbiBzdXBwb3J0cyBa
aWhpbnRwYXVzZSBleHRlbnNpb24KK3Rvb2xjaGFpbi1zdXBwb3J0cy16aWhpbnRwYXVzZSA6PSAk
KGNhbGwgY2Mtb3B0aW9uLXluLCAtbWFyY2g9JChyaXNjdi1tYXJjaC15KV96aWhpbnRwYXVzZSkK
K3Jpc2N2LW1hcmNoLSQodG9vbGNoYWluLXN1cHBvcnRzLXppaGludHBhdXNlKSA6PSAkKHJpc2N2
LW1hcmNoLXkpX3ppaGludHBhdXNlCisKIEtCVUlMRF9DRkxBR1MgKz0gLW1hcmNoPSQoc3Vic3Qg
ZmQsLCQocmlzY3YtbWFyY2gteSkpCiBLQlVJTERfQUZMQUdTICs9IC1tYXJjaD0kKHJpc2N2LW1h
cmNoLXkpCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCA0ZTI0ODY4ODE4NDAuLmYyNGY0Zjhj
OTE0NCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtNTMsNiArNTMsNyBAQCBleHRlcm4gdW5z
aWduZWQgbG9uZyBlbGZfaHdjYXA7CiBlbnVtIHJpc2N2X2lzYV9leHRfaWQgewogCVJJU0NWX0lT
QV9FWFRfU1NDT0ZQTUYgPSBSSVNDVl9JU0FfRVhUX0JBU0UsCiAJUklTQ1ZfSVNBX0VYVF9TVlBC
TVQsCisJUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSwKIAlSSVNDVl9JU0FfRVhUX0lEX01BWCA9
IFJJU0NWX0lTQV9FWFRfTUFYLAogfTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS92ZHNvL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nl
c3Nvci5oCmluZGV4IDEzNDM4OGNiYWFhMS4uMzE0ZWMxN2M0MGQ4IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oCkBAIC00LDE1ICs0LDI4IEBACiAKICNpZm5kZWYgX19B
U1NFTUJMWV9fCiAKKyNpbmNsdWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+CiAjaW5jbHVkZSA8YXNt
L2JhcnJpZXIuaD4KKyNpbmNsdWRlIDxhc20vaHdjYXAuaD4KIAorZXh0ZXJuIHN0cnVjdCBzdGF0
aWNfa2V5X2ZhbHNlIHJpc2N2X3BhdXNlX2F2YWlsYWJsZTsKIHN0YXRpYyBpbmxpbmUgdm9pZCBj
cHVfcmVsYXgodm9pZCkKIHsKKwlpZiAoIXN0YXRpY19icmFuY2hfbGlrZWx5KCZyaXNjdl9wYXVz
ZV9hdmFpbGFibGUpKSB7CiAjaWZkZWYgX19yaXNjdl9tdWxkaXYKLQlpbnQgZHVtbXk7Ci0JLyog
SW4gbGlldSBvZiBhIGhhbHQgaW5zdHJ1Y3Rpb24sIGluZHVjZSBhIGxvbmctbGF0ZW5jeSBzdGFs
bC4gKi8KLQlfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1yIiAo
ZHVtbXkpKTsKKwkJaW50IGR1bW15OworCQkvKiBJbiBsaWV1IG9mIGEgaGFsdCBpbnN0cnVjdGlv
biwgaW5kdWNlIGEgbG9uZy1sYXRlbmN5IHN0YWxsLiAqLworCQlfX2FzbV9fIF9fdm9sYXRpbGVf
XyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1yIiAoZHVtbXkpKTsKICNlbmRpZgorI2lmZGVmIF9f
cmlzY3ZfemloaW50cGF1c2UKKwl9IGVsc2UgeworCQkvKgorCQkgKiBSZWR1Y2UgaW5zdHJ1Y3Rp
b24gcmV0aXJlbWVudC4KKwkJICogVGhpcyBhc3N1bWVzIHRoZSBQQyBjaGFuZ2VzLgorCQkgKi8K
KwkJX19hc21fXyBfX3ZvbGF0aWxlX18gKCJwYXVzZSIpOworI2VuZGlmCisJfQogCWJhcnJpZXIo
KTsKIH0KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHUuYwppbmRleCBmYmE5ZTlmNDZhOGMuLmExMjNlOTJiMTRkZCAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMK
QEAgLTg5LDYgKzg5LDcgQEAgaW50IHJpc2N2X29mX3BhcmVudF9oYXJ0aWQoc3RydWN0IGRldmlj
ZV9ub2RlICpub2RlKQogc3RhdGljIHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgaXNhX2V4dF9h
cnJbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9T
U0NPRlBNRiksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3ZwYm10LCBSSVNDVl9JU0FfRVhUX1NW
UEJNVCksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50cGF1c2UsIFJJU0NWX0lTQV9FWFRf
WklISU5UUEFVU0UpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKCIiLCBSSVNDVl9JU0FfRVhUX01B
WCksCiB9OwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggYTZmNjJhNmQxZWRkLi43OGMyODRj
NDg3ZTggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTMwLDYgKzMwLDggQEAgc3RhdGljIERF
Q0xBUkVfQklUTUFQKHJpc2N2X2lzYSwgUklTQ1ZfSVNBX0VYVF9NQVgpIF9fcmVhZF9tb3N0bHk7
CiAjaWZkZWYgQ09ORklHX0ZQVQogX19yb19hZnRlcl9pbml0IERFRklORV9TVEFUSUNfS0VZX0ZB
TFNFKGNwdV9od2NhcF9mcHUpOwogI2VuZGlmCitERUZJTkVfU1RBVElDX0tFWV9GQUxTRShyaXNj
dl9wYXVzZV9hdmFpbGFibGUpOworRVhQT1JUX1NZTUJPTF9HUEwocmlzY3ZfcGF1c2VfYXZhaWxh
YmxlKTsKIAogLyoqCiAgKiByaXNjdl9pc2FfZXh0ZW5zaW9uX2Jhc2UoKSAtIEdldCBiYXNlIGV4
dGVuc2lvbiB3b3JkCkBAIC0xOTksNiArMjAxLDcgQEAgdm9pZCBfX2luaXQgcmlzY3ZfZmlsbF9o
d2NhcCh2b2lkKQogCQkJfSBlbHNlIHsKIAkJCQlTRVRfSVNBX0VYVF9NQVAoInNzY29mcG1mIiwg
UklTQ1ZfSVNBX0VYVF9TU0NPRlBNRik7CiAJCQkJU0VUX0lTQV9FWFRfTUFQKCJzdnBibXQiLCBS
SVNDVl9JU0FfRVhUX1NWUEJNVCk7CisJCQkJU0VUX0lTQV9FWFRfTUFQKCJ6aWhpbnRwYXVzZSIs
IFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpOwogCQkJfQogI3VuZGVmIFNFVF9JU0FfRVhUX01B
UAogCQl9CkBAIC0yMTksNiArMjIyLDExIEBAIHZvaWQgX19pbml0IHJpc2N2X2ZpbGxfaHdjYXAo
dm9pZCkKIAkJCWJpdG1hcF9hbmQocmlzY3ZfaXNhLCByaXNjdl9pc2EsIHRoaXNfaXNhLCBSSVND
Vl9JU0FfRVhUX01BWCk7CiAJfQogCisjaWZkZWYgX19yaXNjdl96aWhpbnRwYXVzZQorCWlmIChf
X3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHJpc2N2X2lzYSwgUklTQ1ZfSVNBX0VYVF9a
SUhJTlRQQVVTRSkpCisJCXN0YXRpY19icmFuY2hfZW5hYmxlKCZyaXNjdl9wYXVzZV9hdmFpbGFi
bGUpOworI2VuZGlmCisKIAkvKiBXZSBkb24ndCBzdXBwb3J0IHN5c3RlbXMgd2l0aCBGIGJ1dCB3
aXRob3V0IEQsIHNvIG1hc2sgdGhvc2Ugb3V0CiAJICogaGVyZS4gKi8KIAlpZiAoKGVsZl9od2Nh
cCAmIENPTVBBVF9IV0NBUF9JU0FfRikgJiYgIShlbGZfaHdjYXAgJiBDT01QQVRfSFdDQVBfSVNB
X0QpKSB7Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
