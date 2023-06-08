Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEA0C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 07:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGfcCaIOsmt0nqS4Qy9Dor5fxNLnNH+SscdsNr2WxsY=; b=EccUuLF5PjQjoj
	WHsIJoeSsrCrdCPfYVukTZhKz0tv94oQHGmK86geFTz3aMVmhTRg+4vLru+Hu/QJSu7IWfkjL25pU
	JegydlJhL3OGi8Gj3UKj4FvAPBEBiu58XMUL8Nt2r2IXyUT6xnQSpMzA017cmiky0EBgISMLbb0RW
	0MFcfMBvLjQCpDLjaCm1OTsQy/fq3IPIThhGrkicpEMmO3PEJZone+3K9T7/tkSE67aGN1T7iFuSC
	562w/q7xqIBFmoxe3L6A8am7i2eEAUWqIyLFSkPIP6YChJ2+hkrHNfijNKi5/L+aHX9+WvNK+76I+
	AUa06T7uUa8zNg10UPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7APB-008Rzn-0W;
	Thu, 08 Jun 2023 07:50:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AP7-008RzE-15
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 07:49:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30af56f5f52so192549f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 00:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686210595; x=1688802595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtmUwjwB5GnvCa4t/yItESHxoD/YIIhkFf3u0QhCFEU=;
        b=xHZvR8D8ubZlzKmO3AeT67Dan7R9Uya1zCc3WqXQriEUhsX7+QTOXWQzGP/uqPGEU3
         VlbS/DY1rw2R5vY4sackU8REgmFUUhAIZL2TlAejLw6EdXsyv+KFa6DpTMtCaCxFPkP0
         A8IRg4Fepnn7x4TvP4Rhz+sEmJmey5X6svMpU6ESSgq0oVF0uHL3ZrpIoLX5DYpMF7iU
         h4xApXNZ/tLs+1/BZkgeoJXQDa7kf/6e7A0+ffyDl7nkhuR5qW9X7JGjbEgAvY19v0wn
         UWbFO4EBork0PvWuQ353SZyamof5QZI2JERaNAa+qwp44YBjW63Ka7wx25xSMZ8ZR/ut
         aP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686210595; x=1688802595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtmUwjwB5GnvCa4t/yItESHxoD/YIIhkFf3u0QhCFEU=;
        b=eVs13o/020xyiEq+tEwduTCIQ1zyiAqOIyOvfOywVsf8YykqzZLLi6aYXF/EMlkKFZ
         M6YhpA+66zBK6QgesZOmETl2Otv86Ncvz7POiNcwUZrMspQ2ImG0MadkQLc+GmGypBJm
         tt9rAOtYsB0TPLC1vUpNNJQf/HxYIqu/p4un5rFFm6uNWgaqeRZw/tQEYZlX2z7NV2kV
         1CBbLsRaVCEkpwucR7987OWRBfdCg0n2DHVwXkKjrWSh4H9E7HeuO41fzbB5+9bpEq6w
         kX49DzsdZryKPhkAFb6L3H0/1wxV7qU/MKOo7PXv1iHKx0H3c6W1tHLKK4rbkUZK7fIN
         plPw==
X-Gm-Message-State: AC+VfDztwSojxKAYq4QumAIi+inDiXKElew8IifZw/7NCuDPLFBwEo37
	FgGWV7bCeaJQRULmo0kfoXkn9nbSXYRTc4p+AJAFqr8bLLYzqPoC
X-Google-Smtp-Source: ACHHUZ7xonBX9mtbOt/iDujy0XqfgYu34JU3q4uwrHM1AsZR9QLNLK6ZW+hlqhCptuPlGRbKuLyi97bNcoYGMh4sD6Y=
X-Received: by 2002:a5d:4d46:0:b0:30e:5283:ec85 with SMTP id
 a6-20020a5d4d46000000b0030e5283ec85mr5367913wru.33.1686210594989; Thu, 08 Jun
 2023 00:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_B15C0F1F3105597D0DCE7DADC96C5EB5CF0A@qq.com> <20230607-jogging-grudging-70dede86bc53@spud>
In-Reply-To: <20230607-jogging-grudging-70dede86bc53@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 8 Jun 2023 09:49:44 +0200
Message-ID: <CAHVXubggydGfNu3OzcxWXREJbB+G9dmr9sFD7vXhVxbG-N58Pg@mail.gmail.com>
Subject: Re: [PATCH] riscv: reserve DTB before possible memblock allocation
To: Conor Dooley <conor@kernel.org>
Cc: Woody Zhang <woodylab@foxmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_004957_633705_107A6FAD 
X-CRM114-Status: GOOD (  32.05  )
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

T24gV2VkLCBKdW4gNywgMjAyMyBhdCA4OjE34oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+ICtDQyBBbGV4LCB5b3Ugc2hvdWxkIHRha2UgYSBsb29rIGF0IHRo
aXMgcGF0Y2guCj4KPiBPbiBXZWQsIEp1biAwNywgMjAyMyBhdCAwOTozNToxOVBNICswODAwLCBX
b29keSBaaGFuZyB3cm90ZToKPiA+IEl0J3MgcG9zc2libGUgdGhhdCBlYXJseV9pbml0X2ZkdF9z
Y2FuX3Jlc2VydmVkX21lbSgpIGFsbG9jYXRlcyBtZW1vcnkKPiA+IGZyb20gbWVtYmxvY2sgZm9y
IGR5bmFtaWMgcmVzZXJ2ZWQgbWVtb3J5IGluIGAvcmVzZXJ2ZWQtbWVtb3J5YCBub2RlLgo+ID4g
QW55IGZpeGVkIHJlc2VydmF0aW9uIG11c3QgYmUgZG9uZSBiZWZvcmUgdGhhdCB0byBhdm9pZCBw
b3RlbnRpYWwKPiA+IGNvbmZsaWN0cy4KPiA+Cj4gPiBSZXNlcnZlIHRoZSBEVEIgaW4gbWVtYmxv
Y2sganVzdCBhZnRlciBlYXJseSBzY2FubmluZyBpdC4KPgo+IFRoZSByYXRpb25hbGUgbWFrZXMg
c2Vuc2UgdG8gbWUsIEkgYW0ganVzdCB3b25kZXJpbmcgd2hhdCBjb21wZWxsaW5nCj4gcmVhc29u
IHRoZXJlIGlzIHRvIG1vdmUgaXQgYXdheSBmcm9tIHRoZSBtZW1ibG9ja19yZXNlcnZlKClzIGZv
ciB0aGUKPiBpbml0ZCBhbmQgdm1saW51eD8gTW92aW5nIGl0IGFib3ZlIGVhcmx5X2luaXRfZmR0
X3NjYW5fcmVzZXJ2ZWRfbWVtKCkKPiBzaG91bGQgYmUgdGhlIHN1ZmZpY2llbnQgbWluaW11bSAm
IHdvdWxkIGtlZXAgdGhpbmdzIHRvZ2V0aGVyLgo+Cj4gQ2hlZXJzLAo+IENvbm9yLgoKVGhhbmtz
IENvbm9yLgoKU28gdGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuCgpCdXQgSSBmaW5kIHRoaXMg
ZnJhZ2lsZToKCi0gd2UgZG8gbm90IGNoZWNrIG1lbWJsb2NrX3Jlc2VydmUoKSByZXR1cm4gdmFs
dWUgdG8gbWFrZSBzdXJlIHRoZQpyZXNlcnZhdGlvbiByZWFsbHkgaGFwcGVuZWQgKGFuZCBxdWlj
a2x5IGxvb2tpbmcgYXQgdGhlIGNvZGUsIEknbSBub3QKZXZlbiBzdXJlIGl0IHJldHVybnMgYW4g
ZXJyb3IgaWYgdGhlIHJlZ2lvbiB3YXMgYWxyZWFkeSBhbGxvY2F0ZWQpLgotIHdlIGhhdmUgdG8g
bWFrZSBzdXJlIG5vIG1lbWJsb2NrIGFsbG9jYXRpb24gaGFwcGVucyBiZWZvcmUgc2V0dXBfYm9v
dG1lbSgpLgotIHdlIGFsc28gaGF2ZSB0byBjaGVjayB0aGF0IG5vIGZpeGVkIG1lbWJsb2NrX3Jl
c2VydmUoKSBoYXBwZW5zIGFmdGVyLgoKVGhlIGxhc3QgMiBwb2ludHMgbWF5IHNvdW5kIG5hdHVy
YWwsIGJ1dCB3ZSdsbCBoYXZlIHRvIHRha2UgZ3JlYXQgY2FyZQp3aGVuIGFkZGluZyBzb21lIGNv
ZGUgYXJvdW5kIGhlcmUuIEknbSB3b3JraW5nIG9uIGFuICJlYXJseSBib290CmRvY3VtZW50IiBh
bmQgSSdsbCBhZGQgc29tZXRoaW5nIGFib3V0IHRoYXQsIGJ1dCBhIHJ1bnRpbWUgdGhpbmcgd291
bGQKYmUgd2F5IGJldHRlciBJTU8uCgpZb3UgY2FuIGFkZDoKClJldmlld2VkLWJ5OiBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFua3MsCgpBbGV4Cgo+Cj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogV29vZHkgWmhhbmcgPHdvb2R5bGFiQGZveG1haWwuY29tPgo+ID4g
LS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8IDEwICsrKysrKysrKysKPiA+ICBh
cmNoL3Jpc2N2L21tL2luaXQuYyAgICAgIHwgIDkgLS0tLS0tLS0tCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+
ID4gaW5kZXggMzZiMDI2MDU3NTAzLi5jMTQ3ZmE4ZGE5MjkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5j
Cj4gPiBAQCAtMTYsNiArMTYsNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9jb25zb2xlLmg+Cj4g
PiAgI2luY2x1ZGUgPGxpbnV4L3NjcmVlbl9pbmZvLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L29m
X2ZkdC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9saWJmZHQuaD4KPiA+ICAjaW5jbHVkZSA8bGlu
dXgvc2NoZWQvdGFzay5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9zbXAuaD4KPiA+ICAjaW5jbHVk
ZSA8bGludXgvZWZpLmg+Cj4gPiBAQCAtMjU2LDYgKzI1NywxNSBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgcGFyc2VfZHRiKHZvaWQpCj4gPiAgICAgICAgICAgICAgIHByX2VycigiTm8gRFRCIHBhc3Nl
ZCB0byB0aGUga2VybmVsXG4iKTsKPiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICAvKgo+ID4gKyAg
ICAgICogSWYgRFRCIGlzIGJ1aWx0IGluLCBubyBuZWVkIHRvIHJlc2VydmUgaXRzIG1lbWJsb2Nr
Lgo+ID4gKyAgICAgICogT3RoZXJ3aXNlLCBkbyByZXNlcnZlIGl0IGJ1dCBhdm9pZCB1c2luZwo+
ID4gKyAgICAgICogZWFybHlfaW5pdF9mZHRfcmVzZXJ2ZV9zZWxmKCkgc2luY2UgX19wYSgpIGRv
ZXMKPiA+ICsgICAgICAqIG5vdCB3b3JrIGZvciBEVEIgcG9pbnRlcnMgdGhhdCBhcmUgZml4bWFw
IGFkZHJlc3Nlcwo+ID4gKyAgICAgICovCj4gPiArICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklH
X0JVSUxUSU5fRFRCKSkKPiA+ICsgICAgICAgICAgICAgbWVtYmxvY2tfcmVzZXJ2ZShkdGJfZWFy
bHlfcGEsIGZkdF90b3RhbHNpemUoZHRiX2Vhcmx5X3ZhKSk7Cj4gPiArCj4gPiAgI2lmZGVmIENP
TkZJR19DTURMSU5FX0ZPUkNFCj4gPiAgICAgICBzdHJzY3B5KGJvb3RfY29tbWFuZF9saW5lLCBD
T05GSUdfQ01ETElORSwgQ09NTUFORF9MSU5FX1NJWkUpOwo+ID4gICAgICAgcHJfaW5mbygiRm9y
Y2luZyBrZXJuZWwgY29tbWFuZCBsaW5lIHRvOiAlc1xuIiwgYm9vdF9jb21tYW5kX2xpbmUpOwo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0
LmMKPiA+IGluZGV4IGM2YmI5NjZlNDEyMy4uZjhjOWE3OWFjZDk0IDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBA
QCAtMjU0LDE1ICsyNTQsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfYm9vdG1lbSh2b2lk
KQo+ID4gICAgICAgICovCj4gPiAgICAgICBlYXJseV9pbml0X2ZkdF9zY2FuX3Jlc2VydmVkX21l
bSgpOwo+ID4KPiA+IC0gICAgIC8qCj4gPiAtICAgICAgKiBJZiBEVEIgaXMgYnVpbHQgaW4sIG5v
IG5lZWQgdG8gcmVzZXJ2ZSBpdHMgbWVtYmxvY2suCj4gPiAtICAgICAgKiBPdGhlcndpc2UsIGRv
IHJlc2VydmUgaXQgYnV0IGF2b2lkIHVzaW5nCj4gPiAtICAgICAgKiBlYXJseV9pbml0X2ZkdF9y
ZXNlcnZlX3NlbGYoKSBzaW5jZSBfX3BhKCkgZG9lcwo+ID4gLSAgICAgICogbm90IHdvcmsgZm9y
IERUQiBwb2ludGVycyB0aGF0IGFyZSBmaXhtYXAgYWRkcmVzc2VzCj4gPiAtICAgICAgKi8KPiA+
IC0gICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfQlVJTFRJTl9EVEIpKQo+ID4gLSAgICAgICAg
ICAgICBtZW1ibG9ja19yZXNlcnZlKGR0Yl9lYXJseV9wYSwgZmR0X3RvdGFsc2l6ZShkdGJfZWFy
bHlfdmEpKTsKPiA+IC0KPiA+ICAgICAgIGRtYV9jb250aWd1b3VzX3Jlc2VydmUoZG1hMzJfcGh5
c19saW1pdCk7Cj4gPiAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKQo+ID4gICAg
ICAgICAgICAgICBodWdldGxiX2NtYV9yZXNlcnZlKFBVRF9TSElGVCAtIFBBR0VfU0hJRlQpOwo+
ID4gLS0KPiA+IDIuMzkuMgo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
