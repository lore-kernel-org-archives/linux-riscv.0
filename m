Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010E4C3271E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 06:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsCgeZdk1ZZn7VSQzgUSUH4nd4JjUoHjAFWgsJ+l1r4=; b=yopEJB3NSeV6HB
	eLYUGSs53yDUgW0U8idlgQ97+22mlFEg9u/l+xwpzjOzYqZPIGDBFr0akJSQ+DKTofwUnA4iQZ3p1
	K0T5BrhpiUDXPmH+moRe3h/8Hlsei8jNW86jec5VUeWEBImJKIo9W/PNLMCBOFFptUDqGA3LiqQBO
	+MFWZaEAktrYoHsTM4Lxnlv3vcJ3RlAwFZMoxczJKnrmdDE36L1oroocndHIdHrQGgO3LwOUt8jOU
	cAiGoCHJS2meb6RQzPtOy/zRxWgsBDaIG1+WdDpTqeaiosd/iDxRalRGIf3hwOondRHgsx678r+a1
	ggCA3V0VhkMTcpVREDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRn68-0000000CsFu-1ucx;
	Thu, 11 Jul 2024 06:16:08 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRn65-0000000CsFD-349L
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 06:16:07 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3d932f991f6so315965b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 23:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1720678564; x=1721283364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJ0Z6cXb98EmZGcIFWsfHRThtuJvf+uWp8pRo+TY/1M=;
        b=k9bKz75DOP9cRmqyXSD3dCKSH8Mjyo4G55Kd+pnFUxmHa8SYB35x7AhhR+YsYXBXdi
         vrL0JBUnt6lPivYS5vvlQ9PCyR8mahhFc5lUH69fE/LwZXJYwV32j8V+t9NKvRylnWnS
         VbGrc6lZeidmGPzk++bXsrMam/aUS6e9YrrgSvmcSmC8gAoLE2O8iBZBF4glkqx9PiBK
         AQAmlBWAAxXvhSdKf8tg4VdVRTgMGXjHXZjX4MFR/DLbte3lkueCv+lAJXxXRBKetAAa
         mZVIKW0eyIyX+UyPthNfFuj1y8aGhwrSbpFwcMBjkFqoUhR+6uLQPoqMlc6ucYcOUWe6
         IXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720678564; x=1721283364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJ0Z6cXb98EmZGcIFWsfHRThtuJvf+uWp8pRo+TY/1M=;
        b=iisq3pXknsAbODaS6qSocMJIbZeHXScJoTbgTXsGblU9ZouB688XH1vJGz4Sf0hKd6
         UsRff5kfVibbn4rfaM94F8k16npCxCFf4wTOViI9htEWzMpkBnRAuqfx1IK0eH9vSw7j
         nF6+M/NacY8v+42IZ3ZeV9RQaQPRA5ZZ8t1XX2qXM8ZwhMETdKN96fhoWSsYb02kcHkK
         S8Nk1Hkd3LnZVCkGOlichASixf7SnLiWGpKNFYB3PjgKt/vROffl0JEgez6ZqVP/9BjU
         Er0tcp7Bb+/7N+9IEGYR6ZLjY1f7oBAxDD4VsQBpfZcL6qD0auPirqkIE9TIK6qyLDrA
         4gNA==
X-Forwarded-Encrypted: i=1; AJvYcCUJr5IsYoiDiPT6A5hf9e38P+3UB+80StG+t4gtqER5TPEObCVZDeyFpL7gWfOgbqe5jaFN0TdcUdkIQGB19ZwTK2WlIJ4G/DjF2uh25NEw
X-Gm-Message-State: AOJu0Yy/+MdFu+rLVglM4gcUbR5GtzhBJ8BbEDEImwNOLAtmHZig1ky/
	9xyfxlUAQm3eaVYolckjKBTP8BUGLLQAmiSaabuTyrYcUl6kv26LuXBFQwGHY7gaq9XtXLf5cUr
	C+m60N6ZDU5b+mCk8mUZmMt0zBtW0UW+eS187Sw==
X-Google-Smtp-Source: AGHT+IFdwET1pfCBi86eQx2wfXA9P6KMkAOby2PoYjCaq7p8/aLek5mXIrMth+KJtj8hMDuMaQsDPFvTWwx1YSGKb34=
X-Received: by 2002:a05:6870:96a0:b0:254:a810:cdf with SMTP id
 586e51a60fabf-25eae7a4562mr6653938fac.13.1720678564625; Wed, 10 Jul 2024
 23:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240624123739.43604-1-cuiyunhui@bytedance.com> <ZoXEmryf8RuLMZWN@ghost>
In-Reply-To: <ZoXEmryf8RuLMZWN@ghost>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 11 Jul 2024 14:15:53 +0800
Message-ID: <CAEEQ3wmc6ftb_pTh3eG7Rnwkg4rRy8gzSqWQ2nPh_Aw5ZoBKdA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] RISC-V: cmdline: Add support for
 'memmap' parameter
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: rppt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alexghiti@rivosinc.com, akpm@linux-foundation.org, 
	bhe@redhat.com, dawei.li@shingroup.cn, jszhang@kernel.org, 
	namcao@linutronix.de, chenjiahao16@huawei.com, bjorn@rivosinc.com, 
	vishal.moola@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, punit.agrawal@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_231605_789969_10BC1819 
X-CRM114-Status: GOOD (  19.19  )
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

QWRkIHB1bml0IGluIHRoZSBsb29wLgoKCk9uIFRodSwgSnVsIDQsIDIwMjQgYXQgNTozN+KAr0FN
IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gTW9u
LCBKdW4gMjQsIDIwMjQgYXQgMDg6Mzc6MzlQTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+
IEFkZCBwYXJzaW5nIG9mICdtZW1tYXAnIHRvIHVzZSBvciByZXNlcnZlIGEgc3BlY2lmaWMgcmVn
aW9uIG9mIG1lbW9yeS4KPiA+Cj4gPiBJbXBsZW1lbnQgdGhlIGZvbGxvd2luZyBtZW1tYXAgdmFy
aWFudHM6Cj4gPiAtIG1lbW1hcD1ubltLTUddQHNzW0tNR106IGZvcmNlIHVzYWdlIG9mIGEgc3Bl
Y2lmaWMgcmVnaW9uIG9mIG1lbW9yeTsKPiA+IC0gbWVtbWFwPW5uW0tNR10kc3NbS01HXTogbWFy
ayBzcGVjaWZpZWQgbWVtb3J5IGFzIHJlc2VydmVkOwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1
bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNj
di9tbS9pbml0LmMgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+IGlu
ZGV4IGUzNDA1ZTRiOTlhZi4uOGUxZDkzYWU1Y2IyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9tbS9pbml0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBAQCAtMjA4LDYg
KzIwOCw1MiBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9tZW0oY2hhciAqcCkKPiA+ICB9Cj4g
PiAgZWFybHlfcGFyYW0oIm1lbSIsIGVhcmx5X21lbSk7Cj4gPgo+ID4gK3N0YXRpYyB2b2lkIF9f
aW5pdCBwYXJzZV9tZW1tYXBfb25lKGNoYXIgKnApCj4gPiArewo+ID4gKyAgICAgY2hhciAqb2xk
cDsKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnRfYXQsIG1lbV9zaXplOwo+ID4gKwo+ID4g
KyAgICAgaWYgKCFwKQo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiArCj4gPiArICAgICBv
bGRwID0gcDsKPiA+ICsgICAgIG1lbV9zaXplID0gbWVtcGFyc2UocCwgJnApOwo+ID4gKyAgICAg
aWYgKHAgPT0gb2xkcCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAg
c3dpdGNoICgqcCkgewo+ID4gKyAgICAgY2FzZSAnQCc6Cj4gPiArICAgICAgICAgICAgIHN0YXJ0
X2F0ID0gbWVtcGFyc2UocCArIDEsICZwKTsKPiA+ICsgICAgICAgICAgICAgbWVtYmxvY2tfYWRk
KHN0YXJ0X2F0LCBtZW1fc2l6ZSk7Cj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gKwo+ID4g
KyAgICAgY2FzZSAnJCc6Cj4gPiArICAgICAgICAgICAgIHN0YXJ0X2F0ID0gbWVtcGFyc2UocCAr
IDEsICZwKTsKPiA+ICsgICAgICAgICAgICAgbWVtYmxvY2tfcmVzZXJ2ZShzdGFydF9hdCwgbWVt
X3NpemUpOwo+ID4gKyAgICAgICAgICAgICBicmVhazsKPiA+ICsKPiA+ICsgICAgIGRlZmF1bHQ6
Cj4gPiArICAgICAgICAgICAgIHByX3dhcm4oIlVucmVjb2duaXplZCBtZW1tYXAgc3ludGF4OiAl
c1xuIiwgcCk7Cj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgfQo+ID4gK30KPiA+
ICsKPiA+ICtzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9tZW1tYXBfb3B0KGNoYXIgKnN0cikKPiA+
ICt7Cj4gPiArICAgICB3aGlsZSAoc3RyKSB7Cj4gPiArICAgICAgICAgICAgIGNoYXIgKmsgPSBz
dHJjaHIoc3RyLCAnLCcpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBpZiAoaykKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAqaysrID0gMDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgcGFyc2Vf
bWVtbWFwX29uZShzdHIpOwo+ID4gKyAgICAgICAgICAgICBzdHIgPSBrOwo+ID4gKyAgICAgfQo+
ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gK2Vhcmx5X3BhcmFtKCJtZW1tYXAi
LCBwYXJzZV9tZW1tYXBfb3B0KTsKPiA+ICsKPiA+ICBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBf
Ym9vdG1lbSh2b2lkKQo+ID4gIHsKPiA+ICAgICAgIHBoeXNfYWRkcl90IHZtbGludXhfZW5kID0g
X19wYV9zeW1ib2woJl9lbmQpOwo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KPgo+IFJldmlld2VkLWJ5
OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+CgpUaGFua3MsCll1bmh1
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
