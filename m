Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CA0C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuVfG6ShqWmm47G6jOTxJyJUlDwRGl8o3yw0/wLMpoU=; b=UY1bEOfspHh1Gz
	Pfc9gscEgJ5PbGylDijPEIvMlTHuySDM4DZoHWUHL3hiiekhfck4M/ZGfxuoSq5vWXAFmD5hQfB06
	TvfuTJRHBS+wwTv2Y7xjKA4gQ/aqFt1wA1/T1WIcktmcMgSYX/o0h1rUW3bwD0di076l7OvsL0sDC
	EK8XFmo4djNPU2wb7+NvDBLe7IejHCpGXsU2ZvOdV3S9qFLSNji1elhrUK9+y9e3O1scl77BCcsll
	/o22/lSH71myRSdYEFoT867Rmx88gk4sl1p6MRQ5doNwKzYVcetnhcsfg6DHbfYPP7BcIhIgLJNqa
	hwv8zHAA1D77UoQOLBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUAb-0000000GJ3h-2Qw4;
	Tue, 30 Jun 2026 08:50:17 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUAX-0000000GJ2l-0Fg9
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 08:50:16 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABXo8Y8g0NqoiIoFg--.13803S2;
	Tue, 30 Jun 2026 16:50:04 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: xiaowu.417@qq.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	dev.mbstr@gmail.com,
	jiakaiPeanut@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	qirui.001@bytedance.com,
	samuel.holland@sifive.com,
	xujiakai2025@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: Re: [PATCH v3] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
Date: Tue, 30 Jun 2026 08:50:04 +0000
Message-Id: <20260630085004.4052828-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_F3349461F34E258F222F22AEC27934FEA00A@qq.com>
References: <tencent_F3349461F34E258F222F22AEC27934FEA00A@qq.com>
MIME-Version: 1.0
X-CM-TRANSID: zQCowABXo8Y8g0NqoiIoFg--.13803S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy5XrWxZFykXr1kZrWrXwb_yoWDCwb_Wa
	yqy3W7JanrtFZruFn7Jr15Zr48G3Z5AryfCr4DXr1ftFW8AF1rWrykuryrAr4fJws7Kryq
	yr909a17C3sY9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1UDG5UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAEOCWpDfrsSAwAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_015013_471291_E922C986 
X-CRM114-Status: GOOD (  11.57  )
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

PiBIaSBKaWFrYWksCj4KPiBJIGNhbWUgYWNyb3NzIHRoZSBTYXNoaWtvIEFJIHJldmlldyBvZiB0
aGlzIHBhdGNoIGFuZCB3YXMgYWJsZSB0bwo+IHJlcHJvZHVjZSB0aGUgb3ZlcmZsb3dfc3RhY2sg
T09CIGlzc3VlIGl0IGZsYWdnZWQg4oCUIGEgS0FTQU4KPiBzdGFjay1vdXQtb2YtYm91bmRzIGlu
IHdhbGtfc3RhY2tmcmFtZSgpIG9uIHJpc2N2NjQgUUVNVS4KCkhpIFhpYW8sCgpUaGFua3MgZm9y
IHRoZSB0ZXN0aW5nIGFuZCB0aGUgUG9DLgoKPiBXaGVuIHRoZSBzdGFjayBwb2ludGVyIGZhbGxz
IG91dHNpZGUgdGhlIHRhc2sgc3RhY2sg4oCUIGZvciBleGFtcGxlIHdoZW4KPiB1bndpbmRpbmcg
ZnJvbSB0aGUgb3ZlcmZsb3dfc3RhY2sgZHVyaW5nIGEgc3RhY2sgb3ZlcmZsb3cgcGFuaWMsIG9y
Cj4gd2hlbiByZWFkaW5nIC9wcm9jLzxwaWQ+L3N0YWNrIGZvciBhIHJlbW90ZSB0YXNrIHdob3Nl
IHNhdmVkIFNQCj4gaGFwcGVucyB0byBiZSBvbiB0aGUgb3ZlcmZsb3dfc3RhY2sg4oCUIHRoaXMg
Y29kZSBmYWxscyB0aHJvdWdoIHRvIHRoZQo+IGBJU19FTkFCTEVEKENPTkZJR19JUlFfU1RBQ0tT
KWAgYnJhbmNoIGFuZCB1c2VzIHRoZSBJUlEgc3RhY2sgYm91bmRhcnkKPiBhcyB0aGUgdXBwZXIg
bGltaXQuCj4KPiBUaGUgSVJRIHN0YWNrIGlzIDMyS0IgKElSUV9TVEFDS19TSVpFKSB3aGlsZSB0
aGUgb3ZlcmZsb3dfc3RhY2sgaXMKPiBvbmx5IDRLQiAoT1ZFUkZMT1dfU1RBQ0tfU0laRSkuICBV
c2luZyB0aGUgSVJRIHN0YWNrIGJvdW5kYXJ5IHdoZW4gdGhlCj4gU1AgaXMgYWN0dWFsbHkgb24g
dGhlIG92ZXJmbG93X3N0YWNrIGxldHMgdGhlIHVud2luZGVyIHJlYWQgd2VsbCBwYXN0Cj4gdGhl
IGVuZCBvZiB0aGUgdmFsaWQgb3ZlcmZsb3dfc3RhY2sgYWxsb2NhdGlvbiwgdHJpZ2dlcmluZyBh
IEtBU0FOCj4gc3RhY2stb3V0LW9mLWJvdW5kcy4KCkdvb2QgcG9pbnQuICBJJ2xsIGFkZCBhIGRl
ZGljYXRlZCBvdmVyZmxvd19zdGFjayBjaGVjayB3aXRoIHRoZQpjb3JyZWN0IDQgS2lCIGJvdW5k
YXJ5LgoKSmlha2FpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
