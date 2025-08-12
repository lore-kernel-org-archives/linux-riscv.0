Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF64C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CbFbEhSnNqUf1+pCoeBkVlAoL3KY23SQS/yzy0la6Ss=; b=NpLE6KT5WCCalqBsASef3Uuabu
	wzwXvFlG3Pxk5XwwS9iP0o9dS7ttu0OEz61DEeOoM0qKlED9l5d6GpqY9emaU5i1sXjX2pcMdar9a
	KPeoZ9jXlQDyl2OFvNp6wsqIOk9hhA+6f6CPn02PUEM0cClgGO8Fr8XNHVdJ0QjcTlbOTCPxChIEP
	+FA+Px4K4YQH+XYRnM0SJChpjOrsxFK2Q7gi0N7u/U5Ya71H+zo2A+VKk11QQi6Wy3Aory5paGHsd
	iWV//8MiOL8yJkvVv50yoV/Yi6W5wDcoM85lHM8qyusVYefpBupEMdIlSztNmQZxGO/q/OKpBOFyv
	v/l5X75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrkG-0000000BKqs-1Fuz;
	Tue, 12 Aug 2025 16:21:04 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln8i-0000000Abp2-3vAK
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 11:26:02 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-433f1f9718dso3618795b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1754997955; x=1755602755; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qjfyf5ayYUQV/s7vBTZ8Nh9S9lY0mAPp0Jy1qKR37a4=;
        b=fv9SJJQ9FuUPCtRboEuI4/8hf31cVXrNN94/Sj8Y+2j1EhSwrVkRI4uoIns/voR/Q9
         mQPYAouU49nUBjVyTibry12LPdUVCIshGzjRdIBaSLOvzVAGlwdIjylTUVg+2RQpHARF
         jjdJT8qoyuYl76qqfK+qhxhUXS5Evl9aAMmCZFvw/Kf/XTzj6B1FfUnMJX+y5Ocbn4xp
         B4KmaY1devPP2dBdgBpoUYczUaw21HSZhUod6cbyljsnA6we4sPAwnGb7FmMVj85Ri5Q
         3sXYwGnBh8ypNDC+MVHecdK+hhiSnYTo//gtY8zqnW3vys3CIHRsvXWxQGqIezUzHnKc
         +3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754997955; x=1755602755;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qjfyf5ayYUQV/s7vBTZ8Nh9S9lY0mAPp0Jy1qKR37a4=;
        b=M2p4Vj6mmeHf/stDDumfH/9IxyQnApTTUIo3aD5t48TXiFt0MSn6xBGtAHt1RxtLbx
         a7NKthLffoE1i6owAc1zBmFsRlB0XyEdrH5Iwj+HiT1E1ETRhaRXJ75NJmXo2m/C5Nxc
         mhWJjCpTsWu3ryQJtVZ6j2MdxGqAS7TIlUmVxCoSqoS3K/aApjPsNXLfGu84LLsHq9e3
         CoUT/J7wWVyzyQ9iyASbGjnXVKY0zKyOP60pTaBP7ip2wsj0zcrh+020oEayC4I1KQxQ
         o10i+9KkwT4CjEL2x9UhMacvnkt0jp1n6DtbEC4jw5XMRbBH8sFbAqtyrDOf8Dxt6HTy
         t82g==
X-Forwarded-Encrypted: i=1; AJvYcCVHnIR9A710Lx/bHnaDpESwPXb7GE4buZ+jsb8JbZHnyziUaK3qbtjkXhMUZvcmgkRt+kDlVvijbIX9VA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZEga0ljSfPFM2KkqJy80QoF6HnHIwb95m1z5HzCwpB7FlXpry
	W2VdtfpMcVuvKWhPA0EhVQElRu813VwZO6aZ3Z+7+LEB0ZD8mDz1O36uBqqcoqpotk9fX7hvO1m
	0k/kJlfJGrwCT/esa7oiFuh9Tl9jH90bsA5AKgP1c0g==
X-Gm-Gg: ASbGncv0dwbqjjEylH2AXpx8tAR2ejT4Oh3pzq57UTx32n+EgDio/I7/ux58tjSM6dq
	3xVmblb41kl6r0jh5CsasXbKFDJ1oc6j0Jnb5/CCRRtWFHUZETz3NjlSODoaM0NcilQ5Lssooeq
	em22O9p64FsSK+kZnj/sCgRTlUt73pjEL34mLMzmt+BIhNCEI1KszDDd1RaXI3GN+ve0OizIbfK
	NvxWAOBbbMVU2PWikw7gFiG
X-Google-Smtp-Source: AGHT+IFcPYgbej7VXqBZ9l2ZGteq16uRDcRJtLkqmXUHtMhTcloMmWBdGKMKq/p/vubapwMbfjDcv+/odkkwRTeoq8c=
X-Received: by 2002:a05:6808:4f61:b0:41b:75ca:b104 with SMTP id
 5614622812f47-435c925f657mr1622625b6e.39.1754997955426; Tue, 12 Aug 2025
 04:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250515094301.40016-1-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 12 Aug 2025 19:25:44 +0800
X-Gm-Features: Ac12FXzJhCUBUv-F1HNVERzz4bnGfTnGrmHS9y4FCCPn4eJYOe2JOvnJfPiVMIk
Message-ID: <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
To: sunilvl@ventanamicro.com, rafael@kernel.org, lenb@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_042601_269312_DB507532 
X-CRM114-Status: GOOD (  18.93  )
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

SGkgU3VuaWwsCgpPbiBUaHUsIE1heSAxNSwgMjAyNSBhdCA1OjQ04oCvUE0gWXVuaHVpIEN1aSA8
Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHRoZSByZWFkIG9mIENTUl9D
WUNMRSB0byBjcHBjX2ZmaF9jc3JfcmVhZCgpIHRvIGZpeCB0aGUKPiB3YXJuaW5nIG1lc3NhZ2U6
ICJDUFBDIENwdWZyZXE6IGNwcGNfc2NhbGVfZnJlcV93b2tyZm46IGZhaWxlZAo+IHRvIHJlYWQg
cGVyZiBjb3VudGVycyIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlA
Ynl0ZWRhbmNlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYyB8IDUgKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgYi9kcml2ZXJzL2FjcGkvcmlz
Y3YvY3BwYy5jCj4gaW5kZXggNGNkZmYzODdkZWZmNi4uYzFhY2FlYjE4ZWFjMyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5jCj4gKysrIGIvZHJpdmVycy9hY3BpL3Jpc2N2
L2NwcGMuYwo+IEBAIC02OSwxMSArNjksMTQgQEAgc3RhdGljIHZvaWQgY3BwY19mZmhfY3NyX3Jl
YWQodm9pZCAqcmVhZF9kYXRhKQo+ICAgICAgICAgc3RydWN0IHNiaV9jcHBjX2RhdGEgKmRhdGEg
PSAoc3RydWN0IHNiaV9jcHBjX2RhdGEgKilyZWFkX2RhdGE7Cj4KPiAgICAgICAgIHN3aXRjaCAo
ZGF0YS0+cmVnKSB7Cj4gLSAgICAgICAvKiBTdXBwb3J0IG9ubHkgVElNRSBDU1IgZm9yIG5vdyAq
Lwo+ICAgICAgICAgY2FzZSBDU1JfVElNRToKPiAgICAgICAgICAgICAgICAgZGF0YS0+cmV0LnZh
bHVlID0gY3NyX3JlYWQoQ1NSX1RJTUUpOwo+ICAgICAgICAgICAgICAgICBkYXRhLT5yZXQuZXJy
b3IgPSAwOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGNhc2UgQ1NSX0NZQ0xF
Ogo+ICsgICAgICAgICAgICAgICBkYXRhLT5yZXQudmFsdWUgPSBjc3JfcmVhZChDU1JfQ1lDTEUp
Owo+ICsgICAgICAgICAgICAgICBkYXRhLT5yZXQuZXJyb3IgPSAwOwo+ICsgICAgICAgICAgICAg
ICBicmVhazsKPiAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIGRhdGEtPnJldC5l
cnJvciA9IC1FSU5WQUw7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+IC0tCj4gMi4zOS4yCj4K
ClRoZSBwdXJwb3NlIG9mIGNwcGNfZmZoX2Nzcl9yZWFkKCkgaXMgdG8gY2FsY3VsYXRlIHRoZSBh
Y3R1YWwKZnJlcXVlbmN5IG9mIHRoZSBDUFUsIHdoaWNoIGlzIGRlbHRhX0NTUl9DWUNMRS9kZWx0
YV9DU1JfWFhYLgoKQ1NSX1hYWCBzaG91bGQgYmUgYSByZWZlcmVuY2UgY2xvY2sgYW5kIGRvZXMg
bm90IGNvdW50IGR1cmluZyBXRkkKKFdhaXQgRm9yIEludGVycnVwdCkuCgpTaW1pbGFyIHNvbHV0
aW9ucyBpbmNsdWRlOiB4ODYncyBhcGVyZi9tcGVyZiwgYW5kIEFSTTY0J3MgQU1VIHdpdGgKcmVn
aXN0ZXJzIFNZU19BTUVWQ05UUjBfQ09SRV9FTDAvU1lTX0FNRVZDTlRSMF9DT05TVF9FTDAuCgpI
b3dldmVyLCB3ZSBrbm93IHRoYXQgQ1NSX1RJTUUgaW4gdGhlIGN1cnJlbnQgY29kZSBkb2VzIGNv
dW50IGR1cmluZwpXRkkuIFNvLCBpcyB0aGlzIGRlc2lnbiB1bnJlYXNvbmFibGU/CgpTaG91bGQg
d2UgY29uc2lkZXIgcHJvcG9zaW5nIGFuIGV4dGVuc2lvbiB0byBzdXBwb3J0IHN1Y2ggYSBkZWRp
Y2F0ZWQKY291bnRlciAoYSByZWZlcmVuY2UgY2xvY2sgdGhhdCBkb2VzIG5vdCBjb3VudCBkdXJp
bmcgV0ZJKT8gVGhpcyB3YXksCnRoZSB2YWx1ZSBjYW4gYmUgb2J0YWluZWQgZGlyZWN0bHkgaW4g
Uy1tb2RlIHdpdGhvdXQgdHJhcHBpbmcgdG8KTS1tb2RlLCBlc3BlY2lhbGx5IHNpbmNlIHJlYWRp
bmcgdGhpcyBjb3VudGVyIGlzIHZlcnkgZnJlcXVlbnQuCgpUaGFua3MsCll1bmh1aQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
