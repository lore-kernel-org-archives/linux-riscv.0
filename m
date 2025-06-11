Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FA2C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3+N2SkQetzXH9BjCD+Ow/aa0r9+NziT9yovQOh6LY4=; b=TlpRFXsPZ83BCx
	aHKtq3Gu+B7kDZkVlKWu9RHea43cMAgokcAQ3yhOOAmtlexydB5TCpoeWf0onRMApau0H14gk2y/t
	qAzI84SeZr0X4JnVTJHjbtQzHmgOkVwQ1adQQzMfBiIVvchde3Mg+nao1kWOkb3fazDX51UcwD7Lk
	bD7OmzQhuGGSfEtZ1gr6ffn30yrEaJ6DZpFL9hREh/16LY3d7UeSvbWDqEMfg4CGDiartCNfRu5Dd
	5e/D1d0I776KBgBx+4GSd+Ri1C6PaRoWafJRPWYyu4ola4kQNjNgXrSYdWT2FstLhyzk+zm3fAKEc
	7BXqH9U3b4Ym5nwQnQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPl1-0000000AoAs-3jW0;
	Wed, 11 Jun 2025 18:01:03 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMVN-0000000A75c-28SH
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 14:32:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso1255402966b.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749652360; x=1750257160; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60kjyrVoPLH2Ifa+97Mi20o2GvNQ5P+ZX0EZmjkoYqM=;
        b=c+JQ8axCvRXz0Om/Y/BzhAn/Cuaj1XBBoWABjlOkzXKxywKjB/oRQQlc5zlL+PEI1N
         /YiAxrlnObUsNkpTIcHxDuGK2/DVorCFDwSM/6b/uZZXMq/dxtlVs+3noV21pzlmo4ok
         qqJRflq4dW4JoKj6fH4QsLNKBfZQOUdY1fBTr2xAKx0GIcADjHb456BqS5TP3C04OGyc
         L18EKtF4gZneTkHCCvFxdvA7IB2Aq7qMFsCik/STqPcfA+77/8LUVGRML69Xa1nsWSOE
         tE4kGuqHYaDeUA2XtLRZAUmWPsrNQMaJPoEyAm8OZ3PLukMgQjB8vVldHQqy/CAP4N+V
         Tk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652360; x=1750257160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60kjyrVoPLH2Ifa+97Mi20o2GvNQ5P+ZX0EZmjkoYqM=;
        b=R9AJ9X8uRQv3l7F9TR7YNYe0kKAR7I0kyhSOzmivux9EgotfBwjbh6YvygAu+N1kcl
         vmBDLMn/iRATTEwLqRwatCAD6Ru5y5sK8/tOag0gKd6kXQxOPs+Si4sBhPY8ZDK1HRmw
         wIn1NtDbyLsV1+OS72eyHhd2irkZK2K5DJxXnYptP0fYdPw8vrkYzbSn/IhaIt4QGLQF
         hd1eXwBszK/xUmaHf/LRki0vxZEAOrTDOPCjsJXmv/9+IkEgZegrmCBxfdOtIkbg5yHs
         dJ9yJK/r3LKK1Decc7W+R6DTzBqWtFfIsIh9KBOyVGuKcpAdjgwYJ9l1qSJqMskA2cTU
         IiDw==
X-Forwarded-Encrypted: i=1; AJvYcCUyQaa7ELDCFRFAtH6iA7aOEYnfcpFRF2gV+756INdsXiH0xsV8GG3tchAptZXLbAeg6aca68LZ4Zbgeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiocHILCfJ+iuYqTXqMwFL98VDZ7QCEprmyA8YJJP5rvVtVNPu
	AqsAygq7r+Fg5hsmnwawzmi7XU2vyUw3x+w2CPU8Ipdg4165O2EHEHsoEiiDucaudUW2AV9nPIi
	dPfSvV9z60p4Jw4cYXT613G1wxSu6ctMwKIrofKjFeQ==
X-Gm-Gg: ASbGncsxRLFdnH16ujJqkum/R67ojua24w756yFxxUs7I6kCGdbsCMb2D+A2vyv+tXF
	QmsOKP8sPx/0ia+g68k/9KyOrsJUWKzAiGORzu8COelF9226VbAnQIOE9YJPqLhAsZejaC/Nbtc
	g2LXabVTqf+AuKewlNmHjSE7lq34kfbJ5CSPOJYUs57cAq
X-Google-Smtp-Source: AGHT+IEzETwYHx0nLbiFdWUeLmV4KrW57JrGro1I3zlSg5jafQBDwMDY2f+YekL/HJyWs+OOnv2PB4JAvv0sXW+xiFM=
X-Received: by 2002:a17:907:3e1b:b0:ad2:4fa0:88cd with SMTP id
 a640c23a62f3a-ade893e3192mr285970566b.9.1749652359722; Wed, 11 Jun 2025
 07:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-7-guodong@riscstar.com>
 <20250611135757-GYC125008@gentoo>
In-Reply-To: <20250611135757-GYC125008@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 11 Jun 2025 22:32:27 +0800
X-Gm-Features: AX0GCFsCOSkDRyqL6Nxt48HaUVxbrrOp5EdO9-GyXjMkq6GZqJ07_JcYpuCfhG4
Message-ID: <CAH1PCMbt3wLbeomQ+kgR6yZZ18TZ=_LF-kCcnLqad55FSHBhDA@mail.gmail.com>
Subject: Re: [PATCH 6/8] riscv: dts: spacemit: Enable PDMA0 controller on
 Banana Pi F3
To: Yixun Lan <dlan@gentoo.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_073241_628679_EFB9667E 
X-CRM114-Status: GOOD (  18.47  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgOTo1OOKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IEhpIEd1b2RvbmcsCj4KPiBPbiAyMDo1NyBXZWQgMTEgSnVuICAgICAs
IEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBFbmFibGUgdGhlIFBlcmlwaGVyYWwgRE1BIGNvbnRyb2xs
ZXIgKFBETUEwKSBvbiB0aGUgU3BhY2VtaVQgSzEtYmFzZWQKPiA+IEJhbmFuYSBQaSBGMyBib2Fy
ZCBieSBzZXR0aW5nIGl0cyBzdGF0dXMgdG8gIm9rYXkiLiBUaGlzIGJvYXJkLXNwZWNpZmljCj4g
PiBjb25maWd1cmF0aW9uIGFjdGl2YXRlcyB0aGUgUERNQSBjb250cm9sbGVyIGRlZmluZWQgaW4g
dGhlIFNvQydzIGJhc2UKPiA+IGRldmljZSB0cmVlLgo+ID4KPiAgIEFsdGhvdWdoIHRoaXMgc2Vy
aWVzIGlzIGFjdGl2ZWx5IGRldmVsb3BlZCB1bmRlciBCYW5hbmFwaS1mMyBib2FyZAo+IGJ1dCBp
dCBzaG91bGQgd29yayBmaW5lIHdpdGgganVwaXRlciBib2FyZCwgc28gSSdkIHN1Z2dlc3QgdG8g
ZW5hYmxlCj4gaXQgdG9vLCB0aGFua3MKPgoKSSdkIGJlIGdsYWQgdG8gaW5jbHVkZSB0aGUgSnVw
aXRlciBib2FyZCBhcyB3ZWxsLiBTaW5jZSBJIGRvbid0IGhhdmUgSnVwaXRlcgpoYXJkd2FyZSBm
b3IgdGVzdGluZywgY291bGQgc29tZW9uZSB3aXRoIGFjY2VzcyB2ZXJpZnkgaXQgd29ya3MgYmVm
b3JlIEkKYWRkIGl0IHRvIHRoZSBzZXJpZXM/CgotR3VvZG9uZwoKPiA+IFNpZ25lZC1vZmYtYnk6
IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNj
di9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMgfCA0ICsrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPiA+IGluZGV4IDIzNjNmMGU2NTcyNC4u
MTE1MjIyYzA2NWFiIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1p
dC9rMS1iYW5hbmFwaS1mMy5kdHMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazEtYmFuYW5hcGktZjMuZHRzCj4gPiBAQCAtNDUsMyArNDUsNyBAQCAmdWFydDAgewo+ID4g
ICAgICAgcGluY3RybC0wID0gPCZ1YXJ0MF8yX2NmZz47Cj4gPiAgICAgICBzdGF0dXMgPSAib2th
eSI7Cj4gPiAgfTsKPiA+ICsKPiA+ICsmcGRtYTAgewo+ID4gKyAgICAgc3RhdHVzID0gIm9rYXki
Owo+ID4gK307Cj4gPiAtLQo+ID4gMi40My4wCj4gPgo+ID4KPgo+IC0tCj4gWWl4dW4gTGFuIChk
bGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
