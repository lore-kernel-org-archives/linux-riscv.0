Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3212DC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 03:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/m3M9Ee2XV22KaLNESPXPLfYcxJm3ZxgAhdxTuMwaRg=; b=lnfW05yGhDUnYP
	AicvQl3XRnAcLkRlP4x5ryRtnvr0BL6EAP1FOv9IqFr6oYxqvS9dVXUPrkQO/MVSeNJAxmMJ5YqN3
	ZYdiobTJh6IFcwnXN69fwmNgln7dC9d6u1ic38NRFGk8t4ko/QYT+rsA5B5cgu5JNhZWqlALfCNnz
	FKO2UOcPCwYUETjkO9jRCZ+YCJen94kjMDRVYqSzXwJXeS/r/Oq2a+1J4em7XlMjEWNogb4RRPUUW
	HxOH1+2gtA6mr/q6gdzm+oeua5pustVYPXW+Y9BQdX0dn5hakJmIZ89Osk8KYK54FlCApFE2jEVmW
	uMmWTgVzhpEX+yv9GyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Nqa-00047p-2U;
	Tue, 06 Jun 2023 03:59:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NqY-00046Y-2D
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 03:59:03 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-973bf581759so882147566b.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 20:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1686023939; x=1688615939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dM21c1Nc8PpsugvVvkXGjPuJ770RB3ZgU9jLaDRphw4=;
        b=ctJDoiowWamWzxDL7r0NWd+i21+Fry9LG8Oit4WzetKkkfGVt/IyvYy2eE/m9eY02a
         U/fuox9oH2gQ0DvRF+U4XyvTP5wZ5xsfZYzbzpKvxe0MVQZE5ixcxJqKzDbBZo1c6GFU
         ExZAHtdHwOL3y8osWSCXH7eoXRe7FfKUCTtdGZajVDAcVwT9WGeuNxxGc03HzwR3FsP1
         SspjHdTbfHy+VjSFoV6V2Hj1/r6da0F6IQAxIvgu9nJn3HdKBrIKqXb/JmwCJdRy2yWl
         kg/xmwFptLNYqCISY1ff/w2H6YJBtuYFcWOCasr7s1G11CVDC82EJEjBskQAgO9W65ub
         Um8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686023939; x=1688615939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM21c1Nc8PpsugvVvkXGjPuJ770RB3ZgU9jLaDRphw4=;
        b=Y0nablghCy2HLs7jM6ojKrJnv7glytI67FZgdqvhF7JF3XGr0DLRFuvlVErUA+4pfg
         X/2bRx9o66nBAQTjlpmz9OK294rWoAg87n2YrV1Ls4+4KTMvl6vPnqAowyK844nvE5R5
         u5OOf8WnRgNG/mU+HdtC9psQnkunkVAnOZtw1oV4YffrVJo/BLBLvI+H0c08LEbzoGiH
         nLecNlQCQi4ON/2IXR941Tije1zWVXVx2LyEOW+atB+v/rk7uH+grMvymFlNrwEcYx4P
         q2h57WDdFrbU+sKNGthhkTtK/MUll3tpOSNpbXGG6u18kyH3vrtWwG/8y80Cn5Vk9h8v
         jIZg==
X-Gm-Message-State: AC+VfDzXJEt4YiNMh3KA9Nn6G7JM/RBJBX4ryRBJAVY48qzbMg4TG1qv
	EqAm4MPt6+cA2o4vuqu3HPIE9/fElCR8swG6bjiFYw==
X-Google-Smtp-Source: ACHHUZ72p0dbaENbWJIK/mZosjXDy+tHeCiq6ltvW9D9AgbkofY3Dne3UU6VZteoZqRsdy59Gmt81ZCfp56Dp1OyhiY=
X-Received: by 2002:a17:907:940f:b0:96f:9a90:c924 with SMTP id
 dk15-20020a170907940f00b0096f9a90c924mr1061115ejc.74.1686023938889; Mon, 05
 Jun 2023 20:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230530175024.354527-1-ajones@ventanamicro.com>
In-Reply-To: <20230530175024.354527-1-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jun 2023 09:28:47 +0530
Message-ID: <CAAhSdy2wPbRzRv2uUuq-Gtpxbx472EysRh-hvayBsuJGcxbXRg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] RISC-V: KVM: Ensure SBI extension is enabled
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_205902_722012_D5E38AB6 
X-CRM114-Status: GOOD (  11.31  )
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

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMTE6MjDigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEVuc3VyZSBndWVzdHMgY2FuJ3QgYXR0ZW1wdCB0
byBpbnZva2UgU0JJIGV4dGVuc2lvbiBmdW5jdGlvbnMgd2hlbiB0aGUKPiBTQkkgZXh0ZW5zaW9u
J3MgcHJvYmUgZnVuY3Rpb24gaGFzIHN0YXRlZCB0aGF0IHRoZSBleHRlbnNpb24gaXMgbm90Cj4g
YXZhaWxhYmxlLgo+Cj4gdjM6Cj4gIC0gdXNlZCBsb3dlcmNhc2UgZm9yIGVudW0KPgo+IHYyOgo+
ICAtIFJld29ya2VkIGl0IHRvIHVzZSBhbiBlbnVtIGFycmF5IGluc3RlYWQgb2YgdHdvIGJvb2xl
YW4gYXJyYXlzCj4KPiBBbmRyZXcgSm9uZXMgKDMpOgo+ICAgUklTQy1WOiBLVk06IFJlbmFtZSBk
aXNfaWR4IHRvIGV4dF9pZHgKPiAgIFJJU0MtVjogS1ZNOiBDb252ZXJ0IGV4dGVuc2lvbl9kaXNh
YmxlZFtdIHRvIGV4dF9zdGF0dXNbXQo+ICAgUklTQy1WOiBLVk06IFByb2JlIGZvciBTQkkgZXh0
ZW5zaW9uIHN0YXR1cwoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciA2LjUKClRoYW5rcywKQW51cAoK
Pgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgIDggKystCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgfCA3NiArKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspLCAyNCBkZWxl
dGlvbnMoLSkKPgo+IC0tCj4gMi40MC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
