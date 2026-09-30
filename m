Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07237CA5FAB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bk3TQ97o7UJgBq15eJ6Emn1SNRH8odP5Z2eGE1VT0oY=; b=LLVAAHoZVs9RdG
	6Ir7nUV15pjUaJSbgXTsVXoMBN7dtgWgVUGLG/KYouCbfcJ6DYAbCz3Snd0PKKoAVGfvDE+FamQMv
	3AsOL5siVuBf9kueDd8g8HQIVHbR6nPzvRZqYpuViYj3IMUCKQjiC06a7CIGwP8Mj4NNDlbe7EH0c
	u0GRb1Uoa3+vBXRFEd3+dv8TPLkALvhRKEyjjErg6RiXSpfet1HDu+UIGTPlZK6O1OOdRyhjMciak
	nFdgQAuQFtxn0ZYSiJIt10hE9Rjt/HwBPsWi8J2b96efy+CU63/Jqo7HUbIiEqhlTmBp9FjEDV90X
	taK4yp/2j3xVFZow9Y6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo1H-00000005Ay0-0CEP;
	Wed, 30 Sep 2026 06:42:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBo1F-00000005AwX-2zgD
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kgXuu8gnMNMuk3oj17jSz03FmqLOGnnVObN2HAmZWKs=; b=h9GXhzuesaylj/1tqeyg2hJlZ1
	1kprGytQoR6b9upE6HWB5kIrJLKt7Jdx+jxWNLe6JPVpx1f9Iu883WoQWtOzo5Q+Osre+vp5wRfzd
	/t1XAPIrat5Z/t42EhxEjvgPC9kKUBUesCEjkII9I0r4EretEU+mjQH4IME5Jc17PpNzj3kw0OQmr
	9g1erWUiKAiyI1nDp+Mu1YvcGjeOGZHifaf7IhhW1AK11eTDwvIOaoo0GoTIECacrXT/87nvkavgp
	fWJRLR5eUSw0b4J+qOj3yoOQnBOPA0KQk0lVHFja+lwqsuKudsC0/rX20sbU1ltI+sHjXeZvAflvH
	8cAYI6Pw==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBo18-00000003QVs-08MF
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:42:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hvlnT2HWczYQttg
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 14:41:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id CC2404056D
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 14:42:01 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgD3xSg2r7xqwDvcCA--.7693S3;
	Wed, 30 Sep 2026 14:42:01 +0800 (CST)
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
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v2 1/4] bpf, riscv: Fix stack-passed arguments for indirect trampolines
Date: Wed, 30 Sep 2026 06:46:04 +0000
Message-Id: <20260930064607.1908864-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930064607.1908864-1-pulehui@huaweicloud.com>
References: <20260930064607.1908864-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgD3xSg2r7xqwDvcCA--.7693S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAr1DWrWDKr4UGrWkCw47XFb_yoW5WFWkpa
	15KrnxCFW0qr4Ut3s7tFWUWFyFyanYva13GrW7Ja4SkF4jgrWkKa4Fk3WYyF98CryrA34I
	vr4YvFs5Ka4DA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0pRlJPiUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074215_327509_1B43099A 
X-CRM114-Status: GOOD (  14.82  )
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
cnRpa2V5YSBEd2l2ZWRpIDxtZW14b3JAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1
aSA8cHVsZWh1aUBodWF3ZWkuY29tPgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMgfCAxNCArKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKaW5kZXggZWQwYTZmODcxZGVh
Li5iNWZhNjMzOGU1ZWIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMKKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwpAQCAtODk1LDcgKzg5NSw4
IEBAIGludCBicGZfYXJjaF90ZXh0X3Bva2Uodm9pZCAqaXAsIGVudW0gYnBmX3RleHRfcG9rZV90
eXBlIG9sZF90LAogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyB2b2lkIHN0b3JlX2FyZ3MoaW50
IG5yX2FyZ19zbG90cywgaW50IGFyZ3Nfb2ZmLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkK
K3N0YXRpYyB2b2lkIHN0b3JlX2FyZ3MoaW50IG5yX2FyZ19zbG90cywgaW50IGFyZ3Nfb2ZmLCBp
bnQgc3RhY2tfYXJnc19vZmYsCisJCSAgICAgICBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkK
IHsKIAlpbnQgaTsKIApAQCAtOTAzLDggKzkwNCw4IEBAIHN0YXRpYyB2b2lkIHN0b3JlX2FyZ3Mo
aW50IG5yX2FyZ19zbG90cywgaW50IGFyZ3Nfb2ZmLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0
CiAJCWlmIChpIDwgUlZfTUFYX1JFR19BUkdTKSB7CiAJCQllbWl0X3NkKFJWX1JFR19GUCwgLWFy
Z3Nfb2ZmLCBSVl9SRUdfQTAgKyBpLCBjdHgpOwogCQl9IGVsc2UgewotCQkJLyogc2tpcCBzbG90
cyBmb3IgVDAgYW5kIEZQIG9mIHRyYWNlZCBmdW5jdGlvbiAqLwotCQkJZW1pdF9sZChSVl9SRUdf
VDEsIDE2ICsgKGkgLSBSVl9NQVhfUkVHX0FSR1MpICogOCwgUlZfUkVHX0ZQLCBjdHgpOworCQkJ
ZW1pdF9sZChSVl9SRUdfVDEsIHN0YWNrX2FyZ3Nfb2ZmICsKKwkJCQkoaSAtIFJWX01BWF9SRUdf
QVJHUykgKiA4LCBSVl9SRUdfRlAsIGN0eCk7CiAJCQllbWl0X3NkKFJWX1JFR19GUCwgLWFyZ3Nf
b2ZmLCBSVl9SRUdfVDEsIGN0eCk7CiAJCX0KIAkJYXJnc19vZmYgLT0gODsKQEAgLTExOTAsNyAr
MTE5MSwxMiBAQCBzdGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVj
dCBicGZfdHJhbXBfaW1hZ2UgKmltLAogCWZ1bmNfbWV0YSA9IG5yX2FyZ19zbG90czsKIAllbWl0
X3N0b3JlX3N0YWNrX2ltbTY0KFJWX1JFR19UMSwgLWZ1bmNfbWV0YV9vZmYsIGZ1bmNfbWV0YSwg
Y3R4KTsKIAotCXN0b3JlX2FyZ3MobnJfYXJnX3Nsb3RzLCBhcmdzX29mZiwgY3R4KTsKKwkvKgor
CSAqIEEgZGlyZWN0IHN0cnVjdF9vcHMgY2FsbCBoYXMgaXRzIGZpcnN0IHN0YWNrIGFyZ3VtZW50
IGF0IHRoZSBpbmNvbWluZworCSAqIFNQLCB3aGljaCB0aGUgdHJhbXBvbGluZSBrZWVwcyBhcyBG
UC4gVGhlIGZlbnRyeSBwYXRoIHB1c2hlcyB0aGUKKwkgKiBwYXJlbnQgZnJhbWUgZmlyc3QsIHNv
IGl0cyBpbmNvbWluZyBzdGFjayBhcmd1bWVudHMgc3RhcnQgYXQgRlAgKyAxNi4KKwkgKi8KKwlz
dG9yZV9hcmdzKG5yX2FyZ19zbG90cywgYXJnc19vZmYsIGlzX3N0cnVjdF9vcHMgPyAwIDogMTYs
IGN0eCk7CiAKIAlpZiAoYnBmX2ZzZXNzaW9uX2NudCh0bm9kZXMpKSB7CiAJCS8qIGNsZWFyIGFs
bCBzZXNzaW9uIGNvb2tpZXMnIHZhbHVlICovCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
