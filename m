Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93AECA0EED
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=763JPD63EKXIt+uvG5kIWaoiv81lqL5so4cGsvRjmJM=; b=bvR+nm8HsjymKc
	VhilGYyswdTVFirJlHRl67mQTFcDEkGqmSVGsH4KhjRnuDw+xXdsG6OvXfH8eWV6dNXkNLXJhBDaS
	MV6rOKrGztvHgVubNzq/IUgZR5KZreUmMgGJHgwivgzMVdegE1QUCCvBJOq6Q0hMC9IYpruFvVMsS
	WbVF/YyKgcxA8HUIqvpsJobvC/DbJYfCxXt4ZntdUZ3iZ6Elyhm0W29S9PqZY5nmv5EFBOGtEeoJF
	R1pUp4P7l0uH1wqwRKUhOCDKDN9uwTQXqggdFfV7QP0KSY0vk/wsDbceBUQDy+IpMccIyIndDuRNE
	eZvZ5hy+/E1bS8mC2CzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojw6-0000000E6mJ-1F6J;
	Wed, 20 Aug 2025 14:37:10 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoj7Z-0000000DsQZ-2MaT
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 13:44:59 +0000
Received: from [127.0.0.2] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowABHN6tT0aVogOTBDQ--.24665S3;
	Wed, 20 Aug 2025 21:44:52 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 20 Aug 2025 21:44:45 +0800
Subject: [PATCH 1/6] riscv: Introduce use_alternative_{likely,unlikely}
MIME-Version: 1.0
Message-Id: <20250820-riscv-altn-helper-wip-v1-1-c3c626c1f7e6@iscas.ac.cn>
References: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
In-Reply-To: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Vivian Wang <uwu@dram.page>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ayd=C4=B1n_Mercan?= <aydin@mercan.dev>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowABHN6tT0aVogOTBDQ--.24665S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAr4fWF4rXw45Ar43JF1UKFg_yoW5Ww4UpF
	s3Ga45AFZ5G3WIyF9xZw1qqr4Yk3yfK3sxXasxKF1jka1jy3yrtr18Jr4Yvr9rA3sxWry7
	JFn7t3W8C3WjkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUjnXo7UUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_064457_965356_86F9DD98 
X-CRM114-Status: UNSURE (   8.45  )
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

SW50cm9kdWNlIGNvbnZlbmllbmNlIGhlbHBlcnMgdXNlX2FsdGVybmF0aXZlX2xpa2VseSgpIGFu
ZAp1c2VfYWx0ZXJuYXRpdmVfdW5saWtlbHkoKSB0byBpbXBsZW1lbnQgdGhlIHBhdHRlcm4gb2Yg
dXNpbmcgYXNtIGdvdG8gdG8KY2hlY2sgaWYgYW4gYWx0ZXJuYXRpdmUgaXMgc2VsZWN0ZWQuIEV4
aXN0aW5nIGNvZGUgd2lsbCBiZSBjb252ZXJ0ZWQgaW4Kc3Vic2VxdWVudCBwYXRjaGVzLgoKU2lt
aWxhciB0byBhcm02NCBhbHRlcm5hdGl2ZV9oYXNfY2FwX3tsaWtlbHksdW5saWtlbHl9LCBidXQg
Zm9yIHJpc2N2LAphbHRlcm5hdGl2ZXMgYXJlIG5vdCBhbGwgQ1BVIGNhcGFiaWxpdGllcy4KClN1
Z2dlc3RlZC1ieTogQXlkxLFuIE1lcmNhbiA8YXlkaW5AbWVyY2FuLmRldj4KU2lnbmVkLW9mZi1i
eTogVml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2FzLmFjLmNuPgotLS0KIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vYWx0ZXJuYXRpdmUtbWFjcm9zLmggfCA3MyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLW1hY3Jvcy5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9hbHRlcm5hdGl2ZS1tYWNyb3MuaAppbmRleCAyMzFkNzc3ZDkzNmMyZDI5
Yzg1OGRlY2FhOWEzZmE1ZjE3MmVmYmI4Li5iZTk4MzViNWU0ZWJhMDNkNzZkYjNhNzNkYTE5YWM5
ZTI5ODFjNGRiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZl
LW1hY3Jvcy5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWx0ZXJuYXRpdmUtbWFjcm9z
LmgKQEAgLTE1OCw0ICsxNTgsNzcgQEAKIAlfQUxURVJOQVRJVkVfQ0ZHXzIob2xkX2NvbnRlbnQs
IG5ld19jb250ZW50XzEsIHZlbmRvcl9pZF8xLCBwYXRjaF9pZF8xLCBDT05GSUdfa18xLAlcCiAJ
CQkJCW5ld19jb250ZW50XzIsIHZlbmRvcl9pZF8yLCBwYXRjaF9pZF8yLCBDT05GSUdfa18yKQog
CisvKgorICogdXNlX2FsdGVybmF0aXZlX3tsaWtlbHksdW5saWtlbHl9KCkgcmV0dXJucyB0cnVl
IGlmIHRoZSBhbHRlcm5hdGl2ZSBpcworICogYXBwbGllZCBhbmQgZmFsc2Ugb3RoZXJ3aXNlLCBi
dXQgaW4gYSB3YXkgd2hlcmUgdGhlIGNvbXBpbGVyIGNhbiBvcHRpbWl6ZQorICogdGhpcyBjaGVj
ayBkb3duIHRvIGEgbm9wIGluc3RydWN0aW9uIHRoYXQncyBwYXRjaGVkIGludG8gYSBqdW1wLCBv
ciB2aWNlCisgKiB2ZXJzYS4KKyAqCisgKiBBbHdheXMgcmV0dXJucyBmYWxzZSBpZiB0aGUgYWx0
ZXJuYXRpdmVzIG1lY2hhbmlzbSBpcyBub3QgYXZhaWxhYmxlLgorICoKKyAqIFVzYWdlIGV4YW1w
bGU6CisgKiAgIGlmICh1c2VfYWx0ZXJuYXRpdmVfbGlrZWx5KDAsIFJJU0NWX0lTQV9aQkIpKQor
ICoKKyAqIFNpbWlsYXIgdG8gc3RhdGljIGtleXMsICJsaWtlbHkiIG1lYW5zIHVzZSBhIG5vcCBp
ZiB0aGUgYWx0ZXJuYXRpdmUgaXMKKyAqIHNlbGVjdGVkLCBhbmQganVtcCBpZiB1bnNlbGVjdGVk
OyAidW5saWtlbHkiIGlzIHRoZSBvdGhlciB3YXkgYXJvdW5kLgorICovCisKKyNpZm5kZWYgX19B
U1NFTUJMRVJfXworCisjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KKworI2lmZGVmIENPTkZJR19S
SVNDVl9BTFRFUk5BVElWRQorCitzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgdXNlX2FsdGVy
bmF0aXZlX2xpa2VseSh1MTYgdmVuZG9yX2lkLCB1MzIgcGF0Y2hfaWQpCit7CisJQlVJTERfQlVH
X09OKCFfX2J1aWx0aW5fY29uc3RhbnRfcCh2ZW5kb3JfaWQpKTsKKwlCVUlMRF9CVUdfT04oIV9f
YnVpbHRpbl9jb25zdGFudF9wKHBhdGNoX2lkKSk7CisKKwlhc20gZ290byhBTFRFUk5BVElWRSgi
aiAlbFtub19hbHRdIiwgIm5vcCIsICVbdmVuZG9yX2lkXSwgJVtwYXRjaF9pZF0sIDEpCisJCSA6
CisJCSA6IFt2ZW5kb3JfaWRdICJpIih2ZW5kb3JfaWQpLAorCQkgICBbcGF0Y2hfaWRdICJpIihw
YXRjaF9pZCkKKwkJIDoKKwkJIDogbm9fYWx0KTsKKworCXJldHVybiB0cnVlOworCitub19hbHQ6
CisJcmV0dXJuIGZhbHNlOworfQorCitzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgdXNlX2Fs
dGVybmF0aXZlX3VubGlrZWx5KHUxNiB2ZW5kb3JfaWQsIHUzMiBwYXRjaF9pZCkKK3sKKwlCVUlM
RF9CVUdfT04oIV9fYnVpbHRpbl9jb25zdGFudF9wKHZlbmRvcl9pZCkpOworCUJVSUxEX0JVR19P
TighX19idWlsdGluX2NvbnN0YW50X3AocGF0Y2hfaWQpKTsKKworCWFzbSBnb3RvKEFMVEVSTkFU
SVZFKCJub3AiLCAiaiAlbFthbHRdIiwgJVt2ZW5kb3JfaWRdLCAlW3BhdGNoX2lkXSwgMSkKKwkJ
IDoKKwkJIDogW3ZlbmRvcl9pZF0gImkiKHZlbmRvcl9pZCksCisJCSAgIFtwYXRjaF9pZF0gImki
KHBhdGNoX2lkKQorCQkgOgorCQkgOiBhbHQpOworCisJcmV0dXJuIGZhbHNlOworCithbHQ6CisJ
cmV0dXJuIHRydWU7Cit9CisKKyNlbHNlCisKK3N0YXRpYyBpbmxpbmUgYm9vbCB1c2VfYWx0ZXJu
YXRpdmVfbGlrZWx5KHUxNiB2ZW5kb3JfaWQsIHUzMiBwYXRjaF9pZCkKK3sKKwlyZXR1cm4gZmFs
c2U7Cit9CisKK3N0YXRpYyBpbmxpbmUgYm9vbCB1c2VfYWx0ZXJuYXRpdmVfdW5saWtlbHkodTE2
IHZlbmRvcl9pZCwgdTMyIHBhdGNoX2lkKQoreworCXJldHVybiBmYWxzZTsKK30KKworI2VuZGlm
IC8qIENPTkZJR19SSVNDVl9BTFRFUk5BVElWRSAqLworCisjZW5kaWYgLyogX19BU1NFTUJMRVJf
XyAqLworCiAjZW5kaWYKCi0tIAoyLjUwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
