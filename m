Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45955C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 07:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sH15jX0KAGK7qkMrqJyb/HXbHyrNGI/CAxQcUL72LkE=; b=i/kwGe2VfasMvi
	16otccbOh9hai7cI7WDvIONjq1vXHCSlkuv8IlkDDybnnX7ZhuoWwq0nNMgywhvaRuEgImZ4CWAdL
	jCN4s1lXhgBCqK0I/+NmZstXoWenfo03AU6kFzxDGiLGzEqmw0LiynZ6VWq14iApedGoAd6Mcb6j3
	c4UX5wuoFmbA0+Zid9yl5by+AnmkV4BI9TuKkDHsp7LRwqsmRHUjCOXP7DWbK6jnhlNYgyNIkVUsL
	qjes2fES3NqMN0vMdjg/dG0vDyVWIl4BWE+QLselS6Dvwylb9DWQ8/jxaE8pTmo6n1Kj9vvLvq3X+
	QD6BmzwoAlFPzy3zzLTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptO2U-00FPFU-0D;
	Mon, 01 May 2023 07:33:38 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptO2P-00FPEx-25
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 07:33:36 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id A24406000B;
	Mon,  1 May 2023 07:33:25 +0000 (UTC)
Message-ID: <dc9c1ba9-a6b5-67f0-4499-f044fbca92f1@ghiti.fr>
Date: Mon, 1 May 2023 09:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH linux-5.15.y] RISC-V: Fix up a cherry-pick warning in
 setup_vm_final()
To: Palmer Dabbelt <palmer@rivosinc.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel test robot <lkp@intel.com>
References: <20230429224330.18699-1-palmer@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230429224330.18699-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_003333_851150_593306F4 
X-CRM114-Status: GOOD (  20.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLAoKT24gNC8zMC8yMyAwMDo0MywgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gVGhp
cyB0cmlnZ2VycyBhIC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50IGFzIHRoZSBjb2RlIGhh
cyBjaGFuZ2VkIGEKPiBiaXQgc2luY2UgdXBzdHJlYW0uICBJdCBtaWdodCBiZSBiZXR0ZXIgdG8g
aG9pc3QgdGhlIHdob2xlIGJsb2NrIHVwLCBidXQKPiB0aGlzIGlzIGEgc21hbGxlciBjaGFuZ2Ug
c28gSSB3ZW50IHdpdGggaXQuCj4KPiBhcmNoL3Jpc2N2L21tL2luaXQuYzo3NTU6MTY6IHdhcm5p
bmc6IG1peGluZyBkZWNsYXJhdGlvbnMgYW5kIGNvZGUgaXMgYSBDOTkgZXh0ZW5zaW9uIFstV2Rl
Y2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudF0KPiAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBp
ZHggPSBwZ2RfaW5kZXgoX19maXhfdG9fdmlydChGSVhfRkRUKSk7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXgo+ICAgICAgMSB3YXJuaW5nIGdlbmVyYXRlZC4KPgo+IFJlcG9ydGVkLWJ5
OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMwNDMwMDQyOS5TWFpPQTV1cC1sa3BAaW50ZWwu
Y29tLwo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
Pgo+IC0tLQo+IEkgaGF2ZW4ndCBldmVuIGJ1aWxkIHRlc3RlZCB0aGlzIG9uZSwgYnV0IGl0IGxv
b2tzIHNpbXBsZSBlbm91Z2ggdGhhdCBJIGZpZ3VyZWQKPiBJJ2QganVzdCBzZW5kIGl0LiAgQmUg
d2FybmVkLCB0aG91Z2g6IEkgYnJva2UgZ2xpYmMgYW5kIG1pc3NlZCBhIG1lcmdlZAo+IGNvbmZs
aWN0IHllc3RlcmRheS4uLgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAzICsrLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBp
bmRleCBlODAwZDc5ODFlOTkuLjhkNjdmNDNmMTg2NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L21tL2luaXQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTcxNyw2ICs3MTcs
NyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfdm1fZmluYWwodm9pZCkKPiAgIAl1aW50cHRy
X3QgdmEsIG1hcF9zaXplOwo+ICAgCXBoeXNfYWRkcl90IHBhLCBzdGFydCwgZW5kOwo+ICAgCXU2
NCBpOwo+ICsJdW5zaWduZWQgbG9uZyBpZHg7Cj4gICAKPiAgIAkvKioKPiAgIAkgKiBNTVUgaXMg
ZW5hYmxlZCBhdCB0aGlzIHBvaW50LiBCdXQgcGFnZSB0YWJsZSBzZXR1cCBpcyBub3QgY29tcGxl
dGUgeWV0Lgo+IEBAIC03MzUsNyArNzM2LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX3Zt
X2ZpbmFsKHZvaWQpCj4gICAJICogZGlyZWN0bHkgaW4gc3dhcHBlcl9wZ19kaXIgaW4gYWRkaXRp
b24gdG8gdGhlIHBnZCBlbnRyeSB0aGF0IHBvaW50cwo+ICAgCSAqIHRvIGZpeG1hcF9wdGUuCj4g
ICAJICovCj4gLQl1bnNpZ25lZCBsb25nIGlkeCA9IHBnZF9pbmRleChfX2ZpeF90b192aXJ0KEZJ
WF9GRFQpKTsKPiArCWlkeCA9IHBnZF9pbmRleChfX2ZpeF90b192aXJ0KEZJWF9GRFQpKTsKPiAg
IAo+ICAgCXNldF9wZ2QoJnN3YXBwZXJfcGdfZGlyW2lkeF0sIGVhcmx5X3BnX2RpcltpZHhdKTsK
PiAgICNlbmRpZgoKVGhlIGFib3ZlIHJlc3VsdHMgdG8gaW4gcnY2NDoKCi4uL2FyY2gvcmlzY3Yv
bW0vaW5pdC5jOiBJbiBmdW5jdGlvbiDigJhzZXR1cF92bV9maW5hbOKAmToKLi4vYXJjaC9yaXNj
di9tbS9pbml0LmM6NzIwOjE2OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYaWR44oCZIApb
LVd1bnVzZWQtdmFyaWFibGVdCiDCoCA3MjAgfMKgIHVuc2lnbmVkIGxvbmcgaWR4OwoKClRoZSBm
b2xsb3dpbmcgZml4ZXMgdGhpcyB3YXJuaW5nOgoKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21t
L2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCmluZGV4IDhkNjdmNDNmMTg2NS4uZTY5ZDgy
ZDU3M2YxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYworKysgYi9hcmNoL3Jpc2N2
L21tL2luaXQuYwpAQCAtNzE3LDcgKzcxNyw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF92
bV9maW5hbCh2b2lkKQogwqDCoMKgwqDCoMKgwqAgdWludHB0cl90IHZhLCBtYXBfc2l6ZTsKIMKg
wqDCoMKgwqDCoMKgIHBoeXNfYWRkcl90IHBhLCBzdGFydCwgZW5kOwogwqDCoMKgwqDCoMKgwqAg
dTY0IGk7Ci3CoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBpZHg7CivCoMKgwqDCoMKgwqAgdW5z
aWduZWQgbG9uZyBpZHggX19tYXliZV91bnVzZWQ7CgogwqDCoMKgwqDCoMKgwqAgLyoqCiDCoMKg
wqDCoMKgwqDCoMKgICogTU1VIGlzIGVuYWJsZWQgYXQgdGhpcyBwb2ludC4gQnV0IHBhZ2UgdGFi
bGUgc2V0dXAgaXMgbm90IApjb21wbGV0ZSB5ZXQuCgoKTGV0IG1lIGtub3cgaWYgeW91IHdhbnQg
bWUgdG8gc2VuZCBhIHByb3BlciBwYXRjaCBhcyBJJ20gdGhlIG9uZSB0byAKYmxhbWUgaGVyZS4K
ClRoYW5rcyBmb3IgeW91ciBwYXRjaCwKCkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
