Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FA1C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 04:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qNpFudD77SHAdM8FMl9RE5h+SYlBnrIc4olqnn1gNO0=; b=At5GS9Qgt0QjCQu3L0JLYtN8os
	xSLMo13aeZiQoaKsL7NPv5IdXcGxxZI7oAygPrETSpQAUNIWU924yjudBNR4w34V4VTCfNjIAWtlH
	WosBeWhCky9z5T98IjW2cQrZQMaIdFfC5T/7LQSv2q5wQhIRub2wyKXqwQ5Meo1JossahdLuPhekt
	HVSSmPizg2EqmBjg86HgHLM2NlhwFvdIn+NBf6CXcETUno7feQCf5KSY81xA1SHCiCi5lyF6EdXo9
	WgSt6FDLKnrjPWGyL9v0risx8cGeIKzBoVT1EafnWJg5C49jEsjD/VVj2eMT5LabPLG9aD4pY9Pob
	lORXmY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgzLe-0000000BMOu-3Jwh;
	Thu, 22 Aug 2024 04:22:58 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgzLb-0000000BMOM-3TSK
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 04:22:57 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2705dd4ba64so229676fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 21:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724300574; x=1724905374; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/P0vbfAjm6K3LNoQ5CD1IrJf0GFaknx79tF0mwTM7G8=;
        b=C/tQKxBQbfbYSg4vOtDz4yGIxTaxRL7gStgPKfbDAQ3vVivEC0uuQhFaWWXLemtAw0
         6eNXUkObd2WILQ0Y/MljghKEtsnq2afcXGGzb+UDG1DqcMUnjwEE7Uk+NBO8yycXjfhl
         C0xGkCX3Qf6fhnurIjg4wHFSRmxovfGxWqf+Lu3MqudXN5LmlPIZMuccrJjm3w396HIN
         bdA44kO3KFzlH57GQHGqHGAFiRjQDhOedf82iKQmyZ/ZqfKnJmusyA1V+HsyW24Iycwo
         82/SqHOB3qZYYGpFP7vYIDsFurKX1LIEVy2Te689qJUCxLZoyO2cW48vL+ppNLBAXx/w
         2h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724300574; x=1724905374;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/P0vbfAjm6K3LNoQ5CD1IrJf0GFaknx79tF0mwTM7G8=;
        b=FU4/h63qnF4z+jVSgqszZCjVyU2dgA5MDEXxzFjotumm6EvsZjaW5gMeWa4OveEqOR
         9cSHopi/rlJPFsLvGUZedbmSPhvck2+a8MOQ57ZJk0WazhbibtUi6fO7s3b4uqSBISFY
         9CanwZ01qnJXOxj5J9vi7BEj/XHeyJ7NhwwC5hZwd2600Ll3GZLj31ZnDbkojs+vlDIw
         U5r8RhLnXqB+UDYv6GbJ0j1Hs4Xm3zUA9TNOn3qnyVtmgGqW/ZrM5CqH3gML2JdqkNC9
         It1/2QtwX3eU9hBbwkZwxGGUE0Vg4zR/337njLU3AJuffJ4ypoy9hcxpGAyKd5iQ/VXT
         ZrcA==
X-Forwarded-Encrypted: i=1; AJvYcCW1I/h+/En/DY+idY5enpL5KztA7wED7ZXR1swMdY6TID+/kvJqDfsAVv2TfARzrxWJTTut8zh26i5ZDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW8pXMtLQ5OhkxFlhGeUZ9Ff0di27N4lp6jEvX3M/z1CuwfjDU
	ayWOk3WFK1OiT8LVthMAV+4H1kBHcY6Ijl5stNMUv+3J5Mxfg8n8jBaCyV+iYS4yFYNJctd8Ze9
	2MikKbm1akFVnL2dJOeUvOTkACZtQR+Q+7NcZwQ==
X-Google-Smtp-Source: AGHT+IEpdBLiEt1QeV/r1ArAeTNomsIoxgldSKxTLruJ6FvISHi+9M+Oz1GauKpOvyUFIwwNZXL6T3m6b3lVwcyxDas=
X-Received: by 2002:a05:6870:9111:b0:261:1177:6a56 with SMTP id
 586e51a60fabf-273cfc54187mr874430fac.20.1724300574074; Wed, 21 Aug 2024
 21:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240814054434.3563453-1-nick.hu@sifive.com>
In-Reply-To: <20240814054434.3563453-1-nick.hu@sifive.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 22 Aug 2024 12:22:43 +0800
Message-ID: <CAKddAkCa1pZGZRtTLeB0PFK_sdsxDC44EwYmh4f=SFPzuSbG+g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] cpuidle: riscv-sbi: Allow cpuidle pd used by other devices
To: anup@brainfault.org, rafael@kernel.org, daniel.lezcano@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, greentime.hu@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_212256_056669_6E28D35B 
X-CRM114-Status: GOOD (  11.94  )
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

SGkgQW51cAoKQW55IHN1Z2dlc3Rpb25zIG9uIHRoaXMgb25lPwoKT24gV2VkLCBBdWcgMTQsIDIw
MjQgYXQgMTo0NOKAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBB
ZGQgdGhpcyBwYXRjaHNldCBzbyB0aGUgZGV2aWNlcyB0aGF0IGluc2lkZSB0aGUgY3B1L2NsdXN0
ZXIgcG93ZXIgZG9tYWluCj4gY2FuIHVzZSB0aGUgY3B1aWRsZSBwZCB0byByZWdpc3RlciB0aGUg
Z2VucGQgbm90aWZpZXIgdG8gaGFuZGxlIHRoZSBQTQo+IHdoZW4gY3B1L2NsdXN0ZXIgaXMgZ29p
bmcgdG8gZW50ZXIgYSBkZWVwZXIgc2xlZXAgc3RhdGUuCj4KPiBOaWNrIEh1ICgyKToKPiAgIGNw
dWlkbGU6IHJpc2N2LXNiaTogTW92ZSBzYmlfY3B1aWRsZV9pbml0IHRvIGFyY2hfaW5pdGNhbGwK
PiAgIGNwdWlkbGU6IHJpc2N2LXNiaTogQWRkIGNwdWlkbGVfZGlzYWJsZWQoKSBjaGVjawo+Cj4g
IGRyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jIHwgMTEgKysrKysrKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IC0tCj4g
Mi4zNC4xCj4KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
