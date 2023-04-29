Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2804C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU03Brm1rDtJhRQ7+CWmcipOTcZQa9cgB8O1iUG6SKc=; b=EWUHZElhJKZxm9
	hoNGaSqaTThUymjCJThcxyC7hZ35bY1yiVu/v+FGjDdxdPoTsrg/9fykputbXa/v5hi5b2nZ6pOmG
	MUdql2KQFuMdwxIQXGdTVThLSGb9MGJLv9wPnmb+LF+zrOjgl9Qn9PCtGtKNaQq4k+nTOE87Qjg9g
	iDh4WT1uVqG46qjSqejneAp+o+RxwErVETw1UwUlEXbdA+ss+b3dsEbewSauTTQLo1l0orCq6+qFX
	CH+sB/a1yMdzyl6Q4ixPv+MxnSzzrttgKqWqzjSw8ZHRES4BLz/V6Jt8hlswgxz/whzyzs2+0bngd
	awGfrJhA/AX38jE+Oopw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psoHG-00Cw1M-0B;
	Sat, 29 Apr 2023 17:22:30 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psoHD-00Cw0q-04
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 17:22:28 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ec8148f73eso1311639e87.1
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682788935; x=1685380935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5lxPzrjhYS+x8oV+yPDIMaFlDt2g4rI2Bd9NsNsMYo=;
        b=D+EFxaAeeM/Mdzjqd66XMj4wliYrzQAG+DP4ocl4uRm12utnu0JmZr/0Gyj4Obx9MY
         UhVF9pToiXvNOCpbgKBQaVRS/wlvwBXn0cTancqDm/MlsL3VRWfro3CjuYU5fDe15/ge
         DPYRwGhV8AszcDxRGNf5pi8XgQlWMrO/z27sePr3CPKyeGWv5UjrR4Tjbnsul1lDWPix
         FroV5od2nVYzRP6ej4bWDaZNXx2Q9LWSwWdfVzcoB/sT6NI2pCy8d9KTX37Pjg7AnuGv
         sAipPqULobXzeHf3e9nRuEPT5GZ21yDk66uiQUqM9CJdoXmHN2mIPfqiFrJnGEONVnJj
         yXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788935; x=1685380935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5lxPzrjhYS+x8oV+yPDIMaFlDt2g4rI2Bd9NsNsMYo=;
        b=jMOc4Ak/Pc1yHa5zlpcPWp9+758XWwBtvGikye1aG4gHGTnUhgHbWbotqONrTVVqiH
         ZXM19Cr44h2T5RDRcOeNMuMrfmDi5Y0pifWXh2a8VXZBFc7wKYlAszL45Zk6tAWm+2mp
         WrPhHBFQhHYkSrpXLWQIqUa78tYUBGwySZj7i7j58mbusDHMJjfULYJ6lTFqev5iFI+x
         CZzTX8/Q/kVrWxBCKjt+rlz/DqNUujkFSd1SeesruaTzK11+zj220QCZa/+jA8+pZnOU
         g6le9alwZy55Ul0uRk3k+dqCtRi7oAizrtyIakcbKzeMALjcbwpWxMV69El3/2p1oqzT
         k8Jg==
X-Gm-Message-State: AC+VfDxW8HB9ykFWghDmxpxiEk7ioa6vxGrpwvDProf3OxIjj2gbRn8/
	/BQUXnkhWTsQPwbu1mlrfWkJThWbjsgD7C3wKGoECg==
X-Google-Smtp-Source: ACHHUZ7ZGFqRXHelEmVWQ/SZrSKIX1h5xJuRe82tOvkh5riAOmsfNIENLCkrrCgnlJcWBNx0eE4Ii2UJu2hPscNca5Y=
X-Received: by 2002:ac2:4d18:0:b0:4db:4530:2b2d with SMTP id
 r24-20020ac24d18000000b004db45302b2dmr2511668lfi.49.1682788935606; Sat, 29
 Apr 2023 10:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230429155247.12131-1-rdunlap@infradead.org>
In-Reply-To: <20230429155247.12131-1-rdunlap@infradead.org>
From: Evan Green <evan@rivosinc.com>
Date: Sat, 29 Apr 2023 10:21:39 -0700
Message-ID: <CALs-HsuG3EFBs60sgiMcPHoE1dF7mhi3GKt=AWvRPaUHAfA88Q@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: fix sifive and thead section mismatches in errata
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_102227_252566_0FF47F59 
X-CRM114-Status: GOOD (  10.40  )
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

T24gU2F0LCBBcHIgMjksIDIwMjMgYXQgODo1MuKAr0FNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IFdoZW4gQ09ORklHX01PRFVMRVMgaXMgc2V0LCBfX2lu
aXRfb3JfbW9kdWxlIGJlY29tZXMgPGVtcHR5PiwgYnV0IHdoZW4KPiBDT05GSUdfTU9EVUxFUyBp
cyBub3Qgc2V0LCBfX2luaXRfb3JfbW9kdWxlIGJlY29tZXMgX19pbml0Lgo+IEluIHRoZSBsYXR0
ZXIgY2FzZSwgaXQgY2F1c2VzIHNlY3Rpb24gbWlzbWF0Y2ggd2FybmluZ3M6Cj4KPiBXQVJOSU5H
OiBtb2Rwb3N0OiB2bWxpbnV4Lm86IHNlY3Rpb24gbWlzbWF0Y2ggaW4gcmVmZXJlbmNlOiByaXNj
dl9maWxsX2NwdV9tZnJfaW5mbyAoc2VjdGlvbjogLnRleHQpIC0+IHNpZml2ZV9lcnJhdGFfcGF0
Y2hfZnVuYyAoc2VjdGlvbjogLmluaXQudGV4dCkKPiBXQVJOSU5HOiBtb2Rwb3N0OiB2bWxpbnV4
Lm86IHNlY3Rpb24gbWlzbWF0Y2ggaW4gcmVmZXJlbmNlOiByaXNjdl9maWxsX2NwdV9tZnJfaW5m
byAoc2VjdGlvbjogLnRleHQpIC0+IHRoZWFkX2VycmF0YV9wYXRjaF9mdW5jIChzZWN0aW9uOiAu
aW5pdC50ZXh0KQo+Cj4gRml4ZXM6IGJiM2Y4OTQ4N2ZkOSAoIlJJU0MtVjogaHdwcm9iZTogUmVt
b3ZlIF9faW5pdCBvbiBwcm9iZV92ZW5kb3JfZmVhdHVyZXMoKSIpCj4gU2lnbmVkLW9mZi1ieTog
UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gQ2M6IEhlaWtvIFN0dWVibmVy
IDxoZWlrb0BzbnRlY2guZGU+Cj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lm
aXZlLmNvbT4KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDYzog
QWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+Cj4gQ2M6IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBDYzogQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPgo+IENj
OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiAtLS0KClRoYW5rcywgUmFuZHkuIEkn
bSBjb25mdXNlZCBhdCBob3cgSSBkaWRuJ3Qgc2VlIHRoYXQgd2hlbiBJIG1hZGUgdGhlCm9yaWdp
bmFsIGZpeC4gSSBmZWVsIGxpa2UgcmVwcm8gb2YgdGhlc2Ugc2VjdGlvbiBtaXNtYXRjaCBlcnJv
cnMKZGVwZW5kIG9uIHNvbWUgb3RoZXIgZmFjdG9yIEknbSBub3QgdW5kZXJzdGFuZGluZy4gSW4g
YW55IGNhc2U6CgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiAgPGV2YW5Acml2b3NpbmMuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
