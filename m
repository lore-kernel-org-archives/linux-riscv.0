Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45177C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 04:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47qbUxrszX0yP4Wu43ltPog6cKmnKXmsL4vOzfaSDiI=; b=tDYAXnndbujgks
	46eY4t8fuHbvkdX8fmy3v++/+oCrvLbqPn3xa9jGK4gJbL6lxSwuhr4iZf1bAxAmDxmu6Sple+8Qf
	uQMwL6bBjPoACD3n7DWR2UmE4ja9i0HoO3VojxAIAyclXwuj8T8exfjVweNR4N2xMkY5rqwunRr1A
	4J6zuEB5FalqhyygvIqzv5aKYqJCKTeRM6QEhyOfQuf+E4HQeEMyr+Rvctd/654GAimQ7IdrG9nsG
	AQkEV6ndBnJW1X/rgzaWDVf828TyAFd9GMMWZOL0UVEfGmVUxdNdPkr2F9cBsYXCsvzE3FnR5UpQj
	GYeH4qSRtoU3AHR7XqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYIHS-00000009zO1-3xrD;
	Mon, 29 Jul 2024 04:46:42 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYIHP-00000009zM3-1iuj
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 04:46:41 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-39aebcdee9aso7465845ab.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jul 2024 21:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722228398; x=1722833198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OW7iKI5VA6V8XgNVOHyNoqHMEwUK7QtSHaQ1viyOIsc=;
        b=WiZsFQS3g0srcn3amheA01ce0A84cG14+nMTUOLCYbjE/BNq4Fdk9bdIE1Ygos5L98
         n2BNjqoQRPk3YWcxWX+OE7VqWSP33GDBGExUtRvLiGDnhMkE5VxpN/lb2qP6MmhB5WTo
         3yBSMmuRWBiDlYu5um7ZgnwBuwQvb8zBBD7njfZ+Qe/UF6pmK9COwMs8jkSaU/UIbKKA
         w4btKUXpSI26Npal5Gi0dgzQNwwftm/It+rd/5gfC811GC8ESCUczl/uk320OvXFRWve
         ExJnvgYIysoOCL67QsWIUEbTa2cCICdQCV/XIl+xjea3WUS8mJ8fTcjUdCcWsRljEokx
         s3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722228398; x=1722833198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OW7iKI5VA6V8XgNVOHyNoqHMEwUK7QtSHaQ1viyOIsc=;
        b=LycmkHabPsIgJ31tz9JLZFSp2fLiETGVbnnKQK/J3IaoEjv0atkCqlfWmsnFeT7qLk
         hTQLbJUqiDIKeT5mPpEPCBT5J1rudO5NjHtyo9jeszX2OgGQJkm/3bS1xQJiRtglRXg9
         WBkaR0RazOAhQ7criFYx9yePu+WLzsON+oEDDM2WgWoFLX/v/zyRi12tXsadz0CUsoIC
         qnKnRC/wUdFLUyNH2rF+1qd2eKySD6IoznAn+zA+l1nWLwsgC6T24SiQ/Ed7UDyVfXQ4
         R4WFlBkK7NsMUbg9QLgxCpTlONifquq2Poy9NUIfzTfKaos1ltylXczPsdl+3GDCvEzU
         jgOg==
X-Forwarded-Encrypted: i=1; AJvYcCV6FgwO0v6S8gHQjxDnGJYF0FJJ5UfKtfcnIj5/8BVPsPoCQPMdMPBgLh3DZUTNlCxoa5Z7uBKXKldc3V13JAovX2LGRQEnGLzlcz6ordDh
X-Gm-Message-State: AOJu0Yy1R3VvW5wTWYr9kweWG9qWByffhC7cn2zQElWrMl3l9LRxR9oN
	Pz1JbhIsJTSisIwgO5MquNAjicUtM1yOLG4SYqBxn4cpDQbySZOm1ypD6P7BzX3iviIWNiHvFel
	i7yik1sxWaWbNeAVu7ltD6wcWTCWBH/wd2SBppA==
X-Google-Smtp-Source: AGHT+IHBbVydjPrAC5zGlF7xgbsY+f63BZCI3Qdtaq/cb1kuBVX2K7LOkNc3W9JJ2Y0boEOPjiAkAJkUZnp9b/68Qjg=
X-Received: by 2002:a05:6e02:2163:b0:37a:601c:9147 with SMTP id
 e9e14a558f8ab-39aec2d8533mr72590785ab.10.1722228397863; Sun, 28 Jul 2024
 21:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240726084931.28924-1-yongxuan.wang@sifive.com> <20240726084931.28924-5-yongxuan.wang@sifive.com>
In-Reply-To: <20240726084931.28924-5-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Jul 2024 10:16:26 +0530
Message-ID: <CAAhSdy2Tvt3+w4=zwKOJJF4absZBGxacWmV2y517RqVqLWGEiQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] KVM: riscv: selftests: Fix compile error
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_214639_631133_2C60B092 
X-CRM114-Status: GOOD (  11.54  )
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

T24gRnJpLCBKdWwgMjYsIDIwMjQgYXQgMjoxOeKAr1BNIFlvbmctWHVhbiBXYW5nIDx5b25neHVh
bi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gRml4IGNvbXBpbGUgZXJyb3IgaW50cm9kdWNl
ZCBieSBjb21taXQgZDI3YzM0YTczNTE0ICgiS1ZNOiByaXNjdjoKPiBzZWxmdGVzdHM6IEFkZCBz
b21lIFpjKiBleHRlbnNpb25zIHRvIGdldC1yZWctbGlzdCB0ZXN0IikuIFRoZXNlCj4gNCBsaW5l
cyBzaG91bGQgYmUgZW5kIHdpdGggIjsiLgo+Cj4gRml4ZXM6IGQyN2MzNGE3MzUxNCAoIktWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogQWRkIHNvbWUgWmMqIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0
IHRlc3QiKQo+IFNpZ25lZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNp
Zml2ZS5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4xMS1yYzEgZml4ZXMuCgpU
aGFua3MsCkFudXAKCj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9n
ZXQtcmVnLWxpc3QuYyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiBpbmRleCBmOTJjMmZiMjNmY2QuLjhlMzRmN2ZhNDRl
OSAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJl
Zy1saXN0LmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJl
Zy1saXN0LmMKPiBAQCAtOTYxLDEwICs5NjEsMTAgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJ
Ryh6YmtiLCBaQktCKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YmtjLCBaQktDKTsK
PiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Ymt4LCBaQktYKTsKPiAgS1ZNX0lTQV9FWFRf
U0lNUExFX0NPTkZJRyh6YnMsIFpCUyk7Cj4gLUtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemNh
LCBaQ0EpLAo+IC1LVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjYiwgWkNCKSwKPiAtS1ZNX0lT
QV9FWFRfU0lNUExFX0NPTkZJRyh6Y2QsIFpDRCksCj4gLUtWTV9JU0FfRVhUX1NJTVBMRV9DT05G
SUcoemNmLCBaQ0YpLAo+ICtLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjYSwgWkNBKTsKPiAr
S1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2IsIFpDQik7Cj4gK0tWTV9JU0FfRVhUX1NJTVBM
RV9DT05GSUcoemNkLCBaQ0QpOwo+ICtLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZiwgWkNG
KTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y21vcCwgWkNNT1ApOwo+ICBLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHpmYSwgWkZBKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJ
Ryh6ZmgsIFpGSCk7Cj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
