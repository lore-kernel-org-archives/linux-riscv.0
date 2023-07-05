Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E58BEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 01:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Njfo0tE4L1CLk6ETwpUrdyj/9XIo29HVrCHtbw+m8lI=; b=eEY9eRSce29lWZ
	DUFb8Ae2wNlICgX7IW/Wg2cevdC4s1UgKTkGM/ejXIornxQxlcH3q+PeBiJogDu6M9vGKJIrGeH+4
	3X4LWR0ldKyaz9rEHLI8P1wj8W6rTVh/cH+YEmCKPlN59PYKepMt/DarZI1lqaelkScnreNRdOjo9
	o+lkM+qZo+pso7S7JzWflEC8ZKhC7UU+CCnWf67OLhtcADyMafXTgA+hp99sQFV/bgOwY8jmD8Uw3
	KXoDCxQvp3cuta21Qy3Rd+0O9k5VemvETsc5LeAV3XxBDeGi4oWwgGY2rfLDnxRmp7/Uc7gfFCCay
	gHt3M3kbGAEvmk34fp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGrVI-00EY7m-2Z;
	Wed, 05 Jul 2023 01:40:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGrVG-00EY7E-0x;
	Wed, 05 Jul 2023 01:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=tdV/yT/QL+Dd/4qeqsUySGbh4/7I0XceuViUrNwt54Q=; b=JkihJyJSMrguhVrj/K8gV3/oPe
	drfHn07TMAmrED+uAIWHt4M56lAoPV9gTnfKFCAral5ConvMNG2uJBEDRCt61cpuoxIvaTJF3PlI7
	Z4AeAQdv5AkY6q2J5B772k+29mqKgWW/x5HzN8O5BTRZHhAXMnrzyC5BnXjIA9u/mhr3Q+GcojeCF
	9yrxEcVDQBPZg0VyyFvwqGNtpnSJ2nBivATvWnpcHZZ9cCJXW8yMCqm7+Sd7QD4yXp4bVHMw++Hbi
	ufKWpBTeT34qqJL69hKtJXMnqsxmeX2NEK1qOkEEyWU8SZdGim5xFBfrEogcVGh9R0o0FYHl22apa
	8+/9SmIQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qGrVB-009e97-5k; Wed, 05 Jul 2023 01:40:20 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8AxFvH9yaRkgS4AAA--.1029S3;
	Wed, 05 Jul 2023 09:40:13 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxriP6yaRkBM0bAA--.44417S3;
	Wed, 05 Jul 2023 09:40:10 +0800 (CST)
Message-ID: <26e355dd-049c-fa82-dc5d-565b86339253@loongson.cn>
Date: Wed, 5 Jul 2023 09:40:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [01/12] efi: Do not include <linux/screen_info.h> from EFI header
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-staging@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20230629121952.10559-2-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230629121952.10559-2-tzimmermann@suse.de>
X-CM-TRANSID: AQAAf8CxriP6yaRkBM0bAA--.44417S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF1DKFy5Wr47KF13Gw1ktFc_yoWrGF1rpa
	1DCF4xAw4DGF4rGas5uw17uF1DXws8Gr9FgF9F9r10y347tr1vqrs5urnIkr1DXFWUKw10
	gFy5tw1Yka4DXwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
	xGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_
	Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU28
	nYUUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_024018_664225_0CFD73A5 
X-CRM114-Status: GOOD (  13.55  )
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

SGksIFRob21hcwoKCkkgbG92ZSB5b3VyIHBhdGNoLCBMb29uZ0FyY2ggYWxzbyBoYXZlIFVFRkkg
R09QIHN1cHBvcnQsCgpNYXliZSB0aGUgYXJjaC9sb29uZ2FyY2gva2VybmVsL2VmaS5jIGRvbid0
IGluY2x1ZGUgdGhlICcjaW5jbHVkZSAKPGxpbnV4L3NjcmVlbl9pbmZvLmg+JyBleHBsaWNpdGx5
LgoKCmBgYAoKZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2tlcm5lbC9lZmkuYyBiL2FyY2gv
bG9vbmdhcmNoL2tlcm5lbC9lZmkuYwppbmRleCAzZDQ0OGZlZjNhZjQuLjA0ZjRkMjE3YWVmYiAx
MDA2NDQKLS0tIGEvYXJjaC9sb29uZ2FyY2gva2VybmVsL2VmaS5jCisrKyBiL2FyY2gvbG9vbmdh
cmNoL2tlcm5lbC9lZmkuYwpAQCAtMTksNiArMTksNyBAQAogwqAjaW5jbHVkZSA8bGludXgvbWVt
YmxvY2suaD4KIMKgI2luY2x1ZGUgPGxpbnV4L3JlYm9vdC5oPgogwqAjaW5jbHVkZSA8bGludXgv
dWFjY2Vzcy5oPgorI2luY2x1ZGUgPGxpbnV4L3NjcmVlbl9pbmZvLmg+CgogwqAjaW5jbHVkZSA8
YXNtL2Vhcmx5X2lvcmVtYXAuaD4KIMKgI2luY2x1ZGUgPGFzbS9lZmkuaD4KYGBgCgoKT24gMjAy
My82LzI5IDE5OjQ1LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiBUaGUgaGVhZGVyIGZpbGUg
PGxpbnV4L2VmaS5oPiBkb2VzIG5vdCBuZWVkIGFueXRoaW5nIGZyb20KPiA8bGludXgvc2NyZWVu
X2luZm8uaD4uIERlY2xhcmUgc3RydWN0IHNjcmVlbl9pbmZvIGFuZCByZW1vdmUKPiB0aGUgaW5j
bHVkZSBzdGF0ZW1lbnRzLiBVcGRhdGUgYSBudW1iZXIgb2Ygc291cmNlIGZpbGVzIHRoYXQKPiBy
ZXF1aXJlIHN0cnVjdCBzY3JlZW5faW5mbydzIGRlZmluaXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBDYzogQXJkIEJpZXNo
ZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51
eC5vcmcudWs+Cj4gQ2M6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+
Cj4gQ2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPgoKV2l0aCB0aGUgYWJvdmUg
aXNzdWUgc29sdmVkLCBwbGVhc2UgdGFrZSBteSBSLUIgaWYgeW91IHdvdWxkIGxpa2UuCgoKUmV2
aWV3ZWQtYnk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+Cgo+IC0tLQo+
ICAgYXJjaC9hcm0va2VybmVsL2VmaS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwo+
ICAgYXJjaC9hcm02NC9rZXJuZWwvZWZpLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4g
ICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2VmaS1zdHViLWVudHJ5LmMgfCAyICsrCj4g
ICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3NjcmVlbl9pbmZvLmMgICAgfCAyICsrCj4g
ICBpbmNsdWRlL2xpbnV4L2VmaS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzICsrLQo+
ICAgNSBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9rZXJuZWwvZWZpLmMgYi9hcmNoL2FybS9rZXJuZWwvZWZpLmMK
PiBpbmRleCBlMmI5ZDI2MThjNjcyLi5lOTQ2NTVlZjE2YmIzIDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtL2tlcm5lbC9lZmkuYwo+ICsrKyBiL2FyY2gvYXJtL2tlcm5lbC9lZmkuYwo+IEBAIC01LDYg
KzUsOCBAQAo+ICAgCj4gICAjaW5jbHVkZSA8bGludXgvZWZpLmg+Cj4gICAjaW5jbHVkZSA8bGlu
dXgvbWVtYmxvY2suaD4KPiArI2luY2x1ZGUgPGxpbnV4L3NjcmVlbl9pbmZvLmg+Cj4gKwo+ICAg
I2luY2x1ZGUgPGFzbS9lZmkuaD4KPiAgICNpbmNsdWRlIDxhc20vbWFjaC9tYXAuaD4KPiAgICNp
bmNsdWRlIDxhc20vbW11X2NvbnRleHQuaD4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJu
ZWwvZWZpLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9lZmkuYwo+IGluZGV4IGJhYWI4ZGQzZWFkM2Mu
LjNhZmJlNTAzYjA2NmYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvZWZpLmMKPiAr
KysgYi9hcmNoL2FybTY0L2tlcm5lbC9lZmkuYwo+IEBAIC05LDYgKzksNyBAQAo+ICAgCj4gICAj
aW5jbHVkZSA8bGludXgvZWZpLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+ICsjaW5j
bHVkZSA8bGludXgvc2NyZWVuX2luZm8uaD4KPiAgIAo+ICAgI2luY2x1ZGUgPGFzbS9lZmkuaD4K
PiAgICNpbmNsdWRlIDxhc20vc3RhY2t0cmFjZS5oPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zp
cm13YXJlL2VmaS9saWJzdHViL2VmaS1zdHViLWVudHJ5LmMgYi9kcml2ZXJzL2Zpcm13YXJlL2Vm
aS9saWJzdHViL2VmaS1zdHViLWVudHJ5LmMKPiBpbmRleCBjYzRkY2FlYTY3ZmE2Li4yZjE5MDJl
NWQ0MDc1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvZWZpLXN0
dWItZW50cnkuYwo+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvZWZpLXN0dWIt
ZW50cnkuYwo+IEBAIC0xLDYgKzEsOCBAQAo+ICAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQo+ICAgCj4gICAjaW5jbHVkZSA8bGludXgvZWZpLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9zY3JlZW5faW5mby5oPgo+ICsKPiAgICNpbmNsdWRlIDxhc20vZWZpLmg+Cj4gICAK
PiAgICNpbmNsdWRlICJlZmlzdHViLmgiCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUv
ZWZpL2xpYnN0dWIvc2NyZWVuX2luZm8uYyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIv
c2NyZWVuX2luZm8uYwo+IGluZGV4IDRiZTFjNGQxZjkyMmIuLmE1MWVjMjAxY2EzY2IgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9zY3JlZW5faW5mby5jCj4gKysr
IGIvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9zY3JlZW5faW5mby5jCj4gQEAgLTEsNiAr
MSw4IEBACj4gICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICAgCj4gICAj
aW5jbHVkZSA8bGludXgvZWZpLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zY3JlZW5faW5mby5oPgo+
ICsKPiAgICNpbmNsdWRlIDxhc20vZWZpLmg+Cj4gICAKPiAgICNpbmNsdWRlICJlZmlzdHViLmgi
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZWZpLmggYi9pbmNsdWRlL2xpbnV4L2VmaS5o
Cj4gaW5kZXggNTcxZDFhNmUxYjc0NC4uMzYwODk1YTU1NzJjMCAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL2xpbnV4L2VmaS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9lZmkuaAo+IEBAIC0yNCwxMCAr
MjQsMTEgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9yYW5nZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4
L3JlYm9vdC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3V1aWQuaD4KPiAtI2luY2x1ZGUgPGxpbnV4
L3NjcmVlbl9pbmZvLmg+Cj4gICAKPiAgICNpbmNsdWRlIDxhc20vcGFnZS5oPgo+ICAgCj4gK3N0
cnVjdCBzY3JlZW5faW5mbzsKPiArCj4gICAjZGVmaW5lIEVGSV9TVUNDRVNTCQkwCj4gICAjZGVm
aW5lIEVGSV9MT0FEX0VSUk9SCQkoIDEgfCAoMVVMIDw8IChCSVRTX1BFUl9MT05HLTEpKSkKPiAg
ICNkZWZpbmUgRUZJX0lOVkFMSURfUEFSQU1FVEVSCSggMiB8ICgxVUwgPDwgKEJJVFNfUEVSX0xP
TkctMSkpKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
