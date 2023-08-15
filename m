Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C5EC001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UT4+oKnUjbLzD0vwo1DoqN12fXywU/fqtStHfHKqS5k=; b=TKq1sj0EMFmnRQ
	9R7peWDix1AqnSNOj5Ubovjisp0Wbwhl2MRMuUdutHQi0D/nciU8g97UcckUIuvAz0XwtE1hFo4W4
	etkKrO4NQbhVopqdQb8caNQqflq1bNPONaJuyyb+obQJPje5fq4iRck7CsFxpcm/xqEvZ55GH+ARX
	MfmDZ4CxZlOqrYwQMmS82pkIlLO+WRxGHYoZ5nHNqCHcCYkkxjNX71Giasq7K8c+Q2ubJViDZoY6w
	4U/bXops28e7Ojy5RLNuf9utFAhhu224RghqXFIMEvyG7uCenzWrqWABJHwwuZGsVaGjpUUPcRRg3
	52I4GtaZhBeUONC8U5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVz9p-002ETw-0Y;
	Tue, 15 Aug 2023 18:52:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVz9m-002ETb-2h;
	Tue, 15 Aug 2023 18:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0f3+SLucg33MDHZqrG/BXMYw7rAfAdGM8SO9yYjRiJo=; b=WkLiVbzFlKejLVEqWQU+8yybAP
	B4BkiBqcHJkDRZm60x5ucqXE1cU/YMZbTspW11avtHAHJg7Cu41pMm53r4ne/LFON0aHzh8Ki5ruJ
	9nBpRBruNl3j8lUEvyzBFZPqYMJK8uLenmkXoW5U41R4Shezitftccj6otdWkK/lbDWy9VLR6RpFT
	gzWtU6wLBpdwkHCc69yBUKJGq3GRnPYmBoSrvx52axE3am4yWJ3HPGtE0pihwdLxZ6VCSyUo1NXQ4
	QYtxhVR3KWo8cac4YrezO7LQ7H2jViaf7iDKrlSBu2e2xw7x4Mtvpugi52zJ5yJ8SlB+rUF2UA6HI
	lTnrbBcQ==;
Received: from [187.19.173.165] (helo=quaco.ghostprotocols.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qVz9l-009pSl-70; Tue, 15 Aug 2023 18:52:41 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 4A884404DF; Tue, 15 Aug 2023 15:52:38 -0300 (-03)
Date: Tue, 15 Aug 2023 15:52:38 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Leo Yan <leo.yan@linaro.org>, John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>, Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/6] perf parse-regs: Refactor architecture functions
Message-ID: <ZNvJdsVmmAWLmfH6@kernel.org>
References: <20230606014559.21783-1-leo.yan@linaro.org>
 <CAP-5=fV1m440mKc0R=m5C4N2NtoiixchtnpX2eR3PA_5hXbqEQ@mail.gmail.com>
 <ZNvCxM/ULdUfzHtR@kernel.org>
 <ZNvHx+KxIL6JzEl/@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNvHx+KxIL6JzEl/@kernel.org>
X-Url: http://acmel.wordpress.com
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

RW0gVHVlLCBBdWcgMTUsIDIwMjMgYXQgMDM6NDU6MjdQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIGVzY3JldmV1Ogo+ID4gQWdyZWVkLCBhcHBsaWVkIHRvIHBlcmYtdG9vbHMtbmV4
dCwgc29ycnkgZm9yIHRoZSBkZWxheS4KPiAKPiBIYWQgdG8gYWRkIHRoaXMgdG8gbWFrZSAncGVy
ZiB0ZXN0IHB5dGhvbicgdG8gd29yay4gUGxlYXNlIHJ1biAncGVyZgo+IHRlc3QnIGJlZm9yZSBz
ZW5kaW5nIHBhdGNoZXMuCgpPbmUgbW9yZSwgcGxlYXNlIGFsc28gZG8gYSAnbWFrZSAtQyB0b29s
cy9wZXJmIGJ1aWxkLXRlc3QnLCB3aXRoIGl0IEkKY2F1Z2h0IHRoaXM6CgogICAgICAgICBtYWtl
X25vX2xpYnVud2luZF9POiBjZCAuICYmIG1ha2UgTk9fTElCVU5XSU5EPTEgRkVBVFVSRVNfRFVN
UD0vdmFyL2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVT
VF9GRUFUVVJFX0RVTVAgLWozMiBPPS90bXAvdG1wLnllRUd5UXEySFIgREVTVERJUj0vdG1wL3Rt
cC5JVGdvTzE2ampICmNkIC4gJiYgbWFrZSBOT19MSUJVTldJTkQ9MSBGRUFUVVJFU19EVU1QPS92
YXIvaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9CVUlMRF9URVNUX0ZF
QVRVUkVfRFVNUCAtajMyIE89L3RtcC90bXAueWVFR3lRcTJIUiBERVNURElSPS90bXAvdG1wLklU
Z29PMTZqakgKCiAgQ0MgICAgICAvdG1wL3RtcC55ZUVHeVFxMkhSL3V0aWwvZXhwci1mbGV4Lm8K
dXRpbC91bndpbmQtbGliZHcuYzogSW4gZnVuY3Rpb24g4oCYbWVtb3J5X3JlYWTigJk6CnV0aWwv
dW53aW5kLWxpYmR3LmM6MTczOjI4OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24g4oCYcGVyZl9lbnZfX2FyY2jigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVj
bGFyYXRpb25dCiAgMTczIHwgICAgICAgICBjb25zdCBjaGFyICphcmNoID0gcGVyZl9lbnZfX2Fy
Y2godWktPm1hY2hpbmUtPmVudik7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn4KdXRpbC91bndpbmQtbGliZHcuYzoxNzM6Mjg6IGVycm9yOiBpbml0aWFs
aXphdGlvbiBvZiDigJhjb25zdCBjaGFyICrigJkgZnJvbSDigJhpbnTigJkgbWFrZXMgcG9pbnRl
ciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XZXJyb3I9aW50LWNvbnZlcnNpb25dCnV0
aWwvdW53aW5kLWxpYmR3LmM6IEluIGZ1bmN0aW9uIOKAmHVud2luZF9fZ2V0X2VudHJpZXPigJk6
CnV0aWwvdW53aW5kLWxpYmR3LmM6MjU4OjI4OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gb2Yg4oCY
Y29uc3QgY2hhciAq4oCZIGZyb20g4oCYaW504oCZIG1ha2VzIHBvaW50ZXIgZnJvbSBpbnRlZ2Vy
IHdpdGhvdXQgYSBjYXN0IFstV2Vycm9yPWludC1jb252ZXJzaW9uXQogIDI1OCB8ICAgICAgICAg
Y29uc3QgY2hhciAqYXJjaCA9IHBlcmZfZW52X19hcmNoKHVpX2J1Zi5tYWNoaW5lLT5lbnYpOwog
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+CmNjMTogYWxs
IHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1ha2VbNl06ICoqKiBbL3Zhci9ob21l
L2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9idWlsZC9NYWtlZmlsZS5idWlsZDo5ODog
L3RtcC90bXAueWVFR3lRcTJIUi91dGlsL3Vud2luZC1saWJkdy5vXSBFcnJvciAxCm1ha2VbNl06
ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2VbNV06ICoqKiBbL3Zhci9o
b21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9idWlsZC9NYWtlZmlsZS5idWlsZDox
NTA6IHV0aWxdIEVycm9yIDIKbWFrZVs0XTogKioqIFtNYWtlZmlsZS5wZXJmOjY2MjogL3RtcC90
bXAueWVFR3lRcTJIUi9wZXJmLWluLm9dIEVycm9yIDIKbWFrZVs0XTogKioqIFdhaXRpbmcgZm9y
IHVuZmluaXNoZWQgam9icy4uLi4KICBDQyAgICAgIC90bXAvdG1wLnllRUd5UXEySFIvcG11LWV2
ZW50cy9wbXUtZXZlbnRzLm8KICBMRCAgICAgIC90bXAvdG1wLnllRUd5UXEySFIvcG11LWV2ZW50
cy9wbXUtZXZlbnRzLWluLm8KbWFrZVszXTogKioqIFtNYWtlZmlsZS5wZXJmOjIzODogc3ViLW1h
a2VdIEVycm9yIDIKbWFrZVsyXTogKioqIFtNYWtlZmlsZTo3MDogYWxsXSBFcnJvciAyCm1ha2Vb
MV06ICoqKiBbdGVzdHMvbWFrZTozMzc6IG1ha2Vfbm9fbGlidW53aW5kX09dIEVycm9yIDEKbWFr
ZTogKioqIFtNYWtlZmlsZToxMDM6IGJ1aWxkLXRlc3RdIEVycm9yIDIKbWFrZTogTGVhdmluZyBk
aXJlY3RvcnkgJy92YXIvaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZicK
CnJlYWwJMW0yOS43ODRzCnVzZXIJMTBtNDEuNTk3cwpzeXMJMm01NS45NDhzCuKsolthY21lQHRv
b2xib3ggcGVyZi10b29scy1uZXh0XSQKCkknbSB0cnlpbmcgdG8gZml4CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
