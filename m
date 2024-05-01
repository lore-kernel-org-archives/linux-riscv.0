Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651D7C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 18:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buf0G+kvG+ziHrlo81CFxnEYfx3NlGYahqJRvUoiK7Q=; b=U6MsU8tIRPv4yd
	X7OxA04X7N1PwuEtFfKbzEfpTUtGJBP/mLYYePshwOMjhEplVfsSNrXA2ybmoHfjrJahywBh06HKf
	aQo3MCRbeZQzKCCbDWB5Hvi4ocETmuFVuxovPaYrrZgPo8t3otVOORU5ck4SMHsAn/W2CzacyOcpx
	Iir5baoYGHTmCSdPJGauyIfO6n5Q67ZCB6UDUClXmCP3/eS6fZAo/XAkiqPGl9X/mNVk4mJiN928P
	5ZRfZpW7DIeGWciLI9OlsGYjH9nevM9864AekuQfaQQbmPl5rkTdCvnzCEQsbAXgJcND0rAWEFanr
	hOUi6ZNVipSZHdYDFCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Epu-0000000AR9G-0rzF;
	Wed, 01 May 2024 18:37:46 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Epp-0000000AR7W-24DI
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 18:37:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ed627829e6so8378453b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 11:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714588659; x=1715193459; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UPPZ5LFjy8shqZnGR3m66PAl3+HNQfmLTm+BXjtgDiI=;
        b=F5MljuIp5A13QK5wreLhYPpt0DU9chosuEtDQ088/b71Tta16zyG2YrfQEn82LfAy4
         6QQx582863iR0Ziu9A4SMwXP6Li2TnF4u7zj9+PHoKpsHPLh5lW0ToD6DnDJtyz601y+
         AM2cfVB7m0wBJCOYHVQtzixBpFwFhYahzdv6onh71exJMGOJ8dty2rSuCDkrJog1LD7Z
         oCk8U+S0NcFwxYipdJOBwIaw/bqZ9BGRAlQl/bqAD3s1zbp2dXjjmCQLiqHfBeApKFFG
         KDt6Y2j75saANl48LBidvUT3xy7RfWjc1/Vz9+lxZa2qzO1rj4AkZE/+rsYp5Ts76Vve
         PyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714588659; x=1715193459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UPPZ5LFjy8shqZnGR3m66PAl3+HNQfmLTm+BXjtgDiI=;
        b=L+T3+qNDpug0RwG90qLX8dEdPb1X+T6vKdAFZHb6NpRH61T7cgzJnVSXofC8MGsKxX
         /EySELOaW838ZiH6RopDlWKp5wRwNt+uxCzHpDrHbSga/HmZOvXpToqLRWqb8wxQ1ph2
         5Oo/Yhv7E17eFRr+OfwHPUDv04dDRYhDeih2K8BlF4bpgJDpAdn7bOue2qLAMrMpOxcQ
         fhnYc+d4xst1j0DjNIay9vOcnel+krc93Ys8WtKVSSzx5I7TzDvecInM+4s3KIfBhg4B
         24wC8RY2QtwqnnoEfL3UQpytoTKbMLAG93ipaYF/iMPhjuWW72oN9Fc4AHsyv1GVfzhQ
         LiRw==
X-Forwarded-Encrypted: i=1; AJvYcCU39I20ee3bOj60j2Kg19MR8Zm4wpKthFkHIHAsPp6Lo43k0I8U7Ji+E/DoUELYeKclm2WViRlCZw5lEIbJ8srM/kBr2LjjfVnUb+e+emWa
X-Gm-Message-State: AOJu0YwFNjF+4TaadNn/NH5Znkald5hMf7novTJ20BfuNXkth+FwsubH
	YjAAGLpE3EXaT5WHwNtmp54egKTly9FjKuEInXo0UKTtuRyjKIJ2Tyl6aAFU8rU=
X-Google-Smtp-Source: AGHT+IFvmfcgG9gsaJ1/osT3hsX+JLkHUCdFQSUoli8OLgDET6zbJ2GqgYGb+4vjIsoV+zp3JnL2Pg==
X-Received: by 2002:a05:6a20:8425:b0:1a7:3b4a:3e8 with SMTP id c37-20020a056a20842500b001a73b4a03e8mr4113035pzd.7.1714588659240;
        Wed, 01 May 2024 11:37:39 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090ab78800b002b15e6ec4efsm1672349pjr.15.2024.05.01.11.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 11:37:38 -0700 (PDT)
Date: Wed, 1 May 2024 11:37:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <ZjKL7x+s5AYzdCGE@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <CALs-HstM64Hy_=XVz=0sWQt=8j1u+bq6RhthUuD3P0E4=HyvcA@mail.gmail.com>
 <ZjKBKg5zzikR5ngl@ghost>
 <20240501-banner-sniff-4c5958eb15ef@spud>
 <20240501-moneyless-shifter-a54bbaecc4e7@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-moneyless-shifter-a54bbaecc4e7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_113741_569630_51CEEE51 
X-CRM114-Status: GOOD (  23.51  )
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

T24gV2VkLCBNYXkgMDEsIDIwMjQgYXQgMDc6MDk6MjhQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFdlZCwgTWF5IDAxLCAyMDI0IGF0IDA3OjAzOjQ2UE0gKzAxMDAsIENvbm9yIERv
b2xleSB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDAxLCAyMDI0IGF0IDEwOjUxOjM4QU0gLTA3MDAs
IENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4gT24gV2VkLCBNYXkgMDEsIDIwMjQgYXQgMDk6
NDQ6MTVBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+ID4gPiBPbiBGcmksIEFwciAyNiwg
MjAyNCBhdCAyOjI54oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4g
d3JvdGU6Cj4gPiA+ID4gPiArICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgcmlzY3ZfaXNhX3Zl
bmRvcl9leHRfbGlzdF9zaXplOyBpKyspIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgcmlzY3ZfaXNhX3ZlbmRvcl9leHRfZGF0YV9saXN0ICpleHRfbGlzdCA9IHJpc2N2
X2lzYV92ZW5kb3JfZXh0X2xpc3RbaV07Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgaWYgKGJpdG1hcF9lbXB0eShleHRfbGlzdC0+dmVuZG9yX2JpdG1hcCwgZXh0X2xpc3Qt
PmJpdG1hcF9zaXplKSkKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJpdG1hcF9j
b3B5KGV4dF9saXN0LT52ZW5kb3JfYml0bWFwLAo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZXh0X2xpc3QtPnBlcl9oYXJ0X3ZlbmRvcl9iaXRtYXBbY3B1XS5p
c2EsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBleHRfbGlz
dC0+Yml0bWFwX3NpemUpOwo+ID4gPiA+IAo+ID4gPiA+IENvdWxkIHlvdSBnZXQgaW50byB0cm91
YmxlIGhlcmUgaWYgdGhlIHNldCBvZiB2ZW5kb3IgZXh0ZW5zaW9ucwo+ID4gPiA+IHJlZHVjZXMg
dG8gemVybywgYW5kIHRoZW4gYmVjb21lcyBub24temVybz8gVG8gaWxsdXN0cmF0ZSwgY29uc2lk
ZXIKPiA+ID4gPiB0aGVzZSBtYXNrczoKPiA+ID4gPiBjcHUgMDogMHgwMDAwQzAwMAo+ID4gPiA+
IGNwdSAxOiAweDAwMDAwMDAzIDw8PCB2ZW5kb3JfYml0bWFwIEFORHMgb3V0IHRvIDAKPiA+ID4g
PiBjcHUgMjogMHgwMDAwMDAxMCA8PDwgb29wcywgd2UgZW5kIHVwIGNvcHlpbmcgdGhpcyBpbnRv
IHZlbmRvcl9iaXRtYXAKPiA+ID4gPiAKPiA+ID4gCj4gPiA+IEh1aCB0aGF0J3MgYSBnb29kIHBv
aW50LiBUaGUgc3RhbmRhcmQgZXh0ZW5zaW9ucyBoYXZlIHRoYXQgc2FtZSBidWcgdG9vPwo+ID4g
PiAKPiA+ID4gCWlmIChiaXRtYXBfZW1wdHkocmlzY3ZfaXNhLCBSSVNDVl9JU0FfRVhUX01BWCkp
Cj4gPiA+IAkJYml0bWFwX2NvcHkocmlzY3ZfaXNhLCBpc2FpbmZvLT5pc2EsIFJJU0NWX0lTQV9F
WFRfTUFYKTsKPiA+ID4gCWVsc2UKPiA+ID4gCQliaXRtYXBfYW5kKHJpc2N2X2lzYSwgcmlzY3Zf
aXNhLCBpc2FpbmZvLT5pc2EsIFJJU0NWX0lTQV9FWFRfTUFYKTsKPiA+IAo+ID4gSSBzdXBwb3Nl
IGl0IGNvdWxkIGluIHRoZW9yeSwgYnV0IHRoZSBib290IGhhcnQgbmVlZHMgaW1hIHRvIGV2ZW4g
Z2V0Cj4gPiB0aGlzIGZhci4gSSB0aGluayB5b3UnZCBvbmx5IGVuZCB1cCB3aXRoIHRoaXMgaGFw
cGVuaW5nIGlmIHRoZXJlIHdlcmUKPiA+IGVuYWJsZWQgaGFydHMgdGhhdCBzdXBwb3J0ZWQgcnZY
WGUsIGJ1dCBJIGRvbid0IHRoaW5rIHdlIGV2ZW4gYWRkIHRob3NlCj4gPiB0byB0aGUgcG9zc2li
bGUgc2V0IG9mIENQVXMuIEknbGwgaGF2ZSB0byBjaGVjay4KPiAKPiBZZSwgeW91IGRvbid0IGdl
dCBtYXJrZWQgcG9zc2libGUgaWYgeW91IGRvbid0IGhhdmUgaW1hLCBzbyBJIGRvbid0Cj4gdGhp
bmsgdGhpcyBpcyBwb3NzaWJsZSB0byBoYXZlIGhhcHBlbi4gTWF5YmUgYSBjb21tZW50IGhlcmUg
aXMKPiBzdWZmaWNpZW50LCBleHBsYWluaW5nIHdoeSB0aGlzIGNhbm5vdCByZWR1Y2UgdG8gemVy
b3M/CgpPa2F5IGNvb2wuIEEgY29tbWVudCBpcyBzdWZmaWNpZW50IHRoZW4uCgotIENoYXJsaWUK
Cj4gCj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
