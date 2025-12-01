Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9AED116F3
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAR3qqNjss4YkCWQ7JWKm3G6KMxOndlEd2XLeRiUSaA=; b=p9tbKeIf69sEoq
	7hxt6aS8T4qh9/Xocps4W3Kr+YswCadf+2c2JPEaa5/K2EdNFxI2iURnD5I8u/rAd1MAJo0rIfGav
	+gc2UInjANdpqmx8GlYWskkceab9QqYOKTkcIqKDXBlMIC8AYSV2zv4tQi6tomzXGcUarNfmCNxgk
	CQZTpamgp69fyL9JPgkdAnqF770iHH+g9oh7sgTO6wpI4PZF6UM7g5ylw+t34gW8/fOZ7tUsYIWG9
	DxRsCgaFSllHPjpIyNuhAgIPIBJBDn2m3G8w5/1vF6gvP8pvmcq2e8Bb1YcKJtZ00SVo7OZG4G9j8
	6uzwfXyqmiEN0besVJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4f1-0000000449L-26YX;
	Mon, 01 Dec 2025 14:13:51 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4ey-0000000446m-21tl;
	Mon, 01 Dec 2025 14:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=4jcweNi6psPpjlZDmC6qZ/Q4mO7N38WsRkszImaw/p0=;
	b=fLHGQTB2wwpyAu5ym/trd8UA27IhVG8yhhJGQFFZO+C46/FSaJA398a3OGiE8y
	oFIgx/AYYq+CfIXUNiV56NthlUeuQ5u/Rzhktg0uOuS5P0rXaxxtf2RRu0oaXWnC
	dhNBE1cSq399PRWZNKq/vhKcLL4cdIKcBq8vAySanWS1Q=
Received: from emily-VMware-Virtual-Platform.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3Ha9Qoi1p2MM7GA--.20690S2;
	Mon, 01 Dec 2025 22:12:34 +0800 (CST)
From: huyuye <huyuye812@163.com>
To: sunilvl@ventanamicro.com
Cc: ajones@ventanamicro.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atishp@rivosinc.com,
	bhelgaas@google.com,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	dfustini@tenstorrent.com,
	haibo1.xu@intel.com,
	lenb@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	rafael@kernel.org,
	robert.moore@intel.com,
	samuel.holland@sifive.com,
	tglx@linutronix.de,
	will@kernel.org,
	dai.hualiang@zte.com.cn,
	deng.weixian@zte.com.cn,
	guo.chang2@zte.com.cn,
	liu.qingtao2@zte.com.cn,
	wu.jiabao@zte.com.cn,
	lin.yongchun@zte.com.cn,
	hu.yuye@zte.com.cn,
	zhang.longxiang@zte.com.cn,
	huyuye <huyuye812@163.com>
Subject: Re:[PATCH v7 08/17] ACPI: pci_link: Clear the dependencies after probe
Date: Mon,  1 Dec 2025 22:12:29 +0800
Message-ID: <20251201141230.12656-1-huyuye812@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-9-sunilvl@ventanamicro.com>
References: <20240729142241.733357-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CM-TRANSID: PigvCgC3Ha9Qoi1p2MM7GA--.20690S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4DWr1ruFy8AFWkArykGrg_yoWfuwc_Kr
	1kAFyDZw4fK3W7tFy3GFykJFW3K3yagr9xGayIq392kw43Zan8Cws29r4Iyr45CFWxGrn0
	kr13Zw47K34a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjVOptUUUUU==
X-Originating-IP: [111.30.199.151]
X-CM-SenderInfo: 5kx135bhyrjqqrwthudrp/1tbioBkXCGktloy9jAADsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_061348_854922_CDAB4C22 
X-CRM114-Status: UNSURE (   8.58  )
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

PiBIaSwgc3VuaWx2bAoKPiBCYXNlZCBvbiB0aGUgYWJvdmUgcGF0Y2gsIEkgdW5kZXJzdGFuZCB0
aGF0IHlvdSBwcmV2aW91c2x5ID5yZXNvbHZlZCBkZXBlbmRlbmNpZXMgYmV0d2VlbiBMaW5rIGRl
dmljZXMgYW5kIFBDSSBIb3N0IEJyaWRnZXMgYnkgPmNhbGxpbmcgYWNwaV9kZXZfY2xlYXJfZGVw
ZW5kZW5jaWVzKGRldmljZSkuIEkgd291bGQgbGlrZSB0byBhc2s6ID5vbiBSSVND4oCRViBwbGF0
Zm9ybXMsIGlmIHdlIG5lZWQgdG8gbWFuYWdlIGRlcGVuZGVuY2llcyBiZXR3ZWVuID5tdWx0aXBs
ZSBQQ0kgSG9zdCBCcmlkZ2VzLCBjb3VsZCB0aGlzIGJlIGFkZHJlc3NlZCBieSBhZGRpbmcgYSA+
Y2FsbCB0byBhY3BpX2Rldl9jbGVhcl9kZXBlbmRlbmNpZXMoZGV2aWNlKSBhdCB0aGUgZW5kIG9m
IHRoZSA+YWNwaV9wY2lfcm9vdF9hZGQgZW51bWVyYXRpb24gZnVuY3Rpb24/Cgo+IEluaXRpYWxp
emF0aW9uIG9yZGVyIGRlcGVuZGVuY2llcyBjYW4gYmUgZGVmaW5lZCB2aWEgdGhlIEFDUEkgPl9E
RVAgbWV0aG9kIGluIHRoZSBEU0RULiBGb3IgZXhhbXBsZSwgaWYgaG9zdCBicmlkZ2UgQiBkZXBl
bmRzIG9uID5ob3N0IGJyaWRnZSBBLCBicmlkZ2UgQiBzaG91bGQgbm90IGJlIGVudW1lcmF0ZWQg
dW50aWwgYnJpZGdlIEEgaXMgPmZ1bGx5IGluaXRpYWxpemVkLgoKPiBZZXMsIHRoYXQgc2hvdWxk
IHdvcmsuCj4gUmVnYXJkcywKPiBTdW5pbAoKSGksU3VuaWwKCkknbSB0cnVseSBob25vcmVkIGJ5
IHlvdXIgYWZmaXJtYXRpb24gb2YgbXkgYW5zd2VyLkRvIHlvdSB0aGluayB0aGlzIHNvbHV0aW9u
IGhhcyBhIGNoYW5jZSBvZiBiZWluZyBhY2NlcHRlZCBpbnRvIHRoZSB1cHN0cmVhbSBrZXJuZWw/
IEFyZSB0aGVyZSBhbnkgdW5pbnRlbmRlZCBzaWRlIGVmZmVjdHMgd2UgbWF5IGhhdmUgb3Zlcmxv
b2tlZD8KClJlZ2FyZHMsCll1eWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
