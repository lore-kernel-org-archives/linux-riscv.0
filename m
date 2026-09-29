Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123A7CA5FAE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOx+HSW/YHbmaE8VSPD/dyiKGNuEWXLHsbjQ1S5YUok=; b=C84GyyIJal8X1C
	pZnsfju0CTJ94CEBJPKzjdlIzp+OCxHcoKe7GI8kgR/0pijYhId2pWp2LuRtj76DjbmL9ZHRM5Ukh
	lELxDugXkrKfRr5r5zlJrYJJkQ+z63Tu0U70POu2RO40RaeO/x5xxVX/x3p1+PMqyjvaOnruSbgm1
	NmpS1AI1ZjQA/e8VTXEENTd2pX8g1+2Rgt8ZQfvK6wOQPoNroUUCtleEyHe0HBHSonQOK1m+odTHc
	EE2jgidW1g1eXUGAAXX3zcq5HPebwZzzcoIQnupuD0X9VmOZabdFqD2Ig2lH40ukrJp00FUFUbyVb
	PVTynQwBOJsQhY5pETBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTJE-00000002nFL-0bAr;
	Tue, 29 Sep 2026 08:35:32 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTJA-00000002nCQ-2p5z
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:35:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hvBLV0thYzKHMd9
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 16:34:42 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 7A85D40586
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 16:35:17 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgBXdShEeLtqhxloCA--.42471S3;
	Tue, 29 Sep 2026 16:35:16 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next 1/5] bpf, riscv: Fix stack-passed arguments for indirect trampolines
Date: Tue, 29 Sep 2026 08:39:20 +0000
Message-Id: <20260929083924.1851840-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929083924.1851840-1-pulehui@huaweicloud.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBXdShEeLtqhxloCA--.42471S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAr1DWrWDKr4UGrWkCw47XFb_yoW5WFWfpa
	15KwnxCFW0qr4Utas2qFWUWFyFyanYva13GrW7Ja4SkF4jgrWkKa4Fk3WYyF98Cr95A34I
	vr4YvFs5Ka4DA37anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
	Av7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14
	v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0GY
	LDUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_013529_014159_934494AA 
X-CRM114-Status: GOOD (  12.93  )
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

RnJvbTogS3VtYXIgS2FydGlrZXlhIER3aXZlZGkgPG1lbXhvckBnbWFpbC5jb20+CgpzdG9yZV9h
cmdzKCkgcmVhZHMgc3RhY2stcGFzc2VkIGFyZ3VtZW50cyByZWxhdGl2ZSB0byBGUCBhc3N1bWlu
ZyB0aGUKdHJhbXBvbGluZSB3YXMgZW50ZXJlZCB0aHJvdWdoIHRoZSBmZW50cnkgY2FsbCBmcm9t
IGEgdHJhY2VkIGZ1bmN0aW9uLiBJbgp0aGF0IHBhdGgsIHRoZSB0cmFtcG9saW5lIHB1c2hlcyB0
aGUgcGFyZW50IGZyYW1lIGJlZm9yZSBlc3RhYmxpc2hpbmcgaXRzCmZpbmFsIEZQLCBzbyB0aGUg
aW5jb21pbmcgc3RhY2sgYXJndW1lbnRzIHN0YXJ0IGF0IEZQICsgMTYuCgpBbiBpbmRpcmVjdCB0
cmFtcG9saW5lIGZvciBhIHN0cnVjdF9vcHMgY2FsbGJhY2sgaXMgY2FsbGVkIHRocm91Z2ggYQpm
dW5jdGlvbiBwb2ludGVyLiBJdHMgcHJvbG9ndWUgYWxsb2NhdGVzIG9ubHkgdGhlIHRyYW1wb2xp
bmUgZnJhbWUgYW5kIHNldHMKRlAgdG8gdGhlIGluY29taW5nIFNQLiBUaGUgUklTQy1WIEFCSSBw
bGFjZXMgdGhlIGZpcnN0IHN0YWNrIGFyZ3VtZW50IGF0CnRoYXQgaW5jb21pbmcgU1AsIHNvIHRo
ZSBhcmd1bWVudHMgc3RhcnQgYXQgRlAsIG5vdCBGUCArIDE2LiBFdmVyeQpzdGFjay1wYXNzZWQg
YXJndW1lbnQgb2YgYSBjYWxsYmFjayB3aXRoIG1vcmUgdGhhbiBlaWdodCBhcmd1bWVudCBzbG90
cyBpcwp0aGVyZWZvcmUgcmVhZCB0d28gc2xvdHMgbGF0ZS4KClBhc3MgdGhlIHByb2xvZ3VlLWRl
cGVuZGVudCBvZmZzZXQgdG8gc3RvcmVfYXJncygpLCB1c2luZyB6ZXJvIGZvciBhIGRpcmVjdApz
dHJ1Y3Rfb3BzIHRyYW1wb2xpbmUgYW5kIDE2IGZvciB0aGUgZmVudHJ5IHBhdGguCgpGaXhlczog
NjgwMWIwYWVmNzlkICgicmlzY3YsIGJwZjogQWRkIDEyLWFyZ3VtZW50IHN1cHBvcnQgZm9yIFJW
NjQgYnBmIHRyYW1wb2xpbmUiKQpDYzogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4K
Q2M6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IEt1bWFyIEth
cnRpa2V5YSBEd2l2ZWRpIDxtZW14b3JAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogUHUgTGVodWkg
PHB1bGVodWlAaHVhd2VpLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
IHwgMTQgKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmluZGV4IGVkMGE2Zjg3MWRlYS4u
YjVmYTYzMzhlNWViIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
CisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAgLTg5NSw3ICs4OTUsOCBA
QCBpbnQgYnBmX2FyY2hfdGV4dF9wb2tlKHZvaWQgKmlwLCBlbnVtIGJwZl90ZXh0X3Bva2VfdHlw
ZSBvbGRfdCwKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgdm9pZCBzdG9yZV9hcmdzKGludCBu
cl9hcmdfc2xvdHMsIGludCBhcmdzX29mZiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCitz
dGF0aWMgdm9pZCBzdG9yZV9hcmdzKGludCBucl9hcmdfc2xvdHMsIGludCBhcmdzX29mZiwgaW50
IHN0YWNrX2FyZ3Nfb2ZmLAorCQkgICAgICAgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCiB7
CiAJaW50IGk7CiAKQEAgLTkwMyw4ICs5MDQsOCBAQCBzdGF0aWMgdm9pZCBzdG9yZV9hcmdzKGlu
dCBucl9hcmdfc2xvdHMsIGludCBhcmdzX29mZiwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdAog
CQlpZiAoaSA8IFJWX01BWF9SRUdfQVJHUykgewogCQkJZW1pdF9zZChSVl9SRUdfRlAsIC1hcmdz
X29mZiwgUlZfUkVHX0EwICsgaSwgY3R4KTsKIAkJfSBlbHNlIHsKLQkJCS8qIHNraXAgc2xvdHMg
Zm9yIFQwIGFuZCBGUCBvZiB0cmFjZWQgZnVuY3Rpb24gKi8KLQkJCWVtaXRfbGQoUlZfUkVHX1Qx
LCAxNiArIChpIC0gUlZfTUFYX1JFR19BUkdTKSAqIDgsIFJWX1JFR19GUCwgY3R4KTsKKwkJCWVt
aXRfbGQoUlZfUkVHX1QxLCBzdGFja19hcmdzX29mZiArCisJCQkJKGkgLSBSVl9NQVhfUkVHX0FS
R1MpICogOCwgUlZfUkVHX0ZQLCBjdHgpOwogCQkJZW1pdF9zZChSVl9SRUdfRlAsIC1hcmdzX29m
ZiwgUlZfUkVHX1QxLCBjdHgpOwogCQl9CiAJCWFyZ3Nfb2ZmIC09IDg7CkBAIC0xMTkwLDcgKzEx
OTEsMTIgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3Qg
YnBmX3RyYW1wX2ltYWdlICppbSwKIAlmdW5jX21ldGEgPSBucl9hcmdfc2xvdHM7CiAJZW1pdF9z
dG9yZV9zdGFja19pbW02NChSVl9SRUdfVDEsIC1mdW5jX21ldGFfb2ZmLCBmdW5jX21ldGEsIGN0
eCk7CiAKLQlzdG9yZV9hcmdzKG5yX2FyZ19zbG90cywgYXJnc19vZmYsIGN0eCk7CisJLyoKKwkg
KiBBIGRpcmVjdCBzdHJ1Y3Rfb3BzIGNhbGwgaGFzIGl0cyBmaXJzdCBzdGFjayBhcmd1bWVudCBh
dCB0aGUgaW5jb21pbmcKKwkgKiBTUCwgd2hpY2ggdGhlIHRyYW1wb2xpbmUga2VlcHMgYXMgRlAu
IFRoZSBmZW50cnkgcGF0aCBwdXNoZXMgdGhlCisJICogcGFyZW50IGZyYW1lIGZpcnN0LCBzbyBp
dHMgaW5jb21pbmcgc3RhY2sgYXJndW1lbnRzIHN0YXJ0IGF0IEZQICsgMTYuCisJICovCisJc3Rv
cmVfYXJncyhucl9hcmdfc2xvdHMsIGFyZ3Nfb2ZmLCBpc19zdHJ1Y3Rfb3BzID8gMCA6IDE2LCBj
dHgpOwogCiAJaWYgKGJwZl9mc2Vzc2lvbl9jbnQodG5vZGVzKSkgewogCQkvKiBjbGVhciBhbGwg
c2Vzc2lvbiBjb29raWVzJyB2YWx1ZSAqLwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
