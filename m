Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B90F53D6C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBTR3rjgE9FsJUKRYXKuPaiTGiiC5AtswJFTQefJ/rg=; b=FJZcQNi0/wAlE4
	0Zy+RXHq9PPi4JNqoSE2qVGcD6XFn1dmU2/x+IIb3dL8+UjOR4NOQhcABl6VpVdX/wNKKZR+l1UDt
	xtJkGXl3hLpv5Nq45KUBk71Ma6sHeMfmhmysy8m+L6c6Ih5ztlvtRw+WFLnN6EOr1jALVQIQpAo+N
	7To1O9jPHnKiTSBTO8MFjgzGYqG2eQ4e5slmv8XSkzpr8/WofOyjBdLPtuzlzIKz/Ym+9M9iaeFXB
	O40OcoFaHJQTbiovh3YIXs96JHlkqMDjlsg/kLk6j5oS4o2ZPDMl2YvUeR3qq4xqXfWXqa9D3IHHa
	quuQKgv76IAmkHr169Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29lP-00000004Jza-1SKh;
	Mon, 16 Mar 2026 15:21:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29lM-00000004Jyo-0nIZ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:21:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48541edecf9so51418215e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 08:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773674506; x=1774279306; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cvgWjKp8ls5n9m6jDPlYhRIq3P5n2f0R6p5Ga1jqL68=;
        b=AHUYNMKkf8UZn0LNXyss2hblYX+3ttis1+X3Y0f5tjtNAbyOMn7L4IAaae7HQmdj6O
         UMT3AYNUXsAe6eveWjFjtX8ymUBIHFsbryuN9t+BToA8qXq9Kz4OfLnhVxRGaM3uUDVI
         praUOW/YsFFIlcEs4HiUnOPed2o/SHeFuJXk9GwR34l3EV4vAfaVeSY/3ZbM/ydL5rDs
         sro7hVRo05X50KO+p6j/1jJpvEabWZX7zXHiLE5Fqi/VrtjT/2Mdm768onNAL+1VtkzH
         J/kT/OrWu359ISETaHgoAyGquyx7Rb8lj+GAbSe/uVy87pzurvEg5oA5JP8NbnknpewZ
         XzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674506; x=1774279306;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cvgWjKp8ls5n9m6jDPlYhRIq3P5n2f0R6p5Ga1jqL68=;
        b=n4OvF7AEQB5YJsktEyvzKv9lnS1sDUrxni0Qor0b8l6hvaKwMckIBpcrBSbVYzR57a
         hC3Zlaim5KTwpdk/yVNlWiC6yclsYtvDD53Zr53r03SU82xL6r3ORiCaZ/b28jKC+o4S
         qNSqcI7ZXJXINyLpZSbx8nWyqe+dUoocuWdzcAYPrMJhjRX4gkhrmkUBhP2G/lHZaDKi
         pq/GeQ1dCnYoHv2Do29s51cnXsvmuqR7z2J+yYInX18bKDMVFIxXmSc2LV+5iUHfqb8F
         2Bki/81kGjrC8exmouS2rmRwM9QK5r6MCXfzXoVypbhJeLczE0KsSpkzYhOfJ9d0+Pi9
         8rbw==
X-Gm-Message-State: AOJu0YyVDhPb+4oGi5HhR5hVOh4mbgnpuD/VpudrGbXiLTfAG5GFirQy
	ozScqycm3NJoSIN11OTQpksaI8yh1M0ElfGOBu4j5I64rYB9q7oMtONl
X-Gm-Gg: ATEYQzy8PjL9T496lIilHEr8EUKoZE5eUc7YK1uTi16ooYEvUAZhtVWeGtlRUhzMNcv
	Lp4pS2MOMBB12d0RxmtelSCfZ1M+CGupBINoh+MAdBo34kkTpMkn1z3kCY47d02wRwIoKPSFQfZ
	fXJHf8TZX+3nHiUlTsDrTiebffhG4+614guMm5BWsKtt20d08OjLQhlEN67MFUeA8m6LQnAAhkO
	jXoY6Ph7NKnYicZnS/a+V/7vWOB3JnzodgK6A7+HBBPYo7SEdW6F+hDz8Ig5UI/0NlAD0TDUKmH
	zGyaUZUVZHpeV12BBcb1pxof+VAMG24wLYhjQkMFuyIvx5KsrLWXqSZ0yENfFg8S+mMB2Mmiibj
	JdK1yCTVVZwRoBttl9kV1LAcyrw41S3VyL5FL+PrkVDFpJ3wWRro3PV+cd8GoNMpWPo1d70a+PZ
	548s/MWXUN0AZofYEqMHLig+RG6u5Ka5nGU/U9GLHaQMzoehC8g4sDHoIbQXMpzS8=
X-Received: by 2002:a05:600c:8b72:b0:485:4328:407a with SMTP id 5b1f17b1804b1-485566f7999mr215633795e9.19.1773674505839;
        Mon, 16 Mar 2026 08:21:45 -0700 (PDT)
Received: from osama ([41.44.7.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556414295sm157885775e9.3.2026.03.16.08.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:21:45 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:21:41 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Suren Baghdasaryan <surenb@google.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: mm: add null check for find_vm_area in set_memory
Message-ID: <abgfx9gpUA6vWvZA@osama>
References: <20260314222815.153203-1-osama.abdelkader@gmail.com>
 <71d162ec-8745-4391-a94c-e5b0bacb4fe1@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71d162ec-8745-4391-a94c-e5b0bacb4fe1@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_082148_247265_2A2C41AF 
X-CRM114-Status: GOOD (  12.26  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTE6MjI6MjZBTSArMDEwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBmaW5kX3ZtX2FyZWEoKSBjYW4gcmV0dXJuIE5VTEwuIEFkZCBhIG51bGwgY2hl
Y2sgdG8gYXZvaWQgcG90ZW50aWFsCj4gPiBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UsIG1hdGNo
aW5nIHRoZSBwYXR0ZXJuIHVzZWQgYnkgb3RoZXIgYXJjaGVzLgo+IAo+IDEuIFdlcmUgYW55IHNv
dXJjZSBjb2RlIGFuYWx5c2lzIHRvb2xzIGludm9sdmVkIGhlcmU/CgpObywgYm90aCB3ZXJlIGZv
dW5kIGR1cmluZyBtYW51YWwgcmV2aWV3IGFuZCBjb21wYXJlIHdpdGggYXJtNjQuCgo+IAo+IDIu
IEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYWRkIGFueSB0YWdzIChsaWtlIOKAnEZpeGVz4oCd
IGFuZCDigJxDY+KAnSkgYWNjb3JkaW5nbHk/Cj4gICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRh
dGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aD12Ny4wLXJjNCNuMTQ1Cj4gCj4g
My4gV291bGQgeW91IGxpa2UgdG8gcmVmZXIgdG8gdGhlIGZ1bmN0aW9uIOKAnF9fc2V0X21lbW9y
eeKAnSBpbiB0aGUgc3VtbWFyeSBwaHJhc2U/Cj4KCkRvbmUsIEkganVzdCBzZW50IHYyLCBhcHBy
ZWNpYXRlIHlvdXIgcmV2aWV3LgogCj4gCj4gUmVnYXJkcywKPiBNYXJrdXMKClRoYW5rcywKT3Nh
bWEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
