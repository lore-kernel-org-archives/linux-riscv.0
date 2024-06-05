Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89543C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5x27UpBP1ndOqsD2lGBibKXFyonLZjAS598cfWgG31I=; b=iEEkOpNR78nX0J
	P/U+kI2aeSTwT1DpPymnop9n7EnBmFjCqDwxQhvSXZc6vO/9ZyrK9wOHf44DyArajbM55ejt+fLnB
	+Gslxqrd7TfJA88azgS+udP0alZIKOT4RGaBHdfeXqJsagkM8TFoTJGoPuZwusg8h2zDVjiUTiIdo
	VMsuM4timlROXBurF2Y/oDNJyRWT3z9VBEeJSsvqjTywws/En43N3hoqbIBovueiHtrDJYGhFgPlB
	eutbla6ujj/AQJ8neNqp6bm5LDnm/GSx1kIuB/GdV/VS/2SuHANjkQsz+0qJPGrRsoRrkICjfsq2u
	uqbhfJV0FCgFY3cR7Xcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1U-00000005k1f-20vW;
	Wed, 05 Jun 2024 11:41:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1R-00000005jy8-09hn
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 11:41:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48605CE1774;
	Wed,  5 Jun 2024 11:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EA3C3277B;
	Wed,  5 Jun 2024 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587698;
	bh=JhdeFloFX/xxhqkxVxMkwy3o8a+I7NU1Jr3K3J+2XHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yo0tPcOUDWbZKgAZCcnplN/Tpng+rYhahCirtGosu22vfbqUpPcHwDQA6k6SFhOAV
	 ZJqZbW2Hub+7wW8blIcchz+3RvICwE2f/9Ybv7CyKA+D07H53Ebb5i0DPEtvRVmP7+
	 +UJZgr4Sp39itexUAPNROpGAAJDUgk4oCvOQX909f0SpiDFFPHsojDG2bl1yDM6WIT
	 1SeA46LAIXR14O9bfozUPdydSqNyrw8nINXW38klf+p8XKmw4BCQ/CsmeOD9GOvQFi
	 hvRgm5Ntqz+0/jK4n1J/g/BIAKDgmEOtQ2+tEApA0MTtkbTxYZ4HxLyqMrMU4Yz12A
	 PHsFFb2fJFJpQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 05/11] riscv: mm: Add pfn_to_kaddr() implementation
Date: Wed,  5 Jun 2024 13:40:48 +0200
Message-ID: <20240605114100.315918-6-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114100.315918-1-bjorn@kernel.org>
References: <20240605114100.315918-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_044141_496108_D18D3FC7 
X-CRM114-Status: UNSURE (   8.54  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIHBmbl90b19rYWRk
cigpIGZ1bmN0aW9uIGlzIHVzZWQgYnkgS0FTQU4ncyBtZW1vcnkgaG90cGx1Z2dpbmcKcGF0aC4g
QWRkIHRoZSBtaXNzaW5nIGZ1bmN0aW9uIHRvIHRoZSBSSVNDLVYgcG9ydCwgc28gdGhhdCBpdCBj
YW4gYmUKYnVpbHQgd2l0aCBNSFAgYW5kIENPTkZJR19LQVNBTi4KClNpZ25lZC1vZmYtYnk6IEJq
w7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BhZ2UuaCB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGFnZS5oCmluZGV4IDExNWFjOThiOGQ3Mi4uMjM1ZmQ0NWQ5OThkIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BhZ2UuaApAQCAtMTg4LDYgKzE4OCwxMSBAQCBleHRlcm4gcGh5c19hZGRyX3QgX19w
aHlzX2FkZHJfc3ltYm9sKHVuc2lnbmVkIGxvbmcgeCk7CiAKIHVuc2lnbmVkIGxvbmcga2FzbHJf
b2Zmc2V0KHZvaWQpOwogCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgKnBmbl90b19rYWRk
cih1bnNpZ25lZCBsb25nIHBmbikKK3sKKwlyZXR1cm4gX192YShwZm4gPDwgUEFHRV9TSElGVCk7
Cit9CisKICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KIAogI2RlZmluZSB2aXJ0X2FkZHJfdmFs
aWQodmFkZHIpCSh7CQkJCQkJXAotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
