Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1FAD68BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZIUev9KLbCKMkss+D7UhJL5Vlc9790B9nwoR9rr0qo=; b=TL2U+lNaaEM6Mk
	N/slJQT+lz5MV4KSbt2L7ZA0TSODmMTbagtlqVe81mUGgqLK0T1UbzqsfM5FK4cL7zmbheoB8Wx2X
	Og7OJgKktZFAyZu1lPLlK6I1Iuusl7Tl96Jn218qTHeHPvG6E7F74I4cSDXy+8kEj8PVS/lit85sd
	H3mGhyF5HaULIcfOrSIPYo/KA7xwhrIvHGo3KSgx8Cz+9C7yx8Y0blAMf3qmlLd45WFImGEEXD1OK
	EwOTsNIYPhS+eQjLoA6T/8N5NHOHSqiwYb+m8BETfLb3wCnjDluQZti/r4HuXbytPmQ3TUVq4uFjy
	5vE8wEMPXBYeSbDraJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAdi-00000008B6k-2pLP;
	Thu, 18 Dec 2025 09:49:42 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAdg-00000008B6E-3XBw
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 09:49:42 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-640c9c85255so403286d50.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 01:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766051380; x=1766656180; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHsxKeDBVPihRIP+vDNg1CWrDyKdjDxz6zbw/6Q71KU=;
        b=PIJqCxH91wL6y954CxsGT9XOKzHPkM1urEDWRR0F/t8FG0TcHP6pd1cv74RQZbGKmf
         BQ8ICYBiqdjWBUH1F76JMyGp7kvskgaAYr1WoorfsR1EkywaaLvmmow8xp1MpfzedvVT
         GK3aE5q0XUUfk7DiaTRXBNn05z36yrAtwPgaJE08o5DjvfqxD1zM4knJAa0eIKWA4O/z
         90mKlJ6+i/e6bqJFiRtyNcv13OnZAyLKPmggwrMZbpDQh+EGad+KNaQXcHYwHS9oMYMd
         okuPYxLEYWHAZjeCYhJyLut94s8dhpqaioZKmTsq0aE9GFZCedsnDKtxeQDqPmHW2QMz
         zV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766051380; x=1766656180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hHsxKeDBVPihRIP+vDNg1CWrDyKdjDxz6zbw/6Q71KU=;
        b=P+wZxaFpK3udqolhLTiX5lQ3WbMI6wcwJ6NRc8nhorq+B18xjLf3jgtj2RO8ZKtpv6
         pcTGE/H7kHyhp7JNnIKPoG1T/+FXt6U/IrU3kU06zig1xtvHiJSGpjFAe3Kpz8WcHC7U
         MPzWDo6O7ZNN1v4IITTlqekM9yU0cClYpRTaThw4hMwYCvO/o6w8XBFCTl786QuegWfa
         83+EP/XsnrekrnoZmrTJJVxJBPW7AvsQ52hR81Hw/PD3tdFAYFzgKS2gUlsqVxsBdTal
         m1jcrII/nnleMz7nkp1s2CGdk1jMy+rmw80eulCoPL2vU0tm7dCBk7Ew89tzBYrUr/wg
         XWFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxmGdpSpFLid7WVx9Yt+zFcTMYT14LpRh/sIk9xKSkLArkdg5wUNbeM/qluW2GSKTkHu2lHTOFugUcFg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys9p0iVxgAln+8OmLy+KDS3wscGDPvOdVV8A+pWFeoSJbEjW9x
	Jke5ZA6nDsrBfsTlaJbI9uI/lv75jDdxr8/wVVLcwzG5gwcMiMOdF4vj/R1/Ddhc2VJ9x59HBF2
	iD/DUzPkgc8eaq09W2uj0/mfznTbalHE=
X-Gm-Gg: AY/fxX4io7xKIpSbfwLRIjSBgX/xd9oir8fuAlmZiTQbWBjkC9FgN6dEWvMUZJ8U9dX
	Uwwq2lknP6KvYiBZ741DCxJDYAPmtkfMtbgRAhkbofGf7JN1CB0I4PYEKGxxJAdpFNyGJKbbedQ
	uFPVkzHGP6XPhCp69iOARDD/sZ7akq0PrC/Q3kwx0kDOsmgmsrJhg5iMRLjt/vzDOx9KQVvq4NH
	Z1k3tmLMEX7tNVfDTyDGUollRbryHWjORLvvxEPm3WcpPlfqB62mAw55Wfvo0xd4UZ1qXw1aLPb
	3vaSnoI=
X-Google-Smtp-Source: AGHT+IHbUhc8RcoUU6kca2g9DZ+pSXhkgOn8m+QWZSDVhkkDGOALJ9i1+/27LQs8FgtCWbcfrM1TLN5mXcf40yRfWYg=
X-Received: by 2002:a05:690e:400b:b0:63f:a7dc:159e with SMTP id
 956f58d0204a3-645555eb6b6mr15491199d50.29.1766051379541; Thu, 18 Dec 2025
 01:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie> <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie> <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
 <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com> <20251217221004.GD31109@sventech.com>
 <d5917806-56db-4945-b336-89bd1027f613@rootcommit.com> <e1cb227b-a55e-4962-b7e1-b540ba92012c@rootcommit.com>
In-Reply-To: <e1cb227b-a55e-4962-b7e1-b540ba92012c@rootcommit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 18 Dec 2025 10:49:27 +0100
X-Gm-Features: AQt7F2oIzwxN3_St6jPUNCVlM5yaq4EraMfq-v8ppvY5wcNGS34sZfG_8GdBSlk
Message-ID: <CABdCQ=N4eZyBNBrhOQsW7jSeJmr=xhicwW8fskOAioV1q9cC5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Johannes Erdfelt <johannes@erdfelt.com>, Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_014940_891630_43EEDAF7 
X-CRM114-Status: GOOD (  13.24  )
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

SGkgTWljaGFlbCwgWWFvLCBKYXZpZXIsIEpvaGFubmVzLAoKVGhhbmtzIGV2ZXJ5b25lIGZvciB0
aGUgZ3JlYXQgZGlzY3Vzc2lvbiBhbmQgdGhlIGd1aWRhbmNlLgoKRmlyc3Qgb2YgYWxsLCBJ4oCZ
ZCBsaWtlIHRvIGNsYXJpZnkgYSBwb2ludCByZWdhcmRpbmcgbXkgcHJldmlvdXMgZW1haWwKdG8g
YXZvaWQgYW55IGNvbmZ1c2lvbjogdGhlIGRldGFpbGVkIHRlY2huaWNhbCBicmVha2Rvd24gYW5k
IHBvaW50ZXJzCndlcmUgcHJvdmlkZWQgYnkgWWFvIGhlcmUgaW4gdGhlIHRocmVhZC4gTXkgbWVu
dGlvbiBvZiBKYXZpZXIgd2FzCnJlZ2FyZGluZyBhIHNlcGFyYXRlIG9mZmxpbmUgY29udmVyc2F0
aW9uIHdlIGhhZCBlYXJsaWVyLiBCb3RoCmNvbnRyaWJ1dGlvbnMgaGF2ZSBiZWVuIGVzc2VudGlh
bCB0byB1bmRlcnN0YW5kaW5nIHdoeSB0aGUgU0QgY2FyZCBpcwpjdXJyZW50bHkgZmFpbGluZy4K
CkdpdmVuIHRoYXQgd2UgYXJlIGFsbCBhIGJpdCB0aWdodCBvbiB0aW1lLCBJIHRoaW5rIGl0IHdv
dWxkIGJlIGJlc3QgdG8Kc3BsaXQgdGhlIHdvcmsgaW50byBzZXBhcmF0ZSB0YXNrcyBzbyB3ZSBj
YW4gbWFrZSBwcm9ncmVzcyBpbgpwYXJhbGxlbC4gQmFzZWQgb24gdGhlIGZlZWRiYWNrLCBoZXJl
IGlzIHRoZSByb2FkbWFwOgoKMS4gRGVmaW5lIGEgc2VwYXJhdGUgY29tcGF0aWJsZSBzdHJpbmc6
IHRoZSBlTU1DIHNsb3QgaGFzIGEgUEhZLCB3aGlsZQpTRC9TRElPIHNsb3RzIGRvIG5vdC4gV2Ug
bmVlZCB0byBkaWZmZXJlbnRpYXRlIHRoZW0gdG8gYXBwbHkgdGhlCmNvcnJlY3QgcmVzZXQgbG9n
aWMgKHNraXBwaW5nIFBIWSBpbml0IGZvciBTRCkuCjIuIEV4dGVuZCB0aGUgcGluY3RybCBkcml2
ZXI6IHN1cHBvcnQgaXMgbmVlZGVkIGZvciBzd2l0Y2hpbmcgdGhlIFNECnZvbHRhZ2UgcGlucyBm
cm9tIDMuM1YgdG8gMS44Vi4KMy4gQWRkIHR1bmluZyBsb2dpYzogdGhpcyBpcyByZXF1aXJlZCBh
dCBsZWFzdCBmb3IgU0RSIG1vZGVzLgoKU2luY2UgSeKAmWxsIGJlIGZvY3VzaW5nIG9uIHRoZSBk
cml2ZXIvcmVzZXQgbG9naWMgKDEpLCBpcyB0aGVyZSBhbnlvbmUKZWxzZSB3aWxsaW5nIHRvIHBp
Y2sgdXAgdGhlIHBpbmN0cmwgKDIpIG9yIHRoZSB0dW5pbmcgKDMpPwoKTG9va2luZyBmb3J3YXJk
IHRvIHdvcmtpbmcgdG9nZXRoZXIgb24gdGhpcy4KCgpFbCBqdWUsIDE4IGRpYyAyMDI1IGEgbGFz
IDY6MjUsIE1pY2hhZWwgT3BkZW5hY2tlcgooPG1pY2hhZWwub3BkZW5hY2tlckByb290Y29tbWl0
LmNvbT4pIGVzY3JpYmnDszoKPgo+Cj4gT24gMTIvMTgvMjUgMDY6MTksIE1pY2hhZWwgT3BkZW5h
Y2tlciB3cm90ZToKPiA+Cj4gPiAgKiBZb3Ugd29uJ3QgYmUgZW1iYXJyYXNzZWQgaWYgeW91IGFs
cmVhZHkgcGFzc2VkIHRoZXNlIGZpcnN0IHR3bwo+ID4gY2hlY2tzIDspCj4gPiAgKgo+Cj4gSSdt
IHRoZSBvbmUgZ2V0dGluZyBlbWJhcnJhc3NlZCDwn5iFLiBDb3B5aW5nIGFuZCBwYXN0aW5nIGZy
b20gSm9wbGluCj4gbm90ZXMgaW50byBUaHVuZGVyYmlyZCByZWFsbHkgbWFkZSBteSByZXBseSB1
Z2x5Li4uCj4KPiBUaGlzIG1hZGUgbWUgZm9yZ2V0IGEgcXVpdGUgaW1wb3J0YW50IHJ1bGU6IHNl
bmQgdGhlIHBhdGNoZXMgdG8geW91cnNlbGYKPiBmaXJzdDoKPiBiNCBzZW5kIC0tcmVmbGVjdAo+
Cj4gTWljaGFlbC4KPgo+IC0tCj4gTWljaGFlbCBPcGRlbmFja2VyCj4gUm9vdCBDb21taXQKPiBZ
b2N0byBQcm9qZWN0IGFuZCBPcGVuRW1iZWRkZWQgVHJhaW5pbmcgY291cnNlIC0gTGVhcm4gYnkg
ZG9pbmc6Cj4gaHR0cHM6Ly9yb290Y29tbWl0LmNvbS90cmFpbmluZy95b2N0by8KPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
