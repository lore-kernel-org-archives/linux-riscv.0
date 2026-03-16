Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A340F53D69
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ME6ZvMqlDKCvsPAc/bBm0nPHoWSxPJttXMCUvj4rd2Y=; b=dkEa7FyUZayJ4s
	47w20CXA5Xr7DhMtjH+2F0DLb/8aGQ9/slDS7bdGFk+nKrVYTpy8UwbcKR3+gxPM8n8F9xUPD0gfG
	ifaNU/kk6PaIYnBA99ycIFkexKIsj5B2fOmFB0kZ1HCzr1Gb8J3BrkmnNy/HkWJkZxSqHyBbk3/sr
	YOiZsPvWLsuLAx42o4oJ6Pp3TahHf4SSaqspusLYH5++hpBvTyouVAH8GLNZWjyW4IDTKr4E8WCl+
	eFLCuy/SUfxdYImbVSxc+q6gmKvmtEuEljjNBLiQsFkA6OXbTwd/rurkLnMFk6hjbgAIEYRcGvDgR
	WDw6XpaydiQbiBL99iyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29no-00000004KQk-3Enj;
	Mon, 16 Mar 2026 15:24:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29nm-00000004KOq-2HBx
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:24:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43b49819938so906f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773674657; x=1774279457; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=itDjDNSUH/60tzVJAFo+yyruw+YSC3+dRFoatVaVIZg=;
        b=eYv/ZJ4dHPN0Gnm1KEzRL3Xi9hYZ5Sq/HzFT2+baXmFypm2IhFSHXlx3ACxhKQnXwA
         78rBdHhCj2DTs4frbZXg6+36xpZLANbd8dA2+giCAWgG4Z8pTciqETE6UMYUx1A7C0x3
         ARfLdeorttlLYuqPCOoK9Xq25jJSpdUkwFPz46FzdqxpQlYa5B74J4mpgPiDf3jIeqgG
         1P0f9TXgNvnhG+/ueTfRqje1zJhe5dYzOTMg9wIHN+OhTKDBxjRmwdwwZWjX7T6cbuLv
         n3RftsEIn1S7jshymyPNLQrJQ7bsu63TGF3CWibxnjD6XdqYLZooLhFgclwi7gEvdUrr
         isGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674657; x=1774279457;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itDjDNSUH/60tzVJAFo+yyruw+YSC3+dRFoatVaVIZg=;
        b=onrb6sWTk+ebzRY86b1HRjhUKQvi2fVYVdLjBhmifva5EkMDJpWwPODHB3KMy/BtzP
         e4bUo67uu4Ckt/u2viMJdMXtdMNyKTNiulKX+9p8RLp5AG4NU/WNxdmdQQcSFqqi+mXC
         kHFzLPGf99RCmB2MsfSRQz3rKEZN71+mJ5UDKRBTWkSP6H0WbfiSmp6dK/YSlk9dcI8d
         G0OndTDWW4eo3PKs1Y71uH8RH4CB0b3HwcY1fLXxM0rkouMcnyNyoxR9DYWPX3gY6/Pj
         P7eACw8cbZUs/zLzSdscxkYo9Lti7tAG9J3M1fet/0wLLqvJijdXvxZwfP6EEn3z4Y35
         yOJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7SFR5TxKhIOarwoEa7B3oitBqrUwK0+t5X1W0yJOoO/EO+Iny4QaWZ3EbDtE3mqyrOtRg3QXBbyxxaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb//FTYmgIFHefJhvfnZdRl7oM1tBv5GcNUzJAC98sHsJ8cmi7
	vXQgH0pEfiMb2FfsoqOQyHQDwct0ZyAunBi+8/dEYCDfRPE/fmxSkAwr
X-Gm-Gg: ATEYQzzaLdVv5VkQkl/WZnqmx20hKe+eS5B9J4TJsZq3P9aJ3uastj2t4eoWmk590cC
	Yg7dXduQiJtF4RJACm7RsS6Z8S3v7alATP7Q4/WkV/LVHr9RmRc+SK4FpKk0sC+16/6YeKGJzHx
	sfoR48hYxDEUgYbH81lVkFHyQEky82T71y8od+TRV+wHQQgz32SMTeNMCTGpneaopjItSBh6IBo
	vGGduy4vY9oypkk2FPzAAoAcgtqTyYnoNBy1S6qhwIWZNTJHuynrSR+0aTT/NAP23CduM7hdy6Q
	w1IK3XPp6aBQI+RCr6iieYkilnB7I0lfRSx+G9RwgNiIlB1rwFDs5X/YfUcV5oNSZ8Uk20hRpUV
	I0MSJQkodYjYO8c5yRRVCUzORo84GuoEk/rA9plBne3oEGRIc5lWM4gSxBv/jhRY/rLVA0qPdPz
	oMjS0+c1AWfgT738HIaSJcIs1Ho2GDhF/uxGFV5GQUyQ9J7lsCmH9n
X-Received: by 2002:a05:6000:310a:b0:439:de1d:74ae with SMTP id ffacd0b85a97d-43a04d868c3mr24898503f8f.22.1773674656451;
        Mon, 16 Mar 2026 08:24:16 -0700 (PDT)
Received: from osama ([41.44.7.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm42651753f8f.21.2026.03.16.08.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:24:16 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:24:12 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: kvm: fix vector context allocation leak
Message-ID: <abggnCAb9Py60PBT@osama>
References: <20260314223144.154349-1-osama.abdelkader@gmail.com>
 <19cdcafd-adab-469d-9729-f01e8bcaf543@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19cdcafd-adab-469d-9729-f01e8bcaf543@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_082418_586348_D7565F88 
X-CRM114-Status: GOOD (  10.64  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTA6MjM6MjdBTSArMDEwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBXaGVuIHRoZSBzZWNvbmQga3phbGxvYyAoaG9zdF9jb250ZXh0LnZlY3Rvci5k
YXRhcCkgZmFpbHMgaW4KPiA+IGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0LCB0
aGUgZmlyc3QgYWxsb2NhdGlvbgo+ID4gKGd1ZXN0X2NvbnRleHQudmVjdG9yLmRhdGFwKSBpcyBs
ZWFrZWQuIEZyZWUgaXQgYmVmb3JlIHJldHVybmluZy4KPiAKPiBXZXJlIGFueSBzb3VyY2UgY29k
ZSBhbmFseXNpcyB0b29scyBpbnZvbHZlZCBoZXJlPwo+IAoKTm8sIHRoZXJlIHdlcmUgZm91bmQg
ZHVyaW5nIG1hbnVhbCByZXZpZXcuCgo+IAo+IEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYWRk
IGFueSB0YWdzIChsaWtlIOKAnEZpeGVz4oCdIGFuZCDigJxDY+KAnSkgYWNjb3JkaW5nbHk/Cj4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5y
c3Q/aD12Ny4wLXJjNCNuMTQ1Cj4KCkRvbmUsIEkganVzdCBzZW50IHYyLCB0aGFuayB5b3UuCiAK
PiBSZWdhcmRzLAo+IE1hcmt1cwoKQmVzdCByZWdhcmRzLApPc2FtYQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
