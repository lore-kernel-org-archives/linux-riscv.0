Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B08C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jd85Z8ZpLa5rYhtFzOlHjH24WKuxJPaAMwxqA0EvfmQ=; b=HMC41Hmdw3pCqU
	NTwLcI5YLG1EpjwATwVTM6wWrwKB8ol2ACdWmfh1l22pAQG0r2f8y2gkJeZcLvly5Quunu5EVk6PS
	Ti5r+khPrrppsLM+SiWUu4s6Lt3gHOgNfm2PqpQO4SzdvwnTz1PPwv5E0Q70CNAp9Rk4fSHUA9Co6
	EkiHvgxgBRURkRryVo1wv1HPVDV47YFs61FxtoWBq9AVIHWy8e5AwlXuXa3bt9QdJKROMed//IPLj
	fJl2er6xvtfAZHafxjERYTRF9jwgW96KAdtYKOrIQgSdGLk8IwoxgpihyqJ7GMxo+lb47VfyWEaLG
	RTl6DTrbYzFizVfVR5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg8aG-00000001iyk-0FtT;
	Fri, 01 Mar 2024 19:30:16 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg8aD-00000001ix6-31Ox
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 19:30:15 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51325c38d10so1932173e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 11:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709321412; x=1709926212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsQincBmT/DYFfglWuXNoT+0WIOyDGqPo/zOjnWnfU0=;
        b=fBkhxMc5XZPcd1waMy1+cCYLDF8gJRy5BwI3yEbjtuysyEk2Z3G9qyjWYbgAHyS4v1
         5YLu6TdTBXip+n7GuXfZ2lKlAJlZwT/GRcx4R+GG2HgS6a8RvX217v86eCMEGsip19m9
         aBdm6njANClfxNkhB1AOfcoG1b0P9fiIdHOp9kEmQaRQAqAA6yh0CGtySZ9MnlLiQYlT
         CYlU3rIyMNKtxPJzz7w3JIiaOcbWJ4ZQFcJ2m5UqqRm34Hjs6F1b8vI0mAI7QKcCRgUk
         u0HYPnV6YvhSIl0pGjvBaAjxWRIq5hYeI/TXnYP/NVlUHyFvpDLX57ew40HHbi+2+YOH
         ZeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709321412; x=1709926212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsQincBmT/DYFfglWuXNoT+0WIOyDGqPo/zOjnWnfU0=;
        b=bljWtDxRZo2CIZEO3de5eDF7saYmobr/sirBXQ7KVhLWw8SA+dhZzZ3axbPaUI4nBn
         UEJmczWNjJFJhNKALK+iRjiN9s7SDD543D9KVXXiMU1Oy320sQC9XX+RQLqluOYPwFvK
         MBNIAv9OiMEw6vgn3X9FB9DZ9283XXhyTEe61E9cCqOmVSuy2VrTjZ5L3zaFZqVYUu21
         WI045an2vN/Rxg7OhaDzOQtgocobwc4g7ov6n70VCr9VGFt7HIbkaWYZ9TD5IEfr+sk6
         qBbXIo+rszh4V3udq/JfaoCF6LyIGabOX0gnp7Rj68T1dP0uhy7xYqe9Ip2Cq7iudheM
         cUaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG0zAu3/7/j0vevqYGujmqoOAdxZm4eVrVBxCYLuqEcTbtNr2lFLB2ktMnQCFoEXOaNx5SmMMqH+XotMSH9OuvRE3uLNg3i7zw/iwJ5sCK
X-Gm-Message-State: AOJu0YzlQYMKxKQltSf0NiXHN2a3Oc5rhfdfow+lP+LcBwHjSDDsdclF
	+nmJpHI9qd/Nczj9Yo+NfT9iGZFQi16OnJUHGeC2elkTpRh86AcbGwuBP1S9x7J8zjVXHXqI30X
	XNc+Zh1iVN7WDm/FNcnKcOT4GI8UGwjZuHvKrSg==
X-Google-Smtp-Source: AGHT+IE+PvaR/VOgtC2hoRUjS0qfpwNjV/lMNaZfJiJ9vAQn76qy2Szeh6K3tc4T3wCAmpo/ciJWJCZhYz2vHJy2yy8=
X-Received: by 2002:a05:6512:3993:b0:513:3309:d59a with SMTP id
 j19-20020a056512399300b005133309d59amr1701352lfu.34.1709321411711; Fri, 01
 Mar 2024 11:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20240229010130.1380926-1-atishp@rivosinc.com> <20240229010130.1380926-5-atishp@rivosinc.com>
 <20240301-1a1aa2a2c04640c34749cb5f@orel>
In-Reply-To: <20240301-1a1aa2a2c04640c34749cb5f@orel>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 1 Mar 2024 11:30:00 -0800
Message-ID: <CAHBxVyHCB+GJXyn1TjhXKFD=GNhRzMuRUUx1LjJMxV+3W=y7TQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] RISC-V: Add SBI PMU snapshot definitions
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_113013_788807_01995FC0 
X-CRM114-Status: GOOD (  20.29  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXIgMSwgMjAyNCBhdCAzOjE04oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEZlYiAyOCwgMjAyNCBhdCAwNTowMTox
OVBNIC0wODAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+IFNCSSBQTVUgU25hcHNob3QgZnVuY3Rp
b24gb3B0aW1pemVzIHRoZSBudW1iZXIgb2YgdHJhcHMgdG8KPiA+IGhpZ2hlciBwcml2aWxlZ2Ug
bW9kZSBieSBsZXZlcmFnaW5nIGEgc2hhcmVkIG1lbW9yeSBiZXR3ZWVuIHRoZSBTL1ZTLW1vZGUK
PiA+IGFuZCB0aGUgTS9IUyBtb2RlLiBBZGQgdGhlIGRlZmluaXRpb25zIGZvciB0aGF0IGV4dGVu
c2lvbiBhbmQgbmV3IGVycm9yCj4gPiBjb2Rlcy4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiA+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmku
aCB8IDExICsrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiA+IGluZGV4IGVmODMxMWRhZmI5MS4uZGZhODMwZjdk
NTRiIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gQEAgLTEzMiw2ICsxMzIsNyBAQCBl
bnVtIHNiaV9leHRfcG11X2ZpZCB7Cj4gPiAgICAgICBTQklfRVhUX1BNVV9DT1VOVEVSX1NUT1As
Cj4gPiAgICAgICBTQklfRVhUX1BNVV9DT1VOVEVSX0ZXX1JFQUQsCj4gPiAgICAgICBTQklfRVhU
X1BNVV9DT1VOVEVSX0ZXX1JFQURfSEksCj4gPiArICAgICBTQklfRVhUX1BNVV9TTkFQU0hPVF9T
RVRfU0hNRU0sCj4gPiAgfTsKPiA+Cj4gPiAgdW5pb24gc2JpX3BtdV9jdHJfaW5mbyB7Cj4gPiBA
QCAtMTQ4LDYgKzE0OSwxMyBAQCB1bmlvbiBzYmlfcG11X2N0cl9pbmZvIHsKPiA+ICAgICAgIH07
Cj4gPiAgfTsKPiA+Cj4gPiArLyogRGF0YSBzdHJ1Y3R1cmUgdG8gY29udGFpbiB0aGUgcG11IHNu
YXBzaG90IGRhdGEgKi8KPiA+ICtzdHJ1Y3QgcmlzY3ZfcG11X3NuYXBzaG90X2RhdGEgewo+ID4g
KyAgICAgdTY0IGN0cl9vdmVyZmxvd19tYXNrOwo+ID4gKyAgICAgdTY0IGN0cl92YWx1ZXNbNjRd
Owo+ID4gKyAgICAgdTY0IHJlc2VydmVkWzQ0N107Cj4gPiArfTsKPiA+ICsKPiA+ICAjZGVmaW5l
IFJJU0NWX1BNVV9SQVdfRVZFTlRfTUFTSyBHRU5NQVNLX1VMTCg0NywgMCkKPiA+ICAjZGVmaW5l
IFJJU0NWX1BNVV9SQVdfRVZFTlRfSURYIDB4MjAwMDAKPiA+Cj4gPiBAQCAtMjQ0LDkgKzI1Miwx
MSBAQCBlbnVtIHNiaV9wbXVfY3RyX3R5cGUgewo+ID4KPiA+ICAvKiBGbGFncyBkZWZpbmVkIGZv
ciBjb3VudGVyIHN0YXJ0IGZ1bmN0aW9uICovCj4gPiAgI2RlZmluZSBTQklfUE1VX1NUQVJUX0ZM
QUdfU0VUX0lOSVRfVkFMVUUgKDEgPDwgMCkKPgo+IEEgcGF0Y2ggYmVmb3JlIHRoaXMgd2hpY2gg
Y2hhbmdlcyBhbGwgZmxhZ3MgdG8gdXNlIEJJVCgpIGluc3RlYWQgb2Ygc2hpZnRzCj4gd291bGQg
YmUgZ29vZCwgc2luY2Ugb3RoZXJ3aXNlIHRoZSBuZXcgZmxhZ3MgYXJlIGluY29uc2lzdGVudC4K
PgoKRG9uZS4KCj4KPiA+ICsjZGVmaW5lIFNCSV9QTVVfU1RBUlRfRkxBR19JTklUX0ZST01fU05B
UFNIT1QgQklUKDEpCj4KPiBUaGlzIGlzIG5hbWVkIFNCSV9QTVVfU1RBUlRfRkxBR19JTklUX1NO
QVBTSE9UIGluIHRoZSBzcGVjLgo+CgpGaXhlZC4KCj4KPiA+Cj4gPiAgLyogRmxhZ3MgZGVmaW5l
ZCBmb3IgY291bnRlciBzdG9wIGZ1bmN0aW9uICovCj4gPiAgI2RlZmluZSBTQklfUE1VX1NUT1Bf
RkxBR19SRVNFVCAoMSA8PCAwKQo+ID4gKyNkZWZpbmUgU0JJX1BNVV9TVE9QX0ZMQUdfVEFLRV9T
TkFQU0hPVCBCSVQoMSkKPiA+Cj4gPiAgZW51bSBzYmlfZXh0X2RiY25fZmlkIHsKPiA+ICAgICAg
IFNCSV9FWFRfREJDTl9DT05TT0xFX1dSSVRFID0gMCwKPiA+IEBAIC0yODUsNiArMjk1LDcgQEAg
c3RydWN0IHNiaV9zdGFfc3RydWN0IHsKPiA+ICAjZGVmaW5lIFNCSV9FUlJfQUxSRUFEWV9BVkFJ
TEFCTEUgLTYKPiA+ICAjZGVmaW5lIFNCSV9FUlJfQUxSRUFEWV9TVEFSVEVEIC03Cj4gPiAgI2Rl
ZmluZSBTQklfRVJSX0FMUkVBRFlfU1RPUFBFRCAtOAo+ID4gKyNkZWZpbmUgU0JJX0VSUl9OT19T
SE1FTSAgICAgLTkKPiA+Cj4gPiAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgc2JpX3NwZWNfdmVyc2lv
bjsKPiA+ICBzdHJ1Y3Qgc2JpcmV0IHsKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4KPiBUaGFua3Ms
Cj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
