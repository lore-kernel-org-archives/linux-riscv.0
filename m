Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E7CCA5FA3
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 02:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UWKYerp6SoUjIlTZHR/KHjZeV8W7YjF8dJ8nrZEnWzw=; b=FSqCw7gSk3mQGD
	NdFkQsJAZrYbozFzLOuzVTl1sZHTsc3I14gn/A5WVf4Y1kKmvAb1bsSBLUsnVvFMOfsN+CbGn04UW
	eKNIE9pD6jljrIy0Ok1DTwuHVOfyHKPdQaQbXPoHI1OGwrRlH3cB70w04f4LlECaL5YI7dzSAKiPS
	J62mSsMCh38Fhip6JwEW40YVFIHCpxQUwWsJeYglU4FtbCrjxSiQL6YhIKfBtSi8J/w28yp5+tNT9
	+ecAMpS7t0Z/zoTbARFA3vcfZ6Qqez8k/rPFJ9dpDWeE8Xj2hChB2Cl6wlBWHUauocZqbfJQj39sZ
	twvK1kagcHUd+m5/FH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0zw-0000000HAEp-0ejW;
	Mon, 28 Sep 2026 02:21:44 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB0zs-0000000HADX-261Q
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 02:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790562093; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=uO5TIYKBfsawqPiNAsCntfjYc2ZcPToZ1eaI1Kfnyk4=;
	b=KvOT07cECHFuZw7oy5tNtXWiPhYLUPm/clAFj4fINPiQRnDL7ePfbf6DrtylTzyX4v9ZauUNJZCCFTOPXz3VcmHcpY77K3YnuTHIlQvoLrrcJXvTUgs5iVSj1cB5K40WkASb6/PBMRKOW9HWxpE9PGlGbQ2VH3/Ai8t4cPtd8YA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBgzgGN_1790562069;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBgzgGN_1790562069 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 10:21:30 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 0/2] bpf, riscv: Add support for indirect jumps
Date: Mon, 28 Sep 2026 10:21:07 +0800
Message-ID: <20260928022109.1093-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_192141_194316_60F3E321 
X-CRM114-Status: UNSURE (   8.57  )
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

VGhlIGluZGlyZWN0IGp1bXAgaW5zdHJ1Y3Rpb24gKEJQRl9KTVAgfCBCUEZfSkEgfCBCUEZfWCwg
ImdvdG94IikgYW5kIHRoZQpCUEZfTUFQX1RZUEVfSU5TTl9BUlJBWSBqdW1wIHRhYmxlcyBpdCBj
b25zdW1lcyBhcmUgY29yZSBmZWF0dXJlczogdGhlCnZlcmlmaWVyIGFjY2VwdHMgdGhlbSBvbiBl
dmVyeSBhcmNoaXRlY3R1cmUsIGFuZCB0aGUgeDg2LTY0LCBhcm02NCBhbmQKcG93ZXJwYyBKSVRz
IGltcGxlbWVudCB0aGVtLiBPbiByaXNjdjY0IGEgcHJvZ3JhbSB1c2luZyBnb3RveCBwYXNzZXMK
dmVyaWZpY2F0aW9uIGFuZCB0aGVuIGZhaWxzIHRvIGxvYWQsIGJlY2F1c2UgdGhlIEpJVCBkb2Vz
IG5vdCBrbm93IHRoZQpvcGNvZGUgYW5kIENPTkZJR19CUEZfSklUX0FMV0FZU19PTiBsZWF2ZXMg
bm8gaW50ZXJwcmV0ZXIgdG8gZmFsbCBiYWNrCm9udG8uCgpUaGlzIHNlcmllcyBhZGRzIHRoZSBy
aXNjdjY0IHN1cHBvcnQgYW5kIHR1cm5zIHRoZSBleGlzdGluZyBzZWxmdGVzdHMgb24KZm9yIHRo
YXQgYXJjaGl0ZWN0dXJlLgoKUGF0Y2ggMSBlbWl0cyAiamFsciB6ZXJvLCByZCwgMCIgZm9yIGdv
dG94IGFuZCBwdWJsaXNoZXMgdGhlIHhsYXRlZCB0bwpqaXR0ZWQgb2Zmc2V0cyB0aHJvdWdoIGJw
Zl9wcm9nX3VwZGF0ZV9pbnNuX3B0cnMoKSwgd2hpY2ggaXMgd2hhdCBmaWxscwppbiB0aGUganVt
cCB0YWJsZSBhZGRyZXNzZXMuIFBhdGNoIDIgd2lkZW5zIHRoZSBhcmNoIGd1YXJkIGluCnZlcmlm
aWVyX2dvdG94LmMgdG8gcmlzY3Y2NCwgdGhlIHNhbWUgd2F5IGFybTY0IGFuZCBwb3dlcnBjIHdl
cmUgZW5hYmxlZC4KCkNoYW5nZXMgc2luY2UgdjE6Ci0gUmViYXNlZCBvbnRvIGJwZi1uZXh0Lgot
IFBhdGNoIDE6IHJld29yZCB0aGUgY29kZSBjb21tZW50IHRvIHNheSAic2hpZnQgY3R4LT5vZmZz
ZXRbXSBieSBvbmUiLgotIFBhdGNoIDI6IGNvbGxhcHNlIHRoZSBtdWx0aS1saW5lICNlbmRpZiBt
YXJrZXIgdG8gYSBzaW5nbGUgbGluZS4KLSBBZGRlZCBSZXZpZXdlZC1ieS9BY2tlZC1ieSBmcm9t
IEJqw7ZybiBUw7ZwZWwuCgpUZXN0aW5nCj09PT09PT0KCkVudmlyb25tZW50OiBRRU1VIHZpcnQg
cnY2NCwgd2l0aCBDT05GSUdfQlBGX0pJVD15LApDT05GSUdfQlBGX0pJVF9BTFdBWVNfT049eSwg
Q09ORklHX0RFQlVHX0lORk9fQlRGPXk7IHNlbGZ0ZXN0cwpjcm9zcy1idWlsdCB3aXRoIGNsYW5n
IDIyLgoKLSB0ZXN0X3Byb2dzIC10IHZlcmlmaWVyX2dvdG94OiAyNy8yNyBzdWJ0ZXN0cyBwYXNz
IG9uIGJwZi1uZXh0LCAxMyBvZgogIHRoZW0gZXhlY3V0ZWQgdGhyb3VnaCBCUEZfUFJPR19URVNU
X1JVTi4KLSB0ZXN0X3Byb2dzLWNwdXY0IC10IGJwZl9nb3RveDogMTQvMTQgc3VidGVzdHMgcGFz
cywgbm9uZSBza2lwcGVkLgogIFRoZSBjcHV2NCBmbGF2b3IgaXMgbmVlZGVkIGhlcmUgYmVjYXVz
ZSBicGZfZ290b3ggZ2F0ZXMgaXRzIHN1YnRlc3RzCiAgb24gX19CUEZfRkVBVFVSRV9HT1RPWCwg
d2hpY2ggY2xhbmcgb25seSBkZWZpbmVzIGZvciAtbWNwdT12NC4KCkNoZW4gUGVpICgyKToKICBi
cGYsIHJpc2N2OiBBZGQgc3VwcG9ydCBmb3IgaW5kaXJlY3QganVtcHMKICBzZWxmdGVzdHMvYnBm
OiBFbmFibGUgZ290b3ggdGVzdHMgZm9yIHJpc2N2NjQKCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvbXA2NC5jICAgICAgICAgICAgICAgICAgfCAgNSArKysrKwogYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb3JlLmMgICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKystLQogLi4u
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9nb3RveC5jIHwgIDYgKysrKy0t
CiAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgotLSAK
Mi41MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
