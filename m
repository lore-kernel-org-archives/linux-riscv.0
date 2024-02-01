Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB05C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XcCwUQ6G9uJkYc7usfNVqk0DWxsO2+D3Real6u25TU=; b=HODq4iAqtCJtmj
	s2WVaR9UT1Nd6cOnCi62LgInuaW2F2oAyzYcqhdaparRfpJ6cpG7IqqH5kAFzcuyeuPL3A4AgLJdq
	Pa3qNQThvW44ZRFS/1VzROjk+TYAlYYV3/BBlYNsbIjMXf09fzEE9zHrNirEyd7VKS3pe2WCaTXEH
	3/rHJWeiuv8FYP/FYr4Xr8kq/r1JwUqIrWF2T6u8CoG0vIGn+/Va2X+zWKqKsykADpIMgZNwFolt2
	5p560B9jv+MwOV7xievrYQbQtttMjyHZMBRh3zZcMciTZzEEskL6Vzy4rwO5Hwb+PKpmNKGPL7bP5
	fav4BNefVW6pDJaoalbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSVV-000000075AU-1z6H;
	Thu, 01 Feb 2024 08:33:13 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSVQ-0000000756i-2tT1
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 08:33:11 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TQXGf0vRQz4f3k5r
	for <linux-riscv@lists.infradead.org>; Thu,  1 Feb 2024 16:32:58 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id B28AD1A0175
	for <linux-riscv@lists.infradead.org>; Thu,  1 Feb 2024 16:33:00 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgA3PnA8V7tlRXylCg--.9426S4;
	Thu, 01 Feb 2024 16:33:00 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v3 2/4] riscv, bpf: Using kvcalloc to allocate cache buffer
Date: Thu,  1 Feb 2024 08:33:49 +0000
Message-Id: <20240201083351.943121-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201083351.943121-1-pulehui@huaweicloud.com>
References: <20240201083351.943121-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgA3PnA8V7tlRXylCg--.9426S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WFW3Cw13GrWfGw4Utr4fXwb_yoW8ZF15pF
	4DGrnxA3yjvr1kXF1vqr4kXFy5J3Wqg3W7GFWUuFyfXF90qrWrXan5C34Y9rZ8CrWFkryS
	v3yY9rnxu34kXwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFrcTDUUU
	U
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_003309_119116_723D56AB 
X-CRM114-Status: UNSURE (   9.61  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCkl0IGlzIHVubmVjZXNzYXJ5IHRv
IGFsbG9jYXRlIGNvbnRpbnVvdXMgcGh5c2ljYWwgbWVtb3J5IGZvciBjYWNoZQpidWZmZXIsIGFu
ZCB3aGVuIGVicGYgcHJvZ3JhbSBpcyB0b28gbGFyZ2UsIGl0IG1heSBjYXVzZSBtZW1vcnkKYWxs
b2NhdGlvbiBmYWlsdXJlLgoKU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
LmNvbT4KQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Ci0tLQogYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDQgKystLQogYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb3JlLmMgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggZmRhNmI0ZjZhNGMx
Li43NGY5OTVhYmYyYzIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtOTExLDcgKzkxMSw3
IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJwZl90
cmFtcF9pbWFnZSAqaW0sCiAJfQogCiAJaWYgKGZtb2RfcmV0LT5ucl9saW5rcykgewotCQlicmFu
Y2hlc19vZmYgPSBrY2FsbG9jKGZtb2RfcmV0LT5ucl9saW5rcywgc2l6ZW9mKGludCksIEdGUF9L
RVJORUwpOworCQlicmFuY2hlc19vZmYgPSBrdmNhbGxvYyhmbW9kX3JldC0+bnJfbGlua3MsIHNp
emVvZihpbnQpLCBHRlBfS0VSTkVMKTsKIAkJaWYgKCFicmFuY2hlc19vZmYpCiAJCQlyZXR1cm4g
LUVOT01FTTsKIApAQCAtMTAwMSw3ICsxMDAxLDcgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFy
ZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICppbSwKIAogCXJldCA9IGN0
eC0+bmluc25zOwogb3V0OgotCWtmcmVlKGJyYW5jaGVzX29mZik7CisJa3ZmcmVlKGJyYW5jaGVz
X29mZik7CiAJcmV0dXJuIHJldDsKIH0KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb3JlLmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYwppbmRleCBiMjcxMjQw
ZjQ4YzkuLjViYTY4YjE4ODhhYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b3JlLmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMKQEAgLTgwLDcgKzgwLDcg
QEAgc3RydWN0IGJwZl9wcm9nICpicGZfaW50X2ppdF9jb21waWxlKHN0cnVjdCBicGZfcHJvZyAq
cHJvZykKIAl9CiAKIAljdHgtPnByb2cgPSBwcm9nOwotCWN0eC0+b2Zmc2V0ID0ga2NhbGxvYyhw
cm9nLT5sZW4sIHNpemVvZihpbnQpLCBHRlBfS0VSTkVMKTsKKwljdHgtPm9mZnNldCA9IGt2Y2Fs
bG9jKHByb2ctPmxlbiwgc2l6ZW9mKGludCksIEdGUF9LRVJORUwpOwogCWlmICghY3R4LT5vZmZz
ZXQpIHsKIAkJcHJvZyA9IG9yaWdfcHJvZzsKIAkJZ290byBvdXRfb2Zmc2V0OwpAQCAtMTg4LDcg
KzE4OCw3IEBAIHN0cnVjdCBicGZfcHJvZyAqYnBmX2ludF9qaXRfY29tcGlsZShzdHJ1Y3QgYnBm
X3Byb2cgKnByb2cpCiAJCQljdHgtPm9mZnNldFtpXSA9IG5pbnNuc19ydm9mZihjdHgtPm9mZnNl
dFtpXSk7CiAJCWJwZl9wcm9nX2ZpbGxfaml0ZWRfbGluZm8ocHJvZywgY3R4LT5vZmZzZXQpOwog
b3V0X29mZnNldDoKLQkJa2ZyZWUoY3R4LT5vZmZzZXQpOworCQlrdmZyZWUoY3R4LT5vZmZzZXQp
OwogCQlrZnJlZShqaXRfZGF0YSk7CiAJCXByb2ctPmF1eC0+aml0X2RhdGEgPSBOVUxMOwogCX0K
LS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
