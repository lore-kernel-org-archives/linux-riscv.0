Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0B4C531DC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 02:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2EUiP02DtUMJNzFmQhS+nuroka7d+54lZYTBS1BbMI=; b=mC+46D9pRxNCWG
	ljvz1JwrwLmSKauK17QC5tbEkht0sAHxxr5vOvJy+bYMc2/InH0oNe9AqOUqvDgj1Q+0llNJsW25D
	h0L36qspmM2hQBd1s4mYsjhp2YiU8if6CEYOTdC43PqsN1PymQ6/BVP7HsJHlnvR82pwXpuVnHIGc
	r7RAjRl27rg04q11HU+gXcWOxCVWxUDIZGVPilFHiiRuAIvpCMGTU7ChFSY0ADVrOLpkBt0QPzik4
	ebixtoyT7st7Z5XZZPQIupjGXzM26lTg+NWevHwWkS59LpRjltinHIesZigVcKXmGskXkwma9iAHy
	QnpsnO1E/p6rKI/8G4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sePsL-00000008nzC-0PkJ;
	Thu, 15 Aug 2024 02:06:05 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sePsH-00000008nyK-06zf
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 02:06:03 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5d5f9d68805so324376eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 19:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1723687559; x=1724292359; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gztf11sxNJHPAiXVpalG2T6xg+DahVfwn29zmjNMpnI=;
        b=Mnyh8658lQrdCHIKTGyPcuYCTACXMiZKUU42BDOOwJGlYOk6KkkehGEAue3UvRzOLH
         VEnWi8QdROYplvbafAGpBW/yYqVtasLxildrT4plg4FkThvRl7pgHuzrhE1Q41h95ViN
         scFlDaVyoPSmRdMnCRkvQ1xVNKqnfssEvnkJNg3sx0JQr5JNHPWwh6gtFw4KqtleTIhc
         S3tcv7phtwFSYSu+yN5eVOUbFT4cd5BLjq2269cudCV98VU9crDl72wJ+AkgdDHVXD1T
         VPMmD/Ameh+0bbDIrYUIeSDbbU5lTPhAveRNBOtN33hexLQ1Z9GdlhDV6I/+wWs35o75
         AHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723687559; x=1724292359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gztf11sxNJHPAiXVpalG2T6xg+DahVfwn29zmjNMpnI=;
        b=NE2WDqc/vxpJ10CVuppnimgNFKVzbkeIuLF+2uoqK1lhDLNIyMl2rLHgzLmwqR3dEc
         CscBg/2mkrfD5gA2va1w0SBiyKTT/4I1dBfTgiHN67xOLLza3BWlMWBQ5jOPqK5haHoQ
         bwO0ogYUswW2XKhKjaTEY+icdGvT8pHy0NdknfyDitU3X7JhG3almV7sUGwG+NCNhqwy
         U33hcL/bhrMqM+wSNZMDNlMFpeI35e4VXOf+MU9dPdHR2CLXK34/PZYvn0k30wTlhCdb
         IGowS71M65031y6pXzY4rZfj+KNf3Ctos/Yb15aCcZulNkug+0UJEItd2W//MCY/3845
         5qgA==
X-Forwarded-Encrypted: i=1; AJvYcCWq+sYVKX4Xg9/+O7Y60zYokL01rxnnSpa1hCQR/ZeWZDQ9sTqj8IwHL9VFr8GziV4wRg5K54FNl9Fz510IHCJFrMCTVsaXlqiCaCoqQ5qj
X-Gm-Message-State: AOJu0Yy4mV1MbwRq8xut9ghFql25pScCWpBf7CwX0NISuWX0xbU9jgtS
	LR9rlnrpjkCSYBuFnM3HSHPR5cYfkSVWdDoipi8mL9zgFT0LKy8EQx6Io7FJbG1vVwQK+4VrdaK
	mOl8PvmGw9UVeRotPfJrLXWiZgrn+eyR3EJovLw==
X-Google-Smtp-Source: AGHT+IHUGhcjxAU7b6t0hrvQi020b2arIFzB1nNlSVxcVIo/1yVCawLhV+YuT9lQoGaEmkbYJtbHnnDmtVVbUoulU8M=
X-Received: by 2002:a4a:ee97:0:b0:5ce:d2e3:b18 with SMTP id
 006d021491bc7-5da7c7214b8mr4159683eaf.8.1723687558915; Wed, 14 Aug 2024
 19:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240723021820.87718-1-cuiyunhui@bytedance.com>
In-Reply-To: <20240723021820.87718-1-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 15 Aug 2024 10:05:47 +0800
Message-ID: <CAEEQ3w=hsAEp8t+eH1GQW4M9ZY2TPXGUuhyNLB5DFEo88vwDZA@mail.gmail.com>
Subject: Re: [PATCH v3] riscv/mm/fault: add show_pte() before die()
To: conor@kernel.org, punit.agrawal@bytedance.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org, 
	surenb@google.com, peterx@redhat.com, alexghiti@rivosinc.com, 
	willy@infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_190601_252598_0065A094 
X-CRM114-Status: GOOD (  18.18  )
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

SGkgQWxsLAoKQSBnZW50bGUgcGluZywgQW55IG1vcmUgY29tbWVudHMgb24gdGhpcyBwYXRjaD8K
Ck9uIFR1ZSwgSnVsIDIzLCAyMDI0IGF0IDEwOjE44oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVp
QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gV2hlbiB0aGUga2VybmVsIGRpc3BsYXlzICJVbmFi
bGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdAo+IHZpcnR1YWwgYWRkcmVzcyIs
IHdlIHdvdWxkIGxpa2UgdG8gY29uZmlybSB0aGUgc3RhdHVzIG9mIHRoZSB2aXJ0dWFsCj4gYWRk
cmVzcyBpbiB0aGUgcGFnZSB0YWJsZS4gU28gYWRkIHNob3dfcHRlKCkgYmVmb3JlIGRpZSgpLgo+
Cj4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiBS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0K
PiAgYXJjaC9yaXNjdi9tbS9mYXVsdC5jIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQu
Ywo+IGluZGV4IDUyMjRmMzczMzgwMi4uYzcyZTZjN2MwOWVmIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vZmF1bHQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+IEBAIC0yMiw2
ICsyMiw1NyBAQAo+Cj4gICNpbmNsdWRlICIuLi9rZXJuZWwvaGVhZC5oIgo+Cj4gK3N0YXRpYyB2
b2lkIHNob3dfcHRlKHVuc2lnbmVkIGxvbmcgYWRkcikKPiArewo+ICsgICAgICAgcGdkX3QgKnBn
ZHAsIHBnZDsKPiArICAgICAgIHA0ZF90ICpwNGRwLCBwNGQ7Cj4gKyAgICAgICBwdWRfdCAqcHVk
cCwgcHVkOwo+ICsgICAgICAgcG1kX3QgKnBtZHAsIHBtZDsKPiArICAgICAgIHB0ZV90ICpwdGVw
LCBwdGU7Cj4gKyAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSA9IGN1cnJlbnQtPm1tOwo+ICsK
PiArICAgICAgIGlmICghbW0pCj4gKyAgICAgICAgICAgICAgIG1tID0gJmluaXRfbW07Cj4gKwo+
ICsgICAgICAgcHJfYWxlcnQoIkN1cnJlbnQgJXMgcGd0YWJsZTogJWx1SyBwYWdlc2l6ZSwgJWQt
Yml0IFZBcywgcGdkcD0weCUwMTZsbHhcbiIsCj4gKyAgICAgICAgICAgICAgICBjdXJyZW50LT5j
b21tLCBQQUdFX1NJWkUgLyBTWl8xSywgVkFfQklUUywKPiArICAgICAgICAgICAgICAgIG1tID09
ICZpbml0X21tID8gKHU2NClfX3BhX3N5bWJvbChtbS0+cGdkKSA6IHZpcnRfdG9fcGh5cyhtbS0+
cGdkKSk7Cj4gKwo+ICsgICAgICAgcGdkcCA9IHBnZF9vZmZzZXQobW0sIGFkZHIpOwo+ICsgICAg
ICAgcGdkID0gcGdkcF9nZXQocGdkcCk7Cj4gKyAgICAgICBwcl9hbGVydCgiWyUwMTZseF0gcGdk
PSUwMTZseCIsIGFkZHIsIHBnZF92YWwocGdkKSk7Cj4gKyAgICAgICBpZiAocGdkX25vbmUocGdk
KSB8fCBwZ2RfYmFkKHBnZCkgfHwgcGdkX2xlYWYocGdkKSkKPiArICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gKwo+ICsgICAgICAgcDRkcCA9IHA0ZF9vZmZzZXQocGdkcCwgYWRkcik7Cj4gKyAg
ICAgICBwNGQgPSBwNGRwX2dldChwNGRwKTsKPiArICAgICAgIHByX2NvbnQoIiwgcDRkPSUwMTZs
eCIsIHA0ZF92YWwocDRkKSk7Cj4gKyAgICAgICBpZiAocDRkX25vbmUocDRkKSB8fCBwNGRfYmFk
KHA0ZCkgfHwgcDRkX2xlYWYocDRkKSkKPiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKwo+
ICsgICAgICAgcHVkcCA9IHB1ZF9vZmZzZXQocDRkcCwgYWRkcik7Cj4gKyAgICAgICBwdWQgPSBw
dWRwX2dldChwdWRwKTsKPiArICAgICAgIHByX2NvbnQoIiwgcHVkPSUwMTZseCIsIHB1ZF92YWwo
cHVkKSk7Cj4gKyAgICAgICBpZiAocHVkX25vbmUocHVkKSB8fCBwdWRfYmFkKHB1ZCkgfHwgcHVk
X2xlYWYocHVkKSkKPiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKwo+ICsgICAgICAgcG1k
cCA9IHBtZF9vZmZzZXQocHVkcCwgYWRkcik7Cj4gKyAgICAgICBwbWQgPSBwbWRwX2dldChwbWRw
KTsKPiArICAgICAgIHByX2NvbnQoIiwgcG1kPSUwMTZseCIsIHBtZF92YWwocG1kKSk7Cj4gKyAg
ICAgICBpZiAocG1kX25vbmUocG1kKSB8fCBwbWRfYmFkKHBtZCkgfHwgcG1kX2xlYWYocG1kKSkK
PiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKwo+ICsgICAgICAgcHRlcCA9IHB0ZV9vZmZz
ZXRfbWFwKHBtZHAsIGFkZHIpOwo+ICsgICAgICAgaWYgKCFwdGVwKQo+ICsgICAgICAgICAgICAg
ICBnb3RvIG91dDsKPiArCj4gKyAgICAgICBwdGUgPSBwdGVwX2dldChwdGVwKTsKPiArICAgICAg
IHByX2NvbnQoIiwgcHRlPSUwMTZseCIsIHB0ZV92YWwocHRlKSk7Cj4gKyAgICAgICBwdGVfdW5t
YXAocHRlcCk7Cj4gK291dDoKPiArICAgICAgIHByX2NvbnQoIlxuIik7Cj4gK30KPiArCj4gIHN0
YXRpYyB2b2lkIGRpZV9rZXJuZWxfZmF1bHQoY29uc3QgY2hhciAqbXNnLCB1bnNpZ25lZCBsb25n
IGFkZHIsCj4gICAgICAgICAgICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICB7Cj4gQEAg
LTMxLDYgKzgyLDcgQEAgc3RhdGljIHZvaWQgZGllX2tlcm5lbF9mYXVsdChjb25zdCBjaGFyICpt
c2csIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAgICAgICAgICAgYWRkcik7Cj4KPiAgICAg
ICAgIGJ1c3Rfc3BpbmxvY2tzKDApOwo+ICsgICAgICAgc2hvd19wdGUoYWRkcik7Cj4gICAgICAg
ICBkaWUocmVncywgIk9vcHMiKTsKPiAgICAgICAgIG1ha2VfdGFza19kZWFkKFNJR0tJTEwpOwo+
ICB9Cj4gLS0KPiAyLjM5LjIKPgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
