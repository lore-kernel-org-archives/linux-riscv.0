Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE0EC44525
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKxu5sQQBsQz3/d4j23yRXKUjR3PwNYzO4/7xODQ1dM=; b=vq/59AbCcuAq8U
	mJCM1gxxk/zDRrxCaOaf0QWakn+g0YPOhAWtHPodLN2MgKmlbs23K/iBsXLP8QZiGL9YQnjrdgqJv
	TGYGgwhYrOTiGd7MJuf7zscNsgX0iDHfI/5TskV+KDo9B9j+NPYmliytp7EYhBq71KRNvufc9Tocs
	ziiDJTB7eD2nrsXw3U2nFC+BcJrl9yB5SkItB1o/dFB7RXjU8OvhBqdWFFli+AAl2LPl+425GvrT1
	Dc4KMVglxVqdW7X5Ah8SBIv+3pNG4Qm8lhxvYJRMFRrFit2tHhpea0KieOTf9fl7HzHtOGDxfJ15e
	MQKtvX/9s89Zs7yfn3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliMf-000000064aU-1MhU;
	Mon, 20 Jul 2026 07:24:37 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKR-000000063FY-1ua3
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:26 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso7620609a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532139; x=1785136939; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TUztZ0b7q+NpMvvYDHyOAMUqlB8mjssu5zGv0A0NKH4=;
        b=s0Sq00ahcMIchqG/50nbQDGcgvGSG1gwwbfmc9oMZG3oHTCH2MtP6UU5P4/iK+WOtV
         +hlmK2kGHhBjxmIVEpjBscpu4B3ACvt7OjDiTw/FDHUfU+p/JFgsDlcqQqWTk7MjxyEO
         g+XNOCf2W+pjWcY/kENhKgEhR/5OdbfRrk6bP1eGrqMXdO1vVwXu3AqC5DnSMH/AkAEY
         Nz0YB/67E3xdd5mjvnuja+dpPImFTegm9i0beCjk7Wq3FHCtYAoc9qTfcUmk6o893yrL
         DWKR2dIjWU5g4jFUHhRbGdrBaV6wCH3C1bQQcWchB+8Nc8fJ1T4pFbAfnEC8cQ6uzqCS
         eGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532139; x=1785136939;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUztZ0b7q+NpMvvYDHyOAMUqlB8mjssu5zGv0A0NKH4=;
        b=e/onnjxvkfOmtf9Vwvju2Wn/XHNkgk8xLH2AZQ2weW2fNdaTOTjKeHD6o7riSCRrAS
         JLXPnpLTy+vcUA6sdAHDGSTBSd5uPXArdF7F+y+WK7T7E26kBxX3+nzbtegO9SFxRH+t
         CFYA2YfhSGMJTH31x0mgcA5WEkqQr1hPygx6S1P8O82zVCSSf5CwmrnZAWYTFIZyPZJV
         jIuiqNC1n7hdy5Dj/nJ4IYN0CTdfpZ70eMQq4nVKzfUm9fOFmzMImzunMiu4mQUNNSuR
         whEf62pDfoqvQxpjou/SbhwcRTJMskFFcHrUM12hc6oVEhu+lRdypKX2nITdRZbY7tOt
         pq/w==
X-Forwarded-Encrypted: i=1; AHgh+Rr9tuwhX1BnFPaCG71fJSKY1saIVOwM3RnA5IDUIJY2G3vRiQ/DUTlcTaQo5lS4Jm6Xdfa5ky2A6hnPXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFAWMeTqDYGiacCNjJxUWUqWi7tnN4AUbqQdbNcrR+yBqcb5t7
	qJUBJPstEQ9p78JjgzjCYeGTbukbfaesKHJjRen3XtJBUewNChWURMw2
X-Gm-Gg: AfdE7cmFic2N6IZMcNDtsfBvgeZ4G8msCjsTJ0SuSdR+5wifC6sItku6laUE0MAbXTN
	hdVLZBTGUKTnEE5hmj/0pAcR27G2w/mvjaDCMYA9cnRWytoY9WyKRZAgAMseeGwflu2ufYJQF8F
	d2y9kY1L7HZHA/chM8wLj2nn52HXtwwaODzlyzg5TxFJy78HTIYtC6AfgvdKHnjMK6Q5UYtdMvh
	QU4GU8sNmV8hBA9iv6kG2JJJbNUELyKK+ml92Sh+ZTx3abmsYJi/y/EpiWBoy6Os/RVd+1/ezIc
	9EbXDRxrieZZtpZcq1f7+O40hFfiIB+lbbsjt8WFZI8CxHQakt+vAzKBxmZrUsPEDgVefpR5d4e
	QaWekIvEKtgIekbiXHy5SBlwkHtMv1/WtR5cfAvrVFd7al4lykYJX089LZXL7k7R3ofBI/tYonF
	K+qCb/nEmxU4fdQPRnxzJ7b64afas3
X-Received: by 2002:a17:90b:4a4a:b0:37f:9ce1:7369 with SMTP id 98e67ed59e1d1-38e4b54c1e4mr13295798a91.31.1784532138762;
        Mon, 20 Jul 2026 00:22:18 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:18 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 09/22] RISC-V: Add Ssccfg/Smcdeleg ISA extension
 definition and parsing
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-9-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-9-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211937.543975.4322402942834410024.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=542;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=y1PqojkleYsBjG9eN+IIxqwXAQObYxTJP42EfflWB+Y=;
 b=liGw0+KRk7gLM9mGkWcbN8G4nDkwP2C2I7Zb7ri3m83b9lEN7e/fB+kwHHa/mofODnnb2zsUF
 IyWdYB0weUKAFFVTMYgNMYOglCZKygWyFNgG8v9xFhmJJw7QYjPTAMU
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002221_357811_9DBB172F 
X-CRM114-Status: UNSURE (   7.41  )
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

T24gV2VkLCAwMSBKdWwgMjAyNiAwMTo0Njo1NyAtMDcwMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBh
dHJhQGxpbnV4LmRldj4gd3JvdGU6Cj4gU21jZGVsZWcgZXh0ZW5zaW9uIGFsbG93cyB0aGUgTS1t
b2RlIHRvIGRlbGVnYXRlIHNlbGVjdGVkIGNvdW50ZXJzCj4gdG8gUy1tb2RlIHNvIHRoYXQgaXQg
Y2FuIGFjY2VzcyB0aG9zZSBjb3VudGVycyBhbmQgY29ycmVwc29uZGluZwo+IGhwbWV2ZW50IENT
UnMgd2l0aG91dCBNLW1vZGUuCj4gCj4gU3NjY2ZnICjigJhTc+KAmSBmb3IgUHJpdmlsZWdlZCBh
cmNoaXRlY3R1cmUgYW5kIFN1cGVydmlzb3ItbGV2ZWwKPiBleHRlbnNpb24sIOKAmGNjZmfigJkg
Zm9yIENvdW50ZXIgQ29uZmlndXJhdGlvbikgcHJvdmlkZXMgYWNjZXNzIHRvCj4gZGVsZWdhdGVk
IGNvdW50ZXJzIGFuZCBuZXcgc3VwZXJ2aXNvci1sZXZlbCBzdGF0ZS4KPiAKPiBbLi4uXQoKUmV2
aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8dGhlY2hhcmxlc2plbmtpbnNAZ21haWwuY29tPgoK
LS0gCi0gQ2hhcmxpZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
