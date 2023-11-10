Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025EEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Y2tibFugpF8NFsx1gr5cpZvndY2Xl5YOwoEraYsOk8=; b=bidFrOG0pgBOFp
	JUinhWs1QWHrY4pjlWyfUkpeXCdI9uuY6D+MhnylZhftmhxah8LmvMV47sYS5Jbeejq3SFztNRsiA
	BMcjU/diNB3aqq1bVEctIxRvkwLwB3TBn+Nk2G1qxXQ/2TvF2gifSkFH8rSPTPBCabErewdGbNj3r
	8q77EsuZbkvm9aWl/z5TNwfphGRZz8UcWWZzKRrcU6t+utTaZHUrNdMX7BU27oGNSUhedHQKD7cw/
	ZWqG2yr0enag1B/CqxDskFRmUnFm88FyiU4LJ6Faq3W9lR1Bm4nZCy6iMSRacTNJ4uodPieMeNOeO
	aKflaMJEOF9dlCvCYJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Smi-008wuS-2f;
	Fri, 10 Nov 2023 14:47:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Smg-008wti-3D
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 Nov 2023 14:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iTlGSqfCM3HMcpOSNIdHJ+9MHCYoSQCxDvkcF2MH0HA=; b=brpilNhECwXWLDYKG+vucIqBAI
	4yuiYaKdKIVBY63fgRd61chx8EWuSznAGMJCLrJ/eAW5HYauQYUjclOp6mCAfcI+09tIWz+X155Zr
	EE6rJMeNnGhM2uKcWN83HVvn1F8MxjlVLmkmDQWk58b983MEqiCCJ320k7IngpDZ3zXoBIpAmwPG9
	+353oNufeZ9UMWXFaa67YOiNghhd2qxcrSRBemk3mN8bvhi9t7zYmch7hGfJyz+WI74nL1WOpQgp5
	wBZOYLKG9QBnDjkftKuSrhP5Xm3CW2fg2RqNvhljBJ9Seaf+xvsE6Ugba8vjiUg/cbrLurfkU5Ul8
	KZwlbSqA==;
Received: from 179.176.7.154.dynamic.adsl.gvt.net.br ([179.176.7.154] helo=quaco.ghostprotocols.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r1Sme-00DzIO-0F; Fri, 10 Nov 2023 14:46:57 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 8594C40094; Fri, 10 Nov 2023 11:46:46 -0300 (-03)
Date: Fri, 10 Nov 2023 11:46:46 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nikita Shubin <n.shubin@yadro.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] perf vendor events riscv: add StarFive Dubhe-80 JSON
 file
Message-ID: <ZU5CVv0U+Q4BmHeX@kernel.org>
References: <20231103082441.1389842-1-jisheng.teoh@starfivetech.com>
 <CAP-5=fW4T_j02RLghg=_OB1TkRWFuHKOR59xFyEsdEH5gGnUPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fW4T_j02RLghg=_OB1TkRWFuHKOR59xFyEsdEH5gGnUPA@mail.gmail.com>
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

RW0gRnJpLCBOb3YgMDMsIDIwMjMgYXQgMDg6NDU6MzNBTSAtMDcwMCwgSWFuIFJvZ2VycyBlc2Ny
ZXZldToKPiBPbiBGcmksIE5vdiAzLCAyMDIzIGF0IDE6MjfigK9BTSBKaSBTaGVuZyBUZW9oIDxq
aXNoZW5nLnRlb2hAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cgo+ID4gU3RhckZpdmUncyBEdWJo
ZS04MCBzdXBwb3J0cyByYXcgZXZlbnQgaWQgMHgwMCAtIDB4MjIuCj4gPiBUaGUgcmF3IGV2ZW50
cyBhcmUgZW5hYmxlZCB0aHJvdWdoIFBNVSBub2RlIG9mIERUIGJpbmRpbmcuCj4gPiBCZXNpZGVz
IHJhdyBldmVudCwgYWRkIHN0YW5kYXJkIFJJU0MtViBmaXJtd2FyZSBldmVudHMgdG8KPiA+IHN1
cHBvcnQgbW9uaXRvcmluZyBvZiBmaXJtd2FyZSBldmVudC4KCj4gPiBTaWduZWQtb2ZmLWJ5OiBK
aSBTaGVuZyBUZW9oIDxqaXNoZW5nLnRlb2hAc3RhcmZpdmV0ZWNoLmNvbT4KPiAKPiBSZXZpZXdl
ZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgoKVGhhbmtzLCBhcHBsaWVkLgoK
LSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
