Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1CED70E0C
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 02:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=352rmfqfpdohr+CmtzPiStQauHhxT9YgVvxOkJ26USI=; b=w68C8ynU7q3iwf
	MARzh4eXpn04BCKwVFxzToYyBfXgMwZ7IG8RmL6XcVyfWbPwSTX8gsOWdOY2SCOYnQTHEIXCIlHjG
	cRguFdBz4Q7QrMf9kfjMBY6Csg3HLnh+/+rWygafPuW/xPtSh6gR5F9IVCf/GgwKgTt+0xI8xsEDf
	+8nGf5ucCthNZY06XUhmMV2PX7qlfzkbuwpLevCojH1gU3O/8MEQMRWppyJGbg/ahuxJYXTO9CUJt
	rzqMC8LKs1kI5EWMFHhnTsqv97g2Hojd4ADHiRwKzPH4vaXpeU8Q+mzSYINgeh99QjcY3MVHU0REP
	0ogqER8LmAS+0c+prLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPqF-00000009SyI-2IzQ;
	Fri, 19 Dec 2025 02:03:39 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPqC-00000009Sxq-3521
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 02:03:38 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-78c5b5c1eccso18905517b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 18:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766109815; x=1766714615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4uRThTCFzR4PpfCdouHob+PVTUEweX/F6eTcDNk5cc=;
        b=P0KwPWWp1mvx/k5Bop+67YQ+tQ/zLLuNfPu98weZ8YMiLu7N+RsPKGGzOl0adBV0k2
         wtlVcsIwfIiNt49XOQrCeIHJGrpzGlkRvntl/zBUk+9OIEQpAf/8xRhtNR3DTFBXmVI5
         F2Rm/hNfeZSvXSFbY3oIxt4t2u358k4UUx6Kny0+CuesA4MYZAuzpSNzVlrasW3cV2Wt
         S9xgLOWiVuWVFlJ+776A/9rjUcrRky0Zsmea23Ttu6x4vDGYB+vH6vNqN8WypQOnDnC+
         pm7qrP7m0TzEYOUiflPrnluFfHtCwTDaJRwNOvQ0OdisYdVd4cn/wacbl8MGIxnBGF9l
         +Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766109815; x=1766714615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4uRThTCFzR4PpfCdouHob+PVTUEweX/F6eTcDNk5cc=;
        b=EmJmQgmMB84RgMyECM30FgKz6tmREG63wLN03f4yyLhheAnx6uWQxBX77CM628sa1K
         ZJIYzVcuO3I9ClRmxQKFxFPLqyekdv+6mCOOnol2xSyY7W3yrORbBdPf27wfBfo54tUb
         uA4bPEWXRj4qcwU7k7yGIdAkteQ/9PwbyUFi6qZGDgBPbcZwA6/jZYNAsEjxv6UqhYQV
         vVv965hTPo70klkxZS2d0nXT+lFjxr4hdTbaW4csDMbzByasjZvLeFgAkPBwZTcSSxa0
         YtekAFJ0X501Awpun8B3xk4kZRP/Nxoz2PyWgMM7U115bQ8ju8jICXstcudc8CTUTXAu
         oltQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9+bkMcO63s2+NiO330XdNf4IZnZ+x4hMWvdG3GN0XhrWPlacZCmyifeQYStLleL5K6xB4RsFhv1a9eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcdQ/PGBS6OpggeEw+v8NoDCLIa50RCXwdPCXytlrOKLi6MWyt
	qUHvw8lM/c/WYMg2QfE6r+DcvCnZey6ofl6k8k+jpD6oNx7lyQsA0xl3LNvpsA0DHvUAsnHGtGV
	e1BDqx66BNeaRu6BED3AQReQ3szol3OqAFVx1Wntipw==
X-Gm-Gg: AY/fxX6M6rXeLfzJQlzVI9bVe5p1X17hRs+a/SBtccggCSPEukqytKS0g9oFs2wHpvJ
	YgOzrSEzUBpd4yYjP47x2QQ4RcXdkOwmdJNL8ToI5uyLrdTcYIPkXr/dSNwOyegCrl/1isbwxya
	vahZkNJrXEj2LEgIEEm8QVUsJikXYc4q9+tOjvLtAsO5GxNsTyJXS3CLDiUDoGQTrEHXoAITsQh
	EATQisjNIfpkN8H8ch0uEIEaqmEYQZS2fP1EDsvQb3Adz3xpUffJEbCxHOI1jjMe8zvQXk5+w8O
	Tg3A8dC/etLpNWYNxt108XuYbyRr9ovJeVwe0b2HT4kG
X-Google-Smtp-Source: AGHT+IF3DTQjhYXxXW02+36G3FZkGzFfPUCBGdfYMLCgAD9oY3x9lyfyI9hU1jICZ90CgmmUFuzjagYwpgVNhEXch9g=
X-Received: by 2002:a05:690c:e3ed:b0:786:5d0a:c273 with SMTP id
 00721157ae682-78fa5b378bfmr42599997b3.23.1766109815187; Thu, 18 Dec 2025
 18:03:35 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com> <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com> <20251218-basil-quantum-225ce16e4699@spud>
In-Reply-To: <20251218-basil-quantum-225ce16e4699@spud>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 19 Dec 2025 10:03:24 +0800
X-Gm-Features: AQt7F2pwbMDoA8a91avNmO8QE-jXZtj0DvWYaFdgnJLNRPa-LseO9ZnPDmTIGAk
Message-ID: <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Conor Dooley <conor@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_180337_027400_FDC0649C 
X-CRM114-Status: GOOD (  19.73  )
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

SGksIENvbm9yIGFuZCBIZWlucmljaAoKT24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgODo1NuKAr0FN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIERlYyAx
NywgMjAyNSBhdCAwOTowNzoxNEFNICswMTAwLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+
ID4gT24gMTIvMTcvMjUgMDg6MTEsIEd1b2RvbmcgWHUgd3JvdGU6Cj4KPiA+ID4gU3BlY2lmaWNh
bGx5LCBJIG11c3QgYWRoZXJlIHRvCj4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgKGFuZCBjcHVzLnlhbWwgZm9yCj4gPiA+IHByb3Bl
cnRpZXMgbGlrZSAncmlzY3Ysc3YzOScgd2hpY2ggc3RhbmRzIGZvciB0aGUgZXh0ZW5zaW9uIFN2
MzkpLiBJZiBJCj4gPiA+IGFkZCBleHRlbnNpb24gc3RyaW5ncyB0aGF0IGFyZSBub3QgeWV0IGRl
ZmluZWQgaW4gdGhlc2Ugc2NoZW1hcywgc3VjaCBhcwo+ID4gPiBzdXBtLCBydW5uaW5nICdtYWtl
IGR0YnNfY2hlY2sgVz0zJyBmYWlscyB3aXRoOiAnc3VwbScgaXMgbm90IG9uZSBvZgo+ID4gPiBb
J2knLCAnbScsICdhJywgLi4uXSwgZm9sbG93ZWQgYnkgIlVuZXZhbHVhdGVkIHByb3BlcnRpZXMg
YXJlIG5vdCBhbGxvd2VkLiIKPiA+Cj4gPiBJZiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGlzIGluY29tcGxldGUKPiA+IHdpdGggcmVzcGVj
dCB0byByYXRpZmllZCBleHRlbnNpb25zLCBJIGd1ZXNzIHRoZSByaWdodCBhcHByb2FjaCBpcyB0
byBhbWVuZAo+ID4gaXQgYW5kIG5vdCB0byBjdXJ0YWlsIHRoZSBDUFUgZGVzY3JpcHRpb24uCj4K
PiBBYnNvbHV0ZWx5LiBJZiB0aGUgY3B1IHN1cHBvcnRzIHNvbWV0aGluZyB0aGF0IGlzIG5vdCBk
b2N1bWVudGVkLCB0aGVuCj4gcGxlYXNlIGRvY3VtZW50IGl0IHJhdGhlciB0aGFuIG9taXQgZnJv
bSB0aGUgZGV2aWNldHJlZS4KClRoYW5rcyBmb3IgdGhlIHJldmlldy4gTWF5IEkgY2xhcmlmeSBv
bmUgdGhpbmc/IEJvdGggb2YgeW91IG1lbnRpb25lZApkb2N1bWVudCB0aGVtLCBnaXZlbiB0aGUg
YW1vdW50IG9mIG1pc3NpbmcgZXh0ZW5zaW9ucywgaXMgaXQgYWNjZXB0YWJsZSBpZgpJIHN1Ym1p
dCBhIHByZXJlcXVpc2l0ZSBwYXRjaCB0aGF0IG9ubHkgZG9jdW1lbnRzIHRoZXNlIHN0cmluZ3Mg
aW4KcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHBsdXMgdGhlIG5lY2Vzc2FyeSBod3Byb2JlIGV4cG9y
dD8gTGVhdmluZyB0aGUgYWN0dWFsCnVzYWdlIG9mIHRoZXNlIGV4dGVuc2lvbnMgKG5hbWVkIGZl
YXR1cmVzKSB0byB0aGUgZnV0dXJlIHBhdGNoZXMuCgpUbyBwcm92aWRlIHNvbWUgY29udGV4dCBv
biB3aHkgSSBhc2s6IEkndmUgaW52ZXN0aWdhdGVkIHRoZSBjb21taXRzICYgbGttbApoaXN0b3J5
IG9mIFJJU0MtViBleHRlbnNpb25zIHNpbmNlIHY2LjUsIGFuZCBJIHN1bW1hcml6ZWQgdGhlIGN1
cnJlbnQgc3RhdHVzCnJlZ2FyZGluZyB0aGUgUlZBMjMgcHJvZmlsZSBoZXJlOgpbMV0gc3RhdHVz
IGluIHY2LjE4IChpbmMuIHY2LjE5LXJjMSk6Cmh0dHBzOi8vZG9jdWxhcnh1LmdpdGh1Yi5pby9y
dmEyMy9saW51eC1rZXJuZWwtY292ZXJhZ2UuaHRtbApbMl0gc3VwcG9ydCBldm9sdXRpb24gc2lu
Y2UgdjYuNToKaHR0cHM6Ly9kb2N1bGFyeHUuZ2l0aHViLmlvL3J2YTIzL3J2YTIzLWtlcm5lbC1z
dXBwb3J0LWV2b2x1dGlvbi5odG1sCgpTdHJpY3RseSBkZXNjcmliaW5nIHRoZSBTcGFjZW1pVCBY
MTAwL0szIChvciBhbnkgY29yZSkgYXMgUlZBMjMtY29tcGxpYW50CnJlcXVpcmVzIGFkZGluZyB0
aGVzZSBleHRlbnNpb25zIHRoYXQgYXJlIGN1cnJlbnRseSBtaXNzaW5nIGZyb20KdGhlIGtlcm5l
bCBiaW5kaW5nczoKUlZBMjNVNjQ6IFppY2NpZiwgWmljY2Ftb2EsIFppY2Nsc20sIFphNjRycwpS
VkEyM1M2NDogU3MxcDEzLCBTc2NjcHRyLCBTc3R2ZWNkLCBTc3R2YWxhLCBTc2NvdW50ZXJlbncs
IFNzdTY0eGwsCiAgICAgICAgICBTaGEsIFNoY291bnRlcmVudywgU2h2c3R2YWxhLCBTaHR2YWxh
LCBTaHZzdHZlY2QsIFNodnNhdHBhLCBTaGdhdHBhClBsdXMgJ1N1cG0nLCAnWmljNjRiJywgJ1Nz
c3RhdGVlbicsICdCJyB3aGVyZSB0aGUga2VybmVsIHN1cHBvcnRzIHRoZW0gYnV0CnRoZXkgYXJl
IG5vdCBsaXRlcmFsbHkgZG9jdW1lbnRlZCBpbiB5YW1sLgoKSXMgdGhpcyBhcHByb2FjaCBhY2Nl
cHRhYmxlIHRvIHlvdT8gSWYgc28sIEkgd2lsbCBwcm9jZWVkIHdpdGggc3VibWl0dGluZyB0aGVt
LgoKVGhhbmsgeW91IHZlcnkgbXVjaC4KCkJlc3QgcmVnYXJkcywKR3VvZG9uZyBYdQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
