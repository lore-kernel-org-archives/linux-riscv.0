Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09D7CD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOuKcsFdqXG7eaWtroMiYJm7GDYy412kp/7uYMCebC8=; b=LDhkNnrMjO2nDn
	gt60XJeMb87ffRBcX5qY8Ffmaj4MrveAFELOjcRfMVAkjj86fFGd0oDMnytxf3cCMW1KmO2+9aZFD
	pKylcs5DQLsganGuE6g+1eCVldDQNaR498UUcxjqVqEcNJEKEAlM4Nu32G0Id6FGxhXqYwu1FzoUA
	Hl0FmU3lMn0T9SWj+Ev95dr5tKrfx/bOWvrYc4xCw0PGjwVfOJAtbsdJRkN+r2vTtZY9YlifkxIho
	ZXtjMe3RQB2eebRMR1WCKaZmgW80jOd6jGzigKrMFBw7d+pYLx82aQp3gifa+3DQH8Qu77wu6yaiZ
	Du7Kt1f+hZQ1D1aoNsZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBql-000000037wY-1HrL;
	Wed, 13 May 2026 15:50:19 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBqi-000000037uu-0NGI
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 15:50:18 +0000
Received: from Lee.localdomain (unknown [39.152.152.253])
	by APP-01 (Coremail) with SMTP id qwCowACHMm6MnQRqEXQgEA--.35827S4;
	Wed, 13 May 2026 23:50:11 +0800 (CST)
From: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: irogers@google.com,
	adrian.hunter@intel.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Subject: [PATCH 2/3] perf riscv: Fix discarded const qualifier error in _get_field()
Date: Wed, 13 May 2026 23:48:50 +0800
Message-ID: <20260513154851.1085334-3-guanli.oerv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513154851.1085334-1-guanli.oerv@isrc.iscas.ac.cn>
References: <20260513154851.1085334-1-guanli.oerv@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHMm6MnQRqEXQgEA--.35827S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tryfuFy5urWUtw1DAr47urg_yoW8XFyfpr
	s7Cwn0qa4rurnIkr4jvrZ29FW5urs3Wa4Svrsay3yavr4YgryfJFyrtw15KF1Uur4UJws0
	kr15u395Ar48Ar7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUj5Ef7UUUUU==
X-Originating-IP: [39.152.152.253]
X-CM-SenderInfo: hjxd0znlorv2ny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_085016_490172_0B106972 
X-CRM114-Status: UNSURE (   9.06  )
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

V2hlbiBidWlsZGluZyBwZXJmIGZvciB0aGUgUklTQy1WIGFyY2hpdGVjdHVyZSAoZS5nLiwgd2l0
aCBHQ0MgMTQpLCB0aGUKYnVpbGQgZmFpbHMgZHVlIHRvIHN0cmljdCB0eXBlIGNoZWNraW5nIG9u
IHBvaW50ZXIgYXNzaWdubWVudHMuIFRoZQpjb21waWxlciBmbGFncyB0aGUgcmV0dXJuIHZhbHVl
IG9mIHN0cnJjaHIoKSBiZWluZyBhc3NpZ25lZCB0byBhCm5vbi1jb25zdCBwb2ludGVyIHdoaWxl
IHByb2Nlc3NpbmcgYSBjb25zdCBzdHJpbmcsIHRyaWdnZXJpbmcKLVdlcnJvcj1kaXNjYXJkZWQt
cXVhbGlmaWVyczoKCiAgICBhcmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmM6MjQ6MTU6IGVycm9yOiBh
c3NpZ25tZW50IGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFy
Z2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCiAgICAgICAyNCB8ICAgICAg
ICAgIGxpbmUyID0gc3RycmNocihsaW5lLCAnICcpOwogICAgICAgICAgfCAgICAgICAgICAgICAg
ICBeCiAgICBhcmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmM6Mjk6MTI6IGVycm9yOiBhc3NpZ25tZW50
IGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFyZ2V0IHR5cGUg
Wy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCiAgICAgICAyOSB8ICAgICAgICAgIG5sID0g
c3RycmNocihsaW5lLCAnXG4nKTsKICAgICAgICAgIHwgICAgICAgICAgICAgXgoKUmVzb2x2ZSB0
aGlzIGJ5IGFkZGluZyBhbiBleHBsaWNpdCAoY2hhciAqKSBjYXN0IHRvIHRoZSBzdHJyY2hyKCkK
cmV0dXJuIHZhbHVlcywgd2hpY2ggc2F0aXNmaWVzIHRoZSBjb21waWxlcidzIHF1YWxpZmllciBj
aGVja3MKd2l0aG91dCBhbHRlcmluZyB0aGUgcnVudGltZSBiZWhhdmlvci4KClNpZ25lZC1vZmYt
Ynk6IExpIEd1YW4gPGd1YW5saS5vZXJ2QGlzcmMuaXNjYXMuYWMuY24+Ci0tLQogdG9vbHMvcGVy
Zi9hcmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNo
L3Jpc2N2L3V0aWwvaGVhZGVyLmMgYi90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9oZWFkZXIu
YwppbmRleCA0YjgzOTIwM2Q0Li5kMDFiYTY0YWVjIDEwMDY0NAotLS0gYS90b29scy9wZXJmL2Fy
Y2gvcmlzY3YvdXRpbC9oZWFkZXIuYworKysgYi90b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9o
ZWFkZXIuYwpAQCAtMjEsMTIgKzIxLDEyIEBAIHN0YXRpYyBjaGFyICpfZ2V0X2ZpZWxkKGNvbnN0
IGNoYXIgKmxpbmUpCiB7CiAJY2hhciAqbGluZTIsICpubDsKIAotCWxpbmUyID0gc3RycmNocihs
aW5lLCAnICcpOworCWxpbmUyID0gKGNoYXIgKilzdHJyY2hyKGxpbmUsICcgJyk7CiAJaWYgKCFs
aW5lMikKIAkJcmV0dXJuIE5VTEw7CiAKIAlsaW5lMisrOwotCW5sID0gc3RycmNocihsaW5lLCAn
XG4nKTsKKwlubCA9IChjaGFyICopc3RycmNocihsaW5lLCAnXG4nKTsKIAlpZiAoIW5sKQogCQly
ZXR1cm4gTlVMTDsKIAotLSAKMi41NC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
