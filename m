Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3F6C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umupkKkxqgA6sRNC2yn+snavD/biHuOclHPksxMkCKE=; b=3hgu+yyLDrh53I
	/lNoV/h3SBHWdRNTNr2HCMXxPpUlBFnDN19Z2XU1I+1ZMw6D/CPLbtaoTuEbXneSCKaRpqE1yu5m5
	VUH/oCaN14hBPx2O7+7VnuOzZkrEpiADSdEE/lC6itAsHxz1hFPX1BAOItkg9gmZmsL+lX5IYllrg
	9AdtB74z99aCYxFqOvawFcUIJ2yp5+r7YMfMIsYFJrqj5N7UVm4E5WMLtw0cehf/1n9zdP9axTayY
	0UtJC4Po2xVWlr90cLQi71/hosm07e8/LUAvWCHUGx/ePTghK53HhJqf9ppOzw6zUGldw2sUTfdwW
	17Pj8o3I7VbjlSojUmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12RK-005y2K-1I;
	Thu, 09 Nov 2023 10:39:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12RG-005y1Z-30
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 10:39:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40a279663a2so1499055e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 02:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699526345; x=1700131145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmGbwmaXtBtukBQbSz5/AjnhxMx8QNKzqe9+KNioNp0=;
        b=Aqpe3YcDLo0YKc7uCi7C3EyaRQhBYXGN7iZ5IDBLS+2StfPPPHqr4nkkKNFsSAhgaz
         b+WjmF/Ha/m8Spa5ArEBu1Iv1m1L8nZ1Z4VsI2VMwCnZ1pizut0JiaRhCyxBzfjfIJT3
         A5+c4Lbyoneebub02/UVflJAS0QlqjYOA5WQOzAUMR9ZWYwsJP5jywUhyh0j6bWfxR6E
         /D9COiBEhkJtT3+j3AYJErLGHvXY7v/6+pSE7MxyHdZzlZCiriOzHEAtTi5Zh1mvfdrO
         JzfRAJOlUuxc5xEhqh0qedON0ETvc2ypsJMH0zJ18YxDElua6Jiaoqp/YMIWrlQzvh7W
         2ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699526345; x=1700131145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmGbwmaXtBtukBQbSz5/AjnhxMx8QNKzqe9+KNioNp0=;
        b=icUmv9Q4r8LZfgTr21ZENyIkAADOfbb0Kr02AbDcwNtk4mAbWDdT1p+GmtJF3ZON77
         NsicEikN+j3qFdXlq02g9A3Q+6dCGt9vhymBWnKsO0WFgGB2tHzsviKiBJCNwsF85zy6
         +wuZTddnzBV2TNzk2Rh7VO7RVRboKM9T6Dh1+tlYFsF82e7hzAlLZ2vE+qdnVXM8njjo
         38Xiv543rFY03znqeJAr/Hd18KNZPPXw/FUFyGXwp07s2KuM2wOtUGUbO42GKOX7rjl5
         rpSo+buNYIhHymHV0dfTjnCEvk4wnIx3OFU0BlaiygGGYN/3Yckos9S1u5KXpys9C4Dc
         UBAA==
X-Gm-Message-State: AOJu0YzB3HqkF404TTGGjObs0ZPlwy5wTqGP8ls8npCSREXaJLa8nFWQ
	w0NJ2VyRsdV4LGjQ9Sm1Zjoi9A==
X-Google-Smtp-Source: AGHT+IGJDtJU0vy2RLytoP9NwcqdfAiEsZKNe2CEhkkrVnWPGJ8hlOjTlrHY/RwmZQGojP3I0Fa1xA==
X-Received: by 2002:a7b:c4d7:0:b0:408:3836:525f with SMTP id g23-20020a7bc4d7000000b004083836525fmr4014084wmk.1.1699526344873;
        Thu, 09 Nov 2023 02:39:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:87b4:87b9:6476:5df7? ([2a01:e0a:999:a3a0:87b4:87b9:6476:5df7])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c359600b004080f0376a0sm1662458wmq.42.2023.11.09.02.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 02:39:04 -0800 (PST)
Message-ID: <fd022864-f276-4c4c-84ea-0752b915a9b3@rivosinc.com>
Date: Thu, 9 Nov 2023 11:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] riscv: add ISA extension parsing for vector
 crypto
Content-Language: en-US
To: Jerry Shih <jerry.shih@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-7-cleger@rivosinc.com>
 <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
 <20231109-revolver-heat-9f4788c51bbf@wendy>
 <20231109-prevalent-serrated-d40eb5f71236@wendy>
 <F2C4CCA2-0513-4988-94C4-1ECEB9F1D578@sifive.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <F2C4CCA2-0513-4988-94C4-1ECEB9F1D578@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_023907_169526_A4B4CF3C 
X-CRM114-Status: GOOD (  18.95  )
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

CgpPbiAwOS8xMS8yMDIzIDEwOjQ1LCBKZXJyeSBTaGloIHdyb3RlOgo+IE9uIE5vdiA5LCAyMDIz
LCBhdCAxNTo1NCwgQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3Jv
dGU6Cj4+IE9uIFRodSwgTm92IDA5LCAyMDIzIGF0IDA3OjQ0OjQ2QU0gKzAwMDAsIENvbm9yIERv
b2xleSB3cm90ZToKPj4+IE9uIFRodSwgTm92IDA5LCAyMDIzIGF0IDEwOjU4OjQxQU0gKzA4MDAs
IEplcnJ5IFNoaWggd3JvdGU6Cj4+Pj4gT24gTm92IDcsIDIwMjMsIGF0IDE4OjU1LCBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+IHdyb3RlOgo+Pj4+IFRoZSBadmtuaGEgYW5k
IFp2a25oYiBhcmUgZXhjbHVzaXZlLiBJdCdzIG5vdCB0aGUgc3VwZXJzZXQgcmVsYXRpb25zaGlw
Lgo+Pj4+Cj4+Pj4gUGxlYXNlIGNoZWNrOgo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9y
aXNjdi1jcnlwdG8vaXNzdWVzLzM2NCNpc3N1ZWNvbW1lbnQtMTcyNjc4MjA5Ngo+Pj4KPj4+IFlv
dSBnb3QgYSByZXNwb25zZSB0byB0aGlzIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uLCBidXQgZGlk
bid0IGVuZ2FnZQo+Pj4gd2l0aCBpdDoKPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9j
NjRkOWRkYi1lZGJkLTRjOGYtYjU2Zi0xYjkwZDgyMTAwYjdAcml2b3NpbmMuY29tLyN0Cj4gCj4g
UmVwbHkgZm9yIHRoZSB0aHJlYWQ6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2M2NGQ5
ZGRiLWVkYmQtNGM4Zi1iNTZmLTFiOTBkODIxMDBiN0ByaXZvc2luYy5jb20vI3QKCkhpIEplcnJ5
LAoKU29ycnkgZm9yIHRoYXQsIEkgYWN0dWFsbHkgdGhvdWdodCBteSBtYWlsZXIgd2FzIGJyb2tl
biBhbmQgZml4ZWQgdGhlCm1haWwgdGhlIGZpcnN0IHRpbWUgSSBhbnN3ZXJlZCBidXQgbm90IHRo
ZSBzZWNvbmQgdGltZS4uLgoKPiAKPj4gWWVzLCBidXQgZm9yIGluc3RhbmNlLCB3aGF0IGhhcHBl
bnMgaWYgdGhlIHVzZXIgcXVlcnkgdGhlIHp2a25oYSAoaWYgaXQKPj4gb25seSBuZWVkcyBTSEEy
NTYpIGJ1dCB6dmtuaGIgaXMgcHJlc2VudC4gSWYgd2UgZG9uJ3QgZGVjbGFyZSB6dmtuaGEsCj4+
IHRoZW4gaXQgd2lsbCBmYWlsIGJ1dCB0aGUgc3VwcG9ydCB3b3VsZCBhY3R1YWxseSBiZSBwcmVz
ZW50IGR1ZSB0bwo+PiB6dmtuaGIgYmVpbmcgdGhlcmUuCj4gCj4gSWYgd2UgbmVlZHMgU0hBMjU2
IG9ubHksIHRoZW4gd2Ugc2hvdWxkIGNoZWNrIHdoZXRoZXIgd2UgaGF2ZSB6dmtuaGEgYG9yYCB6
dmtuaGIuCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9ibG9iLzRkNDY1N2Ni
NmJhMzY0ZGZhNjA2ODE5NDhiMGEzMGM0MGJlZTMxY2EvY3J5cHRvL3NoYS9zaGFfcmlzY3YuYyNM
MjQKCk9rLCBhbmQgaWYgdGhlcmUgaXMgYWxyZWFkeSBzb21lIHVzZXJzcGFjZSBjb2RlIHRoYXQg
YmVoYXZlcyBsaWtlIHRoYXQsCmxldCdzIGdvIHRoaXMgd2F5IGFuZCBkbyBub3QgdHJlYXQgdGhh
dCBhcyBhIHN1cGVyc2V0LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4+IEFoaCwgSSBub3cgc2Vl
IHdoYXQgdGhhdCBoYXBwZW5lZC4gWW91ciBtYWlsZXIgaXMgYnJva2VuIGFuZCBwdXRzIHRoZQo+
PiBtZXNzYWdlLWlkIG9mIHdoYXQgeW91IGFyZSByZXBseWluZyB0byBpbiB0aGUgSW4tUmVwbHkt
VG8gYW5kIFJlcGx5LVRvCj4+IGhlYWRlcnMuIFRoZSBmb3JtZXIgaXMgY29ycmVjdCwgdGhlIGxh
dHRlciBpcyBib2d1cyAmIG1lYW5zIHlvdSBkb24ndCBldmVuCj4+IGdldCBkZWxpdmVyZWQgdGhl
IHJlc3BvbnNlLgo+IAo+IEkgdXNlIG1hYyBidWlsdGluIGBtYWlsYCBjbGllbnQuIEFuZCBJIHRo
aW5rIEkgcHV0IHRoZSBgaW4tcmVwbHktdG9gIGFkZHJlc3MgdG8KPiB0aGUgYHJlcGx5IHRvYCBm
aWVsZC4gSG9wZSB0aGlzIG9uZSB3b3JrcyB3ZWxsLiBUaGFuayB5b3UgZm9yIHRoZSB0aHJlYWQg
Zm9yd2FyZGluZy4KPiAKPiAtSmVycnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
