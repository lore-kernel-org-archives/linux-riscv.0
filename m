Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D860BC9832F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 07:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C47Q29Im2SVYidEq8mJ/f2hF4WxCh4cX0/6oMBagmw0=; b=fRKulKCxAi5SCE
	onOIzlXqeYRlocXqULkDRy0g5dXV/Ld6hYUDhciiZ8Cv3CrGpvlFHBCMcLzVCqnQecFKY3IzqlvN7
	D7ncpCmnAaqdRv1CtAvZlXYk6I2+38EdvcDx1mrj6gyqEXbtTHP3N1+dVfPudvMWuctlREZVhH45a
	UkWMtK74Vqpm9n9BKI9iMBDzJmzbxCs9gBMlxIcgBi4EnQna2Gh5WxEhcxVizASOK8Mt5YWFMc9uZ
	Pe+Hv9n3ec+oL44fPESYYHCWV45omWjSRm9iqzcJjQ/QMjkV61oVE9BWadXcq28eG3ClpaTFbuuTI
	Tccy5IO+N9gHPNORK7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5db-0000000HWgh-2FNp;
	Mon, 28 Sep 2026 07:18:59 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5dX-0000000HWfh-3onp
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 07:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790579933; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=otGvhaMgyAjabjWj/NKnLV8cn4GGHC38pvR1Q5TALtk=;
	b=Bj83x0NcjwfigmJX9LIrkRBLgSFvDIZgJ5QEOrZCrLpndYS3TZxiUUbe5AWcEtGzOxohiNKd+ycFfMG1WidkO29rVHJvQ3AryKXF198SJ3HzwA4ck7zAxa/Xj0lSPsSC1DMztQeUAqtkvZ4ZWAdJ689+sX4Z6/a2cl1Nuq8cVJc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBjcVMW_1790579926;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBjcVMW_1790579926 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 15:18:51 +0800
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
Subject: [PATCH bpf-next v3 0/4] bpf, riscv: Add support for indirect jumps
Date: Mon, 28 Sep 2026 15:18:41 +0800
Message-ID: <20260928071845.2432-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_001856_668429_5EF3B50A 
X-CRM114-Status: UNSURE (   9.00  )
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
cCB0YWJsZSBhZGRyZXNzZXMuIFBhdGNoZXMgMiB0byA0IHdpZGVuIHRoZSBhcmNoIGd1YXJkcyBp
bgp2ZXJpZmllcl9nb3RveC5jLCBjb21wdXRlX2xpdmVfcmVnaXN0ZXJzLmMgYW5kIGJwZl9pbnNu
X2FycmF5LmMgdG8KcmlzY3Y2NCwgdGhlIHNhbWUgd2F5IHRoZSBvdGhlciBhcmNoaXRlY3R1cmVz
IHdlcmUgZW5hYmxlZC4KCkNoYW5nZXMgc2luY2UgdjI6Ci0gUGljayB1cCBQdSBMZWh1aSdzIFJl
dmlld2VkLWJ5IG9uIHBhdGNoIDEuCi0gRW5hYmxlIHR3byBtb3JlIGdvdG94IHRlc3QgZmlsZXMg
Zm9yIHJpc2N2NjQ6IGNvbXB1dGVfbGl2ZV9yZWdpc3RlcnMuYwogIGFuZCBicGZfaW5zbl9hcnJh
eS5jLgoKQ2hhbmdlcyBzaW5jZSB2MToKLSBSZWJhc2VkIG9udG8gYnBmLW5leHQuCi0gUGF0Y2gg
MTogcmV3b3JkIHRoZSBjb2RlIGNvbW1lbnQgdG8gc2F5ICJzaGlmdCBjdHgtPm9mZnNldFtdIGJ5
IG9uZSIuCi0gUGF0Y2ggMjogY29sbGFwc2UgdGhlIG11bHRpLWxpbmUgI2VuZGlmIG1hcmtlciB0
byBhIHNpbmdsZSBsaW5lLgotIEFkZGVkIFJldmlld2VkLWJ5L0Fja2VkLWJ5IGZyb20gQmrDtnJu
IFTDtnBlbC4KClRlc3RpbmcKPT09PT09PQoKRW52aXJvbm1lbnQ6IFFFTVUgdmlydCBydjY0LCB3
aXRoIENPTkZJR19CUEZfSklUPXksCkNPTkZJR19CUEZfSklUX0FMV0FZU19PTj15LCBDT05GSUdf
REVCVUdfSU5GT19CVEY9eTsgc2VsZnRlc3RzCmNyb3NzLWJ1aWx0IHdpdGggY2xhbmcgMjMuCgot
IHRlc3RfcHJvZ3MgLXQgdmVyaWZpZXJfZ290b3g6IDMzLzMzIHN1YnRlc3RzIHBhc3MuCi0gdGVz
dF9wcm9ncyAtdCBicGZfaW5zbl9hcnJheTogMjAvMjAgc3VidGVzdHMgcGFzcy4KLSB0ZXN0X3By
b2dzIC10IGNvbXB1dGVfbGl2ZV9yZWdpc3RlcnM6IDIwLzIwIHN1YnRlc3RzIHBhc3MsIGluY2x1
ZGluZwogIHRoZSBnb3RveCBsaXZlbmVzcyBzdWJ0ZXN0LgotIHRlc3RfcHJvZ3MtY3B1djQgLXQg
YnBmX2dvdG94OiAxNC8xNCBzdWJ0ZXN0cyBwYXNzLgoKQ2hlbiBQZWkgKDQpOgogIGJwZiwgcmlz
Y3Y6IEFkZCBzdXBwb3J0IGZvciBpbmRpcmVjdCBqdW1wcwogIHNlbGZ0ZXN0cy9icGY6IEVuYWJs
ZSBnb3RveCB0ZXN0cyBmb3IgcmlzY3Y2NAogIHNlbGZ0ZXN0cy9icGY6IEVuYWJsZSBnb3RveCBs
aXZlbmVzcyB0ZXN0IGZvciByaXNjdjY0CiAgc2VsZnRlc3RzL2JwZjogRW5hYmxlIGluc3RydWN0
aW9uIGFycmF5IHRlc3QgZm9yIHJpc2N2NjQKCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2
NC5jICAgICAgICAgICAgICAgICAgfCAgNSArKysrKwogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b3JlLmMgICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKystLQogLi4uL3NlbGZ0
ZXN0cy9icGYvcHJvZ190ZXN0cy9icGZfaW5zbl9hcnJheS5jICAgIHwgIDMgKystCiAuLi4vc2Vs
ZnRlc3RzL2JwZi9wcm9ncy9jb21wdXRlX2xpdmVfcmVnaXN0ZXJzLmMgfCAgNSArKystLQogLi4u
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9nb3RveC5jIHwgIDYgKysrKy0t
CiA1IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAK
Mi41MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
