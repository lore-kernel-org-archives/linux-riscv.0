Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EC3FCC9DE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 08:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z2DLT2FKiibsk4OqHgDQSZ8R3L/S7Qt1+/QhKyWJYOY=; b=byjYmUtklX0SDa
	HW6WEty0uAVbFUJp0VZkYpaUMMv9OSceTd4UwpaeGf0+Jkg9CUOpVeiZtKWIlRuxFXceGrFo2RGvy
	F8/nXgxziHdRDbjDmTpUewJpkXqn1juEjAqXf3kHp0Eap/sYN9uPIYD9ba2eGCAa5ppRptaLvj/Op
	why4E3srMUP+eiSUygQjg1U6/LNX5KYOYG+c2rGfnu651ZdZr3RJH1ZrnHaYwuNaq53CZo/cmwNz3
	doQdUh5JhKUXzVBFKd421fZgMAuf0ZqZkFx9urITM5VUgmdd9bMqnZHhOVzL7J1rDR51pVV75312d
	7hYfuQyjRXMf6M12/1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsQ4-00000008wZs-0pbK;
	Tue, 10 Mar 2026 08:26:24 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsQ1-00000008wYl-0R4j
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 08:26:23 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowABXO+KF1a9pJYQ7Cg--.20420S2;
	Tue, 10 Mar 2026 16:25:41 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 10 Mar 2026 16:25:33 +0800
Subject: [PATCH] riscv: patch: Avoid early page_to_phys()
MIME-Version: 1.0
Message-Id: <20260310-riscv-sparsemem-alternatives-fix-v1-1-659d5dd257e2@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAH3Vr2kC/yWNQQ6CMBAAv0L27JoWFANfMZiUuugmFnC3NiYNf
 7eR48xhJoOSMCn0VQahxMrLXMAeKvBPNz8I+V4YalO3prEGhdUn1NWJUqCA7hVJZhc5keLEX5w
 6cuZsR9t2JyiZVajo/+I67Cz0/pRT3CWMTgn9EgLHvkqXY5n45pY3GLbtB5ExDfmhAAAA
X-Change-ID: 20260310-riscv-sparsemem-alternatives-fix-f9ea051b1694
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: rQCowABXO+KF1a9pJYQ7Cg--.20420S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4rWr13tw13uFWxZFW7twb_yoW5Jry7pF
	4Iyw1rJFW5JF4rJ3y7Jw1kZF15AwnagrWrWF9Fg3WFyw4qvrWrGwnYg347ZF9Iqr109w42
	yr4YyF1Y93WUX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0rWFUUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_012621_535567_E4EC4E30 
X-CRM114-Status: GOOD (  11.66  )
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

U2ltaWxhcmx5IHRvIGNvbW1pdCA4ZDA5ZTJkNTY5ZjYgKCJhcm02NDogcGF0Y2hpbmc6IGF2b2lk
IGVhcmx5CnBhZ2VfdG9fcGh5cygpIiksIGF2b2lkIHVzaW5nIHBoeXNfdG9fcGFnZSgpIGZvciB0
aGUga2VybmVsIGFkZHJlc3MgY2FzZQppbiBwYXRjaF9tYXAoKS4KClNpbmNlIHRoaXMgaXMgY2Fs
bGVkIGZyb20gYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXMoKSBpbiBzZXR1cF9hcmNoKCksIGFuZApj
b21taXQgNDI2NzczOWNhYmI4ICgiYXJjaCwgbW06IGNvbnNvbGlkYXRlIGluaXRpYWxpemF0aW9u
IG9mIFNQQVJTRQptZW1vcnkgbW9kZWwiKSBoYXMgbW92ZWQgc3BhcnNlX2luaXQoKSB0byBhZnRl
ciBzZXR1cF9hcmNoKCksCnBoeXNfdG9fcGFnZSgpIGlzIG5vdCBhdmFpbGFibGUgdGhlcmUgeWV0
LCBhbmQgaXQgcGFuaWNzIG9uIGJvb3Qgd2l0aApTUEFSU0VNRU0gb24gUlYzMiwgd2hpY2ggZG9l
cyBub3QgdXNlIFNQQVJTRU1FTV9WTUVNTUFQLgoKUmVwb3J0ZWQtYnk6IFRob21hcyBXZWnDn3Nj
aHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgpDbG9zZXM6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNjAyMjMxNDQxMDgtZGNhY2UwYjktMDJlOC00YjY3LWE3Y2UtZjI2
M2JlZDM2ZjI2QGxpbnV0cm9uaXguZGUvCkZpeGVzOiA0MjY3NzM5Y2FiYjggKCJhcmNoLCBtbTog
Y29uc29saWRhdGUgaW5pdGlhbGl6YXRpb24gb2YgU1BBUlNFIG1lbW9yeSBtb2RlbCIpClN1Z2dl
c3RlZC1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBW
aXZpYW4gV2FuZyA8d2FuZ3J1aWthbmdAaXNjYXMuYWMuY24+Ci0tLQpjaGVja3BhdGNoLnBsIGNv
bXBsYWlucyBhYm91dCB0aGUgQlVHX09OIHdoaWNoIHdhcyBhbHJlYWR5IHRoZXJlCi0tLQogYXJj
aC9yaXNjdi9rZXJuZWwvcGF0Y2guYyB8IDIxICsrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCmlu
ZGV4IGRiMTNjOWRkZjllMy4uMTZiMjQzMzc2ZjM2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9wYXRjaC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKQEAgLTQyLDE5ICs0
MiwyMCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfa2VybmVsX2V4aXR0ZXh0KHVpbnRwdHJfdCBh
ZGRyKQogc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkICpwYXRjaF9tYXAodm9pZCAqYWRkciwg
Y29uc3QgdW5zaWduZWQgaW50IGZpeG1hcCkKIHsKIAl1aW50cHRyX3QgdWludGFkZHIgPSAodWlu
dHB0cl90KSBhZGRyOwotCXN0cnVjdCBwYWdlICpwYWdlOworCXBoeXNfYWRkcl90IHBoeXM7CiAK
LQlpZiAoY29yZV9rZXJuZWxfdGV4dCh1aW50YWRkcikgfHwgaXNfa2VybmVsX2V4aXR0ZXh0KHVp
bnRhZGRyKSkKLQkJcGFnZSA9IHBoeXNfdG9fcGFnZShfX3BhX3N5bWJvbChhZGRyKSk7Ci0JZWxz
ZSBpZiAoSVNfRU5BQkxFRChDT05GSUdfU1RSSUNUX01PRFVMRV9SV1gpKQotCQlwYWdlID0gdm1h
bGxvY190b19wYWdlKGFkZHIpOwotCWVsc2UKKwlpZiAoY29yZV9rZXJuZWxfdGV4dCh1aW50YWRk
cikgfHwgaXNfa2VybmVsX2V4aXR0ZXh0KHVpbnRhZGRyKSkgeworCQlwaHlzID0gX19wYV9zeW1i
b2woYWRkcik7CisJfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19TVFJJQ1RfTU9EVUxFX1JX
WCkpIHsKKwkJc3RydWN0IHBhZ2UgKnBhZ2UgPSB2bWFsbG9jX3RvX3BhZ2UoYWRkcik7CisKKwkJ
QlVHX09OKCFwYWdlKTsKKwkJcGh5cyA9IHBhZ2VfdG9fcGh5cyhwYWdlKSArIG9mZnNldF9pbl9w
YWdlKGFkZHIpOworCX0gZWxzZSB7CiAJCXJldHVybiBhZGRyOworCX0KIAotCUJVR19PTighcGFn
ZSk7Ci0KLQlyZXR1cm4gKHZvaWQgKilzZXRfZml4bWFwX29mZnNldChmaXhtYXAsIHBhZ2VfdG9f
cGh5cyhwYWdlKSArCi0JCQkJCSBvZmZzZXRfaW5fcGFnZShhZGRyKSk7CisJcmV0dXJuICh2b2lk
ICopc2V0X2ZpeG1hcF9vZmZzZXQoZml4bWFwLCBwaHlzKTsKIH0KIAogc3RhdGljIHZvaWQgcGF0
Y2hfdW5tYXAoaW50IGZpeG1hcCkKCi0tLQpiYXNlLWNvbW1pdDogMWYzMThiOTZjYzg0ZDdjMmFi
NzkyZmNjMGJmZDQyYTdjYTg5MDY4MQpjaGFuZ2UtaWQ6IDIwMjYwMzEwLXJpc2N2LXNwYXJzZW1l
bS1hbHRlcm5hdGl2ZXMtZml4LWY5ZWEwNTFiMTY5NAoKQmVzdCByZWdhcmRzLAotLSAKVml2aWFu
ICJkcmFtZm9yZXZlciIgV2FuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
