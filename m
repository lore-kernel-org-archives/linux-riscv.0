Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E03C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 11:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uTWEw2hY/QDzg1TX3bcy30vAQfMIQbfT4IcYBkOca9M=; b=l+Z9JaNwx5ohHw
	161dHWZpvddDvVk+jj4ODv8kW0PotRVW68ykTibRUvNC8Iz51COzzgr7G+1wSB0Akb9R2IYAhzTik
	blDtGW3BAdUxJU2nb13sx8dap1Thn2/mmFXbc1d+sXR4eBVJxVYeSraTKgblfI7cAn2RH7NfdSpJd
	AUzd5l42CjwdMtaIxuuxDWVHi/31Ezlx0u6hdf/9RNkMCvcspbnPmM7msn0hS2UoDLsAaCkNNpUUK
	kLyT1xZrxiyiU7MiDwNmSYbBcDLM0ecU7IdmrVzoOhPDP3w0wb3Fl0DiS62vKnl1K9LkAH2vxS+Ju
	+99FY1DQB3+uBw8sn/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69gJ-005zhm-Ej; Tue, 28 Jun 2022 11:46:59 +0000
Received: from forward105p.mail.yandex.net ([77.88.28.108])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69g4-005zc0-Sk; Tue, 28 Jun 2022 11:46:48 +0000
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
	by forward105p.mail.yandex.net (Yandex) with ESMTP id 10FC62FD96EB;
	Tue, 28 Jun 2022 14:46:35 +0300 (MSK)
Received: from vla1-af84b0e8a1e8.qloud-c.yandex.net (vla1-af84b0e8a1e8.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:991:0:640:af84:b0e8])
	by forward100q.mail.yandex.net (Yandex) with ESMTP id 0B7C56F40B16;
	Tue, 28 Jun 2022 14:46:35 +0300 (MSK)
Received: from vla3-178a3f795968.qloud-c.yandex.net (vla3-178a3f795968.qloud-c.yandex.net [2a02:6b8:c15:2584:0:640:178a:3f79])
	by vla1-af84b0e8a1e8.qloud-c.yandex.net (mxback/Yandex) with ESMTP id TR9ypVqcip-kXfqs477;
	Tue, 28 Jun 2022 14:46:35 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1656416795;
	bh=KmAhe3GOyQCf3f/h40/f2dj9cqeEBZpz3rTHjKTlv1g=;
	h=Date:Subject:Cc:To:From:Message-Id;
	b=ie+vRnDuLEVcB3Leq2RJql7tFz8orUklnEO1RQQVkpZgB1NvgMxDqT8OOjwuzlJ7V
	 vEHfzMwgts0oBX26/NmR5WkPi90VbAXLOE3cDq3XRr2mVO3nAAXYSF04cCYtkcRkRM
	 Qio3zqOQ9qOYPvsfCeuVykXpMqwb+x87Rc5jY+CU=
Authentication-Results: vla1-af84b0e8a1e8.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla3-178a3f795968.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id s5dKAuvn1y-kVMCLslW;
	Tue, 28 Jun 2022 14:46:32 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: linux@yadro.com,
	Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anup Patel <anup@brainfault.org>,
	Jiri Olsa <jolsa@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [PATCH v5 0/4] RISC-V: Create unique identification for SoC PMU
Date: Tue, 28 Jun 2022 14:45:54 +0300
Message-Id: <20220628114625.166665-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_044646_070158_7897791C 
X-CRM114-Status: GOOD (  10.27  )
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

RnJvbTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgoKRnJvbTogTmlraXRhIFNo
dWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgoKVGhpcyBzZXJpZXMgYWltcyB0byBwcm92aWRlIG1h
dGNoaW5nIHZlbmRvciBTb0Mgd2l0aCBjb3JyZXNwb25kZWQgSlNPTiBiaW5kaW5ncy4KClRoZSBJ
RCBzdHJpbmcgaXMgcHJvcG9zZWQgdG8gYmUgaW4gZm9ybSBvZiBNVkVORE9SSUQtTUFSQ0hJRC1N
SU1QSUQsIGZvciBleGFtcGxlIApmb3IgU2lmaXZlIFVubWF0Y2hlZCB0aGUgY29ycmVzcG9uZGlu
ZyBzdHJpbmcgd2lsbCBiZToKCjB4NDg5LTB4ODAwMDAwMDAwMDAwMDAwNy0weFtbOnhkaWdpdDpd
XSssdjEsc2lmaXZlL3U3NCxjb3JlCgpXaGVyZSBNSU1QSUQgY2FuIHZhcnkgYXMgYWxsIGltcGwg
c3VwcG9ydGVkIHRoZSBzYW1lIG51bWJlciBvZiBldmVudHMsIHRoaXMgbWlnaHQgbm90IApiZSB0
cnVlIGZvciBhbGwgZnV0dXJlIFNvQyBob3dldmVyLgoKQWxzbyBhZGRlZCBTQkkgZmlybXdhcmUg
ZXZlbnRzIHByZXR0eSBuYW1lcywgYXMgYW55IGZpcm13YXJlIHRoYXQgc3VwcG9ydHMgU0JJIFBN
VSAKc2hvdWxkIGFsc28gc3VwcG9ydCBmaXJtYXJlIGV2ZW50cyBbMV0uCgpTZXJpZXMgZGVwZW5k
cyBvbiBwYXRjaCBieSBBbnVwIFBhdGVsLCBleHBvc2luZyBtdmVuZG9yLCBtYXJjaGlkIGFuZCBt
aW1waWQgCnRvICIvcHJvYy9jcHVpbmZvIiBbMl0uCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy9ibG9iL21hc3Rlci9yaXNjdi1zYmkuYWRvYwpbMl0g
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjIvNi8yMC80OTgKCkxpbmsgdG8gcHJldmlvdXMgdmVy
c2lvbjoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L2xp
c3QvP3Nlcmllcz02NTM2NDkKClNlZSBvcmlnaW5hbCBjb3ZlciBsZXR0ZXIgYnkgSm/Do28gTcOh
cmlvIERvbWluZ29zOgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
cmlzY3YvY292ZXIvMjAyMTExMTYxNTQ4MTIuMTcwMDgtMS1qb2FvLm1hcmlvQHRlY25pY28udWxp
c2JvYS5wdC8KClRlc3RlZCB3aXRoIHRoZSBmb2xsb3dpbmcgT3BlblNCSSBkZXZpY2UgdHJlZSBi
aW5kaW5nczoKCmBgYApwbXUgewoJY29tcGF0aWJsZSA9ICJyaXNjdixwbXUiOwoJcmlzY3YsZXZl
bnQtdG8tbWhwbWNvdW50ZXJzID0KCQk8MHgwMyAweDA2IDB4MTgKCQkweDEwMDAxIDB4MTAwMDIg
MHgxOAoJCTB4MTAwMDkgMHgxMDAwOSAweDE4CgkJMHgxMDAxMSAweDEwMDExIDB4MTgKCQkweDEw
MDE5IDB4MTAwMTkgMHgxOAoJCTB4MTAwMjEgMHgxMDAyMSAweDE4PjsKCXJpc2N2LGV2ZW50LXRv
LW1ocG1ldmVudCA9CgkJPDB4MDMgMHgwMDAwMDAwMCAweDE4MDEKCQkweDA0IDB4MDAwMDAwMDAg
MHgwMzAyCgkJMHgwNSAweDAwMDAwMDAwIDB4NDAwMAoJCTB4MDYgMHgwMDAwMDAwMCAweDYwMDEK
CQkweDEwMDAxIDB4MDAwMDAwMDAgMHgwMjAyCgkJMHgxMDAwMiAweDAwMDAwMDAwIDB4MDQwMgoJ
CTB4MTAwMDkgMHgwMDAwMDAwMCAweDAxMDIKCQkweDEwMDExIDB4MDAwMDAwMDAgMHgyMDAyCgkJ
MHgxMDAxOSAweDAwMDAwMDAwIDB4MTAwMgoJCTB4MTAwMjEgMHgwMDAwMDAwMCAweDA4MDI+OwoJ
cmlzY3YscmF3LWV2ZW50LXRvLW1ocG1jb3VudGVycyA9CgkJPDB4MDAwMDAwMDAgMHgwM2ZmZmYw
MCAweDAgMHgwIDB4MTgKCQkweDAwMDAwMDAwIDB4MDAwN2ZmMDEgMHgwIDB4MSAweDE4CgkJMHgw
MDAwMDAwMCAweDAwMDAzZjAyIDB4MCAweDIgMHgxOD47Cn07CmBgYAotLS0KdjQtPnY1OgpBdGlz
aCBQYXRyYToKCS0gZHJvcHBlZCBjeWNsZSwgdGltZSBpbnN0cmV0IHN0ZCBhcmNoIGV2ZW50cwoJ
LSBmb3JtYXQgY29uZmlnIGlzIG5vdyA0OC1iaXQgd2lkZQpBcm5hbGRvIENhcnZhbGhvIGRlIE1l
bG86CgktIGZpeGVkIGNwdWlkIGxlYWthZ2UKCS0gbm8gImlmIiBiZWZvcmUgZnJlZQpXaWxsIERl
YWNvbjoKCS0gc2ltcGx5IHVzZSAiY29uZmlnOjYzIgotLS0KTmlraXRhIFNodWJpbiAoNCk6CiAg
ZHJpdmVycy9wZXJmOiByaXNjdl9wbXVfc2JpOiBwZXJmIGZvcm1hdAogIHBlcmYgdG9vbHMgcmlz
Y3Y6IEFkZCBzdXBwb3J0IGZvciBnZXRfY3B1aWRfc3RyIGZ1bmN0aW9uCiAgcGVyZiBhcmNoIGV2
ZW50czogcmlzY3Ygc2JpIGZpcm13YXJlIHN0ZCBldmVudCBmaWxlcwogIHBlcmYgdmVuZG9yIGV2
ZW50cyByaXNjdjogYWRkIFNpZml2ZSBVNzQgSlNPTiBmaWxlCgogZHJpdmVycy9wZXJmL3Jpc2N2
X3BtdV9zYmkuYyAgICAgICAgICAgICAgICAgIHwgIDIwICsrKwogdG9vbHMvcGVyZi9hcmNoL3Jp
c2N2L3V0aWwvQnVpbGQgICAgICAgICAgICAgIHwgICAxICsKIHRvb2xzL3BlcmYvYXJjaC9yaXNj
di91dGlsL2hlYWRlci5jICAgICAgICAgICB8IDEwNiArKysrKysrKysrKysrKwogdG9vbHMvcGVy
Zi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YgIHwgIDE3ICsrKwogLi4uL2FyY2gv
cmlzY3YvcmlzY3Ytc2JpLWZpcm13YXJlLmpzb24gICAgICAgIHwgMTM0ICsrKysrKysrKysrKysr
KysrKwogLi4uL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9maXJtd2FyZS5qc29uICAgICAgIHwgIDY4
ICsrKysrKysrKwogLi4uL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9pbnN0cnVjdGlvbnMuanNvbiAg
IHwgIDkyICsrKysrKysrKysrKwogLi4uL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9tZW1vcnkuanNv
biAgICAgICAgIHwgIDMyICsrKysrCiAuLi4vYXJjaC9yaXNjdi9zaWZpdmUvdTc0L21pY3JvYXJj
aC5qc29uICAgICAgfCAgNTcgKysrKysrKysKIDkgZmlsZXMgY2hhbmdlZCwgNTI3IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9oZWFk
ZXIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2
L21hcGZpbGUuY3N2CiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2Fy
Y2gvcmlzY3YvcmlzY3Ytc2JpLWZpcm13YXJlLmpzb24KIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9zaWZpdmUvdTc0L2Zpcm13YXJlLmpzb24KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9zaWZpdmUv
dTc0L2luc3RydWN0aW9ucy5qc29uCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUt
ZXZlbnRzL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9tZW1vcnkuanNvbgogY3JlYXRlIG1vZGUgMTAw
NjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3NpZml2ZS91NzQvbWljcm9hcmNo
Lmpzb24KCi0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
