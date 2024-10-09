Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3193CEDD89
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 12:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzhOeIbbENteN6hLByNBNj+vCOiu0t4uQ5ZEvvnbX7Q=; b=hR7A0PpsmVmAvM
	HBNVJD0VRVE3msuRxPKwVPb2je8/+AE2apFIzSuz6tvE6qP1Kx70M7AHtyACTfChIqD6woNLJsVq/
	n9BW3epOq8EBzjDHxdW/xGGW39BOAuqJJ3Asbg9Ts4/ip5k1gflITel7+mRfDm9DLhf0Gw6bhrWB1
	h2N2M8TpI9L6/JsN82bxD3r0/oEcehAQWqeOv+EdjzeyhZXcze4Uip2npqfvtNgCGu+YV9QI500Ky
	iwErGS4KxQV4eLDWvWm8pdza8iCDoMMb4dOb9rGUZTC2OoTRDOyFpL/6ygNz5Isz4t9K8jRQz97VS
	52hyNS63onOqinFnuoCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syW1x-00000009FHZ-0nj4;
	Wed, 09 Oct 2024 12:43:05 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syW1u-00000009FH3-3t5d
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 12:43:04 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2facf40737eso75654211fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728477781; x=1729082581; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd2ajZJTXWCZQHWCkMWh5ZbyjSLmxQS7L7ieRQ73iRo=;
        b=GmjP+RsHzrZbyFLXLMiHNGBVJVK1Xz7/NK16khOPTsTRUAL1VhkFA1AOemNTOYcGfM
         ENePmntAaJivoGEV0g6FVkWx4InZ0zMTrc7RMwALRhYKKXpW/DcOtaw/Hw7JR0YutH2N
         ieA5KdibgxdBW46l2QT4P1Tj9S7z6Kiy2auiREBWbKgYn9FCcS/HlyxcQqWpjSoObSrs
         BsSkWHIw0nrFnKM2yyfVeRXUvIJAF36hfFam0S3EBF+hwUj8/+P9c9Ulun9oA5dvy7t5
         j3tgUyqEXOGGFBVxaldGC84OPnF/GzqBUP/LWbGqs3Hyqq9akTrp4la5TXUt+hlH/6Og
         wzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728477781; x=1729082581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bd2ajZJTXWCZQHWCkMWh5ZbyjSLmxQS7L7ieRQ73iRo=;
        b=G/6msstJVqbFzeS7kkUcGlIkoWRU+BHk/IgX/hXV7HXZOAHTmhQV6bFIC4IjTHv/OV
         /TLaP1Z2iyj0AuHinigoKvT9+qk/oACSB3ZxwD2bQ2LW7omsTWTMz1wASynndLfYPxqf
         FVTxYoB08Yidf9hnPFBayXw6aEXi1+dXkvEM8jOCJorld88394AW21Q5z7JhOisG+ZFD
         jL1LPqbdPo3G2zu1deWIADOoqxPGxx8cDw4qi8aKQ9R9CQYOt/f18scO8UKL8s6q8emN
         V+MBdL7BdEFtqiWdIPaXKOHzi9Z8xsH5b/aP8AgZxshGcRY5MD5QccAxCZ+OnaHWtuoG
         9DNA==
X-Forwarded-Encrypted: i=1; AJvYcCVzHCKIkXv/YNCcqan2/qm7lV1AYPeVaK4gebLpgX+nKgJe0Ji0kdq3grFdB+udcCB59dg1HEcAroDcbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YykQGUTV2nvXjPHj5/gr9mIF8EqhIEqPWQ7EXbJnhx6jFArYeVk
	/xUtrSp1LjkzKdfuJQw7ZtfzsuXqmhr8lvpHw3zIvbNrl5V+F/3v0BXusBFl0YSAt1WSJhA6WGi
	79IwGF+wze9vNHndpzdWy2hyJ8OPKiTal5fUfbw==
X-Google-Smtp-Source: AGHT+IEFgCDjyhZzABbrE9/Mt3Cgr5SJ5rFDI1tE+jCgT6KNs1U7nwfDRGp32qlMOZ67IKjpEklL5xofkX663cD6H7A=
X-Received: by 2002:a2e:bc1f:0:b0:2fa:cf5b:1e8e with SMTP id
 38308e7fff4ca-2fb1872ba6amr16140461fa.2.1728477780725; Wed, 09 Oct 2024
 05:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
In-Reply-To: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 14:42:48 +0200
Message-ID: <CACRpkda+Rrsfs706o+K1g-252sZG7FqZGO4uYoFEMnNbUzx53Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: th1520: Improve code quality
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_054302_999532_3A6B9AE7 
X-CRM114-Status: GOOD (  10.03  )
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

T24gV2VkLCBPY3QgOSwgMjAyNCBhdCAzOjE34oCvQU0gRHJldyBGdXN0aW5pIDxkZnVzdGluaUB0
ZW5zdG9ycmVudC5jb20+IHdyb3RlOgoKPiBUaGlzIHNlcmllcyBjb250YWlucyBjb2RlIHF1YWxp
dHkgaW1wcm92ZW1lbnRzIGZvciB0aGUgbmV3IFRIMTUyMAo+IHBpbmN0cmwgZHJpdmVyIFsxXToK
Pgo+ICAtIEZpeCBzbWF0Y2ggd2FybmluZyB0aGF0IHRoZSByZXR1cm4gdmFsdWUgaXMgbm90IGNv
cnJlY3RseSBzZXQgd2hlbiBhbgo+ICAgIHVua25vd24gcGluIGVycm9yIG9jY3Vycwo+ICAtIExp
bnVzIHN1Z2dlc3RlZCB1c2luZyBndWFyZGVkIG11dGV4cyBzbyBJJ3ZlIGNvbnZlcnRlZCB0aGUg
dGhwLT5tdXRleAo+ICAgIGxvY2sgdG8gdGhhdCB1c2FnZS4KPiAgLSBMaW51cyBhbHNvIHN1Z2dl
c3RlZCB1c2luZyBhIHNjb3BlZCBpdGVyYXRvciBmb3IgdGhlIERUIGZvci1lYWNoCj4gICAgY2hp
bGQgbm9kZSBsb29wOiBmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZV9zY29wZWQuCj4K
PiBUaGUgc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBsaW51c3cgZGV2ZWwgYnJhbmNoIFsyXS4KClRo
YW5rcyBEcmV3IGFsbCB0aHJlZSBwYXRjaGVzIGFwcGxpZWQsIGV4Y2VsbGVudCB3b3JrIGFzIHVz
dWFsIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
