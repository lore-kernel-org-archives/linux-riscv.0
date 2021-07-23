Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36180C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 04:36:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC0960E95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 04:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCC0960E95
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeF5rNywFHDco+7Uwdb7mPSuN+AGcPJZmYVhHjK6r/w=; b=XxvFsCK2+NS0oF
	omhQFCMRjdNFCc3Q3X6OX+D5jpgaA3z+DM+jfC/4+fYh4eMLPJW3ffV5XXQdibyFzSQhIsLf/azJ2
	/KOg5LpLS8GHPTUd3JFNFjI9/Mz8Bprx65chXViLcvtpgtBxuYwdzKP29UTFxQ1n0knUSZWQdcP83
	tXDj3bGHZrV3w3ivQwrJPym0L59iuYvl8VwWRErVA1CuZWkpwEG5m0jJhVU5F+YUVbPrwQ/Cr2bQM
	rZPD0F0p9iPEm3iycUyvYot4k5BmDHDoOhWOgmbjlxp+x0f7LU/LUFi/l7wizXdP85JjPUzGalQga
	7wkLTLK+oWGWglPS/z4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6muu-003OfR-US; Fri, 23 Jul 2021 04:36:08 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6mur-003OeV-Ho
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 04:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=QbTlxn9eNvcRhBOBCVeh2QYtVCInFts4u5
 beNPEGQnc=; b=sSQhnsyJNfC/M5v9gQ3iNxU8w4XFxBPNG/B6MIhFsCy8GeEqg/
 axSK/20lfKoUy+sZSpXqQtXSQBTB7PLSqa0yOwG7/ui0ibtbN37/z8BHHQjyTw4w
 zKfzOxpG48gsxjcNgQ+ivdua9TYvTikU9d2tGdbjgkEZ+l6mgkBbyNH3U=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygB3fm4KR_pg5NUxAA--.1434S2; 
 Fri, 23 Jul 2021 12:35:23 +0800 (CST)
Date: Fri, 23 Jul 2021 12:29:25 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: tongtiangen <tongtiangen@huawei.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Atish Patra
 <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
Message-ID: <20210723122925.67a14562@xhacker>
In-Reply-To: <52e3626a-2b40-bda6-de0e-68ea12a86dd9@huawei.com>
References: <87bl6yrcmd.fsf@igel.home>
 <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
 <CAOnJCU+Ss0cO1mqr=GDVnpxV075uR+KipSnr7dN93099dAH+vQ@mail.gmail.com>
 <20210722213724.1f12a0e7@xhacker> <87zguexslf.fsf@igel.home>
 <20210723075432.098634a2@xhacker>
 <52e3626a-2b40-bda6-de0e-68ea12a86dd9@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygB3fm4KR_pg5NUxAA--.1434S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw45Jr1UCry5XF18tr1kKrg_yoW8Wr18pF
 WUGay3tF4qva4xK3Z2qw18Wa409an7Ja45u3s5Xr13ZFZYg3Z5Xr4IgrWUKFW7Ww1IkayY
 vr4FqFZ7Wrs8Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyIb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
 0_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
 6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7GYLDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_213606_286434_50C77E86 
X-CRM114-Status: GOOD (  14.79  )
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

T24gRnJpLCAyMyBKdWwgMjAyMSAwOTozNjo0NyArMDgwMAp0b25ndGlhbmdlbiA8dG9uZ3RpYW5n
ZW5AaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IE9uIDIwMjEvNy8yMyA3OjU0LCBKaXNoZW5nIFpoYW5n
IHdyb3RlOgo+ID4gT24gVGh1LCAyMiBKdWwgMjAyMSAxNzo0Mjo1MiArMDIwMAo+ID4gQW5kcmVh
cyBTY2h3YWIgPHNjaHdhYkBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiAgCj4gPj4gT24gSnVs
IDIyIDIwMjEsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPj4gIAo+ID4+PiBJIHRoaW5rIHdlIG5l
ZWQgdG8gcGluIHRoZSBzdGFjayBiZWZvcmUgY2FsbGluZyBnZXRfd2NoYW4oKSwgY291bGQgeW91
IHBsZWFzZQo+ID4+PiB0cnkgYmVsb3cgcGF0Y2g/ICAKPiA+Pgo+ID4+IFRoYW5rcywgdGhpcyBm
aXhlcyB0aGUgY3Jhc2ggZm9yIG1lLgo+ID4+Cj4gPj4gQW5kcmVhcy4KPiA+PiAgCj4gPgo+ID4g
VGhhbmtzIGZvciB0ZXN0aW5nLiBJIHdpbGwgc2VuZCBvdXQgZm9ybWFsIHBhdGNoIGxhdGVyCj4g
Pgo+ID4gVGhhbmtzCj4gPgo+ID4gLgo+ID4gIAo+IAo+IEhpIGFsbDoKPiBJIHRyaWVkIHRvIHJl
cHJvZHVjZWQgdGhpcyBjcmFzaCBpbiBvcGVuU1VTRSBjb2RlIHJlcG/vvIggCj4gaHR0cHM6Ly9n
aXRodWIuY29tL29wZW5zdXNlL2tlcm5lbCDvvIksIGJ1dCBub3QgcmVwcm9kdWNlZCBzdWNjZXNz
ZnVsbHkuCj4gCj4gIEZyb20gdGhlIHBhdGNoIG9mIHByb2JsZW0gcmVwYWlyLCB0aGUgY3Jhc2gg
aXMgZHVlIHRvIHRhc2stPnN0YWNrIGlzIAo+IHJlbGVhc2VkIGJlZm9yZSBjYWxsaW5nIGdldF93
Y2hhbiwgdGhlIHRhc2sgc3RhdGUgb2YgbWF5YmUgVEFTS19ERUFELgo+IAo+IFZNQVBfU1RBQ0sg
aXMgdXNlZCB0byBkZXRlY3Qga2VybmVsIHN0YWNrIG92ZXJmbG93LCB0aGVyZSBpcyBubyAKPiBj
b25uZWN0aW9uIGJldHdlZW4gdGhlIHR3bywgaXQgbWFrZXMgbWUgYSBsaXR0bGUgY29uZnVzZWQu
CgpJIGJlbGlldmUgdGhlIGJ1ZyBleGlzdHMgZnJvbSB0aGUgZmlyc3QgZGF5IG9mIHJpc2N2IG1h
aW5saW5lZC4KClNpbmNlIFRIUkVBRF9JTkZPX0lOX1RBU0s9eSBpbiByaXNjdiwgc28gd2hlbiB0
YXNrIHN0YWNrIGNhbiBiZSBmcmVlZApiZWZvcmUgYmVpbmcgZGVzdHJveWVkLgoKV2hlbiBWTUFQ
X1NUQUNLPW4sIHRhc2sncyBzdGFjayBpcyBhbGxvY2F0ZWQgZnJvbSBsaW5lYXIgbWFwcGluZy4g
V2hlbgp0YXNrIHN0YWNrIGlzIGZyZWVkLCB0aGUgY29ycmVzcG9uZGluZyBtYXBwaW5nIHN0aWxs
IGV4aXN0cywgYW5kIHNpbmNlCmdldF93Y2hhbigpIG9ubHkgcmVhZCwgbm8gaGFybSBpcyBvYnNl
cnZlZCBzbyBmYXIuCgpXaGVuIFZNQVBfU1RBQ0s9eSwgdGFzaydzIHN0YWNrIGlzIGFsbG9jYXRl
ZCBmcm9tIHZtYWxsb2MgYXJlYS4gV2hlbgp0YXNrIHN0YWNrIGlzIGZyZWVkLCB0aGUgY29ycmVz
cG9uZGluZyBtYXBwaW5nIG1heSBub3QgZXhpc3QsIHNvIEkgZXhwZWN0Ck1NVSBmYXVsdCBoZXJl
LCB0aHVzIHRoZSBrZXJuZWwgcGFuaWMuCgpJbiBzdW1tYXJ5LCB0aGUgYnVnIGlzbid0IHJlbGF0
ZWQgd2l0aCBWTUFQX1NUQUNLLCBidXQgVk1BUF9TVEFDSyBtYWtlcwp0aGUgYnVnIG9ic2VydmFi
bGUuCgpUaGFua3MKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
