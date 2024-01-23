Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA84EC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 02:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0GZkMi1OA68gJYAzrpaRVn/ng1r+0N8R7Dksoam9R0U=; b=ZMjbjcDZjIh3R2
	wYLLqzIZ0aXZ2RZQ6ukP9ol/LdLwGJMRBHpKi54NTkO8R730AVXEc+0tDS5p4dOblosEf/SgI8d5k
	66uuRsePGam17iZh6ljSIvRWsO+yGaWEO2h74rPJsK0rRsbt7L/oDUL5FGD4yIllNXU6ZRPS8t4A3
	kq2MkKuGXJHXrFuoLGnAUYcHal4RgaEW5IX0/KIIfVjl2sJ+TmOaeroeeTP45lhsg6Ij2Z7rjExIP
	mUCEOUE9hKCG/H3lv7hkuJjsXEGedze+PSlZuUzPdh2o5qOqcR63nyNFphcIYJWIV+s4CiXifWYhr
	JXAAxmU0lYfsgHhYc4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS6Zg-00EuCJ-12;
	Tue, 23 Jan 2024 02:31:40 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS6Zc-00EuAq-01
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 02:31:38 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TJrgY4rNYz4f3jHw
	for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 10:31:21 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id E9E4C1A016E
	for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 10:31:27 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgCHqg3+JK9lkTDZBg--.54023S2;
	Tue, 23 Jan 2024 10:31:27 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
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
Subject: [PATCH bpf] riscv, bpf: Fix unpredictable kernel crash about RV64 struct_ops
Date: Tue, 23 Jan 2024 02:32:07 +0000
Message-Id: <20240123023207.1917284-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgCHqg3+JK9lkTDZBg--.54023S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1rWrW3Zw4kXFy5ZryUGFg_yoW5tF48pF
	15Gr15CF48XrnrGF1kXF4UXr13t3yqva47GFy7Gr4F9a45Wry8Ar18tayjyry5KFn09r17
	JF1qvw1ktr18A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	fUOmhFUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_183136_385478_4225B666 
X-CRM114-Status: GOOD (  10.94  )
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

RnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCldlIGVuY291bnRlcmVkIGEga2Vy
bmVsIGNyYXNoIHRyaWdnZXJlZCBieSB0aGUgYnBmX3RjcF9jYSB0ZXN0Y2FzZSBhcwpzaG93IGJl
bG93OgoKVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBh
ZGRyZXNzIGZmNjAwMDAwODg1NTQ1MDAKT29wcyBbIzFdCi4uLgpDUFU6IDMgUElEOiA0NTggQ29t
bTogdGVzdF9wcm9ncyBUYWludGVkOiBHICAgICAgICAgICBPRSAgICAgIDYuOC4wLXJjMS1rc2Vs
ZnRlc3RfcGxhaW4gIzEKSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQplcGMg
OiAweGZmNjAwMDAwODg1NTQ1MDAKIHJhIDogdGNwX2FjaysweDI4OC8weDEyMzIKZXBjIDogZmY2
MDAwMDA4ODU1NDUwMCByYSA6IGZmZmZmZmZmODBjYzcxNjYgc3AgOiBmZjIwMDAwMDAxMTdiYTUw
CiBncCA6IGZmZmZmZmZmODI1ODdiNjAgdHAgOiBmZjYwMDAwMDg3YmUwMDQwIHQwIDogZmY2MDAw
MDA4ODU1NDUwMAogdDEgOiBmZmZmZmZmZjgwMWVkMjRlIHQyIDogMDAwMDAwMDAwMDAwMDAwMCBz
MCA6IGZmMjAwMDAwMDExN2JiYzAKIHMxIDogMDAwMDAwMDAwMDAwMDUwMCBhMCA6IGZmMjAwMDAw
MDA2OTEwMDAgYTEgOiAwMDAwMDAwMDAwMDAwMDE4CiBhMiA6IDAwMDAwMDAwMDAwMDAwMDEgYTMg
OiBmZjYwMDAwMDg3YmUwM2EwIGE0IDogMDAwMDAwMDAwMDAwMDAwMAogYTUgOiAwMDAwMDAwMDAw
MDAwMDAwIGE2IDogMDAwMDAwMDAwMDAwMDAyMSBhNyA6IGZmZmZmZmZmODI2M2Y4ODAKIHMyIDog
MDAwMDAwMDA0YWMzYzEzYiBzMyA6IDAwMDAwMDAwNGFjM2MxM2EgczQgOiAwMDAwMDAwMDAwMDA4
MjAwCiBzNSA6IDAwMDAwMDAwMDAwMDAwMDEgczYgOiAwMDAwMDAwMDAwMDAwMTA0IHM3IDogZmYy
MDAwMDAwMTE3YmIwMAogczggOiBmZjYwMDAwMDg4NTU0NGMwIHM5IDogMDAwMDAwMDAwMDAwMDAw
MCBzMTA6IGZmNjAwMDAwODZmZjBiODAKIHMxMTogMDAwMDU1NTU3OTgzYTljMCB0MyA6IDAwMDAw
MDAwMDAwMDAwMDAgdDQgOiAwMDAwMDAwMDAwMDBmZmM0CiB0NSA6IGZmZmZmZmZmODE1NGYxNzAg
dDYgOiAwMDAwMDAwMDAwMDAwMDMwCnN0YXR1czogMDAwMDAwMDIwMDAwMDEyMCBiYWRhZGRyOiBm
ZjYwMDAwMDg4NTU0NTAwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBjCkNvZGU6IGM3OTYgNjdkNyAw
MDAwIDAwMDAgMDA1MiAwMDAyIGMxM2IgNGFjMyAwMDAwIDAwMDAgKDAwMDEpIDAwMDAKLS0tWyBl
bmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCgpUaGUgcmVhc29uIGlzIHRoYXQgY29tbWl0
IDJjZDNlMzc3MmU0MSAoIng4Ni9jZmksYnBmOiBGaXggYnBmX3N0cnVjdF9vcHMKQ0ZJIikgY2hh
bmdlcyB0aGUgZnVuY19hZGRyIG9mIGFyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZSBpbiBzdHJ1
Y3Rfb3BzCmZyb20gTlVMTCB0byBub24tTlVMTCwgd2hpbGUgd2UgdXNlIGZ1bmNfYWRkciBvbiBS
VjY0IHRvIGRpZmZlcmVudGlhdGUKYmV0d2VlbiBzdHJ1Y3Rfb3BzIGFuZCByZWd1bGFyIHRyYW1w
b2xpbmUuIFdoZW4gdGhlIHN0cnVjdF9vcHMgdGVzdGNhc2UKaXMgdHJpZ2dlcmVkLCBpdCBlbWl0
cyB3cm9uZyBwcm9sb2d1ZSBhbmQgZXBpbG9ndWUsIGFuZCBsZWFkIHRvCnVucHJlZGljdGFibGUg
aXNzdWVzLiBBZnRlciBjb21taXQgMmNkM2UzNzcyZTQxLCB3ZSBjYW4gdXNlCkJQRl9UUkFNUF9G
X0lORElSRUNUIHRvIGRpc3Rpbmd1aXNoIHRoZW0gYXMgaXQgYWx3YXlzIGJlIHNldCBpbgpzdHJ1
Y3Rfb3BzLgoKRml4ZXM6IDJjZDNlMzc3MmU0MSAoIng4Ni9jZmksYnBmOiBGaXggYnBmX3N0cnVj
dF9vcHMgQ0ZJIikKU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4K
VGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CkFja2VkLWJ5OiBC
asO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmluZGV4IDU4ZGM2NGRkOTRhOC4u
NzE5YTk3ZTdlZGIyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
CisrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAgLTc5NSw2ICs3OTUsNyBA
QCBzdGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZfdHJh
bXBfaW1hZ2UgKmltLAogCXN0cnVjdCBicGZfdHJhbXBfbGlua3MgKmZlbnRyeSA9ICZ0bGlua3Nb
QlBGX1RSQU1QX0ZFTlRSWV07CiAJc3RydWN0IGJwZl90cmFtcF9saW5rcyAqZmV4aXQgPSAmdGxp
bmtzW0JQRl9UUkFNUF9GRVhJVF07CiAJc3RydWN0IGJwZl90cmFtcF9saW5rcyAqZm1vZF9yZXQg
PSAmdGxpbmtzW0JQRl9UUkFNUF9NT0RJRllfUkVUVVJOXTsKKwlib29sIGlzX3N0cnVjdF9vcHMg
PSBmbGFncyAmIEJQRl9UUkFNUF9GX0lORElSRUNUOwogCXZvaWQgKm9yaWdfY2FsbCA9IGZ1bmNf
YWRkcjsKIAlib29sIHNhdmVfcmV0OwogCXUzMiBpbnNuOwpAQCAtODc4LDcgKzg3OSw3IEBAIHN0
YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9p
bWFnZSAqaW0sCiAKIAlzdGFja19zaXplID0gcm91bmRfdXAoc3RhY2tfc2l6ZSwgMTYpOwogCi0J
aWYgKGZ1bmNfYWRkcikgeworCWlmICghaXNfc3RydWN0X29wcykgewogCQkvKiBGb3IgdGhlIHRy
YW1wb2xpbmUgY2FsbGVkIGZyb20gZnVuY3Rpb24gZW50cnksCiAJCSAqIHRoZSBmcmFtZSBvZiB0
cmFjZWQgZnVuY3Rpb24gYW5kIHRoZSBmcmFtZSBvZgogCQkgKiB0cmFtcG9saW5lIG5lZWQgdG8g
YmUgY29uc2lkZXJlZC4KQEAgLTk5OCw3ICs5OTksNyBAQCBzdGF0aWMgaW50IF9fYXJjaF9wcmVw
YXJlX2JwZl90cmFtcG9saW5lKHN0cnVjdCBicGZfdHJhbXBfaW1hZ2UgKmltLAogCiAJZW1pdF9s
ZChSVl9SRUdfUzEsIC1zcmVnX29mZiwgUlZfUkVHX0ZQLCBjdHgpOwogCi0JaWYgKGZ1bmNfYWRk
cikgeworCWlmICghaXNfc3RydWN0X29wcykgewogCQkvKiB0cmFtcG9saW5lIGNhbGxlZCBmcm9t
IGZ1bmN0aW9uIGVudHJ5ICovCiAJCWVtaXRfbGQoUlZfUkVHX1QwLCBzdGFja19zaXplIC0gOCwg
UlZfUkVHX1NQLCBjdHgpOwogCQllbWl0X2xkKFJWX1JFR19GUCwgc3RhY2tfc2l6ZSAtIDE2LCBS
Vl9SRUdfU1AsIGN0eCk7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
