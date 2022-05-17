Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AEFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 11:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zAV6a8Xwxs+fksOtT/KDYzMFDgg+iNqNpsMlW7jI86c=; b=ZHOUeX8kn/1chJ
	vCpYys2gsku0cM81GNO3x7FzeN45lcbjBtqfhY/+IeyOdikWcrQis55e8H2I6cjczW60+iX3OZDr9
	3qrLlEpakgZBHwjwWurF8YAglZRE1sqEjqypmzo1jsm0OW7C16nmcKr51jzCr1hw92o7vnCCpr4Ce
	PQBVVOdX4h2RyLIsu7pTQ4vL9o5XfcM3FY2wPpail9OPkSMxhPS/4irs7ur7g9LOJRVuUHZUHJzBr
	l/ka2gBIcp3F7qrYsvwwsT9I20TsE+gyTj/2p/F/QxGAE1tLf7h4w34uqzgePQ9i4ixTAQkzwzF4Y
	C9+IJSNBu6D73210rofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqv3f-00DHOW-9R; Tue, 17 May 2022 11:08:07 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqv3c-00DHH8-HO
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 11:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652785684; x=1684321684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4a5Pg6xld+sAqm+8eEi4A+uUzEUIc3jgurKLQWcWFCY=;
 b=C4wfyTt0MbWyw3Uc8W4FQMEaf8mbpJKHPvAOsxqbRiDmbiDU9HwE2VFB
 g/Qr1YtRqtoAnMnil0Eu4PHzouezagjy7EIj6pss7kFijw19mFkKV1C0R
 FncuAzrm26fH5YKHKeNfxJWRE5LnEyOub16za8f13XJKukUCQyQHKZiie
 LrkpL4cr4bbja6r/7D8OXpcVHzUuVRhz1tWjqeWNKiDpWMp0tb20hJKDR
 FbzTpmAMWAY1R0gt9CpdUGeXKW4my/F/hLgpnt23hJZuiPNlI0O7bGfaC
 Uvt7xvPPEGDFajTdGrq3+friIgLyPp3H596Qbol2O4hB9wR/vG7Xm5xqq g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="296422422"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="296422422"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 04:07:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="568830858"
Received: from mtarral-mobl.ger.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.252.52.88])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 04:07:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/9] tty/serial: Termios flag fixes
Date: Tue, 17 May 2022 14:07:28 +0300
Message-Id: <20220517110737.37148-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_040804_663290_FA0D505B 
X-CRM114-Status: UNSURE (   8.71  )
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

SGVyZSBhcmUgYSBmZXcgdGVybWlvcyBmbGFnIGZpeGVzLCBtb3N0bHkgQ1NJWkUgYnV0IGEgZmV3
IG90aGVyIGZsYWdzCmFzIHdlbGwuIFRoZSBmaXhlZCBmbGFncyByZXR1cm5lZCB0byB1c2Vyc3Bh
Y2Ugc2hvdWxkIG5vdyBtYXRjaCB0byB3aGF0CnRoZSBkcml2ZXIgaXMgdXNpbmcuIEluY29ycmVj
dCBDU0laRSBhbHNvIGNhdXNlcyBhIG1pc2NhbGN1bGF0aW9uIG9mCnRpbWVvdXQgaW4gc2VyaWFs
IGNvcmUgKGJ1dCBpdCBtaWdodCBub3QgYmUgYSBodWdlIHByb2JsZW0gYmVpbmcganVzdAphIGhh
bmR3YXZ5IGxvbmcgdGltZW91dCkuCgpJbHBvIErDpHJ2aW5lbiAoOSk6CiAgc2VyaWFsOiB1YXJ0
bGluZTogRml4IEJSS0lOVCBjbGVhcmluZwogIHNlcmlhbDogZGlnaWNvbG9yLXVzYXJ0OiBEb24n
dCBhbGxvdyBDUzUtNgogIHNlcmlhbDogcmRhLXVhcnQ6IERvbid0IGFsbG93IENTNS02CiAgc2Vy
aWFsOiB0eHg5OiBEb24ndCBhbGxvdyBDUzUtNgogIHNlcmlhbDogc2gtc2NpOiBEb24ndCBhbGxv
dyBDUzUtNgogIHNlcmlhbDogc2lmaXZlOiBTYW5pdGl6ZSBDU0laRSBhbmQgY19pZmxhZwogIHNl
cmlhbDogc3QtYXNjOiBTYW5pdGl6ZSBDU0laRSBhbmQgY29ycmVjdCBQQVJFTkIgZm9yIENTNwog
IHNlcmlhbDogc3RtMzItdXNhcnQ6IENvcnJlY3QgQ1NJWkUsIGJpdHMsIGFuZCBwYXJpdHkKICBw
Y21jaWE6IHN5bmNsaW5rX2NzOiBEb24ndCBhbGxvdyBDUzUtNgoKIGRyaXZlcnMvY2hhci9wY21j
aWEvc3luY2xpbmtfY3MuYyAgICB8ICA2ICsrKysrLQogZHJpdmVycy90dHkvc2VyaWFsL2RpZ2lj
b2xvci11c2FydC5jIHwgIDIgKysKIGRyaXZlcnMvdHR5L3NlcmlhbC9yZGEtdWFydC5jICAgICAg
ICB8ICAyICsrCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX3R4eDkuYyAgICAgfCAgMiArKwog
ZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jICAgICAgICAgIHwgIDYgKysrKystCiBkcml2ZXJz
L3R0eS9zZXJpYWwvc2lmaXZlLmMgICAgICAgICAgfCAgNiArKysrKy0KIGRyaXZlcnMvdHR5L3Nl
cmlhbC9zdC1hc2MuYyAgICAgICAgICB8ICA0ICsrKysKIGRyaXZlcnMvdHR5L3NlcmlhbC9zdG0z
Mi11c2FydC5jICAgICB8IDE1ICsrKysrKysrKysrKy0tLQogZHJpdmVycy90dHkvc2VyaWFsL3Vh
cnRsaXRlLmMgICAgICAgIHwgIDMgKystCiA5IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCgotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
