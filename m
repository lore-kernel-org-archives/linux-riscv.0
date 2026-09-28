Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E000C9833E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 07:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfndxP97rjUqt46ev3T8snXN+jX0W5OLLoy2pugCJW8=; b=DUVla3Jnd0aIYO
	DZgQ7uAuJpch72w7k2qQQwLbfmj2VABXWOImnj48L8WLk76QA3UhpYey7+lCpFXSUBZL2bTnjUBR9
	PScXUI15wh8u0ziHILgtNTq8kIuvydsdwUll6N62JctCrZ3fd8o9OErL9ujdRLs3eGTl8xISkUfUX
	0QkSf2ZLWEBnFq9BnsfH+ApP0ur2vCKfl50SC42J2iDZhUuMZak1dGBllrHa+A2GpM6e5hvDgIxoi
	SHaarYmEbhcIG57nYfFCw8TpKTKu7r5MyS5JbqvkDeoq0Hv/Pv3NK6XjUG0cxcF+vzWdeG3L6C8MA
	ttNbudgQbjDV2jzU1zsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5db-0000000HWgn-2g6N;
	Mon, 28 Sep 2026 07:18:59 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5dY-0000000HWfk-0s2C
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 07:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790579934; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=fpAA4EQP+03FYVuP6WwRPHXo3UvGxFpDukmil78UTQ8=;
	b=twavpDZ2m55yP3QgzEYsscAMhQC9gg1Bs28r6S0kc0maKzdEngyJKE/YUKoDyPuT4lb8mfLS+V2lV1VBsOK/rr/swl2tFPv9J26KVEveRR+BAhDNDEZslrt8qRK3529WiALCREkeHTPhQx5Zlz36YGK1sxHVevFtm22gx3whbAQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBjcVOC_1790579932;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBjcVOC_1790579932 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 15:18:53 +0800
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
Subject: [PATCH bpf-next v3 1/4] bpf, riscv: Add support for indirect jumps
Date: Mon, 28 Sep 2026 15:18:42 +0800
Message-ID: <20260928071845.2432-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928071845.2432-1-cp0613@linux.alibaba.com>
References: <20260928071845.2432-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_001856_669837_034E67F0 
X-CRM114-Status: GOOD (  15.79  )
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

SW1wbGVtZW50IEpJVCBzdXBwb3J0IGZvciB0aGUgaW5kaXJlY3QganVtcCBpbnN0cnVjdGlvbiAo
QlBGX0pNUCB8CkJQRl9KQSB8IEJQRl9YKSwgYS5rLmEuIGdvdG94LCB3aGljaCBsZXRzIGEgQlBG
IHByb2dyYW0ganVtcCB0aHJvdWdoIGEKQlBGX01BUF9UWVBFX0lOU05fQVJSQVkganVtcCB0YWJs
ZS4KCkVtaXQgImphbHIgemVybywgcmQsIDAiIGFuZCBoYW5kIHRoZSB4bGF0ZWQgdG8gaml0dGVk
IG9mZnNldHMgdG8KYnBmX3Byb2dfdXBkYXRlX2luc25fcHRycygpLCB3aGljaCBpcyB3aGF0IGZp
bGxzIGluIHRoZSBqdW1wIHRhYmxlCmVudHJpZXM7IHdpdGhvdXQgdGhhdCBjYWxsIHRoZSBsb2Fk
IGZhaWxzIHdpdGggLUVGQVVMVCBpbgpicGZfaW5zbl9hcnJheV9yZWFkeSgpLiBjdHgtPm9mZnNl
dFtdIGhvbGRzIHRoZSBvZmZzZXQgb2YgdGhlIGluc24KKmZvbGxvd2luZyogaW5zbiBpLCBhcyBi
cGZfcHJvZ19maWxsX2ppdGVkX2xpbmZvKCkgZXhwZWN0cywgc28gaXQgaXMKc2hpZnRlZCBieSBv
bmUgYW5kIG9mZnNldFswXSBjb21lcyBmcm9tIHRoZSBwcm9sb2d1ZSBsZW5ndGguIGJ1aWxkX2Jv
ZHkoKQpub3cgcmVjb3JkcyBib3RoIGhhbHZlcyBvZiBhIG11bHRpLWluc24gcmVjb3JkLCBzbyBu
byBzbG90IGtlZXBzIGEKZmFicmljYXRlZCBvZmZzZXQuCgpPbmx5IHRoZSBSVjY0IEpJVCBpcyBj
b3ZlcmVkOyBSVjMyIGtlZXBzIGZhaWxpbmcgdG8gbG9hZCBhcyBiZWZvcmUuCgpTaWduZWQtb2Zm
LWJ5OiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgpSZXZpZXdlZC1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29t
PgotLS0KCkNoYW5nZXMgc2luY2UgdjI6Ci0gUGljayB1cCBQdSBMZWh1aSdzIFJldmlld2VkLWJ5
OyBubyBjb2RlIGNoYW5nZS4KCkNoYW5nZXMgc2luY2UgdjE6Ci0gUmV3b3JkIHRoZSBjb2RlIGNv
bW1lbnQgdG8gc2F5ICJzaGlmdCBjdHgtPm9mZnNldFtdIGJ5IG9uZSIuCgogYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wNjQuYyB8ICA1ICsrKysrCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
cmUuYyAgIHwgMTYgKysrKysrKysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmluZGV4IGVkMGE2
Zjg3MWRlYS4uOWRlMzc0OWZiMjY4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvbXA2NC5jCisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAgLTE2OTEs
NiArMTY5MSwxMSBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNu
ICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKIAkJCWVtaXRfemV4dHcocmQsIHJk
LCBjdHgpOwogCQlicmVhazsKIAorCS8qIEpVTVAgcmVnICovCisJY2FzZSBCUEZfSk1QIHwgQlBG
X0pBIHwgQlBGX1g6CisJCWVtaXRfamFscihSVl9SRUdfWkVSTywgcmQsIDAsIGN0eCk7CisJCWJy
ZWFrOworCiAJLyogSlVNUCBvZmYgKi8KIAljYXNlIEJQRl9KTVAgfCBCUEZfSkE6CiAJY2FzZSBC
UEZfSk1QMzIgfCBCUEZfSkE6CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
cmUuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jCmluZGV4IDQ3MGE2YWNlNTY2Mi4u
NTI2NWRkNWJkMzllIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYwor
KysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYwpAQCAtMjYsMTAgKzI2LDEzIEBAIHN0
YXRpYyBpbnQgYnVpbGRfYm9keShzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwgYm9vbCBleHRy
YV9wYXNzLCBpbnQgKm9mZnNldCkKIAkJaW50IHJldDsKIAogCQlyZXQgPSBicGZfaml0X2VtaXRf
aW5zbihpbnNuLCBjdHgsIGV4dHJhX3Bhc3MpOwotCQlpZiAocmV0ID4gMCkKLQkJCWkrKzsgLyog
c2tpcCB0aGUgbmV4dCBpbnN0cnVjdGlvbiAqLwogCQlpZiAob2Zmc2V0KQogCQkJb2Zmc2V0W2ld
ID0gY3R4LT5uaW5zbnM7CisJCWlmIChyZXQgPiAwKSB7CisJCQlpKys7IC8qIHNraXAgdGhlIG5l
eHQgaW5zdHJ1Y3Rpb24gKi8KKwkJCWlmIChvZmZzZXQpCisJCQkJb2Zmc2V0W2ldID0gY3R4LT5u
aW5zbnM7CisJCX0KIAkJaWYgKHJldCA8IDApCiAJCQlyZXR1cm4gcmV0OwogCX0KQEAgLTE3Niw2
ICsxNzksMTUgQEAgc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2ppdF9jb21waWxlKHN0cnVjdCBi
cGZfdmVyaWZpZXJfZW52ICplbnYsIHN0cnVjdCBicGZfcHIKIAkJZm9yIChpID0gMDsgaSA8IHBy
b2ctPmxlbjsgaSsrKQogCQkJY3R4LT5vZmZzZXRbaV0gPSBuaW5zbnNfcnZvZmYoY3R4LT5vZmZz
ZXRbaV0pOwogCQlicGZfcHJvZ19maWxsX2ppdGVkX2xpbmZvKHByb2csIGN0eC0+b2Zmc2V0KTsK
KworCQkvKgorCQkgKiBicGZfcHJvZ191cGRhdGVfaW5zbl9wdHJzKCkgd2FudHMgdGhlIHN0YXJ0
IG9mIGVhY2ggaW5zbiwgc28KKwkJICogc2hpZnQgY3R4LT5vZmZzZXRbXSBieSBvbmUgYW5kIGdl
dCBpbnNuIDAgZnJvbSB0aGUgcHJvbG9ndWUuCisJCSAqLworCQlmb3IgKGkgPSBwcm9nLT5sZW4g
LSAxOyBpID4gMDsgaS0tKQorCQkJY3R4LT5vZmZzZXRbaV0gPSBjdHgtPm9mZnNldFtpIC0gMV07
CisJCWN0eC0+b2Zmc2V0WzBdID0gbmluc25zX3J2b2ZmKGN0eC0+cHJvbG9ndWVfbGVuKTsKKwkJ
YnBmX3Byb2dfdXBkYXRlX2luc25fcHRycyhwcm9nLCBjdHgtPm9mZnNldCwgaml0X2RhdGEtPnJv
X2ltYWdlKTsKIG91dF9vZmZzZXQ6CiAJCWt2ZnJlZShjdHgtPm9mZnNldCk7CiAJCWtmcmVlKGpp
dF9kYXRhKTsKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
