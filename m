Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5736BC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 22:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KrfnmmoGmsm4y8xnrFlTgX7+MAyGVZo7TJNpRxRYS4=; b=ICo5X6ZWeTYJ3A
	USvyWLXZWGHXtudJwCCwyjzslfE/A13j07RrUOoFhjEXBv28j2JiHYtaP3AKLA+MBioVL7V/2yNvg
	Xj9FjXa5YtSckmpISqCRr7EXWeAd4ySTEYRKDaiTDYug8EOpE0Lf8azUZHWf1LD04TPJ2NInLMLN2
	Cn4RzSQwneQWfJvNiqSTLAWGawtx5ytfbHZZ00Qa3+N1teZMloh/s/XIlOo25MSm6+fRsbKhSRrv3
	hzgff1nJFYCz7GuonMQBVhGfe0moTv509MsdW9/oXTn3Expj/cVHe3ZyJJy98HPf8Y1wJeJ6Ez4HX
	QPZBzR0ma5OdbdO6LaNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puh0K-00996k-0B;
	Thu, 04 May 2023 22:00:48 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puftD-008y8c-0r
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 May 2023 20:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ki/0a/hvwKrbevC73y7DQvdxNqgn9S260zdZAiinumA=; b=KcWaWx0KTqmuv4jNThRkOojXuA
	uoePc3hL+15ZKSip/WWDuUYv1q5ueQf/IzkebVnQuQbl1O7lzdwfISypycC/X/zbwKSDAIDO404fp
	0Y6MU4p4ckGWRz5CYhUsEGJpfOtTl0l8adYKjxfb5W4Mi7AZV//Au0mCDleEyyFJZDRiuSKdiGI25
	wC3AF381ZQJrnPVby+3zG3mTo4yJ6g6z8aNeBoWrD8nu8bpqlIcvdSR4LIS+RdiH5siPRFBLugj2c
	9AATHC+/zC41JzA1ieJ1bWBW0Q4Hal6lN2zJHRXE41K6I6jYpc/XqgxZAcPP2qmnQd8XVj5k3JxEH
	0hvOKDpA==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puft5-001qu5-2l
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 20:49:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-24de9c66559so753344a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 13:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1683233352; x=1685825352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki/0a/hvwKrbevC73y7DQvdxNqgn9S260zdZAiinumA=;
        b=VYMfcdFgnD+gQIQTSbP3tk2oMyC39W1Uta2eXXbGeId9d1wA8reaz7Z36R+yVm5549
         VYet11nKae70FwanQAg1yRWDXT229yQXYVTmSoJKiEQrfkRZYgS5JUUDZa+OReHlR02Q
         N6l1Z4MmNSPqzSuuhBiybx/x+X9yCwQl2TWOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683233352; x=1685825352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ki/0a/hvwKrbevC73y7DQvdxNqgn9S260zdZAiinumA=;
        b=MuFWfDvekA2K4DwjsKgVBrD9yGVaNL7gGndGZ9OpZ6WXfATBJG5AU+JQbd6n1ZA2B9
         Ya345KMvo6avAjkEj4cEOiU+vENwpoHpgfGVBS8YATdl/GeQ85Z44R9G/uSrQP91g6pD
         iX/Wfo6zZtaARoyiwxFQrJB/xGFpGFplLHnt4LCWmpftPNs4DxoO1eF5sJaaNblwP7QX
         31Sp0LTEgnm556Y8kF6Pqsgb5OSgN7VBRZDwwA50S6g9ka84Wd/drdg1WbQeS5ubvKoo
         Ltcfc9gofXNkncyZyqqWYVH0tUr1i2mEUw9VLlP60OEweBHujnClsJwSGJQVrsYIqrgl
         ZQTg==
X-Gm-Message-State: AC+VfDyjCufE1zr+kKDwZgNA36Khugcfdh7fixDOtt8ESHm7iVDF1Q8T
	KSt/XmUB1RUlDfZNnFdUAFTo7wtJXwehT1FILyh/
X-Google-Smtp-Source: ACHHUZ5ln6K5ET6JAdjO6RsquM8rbPiu+Sp1q5hxLySx7uHWllujbHXdcaG0WikkygHi8ATA1fCOH+bVxLH6i1eJbxY=
X-Received: by 2002:a17:90a:fb50:b0:24b:3295:3e23 with SMTP id
 iq16-20020a17090afb5000b0024b32953e23mr3214366pjb.19.1683233352246; Thu, 04
 May 2023 13:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230504145453.981767-1-v.v.mitrofanov@yadro.com>
In-Reply-To: <20230504145453.981767-1-v.v.mitrofanov@yadro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 5 May 2023 02:19:00 +0530
Message-ID: <CAOnJCULThWh8RsDX9JHhYYGq_SyrG+jJcrp=UciqDPd73BoFtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] perf: RISC-V: Limit the number of counters
 returned from SBI
To: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
Cc: linux@yadro.com, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_214916_424957_4B191980 
X-CRM114-Status: GOOD (  20.54  )
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

T24gVGh1LCBNYXkgNCwgMjAyMyBhdCA4OjI14oCvUE0gVmlhY2hlc2xhdiBNaXRyb2Zhbm92Cjx2
LnYubWl0cm9mYW5vdkB5YWRyby5jb20+IHdyb3RlOgo+Cj4gUGVyZiBnZXRzIHRoZSBudW1iZXIg
b2Ygc3VwcG9ydGVkIGNvdW50ZXJzIGZyb20gU0JJLiBJZiBpdCBoYXBwZW5zIHRoYXQKPiB0aGUg
bnVtYmVyIG9mIHJldHVybmVkIGNvdW50ZXJzIG1vcmUgdGhhbiBSSVNDVl9NQVhfQ09VTlRFUlMg
dGhlIGNvZGUKPiB0cnVzdHMgaXQuIEl0IGRvZXMgbm90IGxlYWQgdG8gYW4gaW1tZWRpYXRlIHBy
b2JsZW0gYnV0IGNhbiBwb3RlbnRpYWxseQo+IGxlYWQgdG8gaXQuIFByZXZlbnQgZ2V0dGluZyBt
b3JlIHRoYW4gUklTQ1ZfTUFYX0NPVU5URVJTIGZyb20gU0JJLgo+Cj4gU2lnbmVkLW9mZi1ieTog
VmlhY2hlc2xhdiBNaXRyb2Zhbm92IDx2LnYubWl0cm9mYW5vdkB5YWRyby5jb20+Cj4gUmV2aWV3
ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyBpbiB2MjoKPiAtIEFkZCBuZXcgbGluZQo+IC0gU3Vic3RpdHV0ZSBwcl93YXJuIGZvciBw
cl9pbmZvCj4KPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDYgKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IGluZGV4
IDcwY2I1MGZkNDFjMi4uOWQwN2FmMmI2YmUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMKPiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gQEAg
LTg2OCw2ICs4NjgsMTIgQEAgc3RhdGljIGludCBwbXVfc2JpX2RldmljZV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICBnb3RvIG91dF9mcmVlOwo+
ICAgICAgICAgfQo+Cj4gKyAgICAgICAvKiBJdCBpcyBwb3NzaWJsZSB0byBnZXQgZnJvbSBTQkkg
bW9yZSB0aGFuIG1heCBudW1iZXIgb2YgY291bnRlcnMgKi8KPiArICAgICAgIGlmIChudW1fY291
bnRlcnMgPiBSSVNDVl9NQVhfQ09VTlRFUlMpIHsKPiArICAgICAgICAgICAgICAgcHJfaW5mbygi
U0JJIHJldHVybmVkIG1vcmUgdGhhbiBtYXhpbXVtIG51bWJlciBvZiBjb3VudGVyc1xuIik7CgpC
ZWluZyBhIGxpdHRsZSB2ZXJib3NlIHRvIHByb3ZpZGUgYSBjbGVhciBtZXNzYWdlID8KIkxpbWl0
aW5nIHRoZSBudW1iZXIgb2YgY291bnRlcnMgdG8gJWQKCgo+ICsgICAgICAgICAgICAgICBudW1f
Y291bnRlcnMgPSBSSVNDVl9NQVhfQ09VTlRFUlM7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAg
LyogY2FjaGUgYWxsIHRoZSBpbmZvcm1hdGlvbiBhYm91dCBjb3VudGVycyBub3cgKi8KPiAgICAg
ICAgIGlmIChwbXVfc2JpX2dldF9jdHJpbmZvKG51bV9jb3VudGVycywgJmNtYXNrKSkKPiAgICAg
ICAgICAgICAgICAgZ290byBvdXRfZnJlZTsKPiAtLQo+IDIuMzcuMgo+Cj4KCk90aGVyd2lzZSwg
TEdUTS4KUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKCi0t
ClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
