Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B15DC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 12:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c493/q13RwkRtbuzOviYDowtK5xDK7vFsyXhgFUO4E0=; b=UB7MDph7LiLd3/
	A1r31xZsak9cQvOpAh8AkRgf4mjp0d8tOPotrq6ByB5S3s+XMjjqG/27+5UYeo0bldvOkil2CForl
	5zQQcVQRiGTeF1lzL47CBUrnUmyFekWDUOC65dQb5ml5xiPoCinEWV4ttBGlQgCqSvY/8WyfBAPbZ
	Zz8vdiLFLNThJPXX3vwMr6zTIhYmgn/VfwKHeM4o+vxknEg37XK6RJn6OknkLGBBDAW9+HmJI6WDr
	RjOUMEaN9noUGZuFu68+lw6ItM8MQAxXgwn9VB1VoJ837/rYRxLh6fbLVbGt/rRPI88pdDaydydLu
	u5U2QUvjwP1UVnX7TIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaVz-0000000FXNf-0LTa;
	Fri, 20 Jun 2025 12:06:39 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaIC-0000000FVWO-2fLP
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 11:52:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so1317346b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750420343; x=1751025143; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNPD3caLacQ3mJRAHDqinnGbqP8uVwxmMugF1g1Heu8=;
        b=FnQZOeGJvAQTr1MWCVTb3JJOV6VtoiBhxbQmCaqI3qc2mVrm9vUi0A11VN+n/GlDp7
         LQBJ7c+ndoUbU709NoJPcYUPvHZEh+SW6dnuDgsNnt6j1J0Htfjqe1241bSEL56Ic/6h
         fEAvZk+Ynl6L9h70oWV9Zl6tjJ32K2QqBOjJ1Xoy2tcF9+PyyQB6DePMuCYiwvW6zQaS
         9k9Hy1yVI92AgWNWCLz6YEpeEI5DGTv8Gao6I7oigQZD3CJct1TcRkaip/2wqdjqiMqf
         tT8IypYtu7PEW4Yj6MRLqWS2dBLKfkzurRIXEr01CtYjItXpph3fKHmCDC9YNYp8K0fb
         /FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750420343; x=1751025143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNPD3caLacQ3mJRAHDqinnGbqP8uVwxmMugF1g1Heu8=;
        b=Apm07qmBmfqSiJveML9c2eS5FFnkg34FN6ZeYfa/zc7PHcvCRuerV98rLxTciUUSCX
         gOvoV0DKcrcEadA+mvmTbnytu7VFommLtbP0xK2z231r0wsWwoyvezShrPRUqb7pOr4k
         Rd3GNcyF1XKQM8duCtc1wdXRSCrGksmpF4ZuA9UIC8dzFoNc9TzPNK84VGa+pNVDOerT
         YBlJohlAAI6LSXSdHU9DG1/v4pihteG6IDiYxrO45zOsXEGLrTiVflgP5O4u2Y6wIAX7
         tLoNxMDNjWifmlJX88H6pXGhSyVrwaccHDO5BlFkYO4A+vHb5ZuDH6Dg7tlUuYTGN3ac
         OYvA==
X-Forwarded-Encrypted: i=1; AJvYcCX4K+PcDW5il+cP+oX1zvj6crswmq81vKt5Imz+LfSHZ4ags6BJmmmAcPUcpCkRy+PzcVH3u0liKLTeAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwBZ+c9hWYS/Lh37QFqZMCjOrXgTY1v//TgYdcMbokmCMpU6EQ
	L8dG/u7B7RP9u3y5s7bl8e5uK9+zysCiCMpcBGBTHETupRq8QiRj7FcRT9UPz+WJjo1Aktzx+SP
	SbJIDQ9w=
X-Gm-Gg: ASbGncuCKb5OVe+e3GIoYXeA8vQvINphsirWBj9D2Rh7wOgsmlqT0jAL4F/y24MIr1I
	T6M/Ss962KV0aqmSChjAFV4CVIBA22zl1MTEqvqQjnfuKd1GODw6ohPy56qDy9ephWUs35TOv3K
	d8EYnIUnreA1siYL5LtOv6nNJBv4/Zm8zAwmFAelbnCVskDwLbi/BN7RbzWo9qilBP0Zuz3OXX9
	dQx9f5URtp2QHT1yCOd04zoFLbNSdS2R9stFYBzgGWV7tMXZBhgk7HKkoXlp5hd+ZeBAhI4yowy
	1o71nbyEbvqaNfv2r1F4nb8Xh9tHgGkX84cAZ6tXgQZfLAhRquV+RnU8iVLta3lA15pR3ttxi02
	6w8H+lGbdIJOU7EnFk/iYYv0vkcIkqdJS3J54qDw+aw==
X-Google-Smtp-Source: AGHT+IH+A11YxuprorYt1GU54KdKygUhbJ+NrGRjacRyjJFPFXl2ZTZ8ayflSWXljvQoqnmWXIlNYA==
X-Received: by 2002:a05:6a20:a106:b0:21c:fa68:9da6 with SMTP id adf61e73a8af0-220291cdb15mr3344166637.8.1750420343408;
        Fri, 20 Jun 2025 04:52:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a64b1c9sm1834000b3a.115.2025.06.20.04.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 04:52:22 -0700 (PDT)
Message-ID: <e435366d-f561-41d6-ad25-9f8c96e61f24@rivosinc.com>
Date: Fri, 20 Jun 2025 13:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "riscv: misaligned: fix sleeping function called
 during misaligned access handling"
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nylon Chen <nylon.chen@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250620110939.1642735-1-namcao@linutronix.de>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250620110939.1642735-1-namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_045224_774653_05B8C196 
X-CRM114-Status: GOOD (  15.26  )
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

CgpPbiAyMC8wNi8yMDI1IDEzOjA5LCBOYW0gQ2FvIHdyb3RlOgo+IFRoaXMgcmV2ZXJ0cyBjb21t
aXQgNjFhNzRhZDI1NDYyICgicmlzY3Y6IG1pc2FsaWduZWQ6IGZpeCBzbGVlcGluZyBmdW5jdGlv
bgo+IGNhbGxlZCBkdXJpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgaGFuZGxpbmciKS4gVGhlIGNvbW1p
dCBhZGRyZXNzZXMgYSBzbGVlcGluZwo+IGluIGF0b21pYyBjb250ZXh0IHByb2JsZW0sIGJ1dCBp
dCBpcyBub3QgdGhlIGNvcnJlY3QgZml4IGFzIGV4cGxhaW5lZCBieQo+IENsw6ltZW50Ogo+IAo+
ICJVc2luZyBub2ZhdWx0IHdvdWxkIGxlYWQgdG8gZmFpbHVyZSB0byByZWFkIGZyb20gdXNlciBt
ZW1vcnkgdGhhdCBpcyBwYWdlZAo+IG91dCBmb3IgaW5zdGFuY2UuIFRoaXMgaXMgbm90IHJlYWxs
eSBhY2NlcHRhYmxlLCB3ZSBzaG91bGQgaGFuZGxlIHVzZXIKPiBtaXNhbGlnbmVkIGFjY2VzcyBl
dmVuIGF0IGFuIGFkZHJlc3MgdGhhdCB3b3VsZCBnZW5lcmF0ZSBhIHBhZ2UgZmF1bHQuIgo+IAo+
IFRoaXMgYnVnIGhhcyBiZWVuIHByb3Blcmx5IGZpeGVkIGJ5IGNvbW1pdCA0NTM4MDVmMGEyOGYg
KCJyaXNjdjoKPiBtaXNhbGlnbmVkOiBlbmFibGUgSVJRcyB3aGlsZSBoYW5kbGluZyBtaXNhbGln
bmVkIGFjY2Vzc2VzIikuCj4gCj4gUmV2ZXJ0IHRoaXMgaW1wcm9wZXIgZml4Lgo+IAo+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2I3NzliZWVkLWU0NGUtNGE1ZS05
NTUxLTQ2NDc2ODJiMGQyMUByaXZvc2luYy5jb20vCj4gU2lnbmVkLW9mZi1ieTogTmFtIENhbyA8
bmFtY2FvQGxpbnV0cm9uaXguZGU+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0K
PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgNCArKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzX21pc2FsaWduZWQuYwo+IGluZGV4IGRkOGU0YWY2NTgzZjQuLjkzMDQzOTI0ZmU2
YzYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4gQEAgLTQ1NCw3ICs0
NTQsNyBAQCBzdGF0aWMgaW50IGhhbmRsZV9zY2FsYXJfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBw
dF9yZWdzICpyZWdzKQo+ICAKPiAgCXZhbC5kYXRhX3U2NCA9IDA7Cj4gIAlpZiAodXNlcl9tb2Rl
KHJlZ3MpKSB7Cj4gLQkJaWYgKGNvcHlfZnJvbV91c2VyX25vZmF1bHQoJnZhbCwgKHU4IF9fdXNl
ciAqKWFkZHIsIGxlbikpCj4gKwkJaWYgKGNvcHlfZnJvbV91c2VyKCZ2YWwsICh1OCBfX3VzZXIg
KilhZGRyLCBsZW4pKQo+ICAJCQlyZXR1cm4gLTE7Cj4gIAl9IGVsc2Ugewo+ICAJCW1lbWNweSgm
dmFsLCAodTggKilhZGRyLCBsZW4pOwo+IEBAIC01NTUsNyArNTU1LDcgQEAgc3RhdGljIGludCBo
YW5kbGVfc2NhbGFyX21pc2FsaWduZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIAkJ
cmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAKPiAgCWlmICh1c2VyX21vZGUocmVncykpIHsKPiAtCQlp
ZiAoY29weV90b191c2VyX25vZmF1bHQoKHU4IF9fdXNlciAqKWFkZHIsICZ2YWwsIGxlbikpCj4g
KwkJaWYgKGNvcHlfdG9fdXNlcigodTggX191c2VyICopYWRkciwgJnZhbCwgbGVuKSkKPiAgCQkJ
cmV0dXJuIC0xOwo+ICAJfSBlbHNlIHsKPiAgCQltZW1jcHkoKHU4ICopYWRkciwgJnZhbCwgbGVu
KTsKCkhpIE5hbSwKClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+CgpUaGFua3MgZm9yIG5vdGljaW5nIHRoYXQuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
