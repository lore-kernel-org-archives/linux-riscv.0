Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D031C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 08:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMaQydMrJmUAqY6/KIw9iUd5vHVSIFGBLTwFUBlsmHY=; b=1wZlNTO+YRdjox
	0Nx5KtL8AvR5WOqkDaTJ3PzAU+1laObSi/T/4mx5Ob9RBFvdPN4RLczfm9KekdeMpMbjQajbYv/+J
	Z/j86cfDShhsmAlh5TzTU1bTVJ7+KxkF/8CMeYrpvjB9eOOBCcL7cbpnq4n8pDaTatMwx12JovRJl
	3LYGg31QMby1vWG3r7Vrh4klLt3bhlS/7ljO2e9Pa3iO0/6QO0w3qtJVOxzzQkdhm4l3HOpF2gjGE
	ML8sI7/gVRBOkAbXDyfpn/9KT+zKvaTU9kk77rE8R1GHSu9yDw0lH5vMmn/BmafSm1Hc6JGtXMpC2
	2X1WrsYebC+w+yDgFeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmQi-0000000GqWj-0Jhe;
	Wed, 06 Mar 2024 08:15:12 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmQc-0000000GqSX-0tXZ
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 08:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709712887; bh=9ZDgt5gLIY11SLql3p/ig4kBiaTGNRUoEIGN2lKaRXU=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=r2ZsXmv+5w0eHtCGI8p4hI9qOsBODQFlhj7zPbD9ZDOLngvhrssOinr1vJbvjs4G5
	 qll6pevem8iMGrWjkqEacXvvorEMlI0qeGPvPx0uoM4AX1D2cP/dOuPz2HEeIW2uG3
	 5IRtc2faS6pdPVF/sYtgaH4dvxE/wVQBaTFbkEqs=
Received: from smtpclient.apple ([2001:da8:c800:d084:84f7:c158:bab8:8899])
	by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
	id 3AB9F6A4; Wed, 06 Mar 2024 16:14:43 +0800
X-QQ-mid: xmsmtpt1709712883txjjbm2qe
Message-ID: <tencent_91E604E3B4D51DA37045625242A81B07F909@qq.com>
X-QQ-XMAILINFO: NMiAo2azIaDAtuI0CHS+mfpvOPYmsI2MiZYibrr/Tsqdm+I3ZxIzjMsk3qNcep
	 bVa+c/igwFVBE7LJiCeCBXQQIdVsJFCeHTu/UXDofThdVgjwzC4yaytc+SKptboVVzHmBORSmUky
	 dXxngSHahP3Q1cTkzvkZPXhWa1KXSNjSfLVelBBevdNZtcouoYJVLJi4k8D30fUe33u3+uMQMvLm
	 BDxoto3LUqeCA4yDGbRlnoQyvn8PWnKGljzgvv+5wbDOXWP3ULy5zeouxE09pb5s3gboRlLe/q4X
	 /TXzDxuqCh+R0SIQXumhb1PnhlhVzmptBKZyHs9f3ilHa2arjn+BDrV7h5/5yUh8JrIHnyGY1gdu
	 tHx3JTfCf+EEtneSZOoMIH+1hFGiEx+Bi6zQaPhoWdR/is811MseSHUO/ni4GYDn0KHi2K8IPdiC
	 sE+CVL5hrQJw758Np+RfPCOdy5DgSQd3Dy0FP2KC31gEeXlkItCVGN2vemAl9IeG8ohDdZysZoF7
	 +iofmHf8wTvz2Fj1NyBgZCINVb9d9jQ8kht4zHUR+M0nHxq0zo57sLDSLaXTeK07wmVrZPMNHjZ5
	 KnjQg17qFfzyJSoqcBnYB06lc6VsI8WTrbJUr3Zr85Sd9gAnhzv1CiVE1eYMJ9Q3omrihXhjONu5
	 /yq9labyj23RC0xT0ggp8sLrTh3H/RQIpaK8+zI/ykjQ53jEMfzbuBBLB7pXShvl6PkeMXitcaYk
	 CXCZdvzryDdnZ5Kzr57l2GaKXXsecCFV4VXyfnWGq+YG4uheKooDCB+zQzOJ013FuzoJ0OcIg8eU
	 7cf/fZvY99GxeE+jJfDea/azin5FF0gOpZzGLeIZ8op0vwiPBS5tde2QXoJyq3msRVW5MhF4g9c5
	 yggGyaKG7nDUBJKq8lnrMF6rh7pF0s5iWgcbcTcE9OgTc21DljLiVXskBbxbNo7YGelP+fZSJvvm
	 DhjeoXvsc0r1Mu2lfAHUZTxUmjMxcrxhrlNvPrQcNOrd9vu0A/mvrYBvUdxRGFK7j846MxlPg=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v5 5/7] riscv: Kconfig.socs: Split ARCH_CANAAN and
 SOC_CANAAN_K210
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240306-scowling-mortify-9b427c80e8ab@wendy>
Date: Wed, 6 Mar 2024 16:14:33 +0800
Cc: Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org,
 Conor Dooley <conor@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-OQ-MSGID: <AEDFD00A-160A-4237-99C0-A3A50929E4A1@cyyself.name>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
 <tencent_6F35FEF31908DE6AEB385AE30AC658863C0A@qq.com>
 <CAJF2gTS1-VQP=gQBx=SoUWsdap153EGOObKVn+2L7=kbP2CqFg@mail.gmail.com>
 <20240306-scowling-mortify-9b427c80e8ab@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_001506_849753_FE4E9E63 
X-CRM114-Status: GOOD (  13.71  )
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

Cgo+IE9uIE1hciA2LCAyMDI0LCBhdCAxNjowMSwgQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gCj4gT24gV2VkLCBNYXIgMDYsIDIwMjQgYXQgMDc6Mzg6
NTJBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiAKPj4gT24gV2VkLCBNYXIgNiwgMjAyNCBhdCA3
OjA04oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+IHdyb3RlOgo+Pj4gCj4+PiBT
aW5jZSB3ZSBoYXZlIENhbmFhbiBLZW5kcnl0ZSBLMjMwIHdpdGggTU1VIG5vdy4gVGhlIHVzZSBv
ZiBTT0NfQ0FOQUFOCj4+PiBpcyBubyBsb25nZXIgb25seSByZWZlcnJlZCB0byBLMjEwLiBTcGxp
dCB0aGVtIGFuZCBhZGQgX0syMTAgc3VmZml4Cj4+PiB0byB0aGUgbmFtZSBmb3Igb2xkIFNPQ19D
QU5BQU4uIEFuZCBhbGxvd3MgQVJDSF9DQU5BQU4gdG8gYmUgc2VsZWN0ZWQKPj4+IGZvciBvdGhl
ciBDYW5hYW4gU29Dcy4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogWWFuZ3l1IENoZW4gPGN5eUBj
eXlzZWxmLm5hbWU+Cj4+PiAtLS0KPj4+IGFyY2gvcmlzY3YvS2NvbmZpZy5zb2NzICAgICAgICAg
ICAgICAgICAgICAgICAgfCA4ICsrKysrLS0tCj4+PiBhcmNoL3Jpc2N2L01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+Pj4gYXJjaC9yaXNjdi9jb25maWdzL25vbW11
X2syMTBfZGVmY29uZmlnICAgICAgICB8IDMgKystCj4+PiBhcmNoL3Jpc2N2L2NvbmZpZ3Mvbm9t
bXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIHwgMyArKy0KPj4+IGRyaXZlcnMvY2xrL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPj4+IGRyaXZlcnMvcGluY3RybC9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPj4+IGRyaXZlcnMvcmVzZXQv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPj4+IGRyaXZlcnMvc29j
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4+PiBkcml2ZXJzL3Nv
Yy9jYW5hYW4vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCj4+PiA5IGZpbGVz
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAo+PiBUaGlzIHBh
dGNoIGNyb3NzIHNvIG1hbnkgc3Vic3lzdGVtcywgSSBhbSBub3Qgc3VyZSBhYm91dCBpdC4gSWYg
SSB3ZXJlCj4+IHlvdSwgSSB3b3VsZCBrZWVwIFNPQ19DQU5BQU4gYW5kIGp1c3QgYWRkIFNPQ19D
QU5BQU5fSzIzMC4KPiAKPiBSaWdodC4gVGhhdCBpcyB3aHkgSSBkaWRuJ3QgdHJ5IHRvIHJlbmFt
ZSB0aGUgc3ltYm9sLCBhbmQganVzdCBsZWZ0IGl0Cj4gYXMgU09DX0NBTkFBTiwgYnV0IGlmIHRo
ZSByZWxldmFudCBwZW9wbGUgYWNrIGl0LCB0aGUgY2hhbmNlcyBvZiBhCj4gc2lnbmlmaWNhbnQg
Y29uZmxpY3QgYXJlIGxvdy4KPiAKCk1heWJlIEkgc2hvdWxkIHNwbGl0IHRoaXMgcGF0Y2ggaW50
byBkaWZmZXJlbnQgc3Vic3lzdGVtcyBmb3IgYmV0dGVyCnJldmlldy4gSSB0aGluayBhdCBsZWFz
dCBkcml2ZXJzL3NvYy9NYWtlZmlsZSBzaG91bGQgY2hhbmdlZCB0byB1c2UKQVJDSF9DQU5BQU4u
IEJlY2F1c2Ugd2UgbmVlZCBzb21lIFNvQyBkcml2ZXJzIGZvciBLMjMwIGluIHRoZSBmdXR1cmUu
CkFuZCBhcmNoL3Jpc2N2L01ha2VmaWxlIHNob3VsZCB1c2UgU09DX0NBTkFBTl9LMjEwIGluc3Rl
YWQgb2YKQVJDSF9DQU5BQU4uICBCZWNhdXNlIHdlIHNob3VsZCBhdm9pZCB0aGUgTS1Nb2RlIGxv
YWRlciBidWlsZCBmb3IKb3RoZXIgQ2FuYWFuIFNvQ3MgZXhjZXB0IGZvciBLMjEwLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
