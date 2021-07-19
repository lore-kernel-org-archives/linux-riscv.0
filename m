Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374B6C07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:49:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9450561164
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9450561164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3ARbjkwHxppF2w/lpPJfg9oyRuEiMKeAmo/K6vSvho=; b=e1TeUJa0e3QFaK
	bDzAOu3kI5oppVAaBaTTRSTBRwQmsEM5wz616nz9oWciYiit+OCHxRj9O6CYTWkOJjL5MqolIP/el
	4aHNciujRXeQ+4rTyQuCikwfLjOSlLIwpeLLFUPq1hHa53dlzWl9EO7g4mlBAIZnenKRleztmUBfJ
	nchLlnYT7Q/i7Rq1CU1Jcx+/Gg67dJM/J1TWrrJUMNSn/ibZVbok/WTYgFcBGFqq6HV1QgpQ9Db0d
	h+3q7MMwZz+DS0JqC4F8rW6c9730VrSCzz3zVwVcTXkYxJryALK3DnTlgTnbSEWu8XZn0IaK9Hr5S
	AhaGPgKeYEWHa8XrnAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5UaF-009xPq-PD; Mon, 19 Jul 2021 14:49:27 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5UaC-009xPA-8G
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 14:49:26 +0000
Received: by mail-vs1-f47.google.com with SMTP id f4so9468466vsh.11
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 07:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qx5mJkBsGELHIfg3tO6IBHVeQdtURYJ38KZzvX6xUBY=;
 b=pzZlAF/kRTYKtJ3+WsHNqkz/JSE4vDVbCjaJvlqYZznw0UY+iZMdN0fqJ8wBC5zGSn
 b7/ybsKQdGe5mign4hsCwP8xwF5EjYJKkq/i7dSw3GgAaIFIKXfuQGabN5iV7v2YpBxJ
 Ha/T/WfCtp7UOo9O/KG5UWUL5AX7Zmu4kWUd3HJTWyoaygwph+fpAkubhyiI8xGTKFPU
 anJn246Rd2IV9alS+dfs76tako3A6kQqgMhDoLhIQx5RV0ss50mKifXYNk+v6VD2upNl
 f80zRe5CItieINCUKthDbXg63Dw21FVG4NgatIcCxGDmvkR+z0kIrDWmHSzubnz9OuYw
 6NLw==
X-Gm-Message-State: AOAM531k66D9fbdcquolXIkps4Awwghd3XX7J5s38q+5IZ+CKMgXz1r1
 6t0DHHDE1ybzm+Da5NTY8+9vcTG6PZPzpZdrpqQ=
X-Google-Smtp-Source: ABdhPJyWBmBLTA8AWcOVBVDelW9SF9rerNvvLBU1GLRis490q++voKnpseBb3FVTBjim+amqIyy5GHm+gV0aS+Sxsm8=
X-Received: by 2002:a05:6102:321c:: with SMTP id
 r28mr24683436vsf.40.1626706162788; 
 Mon, 19 Jul 2021 07:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
 <5e1b5d90-5a1e-5e9f-7b92-6c53b8589c2a@gmail.com>
In-Reply-To: <5e1b5d90-5a1e-5e9f-7b92-6c53b8589c2a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jul 2021 16:49:11 +0200
Message-ID: <CAMuHMdVMi8zfmSiZ0vnvCcsZQua_LKXpNAQVmRUdBKxNay=f-w@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>, 
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_074924_335839_411A67C6 
X-CRM114-Status: GOOD (  16.42  )
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

SGkgVHN1a2Ftb3RvLXNhbiwKCk9uIE1vbiwgSnVsIDE5LCAyMDIxIGF0IDI6NTMgUE0gQWtpcmEg
VHN1a2Ftb3RvCjxha2lyYS50c3VrYW1vdG9AZ21haWwuY29tPiB3cm90ZToKPiBUaGlzIHBhdGNo
IHdpbGwgcmVkdWNlIGNwdSB1c2FnZSBkcmFtYXRpY2FsbHkgaW4ga2VybmVsIHNwYWNlIGVzcGVj
aWFsbHkKPiBmb3IgYXBwbGljYXRpb24gd2hpY2ggdXNlIHN5cy1jYWxsIHdpdGggbGFyZ2UgYnVm
ZmVyIHNpemUsIHN1Y2ggYXMKPiBuZXR3b3JrIGFwcGxpY2F0aW9ucy4gVGhlIG1haW4gcmVhc29u
IGJlaGluZCB0aGlzIGlzIHRoYXQgZXZlcnkKPiB1bmFsaWduZWQgbWVtb3J5IGFjY2VzcyB3aWxs
IHJhaXNlIGV4Y2VwdGlvbnMgYW5kIHN3aXRjaCBiZXR3ZWVuIHMtbW9kZQo+IGFuZCBtLW1vZGUg
Y2F1c2luZyBsYXJnZSBvdmVyaGVhZC4KClsuLi5dCgo+IFNpZ25lZC1vZmYtYnk6IEFraXJhIFRz
dWthbW90byA8YWtpcmEudHN1a2Ftb3RvQGdtYWlsLmNvbT4KClRoYW5rcyBmb3IgeW91ciBwYXRj
aCEKCkFzIHYzIGlzIHBhcnQgb2YgdjUuMTQtcmMxLCBhbGwgZml4ZXMgYW5kIGltcHJvdmVtZW50
cyBuZWVkIHRvIGJlCnNlbmQgYXMgaW5jcmVtZW50YWwgcGF0Y2hlcy4KCkFmdGVyIHJldmVydGlu
ZyBjYTZlYWFhMjEwZGVlYzBlICgicmlzY3Y6IF9fYXNtX2NvcHlfdG8tZnJvbV91c2VyOgpPcHRp
bWl6ZSB1bmFsaWduZWQgbWVtb3J5IGFjY2VzcyBhbmQgcGlwZWxpbmUgc3RhbGwiKSBhbmQgYXBw
bHlpbmcKdjQsIGJvb3RpbmcgbGludXgtb24tbGl0ZXgtdmV4cmlzY3Ygc3RpbGwgZmFpbHMsIGJ1
dCBub3cgZGlmZmVyZW50bHkKKHJlYWwgY3Jhc2gpOgoKICAgIC9iae+/ve+/ve+/ve+/ve+/vVbv
v71GLTogYXBwbGV0IG5vdCBmb3VuZAogICAgMifvv73vv73vv73vv73vv710OiBhcHBsZXQgbm90
IGZvdW5kCiAgICBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwg
aW5pdCEgZXhpdGNvZGU9MHgwMDAwN2YwMAogICAgQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5v
dCB0YWludGVkCjUuMTQuMC1yYzItb3JhbmdlY3JhYi0wMTkzMy1nNWM5NTc0ODY5MDE3ICMzNTcK
ICAgIENhbGwgVHJhY2U6CiAgICBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIg
ZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwYWYwCiAgICBPb3BzIFsjMV0KICAg
IENQVTogMCBQSUQ6IDEgQ29tbTogaW5pdCBOb3QgdGFpbnRlZAo1LjE0LjAtcmMyLW9yYW5nZWNy
YWItMDE5MzMtZzVjOTU3NDg2OTAxNyAjMzU3CiAgICBlcGMgOiB3YWxrX3N0YWNrZnJhbWUrMHgx
MWMvMHgxM2MKICAgICByYSA6IGR1bXBfYmFja3RyYWNlKzB4MmMvMHgzYwogICAgZXBjIDogYzAw
MDM5NzAgcmEgOiBjMDAwMzliYyBzcCA6IGMxODM1ZTIwCiAgICAgZ3AgOiBjMDZhNzY5MCB0cCA6
IGMxODM4MDAwIHQwIDogMDAwMDAwMDAKICAgICB0MSA6IDAwMDAwMDAwIHQyIDogMDAwMDAwMDAg
czAgOiBjMTgzNWU1MAogICAgIHMxIDogYzA1ZDgxODAgYTAgOiAwMDAwMTAwMCBhMSA6IDAwMDAw
MDAwCiAgICAgYTIgOiBjMDRkZmQ2OCBhMyA6IGMwNWQ4MTgwIGE0IDogYWIxZDRjZGMKICAgICBh
NSA6IDAwMDAxMDAwIGE2IDogYzA2N2QyMDQgYTcgOiBmZmZmZWZmZgogICAgIHMyIDogMDAwMDAw
MDAgczMgOiBjMDVjYzlmNCBzNCA6IDAwMDAwMDAwCiAgICAgczUgOiBjMDVkODE4MCBzNiA6IGMw
NGRmZDY4IHM3IDogMDAwMDAwMDEKICAgICBzOCA6IDAwMDAwMDAwIHM5IDogOTViNmYxNTggczEw
OiAwMDAwMDAwMAogICAgIHMxMTogMDAwMDAwMDEgdDMgOiAwMDAwMDAwMCB0NCA6IDAwMDAwMDAx
CiAgICAgdDUgOiAwMDAwMDAwMCB0NiA6IDAwMDAwMDAwCiAgICBzdGF0dXM6IDAwMDAwMTAwIGJh
ZGFkZHI6IDAwMDAwYWYwIGNhdXNlOiAwMDAwMDAwZAogICAgWzxjMDAwMzk3MD5dIHdhbGtfc3Rh
Y2tmcmFtZSsweDExYy8weDEzYwogICAgWzxjMDAwMzliYz5dIGR1bXBfYmFja3RyYWNlKzB4MmMv
MHgzYwogICAgWzxjMDRkZmRlOD5dIHNob3dfc3RhY2srMHg0NC8weDVjCiAgICBbPGMwNGU0Yzk4
Pl0gZHVtcF9zdGFja19sdmwrMHgyYy8weDQwCiAgICBbPGMwNGU0Y2M4Pl0gZHVtcF9zdGFjaysw
eDFjLzB4MmMKICAgIFs8YzA0ZGZmM2M+XSBwYW5pYysweDEzYy8weDMzMAogICAgWzxjMDAwYzc3
ND5dIGRvX2V4aXQrMHg4MzAvMHg4YjgKICAgIFs8YzAwMGM4ODg+XSBkb19ncm91cF9leGl0KzB4
NDAvMHhhYwogICAgWzxjMDAwYzkxOD5dIF9fd2FrZV91cF9wYXJlbnQrMHgwLzB4MzQKICAgIFs8
YzAwMDIxMjg+XSByZXRfZnJvbV9zeXNjYWxsKzB4MC8weDQKICAgIC0tLVsgZW5kIHRyYWNlIGQx
NDdmMGYxNDY5ODJiMDggXS0tLQogICAgbm90ZTogaW5pdFsxXSBleGl0ZWQgd2l0aCBwcmVlbXB0
X2NvdW50IDEKICAgIEZpeGluZyByZWN1cnNpdmUgZmF1bHQgYnV0IHJlYm9vdCBpcyBuZWVkZWQh
CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAK
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
