Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF014C02184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 04:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/10tOH2u1uNuj6xgTbfWGyWiqM/KOxL6bI3QBH8CITw=; b=O6pzrmEU9Ibab0
	3wvU+SMnPMJX3F7ax0bX7ba7CjwFh/9gthhjObo7Q+SlMa7WMAlSMRsxekA5MEXwBR7kRGmeRGmMA
	mMyVQqV9nbdzMiKbs9PdYAYqXerUjcxgC3vrrhiMJlVUS8tMGS9knaPnnlbRQihg00tD2oZtgN4kt
	7S61xGi299m1O9iobmrr2WOeZbNByiyvyiajRJLt/3BD5WoeXFn80cG2esYvWmMBqvz1ISAuVSjA/
	V+bNQSS446ypBO0ElIgHsmRtUq4rZgQnChX91OCUc4JOum23U7ceaCydBQZoXJKbctC7KCGKHVvSL
	jGb+xwKORTURsGFhqnow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXYdE-00000007REV-0hdd;
	Tue, 14 Jan 2025 04:34:24 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXYdB-00000007RDT-0IFt
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 04:34:22 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3a8180205f3so19261445ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 20:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1736829260; x=1737434060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAqtsfRbbwc+fbH5ydOSEKg81ymzTAq0f1hHSZPDUDI=;
        b=Nq3N3Uc+WxuHddizYUkP02gnn9+EvIkw7RtwAxGZB3sbB2MxN7CeSjcHFJheF75stz
         ZYQo1mWdzpO9l0NjEfeZ1At3U1MP/OhB9PWl2Jtih1lRWOk4hfdjNBxY7I3zGnbMy2C4
         VsHUMGTj20ews+/n58YufHpJnBBWRChwvzCrKgNeKcasQyXJqEAEWl7NKtX9a69AEwJg
         FYb9xqAhf6SzpYyZGGnaS+5fFZVFraw8t0a2K+IMM20p0xmEpc6zKMArZujNCJhET8hw
         xcuN/x5MU6/Lu6L89PyaXVaZ6mHFtjXQbu6ySGjsqBwziBcR9TIxtaudUCX3nKhs70IN
         5d8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736829260; x=1737434060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAqtsfRbbwc+fbH5ydOSEKg81ymzTAq0f1hHSZPDUDI=;
        b=bZIuXCExJssXZX2RYyLb9qc0czr0cDuAdtcWSU5QWFjh+RJ10HkrjIdpHZTkecBHN5
         5/17Tzs+dThH/PVo4oNzgRLvW+CES0RPCeRUjmqZhUYUe8SHyp68NFDkPaJZwjXH4r6B
         wFEYXbkk0uJ7XHYBq5s1e7zOscIAJ8z/e4vWOOu7NGIhup6/eVcKmUwysxc8LSM81NWb
         KbxpvlCrUPOpYN0S7UMftxCcV43zUEOAfzdlp8tj0DK0cfE3/Ovv9MVLlp2uKIPKQbaC
         WTXfrW+UQgUAL1tOs7/wVpQRn8rgfdALhrFMjMRLDtKBW2sVo5KXjTpQDS0ENyN1d6Wi
         cPPw==
X-Forwarded-Encrypted: i=1; AJvYcCXDRTJE0oUG04h528jN/EwJ5B0/R4uR736GXPMK0PEZCvpMTIC9Yq4J4Xgn7WIzHstuRK16KW2o2LjS2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhQpBAnNWda0vyTLyrukrfnS39Z/Eglwe9V371YTfGNH417xS5
	VCV+d26ceE0Qm4f93sOzT7kQhSX8Keg0gXJuju3LYN079yN2oKl2S3Zyu9JjZ1tGmaL1u5fiweI
	Marspt5R5DXDxYbE/UgTMv1Pk6NWRTqfI6NdyYg==
X-Gm-Gg: ASbGncv/Azc+W+WNxyWd7iU7KrwSJRhS4araBECuDu/soQpvHdmzs3wKcKDxZYCN6zx
	LFlye3T5VmoQT0W2xoph0F6zmGXO7e8xtH9BQsRI=
X-Google-Smtp-Source: AGHT+IGAgH0LNgLRDS6lLKyB48zUvvsywKutpaSamg7nMTs/yYoYgnA/AxU4uh0feQaAgDwZz7Kn0qMI6XclAOD7vxk=
X-Received: by 2002:a05:6e02:13a6:b0:3cd:bcbf:1091 with SMTP id
 e9e14a558f8ab-3ce4b21610amr155039045ab.10.1736829260446; Mon, 13 Jan 2025
 20:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20250113150933.65121-1-luxu.kernel@bytedance.com> <20250113150933.65121-5-luxu.kernel@bytedance.com>
In-Reply-To: <20250113150933.65121-5-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jan 2025 10:04:09 +0530
X-Gm-Features: AbW1kvb4w3RLF38cG25VQzx1nvu4Q6JTwam1hYyJ7t3h_XuYlB0FsM5Ssg1_lDY
Message-ID: <CAAhSdy1=m+G8qOjGPjKXfw+4t+KFf-4zjBzZfminz8U8=2_-ww@mail.gmail.com>
Subject: Re: [PATCH 4/5] irqchip/timer-clint: Use wmb() to order normal writes
 and IPI writes
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_203421_109749_9954DAAC 
X-CRM114-Status: GOOD (  14.69  )
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

T24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgODozOeKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IER1cmluZyBhbiBJUEkgcHJvY2VkdXJlLCB3ZSBuZWVkIHRv
IGVuc3VyZSBhbGwgcHJldmlvdXMgd3JpdGUgb3BlcmF0aW9ucwo+IGFyZSB2aXNpYmxlIHRvIG90
aGVyIENQVXMgYmVmb3JlIHNlbmRpbmcgYSByZWFsIElQSS4gV2UgdXNlIHdtYigpIGJhcnJpZXIK
PiB0byBlbnN1cmUgdGhpcyBhcyBDTElOVCBpc3N1ZXMgSVBJIHZpYSBtbWlvIHdyaXRlcy4KPgo+
IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWNsaW50LmMgfCA2ICsrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3Nv
dXJjZS90aW1lci1jbGludC5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1jbGludC5jCj4g
aW5kZXggMGJkZDlkN2VjNTQ1Li44ZDczYjQ1Zjk5NjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9j
bG9ja3NvdXJjZS90aW1lci1jbGludC5jCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1l
ci1jbGludC5jCj4gQEAgLTQ4LDYgKzQ4LDEyIEBAIEVYUE9SVF9TWU1CT0woY2xpbnRfdGltZV92
YWwpOwo+ICAjaWZkZWYgQ09ORklHX1NNUAo+ICBzdGF0aWMgdm9pZCBjbGludF9zZW5kX2lwaSh1
bnNpZ25lZCBpbnQgY3B1KQo+ICB7Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogRW5zdXJlIHRo
YXQgc3RvcmVzIHRvIG5vcm1hbCBtZW1vcnkgYXJlIHZpc2libGUgdG8gdGhlIG90aGVyIENQVXMK
PiArICAgICAgICAqIGJlZm9yZSBpc3N1aW5nIElQSS4KPiArICAgICAgICAqLwo+ICsgICAgICAg
d21iKCk7Cj4gKwoKU2FtZSBjb21tZW50IGFzIFBBVENIMy4KClRoZSBjbGludF9zZW5kX2lwaSgp
IGlzIGNhbGxlZCB0aHJvdWdoIGlwaV9tdXhfc2VuZF9tYXNrKCkKd2hpY2ggZG9lcyBzbXBfbWJf
X2FmdGVyX2F0b21pYygpIGJlZm9yZSBjYWxsaW5nIHNvIG5vIG5lZWQKZm9yIGFueSBiYXJyaWVy
IGhlcmUuIEFsc28sIGJhcnJpZXJzIG5lZWQgdG8gYmUgaW4tcGFpciBzbyBhZGRpbmcKYSBzaW5n
bGUgYmFycmllciBhdCByYW5kb20gbG9jYXRpb24gaXMgaW5hcHByb3ByaWF0ZS4KKFJlZmVyLCBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9rZXJuZWwvaXJxL2lwaS1tdXguYz9oPXY2LjEzLXJjNyNuNzgpCgpCYXNl
ZCBvbiB0aGUgYWJvdmUsIHRoaXMgcGF0Y2ggaXMgbm90IG5lZWRlZC4KClJlZ2FyZHMsCkFudXAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
