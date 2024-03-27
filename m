Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63684C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 06:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GMlfDGjemrJmgI/KSfnNYs641F5/ovULYAZxQBAxEQ=; b=QJAtdh7U0aAjiR
	Lp1ogEzjnbAS/nJtqN5qIVQw1nOACagdD2d6EENrvqeYrqx9JMtIi3lf1cG2HM59oPdFybnGBinrl
	KBTuQi0fJozuTgCmQ9ODJErBZkXtrn52voPuUTwNUrBrN3Ilvni5wfRuXyzPzws00i+4Y7TUZQXly
	niBaigPiLgJ/h6sK9cevzcnrqKbBUif+GHslC4s36zniOB84oBfqGdZmcF+lu90sb4yaeY/XuDaeW
	4JrUCMexV5EELWGpzwRZQtf8fivR9n14bUQzo5kxDUQmPxdDWBtx/BrjoK2AfcCHHO9biTR/qnN2e
	A6MXE5MKVV2cugiG/cGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMaB-00000007dbB-1Asz;
	Wed, 27 Mar 2024 06:16:19 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMa8-00000007daF-0PAh
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 06:16:17 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-221a4f9557dso3910758fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 23:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711520171; x=1712124971; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kGrOBgnau6vlPoQysPMrILfu8WUrfgT3mQotZjW+mc=;
        b=Yw8eLSlzRL0ZXhPVYGflY5A07065GB1zHnMcJEw24v6cBOrjUncQZyQdlA/dIElSZ1
         CmBabXvXFXCyi0plflBChc7BhBD7y3hOExbIz69N5IAUOjRTtGw6Q8oG4dSjsy9Rda1S
         OkTyd30VUJPdt3lE56Cuu/4mWbp62R+sz6pwd9vWLKcy8l4CylisgxNpiphauX7r9tAC
         57CLbJJEm+iXP3A2Pa91atDaVeWEYPbbS3cLJDhoYO7IdxjIdlhFZNsRSrfkCt+G0H8N
         pf+7WjFVnolANJQVFMr9nS7LmmbFSHDaiKaDlvM6xQXbjXaxS0KBQOFnPrR2WPQhC/Hr
         WLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711520171; x=1712124971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kGrOBgnau6vlPoQysPMrILfu8WUrfgT3mQotZjW+mc=;
        b=wZcnqP+4R1VD1PiK5IPUi2R4fhVyP5j5mnxYI4g49n+EXDePg4IfF8mLzak3v0r2sG
         gUfGAN52uA2JDc1dPryZ7pS3rXGdR/b/PZmzMhfdW7/lnJdxVFWtM/7QnAOEnTf/sdTN
         bTqcaoY0gL6N0mUg5TTTTtQ2gnEYhvrJESXPfIC8WsBDrhFEHRjBUKzoqvqCNLLlm2nm
         sztHTnItkcfOeftHZzqI6f2NSqDT30SOuaLHYiRXQAhCDmt/9ypdm8ykCpZN9N1poyp+
         1nRQPuMpWT5RcTRaTN3oI6TUXC/Ivy1PJekakcnjuXhcnjtdSt079FXv2Hqnuf5RX++U
         VVqA==
X-Forwarded-Encrypted: i=1; AJvYcCVYhz430IiFCapUmHM/ZlUZzj+lfIlJfBq+JuXfqv+DLvd/xZeLmmf4D0td4h+dZT3u71V3oYTgMd1aibm672CW9/FcV/i6FN57ezd7KNJP
X-Gm-Message-State: AOJu0YwZYPCp2a4E+PIqCMIAVf6m8Ss0ZTns/XwFucpwFlbSrrN7U5iE
	nJjEhpaypAQMTi3I3fmHFyX6ht4k0XEYd9WrhHAC4/B90q25sbDxhMTVMlClvRotcChnD20gSjI
	wvstkeXP9aYTsXtUijMPxLv8vG3+a6tXJ9iOm9g==
X-Google-Smtp-Source: AGHT+IFMN4eguJVk3/hsOcDrMysDAHcROyUhqeIkyR5+eDOdU7O92ItiCwYebfMEfrCeDl/m8weQrCQAFQsrwiKAFBg=
X-Received: by 2002:a05:6870:c0c4:b0:229:ec0e:7361 with SMTP id
 e4-20020a056870c0c400b00229ec0e7361mr1762070oad.29.1711520171010; Tue, 26 Mar
 2024 23:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240327045035.368512-1-samuel.holland@sifive.com> <20240327045035.368512-6-samuel.holland@sifive.com>
In-Reply-To: <20240327045035.368512-6-samuel.holland@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 27 Mar 2024 14:16:00 +0800
Message-ID: <CAEEQ3wm4SoC6rvv2qtVdP+4ZF1q41EEHUpwnagNgFwxkG5iw_w@mail.gmail.com>
Subject: Re: [External] [PATCH v6 05/13] riscv: Only send remote fences when
 some other CPU is online
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_231616_323424_C7289004 
X-CRM114-Status: GOOD (  17.20  )
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

SGkgU2FtdWVsLAoKT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMTI6NTDigK9QTSBTYW11ZWwgSG9s
bGFuZAo8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBJZiBubyBvdGhlciBD
UFUgaXMgb25saW5lLCBhIGxvY2FsIGNhY2hlIG9yIFRMQiBmbHVzaCBpcyBzdWZmaWNpZW50Lgo+
IFRoZXNlIGNoZWNrcyBjYW4gYmUgY29uc3RhbnQtZm9sZGVkIHdoZW4gU01QIGlzIGRpc2FibGVk
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2
ZS5jb20+Cj4gLS0tCj4KPiAobm8gY2hhbmdlcyBzaW5jZSB2NCkKPgo+IENoYW5nZXMgaW4gdjQ6
Cj4gIC0gTmV3IHBhdGNoIGZvciB2NAo+Cj4gIGFyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jIHwg
NCArKystCj4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAgIHwgNCArKystCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMK
PiBpbmRleCBkNzZmYzczZTU5NGIuLmY1YmUxZmVjODE5MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L21tL2NhY2hlZmx1c2guYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jCj4g
QEAgLTIxLDcgKzIxLDkgQEAgdm9pZCBmbHVzaF9pY2FjaGVfYWxsKHZvaWQpCj4gIHsKPiAgICAg
ICAgIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKTsKPgo+IC0gICAgICAgaWYgKHJpc2N2X3VzZV9z
YmlfZm9yX3JmZW5jZSgpKQo+ICsgICAgICAgaWYgKG51bV9vbmxpbmVfY3B1cygpIDwgMikKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgZWxzZSBpZiAocmlzY3ZfdXNlX3NiaV9m
b3JfcmZlbmNlKCkpCj4gICAgICAgICAgICAgICAgIHNiaV9yZW1vdGVfZmVuY2VfaShOVUxMKTsK
PiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgb25fZWFjaF9jcHUoaXBpX3JlbW90ZV9m
ZW5jZV9pLCBOVUxMLCAxKTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5j
IGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gaW5kZXggZGE4MjEzMTVkNDNlLi4wOTAxYWE0
N2I1OGYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gKysrIGIvYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gQEAgLTc5LDcgKzc5LDkgQEAgc3RhdGljIHZvaWQgX19p
cGlfZmx1c2hfdGxiX2FsbCh2b2lkICppbmZvKQo+Cj4gIHZvaWQgZmx1c2hfdGxiX2FsbCh2b2lk
KQo+ICB7Cj4gLSAgICAgICBpZiAocmlzY3ZfdXNlX3NiaV9mb3JfcmZlbmNlKCkpCj4gKyAgICAg
ICBpZiAobnVtX29ubGluZV9jcHVzKCkgPCAyKQo+ICsgICAgICAgICAgICAgICBsb2NhbF9mbHVz
aF90bGJfYWxsKCk7Cj4gKyAgICAgICBlbHNlIGlmIChyaXNjdl91c2Vfc2JpX2Zvcl9yZmVuY2Uo
KSkKPiAgICAgICAgICAgICAgICAgc2JpX3JlbW90ZV9zZmVuY2Vfdm1hX2FzaWQoTlVMTCwgMCwg
RkxVU0hfVExCX01BWF9TSVpFLCBGTFVTSF9UTEJfTk9fQVNJRCk7Cj4gICAgICAgICBlbHNlCj4g
ICAgICAgICAgICAgICAgIG9uX2VhY2hfY3B1KF9faXBpX2ZsdXNoX3RsYl9hbGwsIE5VTEwsIDEp
Owo+IC0tCj4gMi40My4xCj4KCkZyb20gYSBwZXJjZXB0dWFsIHBvaW50IG9mIHZpZXcsIHRoZSBt
b2RpZmljYXRpb24gaGVyZSBpcyBub3QKbmVjZXNzYXJ5LiBUaGVyZSBpcyBzdWNoIGxvZ2ljIGlu
IG9uX2VhY2hfY3B1KCkuIENhbiB5b3Ugc2hhcmUgeW91cgp0ZXN0IGRhdGE/CgoKVGhhbmtzLApZ
dW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
