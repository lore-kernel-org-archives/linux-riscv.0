Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1A5C2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oBNv+F+AAEdZsjPOsfobzjdVzl36tzwJpDWxwKEAaVE=; b=nT3bnPORqykdzo16e6RkCzwg+p
	cHC0IVbdbYNmWLbbPtCAle7tHtzud44+msOVxGFBFlFzJtDtOcJ87IpJoPZER+nixKmzaP/DEgDqd
	E85XTRae5ictmKf/bNFK9lX+QHQZ9Kk7wymlxVZAVpPXd0uP8QFj9MCVbCNS9/uO+PdXI0EY1LcTk
	kjT/EvbIbxKEuJBM/WeNLH24KZz2jkUlOkYeVGD7hRx/OqFbz5Vc6fL90tEV1Sr4HEVOAgBj6bXcP
	uol/qqP1XCODfoq75DyDCUrYpIzuomfZSIGzKN+G4EChbPIljWNzR13F4jfq4mkuOL8/JbJZcdWGX
	ZPiboMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtYO-00000000z6m-17rM;
	Wed, 19 Jun 2024 11:32:40 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtYI-00000000z5E-1ALh
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:32:37 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-24542b8607fso3350513fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718796749; x=1719401549; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pWZByJHXQuXqyJwb/jU6Cx4D/ezIf4+3nq/sxOvdo4=;
        b=aziP1DC/I7CS7+js4HLOgGR5XKPKHQnVaV/zlWxkbgxpiWo5rl/h4W8o2Ybnnai2hO
         ucvcrZAu5VDeCk6aiZ7BMYEW4xnkQXtwgd8WvDfkkxfdb2fx49HZhqE2X8ykR4b32JAi
         20+i+oje7mzqaIWrqie4kC8dZO7MiWu75KQUvkvF92/geQQg0pi5NON4/LZEk46Vin60
         EKLUe/oo0z6w+pSVDZRz8v/As+DGn0Z8mycHy9/VeVORTmBtlOhHCvDpDueumiR3Jd/e
         Is/isYgQp1IbdNz8Flh2NUinDGkbhUU3YhlYHKrn5ig8q3AsfDCczb1r9WK5qKrqYWGP
         4brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796749; x=1719401549;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pWZByJHXQuXqyJwb/jU6Cx4D/ezIf4+3nq/sxOvdo4=;
        b=VnXwnvN2xDnOt6S/BcByBifT2JKD0wo6OeAW3ZM3x4mq0jrs4pHHNoS3MBNuUqMgOk
         MLsTulfF5zBCLY5EEkVIjsbuHDcr3CVMkJDb7hI1oJ2zgTfm0flxDDMpm9Xz64uDkVKa
         oUMgCsyqVattZgbSGE6+xhgL5Ac0M+iMk2xJmBhf0956C76IJfaQyXtzAbInNg+LooCw
         bwsew2elXefpBAU+yGahMZbuC9ZOWGatS13u922sUEUaKXLS9FzMG13S3quRTGZw+1+7
         Blg6i+h/jphirGWcoFR0OAF4xMuMJ/zpkBRGGrMhlhKsvgGzHEsym+RR0k8ahGNylVA3
         q4lw==
X-Forwarded-Encrypted: i=1; AJvYcCXnLWPKnJHQi2YiAePbtYOqqWWUyJygyXXu33sBYuuZXr5u5brFRLRlny8e3Nqc7Hu9gE3wtSijp4wFNoOIWjaTvUkp5ZLo/Vj2JG0AQhsJ
X-Gm-Message-State: AOJu0Ywvi5kDbbv/pE0G0Gh/gUPgXBtHU5uZP6A8m517EG1gR1ooe0Yz
	K/nP3EEYVUSPIJ/C4NrE4V7IfW7/fWQCwngAgYpIRcbnXwueju5UEW/Rj2lAymfzNufNupicsZJ
	w+bHGAwsRtzFBFgkvA9EN1K/+7QztQ0Rl9uzk3Q==
X-Google-Smtp-Source: AGHT+IFDTJPJUvt5MDx8yXoy50LjAmUvtMJn2QjJIM1rsP4eAxrwxGqnbfFwaWVFBzqTW1RnUYiLxwgToBAi2U6CAmM=
X-Received: by 2002:a05:6870:c0ce:b0:254:783d:aeb4 with SMTP id
 586e51a60fabf-25c94ade8d7mr2582738fac.35.1718796749303; Wed, 19 Jun 2024
 04:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240617131425.7526-1-cuiyunhui@bytedance.com> <20240617131425.7526-3-cuiyunhui@bytedance.com>
In-Reply-To: <20240617131425.7526-3-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 19 Jun 2024 19:32:18 +0800
Message-ID: <CAEEQ3wnkQsfmLbyMrG_YBvWvhHJdSTg7dG5W_mxv_wxCjatgCA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] RISC-V: Select ACPI PPTT drivers
To: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	sunilvl@ventanamicro.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, bhelgaas@google.com, james.morse@arm.com, 
	jeremy.linton@arm.com, Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, 
	sudeep.holla@arm.com, tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043234_675270_D399BAA8 
X-CRM114-Status: GOOD (  12.46  )
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

SGkgU3VuaWwsCgpPbiBNb24sIEp1biAxNywgMjAyNCBhdCA5OjE04oCvUE0gWXVuaHVpIEN1aSA8
Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQWZ0ZXIgYWRkaW5nIEFDUEkgc3Vw
cG9ydCB0byBwb3B1bGF0ZV9jYWNoZV9sZWF2ZXMoKSwgUklTQy1WIGNhbiBidWlsZAo+IGNhY2hl
aW5mbyB0aHJvdWdoIHRoZSBBQ1BJIFBQVFQgdGFibGUsIHRodXMgZW5hYmxpbmcgdGhlIEFDUElf
UFBUVAo+IGNvbmZpZ3VyYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5
dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiBSZXZpZXdlZC1ieTogSmVyZW15IExpbnRvbiA8amVyZW15
LmxpbnRvbkBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xs
YUBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3Jv
LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2Fy
Y2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IDlmMzhhNWVjYmVlMy4uMWI0YzMxMGE1OWZiIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
IEBAIC0xMyw2ICsxMyw3IEBAIGNvbmZpZyAzMkJJVAo+ICBjb25maWcgUklTQ1YKPiAgICAgICAg
IGRlZl9ib29sIHkKPiAgICAgICAgIHNlbGVjdCBBQ1BJX0dFTkVSSUNfR1NJIGlmIEFDUEkKPiAr
ICAgICAgIHNlbGVjdCBBQ1BJX1BQVFQgaWYgQUNQSQo+ICAgICAgICAgc2VsZWN0IEFDUElfUkVE
VUNFRF9IQVJEV0FSRV9PTkxZIGlmIEFDUEkKPiAgICAgICAgIHNlbGVjdCBBUkNIX0RNQV9ERUZB
VUxUX0NPSEVSRU5UCj4gICAgICAgICBzZWxlY3QgQVJDSF9FTkFCTEVfSFVHRVBBR0VfTUlHUkFU
SU9OIGlmIEhVR0VUTEJfUEFHRSAmJiBNSUdSQVRJT04KPiAtLQo+IDIuMjAuMQo+CgpHZW50bGUg
cGluZy4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
