Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF789C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 09:25:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94D5160F48
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 09:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94D5160F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wRKF1bfWK0CuVduXCRqiNOC2wQ9Pu58rQgtH9eqh5g=; b=LDIn4vxlCSxyjj5T0Z0Tj8l+1W
	ZBgts2oBjbf8pqvMxs10YXKaaS2ZsMzdxT9Blfc///JUaONcXyMyJr3sLqGc8x/8ZpKNWDhse0Hxt
	uFIv0MFRRi4EVC9kv19mnLwiqYUd14D24fuCdGPmcrFZ4jm7YGzEiO68ciS8CiBPVW+Z4kxFczABg
	kLGRdyxyEhd6ONDAw59nnFidQLycauE1nS8NZ/sCPoiQzDGI0WtHiClYrxyihWQelFLYn9Yl2hpCo
	Goz1lpWvGm89c20wvGz1bQ+0K8DTFnNTQiNNuV8anN7EEjDizmjxjkzl+5q4upo3hgqzXZ5koiuyv
	FV0iLGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTKy7-00AmPb-Bw; Thu, 23 Sep 2021 09:24:39 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTKy2-00AmKE-1A
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 09:24:36 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 18N9OK8w037542
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 12:24:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1632389055; x=1634981055;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KrneRFThc8H11gDbK0Ff3mrpfTanbaFNP85B4qwwTG8=;
 b=PMdP0E71zM1o3g53Ov9R7IOQiYamSUcee9x87eAYjLbItru3CPNSOm/eSBIFVMXu
 FBzOjpTS0mp+TdqL3vqL9+bRekk/tJbghP9w4aClgjbqNz//zOPo30ToxLunEPmf
 8QUa30V6dglUsIeNtiihoZ+5jusIjwvgERRfgMxrMHlHZBLdxHgwYrybeUrlWyR1
 mvRzW7dYYIs8YH0yCFrgKdWmM6ShoBJS6efIM+9+mvSoFlU33QmEdw1PehGGeJRT
 bPN6ceJDVZ9fdz05vlHRW1icw/95i9MusNizfQu7cO/aDGkicq9AqykVRZmgcoTM
 btHp2k9f9NAiItIr5aje3A==;
X-AuditID: 8b5b014d-ba8f670000005d46-a9-614c47bfd475
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 66.DB.23878.FB74C416; Thu, 23 Sep 2021 12:24:15 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 23 Sep 2021 12:24:13 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, hch@lst.de,
 liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>, Arnd
 Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard
 <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>, Greg Favor
 <gfavor@ventanamicro.com>, Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, Bill
 Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>, Allen
 Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>,
 Richard Trauben <rtrauben@gmail.com>
Subject: Re: [PATCH] riscv: Add RISC-V svpbmt extension
Organization: FORTH
In-Reply-To: <20210923072716.913826-1-guoren@kernel.org>
References: <20210923072716.913826-1-guoren@kernel.org>
Message-ID: <6d7b1668c1f562a5ef426bb2519f9784@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUwTZxzHfe6udwdZ41EkPmgmWZ2JwiwYXHxYSIe6ZU+mLjMhKmhkFzyB
 jCBrK27DjFbwpaARGhDtC4WJBKxBbQELSJCLoOiwDuaiwTpwjDFYGS/1jeIYLVnCf5/k+/vm
 +/njx5IyrWQFm5GlEVRZfKacDqaK9pavXt/+2XY+xvCaQUPiSRqduyUy6HhxK4WGJkpo9NbQ
 xaAfa19RqLp5Jbo5epNBD/NPA/SstoZBrWfNFLrhekWjkTYdhe48b6FQna2TQA91TxjUZ7MS
 6M97XTTq9f5Kob4WM42apgtoVFffRaLzr/8FKH/8AYMar9cDVFSXi7qv3QLoyqUygAraSyn0
 RnQRqGqsgkmIwKMnhgnsmzEAPO6rAfiKfozARu0ZGj994KLxtec2CZ4T6yjcbHQzuNJ+GBfc
 9kjwoL2XwPbLeho3D8ZhR3Uebn2ipb9cnhwcf0DIzMgRVNHKr4LTy152k9mudd92X/xdogXe
 iEIQxEJuI7w4rqMLQTAr4zoBfGNyShaCD6GpTQ/8LOVCYPeFIcrPJIdg2S/tYIEjYH6jifQz
 xa2BUxWtgS7NrYPW3o7A/TIuDF41WQMDJOdgofPEKcIfhHKboOeFlvHzUi4UTrl/DpSD5gcG
 7z4KDMjmb3wNBmZB4hPobnjKLMi9Dyd8A/PMsmHz7LDIi0GIcZGqcZGqcZFqJSAvA47PiVVk
 pKoVBw+pNOmKNJUdBJ4E7HCCfodHIQKCBSKALClfJp1+/Dkvkx7gv/teUB1KUR3OFNQiWMlS
 8uVSqaI4Rcal8Rrha0HIFlT/pwQbtEJL2MLjLFUJurzjMw09yT2bZ+LMu8wTOHQgZsxhKN/n
 LCz9eHKr5VSpbemwWCzaau8WdAzvcFfuyd7kSB7/AXalPHb23cj9w+3R9URVdSh3b9k5MFeU
 EF2d1LI28vZJNXE0O2mtk9zW33/UMvfTznLW4vsr97eeyY9KfNSx6P4jms2dTGxi7YZ3DjY1
 96XKP6W8G/ma02F208g06fpi367zyvT93szZqknnbHuFd6Qky5oYfv+fI/rZ3mqlJirVGh/i
 EF8YbFFa/XvKeHy1Xrv37/BGtjBk/+5nKSWjZXk58JtLOerI0rRHdFDMknebHNHbYZs5aSqP
 +2DVmti4xAyPnFKn8xsiSZWa/w8uNVDTkwMAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_022434_498121_C0BBC6F9 
X-CRM114-Status: GOOD (  22.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gR3VvLAoKzqPPhM65z4IgMjAyMS0wOS0yMyAxMDoyNywgZ3VvcmVuQGtlcm5lbC5vcmcg
zq3Os8+BzrHPiM61OgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2NwdXMueWFtbCAKYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvY3B1cy55YW1sCmluZGV4IGU1MzRmNmE3Y2ZhMS4uMTgyNWNkOGRiMGRlIDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKQEAg
LTU2LDcgKzU2LDkgQEAgcHJvcGVydGllczoKICAgICAgZW51bToKICAgICAgICAtIHJpc2N2LHN2
MzIKICAgICAgICAtIHJpc2N2LHN2MzkKKyAgICAgIC0gcmlzY3Ysc3YzOSxzdnBibXQKICAgICAg
ICAtIHJpc2N2LHN2NDgKKyAgICAgIC0gcmlzY3Ysc3Y0OCxzdnBibXQKICAgICAgICAtIHJpc2N2
LG5vbmUKCklzbid0IHN2cGJtdCBvcnRob2dvbmFsIHRvIHRoZSBtbXUgdHlwZSA/IEl0J3MgYSBm
dW5jdGlvbmFsaXR5IHRoYXQgY2FuIApiZSBwcmVzZW50IG9uIGVpdGhlciBzdjM5LzQ4LzU3IHNv
IHdoeSBub3QgaGF2ZSBhbm90aGVyICJzdnBibXQiIApwcm9wZXJ0eSBkaXJlY3RseSBvbiB0aGUg
Y3B1IG5vZGUgPwoKPiArICogcnY2NCBQVEUgZm9ybWF0Ogo+ICsgKiB8IDYzIHwgNjIgNjEgfCA2
MCA1NCB8IDUzICAxMCB8IDkgICAgICAgICAgICAgOCB8IDcgfCA2IHwgNSB8IDQgfAo+IDMgfCAy
IHwgMSB8IDAKPiArICogICBOICAgICAgTVQgICAgIFJTViAgICBQRk4gICAgICByZXNlcnZlZCBm
b3IgU1cgICBEICAgQSAgIEcgICBVCj4gWCAgIFcgICBSICAgVgo+ICsgKiBbNjI6NjFdIE1lbW9y
eSBUeXBlIGRlZmluaXRpb25zOgo+ICsgKiAgMDAgLSBQTUEgICAgTm9ybWFsIENhY2hlYWJsZSwg
Tm8gY2hhbmdlIHRvIGltcGxpZWQgUE1BIG1lbW9yeSB0eXBlCj4gKyAqICAwMSAtIE5DICAgICBO
b24tY2FjaGVhYmxlLCBpZGVtcG90ZW50LCB3ZWFrbHktb3JkZXJlZCBNYWluIE1lbW9yeQo+ICsg
KiAgMTAgLSBJTyAgICAgTm9uLWNhY2hlYWJsZSwgbm9uLWlkZW1wb3RlbnQsIHN0cm9uZ2x5LW9y
ZGVyZWQgSS9PIAo+IG1lbW9yeQo+ICsgKiAgMTEgLSBSc3ZkICAgUmVzZXJ2ZWQgZm9yIGZ1dHVy
ZSBzdGFuZGFyZCB1c2UKPiArICovCj4gKyNkZWZpbmUgX1BBR0VfTVRfTUFTSwkJKCh1NjQpMHgz
IDw8IDYxKQo+ICsjZGVmaW5lIF9QQUdFX01UX1BNQQkJKCh1NjQpMHgwIDw8IDYxKQo+ICsjZGVm
aW5lIF9QQUdFX01UX05DCQkoKHU2NCkweDEgPDwgNjEpCj4gKyNkZWZpbmUgX1BBR0VfTVRfSU8J
CSgodTY0KTB4MiA8PCA2MSkKPiArCgpJdCdkIGJlIGNsZWFuZXIgSU1ITyBpZiB5b3UgZGVmaW5l
ZCBfUEFHRV9NVF9NQVNLIGFzIChfUEFHRV9NVF9QTUEgfCAKX1BBR0VfTVRfTkMgfCBfUEFHRV9N
VF9JTyksIGxpa2Ugb3RoZXIgbWFza3MgYXJlIGRlZmluZWQgKGUuZy4gCl9QQUdFX0NIR19NQVNL
IG9uIHRoZSBzYW1lIGZpbGUpLiBJIGFsc28gc3VnZ2VzdCB5b3UgdXNlIHVuc2lnbmVkIGxvbmcg
Cmluc3RlYWQgb2YgdTY0IGZvciBjb25zaXN0ZW5jeS4KCj4gK2VudW0gewo+ICsJTVRfUE1BLAo+
ICsJTVRfTkMsCj4gKwlNVF9JTywKPiArCU1UX01BWAo+ICt9Owo+ICsKPiArZXh0ZXJuIHN0cnVj
dCBfX3Jpc2N2X3N2cGJtdF9zdHJ1Y3Qgewo+ICsJdW5zaWduZWQgbG9uZyBtYXNrOwo+ICsJdW5z
aWduZWQgbG9uZyBtdFtNVF9NQVhdOwo+ICt9IF9fcmlzY3Zfc3ZwYm10Owo+ICsKPiArI2RlZmlu
ZSBfUEFHRV9ETUFfTUFTSwkJX19yaXNjdl9zdnBibXQubWFzawo+ICsjZGVmaW5lIF9QQUdFX0RN
QV9QTUEJCV9fcmlzY3Zfc3ZwYm10Lm10W01UX1BNQV0KPiArI2RlZmluZSBfUEFHRV9ETUFfTkMJ
CV9fcmlzY3Zfc3ZwYm10Lm10W01UX05DXQo+ICsjZGVmaW5lIF9QQUdFX0RNQV9JTwkJX19yaXNj
dl9zdnBibXQubXRbTVRfSU9dCj4gKyNlbHNlCj4gKyNkZWZpbmUgX1BBR0VfRE1BX01BU0sJCTAK
PiArI2RlZmluZSBfUEFHRV9ETUFfUE1BCQkwCj4gKyNkZWZpbmUgX1BBR0VfRE1BX05DCQkwCj4g
KyNkZWZpbmUgX1BBR0VfRE1BX0lPCQkwCj4gKyNlbmRpZiAvKiBDT05GSUdfNjRCSVQgKi8KPiAr
I2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+ICsKPiAgI2RlZmluZSBfUEFHRV9TUEVDSUFMICAg
X1BBR0VfU09GVAo+ICAjZGVmaW5lIF9QQUdFX1RBQkxFICAgICBfUEFHRV9QUkVTRU5UCj4gCgpU
aGlzIHN0cnVjdCBpcyBub3QgdXNlZnVsIGFzIHBhcnQgb2YgZW5hYmxpbmcgdGhlIHN0YW5kYXJk
IFN2cGJtdCAKZXh0ZW5zaW9uIG9uIExpbnV4LCB3ZSBjYW4gc2V0IF9QQUdFX0RNQV8qIG1hY3Jv
cyBkaXJlY3RseSBvbiB0aGlzIHBhdGNoIAphbmQgaW50cm9kdWNlIHRoZSBzdHJ1Y3QgYXBwcm9h
Y2ggbGF0ZXIgb24sIHdoZW4gd2UgYWxzbyBkZWZpbmUgCmFsdGVybmF0aXZlIHZhbHVlcyBmb3Ig
X1BBR0VfRE1BXyogZmxhZ3MuIEFsc28gdG8gc29tZW9uZSByZWFkaW5nIHRoZSAKY29kZSB0aGUg
c3RydWN0IGRvZXNuJ3QgbWFrZSBzZW5zZSB3aXRob3V0IHNvbWUgZG9jdW1lbnRhdGlvbiBvbiB3
aHkgCml0J3MgbmVlZGVkLiBGaW5hbGx5IHdoeSB0aGUgZW51bSAvIGFycmF5ID8gV2h5IG5vdCBq
dXN0IGhhdmUgZGlmZmVyZW50IApmaWVsZHMgb24gdGhlIHN0cnVjdCA/Cgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAKPiBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggMzliNTUwMzEwZWM2Li5kMDdiYTU4NmM4NjYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IEBAIC0xMzYsNyArMTM2LDggQEAKPiAgCQkJCXwg
X1BBR0VfUFJFU0VOVCBcCj4gIAkJCQl8IF9QQUdFX0FDQ0VTU0VEIFwKPiAgCQkJCXwgX1BBR0Vf
RElSVFkgXAo+IC0JCQkJfCBfUEFHRV9HTE9CQUwpCj4gKwkJCQl8IF9QQUdFX0dMT0JBTCBcCj4g
KwkJCQl8IF9QQUdFX0RNQV9QTUEpCj4gCgpUaGF0J3MgYSBiaXQgbWlzbGVhZGluZywgaXQncyBs
aWtlIG1hcmtpbmcgdGhlIGtlcm5lbCBwYWdlcyBhcyBETUFhYmxlLgoKLS8qCi0gKiBUaGUgUklT
Qy1WIElTQSBkb2Vzbid0IHlldCBzcGVjaWZ5IGhvdyB0byBxdWVyeSBvciBtb2RpZnkgUE1Bcywg
c28gCndlIGNhbid0Ci0gKiBjaGFuZ2UgdGhlIHByb3BlcnRpZXMgb2YgbWVtb3J5IHJlZ2lvbnMu
Ci0gKi8KLSNkZWZpbmUgX1BBR0VfSU9SRU1BUCBfUEFHRV9LRVJORUwKKyNkZWZpbmUgX1BBR0Vf
SU9SRU1BUCAgICAoKF9QQUdFX0tFUk5FTCAmIH5fUEFHRV9ETUFfTUFTSykgfCAKX1BBR0VfRE1B
X0lPKQorCisjZGVmaW5lIFBBR0VfSU9SRU1BUCAgICAgICAgX19wZ3Byb3QoX1BBR0VfSU9SRU1B
UCkKClRoaXMgaXNuJ3QgdXNlZCBhbnl3aGVyZS4KCkBAIC00OTAsNiArNDg5LDI4IEBAIHN0YXRp
YyBpbmxpbmUgaW50IHB0ZXBfY2xlYXJfZmx1c2hfeW91bmcoc3RydWN0IAp2bV9hcmVhX3N0cnVj
dCAqdm1hLAogICAgICByZXR1cm4gcHRlcF90ZXN0X2FuZF9jbGVhcl95b3VuZyh2bWEsIGFkZHJl
c3MsIHB0ZXApOwogIH0KCisjZGVmaW5lIHBncHJvdF9ub25jYWNoZWQgcGdwcm90X25vbmNhY2hl
ZAorc3RhdGljIGlubGluZSBwZ3Byb3RfdCBwZ3Byb3Rfbm9uY2FjaGVkKHBncHJvdF90IF9wcm90
KQoreworICAgIHVuc2lnbmVkIGxvbmcgcHJvdCA9IHBncHJvdF92YWwoX3Byb3QpOworCisgICAg
cHJvdCAmPSB+X1BBR0VfRE1BX01BU0s7CisgICAgcHJvdCB8PSBfUEFHRV9ETUFfSU87CisKKyAg
ICByZXR1cm4gX19wZ3Byb3QocHJvdCk7Cit9CisKKyNkZWZpbmUgcGdwcm90X3dyaXRlY29tYmlu
ZSBwZ3Byb3Rfd3JpdGVjb21iaW5lCitzdGF0aWMgaW5saW5lIHBncHJvdF90IHBncHJvdF93cml0
ZWNvbWJpbmUocGdwcm90X3QgX3Byb3QpCit7CisgICAgdW5zaWduZWQgbG9uZyBwcm90ID0gcGdw
cm90X3ZhbChfcHJvdCk7CisKKyAgICBwcm90ICY9IH5fUEFHRV9ETUFfTUFTSzsKKyAgICBwcm90
IHw9IF9QQUdFX0RNQV9OQzsKKworICAgIHJldHVybiBfX3BncHJvdChwcm90KTsKK30KKwoKV2Ug
YWxzbyBoYXZlIHRoZSBJTyB0eXBlLCB3ZSBzaG91bGQgYWxzbyBkZWZpbmUgcGdwcm90X2Rldmlj
ZSB0byBhbHNvIAplbnN1cmUgb3JkZXJpbmcsIG9yIGVsc2UgaXQnbGwgZmFsbGJhY2sgdG8gcGdw
cm90X25vbmNhY2hlZCwgd2hpY2ggaW4gCm91ciBjYXNlIHdvbid0IHdvcmsgd2VsbCBkdWUgdG8g
UlZXTU86Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvaW5j
bHVkZS9saW51eC9wZ3RhYmxlLmgjTDkzMAoKK3ZvaWQgX19pbml0IHJpc2N2X3N2cGJtdCh2b2lk
KQoreworI2lmZGVmIENPTkZJR182NEJJVAorICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZTsK
KyAgICBjb25zdCBjaGFyICpzdHI7CisKKyAgICBmb3JfZWFjaF9vZl9jcHVfbm9kZShub2RlKSB7
CisgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhub2RlLCAibW11LXR5cGUiLCAm
c3RyKSkgeworICAgICAgICAgICAgY29udGludWU7CisgICAgICAgIH0KKworICAgICAgICBpZiAo
IXN0cm5jbXAoc3RyICsgMTEsICJzdnBibXQiLCA2KSkgeworICAgICAgICAgICAgX19yaXNjdl9z
dnBibXQubWFzayAgICAgID0gX1BBR0VfTVRfTUFTSzsKKyAgICAgICAgICAgIF9fcmlzY3Zfc3Zw
Ym10Lm10W01UX1BNQV0gPSBfUEFHRV9NVF9QTUE7CisgICAgICAgICAgICBfX3Jpc2N2X3N2cGJt
dC5tdFtNVF9OQ10gID0gX1BBR0VfTVRfTkM7CisgICAgICAgICAgICBfX3Jpc2N2X3N2cGJtdC5t
dFtNVF9JT10gID0gX1BBR0VfTVRfSU87CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQor
ICAgIH0KKyNlbmRpZgorfQoKWW91IGJyZWFrOyBoZXJlIHRoZSBmaXJzdCB0aW1lIHlvdSBmaW5k
IGEgY3B1IG5vZGUgd2l0aCBzdnBibXQgZW5hYmxlZCwgCnNob3VsZG4ndCB3ZSBtYWtlIHN1cmUg
dGhhdCBhbGwgdXNlZCBjcHUgbm9kZXMgc3VwcG9ydCBzdnBibXQgYmVmb3JlIAp1c2luZyB0aGUg
ZXh0ZW5zaW9uID8KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
