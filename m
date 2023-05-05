Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B27DC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 11:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMwRzIp+JPMhyWKeoWWlziATtWF3aow+A2vx5pCiNMk=; b=Diw+W2kax8QXLD
	yt3+GFKqHdBBdFWikTIuUCw0PqJ3HroH2Re0NdRmtcc0QrJdRjgG0w9cPqWbdr/5P76JUcU9NPuCr
	YLPOd2NQJq2DSDXtlLU9fDfxfBqYCPnUZAP7A8pTq/qGgv8RGHTikteebOB84h4hSN4Ia9YjVOeHQ
	A8/LpqmxwPE8sd/huPXS984tHpeECtSZv678jIQA+CppMGBi8+1IaZNGmDlJ2/JrD/2pmeO8o4bxO
	qpZAKg6t9ipuj9+mn0uhvBbo+gFtrJ7dKz/ojqVVDX6WnBrMyUTW50so1exXOrd9k9G+uFIa3xhMa
	4iD07gPPGw+Y8iWzF7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puu1g-00Anfg-20;
	Fri, 05 May 2023 11:55:04 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puu1b-00Anf3-1u
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 11:55:01 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bc075d6b2so3200152a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683287697; x=1685879697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zM/VTk0nCWAdXB8YnvYclgcFXMLvHHH3s1VUR5VWYms=;
        b=kpzLVpWiLNgD8K0vDvOI0wChk8sYz6Jg5YOpkRdakeQnYl5uTUIpadC5h+rG3oOs46
         tuglgrTwcc+qYMWj0zdVSonEvt2SI8DSYsNo+xlNJsyb0//hTNTFrhrRc7ySOpnmaTFd
         tsFOh5KN9ZijtVV8RX7CSalDLYJyt55vQ7TEq6DQMKFqD6/Tl2pd3ConxCYMH8/1Igri
         erF+eCejob5ZwxkO+TTk2vfSSTBRKBdIWl95t5Ey3rh9joqCgoZk4Bvxf7GcFVHlX8MV
         rE0k7eoJoTkXI+7VTjh/87dbvsngLoxdO+QiNXBelqz3kRrmHu7L8oM6wemxHnfDmgMG
         6d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683287697; x=1685879697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zM/VTk0nCWAdXB8YnvYclgcFXMLvHHH3s1VUR5VWYms=;
        b=buqyuk+H71oPQDpOMhKJYHELXnwxSlhaF8ATNj4ynZNxq5vu2mPfI9VVjzsfG312eh
         pkebmW1M6RdlPhGczTf6FNthcOgmM5M6OZkU+3rrUWx9H8RyogNj1EsTsfI7kPAss8Hi
         ULPfKRhx3b2C1shtfrQ9cvN0kTKQNAZdFmB3qIEGC6hKr9gMsqtLABNWjawMIT0T4ppc
         f803J56nd0J0mlPZH6WhCIMBrgHfksRWXgHHcDTs1yGL4JSkawS6X9a7p/sB1JjdpqIR
         Eq2qJRYHYOFfDk+3MAK+Rb7J23rqjm9kIbyOCcKn8fJEbXu2/MOMjvpAAg4zYvde+iuh
         R8SA==
X-Gm-Message-State: AC+VfDzhmAUB+EjL091Jw5emz7W/PzMQolZCtd4r6OA8AWS3GHYgf7m8
	fI8inwyYvlDuh+8hoWYVo0g/eZ9S3poKGXckI8Q=
X-Google-Smtp-Source: ACHHUZ7K1jQWPOENUU6Pnw2mq5kQVjdt+RFVfMhzxebmNSaWGppR+0kyH8oGgVJn58qEyTXeNW7Y3Q==
X-Received: by 2002:aa7:ccc8:0:b0:508:3f06:8fd1 with SMTP id y8-20020aa7ccc8000000b005083f068fd1mr1120300edt.29.1683287697284;
        Fri, 05 May 2023 04:54:57 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r5-20020aa7d585000000b0050696c2d2f6sm2888969edq.88.2023.05.05.04.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 04:54:56 -0700 (PDT)
Date: Fri, 5 May 2023 13:54:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?5byg6aOe?= <zhangfei@nj.iscas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Optimize memset
Message-ID: <20230505-9ec599a36801972451e8b17f@orel>
References: <6d1cbe2e.3c31d.187eb14d990.Coremail.zhangfei@nj.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d1cbe2e.3c31d.187eb14d990.Coremail.zhangfei@nj.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_045459_647732_F6D6C858 
X-CRM114-Status: GOOD (  18.63  )
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

ClBsZWFzZSBkb24ndCBwb3N0IHBhdGNoZXMgYXMgYXR0YWNobWVudHMuCgo+IEZyb206IHpoYW5n
ZmVpIDx6aGFuZ2ZlaUBuai5pc2Nhcy5hYy5jbj4KPiBEYXRlOiBGcmksIDUgTWF5IDIwMjMgMTQ6
NTg6MzUgKzA4MDAKPiBTdWJqZWN0OiBbUEFUQ0hdIHJpc2N2OiBPcHRpbWl6ZSBtZW1zZXQKPiAK
PiBUaGlzIHBhdGNoIGhhcyBiZWVuIG9wdGltaXplZCBmb3IgbWVtc2V0IGRhdGEgc2l6ZXMgbGVz
cyB0aGFuIDE2IGJ5dGVzLgo+IENvbXBhcmVkIHRvIGJ5dGUgYnkgYnl0ZSBzdG9yYWdlLCBzaWdu
aWZpY2FudCBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBoYXMgYmVlbiBhY2hpZXZlZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBGZWkgWmhhbmcgPHpoYW5nZmVpQG5qLmlzY2FzLmFjLmNuPgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2xpYi9tZW1zZXQuUyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIvbWVtc2V0LlMgYi9hcmNoL3Jpc2N2
L2xpYi9tZW1zZXQuUwo+IGluZGV4IDM0YzUzNjBjNjcwNS4uMDk2N2JkZjg2YmQ2IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvbGliL21lbXNldC5TCj4gKysrIGIvYXJjaC9yaXNjdi9saWIvbWVt
c2V0LlMKPiBAQCAtMTA1LDkgKzEwNSwzNiBAQCBXRUFLKG1lbXNldCkKPiAgICAgICAgIGJlcXog
YTIsIDZmCj4gICAgICAgICBhZGQgYTMsIHQwLCBhMgo+ICA1Ogo+IC0Jc2IgYTEsIDAodDApCj4g
LQlhZGRpIHQwLCB0MCwgMQo+IC0JYmx0dSB0MCwgYTMsIDViCj4gKyAgICAgICAgc2IgYTEsIDAo
dDApCj4gKyAgICAgICAgc2IgYTEsIC0xKGEzKQo+ICsgICAgICAgIGxpIGE0LCAyCj4gKyAgICAg
ICAgYmdldSBhNCwgYTIsIDZmCj4gKwo+ICsgICAgICAgIHNiIGExLCAxKHQwKQo+ICsgICAgICAg
IHNiIGExLCAyKHQwKQo+ICsgICAgICAgIHNiIGExLCAtMihhMykKPiArICAgICAgICBzYiBhMSwg
LTMoYTMpCj4gKyAgICAgICAgbGkgYTQsIDYKPiArICAgICAgICBiZ2V1IGE0LCBhMiwgNmYKPiAr
Cj4gKyAgICAgICAgc2IgYTEsIDModDApCj4gKyAgICAgICAgc2IgYTEsIC00KGEzKQo+ICsgICAg
ICAgIGxpIGE0LCA4Cj4gKyAgICAgICAgYmdldSBhNCwgYTIsIDZmCgpXaHkgaXMgdGhpcyBjaGVj
ayBoZXJlPwoKPiArCj4gKyAgICAgICAgc2IgYTEsIDQodDApCj4gKyAgICAgICAgc2IgYTEsIC01
KGEzKQo+ICsgICAgICAgIGxpIGE0LCAxMAo+ICsgICAgICAgIGJnZXUgYTQsIGEyLCA2ZgoKQW5k
IHRoaXMgb25lPwoKQWZ0ZXIgdGhlIGNoZWNrIG9mIGEyIGFnYWluc3QgNiBhYm92ZSB3ZSBrbm93
IHRoYXQgb2Zmc2V0cyA2KHQwKQphbmQgLTcoYTMpIGFyZSBzYWZlLiBBcmUgd2UgdHJ5aW5nIHRv
IGF2b2lkIHRvbyBtYXkgcmVkdW5kYW50CnN0b3JlcyB3aXRoIHRoZXNlIGFkZGl0aW9uYWwgY2hl
Y2tzPwoKPiArCj4gKyAgICAgICAgc2IgYTEsIDUodDApCj4gKyAgICAgICAgc2IgYTEsIDYodDAp
Cj4gKyAgICAgICAgc2IgYTEsIC02KGEzKQo+ICsgICAgICAgIHNiIGExLCAtNyhhMykKPiArICAg
ICAgICBsaSBhNCwgMTQKPiArICAgICAgICBiZ2V1IGE0LCBhMiwgNmYKPiArCj4gKyAgICAgICAg
c2IgYTEsIDcodDApCj4gIDY6Cj4gICAgCXJldAo+ICBFTkQoX19tZW1zZXQpCj4gLS0KPiAyLjMz
LjAKClRoZSBpbmRlbnQgb2YgdGhlIG5ldyBjb2RlIGRvZXNuJ3QgbWF0Y2ggdGhlIG9sZC4gSSdk
IHByZWZlciB3ZSBjbGVhbnVwCnRoZSBvbGQgZmlyc3QsIHRob3VnaC4gUGxlYXNlIHJlcG9zdCBb
MV0gYXMgYSBmaXJzdCBwYXRjaCBvZiBhIHR3by1wYXRjaApwYXRjaCBzZXJpZXMsIHdoZXJlIHlv
dXJzIGlzIHRoZSBzZWNvbmQgYW5kIG1hdGNoZXMgdGhlIG5ldyBmb3JtYXR0aW5nCnRoYXQgWzFd
IHVzZXMuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIxMDI3MTMwMjQ3LjMx
NjM0LTgtYWpvbmVzQHZlbnRhbmFtaWNyby5jb20vCgpUaGFua3MsCkRyZXcKCk9uIEZyaSwgTWF5
IDA1LCAyMDIzIGF0IDA0OjQzOjQ0UE0gKzA4MDAsIOW8oOmjniB3cm90ZToKPiAKCgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
