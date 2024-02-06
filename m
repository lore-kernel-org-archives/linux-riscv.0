Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A5DC4828D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 01:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRPoWmQQszdJmQOhBf0XBqaIDXHffPEelbi8meP4DcQ=; b=cgtggK2WBOVfQ9
	MM2BSW8aedjs8Vc8qEdM6XPQH9zVsykMPAWO1qMMSCL/9k4+Xb9rPE4TeCVYaCgi20tFTYzC+jgLn
	OU5ojYAf6gdYqud7YbLa37f1SpdpPL2FqGY2BhcfkTu5yhA7sAO8l3g15CBlBJK3g+L0y+W+Ia+CV
	DWh03uy1/NQFkAle0B5lSLNuoy+c2O6389bKanK6Hdc9WCwhKb2OX++tR4akrH4f7dFBqB13nnnHQ
	5kLJjlITvd9w8Vgy6oMF3sdRGFifKiWblO9bkvMBOElswrn/WXShgqOk8NG/RmRI5Rg2ddnvhgcfn
	hn7g+metplpjfUFzIzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXAKC-00000005iAF-1wkf;
	Tue, 06 Feb 2024 01:32:36 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXAK9-00000005i9k-1lFa;
	Tue, 06 Feb 2024 01:32:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-51109060d6aso7235532e87.2;
        Mon, 05 Feb 2024 17:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707183150; x=1707787950; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QApOFbEPm/JI1t7SVH7QEk9OREXHhc6+siBSRqc1pgw=;
        b=E2jAGSeTd+O0PYdFmWrBHCyLO7YTay3DpnCBUou+S2oYg0+hX6LLrnJu/M0y0J+aNL
         gLSQH7bOnFjNeV/rJNQXDg3XhHIJWF75v0DQNAgNjdwmwn3gWpnzSqCYVXBWOhZ15QTD
         yLG5VzGtFo2L1xYV6R7gA+GSwF3v+ec8KDaRTRCA7LZkWix6s14sFySsjRtJEaJOxaSz
         63WAi5qGAS4XY3O2frfYpLWFwTGCHOvaTzePniAH+828xPy6O1hKxOuVvWlxvwYGbScf
         fypBjylK/4j25rw0DP1MrvHKzYYFEiDL5QSQLTY1CGjOM3L1AyKfW2n4NtRGtj1u+p9f
         nANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707183150; x=1707787950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QApOFbEPm/JI1t7SVH7QEk9OREXHhc6+siBSRqc1pgw=;
        b=FkiCoiWdkudlWHS5dMKmBevRILoeQePIBTLlfYv+slGArD3h38FGSPHNOfHkbKNqCM
         a6nbFV1iW+XNe2zlrMhmlM523nGcI9oixyGSMmdlHFXpxwpl6nauaqaQwHvgyJzfJsab
         fW2o1fc07j1v5qBIb0st+pGqo/AJxxhAEj2vGro5FGpGRoVu1IlAQIuiyMgAegXgJW3v
         /0M1Tz/cLapmzrvI1tNoZdEf8nYY9LW2jTBipykYsBmeMu3UE7tQwAyBZtydyddMwvpa
         q8czSc04tn/Vg+sRtBx6jzn+uZT3qcldVbY3dus3dpUWrl9Ts2ew6cEYE6RfBnyDkU5i
         FImQ==
X-Gm-Message-State: AOJu0Yx/d6NlXVpFVrL6FYfWLpMbTLeFx6278RCtNTFGW/koAxafO4fs
	RoWU9TD6/HDuptIN4T/vMkP/MFP8DnFe8EJAtVKkXj2IRqblNVTbqhghYsoM4W/UqIwJr8lAqOK
	TuoTWkehouw6Y587U1sNIQAe0O5o=
X-Google-Smtp-Source: AGHT+IHUMaYOGTgK+RnvIZj4DE1FVEUcXcafoRoI1YyaPAB0kLsdo4GRcmUByonmfL4zI4Q8fbXBT9T2+pTV4cvG+FU=
X-Received: by 2002:ac2:47ee:0:b0:511:3058:735c with SMTP id
 b14-20020ac247ee000000b005113058735cmr548346lfp.23.1707183149595; Mon, 05 Feb
 2024 17:32:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705916069.git.haibo1.xu@intel.com> <CAJve8onDbX44Ph6a-FdO2+p7QOQLah-7OyF+yUc06wud+SvmQQ@mail.gmail.com>
 <86zfwe6frn.wl-maz@kernel.org>
In-Reply-To: <86zfwe6frn.wl-maz@kernel.org>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 6 Feb 2024 09:32:17 +0800
Message-ID: <CAJve8okvg=UTWgmE=TpJT=nQJB3i6R_Tn_0AS1MtsD0mP8i3JQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] RISCV: Add kvm Sstc timer selftests
To: Marc Zyngier <maz@kernel.org>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	wchen <waylingii@gmail.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Minda Chen <minda.chen@starfivetech.com>, Sean Christopherson <seanjc@google.com>, 
	Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, 
	Vipin Sharma <vipinsh@google.com>, Thomas Huth <thuth@redhat.com>, 
	Aaron Lewis <aaronlewis@google.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_173233_481098_218411B7 
X-CRM114-Status: GOOD (  10.41  )
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

T24gVHVlLCBGZWIgNiwgMjAyNCBhdCAxMjoyNOKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCAwNSBGZWIgMjAyNCAxMzoxMDoyNiArMDAwMCwKPiBI
YWlibyBYdSA8eGlhb2JvNTV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgTWFyYywKPiA+
Cj4gPiBDb3VsZCB5b3UgaGVscCByZXZpZXcgdGhlIGZpcnN0IDMgcGF0Y2hlcyBpbiB0aGlzIHNl
cmllcz8KPgo+IEZvciB0aGVzZSAzIHBhdGNoZXM6Cj4KPiBSZXZpZXdlZC1ieTogTWFyYyBaeW5n
aWVyIDxtYXpAa2VybmVsLm9yZz4KPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IQoKPiBUaGFua3Ms
Cj4KPiAgICAgICAgIE0uCj4KPiAtLQo+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0s
IHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
