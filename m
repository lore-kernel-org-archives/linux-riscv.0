Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E9AC47DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 02:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpA1al5H5isiDHffBLgjkS6HdRqo8K7Z43v1PTwtqkg=; b=XqJqiLFfi7fbjT
	38V1iRYjCSiebNwJx7IMqeFVJXoLJ7oohWtqTSz4YN23c3RFvzA2PABVYAevGUagPf/6GT5cj8HJN
	1LaYUKFmU83qRk8wBgJspQRgWIUvKBIHC5y8LvawwFkrHwfEZYfQMN0+bNuTFbN/F37YL8wY97fSI
	RQtN9cwfTGw5ZUgw9xZu+Pjnhbft3rnqpQO4FXAmmjZ77QyKwFfCkw40oPhoCRhkUG3lBRUEQWMWK
	Vf1CU5vOB7DtlvZp+DqODf3zVWoZD+aEpxGUkCCSCGDgVvPJ7zAHZvqBvUsSKUJSiRRA98Jw9MaJ7
	DN0CK7bBTM/e5E+xpGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdxa-0000000EzAF-1yiP;
	Tue, 30 Jan 2024 02:34:50 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdxX-0000000Ez8L-1KOT
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 02:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1706582057; bh=8E/e8D3rKgg6BW9Nd4UCl+YuxiR1gxvHcsdFPnL3EdQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=hNx5bJ5+SpHw5tdiee02HyZWtP19kF9j847pn/nwBcR6Z7o3RrYgOBjvMc2ftRj9v
	 gEmEG405XbEujdsNy1yk0RT6+84IKAM27dSljldg6u+z2RrANzhy3h11FcJbrK1Vec
	 qZw4xMHRNEMRuteM6fRKRFML5FYlx2cNv366R1IU=
Received: from smtpclient.apple ([2409:8934:22a2:1426:2cc9:5406:8a0:e7c])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 88D8D4CC; Tue, 30 Jan 2024 10:34:13 +0800
X-QQ-mid: xmsmtpt1706582053t6s5d0gw2
Message-ID: <tencent_F34C3BC7F1077728A62E84A7D183EF5BF005@qq.com>
X-QQ-XMAILINFO: NMiAo2azIaDAi/rSxKp8KRcmxf09H6ettD8ShiQpLNA1dpvHLxgnxVFZigU4i3
	 W3/Uj4QWneeWSrLx+HXIPnlVmO5QOmhKVgpheBN1/EwGlccRybQRtyPKJ5IWHh7DGaSVXLDeZMPk
	 zvC21+DUIouTcg9O2V/eCfUR3m+KdERxmSFvXbVgmDlSVZJYkd0oJl0HU0m/gKVd4WoAmKTDKGyl
	 mvZoA8QU16dF7RRDIXymDQ6Yque6O4oHsZitO7qgXjPN7ytF1zqmQYYCF0ua8L8XAyHHStc6+1fS
	 l/S245vc1dmc8hhOWBufdOp1y79Dd78+2zKXxQlp1TJ5vDHMIV5zESGxnIbGq16nBL905VKV6cvP
	 /lSL7OqHLZnawePU/UbCnSDAAfU6Csb3pwKbkczi3dIldg7fXMzpAonRjpYzJ2jcMFlSCgeXNOaL
	 HHEPiLF3ODOp/qSWNpxIK0pzURKAOjoVdw4iNVw1iSi5ol4D9HhgRnAc+FHhT1iENTEhYTDYD00E
	 JTNG208rTRxwb3v+60Ggmnl+JCrDZCr8OKbqe6UaahuFQUpNstnCG+pWudLmO3Tpra8jzFPGqJZu
	 DtGx67UmKlKqdtojlDYJsKDYkbYBoPi/xp+0VKz0b55QKwz889hw9Ar/jHV3fLB/y4CCZwmT596f
	 4ipQBbZC/U8Of7xavaLb0JZ+JFrHmlPnQMmnWPunYya1XE5hDZVL/nVAkXA2Tc2p1Fg9EwFG/DsG
	 QqPE+ju9I2NZDSz//a6Km1ljbH7c0jaD3M5UGqamhHy35C3uX5n/jHPL5Ec/mR2QQ3d1Ww0e26rk
	 7KgtAM2NdDBed/hZYV9VnsK5dzVVmM+BDx23gDeRUIhRuu2ylss5ZrjrG/F5bDEeNb0ESXQNADB1
	 6SN4ZJUaXnrsfQEMxGPf89ZLpi6YWFTA2Xcb2P+9J3MDCbfv+VwpjSWXWpjW6aoXTNAlWHfAHubp
	 k87IMYHS1wlATanpqVhuptShejVuS4HyWb9EwoZX3+wHkrEfzCYagAOAq+MnnP
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH 1/3] riscv: mm: Use hint address in mmap if available
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
Date: Tue, 30 Jan 2024 10:34:03 +0800
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org
X-OQ-MSGID: <D622ED9C-FADE-4E26-A095-AC959E588543@cyyself.name>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
 <20240129-use_mmap_hint_address-v1-1-4c74da813ba1@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_183447_973162_890273F2 
X-CRM114-Status: GOOD (  26.21  )
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

Cj4gT24gSmFuIDMwLCAyMDI0LCBhdCAwODozNywgQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4gCj4gT24gcmlzY3YgaXQgaXMgZ3VhcmFudGVlZCB0aGF0IHRo
ZSBhZGRyZXNzIHJldHVybmVkIGJ5IG1tYXAgaXMgbGVzcyB0aGFuCj4gdGhlIGhpbnQgYWRkcmVz
cy4gQWxsb3cgbW1hcCB0byByZXR1cm4gYW4gYWRkcmVzcyBhbGwgdGhlIHdheSB1cCB0bwo+IGFk
ZHIsIGlmIHByb3ZpZGVkLCByYXRoZXIgdGhhbiBqdXN0IHVwIHRvIHRoZSBsb3dlciBhZGRyZXNz
IHNwYWNlLgo+IAo+IFRoaXMgcHJvdmlkZXMgYSBwZXJmb3JtYW5jZSBiZW5lZml0IGFzIHdlbGws
IGFsbG93aW5nIG1tYXAgdG8gZXhpdCBhZnRlcgo+IGNoZWNraW5nIHRoYXQgdGhlIGFkZHJlc3Mg
aXMgaW4gcmFuZ2UgcmF0aGVyIHRoYW4gc2VhcmNoaW5nIGZvciBhIHZhbGlkCj4gYWRkcmVzcy4K
PiAKPiBJdCBpcyBwb3NzaWJsZSB0byBwcm92aWRlIGFuIGFkZHJlc3MgdGhhdCB1c2VzIGF0IG1v
c3QgdGhlIHNhbWUgbnVtYmVyCj4gb2YgYml0cywgaG93ZXZlciBpdCBpcyBzaWduaWZpY2FudGx5
IG1vcmUgY29tcHV0YXRpb25hbGx5IGV4cGVuc2l2ZSB0bwo+IHByb3ZpZGUgdGhhdCBudW1iZXIg
cmF0aGVyIHRoYW4gc2V0dGluZyB0aGUgbWF4IHRvIGJlIHRoZSBoaW50IGFkZHJlc3MuCj4gVGhl
cmUgaXMgdGhlIGluc3RydWN0aW9uIGNsei9jbHp3IGluIFpiYiB0aGF0IHJldHVybnMgdGhlIGhp
Z2hlc3Qgc2V0IGJpdAo+IHdoaWNoIGNvdWxkIGJlIHVzZWQgdG8gcGVyZm9ybWFudGx5IGltcGxl
bWVudCB0aGlzLCBidXQgaXQgd291bGQgc3RpbGwKPiBiZSBzbG93ZXIgdGhhbiB0aGUgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbi4gQXQgd29yc3QgY2FzZSwgaGFsZiBvZiB0aGUKPiBhZGRyZXNzIHdv
dWxkIG5vdCBiZSBhYmxlIHRvIGJlIGFsbG9jYXRlZCB3aGVuIGEgaGludCBhZGRyZXNzIGlzCj4g
cHJvdmlkZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJp
dm9zaW5jLmNvbT4KPiAtLS0KPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwg
MjEgKysrKysrKystLS0tLS0tLS0tLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcHJvY2Vzc29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gaW5k
ZXggZjE5Zjg2MWNkYTU0Li5mM2VhNTE2NmUzYjIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJv
Y2Vzc29yLmgKPiBAQCAtMjIsMTQgKzIyLDExIEBACj4gKHsgXAo+IHVuc2lnbmVkIGxvbmcgbW1h
cF9lbmQ7IFwKPiB0eXBlb2YoYWRkcikgX2FkZHIgPSAoYWRkcik7IFwKPiAtIGlmICgoX2FkZHIp
ID09IDAgfHwgKElTX0VOQUJMRUQoQ09ORklHX0NPTVBBVCkgJiYgaXNfY29tcGF0X3Rhc2soKSkp
IFwKPiAtIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsgXAo+IC0gZWxzZSBpZiAoKF9hZGRyKSA+
PSBWQV9VU0VSX1NWNTcpIFwKPiAtIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsgXAo+IC0gZWxz
ZSBpZiAoKCgoX2FkZHIpID49IFZBX1VTRVJfU1Y0OCkpICYmIChWQV9CSVRTID49IFZBX0JJVFNf
U1Y0OCkpIFwKPiAtIG1tYXBfZW5kID0gVkFfVVNFUl9TVjQ4OyBcCj4gKyBpZiAoKF9hZGRyKSA9
PSAwIHx8IFwKPiArIChJU19FTkFCTEVEKENPTkZJR19DT01QQVQpICYmIGlzX2NvbXBhdF90YXNr
KCkpIHx8IFwKPiArICgoX2FkZHIgKyBsZW4pID4gQklUKFZBX0JJVFMgLSAxKSkpIFwKCkhvdyBh
Ym91dCByZXBsYWNpbmcgQklUKFZBX0JJVFMtMSkgdG8gREVGQVVMVF9NQVBfV0lORE9XIHRvIG1h
a2UgdGhlIGNvZGUKbW9yZSBnZW5lcmFsLgoKPiBlbHNlIFwKPiAtIG1tYXBfZW5kID0gVkFfVVNF
Ul9TVjM5OyBcCj4gKyBtbWFwX2VuZCA9IChfYWRkciArIGxlbik7IFwKPiBtbWFwX2VuZDsgXAo+
IH0pCj4gCj4gQEAgLTM5LDE0ICszNiwxMiBAQAo+IHR5cGVvZihhZGRyKSBfYWRkciA9IChhZGRy
KTsgXAo+IHR5cGVvZihiYXNlKSBfYmFzZSA9IChiYXNlKTsgXAo+IHVuc2lnbmVkIGxvbmcgcm5k
X2dhcCA9IERFRkFVTFRfTUFQX1dJTkRPVyAtIChfYmFzZSk7IFwKPiAtIGlmICgoX2FkZHIpID09
IDAgfHwgKElTX0VOQUJMRUQoQ09ORklHX0NPTVBBVCkgJiYgaXNfY29tcGF0X3Rhc2soKSkpIFwK
PiArIGlmICgoX2FkZHIpID09IDAgfHwgXAo+ICsgICAgKElTX0VOQUJMRUQoQ09ORklHX0NPTVBB
VCkgJiYgaXNfY29tcGF0X3Rhc2soKSkgfHwgXAo+ICsgICAgKChfYWRkciArIGxlbikgPiBCSVQo
VkFfQklUUyAtIDEpKSkgXAoKU2FtZSBoZXJlLgoKPiBtbWFwX2Jhc2UgPSAoX2Jhc2UpOyBcCj4g
LSBlbHNlIGlmICgoKF9hZGRyKSA+PSBWQV9VU0VSX1NWNTcpICYmIChWQV9CSVRTID49IFZBX0JJ
VFNfU1Y1NykpIFwKPiAtIG1tYXBfYmFzZSA9IFZBX1VTRVJfU1Y1NyAtIHJuZF9nYXA7IFwKPiAt
IGVsc2UgaWYgKCgoKF9hZGRyKSA+PSBWQV9VU0VSX1NWNDgpKSAmJiAoVkFfQklUUyA+PSBWQV9C
SVRTX1NWNDgpKSBcCj4gLSBtbWFwX2Jhc2UgPSBWQV9VU0VSX1NWNDggLSBybmRfZ2FwOyBcCj4g
ZWxzZSBcCj4gLSBtbWFwX2Jhc2UgPSBWQV9VU0VSX1NWMzkgLSBybmRfZ2FwOyBcCj4gKyBtbWFw
X2Jhc2UgPSAoX2FkZHIgKyBsZW4pIC0gcm5kX2dhcDsgXAo+IG1tYXBfYmFzZTsgXAo+IH0pCj4g
Cj4gCgpXaGF0IGFib3V0IG5vdCBzZXR0aW5nIHRoZSB1cHBlciBib3VuZCBhcyB4ODYvYXJtL3Bv
d2VycGMgYXMgWzFdIGRpZD8KSW4gdGhpcyBjYXNlLCB1c2VyIHNwYWNlIGNhbiBkaXJlY3RseSBw
YXNzIGEgY29uc3RhbnQgaGludCBhZGRyZXNzID4KQklUKDQ3KSB0byBnZXQgYSBtYXBwaW5nIGlu
IHN2NTcuIElmIHlvdSB3YW50IHRoaXMsIHRoaXMgY29kZSBhbHNvIGFsbG93cwp1c2VyLXNwYWNl
IHRvIHBhc3MgYW55IGFkZHJlc3MgbGFyZ2VyIHRoYW4gVEFTS19TSVpFLiBZb3Ugc2hvdWxkIGFs
c28KbGltaXQgdGhlIG1tYXBfYmFzZSB0byAoYmFzZSkgKyBUQVNLX1NJWkUgLSBERUZBVUxUX01B
UF9XSU5ET1cuCgpJ4oCZbSBhbHNvIGF3YXJlIG9mIHRoZSBybmRfZ2FwIGlmIGl0IGlzIG5vdCAw
LCB0aGVuIHdlIHdpbGwgbm90IGdldAphZGRyZXNzIG1hcHBlZCB0byBWQV9VU0VSX1NWMzkgLSBy
bmRfZ2FwLgoKWzFdLiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi90ZW5jZW50
XzI2ODM2MzJCRUU0MzhDNkQ0ODU0RTMwQkRGOUNBMDg0MzYwNkBxcS5jb20vCgo+IC0tIAo+IDIu
NDMuMAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
