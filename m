Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229D7C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkbPOzTBUcQ17gUrjjjI/y85dkOC/D5NfvjU5ZuH4rg=; b=HAlsJFC8Cc/NSw
	Xa38iLjuWV1RUyF4ZrCZyumUrBVO0kIMEEQ5TLGjIle1O59ccOqdpHg2J21W3zn6v0k84BdWV/0jL
	RSRwi4WuPERqG85igBDBQpbTkQECaIMJm7oWWT4lllpY3zd1vamVXGCvFheWEEV44MxqaCOYmbAHo
	pwvT9te5qU+7TwjJnUR98VBVm5W23iTMm5etwZ2F7VZekk4qmHB5cYIhsoEcgQrib1vTXNhXWlef2
	iRhsB3/61Le3YZCmmaltzRUZjifmiamE6rD3iIlp4boj+uncbp/GqHT6GOx5C3ym6BPM1yi8PJ9HV
	espVH5ZIUUZfekfWCRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscI-00000004NeE-3PO9;
	Tue, 24 Jun 2025 01:38:30 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnal-00000003uLw-2Tsf
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 20:16:37 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad8a8da2376so742741566b.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750709793; x=1751314593; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLEkhYw1KwcHEqZHkPQE50lr62xelk0uLtioyAiJVJY=;
        b=ZOlUPsjKt2/V6K5FSu8UHHSbm3omZOLsbydeS2+/wnVTsMtP2dTfKhTaa8EDm2HoC0
         t3Fi+WlZcLLZtOXkB0OMpVUSuyNOKPvMBvuYKBsaTsp+Ii5r5khTdIWMXU5jK3UWu8ei
         3vxK03AJm5ABsU5Sj4OAwzstevMwgGLzXlxCqQ7kvvFrR7pfW9gIhbO9jbiI+WVyxKdq
         sbCRcJl1aLQY3yz7FLT92NEhyewPC3A4n8tqi9fTTXSplSK6duEvfcascAO+Rw1DqcCt
         8RadD54cW++cgk44+tyWHmsCW+MtvYYjk2YxmCU4ZSTuQUw56xoHB5cyHjn405/86lck
         seGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750709793; x=1751314593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLEkhYw1KwcHEqZHkPQE50lr62xelk0uLtioyAiJVJY=;
        b=eCQ2O3uTyRW60USStHqaIl5WKdq/I/il7cCYiSXq+kuSTWcVJA13LiYIkdDPloknDK
         QWUWCaRHyNROwxYbVa52bk/++WDvBUBrjD4FhMKC/cX1Rox3Ogx9lVFaixGxzrALc9mT
         LrWNMsi8jXBJGfpUsSelXCeXZobHslm3NWbOI8H4phOEiLFU5dPWPvez//9h0+5R23p3
         NuviVGyF9NlMhiskCNA5SlkCl6A4edHV4cqjn4BKJL46EQ0CZPTPIJed2VhRm5nSwufr
         vTgh21inDukIUDhuZVtJLEEnErhCQXCmCQ+qzWZS5lMBRhLCyBfJ+5A5y7lbPz9Bn+iv
         kdMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWET+G2rt+C+BXNy6G9mHiyv5nOHyX61UtvBrnUPzAtLPfRi23aHOD5LvpYEcT0beQ38ZwXoRsZXW4F0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEKQ+fyxwSXTUpWUwor7Hewz4spn35urOJMMABeCxdvqfajlvI
	Gm9UijbyvNVwzXpLX2ZAak1nt3hjSnE0l+RzA5KkQHffIAdVL8Qs42S7OCOdKcC0hBJru2lhnI0
	fbzEOtZIDzZMHna+71LSkW9TJs6C9dVHqBoQWD/IIkQ==
X-Gm-Gg: ASbGncuENF9tJ/cTfQMD8uQJyVkq75K2zY2jVmvdLo2Wji4TMOXtt0E6sV/Nq2ub32l
	M01sIuzjVnDhLlyRj6rbdu6YMiWO9JaOsZBhP8tn28aEV+xVXHvOnxLj5TPIXno5jQks6m054rk
	K8KsW3/XQ0S4Ngu+FsEf8kSVcPN9y0zfhRWk9sjeVPG3iUocbFQH9osxamxV8CkDZ2wVT+6+ArI
	26J
X-Google-Smtp-Source: AGHT+IH8W2k769PxImmVrKNQTA+EhZNwz6gwpGQ4i/8HcB79n2XQjF93ywieBigkgN2AUYS9QOJXJEjcKy0xawy54jc=
X-Received: by 2002:a17:907:2d89:b0:acb:b900:2bca with SMTP id
 a640c23a62f3a-ae0574451e3mr1122168866b.0.1750709793540; Mon, 23 Jun 2025
 13:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv2i5AOYOkepUq_Rz1wxfzu1o2W59xDgui7VPw7g-fV9w@mail.gmail.com>
In-Reply-To: <CA+G9fYv2i5AOYOkepUq_Rz1wxfzu1o2W59xDgui7VPw7g-fV9w@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 23 Jun 2025 22:16:22 +0200
X-Gm-Features: Ac12FXyUtlAN5mo5G7XVHNzzalU5xEO1E42U1lrA8NLKvGONdwjAniZqy-W01ts
Message-ID: <CAHVXubif=dPF2u=dQYhRR-VaRutX=b+7NmTkE5B-L+OxA5Krig@mail.gmail.com>
Subject: Re: next-20250623: riscv defconfig raid6 recov_rvv.c use of
 undeclared identifier 'raid6_empty_zero_page'
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-raid@vger.kernel.org, 
	Song Liu <song@kernel.org>, yukuai3@huawei.com, 
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_131635_739916_75676617 
X-CRM114-Status: GOOD (  11.96  )
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

SGksCgpPbiBNb24sIEp1biAyMywgMjAyNSBhdCA4OjMy4oCvUE0gTmFyZXNoIEthbWJvanUKPG5h
cmVzaC5rYW1ib2p1QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gUmVncmVzc2lvbnMgb24gcmlzY3Yg
ZGVmY29uZmlnIGJ1aWxkcyB3aXRoIGdjYy0xMyBhbmQgY2xhbmcgZmFpbGVkCj4gb24gdGhlIExp
bnV4IG5leHQtMjAyNTA2MjMgdGFnLgo+Cj4gUmVncmVzc2lvbnMgZm91bmQgb24gcmlzY3YKPiAq
IHJpc2N2LCBidWlsZAo+ICAgLSBjbGFuZy0yMC1kZWZjb25maWcKPiAgIC0gZ2NjLTEzLWRlZmNv
bmZpZwo+ICAgLSBydXN0Y2xhbmctbmlnaHRseS1sa2Z0Y29uZmlnLWtzZWxmdGVzdAo+ICAgLSBy
dXN0Z2NjLWxrZnRjb25maWcta3NlbGZ0ZXN0Cj4gICAtIHJ2MzItY2xhbmctMjAtZGVmY29uZmln
Cj4KPiBSZWdyZXNzaW9uIEFuYWx5c2lzOgo+ICAtIE5ldyByZWdyZXNzaW9uPyBZZXMKPiAgLSBS
ZXByb2R1Y2liaWxpdHk/IFllcwo+Cj4gQnVpbGQgcmVncmVzc2lvbjogcmlzY3YgZGVmY29uZmln
IHJhaWQ2IHJlY292X3J2di5jIHVzZSBvZiB1bmRlY2xhcmVkCj4gaWRlbnRpZmllciAncmFpZDZf
ZW1wdHlfemVyb19wYWdlJwo+Cj4gUmVwb3J0ZWQtYnk6IExpbnV4IEtlcm5lbCBGdW5jdGlvbmFs
IFRlc3RpbmcgPGxrZnRAbGluYXJvLm9yZz4KPgo+ICMjIEJ1aWxkIGxvZwo+IGxpYi9yYWlkNi9y
ZWNvdl9ydnYuYzoxNjg6MjQ6IGVycm9yOiB1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyCj4g
J3JhaWQ2X2VtcHR5X3plcm9fcGFnZScKPiAgIDE2OCB8ICAgICAgICAgcHRyc1tmYWlsYV0gPSAo
dm9pZCAqKXJhaWQ2X2VtcHR5X3plcm9fcGFnZTsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4KPiAvbGliL3JhaWQ2L3JlY292X3J2di5jOjE3MToyNDogZXJyb3I6IHVz
ZSBvZiB1bmRlY2xhcmVkIGlkZW50aWZpZXIKPiAncmFpZDZfZW1wdHlfemVyb19wYWdlJwo+ICAg
MTcxIHwgICAgICAgICBwdHJzW2ZhaWxiXSA9ICh2b2lkICopcmFpZDZfZW1wdHlfemVyb19wYWdl
Owo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IC9saWIvcmFpZDYv
cmVjb3ZfcnZ2LmM6MjA2OjI0OiBlcnJvcjogdXNlIG9mIHVuZGVjbGFyZWQgaWRlbnRpZmllcgo+
ICdyYWlkNl9lbXB0eV96ZXJvX3BhZ2UnCj4gICAyMDYgfCAgICAgICAgIHB0cnNbZmFpbGFdID0g
KHZvaWQgKilyYWlkNl9lbXB0eV96ZXJvX3BhZ2U7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeCj4gMyBlcnJvcnMgZ2VuZXJhdGVkLgo+Cj4gIyMgU291cmNlCj4gKiBL
ZXJuZWwgdmVyc2lvbjogNi4xNi4wLXJjMy1uZXh0LTIwMjUwNjIzCj4gKiBHaXQgdHJlZTogaHR0
cHM6Ly9rZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4
dC9saW51eC1uZXh0LmdpdAo+ICogR2l0IHNoYTogZjgxN2I2ZGQyYjYyZDkyMWE2Y2RjMGEzYWM1
OTljZDE4NTFmMzQzYwo+ICogR2l0IGRlc2NyaWJlOiBuZXh0LTIwMjUwNjIzCj4gKiBQcm9qZWN0
IGRldGFpbHM6Cj4gaHR0cHM6Ly9yZWdyZXNzaW9ucy5saW5hcm8ub3JnL2xrZnQvbGludXgtbmV4
dC1tYXN0ZXIvbmV4dC0yMDI1MDYyMy8KPiAqIEFyY2hpdGVjdHVyZXM6IHJpc2N2Cj4gKiBUb29s
Y2hhaW5zOiBnY2MtMTMKPiAqIEtjb25maWdzOiBkZWZjb25maWcKPgo+ICMjIEJ1aWxkIGFybTY0
Cj4gKiBCdWlsZCBsb2c6IGh0dHBzOi8vcWEtcmVwb3J0cy5saW5hcm8ub3JnL2FwaS90ZXN0cnVu
cy8yODgyOTk3Ny9sb2dfZmlsZS8KPiAqIEJ1aWxkIGRldGFpbHM6Cj4gaHR0cHM6Ly9yZWdyZXNz
aW9ucy5saW5hcm8ub3JnL2xrZnQvbGludXgtbmV4dC1tYXN0ZXIvbmV4dC0yMDI1MDYyMy9idWls
ZC9nY2MtMTMtZGVmY29uZmlnLwo+ICogQnVpbGQgbGluazogaHR0cHM6Ly9zdG9yYWdlLnR1eHN1
aXRlLmNvbS9wdWJsaWMvbGluYXJvL2xrZnQvYnVpbGRzLzJ5dG1xZlo2djI0ZHhxNWtqb3JKYmdI
NmhDOC8KPiAqIEtlcm5lbCBjb25maWc6Cj4gaHR0cHM6Ly9zdG9yYWdlLnR1eHN1aXRlLmNvbS9w
dWJsaWMvbGluYXJvL2xrZnQvYnVpbGRzLzJ5dG1xZlo2djI0ZHhxNWtqb3JKYmdINmhDOC9jb25m
aWcKPgo+IC0tCj4gTGluYXJvIExLRlQKPiBodHRwczovL2xrZnQubGluYXJvLm9yZwoKVGhlIGZv
bGxvd2luZyBkaWZmIGZpeGVzIHRoZSBpc3N1ZSBhbmQgdG8gbWUgc2hvdWxkIGJlIHNxdWFzaGVk
IGludG8KY29tbWl0IDQ0YWRkMTAxZGI5ZTUgKCJsaWIvcmFpZDY6IHJlcGxhY2UgY3VzdG9tIHpl
cm8gcGFnZSB3aXRoClpFUk9fUEFHRSIpIHNvIGFkZGluZyBIZXJiZXJ0IGFzIGNjOgoKZGlmZiAt
LWdpdCBhL2xpYi9yYWlkNi9yZWNvdl9ydnYuYyBiL2xpYi9yYWlkNi9yZWNvdl9ydnYuYwppbmRl
eCBmMjkzMDM3OTVjY2ZlLi41ZDU0YzRiNDM3ZGY3IDEwMDY0NAotLS0gYS9saWIvcmFpZDYvcmVj
b3ZfcnZ2LmMKKysrIGIvbGliL3JhaWQ2L3JlY292X3J2di5jCkBAIC0xNjUsMTAgKzE2NSwxMCBA
QCBzdGF0aWMgdm9pZCByYWlkNl8yZGF0YV9yZWNvdl9ydnYoaW50IGRpc2tzLApzaXplX3QgYnl0
ZXMsIGludCBmYWlsYSwKICAgICAgICAgKiBkZWx0YSBwIGFuZCBkZWx0YSBxCiAgICAgICAgICov
CiAgICAgICAgZHAgPSAodTggKilwdHJzW2ZhaWxhXTsKLSAgICAgICBwdHJzW2ZhaWxhXSA9ICh2
b2lkICopcmFpZDZfZW1wdHlfemVyb19wYWdlOworICAgICAgIHB0cnNbZmFpbGFdID0gcmFpZDZf
Z2V0X3plcm9fcGFnZSgpOwogICAgICAgIHB0cnNbZGlza3MgLSAyXSA9IGRwOwogICAgICAgIGRx
ID0gKHU4ICopcHRyc1tmYWlsYl07Ci0gICAgICAgcHRyc1tmYWlsYl0gPSAodm9pZCAqKXJhaWQ2
X2VtcHR5X3plcm9fcGFnZTsKKyAgICAgICBwdHJzW2ZhaWxiXSA9IHJhaWQ2X2dldF96ZXJvX3Bh
Z2UoKTsKICAgICAgICBwdHJzW2Rpc2tzIC0gMV0gPSBkcTsKCiAgICAgICAgcmFpZDZfY2FsbC5n
ZW5fc3luZHJvbWUoZGlza3MsIGJ5dGVzLCBwdHJzKTsKQEAgLTIwMyw3ICsyMDMsNyBAQCBzdGF0
aWMgdm9pZCByYWlkNl9kYXRhcF9yZWNvdl9ydnYoaW50IGRpc2tzLApzaXplX3QgYnl0ZXMsIGlu
dCBmYWlsYSwKICAgICAgICAgKiBVc2UgdGhlIGRlYWQgZGF0YSBwYWdlIGFzIHRlbXBvcmFyeSBz
dG9yYWdlIGZvciBkZWx0YSBxCiAgICAgICAgICovCiAgICAgICAgZHEgPSAodTggKilwdHJzW2Zh
aWxhXTsKLSAgICAgICBwdHJzW2ZhaWxhXSA9ICh2b2lkICopcmFpZDZfZW1wdHlfemVyb19wYWdl
OworICAgICAgIHB0cnNbZmFpbGFdID0gcmFpZDZfZ2V0X3plcm9fcGFnZSgpOwogICAgICAgIHB0
cnNbZGlza3MgLSAxXSA9IGRxOwoKICAgICAgICByYWlkNl9jYWxsLmdlbl9zeW5kcm9tZShkaXNr
cywgYnl0ZXMsIHB0cnMpOwoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
