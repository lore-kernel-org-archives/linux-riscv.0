Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD3BC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5VSKaFyBqRkAGw2205v2IoUrkpZwDq8xGX/Kcep+b8=; b=BXKJDrVO6sRZHS
	Xd26OO6DHJyB4f7AsmkvKgdXbPlJ3t1bKPkAtTkKodeQiDohS9ZlZFA+SP0t8Cr37gWKmiVgN7HiQ
	zEBFI/NrfeQ287EzkqsEg/BVNUw8ZW6ZjbPTH5KASLOcFfoO0tGvbav9YDtyYLV7ABawAzNflCrqn
	Y1GOfzH6doiUR9NBA2aR0SOCnFD7Z2ShEoFLTfcm1Z6VAEcLppJ3ghuuDMW+kYELVLXDQWOTuUzxP
	eCcsbE4FTR2/esmo1kqIotHYtumGE2yGdtmE6a9zSXu/wC2HmGK7ZQVxIgl8Rfk4y/aE4TSpPb/Ga
	LUosXM/sfehIH6wq0xpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyr6E-0055jn-07;
	Tue, 16 May 2023 09:36:06 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyr6B-0055iw-1d
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 09:36:04 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso25581093a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 02:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684229762; x=1686821762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOYuwaGvQzB6W1rRJXfWsnaF3BnBS5m8MDev8mfwpl4=;
        b=ZaH64FzpUsamyNTy1bzxrK/9Vm1lyGjs2o2RRvLTujZ6vLXLHQIBdR3aev7k/gnamy
         hGo0+GakQd+1bNYbAo9jCS6xl8Rf68Ba1ZdpN5oXZT8Y6SyXg8Uo/Ez+Cggb6kageRT1
         tcVMBuulkSRTW1PcKMR1q4EFNILYNPfAyeiMW2rgTj2WkRqLghUiPm+jdUPniKA8LbHQ
         qTxqOSsVftohC24wAtnZ3ZZ+1GfWs3XyPm2y+VkSZN2h5TVrP5diR5+fa28FetVHL14n
         4em+bxnRBM9A6yYq1vj0MZ++tJcS0LwiBx2CZhqG6KTyj1i6fOxoSAd/Lg8r+Eh8PZA+
         s2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684229762; x=1686821762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOYuwaGvQzB6W1rRJXfWsnaF3BnBS5m8MDev8mfwpl4=;
        b=aDNnrPk/WA8NrL1hsv8UYvzEmj5Y0UwNbevlf8gRT+zAOPRzzwXhhjtXvQFEKc82J3
         fHYs0NYg/+gEzuqVZAQtPk+s2upeInSKawWUrZ9H8+eFLKnzv0arSB0pCB3Ja2kCPvDX
         E508ToI+zfNgDCOwjPmcjhfQchlyPhbQYhLOKQ7XxZ4TPi2YQ6tPSxg8haMvrFg/MARJ
         kWWbx8F1ldcHhx2zutBfxoCZiu4W59IlFYHnlqs6ZFM9Uo1h137DHFQghBNIRC5Rwsuz
         4zkg9p4qfqvazYvrinhcRq1rWe6+zGPsJ/125RknkMEu6hjebEH/38Wv0gay0LgFD4gJ
         wyyg==
X-Gm-Message-State: AC+VfDzmZxmcdl6JCrx+4UcJGUMobxMpJj1ufaSmPCB0x+prZOkOzK1L
	xGAim0D5XMiIkqvk/BGbXCSCEeIlBDJnUDXXXLw=
X-Google-Smtp-Source: ACHHUZ4TQCLryFERufS4j2G73LLn7fsBTUzB8Mn6JiQURp0dHneoZNIl/npAe/4hhhahWai8tAT6/j9WCU1Z7fyGQUc=
X-Received: by 2002:aa7:db90:0:b0:50d:9a30:f305 with SMTP id
 u16-20020aa7db90000000b0050d9a30f305mr21453968edt.24.1684229761619; Tue, 16
 May 2023 02:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230516071830.8190-1-zegao@tencent.com> <20230516071830.8190-3-zegao@tencent.com>
 <20230516091548.GA2587705@hirez.programming.kicks-ass.net>
In-Reply-To: <20230516091548.GA2587705@hirez.programming.kicks-ass.net>
From: Ze Gao <zegao2021@gmail.com>
Date: Tue, 16 May 2023 17:35:50 +0800
Message-ID: <CAD8CoPCen5Vx33Q1hYJ4T7Q9xhZa63OA52B606omkBttRWpkFg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion free
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Ze Gao <zegao@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_023603_567840_6B533660 
X-CRM114-Status: GOOD (  16.27  )
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

VGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCwgIEknbGwgZ2V0IGl0IGFsbCBmaXhlZCBBU0FQ
LgoKUmVnYXJkcywKWmUKCk9uIFR1ZSwgTWF5IDE2LCAyMDIzIGF0IDU6MTbigK9QTSBQZXRlciBa
aWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMTYs
IDIwMjMgYXQgMDM6MTg6MjhQTSArMDgwMCwgWmUgR2FvIHdyb3RlOgo+Cj4gPiArc3RhdGljIHZv
aWQgZnByb2JlX2hhbmRsZXIodW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRf
aXAsCj4gPiArICAgICAgICAgICAgIHN0cnVjdCBmdHJhY2Vfb3BzICpvcHMsIHN0cnVjdCBmdHJh
Y2VfcmVncyAqZnJlZ3MpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGZwcm9iZSAqZnA7Cj4gPiAr
ICAgICBpbnQgYml0Owo+ID4gKwo+ID4gKyAgICAgZnAgPSBjb250YWluZXJfb2Yob3BzLCBzdHJ1
Y3QgZnByb2JlLCBvcHMpOwo+ID4gKyAgICAgaWYgKGZwcm9iZV9kaXNhYmxlZChmcCkpCj4gPiAr
ICAgICAgICAgICAgIHJldHVybjsKPiA+ICsKPiA+ICsgICAgIC8qIHJlY3Vyc2lvbiBkZXRlY3Rp
b24gaGFzIHRvIGdvIGJlZm9yZSBhbnkgdHJhY2VhYmxlIGZ1bmN0aW9uIGFuZAo+ID4gKyAgICAg
ICogYWxsIGZ1bmN0aW9ucyBiZWZvcmUgdGhpcyBwb2ludCBzaG91bGQgYmUgbWFya2VkIGFzIG5v
dHJhY2UKPiA+ICsgICAgICAqLwo+ID4gKyAgICAgYml0ID0gZnRyYWNlX3Rlc3RfcmVjdXJzaW9u
X3RyeWxvY2soaXAsIHBhcmVudF9pcCk7Cj4gPiArICAgICBpZiAoYml0IDwgMCkgewo+ID4gKyAg
ICAgICAgICAgICBmcC0+bm1pc3NlZCsrOwo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiAr
ICAgICB9Cj4gPiArICAgICBfX2Zwcm9iZV9oYW5kbGVyKGlwLCBwYXJlbnRfaXAsIG9wcywgZnJl
Z3MpOwo+ID4gICAgICAgZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3VubG9jayhiaXQpOwo+ID4gKwo+
ID4gIH0KPiA+ICBOT0tQUk9CRV9TWU1CT0woZnByb2JlX2hhbmRsZXIpOwo+ID4KPiA+ICBzdGF0
aWMgdm9pZCBmcHJvYmVfa3Byb2JlX2hhbmRsZXIodW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQg
bG9uZyBwYXJlbnRfaXAsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBmdHJhY2Vfb3BzICpvcHMsIHN0cnVjdCBmdHJhY2VfcmVncyAqZnJlZ3MpCj4gPiAgewo+ID4g
LSAgICAgc3RydWN0IGZwcm9iZSAqZnAgPSBjb250YWluZXJfb2Yob3BzLCBzdHJ1Y3QgZnByb2Jl
LCBvcHMpOwo+ID4gKyAgICAgc3RydWN0IGZwcm9iZSAqZnA7Cj4gPiArICAgICBpbnQgYml0Owo+
ID4gKwo+ID4gKyAgICAgZnAgPSBjb250YWluZXJfb2Yob3BzLCBzdHJ1Y3QgZnByb2JlLCBvcHMp
Owo+ID4gKyAgICAgaWYgKGZwcm9iZV9kaXNhYmxlZChmcCkpCj4gPiArICAgICAgICAgICAgIHJl
dHVybjsKPiA+ICsKPiA+ICsgICAgIC8qIHJlY3Vyc2lvbiBkZXRlY3Rpb24gaGFzIHRvIGdvIGJl
Zm9yZSBhbnkgdHJhY2VhYmxlIGZ1bmN0aW9uIGFuZAo+ID4gKyAgICAgICogYWxsIGZ1bmN0aW9u
cyBjYWxsZWQgYmVmb3JlIHRoaXMgcG9pbnQgc2hvdWxkIGJlIG1hcmtlZCBhcyBub3RyYWNlCj4g
PiArICAgICAgKi8KPiA+ICsgICAgIGJpdCA9IGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2Nr
KGlwLCBwYXJlbnRfaXApOwo+ID4gKyAgICAgaWYgKGJpdCA8IDApIHsKPiA+ICsgICAgICAgICAg
ICAgZnAtPm5taXNzZWQrKzsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgfQo+
Cj4gUGxlYXNlIGRvbid0IHVzZSB0aGlzIGNvbW1lbnQgc3R5bGU7IG11bHRpIGxpbmUgY29tbWVu
dHMgZ28gbGlrZToKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIE11bHRpIGxpbmUgY29tbWVu
dCAuLi4KPiAgICAgICAgICAqICAgICAgICAgICAgICAgICAgICAuLi4gaXMgc3ltbWV0cmljLgo+
ICAgICAgICAgICovCj4KPiBTYW1lIGZvciB5b3VyIG5leHQgcGF0Y2guCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
