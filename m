Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FD1C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VW/INwyWtR8XdrZ979WVC7DcZi3BjMXdD2oQR94A1EA=; b=Xtg1xmw6Noai/4
	2ghOWsveRr0k84OQNuXdp041VUcUjSBMwWDbh/EGnH2SUmP0UyASs3EEPxuU0idvRbCx0xeWel8W/
	/QiDcoSIg5TaF9VSvDARgjWbVH6vMpFa8MToiFmqFGqETU6OKO7AbaRPNU35mycNdz62m2eHvwiZq
	O4AJ05wNi8fw07kKtf2fI03JiUqjganbNZdm944pc/GqkDhhmjPnPu4s105yNTP78HJZWzKkGmDos
	0jY0cIZLBgY8zUSRdlQs0ocbBU0n67/Z/u2Lv+VUxfSbWuBVXybTVrrmAp9ehWc8vVLbhi0Fvfq9Q
	9FnNHOFtoGbvs+FvBqfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9Ye-00B3VI-Pt; Wed, 01 Feb 2023 09:37:36 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9Yb-00B3T7-1o
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 09:37:35 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4P6Gxd61dSzJrSM;
	Wed,  1 Feb 2023 17:35:49 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 1 Feb 2023 17:37:25 +0800
Message-ID: <9a4f98a7-fa03-7960-29ce-0bff018c0ac9@huawei.com>
Date: Wed, 1 Feb 2023 17:37:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: Add header include guards to insn.h
To: Conor Dooley <conor.dooley@microchip.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko.stuebner@vrull.eu>, <ajones@ventanamicro.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <jszhang@kernel.org>,
	<vincent.chen@sifive.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230129094242.282620-1-liaochang1@huawei.com>
 <Y9fZ2ZxdMmXgO5aB@wendy>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <Y9fZ2ZxdMmXgO5aB@wendy>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_013733_432627_7DC22ECF 
X-CRM114-Status: GOOD (  17.31  )
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

SGksIENvbm9yCgrlnKggMjAyMy8xLzMwIDIyOjUzLCBDb25vciBEb29sZXkg5YaZ6YGTOgo+IEhl
eSEKPiAKPiBPbiBTdW4sIEphbiAyOSwgMjAyMyBhdCAwNTo0Mjo0MlBNICswODAwLCBMaWFvIENo
YW5nIHdyb3RlOgo+PiBBZGQgaGVhZGVyIGluY2x1ZGUgZ3VhcmRzIHRvIGluc24uaCB0byBwcmV2
ZW50IHJlcGVhdGluZyBkZWNsYXJhdGlvbiBvZgo+PiBhbnkgaWRlbnRpZmllcnMgaW4gaW5zbi5o
Lgo+IAo+IEknbSBjdXJpb3VzLCBkaWQgeW91IHNwb3QgdGhpcyAiYnkgaGFuZCIgd2hpbGUgZG9p
bmcgb3RoZXIgd29yaywgb3IgZG8KPiB5b3UgaGF2ZSBhIHRvb2wgdGhhdCBmb3VuZCBpdCBmb3Ig
eW91PwoKSSBmb3VuZCB0aGlzICJieSBoYW5kIiwgaW5zcGlyZWQgYnkgc2NyaXB0cy9jaGVja2Rl
Y2xhcmVzLnBsLCBpIHdyaXRlIGEgdGlueSB0b29sCnRvIGFuYWx5c2UgdGhlIG1pc3NpbmcgaGVh
ZGVyIGd1YXJkcyBpbiBoZWFkZXIgZmlsZS4KCiMhL3Vzci9iaW4vZW52IHBlcmwKdXNlIHN0cmlj
dDsKCnN1YiB1c2FnZSB7CiAgICAgICAgcHJpbnQgIlVzYWdlOiBjaGVja2d1YXJkcy5wbCBmaWxl
MS5oIC4uLlxuIjsKICAgICAgICBwcmludCAiV2FybiBvZiBtaXNzaW5nIGhlYWRlciBndWFyZHNc
biI7CiAgICAgICAgZXhpdCAxOwp9CgppZiAoJCNBUkdWIDwgMCkgewogICAgICAgIHVzYWdlKCk7
Cn0KCmZvcmVhY2ggbXkgJGZpbGUgKEBBUkdWKSB7CiAgICAgICAgb3BlbihteSAkZiwgJzwnLCAk
ZmlsZSkKICAgICAgICAgICAgb3IgZGllICJDYW5ub3Qgb3BlbiAkZmlsZTogJCEuXG4iOwoKICAg
ICAgICBteSAkc2Nhbl9hcmVhID0gMTsKICAgICAgICBteSAkZ3VhcmRzX3dhcm4gPSAwOwoKICAg
ICAgICAjIFRoZSBsaW5lcyBvZiBoZWFkZXIgZmlsZSBhcmUgZGl2aWRlZCBpbnRvIHNldmVyYWwg
YXJlYXMgYXMgZm9sbG93czoKICAgICAgICAjCiAgICAgICAgIyAuLi4gYXJlYTEgLi4uCiAgICAg
ICAgIyAjaWZuZGVmIF9IRUFERVJfR1VBUkQKICAgICAgICAjIC4uLiBhcmVhMiAuLi4KICAgICAg
ICAjICNkZWZpbmUgX0hFQURFUl9HVUFSRAogICAgICAgICMgLi4uIGFyZWEzIC4uLgogICAgICAg
ICMgI2VuZGlmIC8qIF9IRUFERVJfR1VBUkQgKi8KICAgICAgICAjIC4uLiBhcmVhNCAuLi4KICAg
ICAgICAjIEVPRgogICAgICAgICMKICAgICAgICAjIElmIGFueSBzdGF0ZW1lbnQgaXMgZm91bmQg
aW4gYXJlYTEsIGFyZWEyLCBhbmQgYXJlYTQsIGl0CiAgICAgICAgIyB0aHJvd3MgYSB3YXJuaW5n
IG9mIGlsbGVnYWwgdXNhZ2Ugb2YgaGVhZGVyIGd1YXJkIHVzYWdlLgogICAgICAgIHdoaWxlICg8
JGY+KSB7CiAgICAgICAgICAgICAgICBpZiAobS9eKC4qKTtccyokL28pIHsKICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKCRzY2FuX2FyZWEgPT0gMSB8fCAkc2Nhbl9hcmVhID09IDIgfHwgJHNj
YW5fYXJlYSA9PSA0KSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKyskZ3VhcmRz
X3dhcm47CiAgICAgICAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIH0gZWxzaWYg
KG0vXlxzKigjaWZuZGVmXHMrKVthLXpBLVowLTlfXSpfSFtfXSpccyokL28pIHsKICAgICAgICAg
ICAgICAgICAgICAgICAgKyskc2Nhbl9hcmVhOwogICAgICAgICAgICAgICAgfSBlbHNpZiAobS9e
XHMqKCNkZWZpbmVccyspW2EtekEtWjAtOV9dKl9IW19dKlxzKiQvbykgewogICAgICAgICAgICAg
ICAgICAgICAgICArKyRzY2FuX2FyZWE7CiAgICAgICAgICAgICAgICB9IGVsc2lmIChtL15ccyoo
I2VuZGlmKVxzKlwvXCpccypbYS16QS1aMC05X10qX0hbX10qXHMqXCpcL1xzKiQvbykgewogICAg
ICAgICAgICAgICAgICAgICAgICArKyRzY2FuX2FyZWE7CiAgICAgICAgICAgICAgICB9CiAgICAg
ICAgfQoKICAgICAgICBjbG9zZSgkZik7CgogICAgICAgIGlmICgkZ3VhcmRzX3dhcm4pIHsKICAg
ICAgICAgICAgICAgIHByaW50ICJJbGxlZ2FsIHVzYWdlIG9mIGhlYWRlciBndWFyZCBmb3VuZCBp
biAkZmlsZS5cbiI7CiAgICAgICAgfQp9CgpUaGFua3MuCgo+IAo+PiBGaXhlczogZWRkZTU1ODRj
N2FiICgicmlzY3Y6IEFkZCBTVyBzaW5nbGUtc3RlcCBzdXBwb3J0IGZvciBLREIiKQo+IAo+IEhl
aCwgSSBhcHByZWNpYXRlIHlvdSBnb2luZyBiYWNrIHRvIHRoZSBmaWxlJ3Mgb3JpZ2luYWwgbmFt
ZSB0byBmaW5kIHRoZQo+IGNvcnJlY3QgZml4ZXMgdGFnIQo+IEkgZmlndXJlIHRoYXQgaXQncyBw
cm9iYWJseSB3b3J0aCBhZGRpbmcgYSBmaXhlcyB0YWcgZm9yIHRoZSByZW5hbWUgdG9vLAo+IHNv
IHRoYXQgdGhlIHN0YWJsZSBib3RzIGRvbid0IGdldCBjb25mdXNlZD8gVGhhdCB3b3VsZCBiZToK
PiBGaXhlczogYzljMWFmM2YxODZhICgiUklTQy1WOiByZW5hbWUgcGFyc2VfYXNtLmggdG8gaW5z
bi5oIikKPiAKPiBQcm9iYWJseSBvdmVya2lsbCB3aGVuIHlvdSBoYXZlIERyZXcncyBhbHJlYWR5
IGZvciBzb21ldGhpbmcgc28gdHJpdmlhbCwKPiBidXQ6Cj4gUmV2aWV3ZWQtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gCj4+IFNpZ25lZC1vZmYtYnk6IExp
YW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2luc24uaCB8IDQgKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaAo+PiBpbmRleCAyNWVmOWMwYjE5ZTcuLjIyYzc2
MTNiZmRhMyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLmgKPj4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLmgKPj4gQEAgLTMsNiArMyw5IEBACj4+
ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjAgU2lGaXZlCj4+ICAgKi8KPj4gIAo+PiArI2lmbmRlZiBf
QVNNX1JJU0NWX0lOU05fSAo+PiArI2RlZmluZSBfQVNNX1JJU0NWX0lOU05fSAo+PiArCj4+ICAj
aW5jbHVkZSA8bGludXgvYml0cy5oPgo+PiAgCj4+ICAjZGVmaW5lIFJWX0lOU05fRlVOQ1QzX01B
U0sJR0VOTUFTSygxNCwgMTIpCj4+IEBAIC0zNjUsMyArMzY4LDQgQEAgc3RhdGljIGlubGluZSB2
b2lkIHJpc2N2X2luc25faW5zZXJ0X3V0eXBlX2l0eXBlX2ltbSh1MzIgKnV0eXBlX2luc24sIHUz
MiAqaXR5cGUKPj4gIAkqdXR5cGVfaW5zbiB8PSAoaW1tICYgUlZfVV9JTU1fMzFfMTJfTUFTSykg
KyAoKGltbSAmIEJJVCgxMSkpIDw8IDEpOwo+PiAgCSppdHlwZV9pbnNuIHw9ICgoaW1tICYgUlZf
SV9JTU1fMTFfMF9NQVNLKSA8PCBSVl9JX0lNTV8xMV8wX09QT0ZGKTsKPj4gIH0KPj4gKyNlbmRp
ZiAvKiBfQVNNX1JJU0NWX0lOU05fSCAqLwo+PiAtLSAKPj4gMi4yNS4xCj4+Cj4+CgotLSAKQlIs
CkxpYW8sIENoYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
