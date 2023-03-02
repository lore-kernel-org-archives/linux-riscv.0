Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1634C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 11:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MBJJtFepQNnteIoiI1GUsMxxLkrEh2kK1Gs930nBEk=; b=Fxh4aUYzBxUKiB
	GRNTxmhXX6UQ5GwBntX7CM0T/E3xI3LrZt/KwzNAUz90Ts6XzpinExy5Qxdwi1C42l6+kLVtGCKAK
	3SvXIFJVdI27/2fKAEe6kzSRlX229NURxIhTFW8Efl7BasKLNAPmmC9vEZzECHtrSNBRxYK8WjFxm
	89xTcK4HxvBPId5Fr62VBPeiOuvZNLFc0xyldHYLL5hAtrc3Qhz+vKwXwNtWsDDZV6AETQCm/U6QL
	nmefglNOP+Nt1ViVWVkikGTGjbafd2G9pDotz6halthIutDsMF4FJCckIQwRPNHfoN8M0oQBscTVa
	Q4QtDDrWbO88kJuohH3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXh6G-001vo0-KD; Thu, 02 Mar 2023 11:27:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXh6E-001vmu-Az; Thu, 02 Mar 2023 11:27:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DF1ACB811EF;
	Thu,  2 Mar 2023 11:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAEAC433D2;
	Thu,  2 Mar 2023 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677756467;
	bh=l+LO1Vs1YrHHAkxHk22l+CM6O/lYeoi6XiciBgeCBHs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Fl4M+0Ro3ODDP6XedsF7+17UpxG4N+wcvIYSZiyFwJU432XZd2JnbccMNgMXAhz0+
	 WtF+h+V+HnDm5N8cZG6VzpflZEn24QpJj1N/tXHHlnVd+spMvcrShunSoV2+vNFyKw
	 bgFZg8UogBcO9no3y4KjUnv5XK/gv9qTwITycMXPo27j7zzKojhln6tKAJppeXPoxU
	 37W0bRSFS3M21mu1w9iyUOv/7RbmsCy9GdxlSTOqV+2HZFSEISkMx7RNxyMlAC0Hnd
	 UzwzfEeWnxIDH0x8m78PRYdW5t2EACHJr2bMbt2kfAQwjz2Kw2M+CgQjaPsOPL1FOF
	 K6tYHq2BLni3w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Richard
 Henderson <richard.henderson@linaro.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Janosch Frank <frankja@linux.ibm.com>, Rolf
 Eike Beer <eb@emlix.com>, Huacai Chen <chenhuacai@kernel.org>, Alexey
 Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH -next v14 11/19] riscv: Add ptrace vector support
In-Reply-To: <20230224170118.16766-12-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-12-andy.chiu@sifive.com>
Date: Thu, 02 Mar 2023 12:27:45 +0100
Message-ID: <87mt4v4clq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_032750_552793_ED0428DC 
X-CRM114-Status: GOOD (  13.19  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+
IGluZGV4IDJhZTgyODBhZTQ3NS4uM2MwZTAxZDdmOGZiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3B0cmFjZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiBA
QCAtODMsNiArODcsNjIgQEAgc3RhdGljIGludCByaXNjdl9mcHJfc2V0KHN0cnVjdCB0YXNrX3N0
cnVjdCAqdGFyZ2V0LAo+ICB9Cj4gICNlbmRpZgo+ICAKPiArI2lmZGVmIENPTkZJR19SSVNDVl9J
U0FfVgo+ICtzdGF0aWMgaW50IHJpc2N2X3ZyX2dldChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhcmdl
dCwKPiArCQkJY29uc3Qgc3RydWN0IHVzZXJfcmVnc2V0ICpyZWdzZXQsCj4gKwkJCXN0cnVjdCBt
ZW1idWYgdG8pCj4gK3sKPiArCXN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICp2c3RhdGUgPSAm
dGFyZ2V0LT50aHJlYWQudnN0YXRlOwo+ICsKPiArCWlmICghcmlzY3Zfdl92c3RhdGVfcXVlcnko
dGFza19wdF9yZWdzKHRhcmdldCkpKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJLyoKPiArCSAq
IEVuc3VyZSB0aGUgdmVjdG9yIHJlZ2lzdGVycyBoYXZlIGJlZW4gc2F2ZWQgdG8gdGhlIG1lbW9y
eSBiZWZvcmUKPiArCSAqIGNvcHlpbmcgdGhlbSB0byBtZW1idWYuCj4gKwkgKi8KPiArCWlmICh0
YXJnZXQgPT0gY3VycmVudCkKPiArCQlyaXNjdl92X3ZzdGF0ZV9zYXZlKGN1cnJlbnQsIHRhc2tf
cHRfcmVncyhjdXJyZW50KSk7Cj4gKwo+ICsJLyogQ29weSB2ZWN0b3IgaGVhZGVyIGZyb20gdnN0
YXRlLiAqLwo+ICsJbWVtYnVmX3dyaXRlKCZ0bywgdnN0YXRlLCBvZmZzZXRvZihzdHJ1Y3QgX19y
aXNjdl92X2V4dF9zdGF0ZSwgZGF0YXApKTsKPiArCW1lbWJ1Zl96ZXJvKCZ0bywgc2l6ZW9mKHZv
aWQgKikpOwo+ICsjaWYgX19yaXNjdl94bGVuID09IDMyCj4gKwltZW1idWZfemVybygmdG8sIHNp
emVvZihfX3UzMikpOwo+ICsjZW5kaWYKClJlbWluZCBtZSB3aHkgdGhlIGV4dHJhIGNhcmUgaXMg
bmVlZGVkIGZvciAzMmI/CgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
