Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1682AC61DE8
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 20:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j/1TEfDHszQgwIQ9pvzNIOqzqxtyTUxiAa7YI7c6mAQ=; b=o7gp39Lq3AbRbt
	vL2h6M9PTFIjUHotlls+u4avHYf1rPJeP7OZzi/pb5K3BL2xtf5j53QmysxKcbYIautRFHcwCF0cg
	6eIDNOdu5tK7PZcG+6Ek3/SgpfA6YTYjuFGffJIQoIV+mOAx7cj3TBKGxrNscZEUYRgWXqSqt4cui
	cT4xeh93oRCT4K0vaqxfX1oej6kqDODK53XY18lGsxThBwIwKzjYHtM9XG2P0CwoAx6QjA6Y/XN16
	+hvpC99VRZZ7W7Eh45STKTeyrqS1pUxNvUF20/2jVVSlXe24EMopeTMo0rDDjp2Vrct3laeg5Z2pF
	wan7dbLNCDRJ+eKCJb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0mWC-000000085Jc-32g3;
	Sun, 30 Aug 2026 20:52:44 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0mWA-000000085JH-0TZN
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 20:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=Vi9/2T/HEIiA1kXPJ5Aifd2KfnGzYJRS9bTtPPU2i1Q=; b=sCP10NAlfiOO7/35vImC/QBmzF
	MNVSsNiTEX04DPRVbWRhbVmbVa+p0W/w2WkblpWW/PXu2+8FFL9D+YY1l4lAG+VdDYm7v/nqMR4+c
	7ucUkJxmddCIxi3hg10byruRBeyNMd10nqTVmZblbSQUrx/uI23IjgHhiUvN6T5ROl9ez1z2iaxO1
	8+ru2oGyXm0m19cV2oXWzByTi1LOfFu2gg4q9x0dlW34WSVNac92aqEQRzdZO4RZ+T8di0S/5LJqQ
	tlx+cd3805wbjsIK4GJZzrBotMDtbPR1vN+THFM//kPHBtRJvoF8zNuaPgCVjQk7+FThnfyI9Zn4L
	ZbfDm3QQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0mW7-0000000ANuY-2oP0;
	Sun, 30 Aug 2026 22:52:39 +0200
Date: Sun, 30 Aug 2026 22:52:39 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: spacemit@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Subject: Random corruption on SpacemiT K1 with RVV and THP
Message-ID: <apSYF5x1Tu7PlyL1@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_135242_159691_D137CFF0 
X-CRM114-Status: GOOD (  11.01  )
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

RGVhciBhbGwsCgpGb3IgdGhlIGxhc3Qgd2Vla3MsIEkgaGF2ZSBiZWVuIHRyYWNraW5nIGEgcmFu
ZG9tIG1lbW9yeSBjb3JydXB0aW9uIGFuZApyZWxhdGl2ZWx5IHJhcmUgb24gU3BhY2VtaVQgSzEg
KEJhbmFuYSBQaSBGMyBhbmQgTWlsay1WIEp1cGl0ZXIpLiBJdCAKc3RhcnRlZCB1cGdyYWRpbmcg
dG8gZ2xpYmMgMi40Mywgd2hpY2ggZG9lcyBtZW1zZXQoKSB0aHJvdWdoIHZlY3RvciAKaW5zdHJ1
Y3Rpb25zLiAgSXQgaXMgcmVwcm9kdWNpYmxlIHVzaW5nIHRoZSBEZWJpYW4gNy4xLjctMX5icG8x
MysxIAprZXJuZWwsIGJ1dCBJIGhhdmUgYWxzbyBiZWVuIGFibGUgdG8gcmVwcm9kdWNlIGl0IHdp
dGggYSB2YW5pbGxhIDcuMi4yIAprZXJuZWwsIHVzaW5nIGEgc2ltaWxhciBjb25maWd1cmF0aW9u
IHRvIHRoZSBEZWJpYW4ga2VybmVsLiBUaGUgYm9hcmQgCnVzZXMgT3BlblNCSSAxLjkgYW5kIHRo
ZSB2ZW5kb3IgVS1Cb290LgoKVHlwaWNhbGx5IGl0IG1hbmlmZXN0cyBpdHNlbGYgd2l0aCB0aGUg
Zm9sbG93aW5nIGtpbmQgb2YgZXJyb3IsIHdoZW4gCnJ1bm5pbmcgZysrIGZyb20gR0NDIDE2IGFz
IHBhcnQgb2YgYnVpbGRpbmcgc29mdHdhcmUgKGUuZy4gT3BlbkpESywgCkJsZW5kZXIsIERvbGZp
biwgUXQ2KTogICAKCkFzc2VtYmxlciBtZXNzYWdlczoKe3N0YW5kYXJkIGlucHV0fToyODQ1ODg6
IEVycm9yOiB1bmtub3duIHBzZXVkby1vcDogYC51bGViMScKe3N0YW5kYXJkIGlucHV0fToyODQ1
ODg6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlIGDDv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/D
v8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/
w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/D
v8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/
w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/Dv8O/w7/D
v8O/w7/Dv8O/w7/Dv8O/dmw4NzQnCgpUaGUgYnJva2VuIGNoYXJzIGFyZSAweGZmIGFuZCBpdCBz
ZWVtcyB0aGVyZSBhcmUgYWx3YXlzIDI0MCAoYnV0IHdpdGggCnBvb3Igc3RhdGlzdGljcykuIFNv
bWV0aW1lcyBpdCBpbnN0ZWFkIGNhdXNlcyBhIEdDQyBJQ0UgaW5zdGVhZC4KClVzaW5nIGdsaWJj
IDIuNDQgaW5zdGVhZCBvZiBnbGliYyAyLjQzLCB3aGljaCBkb2VzIGEgbG90IG9mIHN0cmluZyAK
b3BlcmF0aW9ucyB0aHJvdWdoIHZlY3RvciBpbnN0cnVjdGlvbnMsIGluY3JlYXNlcyB0aGUgcHJv
YmFiaWxpdHkgdG8gCmhhdmUgY29ycnVwdGlvbiwgbWFrZXMgaXQgYSBiaXQgbW9yZSByZXByb2R1
Y2libGUsIGJ1dCBpdCBhbHdheXMgc2VlbXMgCnRvIG1hbmlmZXN0IGFzIGEgR0NDIElDRS4gSXQg
dHlwaWNhbGx5IGhhcHBlbnMgd2l0aGluZyBvbmUgaG91ciB3aGVuIApydW5uaW5nIG9uIHRoZSA4
IGNvcmVzIGluc3RlYWQgb2YgZXZlcnkgMSBvciAyIGRheXMuIEZyb20gdGhlcmUgSSBoYXZlIApi
ZWVuIGFibGUgdG8gZGV0ZXJtaW5lIHRoZSBmb2xsb3dpbmcgdGhpbmdzOgoKLSBEaXNhYmxpbmcg
dmVjdG9yIGluc3RydWN0aW9ucyAoYnkgcGF0Y2hpbmcgdGhlIERUQiB0byByZW1vdmUgInYiLCAK
ICAienZoZiIgYW5kICJ6dnRrIikgZml4ZXMgdGhlIGlzc3VlCgotIERpc2FibGluZyBUSFAgKGJ5
IHNldHRpbmcgL3N5cy9rZXJuZWwvbW0vdHJhbnNwYXJlbnRfaHVnZXBhZ2UvZW5hYmxlZCAKICB0
byBuZXZlciBpbnN0ZWFkIG9mIGFsd2F5cykgYWxzbyBzZWVtcyB0byBmaXggdGhlIGlzc3VlLiBL
ZWVwaW5nIGl0IAogIGVuYWJsZWQgd2l0aCBkZWZyYWc9bmV2ZXIgb3IgdXNlX3plcm9fcGFnZT0w
IGRvZXNuJ3QgY2hhbmdlIGFueXRoaW5nLgoKLSBUaGUgaXNzdWUgaXMgcmVwcm9kdWNpYmxlIHdp
dGggb3Igd2l0aG91dCBzd2FwIGVuYWJsZWQuCgpJIGhhdmUgbm90IGJlZW4gYWJsZSB0byByZXBy
b2R1Y2UgdGhlIGlzc3VlIG9uIG90aGVyIG5vbiBSVlYgYm9hcmRzIAooVW5tYXRjaGVkLCBWRjIp
IG5vciBvbiBhIFNwYWNlbWlUIEszIGJvYXJkLgoKSSBhbSBub3QgcmVhbGx5IHN1cmUgaG93IHRv
IGRlYnVnIHRoYXQgZnVydGhlci4gSSB0cmllZCBhIGZldyB3YXlzIHRvIApyZXByb2R1Y2UgdGhl
IGlzc3VlIHdpdGggYSBzbWFsbCBDIGNvZGUgYXJvdW5kIHRoZSBnbGliYyBtZW1zZXQgY29kZSAK
KGluY2x1ZGluZyB0cmlnZ2VyaW5nIHVuYWxpZ25lZCBhY2Nlc3NlcyBhbmQgcGFnZSBmYXVsdHMp
LCBidXQgZmFpbGVkIHRvIApkbyBzby4gSSB0aGVyZWZvcmUgd2VsY29tZSBhbnkgaWRlYSBhYm91
dCB0aGUgaXNzdWUgb3IgaG93IHRvIGRlYnVnIGl0IApmdXJ0aGVyLgoKVGhhbmtzCkF1cmVsaWVu
CgotLSAKQXVyZWxpZW4gSmFybm8gICAgICAgICAgICAgICAgICAgICAgICAgIEdQRzogNDA5NlIv
MURERDhDOUIKYXVyZWxpZW5AYXVyZWwzMi5uZXQgICAgICAgICAgICAgICAgICAgICBodHRwOi8v
YXVyZWwzMi5uZXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
