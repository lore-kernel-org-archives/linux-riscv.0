Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE34C52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iwx3x7WJK7VBjKRj6txDar1sIuHHzzRhPsbOsYZxCmY=; b=hIaoISAJW8fzPM
	47QKvnPdwcp6weJLC0kWu82Dk2jwbTwvGJFaxTo8pxKJCe1G7Jzozdi5zVbDXwjBNsX2X1azmtS4M
	k4SIroNPe9kHrgtqIZHHls4y3t8hpGCEWePvQ9k9VEaRHulgCPhjSSIn4kqjchiQwO4/a5pu3RtyX
	gdZzQEubzFp6r0giPAlRTahZ0c4S3vcugrpiVI+DlxK5kvZjfX8eTA9RGdbRrB+SfuREUoqoBMPUG
	m8SBq0VlWx9+tWL263Ak8IY7eEMhTeNrPZGonPgIFenmyYckBEzpWPnnh14bDXlnjL31/Q5eR4U8e
	GUHa/zJwPqcRr7UM7vYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGUQ-00000007aet-07fx;
	Wed, 14 Aug 2024 16:04:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGTh-00000007aUO-0zto;
	Wed, 14 Aug 2024 16:04:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3686b285969so48641f8f.0;
        Wed, 14 Aug 2024 09:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723651439; x=1724256239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnVAjE8y+xk4uzYKyeuMufgQpUYFTpPW67lHJ8a/9Vo=;
        b=ZQDrLVZyeeHk7u47dFySSpjBhVyKiGVEk+VJ7Kbk6A0YJTOAt82Ur6OcjDMGATqaAx
         PjrV4U0vCApUAenqyGPBZXX0oprV9GzFhPQ9SGDjZx4/EbpSTMW1Nx1xFusLOBTF0OP7
         e0rva3Z1fP/LNYEXqH7h6Yt/U0ZsEyKIA0W3/Vtel1seCydmg7O6ZGDTx7U9Sd9AYi1+
         UDf2l+Cbug6PcIgLmXPAq3TgdeijM5mV5xWN62jXLx2zlW5StqHkrnxhYzBiUgU7VRvv
         4wazeTwWhTDtr0VUOgW36YDNI4MO2QLOUCX/1tOogcMjuhXd0gyuPfnJNnXWKWC4Pu6h
         EqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723651439; x=1724256239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnVAjE8y+xk4uzYKyeuMufgQpUYFTpPW67lHJ8a/9Vo=;
        b=vuRostQ4Qdp7iOh4uTE/0LuJjdhid8/IZEx7/zZgYJGvrSl29zTkmyj4rLkdSO2emH
         NGek7chIaHsVsPRuSnJYy/lEFOEFTE1nEw/nRlswsTH1KVPgIZi11T/0XCSk6hg9HMfq
         TuTb91BNyAoh53f34cvN3s29tk8XfSJCJcCRyRDSWsTHdqCb38ZvCaeKQ2Ewo00sdu4A
         RxbITKD37gaiznGqnFgPSUA9XUuVpEVYgYI8JPl1UiQwVj9WyqK7eiG9VHamGMWltGlW
         yP3fFF7MzCcszpg8n57E4vSWQiGUhsdDkpNgslc3l0aOGyGTKLBmXsaD+0h20k8WN1Xi
         G9DQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9cv3EzeULnssWfUUU1DJiUanb/UyZfzjDiZ1Y/gwzwyWTeVsawj/vsk6TPaq4ywV8C4vfKYkKnZyyiqX0k2aiW4hhJj+1An8T0vqH8P2OWcSmJJj97dgUV79kz1VvRuR+BQaPZ6oUuHaXbRcUU7t94Gr0NkY=
X-Gm-Message-State: AOJu0YzHvhvd07nS14sI1ZKCGOHh6qDjKcC9HwRi7vm7POiXgaxtAEUu
	6CE99g7UaTCDqAmGbJGl5lafEI1roAAuwIGNP5zsyq4mpFNEUdRQ3+2u6qjeRXVbS8fG9NguLRi
	p1iURGMC9TXLgj4Funs0vXN7KOAU=
X-Google-Smtp-Source: AGHT+IG96LhAw8wrgerj/6cLpq6rZugdU6Z19efxBYeTunxRdokjJ/CnGMzl4ifk+lDafce3fGBmhHooKWiIky2kX/w=
X-Received: by 2002:a05:6000:1542:b0:368:7f4f:9ead with SMTP id
 ffacd0b85a97d-3717775b981mr2772783f8f.7.1723651438898; Wed, 14 Aug 2024
 09:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240814085618.968833-1-samuel.holland@sifive.com> <20240814085618.968833-3-samuel.holland@sifive.com>
In-Reply-To: <20240814085618.968833-3-samuel.holland@sifive.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 14 Aug 2024 18:03:48 +0200
Message-ID: <CA+fCnZdqCSeSNeB+OpWFTPiTY0BguZKkWexiiELYt8TRqw4Vvw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] kasan: sw_tags: Check kasan_flag_enabled at runtime
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_090401_301211_CBBC37DE 
X-CRM114-Status: GOOD (  23.40  )
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

T24gV2VkLCBBdWcgMTQsIDIwMjQgYXQgMTA6NTbigK9BTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBPbiBSSVNDLVYsIHRoZSBJU0EgZXh0ZW5z
aW9uIHJlcXVpcmVkIHRvIGRlcmVmZXJlbmNlIHRhZ2dlZCBwb2ludGVycyBpcwo+IG9wdGlvbmFs
LCBhbmQgdGhlIGludGVyZmFjZSB0byBlbmFibGUgcG9pbnRlciBtYXNraW5nIHJlcXVpcmVzIGZp
cm13YXJlCj4gc3VwcG9ydC4gVGhlcmVmb3JlLCB3ZSBtdXN0IGRldGVjdCBhdCBydW50aW1lIGlm
IHN3X3RhZ3MgaXMgdXNhYmxlIG9uIGEKPiBnaXZlbiBtYWNoaW5lLiBSZXVzZSB0aGUgbG9naWMg
ZnJvbSBod190YWdzIHRvIGR5bmFtaWNhbGx5IGVuYWJsZSBLQVNBTi4KPgo+IFRoaXMgY29tbWl0
IG1ha2VzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlIHRvIHRoZSBLQVNBTl9IV19UQUdTIGNvZGUgcGF0
aC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZp
dmUuY29tPgo+IC0tLQo+Cj4gIGluY2x1ZGUvbGludXgva2FzYW4tZW5hYmxlZC5oIHwgMTUgKysr
KystLS0tLS0tLS0tCj4gIG1tL2thc2FuL2h3X3RhZ3MuYyAgICAgICAgICAgIHwgMTAgLS0tLS0t
LS0tLQo+ICBtbS9rYXNhbi90YWdzLmMgICAgICAgICAgICAgICB8IDEwICsrKysrKysrKysKPiAg
MyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2thc2FuLWVuYWJsZWQuaCBiL2luY2x1ZGUvbGludXgv
a2FzYW4tZW5hYmxlZC5oCj4gaW5kZXggNmY2MTJkNjllYTBjLi42NDhiZGE5NDk1YjcgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9rYXNhbi1lbmFibGVkLmgKPiArKysgYi9pbmNsdWRlL2xp
bnV4L2thc2FuLWVuYWJsZWQuaAo+IEBAIC00LDcgKzQsNyBAQAo+Cj4gICNpbmNsdWRlIDxsaW51
eC9zdGF0aWNfa2V5Lmg+Cj4KPiAtI2lmZGVmIENPTkZJR19LQVNBTl9IV19UQUdTCj4gKyNpZiBk
ZWZpbmVkKENPTkZJR19LQVNBTl9TV19UQUdTKSB8fCBkZWZpbmVkKENPTkZJR19LQVNBTl9IV19U
QUdTKQo+Cj4gIERFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRShrYXNhbl9mbGFnX2VuYWJsZWQpOwo+
Cj4gQEAgLTEzLDIzICsxMywxOCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wga2FzYW5f
ZW5hYmxlZCh2b2lkKQo+ICAgICAgICAgcmV0dXJuIHN0YXRpY19icmFuY2hfbGlrZWx5KCZrYXNh
bl9mbGFnX2VuYWJsZWQpOwo+ICB9Cj4KPiAtc3RhdGljIGlubGluZSBib29sIGthc2FuX2h3X3Rh
Z3NfZW5hYmxlZCh2b2lkKQo+IC17Cj4gLSAgICAgICByZXR1cm4ga2FzYW5fZW5hYmxlZCgpOwo+
IC19Cj4gLQo+IC0jZWxzZSAvKiBDT05GSUdfS0FTQU5fSFdfVEFHUyAqLwo+ICsjZWxzZSAvKiBD
T05GSUdfS0FTQU5fU1dfVEFHUyB8fCBDT05GSUdfS0FTQU5fSFdfVEFHUyAqLwo+Cj4gIHN0YXRp
YyBpbmxpbmUgYm9vbCBrYXNhbl9lbmFibGVkKHZvaWQpCj4gIHsKPiAgICAgICAgIHJldHVybiBJ
U19FTkFCTEVEKENPTkZJR19LQVNBTik7Cj4gIH0KPgo+ICsjZW5kaWYgLyogQ09ORklHX0tBU0FO
X1NXX1RBR1MgfHwgQ09ORklHX0tBU0FOX0hXX1RBR1MgKi8KPiArCj4gIHN0YXRpYyBpbmxpbmUg
Ym9vbCBrYXNhbl9od190YWdzX2VuYWJsZWQodm9pZCkKPiAgewo+IC0gICAgICAgcmV0dXJuIGZh
bHNlOwo+ICsgICAgICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0tBU0FOX0hXX1RBR1MpICYm
IGthc2FuX2VuYWJsZWQoKTsKPiAgfQo+Cj4gLSNlbmRpZiAvKiBDT05GSUdfS0FTQU5fSFdfVEFH
UyAqLwo+IC0KPiAgI2VuZGlmIC8qIExJTlVYX0tBU0FOX0VOQUJMRURfSCAqLwo+IGRpZmYgLS1n
aXQgYS9tbS9rYXNhbi9od190YWdzLmMgYi9tbS9rYXNhbi9od190YWdzLmMKPiBpbmRleCA5OTU4
ZWJjMTVkMzguLmMzYmVlYjk0ZWZhNSAxMDA2NDQKPiAtLS0gYS9tbS9rYXNhbi9od190YWdzLmMK
PiArKysgYi9tbS9rYXNhbi9od190YWdzLmMKPiBAQCAtNDMsMTMgKzQzLDYgQEAgc3RhdGljIGVu
dW0ga2FzYW5fYXJnIGthc2FuX2FyZyBfX3JvX2FmdGVyX2luaXQ7Cj4gIHN0YXRpYyBlbnVtIGth
c2FuX2FyZ19tb2RlIGthc2FuX2FyZ19tb2RlIF9fcm9fYWZ0ZXJfaW5pdDsKPiAgc3RhdGljIGVu
dW0ga2FzYW5fYXJnX3ZtYWxsb2Mga2FzYW5fYXJnX3ZtYWxsb2MgX19pbml0ZGF0YTsKPgo+IC0v
Kgo+IC0gKiBXaGV0aGVyIEtBU0FOIGlzIGVuYWJsZWQgYXQgYWxsLgo+IC0gKiBUaGUgdmFsdWUg
cmVtYWlucyBmYWxzZSB1bnRpbCBLQVNBTiBpcyBpbml0aWFsaXplZCBieSBrYXNhbl9pbml0X2h3
X3RhZ3MoKS4KPiAtICovCj4gLURFRklORV9TVEFUSUNfS0VZX0ZBTFNFKGthc2FuX2ZsYWdfZW5h
YmxlZCk7Cj4gLUVYUE9SVF9TWU1CT0woa2FzYW5fZmxhZ19lbmFibGVkKTsKPiAtCj4gIC8qCj4g
ICAqIFdoZXRoZXIgdGhlIHNlbGVjdGVkIG1vZGUgaXMgc3luY2hyb25vdXMsIGFzeW5jaHJvbm91
cywgb3IgYXN5bW1ldHJpYy4KPiAgICogRGVmYXVsdHMgdG8gS0FTQU5fTU9ERV9TWU5DLgo+IEBA
IC0yNTcsOSArMjUwLDYgQEAgdm9pZCBfX2luaXQga2FzYW5faW5pdF9od190YWdzKHZvaWQpCj4K
PiAgICAgICAgIGthc2FuX2luaXRfdGFncygpOwo+Cj4gLSAgICAgICAvKiBLQVNBTiBpcyBub3cg
aW5pdGlhbGl6ZWQsIGVuYWJsZSBpdC4gKi8KPiAtICAgICAgIHN0YXRpY19icmFuY2hfZW5hYmxl
KCZrYXNhbl9mbGFnX2VuYWJsZWQpOwo+IC0KPiAgICAgICAgIHByX2luZm8oIktlcm5lbEFkZHJl
c3NTYW5pdGl6ZXIgaW5pdGlhbGl6ZWQgKGh3LXRhZ3MsIG1vZGU9JXMsIHZtYWxsb2M9JXMsIHN0
YWNrdHJhY2U9JXMpXG4iLAo+ICAgICAgICAgICAgICAgICBrYXNhbl9tb2RlX2luZm8oKSwKPiAg
ICAgICAgICAgICAgICAga2FzYW5fdm1hbGxvY19lbmFibGVkKCkgPyAib24iIDogIm9mZiIsCj4g
ZGlmZiAtLWdpdCBhL21tL2thc2FuL3RhZ3MuYyBiL21tL2thc2FuL3RhZ3MuYwo+IGluZGV4IGQ2
NWQ0OGI4NWY5MC4uYzExMWQ5ODk2MWVkIDEwMDY0NAo+IC0tLSBhL21tL2thc2FuL3RhZ3MuYwo+
ICsrKyBiL21tL2thc2FuL3RhZ3MuYwo+IEBAIC0zMiw2ICszMiwxMyBAQCBlbnVtIGthc2FuX2Fy
Z19zdGFja3RyYWNlIHsKPgo+ICBzdGF0aWMgZW51bSBrYXNhbl9hcmdfc3RhY2t0cmFjZSBrYXNh
bl9hcmdfc3RhY2t0cmFjZSBfX2luaXRkYXRhOwo+Cj4gKy8qCj4gKyAqIFdoZXRoZXIgS0FTQU4g
aXMgZW5hYmxlZCBhdCBhbGwuCj4gKyAqIFRoZSB2YWx1ZSByZW1haW5zIGZhbHNlIHVudGlsIEtB
U0FOIGlzIGluaXRpYWxpemVkIGJ5IGthc2FuX2luaXRfdGFncygpLgo+ICsgKi8KPiArREVGSU5F
X1NUQVRJQ19LRVlfRkFMU0Uoa2FzYW5fZmxhZ19lbmFibGVkKTsKPiArRVhQT1JUX1NZTUJPTChr
YXNhbl9mbGFnX2VuYWJsZWQpOwo+ICsKPiAgLyogV2hldGhlciB0byBjb2xsZWN0IGFsbG9jL2Zy
ZWUgc3RhY2sgdHJhY2VzLiAqLwo+ICBERUZJTkVfU1RBVElDX0tFWV9UUlVFKGthc2FuX2ZsYWdf
c3RhY2t0cmFjZSk7Cj4KPiBAQCAtOTIsNiArOTksOSBAQCB2b2lkIF9faW5pdCBrYXNhbl9pbml0
X3RhZ3Modm9pZCkKPiAgICAgICAgICAgICAgICAgaWYgKFdBUk5fT04oIXN0YWNrX3JpbmcuZW50
cmllcykpCj4gICAgICAgICAgICAgICAgICAgICAgICAgc3RhdGljX2JyYW5jaF9kaXNhYmxlKCZr
YXNhbl9mbGFnX3N0YWNrdHJhY2UpOwo+ICAgICAgICAgfQo+ICsKPiArICAgICAgIC8qIEtBU0FO
IGlzIG5vdyBpbml0aWFsaXplZCwgZW5hYmxlIGl0LiAqLwo+ICsgICAgICAgc3RhdGljX2JyYW5j
aF9lbmFibGUoJmthc2FuX2ZsYWdfZW5hYmxlZCk7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBzYXZl
X3N0YWNrX2luZm8oc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLCB2b2lkICpvYmplY3QsCj4gLS0K
PiAyLjQ1LjEKPgoKUmV2aWV3ZWQtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ21h
aWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
