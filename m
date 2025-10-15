Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FBFCCD192
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 14:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0zlnoOeqFPKp8hNTCYhlFC9RXgz2VzfdKc5edbj5ys=; b=M7BZQAxnYr3r7p
	Auc3Ah9FUduVBC5ovKasFFsjALKQioxLnUVyTN8n1jesvrcBFdWtzmEfT2X/yIWvai3s0dWQMUN7N
	QruEV3PyT91Lz1TnWuO3KB/eGU8F+e53v2iZXb/pmQEP0nTSdg5BX5wNviRMQ39Guq/ypZ0D5U5ry
	NXnIrq7WfFlNI+jpt2n8kaLvApow4wbeaRpgC6VTr/F6wzlSPbeCXDsIqLOVVAqcTMi5cicr9T3pp
	UkWWj7SXei0Cp00ySMyrMcHbNrvVL2Xe2uLZlC2EtSG3F1xu1eImeLQFjUoUZR3+AP7zB8YNX3PpQ
	T1NHebeI3nZKOPmJSwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92os-00000001xTE-0wLv;
	Wed, 15 Oct 2025 14:49:38 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92oq-00000001xSs-2rkw
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 14:49:37 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so6067561a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 07:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539775; x=1761144575; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ugr7IgQEch7CkBgCAdZs0bbGqpAGoYyvZ+rvrv51b08=;
        b=K30f1xW1J7GtnEJdQIkXaszlkh88XnsdUfqdNa8koTn2dENII9Fdg+uOdaLNn5Ie7V
         XpbgTBjcmex2656to7jXPg6rJwOxOO+qmtuRg89dncDdnPukSLjugwmq0XhCZzjaYJuU
         Jg2Q+0DV8+51MhNeyaaH++hdUvq+bG7jw9pKg6J+EtEibfwHfuAeUswyqbYg0oMOcb2R
         5kPmynl5Vk4H07f+DM7AyPu70YcSwqUg8qlPZVPzFvxZ4bo4/ufei4yxmP24lQDkqsyV
         xSmMV29zsKoL7YGU9mLSEA9ze3AW801WQ44NIwABIXye2FUv9EGTwu1uKmgDL1tJmLmC
         lFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539775; x=1761144575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ugr7IgQEch7CkBgCAdZs0bbGqpAGoYyvZ+rvrv51b08=;
        b=toDvfHHYkmKPWSuZdm1ki1MUDiKoDy76CoOdIqIxk9LPRo8UjrDIpSBKm8zhiqeGFA
         tJ24Jb0QqguRdsooR2Lyp149yhJ+ZeBCCQM/28i8AgeC3G7nKrMmWMXG5rJW56UXNL1u
         ne/Xu0Sxx8qZpvnK3x0uVvlLSgoAHU7h0uEl3HkhnhVqwkXx8u2jkLByCxNKGsNxCrYB
         iEBPx5+4uRADZwWJbPUl14WNfIHgB5rrWNf4YmUtMTg8s2chIC0ltb5G2DwxAkT7CPlB
         6dvjrk01oTC+71FPDNl8II6iyI/ZQN6BT2xMT1IvCZTyJnP/kpY8W4AyQbMH/48UBsA7
         A4IA==
X-Forwarded-Encrypted: i=1; AJvYcCXxQQpL267oWEE77dR2O00TNbBPU/t1RraV66pnGH3w4Bs+Xlf6sxwUNnY2zR3GZZ24GPVUExnJ0YJCxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPoCJz6HXfIraIVT/08TObcQXjXHurd1WKw2ijvjGB6dEWUnVE
	IrIZ6RqJ4Q3op5ikpZHPmH26gzLp8bFtml4aJ5ofmhURvHG6ZBCNsWJdswC4tZovO/B4mgvVDcS
	AbGpYPzU9eI/VBFgWDGiddCv2rl6TQGg=
X-Gm-Gg: ASbGncs5EZgQhxGkUwTu83CHsgalv5XQtbUZNdXaB354Ug5SVA2BYHo+gO1VPQgb930
	LXyuwOIpnIJ5B2aTrB0adiQV1ioVibw9JBfuAfp46LE4w6s4u1tt4hZUUqsIkIbd3QF5WJNQ/u3
	Rj1LcJsdkw9GPk7OkRtZidfQuzmoYcOz4l8HYXltQ4Y+q0cmZa+huLYBFD21qb45enly+6BNZ0q
	QEbAi9872kxNIAad/dZbQ+ZPbYzb1y6wfAp3w==
X-Google-Smtp-Source: AGHT+IE69LKH/NE6WW9KYSfgI5K8eXDRrZSpNwn7Zg+fzj0drMI9U+jkzmrowvG1UrutOgnm3kdrLWQIhWCejBy9GBI=
X-Received: by 2002:a17:90b:3ec5:b0:334:29f0:a7e4 with SMTP id
 98e67ed59e1d1-33b5138e32cmr36496555a91.21.1760539775424; Wed, 15 Oct 2025
 07:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250912195339.20635-1-yana2bsh@gmail.com> <20250912131722.74658ec0@kernel.org>
In-Reply-To: <20250912131722.74658ec0@kernel.org>
From: =?UTF-8?B?0K/QvdCwINCR0LDRiNC70YvQutC+0LLQsA==?= <yana2bsh@gmail.com>
Date: Wed, 15 Oct 2025 17:49:22 +0300
X-Gm-Features: AS18NWC8jphTpk8XmfrNi0U2OyQEvZMStTycvFUqIt8mxiSBHWFeGjYnyBqSIBA
Message-ID: <CAEP49o+-=HeW4NgB5a0H6gM9tPJg=oNeUA1iCbXq_1qZPPaGnA@mail.gmail.com>
Subject: Re: [PATCH 6.1 00/15] genetlink: Test Netlink subsystem of Linux v6.1
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	lvc-project@linuxtesting.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_074936_748343_67BF5C4C 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

VGhlIG1vdGl2YXRpb24gZm9yIHRoaXMgd29yayBpcyB0byBpbXByb3ZlIHRoZSB0ZXN0IGNvdmVy
YWdlIGFuZApyZWxpYWJpbGl0eSBvZiB0aGUgTmV0bGluayBzdWJzeXN0ZW0sIHNwZWNpZmljYWxs
eSBmb3IgdGhlIGNvcmUKYWZfbmV0bGluay5jIGFuZCBnZW5ldGxpbmsuYyBjb21wb25lbnRzLiBX
aGlsZSB0aGUgc3Vic3lzdGVtIGlzCmNyaXRpY2FsIGZvciBrZXJuZWwtdXNlcnNwYWNlIGNvbW11
bmljYXRpb24sIGl0cyBjb3ZlcmFnZSBieSB0aGUKZXhpc3Rpbmcgc2VsZnRlc3RzIGlzIHF1aXRl
IGxpbWl0ZWQuCgpUbyBxdWFudGlmeSB0aGUgaW1wcm92ZW1lbnQsIHRoZXNlIG5ldyBzZWxmdGVz
dHMgYWNoaWV2ZSB0aGUgZm9sbG93aW5nCmxpbmUgY292ZXJhZ2UgKGFzIG1lYXN1cmVkIGJ5IGdj
b3YpOgotIG5ldC9uZXRsaW5rL2FmX25ldGxpbmsuYzogODQuMCUKLSBuZXQvbmV0bGluay9nZW5l
dGxpbmsuYzogODguOCUKCkludGVncmF0aW5nIHRoZXNlIHRlc3RzIGludG8gdGhlIHVwc3RyZWFt
IHN1aXRlIHdpbGwgcHJvdmlkZSBsb25nLXRlcm0Kc3RhYmlsaXR5IGFuZCBtYWtlIGl0IHNhZmVy
IHRvIHJlZmFjdG9yIG9yIGFkZCBuZXcgZmVhdHVyZXMgdG8gdGhlCk5ldGxpbmsgY29yZSBpbiB0
aGUgZnV0dXJlLgoK0L/RgiwgMTIg0YHQtdC90YIuIDIwMjXigK/Qsy4g0LIgMjM6MTcsIEpha3Vi
IEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+OgoKCtC/0YIsIDEyINGB0LXQvdGCLiAyMDI14oCv
0LMuINCyIDIzOjE3LCBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPjoKPgo+IE9uIEZy
aSwgMTIgU2VwIDIwMjUgMjI6NTM6MjMgKzAzMDAgWWFuYSBCYXNobHlrb3ZhIHdyb3RlOgo+ID4g
VGhpcyBzZXJpZXMgYWRkcyBjb21wcmVoZW5zaXZlIHRlc3RpbmcgaW5mcmFzdHJ1Y3R1cmUgZm9y
IE5ldGxpbmsKPiA+IGFuZCBHZW5lcmljIE5ldGxpbmsKPiA+Cj4gPiBUaGUgaW1wbGVtZW50YXRp
b24gaW5jbHVkZXMgYm90aCBrZXJuZWwgbW9kdWxlIGFuZCB1c2Vyc3BhY2UgdGVzdHMgdG8KPiA+
IHZlcmlmeSBjb3JyZWN0IEdlbmVyaWMgTmV0bGluayBhbmQgTmV0bGluayBiZWhhdmlvcnMgdW5k
ZXIKPiA+IHZhcmlvdXMgY29uZGl0aW9ucy4KPgo+IFdoYXQgaXMgdGhlIG1vdGl2YXRpb24gZm9y
IHRoaXMgd29yaz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
