Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28978CAC5B7
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 03:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNu99mly1i2V9DJURC7qbHba3CbxC/YHgjAgbH7z52Y=; b=NXss+S2vws6f8W
	bkGvOax5ltJbl27/SVD9rtFuXy3C/Gi8DJKufQivzT3eTKrwd9WDQO10Mx30jKY3wmNOGOUYRy7/u
	ch4C7prVNztQLqgZDbSCua9eL0jupz7/jYx5dRnU77T4iyMMonOIFNF3Db6jjeZlLmM+UQt9WTAwm
	yOrGcaHjUMPjTY6JdGHBO6cP4e4loE+RQeCirL0Yh61NtwelGq53Y8DqsfWAGTqod4ZYNCt/1G/0A
	Hsbx2z5jG5Q5fbRFeTY7Hq8/q7qIRK/TD3gCPeC+ml5SjxWxQCdyhKwoUO9KS7az5k9lrFIOJiMCn
	iDeIi0EJIc2udoemKVuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqlhH-00000007Ouq-1SvE;
	Wed, 18 Sep 2024 03:49:43 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqlhD-00000007Ou3-2J7F
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 03:49:41 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3e042f4636dso2628185b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 20:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1726631378; x=1727236178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zE1dJbAWhCPBAK0t0zhX3bNIT7kXRFcGehfITM1od0w=;
        b=Iyrzm9DETOBKVXL/x2dw2MeK99fohERQwmQ3FxlrCw/QA8CTwnGGKxlGzPL0Oyda5x
         2RNkE7Wl/1CPHNccA1TxvcosVlKXkBT0XwGZ8FGFJ74WmiPHNXLt/sO6az+zLzk1CUN1
         sxaxn9a9bSBOi8CdvgKyAC/tyHz+k4EDwz53hJhU7Wf1HN0IzXz19IgEIcl91j51KFDL
         Vdv2GES4259DhD8AZl8sr3hTL/P0PzjXNrOPUKtz6mWst5E0+3so+cJ5HRD+oNiw9K1d
         rG6oExIu4mWn1cRm+SAT4ClK1HHbFXmhWBYWEZY2gV8caTWqdi3Kzrxj32wr8eCYfTz3
         oOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726631378; x=1727236178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zE1dJbAWhCPBAK0t0zhX3bNIT7kXRFcGehfITM1od0w=;
        b=Z6ZCCS4Tli/61wsrgTjVcrwS/DsjjdYJCNnUogVFd327VOSHPl6iH78LibSvzXqFiy
         VFCl/rhHOVvcBC1V9s0srl87QdJWcqnQhFjvkK2jNVGCaeYyNRZrhORVzSu50rFqy62l
         XqE5k7BUWfw+s8fAKXTD4eJH/ZrZ/cmH0AWbhwPMObsIQNTfaWjNCgbTXICWtRVwc9MP
         hrl4RjPUztv6Ri11HpQcMREQks2FBjUD9zOwr6POlPxN0+fYByFuHuvbH+Cj/YfQ14Vt
         al7RXBAI5ZWBbho4awq2CPZRfmC/vt7kPLJOVP4+uI9AqF3CcJtY/oo4tWFRg3oLCes1
         hSsw==
X-Forwarded-Encrypted: i=1; AJvYcCWBTNOl3oHA7ubw9BpylE4GPozuRY8EesxZMu9pOSoNYJzQvFDRhtfo1pafHzvyOaGlpsNXWGLQju52fA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1C2FIVOc2c/JRI+yi+3FdELaLOErjMo9QvdAZG1qijzJPkEpz
	9N1oiYKHYbEqAOIxCo/grJx1Vd6U2FXnCGtHXZDIVoFD40ZcEZRiK3fxsvqZPGyI6KVzG5ei5+i
	oYVst4ze8OnvqK0s6NwTezeBLhxAukqvzw5ax8Q==
X-Google-Smtp-Source: AGHT+IHeC3dsKkrJc6ljF9R1rShW49VPA4Ien1gEXCjQwV42Ui98RWbpm6Atdeb+k67hVyRYS7hwlqTZVvQQpFlTolA=
X-Received: by 2002:a05:6808:3190:b0:3e1:7061:39f7 with SMTP id
 5614622812f47-3e170613b17mr7499049b6e.0.1726631378299; Tue, 17 Sep 2024
 20:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240814062625.19794-1-cuiyunhui@bytedance.com> <afaa4192-da08-4180-a09b-2b953293ba76@ghiti.fr>
In-Reply-To: <afaa4192-da08-4180-a09b-2b953293ba76@ghiti.fr>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 18 Sep 2024 11:49:27 +0800
Message-ID: <CAEEQ3w=S=Gn9qER=qNwUn8+Gs9AN4Y5-0Zg0w8-4Vps4L7n97w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: add a warning when physical memory
 address overflows
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alexghiti@rivosinc.com, chenjiahao16@huawei.com, 
	guoren@kernel.org, vishal.moola@gmail.com, stuart.menefy@codasip.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_204939_616145_523F6DBD 
X-CRM114-Status: GOOD (  19.08  )
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

SGkgUGFsbWVyLAoKQSBnZW50bGUgcGluZyBmb3IgdGhpcyBwYXRjaC4KCk9uIFRodSwgQXVnIDE1
LCAyMDI0IGF0IDc6MDHigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3Rl
Ogo+Cj4gSGkgWXVuaHVpLAo+Cj4gT24gMTQvMDgvMjAyNCAwODoyNiwgWXVuaHVpIEN1aSB3cm90
ZToKPiA+IFRoZSBwYXJ0IG9mIHBoeXNpY2FsIG1lbW9yeSB0aGF0IGV4Y2VlZHMgdGhlIHNpemUg
b2YgdGhlIGxpbmVhciBtYXBwaW5nCj4gPiB3aWxsIGJlIGRpc2NhcmRlZC4gV2hlbiB0aGUgc3lz
dGVtIHN0YXJ0cyB1cCBub3JtYWxseSwgYSB3YXJuaW5nIG1lc3NhZ2UKPiA+IHdpbGwgYmUgcHJp
bnRlZCB0byBwcmV2ZW50IGNvbmZ1c2lvbiBjYXVzZWQgYnkgdGhlIG1pc21hdGNoIGJldHdlZW4g
dGhlCj4gPiBzeXN0ZW0gbWVtb3J5IGFuZCB0aGUgYWN0dWFsIHBoeXNpY2FsIG1lbW9yeS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4K
PiA+IC0tLQo+ID4gICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDggKysrKysrLS0KPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4g
aW5kZXggNTIyOTBjOWJkMDRiZC4uYzkzMTY0ZGM1MTY1OCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTIz
Niw4ICsyMzYsMTIgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKPiA+
ICAgICAgICAqLwo+ID4gICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzY0QklUKSkgewo+ID4g
ICAgICAgICAgICAgICBtYXhfbWFwcGVkX2FkZHIgPSBfX3BhKFBBR0VfT0ZGU0VUKSArIEtFUk5f
VklSVF9TSVpFOwo+ID4gLSAgICAgICAgICAgICBtZW1ibG9ja19jYXBfbWVtb3J5X3JhbmdlKHBo
eXNfcmFtX2Jhc2UsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bWF4X21hcHBlZF9hZGRyIC0gcGh5c19yYW1fYmFzZSk7Cj4gPiArICAgICAgICAgICAgIGlmICht
ZW1ibG9ja19lbmRfb2ZfRFJBTSgpID4gbWF4X21hcHBlZF9hZGRyKSB7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgbWVtYmxvY2tfY2FwX21lbW9yeV9yYW5nZShwaHlzX3JhbV9iYXNlLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWF4X21hcHBl
ZF9hZGRyIC0gcGh5c19yYW1fYmFzZSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcHJfd2Fy
bigiUGh5c2ljYWwgbWVtb3J5IG92ZXJmbG93cyB0aGUgbGluZWFyIG1hcHBpbmcgc2l6ZTogcmVn
aW9uIGFib3ZlIDB4JWxseCByZW1vdmVkIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG1heF9tYXBwZWRfYWRkcik7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICAgICAgIH0KPiA+
Cj4gPgo+Cj4KPiBBIGJpdCB3ZWlyZCB0byByZXZpZXcgYW5kIHRlc3QgbXkgb3duIHBhdGNoLCBi
dXQgaGVyZSBpdCBpcyBhbnl3YXkgOikKPgo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4KPiBUZXN0ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPgo+IFRoYW5rcywKPgo+IEFsZXgKPgoKVGhhbmtzLApZ
dW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
