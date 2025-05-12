Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27E6C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 03:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtTbTmDogIcyJItIyda0wuDJkESP38cCZrgkXHnSCvo=; b=R6hU1tE298H5Ky
	b7RROERTYD1CfTNQ/7SBtUvtmYi8EBRKm9zSS8PMzLbQH4cTZsAtTuRNvqkQfBEl5Lz05We2GAtlT
	H8IvvTzW+ghor/wiPIyN4/7yf7JVrkESfIjkKKcVVjMFnSdIqfKIVMnm1arNbMNh6DVwifmIRH1G7
	1Hud/BDg/CMOy++KsAnN8AR38L8xeKxGInv/ddNoQrJE89v6NcZvBXZHKA9kj/bQoSxGrxWyW0VQa
	T0Bwa2e3n87ntrTEPvK4yyjXmMK+b77u3jYxHshkaDf5m2z9qo1+AgNfu5I1fKYYqXyb1jQ+8FMbp
	JF8hGgEe7D856TudVVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJqk-00000008HIV-2GT1;
	Mon, 12 May 2025 03:29:06 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJqh-00000008HI7-2NMq
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 03:29:04 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e6df1419f94so3145717276.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 20:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747020542; x=1747625342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmqsshPmY7H9QOb+mn4lTusa/z2qhgLdDUm/2L4LcwE=;
        b=YlmjiF0NeCk0FETLoOkNqbM9gMViGttiY/h+FzbsElIGdVBvfJfZtcWF/3iP8Mn5fV
         jQb6vhlbdV7kz+cMdPgFUDYMrDalMc1adpT0ON/ES/Cnzpx41L0kuU9jvUCPQRHy083k
         LRyVF1hKDoKMrlRnP793Wk2KG+JhFHgWLcFwBJSRvZf1Y3yoZcKimluGx1+sdt2KLFaK
         70KbBeGSCWWBJSyQTZ1k/D3W5tHFg5mBbEuMkL0cs/WjIhz4wcYFHaPV2do0PHIu2YOo
         O/+lIjmXvWq26KEdnBFa/51cJDMWMi8TudZP3EoZtojahb7FKLmEXo92zBE6QuKcBgfm
         gVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747020542; x=1747625342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmqsshPmY7H9QOb+mn4lTusa/z2qhgLdDUm/2L4LcwE=;
        b=r2WQEEOpkARnoVLKsGbFIylE8wH/L2oSNBURmVAUD3ecq+rFdwdQMjdOYqB4uljZ2B
         MJr4KQ/3ldrU0KfnGddEBCU30frqZzqK67v6zEoGUWYQkyx8eLNwjG7RIvVhjS44iMBB
         SLC/Rb7kybxXYGDLbapVNUtT3xbMpPFXlLXbg5YHygyChX1AXO7F1NUy3ujhI9HvfYRg
         MqtkXBO0Tqb/ixiFjHNQ9i/26+xubOYQgf+3D6w3/oHleLPViBL41679q5JIwqq2aBO0
         KuJILfArISvv97LlzDJkJKrHU+ym5YU6VLuPkk1gWeGSQEnicedtDJ54WPKIJAze4GOM
         c4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCV31cUXFmaBcB1TZnxY2brhevUBdvzDYUvxfEXAaYKVwNDe1l1KvwdFdCqY6YaNtpWTWaXTp1PN6SE1XQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOEdAaV/4+oTjakg7na6djRAlrCW0w9Ab8k3ZnnN1lDa+G0U1n
	BuqUgr4aon9dSVQ1ipMctjmiU15P7anc5qoffTnX6jhaPvmfhazGFdQ5zq6KCr9vAOPgjM99yrF
	F2tHXDXeSkElxoHkcng8G11cqnLb0GxBU85oqWQ==
X-Gm-Gg: ASbGncu8mVkszxtik2/EXhVxHmWHsVIjh8yfwomsIY84Pj9Fdde4bDTMmyL2G1WYpxf
	CnNlF3aTor/LgU2mpoh4IJO+InN4Aoi0bzmJyA80DPuKZy2JbhGvJP7c+Yp8hYN/ZdBhsMJ6JJV
	nl7naJRRqBe5tWwpK3YB075vL6Pkvfbt3SPzQ=
X-Google-Smtp-Source: AGHT+IEFaNiH4m8SfL7s95SR1yaroida1cIZ6e04N6YGot2PHwDpN08d57NAQJEqGB4qgW357SQelDenklQ6NVilKz4=
X-Received: by 2002:a05:6902:e02:b0:e73:2da2:c300 with SMTP id
 3f1490d57ef6-e78fdda3cecmr15370879276.44.1747020542325; Sun, 11 May 2025
 20:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250509021605.26764-1-nick.hu@sifive.com> <20250509-small-graceful-limpet-d0ea41@kuoka>
 <20250509-subtract-caramel-08d47ed3281c@spud> <c91d99c9-0ecb-4dcd-9beb-5a1e9fadc619@kernel.org>
In-Reply-To: <c91d99c9-0ecb-4dcd-9beb-5a1e9fadc619@kernel.org>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 12 May 2025 11:28:51 +0800
X-Gm-Features: AX0GCFu8apu7KqsRMVT6pTWyP_dDY5ZSOdIicXfNhfDZ3ehPXy6u4YhVzFdti1c
Message-ID: <CAKddAkDvJcXoAtgvgVBhMOY-NUwdkjUODytGqXeZgfybPRmbfA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Cyan Yang <cyan.yang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_202903_679671_CEB0BC61 
X-CRM114-Status: GOOD (  18.09  )
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

T24gU2F0LCBNYXkgMTAsIDIwMjUgYXQgMTA6NTfigK9QTSBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDkvMDUvMjAyNSAxNzo1NywgQ29ub3IgRG9v
bGV5IHdyb3RlOgo+ID4+PiArICAgICAgICAgIC0gcGF0dGVybjogIl5zaWZpdmUsW3RzXW1jMSQi
Cj4gPj4+ICsgICAgICAtIGl0ZW1zOgo+ID4+PiArICAgICAgICAgIC0ge30KPiA+Pj4gKyAgICAg
ICAgICAtIGNvbnN0OiBzaWZpdmUsY21jMwo+ID4+PiArICAgICAgICAgIC0gY29uc3Q6IHNpZml2
ZSxjbWMyCj4gPj4+ICsgICAgICAtIGl0ZW1zOgo+ID4+PiArICAgICAgICAgIC0ge30KPiA+Pj4g
KyAgICAgICAgICAtIGNvbnN0OiBzaWZpdmUsY21jMgo+ID4+Cj4gPj4gQWxsIG9mIHRoaXMgaXMg
anVzdCB1bmV4cGVjdGVkLiBXaHkgYW55IGNvbXBhdGlibGUgc2hvdWxkIGNvbWUgd2l0aAo+ID4+
IHRoZXNlPwo+ID4KPiA+IEl0J3MgYWxzbyBub3QgcXVpdGUgY29ycmVjdCBlaXRoZXIsIHJpZ2h0
PyBPciBtYXkgbm90IGJlIGNvcnJlY3QgYXQKPiA+IGxlYXN0LiBJdCBwZXJtaXRzICJ4eHgiLCAi
dG1jMiIsICJzbWMxIiBhbmQgInh4eCIsICJzbWMyIiwgInRtYzEiCj4gPiB3aGljaCBtZWFuIHRo
YXQgdGhlIHNtYyBhbmQgdG1jIG11c3QgYmUgaWRlbnRpY2FsIGluIHRlcm1zIG9mCj4gPiBwcm9n
cmFtbWluZyBtb2RlbC4KPgo+IFllcAo+Cj4gPgo+ID4+IFlvdSBuZWVkIHRvIHVzZSBTb0Mgc3Bl
Y2lmaWMgY29tcGF0aWJsZXMuCj4gPgo+ID4gSSB0aGluayB0aGVyZSdzIHNvbWUgc2xhY2sgdG8g
cHJvdmlkZSBoZXJlLCBzaWZpdmUgYXJlIHVwc3RyZWFtaW5nIGl0IGluCj4gPiBhZHZhbmNlIG9m
IHRoZXJlIGJlaW5nIGN1c3RvbWVycyAob3IgY3VzdG9tZXJzIHJlYWR5IHRvIHVwc3RyZWFtKSBh
bmQgdGhpcwo+ID4gZm9ybWF0IGFsbG93cyB1cyB0byBhY2NlcHQgYmluZGluZ3MvZHJpdmVycyBh
bmQgdGhlIGN1c3RvbWVyIHdpbGwgaGF2ZQo+ID4gdG8gYWRkIGEgc29jLXNwZWNpZmljIGNvbXBh
dGlibGUgaW4gb3JkZXIgdG8gYWN0dWFsbHkgdXNlIHRoZXNlIGluIGEKPiA+IGR0cy4gSSB0aGlu
ayBpdCdzIGJldHRlciB0byBhY2NlcHQgc29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzIHRoYW4K
Pgo+IFN1cmUsIGNvbW1pdCBtc2cgc2hvdWxkIGV4cGxhaW4gdGhhdCBhbmQgcHJvYmFibHkgdGhl
c2Uge30gd2lsZGNhcmRzCj4gc2hvdWxkIGhhdmUgY29tbWVudCBhcyB3ZWxsLgo+CkknbGwgdXBk
YXRlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uIFRoYW5rcy4KCj4gPiBzdGFsbCBvdXQgdW50aWwg
YSBjdXN0b21lciBkZWNpZGVzIHRvIHVwc3RyZWFtIHRoZWlyIHVzZXIuIFRoYXQgc2FpZCwgSQo+
ID4gd291bGQgZXhwZWN0IHRoaXMgdG8gY29tZSAoYXMgeW91IG1lbnRpb25lZCBhYm92ZSkgd2l0
aCB0aGUgZHJpdmVyLgo+ID4KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
