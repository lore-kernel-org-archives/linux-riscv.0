Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C03C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 15:55:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931CE20896
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 15:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="owoDLWAz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931CE20896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnxjVh306PjnmcbGTDBsGBw6lMmzqGGQ/NWtoKGw3hk=; b=owoDLWAzqnZ8aS
	aIbHc1eGAWwsgf+tg+UdWDbhYxupC7XiC21GwHUbkLw4Ck0tznLvTEzCJT0KCDQkfAbUiUNG6F8AG
	okIVtHt44ODNFn1ERgEw3Aoc0uh//o4ED0gdDJip8Wib4rnhoKlICkUSASJ+OgDHO1ANgt5zj6WPy
	kKWPS8YsfGQ3UgMoW3e0fxARuWHKOHQKR1zxq/A+ZklvIYr+SNvWX4p+htk9gMgrXwW23IFdlKhUi
	2o7OdMF99vGN3l5LrbBjJyzxabWsYdLOFWK7BALM1gCSz19RaM+KGcKlUjRYREdfiozNPNQTcexsh
	sQ1097OZb6pl2/IYrFgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8RwG-0001yB-5f; Mon, 25 Mar 2019 15:55:04 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8RwB-0001VE-T2
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 15:55:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9FB75AE0A;
 Mon, 25 Mar 2019 15:54:54 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v11 0/2] PWM support for HiFive Unleashed
References: <1553508779-9685-1-git-send-email-yash.shah@sifive.com>
X-Yow: Actually, what I'd like is a little toy spaceship!!
Date: Mon, 25 Mar 2019 16:54:53 +0100
In-Reply-To: <1553508779-9685-1-git-send-email-yash.shah@sifive.com> (Yash
 Shah's message of "Mon, 25 Mar 2019 15:42:57 +0530")
Message-ID: <mvmbm1zueya.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_085500_086267_FDC77E18 
X-CRM114-Status: GOOD (  12.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 sachin.ghadi@sifive.com, thierry.reding@gmail.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTcOkciAyNSAyMDE5LCBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29tPiB3cm90ZToK
Cj4gdjExCj4gLSBDaGFuZ2UgbmFtaW5nIGNvbnZlbnRpb24gZm9yIHB3bV9kZXZpY2UgYW5kIHB3
bV9zaWZpdmVfZGRhdGEgcG9pbnRlcnMKPiAtIEFzc2lnbiBvZl9wd21feGxhdGVfd2l0aF9mbGFn
KCkgdG8gb2ZfeGxhdGUgZnVuYyBwdHIgc2luY2UgdGhpcyBkcml2ZXIKPiAgIHVzZSB0aHJlZSBw
d20tY2VsbHMgKElzc3VlIHJlcG9ydGVkIGJ5IEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAc3VzZS5k
ZT4KPiAtIE90aGVyIG1pbm9yIGZpeGVzCgpJIHN0aWxsIGRvbid0IHNlZSBhbnkgaW1wcm92ZW1l
bnQuICBGWUksIHRoaXMgaXMgdGhlIHBhdGNoIEkgdXNlIGZvciB0aGUKZGV2aWNlIHRyZWU6Cgpk
aWZmIC0tZ2l0IGEvZnNibC91eDAwX2ZzYmwuZHRzIGIvZnNibC91eDAwX2ZzYmwuZHRzCmluZGV4
IGYyN2NjMjIuLjU2ZTk0YzAgMTAwNjQ0Ci0tLSBhL2ZzYmwvdXgwMF9mc2JsLmR0cworKysgYi9m
c2JsL3V4MDBfZnNibC5kdHMKQEAgLTQzMiw3ICs0MzIsNyBAQAogCQkJcmVnLW5hbWVzID0gImNv
bnRyb2wiOwogCQkJY2xvY2tzID0gPCZ0bGNsaz47CiAJCQlzaWZpdmUsYXBwcm94LXBlcmlvZCA9
IDwxMDAwMDAwPjsKLQkJCSNwd20tY2VsbHMgPSA8Mj47CisJCQkjcHdtLWNlbGxzID0gPDM+Owog
CQl9OwogCQlMNDY6IHB3bUAxMDAyMTAwMCB7CiAJCQljb21wYXRpYmxlID0gInNpZml2ZSxwd20w
IjsKQEAgLTQ0Miw0NiArNDQyLDQ2IEBACiAJCQlyZWctbmFtZXMgPSAiY29udHJvbCI7CiAJCQlj
bG9ja3MgPSA8JnRsY2xrPjsKIAkJCXNpZml2ZSxhcHByb3gtcGVyaW9kID0gPDEwMDAwMDA+Owot
CQkJI3B3bS1jZWxscyA9IDwyPjsKKwkJCSNwd20tY2VsbHMgPSA8Mz47CiAJCX07CiAJCXB3bWxl
ZHMgewogCQkJY29tcGF0aWJsZSA9ICJwd20tbGVkcyI7CiAJCQloZWFydGJlYXQgewotCQkJCXB3
bXMgPSA8Jkw0NSAwIDA+OworCQkJCXB3bXMgPSA8Jkw0NSAwIDEwMDAwMDAgMD47CiAJCQkJbWF4
LWJyaWdodG5lc3MgPSA8MjU1PjsKIAkJCQlsaW51eCxkZWZhdWx0LXRyaWdnZXIgPSAiaGVhcnRi
ZWF0IjsKIAkJCX07CiAJCQltdGQgewotCQkJCXB3bXMgPSA8Jkw0NSAxIDA+OworCQkJCXB3bXMg
PSA8Jkw0NSAxIDEwMDAwMDAgMD47CiAJCQkJbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKIAkJCQls
aW51eCxkZWZhdWx0LXRyaWdnZXIgPSAibXRkIjsKIAkJCX07CiAJCQluZXRkZXYgewotCQkJCXB3
bXMgPSA8Jkw0NSAyIDA+OworCQkJCXB3bXMgPSA8Jkw0NSAyIDEwMDAwMDAgMD47CiAJCQkJbWF4
LWJyaWdodG5lc3MgPSA8MjU1PjsKIAkJCQlsaW51eCxkZWZhdWx0LXRyaWdnZXIgPSAibmV0ZGV2
IjsKIAkJCX07CiAJCQlwYW5pYyB7Ci0JCQkJcHdtcyA9IDwmTDQ1IDMgMD47CisJCQkJcHdtcyA9
IDwmTDQ1IDMgMTAwMDAwMCAwPjsKIAkJCQltYXgtYnJpZ2h0bmVzcyA9IDwyNTU+OwogCQkJCWxp
bnV4LGRlZmF1bHQtdHJpZ2dlciA9ICJwYW5pYyI7CiAJCQl9OwogCQkJLyogVGhlc2UgTEVEcyBh
cmUgb24gdGhlIHRlc3RlciBib2FyZCAqLwogLyoKIAkJCXRlc3RsZWQgewotCQkJCXB3bXMgPSA8
Jkw0NiAwIDA+OworCQkJCXB3bXMgPSA8Jkw0NiAwIDEwMDAwMDAgMD47CiAJCQkJbWF4LWJyaWdo
dG5lc3MgPSA8MjU1PjsKIAkJCX07CiAJCQlncmVlbiB7Ci0JCQkJcHdtcyA9IDwmTDQ2IDEgMD47
CisJCQkJcHdtcyA9IDwmTDQ2IDEgMTAwMDAwMCAwPjsKIAkJCQltYXgtYnJpZ2h0bmVzcyA9IDwy
NTU+OwogCQkJfTsKIAkJCXJlZCB7Ci0JCQkJcHdtcyA9IDwmTDQ2IDIgMD47CisJCQkJcHdtcyA9
IDwmTDQ2IDIgMTAwMDAwMCAwPjsKIAkJCQltYXgtYnJpZ2h0bmVzcyA9IDwyNTU+OwogCQkJfTsK
IAkJCWJsdWUgewotCQkJCXB3bXMgPSA8Jkw0NiAzIDA+OworCQkJCXB3bXMgPSA8Jkw0NiAzIDEw
MDAwMDAgMD47CiAJCQkJbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKIAkJCX07CiAqLwotLSAKMi4y
MS4wCgoKQW5kcmVhcy4KCi0tIApBbmRyZWFzIFNjaHdhYiwgU1VTRSBMYWJzLCBzY2h3YWJAc3Vz
ZS5kZQpHUEcgS2V5IGZpbmdlcnByaW50ID0gMDE5NiBCQUQ4IDFDRTkgMTk3MCBGNEJFICAxNzQ4
IEU0RDQgODhFMyAwRUVBIEI5RDcKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRp
ZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
