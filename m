Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB354C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPqD49XboQ2iLU21JlJQAlUoj8hilPyrQkTxZAnJdl0=; b=qMX2HFJV6zh9Pp
	pQbVKOOX7G89zsxUc+ky/XtQsZ2Q54vtNEqEEd/gUbomOoWiGsIYR9P3SOtGzvxbTI0XpCpXETMrD
	SKrCynQ4gdW2lO04CZUeLedgN+3XA3wai9eVCSICwqnR9j7Dwqx9Sofnu9dIt7GJBcrPFT/Xjo4Pr
	zFBZo84283SIBWMUrLAHZK5wzs/fIyS3g2OHsDUsSIw+MZsa4qvCWsaKwEKsQg0zEuLdaaxZ3Hh5s
	vfy0pzsG/BlLlvlj+855DHazyuLWvzbbSRsYAFGrEpHNyIyaloddJ3/nebei4or6aM/OGwfwIDW3J
	UU5J+yEy/WO+tvxRS6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZ5d-007csv-G2; Tue, 07 Jun 2022 13:17:45 +0000
Received: from forward501o.mail.yandex.net ([2a02:6b8:0:1a2d::611])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZ5H-007cXR-RC
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 13:17:26 +0000
Received: from myt5-a76c7b0c543c.qloud-c.yandex.net (myt5-a76c7b0c543c.qloud-c.yandex.net [IPv6:2a02:6b8:c12:2908:0:640:a76c:7b0c])
	by forward501o.mail.yandex.net (Yandex) with ESMTP id F3ED745C4C8B;
	Tue,  7 Jun 2022 16:17:06 +0300 (MSK)
Received: from myt6-654ec0a0ab93.qloud-c.yandex.net (myt6-654ec0a0ab93.qloud-c.yandex.net [2a02:6b8:c12:1d80:0:640:654e:c0a0])
	by myt5-a76c7b0c543c.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 0JqJ9qHZUZ-H6fOeVsZ;
	Tue, 07 Jun 2022 16:17:06 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1654607826;
	bh=H5ZJSB+X5ZPk+u9IuwBsHvhkdVj5IngYfZMVK2pBn+Q=;
	h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
	b=nYhgRjYg+zJOPmbF47oV3H7hZ0cLH7P5Uk6Ki6HcvRMzoaJb0SsL1tRVTCoW953Q6
	 yfG5q9/auzw8JMI3gNKAPFT+Rp/Zb4YWDXcPQkaRSI2h8d7QRw56mBlOg2TUpKWqkr
	 4YwbpAkC8jkQv7KTU6thzeGxEKvPmGsZsaAnSR2s=
Authentication-Results: myt5-a76c7b0c543c.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt6-654ec0a0ab93.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id sOXgg17Zrk-H5M4o90G;
	Tue, 07 Jun 2022 16:17:05 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org (open list),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH v3 3/4] RISC-V: Added generic pmu-events mapfile
Date: Tue,  7 Jun 2022 16:16:46 +0300
Message-Id: <20220607131648.29439-4-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607131648.29439-1-nikita.shubin@maquefel.me>
References: <20220607131648.29439-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_061724_348695_5862B7D4 
X-CRM114-Status: GOOD (  13.08  )
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

RnJvbTogSm/Do28gTcOhcmlvIERvbWluZ29zIDxqb2FvLm1hcmlvQHRlY25pY28udWxpc2JvYS5w
dD4KClRoZSBwbXUtZXZlbnRzIG5vdyBzdXBwb3J0cyBjdXN0b20gZXZlbnRzIGZvciBSSVNDLVYs
IHBsdXMgdGhlIGN5Y2xlLAp0aW1lIGFuZCBpbnN0cmV0IGV2ZW50cyB3ZXJlIGRlZmluZWQuCgpT
aWduZWQtb2ZmLWJ5OiBKb8OjbyBNw6FyaW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51
bGlzYm9hLnB0PgpUZXN0ZWQtYnk6IE5pa2l0YSBTaHViaW4gPG4uc2h1YmluQHlhZHJvLmNvbT4K
LS0tCiB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9tYXBmaWxlLmNzdiAgfCAxNCAr
KysrKysrKysrKysrCiAuLi4vcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3Jpc2N2LWdlbmVyaWMuanNv
biAgfCAyMCArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNj
di9tYXBmaWxlLmNzdgogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9h
cmNoL3Jpc2N2L3Jpc2N2LWdlbmVyaWMuanNvbgoKZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvcG11
LWV2ZW50cy9hcmNoL3Jpc2N2L21hcGZpbGUuY3N2IGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2Fy
Y2gvcmlzY3YvbWFwZmlsZS5jc3YKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi40ZjJhYTE5OWQ5Y2IKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy9wZXJmL3BtdS1ldmVu
dHMvYXJjaC9yaXNjdi9tYXBmaWxlLmNzdgpAQCAtMCwwICsxLDE0IEBACisjIEZvcm1hdDoKKyMJ
TUlEUixWZXJzaW9uLEpTT04vZmlsZS9wYXRobmFtZSxUeXBlCisjCisjIHdoZXJlCisjCU1JRFIJ
UHJvY2Vzc29yIHZlcnNpb24KKyMJCVZhcmlhbnRbMjM6MjBdIGFuZCBSZXZpc2lvbiBbMzowXSBz
aG91bGQgYmUgemVyby4KKyMJVmVyc2lvbiBjb3VsZCBiZSB1c2VkIHRvIHRyYWNrIHZlcnNpb24g
b2YgSlNPTiBmaWxlCisjCQlidXQgY3VycmVudGx5IHVudXNlZC4KKyMJSlNPTi9maWxlL3BhdGhu
YW1lIGlzIHRoZSBwYXRoIHRvIEpTT04gZmlsZSwgcmVsYXRpdmUKKyMJCXRvIHRvb2xzL3BlcmYv
cG11LWV2ZW50cy9hcmNoL3Jpc2N2Ly4KKyMJVHlwZSBpcyBjb3JlLCB1bmNvcmUgZXRjCisjCisj
CisjRmFtaWx5LW1vZGVsLFZlcnNpb24sRmlsZW5hbWUsRXZlbnRUeXBlCmRpZmYgLS1naXQgYS90
b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpzb24gYi90b29s
cy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpzb24KbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4wMTNlNTBlZmFkOTkKLS0tIC9kZXYvbnVs
bAorKysgYi90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpz
b24KQEAgLTAsMCArMSwyMCBAQAorWworICB7CisgICAgIlB1YmxpY0Rlc2NyaXB0aW9uIjogIkNQ
VSBDeWNsZXMiLAorICAgICJFdmVudENvZGUiOiAiMHgwMCIsCisgICAgIkV2ZW50TmFtZSI6ICJy
aXNjdl9jeWNsZXMiLAorICAgICJCcmllZkRlc2NyaXB0aW9uIjogIkNQVSBjeWNsZXMgUklTQy1W
IGdlbmVyaWMgY291bnRlciIKKyAgfSwKKyAgeworICAgICJQdWJsaWNEZXNjcmlwdGlvbiI6ICJD
UFUgVGltZSIsCisgICAgICAiRXZlbnRDb2RlIjogIjB4MDEiLAorICAgICAgIkV2ZW50TmFtZSI6
ICJyaXNjdl90aW1lIiwKKyAgICAgICJCcmllZkRlc2NyaXB0aW9uIjogIkNQVSB0aW1lIFJJU0Mt
ViBnZW5lcmljIGNvdW50ZXIiCisgIH0sCisgIHsKKyAgICAiUHVibGljRGVzY3JpcHRpb24iOiAi
Q1BVIEluc3RydWN0aW9ucyIsCisgICAgICAiRXZlbnRDb2RlIjogIjB4MDIiLAorICAgICAgIkV2
ZW50TmFtZSI6ICJyaXNjdl9pbnN0cmV0IiwKKyAgICAgICJCcmllZkRlc2NyaXB0aW9uIjogIkNQ
VSByZXRpcmVkIGluc3RydWN0aW9ucyBSSVNDLVYgZ2VuZXJpYyBjb3VudGVyIgorICB9CitdClwg
Tm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
