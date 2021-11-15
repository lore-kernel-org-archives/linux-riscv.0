Return-Path: <SRS0=clKS=QC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4417C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Nov 2021 08:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 335FD61BE5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Nov 2021 08:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 335FD61BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgOEFyVJf6DrhxwzYo2k90GBn8zYMnolv+QMUHBCPis=; b=T9cSEUB7jtoxo7
	X+zTNbUsu2NTq1XqrzgCIAYZCTZIGyhyPdcyLl6B2XZO7qJVe9GCo6KZkxnbW8vOCUBIyz/NPKy1U
	vmcxNkDs3M+rlmVbLxl/oh17sA0Xqp/y3O+ZIbGgQ1Qj7WbTVSMQmD3IybFc+UuJuFrgWz9qAsZXa
	StllJkEmBUunQnYXjNFjM6KmmEnkoK4j4xHv3vg4wGSGPXrnrsMBhpCAkDi/k9p7Ik772/oOPl8dL
	4fQOvUfo040oNAqyZ1+ojnSbE+yZ2kYrajMt4iVW/YpSUo/xG/p6k4TONP/hcICJPC0LDz8ro8DTi
	/6xKirXKnrUkRu0zCfHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmXH4-00EgGE-S1; Mon, 15 Nov 2021 08:23:34 +0000
Received: from forward500p.mail.yandex.net ([77.88.28.110])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmXH0-00EgDg-II
 for linux-riscv@lists.infradead.org; Mon, 15 Nov 2021 08:23:33 +0000
Received: from vla5-44bee570b035.qloud-c.yandex.net
 (vla5-44bee570b035.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3484:0:640:44be:e570])
 by forward500p.mail.yandex.net (Yandex) with ESMTP id 0AD2BF01A63;
 Mon, 15 Nov 2021 11:23:19 +0300 (MSK)
Received: from vla5-3832771863b8.qloud-c.yandex.net
 (vla5-3832771863b8.qloud-c.yandex.net [2a02:6b8:c18:3417:0:640:3832:7718])
 by vla5-44bee570b035.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 Liiq01EwtD-NIDiDhLd; Mon, 15 Nov 2021 11:23:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1636964598; bh=PRopPFcE3KxGPGj0OHeqeAERWAy7s7ryVeRisx15Hlk=;
 h=In-Reply-To:Subject:To:From:References:Date:Message-ID:Cc;
 b=IhJYbVF/D8FxS54GN93ub+HmunHYcr+ZtcyVNY1LGrxIEaC/uh/cHkPLHN6MXy4Zi
 hGDQLN/u7kwVjPQpILJhv5wqjFs2z1yEUs5C2Lt3dj3RpKXruQjS6lQtJtl/PErps2
 b2lnQKQH22ojCYSyD1PN0Il6wgysBxlJkDLtz66s=
Authentication-Results: vla5-44bee570b035.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by vla5-3832771863b8.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 PibD4u7o2P-NHwGnLNn; Mon, 15 Nov 2021 11:23:17 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Mon, 15 Nov 2021 11:23:16 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: =?ISO-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] RISC-V: Create unique identification for SoC PMU
Message-ID: <20211115112316.6158e1ff@redslave.neermore.group>
In-Reply-To: <20211109102555.16381-2-joao.mario@tecnico.ulisboa.pt>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211109102555.16381-2-joao.mario@tecnico.ulisboa.pt>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_002331_181788_84752D1D 
X-CRM114-Status: GOOD (  22.09  )
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

SGVsbG8gTcOhcmlvLgoKT24gVHVlLCAgOSBOb3YgMjAyMSAxMDoyNTo1MiArMDAwMApKb8OjbyBN
w6FyaW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0PiB3cm90ZToKCj4g
VGhlIFNCSSBQTVUgcGxhdGZvcm0gZHJpdmVyIGRpZCBub3QgcHJvdmlkZSBhbnkgaWRlbnRpZmlj
YXRpb24gZm9yCj4gcGVyZiBldmVudHMgbWF0Y2hpbmcuIFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBh
IG5ldyBzeXNmcyBmaWxlIGluc2lkZQo+IHRoZSBwbGF0Zm9ybSBkZXZpY2UgKHNvYzpwbXUvaWQp
IGZvciBwbXUgaWRlbnRpZmljYXRpb24uCj4gCj4gVGhlIGlkZW50aWZpY2F0aW9uIGlzIGEgNjQt
Yml0IHZhbHVlIGdlbmVyYXRlZCBhczoKPiBbNjMtMzJdOiBtdmVuZG9yaWQ7Cj4gWzMxXTogbWFy
Y2hpZFtNU0JdOwo+IFszMC0xNl06IG1hcmNoaWRbMTUtMF07Cj4gWzE1LTBdOiBtaW1waWRbMTVN
U0JzXTsKPiAKPiBUaGUgQ1NScyBhcmUgZGV0YWlsZWQgaW4gdGhlIFJJU0MtViBwcml2aWxlZ2Vk
IHNwZWMgWzFdLgo+IFRoZSBtYXJjaGlkIGlzIHNwbGl0IGluIE1TQiArIDE1TFNCcywgZHVlIHRv
IHRoZSBNU0IgYmVpbmcgdXNlZCBmb3IKPiBvcGVuLXNvdXJjZSBhcmNoaXRlY3R1cmUgaWRlbnRp
ZmljYXRpb24uCj4gCgpUaGlzIHBhdGNoIGRvZXNuJ3QgY29tcGlsZSBhbmQgYWxzbyBoYXMgYSB3
YXJuaW5nOgpgYGAKZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYzoyMzk6NDM6IGVycm9yOiAn
cG11X3NiaV9pZF9zaG93Jwp1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKQogIDIz
OSB8IHN0YXRpYyBERVZJQ0VfQVRUUihpZCwgU19JUlVHTyB8IFNfSVdVU1IsIHBtdV9zYmlfaWRf
c2hvdywgMCk7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+CmluY2x1ZGUvbGludXgvc3lzZnMuaDoxMDQ6MTk6IG5vdGU6IGlu
IGRlZmluaXRpb24gb2YgbWFjcm8gJ19fQVRUUicKICAxMDQgfCAgICAgICAgIC5zaG93ICAgPSBf
c2hvdywKICAgICAgICBcCiAgICAgIHwgICAgICAgICAgICAgICAgICAgXn5+fn4KZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYzoyMzk6ODogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvCidE
RVZJQ0VfQVRUUicKICAyMzkgfCBzdGF0aWMgREVWSUNFX0FUVFIoaWQsIFNfSVJVR08gfCBTX0lX
VVNSLCBwbXVfc2JpX2lkX3Nob3csIDApOwogICAgICB8ICAgICAgICBefn5+fn5+fn5+fgpkcml2
ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jOiBJbiBmdW5jdGlvbiAncG11X3NiaV9pZF9zaG93JzoK
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYzo2NzU6Mjk6IHdhcm5pbmc6IGZvcm1hdCAnJWx4
JyBleHBlY3RzCmFyZ3VtZW50IG9mIHR5cGUgJ2xvbmcgdW5zaWduZWQgaW50JywgCmJ1dCBhcmd1
bWVudCAzIGhhcyB0eXBlICd1aW50NjRfdCcge2FrYSAnbG9uZyBsb25nIHVuc2lnbmVkIGludCd9
ClstV2Zvcm1hdD1dCiAgNjc1IHwgICAgIGxlbiA9IHNwcmludGYoYnVmLCAiMHglbHhcbiIsIHBt
dV9zYmlfZ2V0X3BtdV9pZCgpKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+
XiAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn4KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICAgfAogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICB1
aW50NjRfdCB7YWthIGxvbmcgbG9uZwp1bnNpZ25lZCBpbnR9CiAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGxvbmcgdW5zaWduZWQgaW50CiAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAlbGx4CmBgYAoKTWF5IGJlIHlvdSB3YW50ZWQgdG8gcGxhY2UgREVWSUNFX0FU
VFIgYWZ0ZXIgcG11X3NiaV9pZF9zaG93IGZ1bmN0aW9uCmRlY2xhcmF0aW9uID8KClBsZWFzZSBj
aGVjayB3aXRoIGEgY2xlYW4gYnVpbGQuCgpZb3VycywKTmlraXRhIFNodWJpbgoKPiBbMV0gaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKb8OjbyBNw6FyaW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0Pgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyAgICAgIHwgIDMgKysrCj4gIGRyaXZlcnMv
cGVyZi9yaXNjdl9wbXVfc2JpLmMgfCA0Ngo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKyAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+IGlu
ZGV4IDc0MDJhNDE3ZjM4ZS4uNGU0ZjU2NzFiODY0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NiaS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiBAQCAtNTUxLDE2
ICs1NTEsMTkgQEAgbG9uZyBzYmlfZ2V0X212ZW5kb3JpZCh2b2lkKQo+ICB7Cj4gIAlyZXR1cm4g
X19zYmlfYmFzZV9lY2FsbChTQklfRVhUX0JBU0VfR0VUX01WRU5ET1JJRCk7Cj4gIH0KPiArRVhQ
T1JUX1NZTUJPTChzYmlfZ2V0X212ZW5kb3JpZCk7Cj4gIAo+ICBsb25nIHNiaV9nZXRfbWFyY2hp
ZCh2b2lkKQo+ICB7Cj4gIAlyZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklfRVhUX0JBU0VfR0VU
X01BUkNISUQpOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0woc2JpX2dldF9tYXJjaGlkKTsKPiAgCj4g
IGxvbmcgc2JpX2dldF9taW1waWQodm9pZCkKPiAgewo+ICAJcmV0dXJuIF9fc2JpX2Jhc2VfZWNh
bGwoU0JJX0VYVF9CQVNFX0dFVF9NSU1QSUQpOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0woc2JpX2dl
dF9taW1waWQpOwo+ICAKPiAgc3RhdGljIHZvaWQgc2JpX3NlbmRfY3B1bWFza19pcGkoY29uc3Qg
c3RydWN0IGNwdW1hc2sgKnRhcmdldCkKPiAgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYv
cmlzY3ZfcG11X3NiaS5jCj4gYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGluZGV4IDdh
NjhkZmE4OWY2Zi4uZjkxM2Q4ZGRmZTczIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNj
dl9wbXVfc2JpLmMKPiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gQEAgLTIz
Niw2ICsyMzYsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwbXVfZXZlbnRfZGF0YQo+IHBtdV9j
YWNoZV9ldmVudF9tYXBbUEVSRl9DT1VOVF9IV19DQUNIRV9NQVhdIH0sCj4gIH07Cj4gIAo+ICtz
dGF0aWMgREVWSUNFX0FUVFIoaWQsIFNfSVJVR08gfCBTX0lXVVNSLCBwbXVfc2JpX2lkX3Nob3cs
IDApOwo+ICsKPiArc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKnBtdV9zYmlfYXR0cnNbXSA9IHsK
PiArICAgICZkZXZfYXR0cl9pZC5hdHRyLAo+ICsgICAgTlVMTAo+ICt9Owo+ICsKPiArQVRUUklC
VVRFX0dST1VQUyhwbXVfc2JpKTsKPiArCj4gIHN0YXRpYyBpbnQgcG11X3NiaV9jdHJfZ2V0X3dp
ZHRoKGludCBpZHgpCj4gIHsKPiAgCXJldHVybiBwbXVfY3RyX2xpc3RbaWR4XS53aWR0aDsKPiBA
QCAtNjQyLDYgKzY1MSwzNiBAQCBzdGF0aWMgaW50IHBtdV9zYmlfc2V0dXBfaXJxcyhzdHJ1Y3Qg
cmlzY3ZfcG11Cj4gKnBtdSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRlIHJldHVybiAwOwo+
ICB9Cj4gIAo+ICtzdGF0aWMgdWludDY0X3QgcG11X3NiaV9nZXRfcG11X2lkKHZvaWQpCj4gK3sK
PiArCXVuaW9uIHNiaV9wbXVfaWQgewo+ICsJCXVpbnQ2NF90IHZhbHVlOwo+ICsJCXN0cnVjdCB7
Cj4gKwkJCXVpbnQxNl90IGltcDoxNjsKPiArCQkJdWludDE2X3QgYXJjaDoxNjsKPiArCQkJdWlu
dDMyX3QgdmVuZG9yOjMyOwo+ICsJCX07Cj4gKwl9cG11aWQ7Cj4gKwo+ICsJcG11aWQudmFsdWUg
PSAwOwo+ICsJcG11aWQudmVuZG9yID0gKHVpbnQzMl90KSBzYmlfZ2V0X212ZW5kb3JpZCgpOwo+
ICsJcG11aWQuYXJjaCA9IChzYmlfZ2V0X21hcmNoaWQoKSA+PiAoNjMgLSAxNSkgJiAoMSA8PCAx
NSkpIHwKPiAoIHNiaV9nZXRfbWFyY2hpZCgpICYgMHg3RkZGICk7Cj4gKwlwbXVpZC5pbXAgPSAo
c2JpX2dldF9taW1waWQoKSA+PiAxNik7Cj4gKwo+ICsJcmV0dXJuIHBtdWlkLnZhbHVlOwo+ICt9
Cj4gKwo+ICtzdGF0aWMgc3NpemVfdCBwbXVfc2JpX2lkX3Nob3coc3RydWN0IGRldmljZSAqZGV2
LAo+ICsgICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4g
K3sKPiArICAgIGludCBsZW47Cj4gKyAgICBsZW4gPSBzcHJpbnRmKGJ1ZiwgIjB4JWx4XG4iLCBw
bXVfc2JpX2dldF9wbXVfaWQoKSk7Cj4gKyAgICBpZiAobGVuIDw9IDApCj4gKyAgICAgICAgZGV2
X2VycihkZXYsICJteWRydjogSW52YWxpZCBzcHJpbnRmIGxlbjogJWRuIiwgbGVuKTsKPiArCj4g
KyAgICByZXR1cm4gbGVuOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IHBtdV9zYmlfZGV2aWNlX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVjdCByaXNjdl9w
bXUgKnBtdSA9IE5VTEw7Cj4gQEAgLTY4MCw2ICs3MTksMTMgQEAgc3RhdGljIGludCBwbXVfc2Jp
X2RldmljZV9wcm9iZShzdHJ1Y3QKPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHBtdS0+Y3RyX2Ns
ZWFyX2lkeCA9IHBtdV9zYmlfY3RyX2NsZWFyX2lkeDsKPiAgCXBtdS0+Y3RyX3JlYWQgPSBwbXVf
c2JpX2N0cl9yZWFkOwo+ICAKPiArCXJldCA9IHN5c2ZzX2NyZWF0ZV9ncm91cCgmcGRldi0+ZGV2
LmtvYmosICZwbXVfc2JpX2dyb3VwKTsKPiArCWlmIChyZXQpIHsKPiArICAgICAgICBkZXZfZXJy
KCZwZGV2LT5kZXYsICJzeXNmcyBjcmVhdGlvbiBmYWlsZWRcbiIpOwo+ICsgICAgICAgIHJldHVy
biByZXQ7Cj4gKyAgICB9Cj4gKwlwZGV2LT5kZXYuZ3JvdXBzID0gcG11X3NiaV9ncm91cHM7Cj4g
Kwo+ICAJcmV0ID0gY3B1aHBfc3RhdGVfYWRkX2luc3RhbmNlKENQVUhQX0FQX1BFUkZfUklTQ1Zf
U1RBUlRJTkcsCj4gJnBtdS0+bm9kZSk7IGlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
