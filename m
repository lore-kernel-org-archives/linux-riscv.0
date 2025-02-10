Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C665C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 17:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCe0B4NlIgEbtfDreGRYqpasa2knWDHMorGvlrYLH24=; b=lvVme5mEfjT5Y5
	dfO2UV4bYJ1mUVq3fD10EzACrp2MTr28GCMgsfG6x5Z2vZPF3SNLmgeL8HYs4TLUf7un6Y2xqfRWx
	QBEZ/6DA/pEZKiYPd7PS6M7/omxHco0nsj2YnlgtlWTAR8DIMsyROYqgYWEgkX7l1SgTtecb0pdRM
	Spb4forhuAKW3uZpm5n/JnjTpFuiCWXzR+scLRAvDZ13N0ZHILKJBBs1QEHa/XrnPgO62mTmM0eVs
	uI5hBmvNCM0XFHaQ+O5+k+2JkzD3HnYVi8jdhq7/XzSGRVubgybfxV2eLJuHNyjzytnsIxQMojMP1
	oXSIcW5mvxnOVrwqhrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXfo-00000000kAw-1Ihq;
	Mon, 10 Feb 2025 17:34:20 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXRo-00000000h8j-2PFW
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 17:19:53 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6f77b9e0a34so34193687b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 09:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739207991; x=1739812791; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2MsrOQ6Dr1fnZ/rPykBJzkvfxRD2BZBc8FtmXsWoPMU=;
        b=BRYRf+wHpaEJ/8prgh/dVxl9OBhb2+BkJngtsaO62jpsWh/XklCjckVuX6N6/zvBh4
         TH2IO6KIKZ8/VW/LD7eXnmo5sCHsNNcCUC64fBNyabe38xHg0KzSboZZMgauEPZ67gXu
         9HE7lmtg+U7qwyVeRiIV9EOEihd1Ltp/ftIRamkVH2dRmKNAWHWY995t7YzpQhhuPvZR
         uStNP/rh6inwsydCZKu+uNGiSyJf8rQekw2qOBWJMMv6lLXy9BK23uGvbzo7dn2Wuho7
         sXPzYfmDMV75SjRrShvN5e4vd/KY7/ebk4/PVgOYRk1kTtpcFrO2ST5Yy/8fgTPKCjB5
         sJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207991; x=1739812791;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MsrOQ6Dr1fnZ/rPykBJzkvfxRD2BZBc8FtmXsWoPMU=;
        b=V2I0jtRf3BcQowWbIXDyX3s5Rlz+0N7gTjbfSRYUGaEWEIYxVa2ojvB6gf6WM3cYAC
         uyYosmqvsppY4mSh4Q3DZIdyqsxOkmI0uJZdbjC9xTtMy91qhGqS9uQbJUjVE7lQGnkm
         dTKH4bGiFMmVGZHEhZf/l2M/6oEpM+Grh5WB8LUNnA0cA9zI/TrrM/YWzSUN7ZtwwXz/
         XggIZ1DpSzJAPHW4WTQg9AA8HhKFpetIc/p0sfTm+OdCGtrfgvXUH7vP/qPgDaxpyW81
         DzC7yHhAwa5T+MaEK+1Yq5leZH50LtZEfE7m46BnAzZrDGKePPONo/Uvx9sdTWBZxFEx
         miow==
X-Forwarded-Encrypted: i=1; AJvYcCWBR4L2sXXGpYKpIkpg7HKrM3Azg+lpsBCU6ae6dSXyk1q7fLkerhxDSONmz3m5DZOUDJI3iVO58ziTFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcmOiFGRFegvH3G/v2rBzdIoVXsSbQQwgN1JpWFpR7GGU0GjrQ
	yibtJ6P6mqcjYbPSzSjcImKPR0UROBI3zu2yDnn/bVzORBEa6zItKZJIa07cPUA=
X-Gm-Gg: ASbGncvHHfdDdSYnsgRF7xR7huTHA0gizhGvJNWspTtaI2HdUOMhrwOOspwUumBHRjQ
	U6FCaJ6Sxc8E4OX/q4FV9uOrSYswVWOaq8Y0QIIySPagbdtLDo00TZqATR8gKpG0FuSARIj0stn
	w3unQVEATXoMqnR3x1B/FEXwKBIske79HgME4catp2f+Gbw/H2KEzgR7rNJvIeou+veSX1zLAOD
	dpePRiRDlQy82ViXJ5G+O/ErETvhpsUKSOj/69B74Un/1EANy0RIapFDRs2pBJuaynAoY1dh1q8
	mlg=
X-Google-Smtp-Source: AGHT+IHwdRZwKWakhS069PFZbgTvL8cjcTlAHidctczPzqsJ2LcDz7rXPXjmWjC3qOa29UIA7m5tFQ==
X-Received: by 2002:a05:690c:6890:b0:6f9:afa2:acbd with SMTP id 00721157ae682-6f9b2a49ca7mr120602077b3.38.1739207990039;
        Mon, 10 Feb 2025 09:19:50 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fcf9be9sm17680707b3.25.2025.02.10.09.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:19:49 -0800 (PST)
Date: Mon, 10 Feb 2025 09:19:48 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Anup Patel <anup@brainfault.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6o1NCo5nLPwBsUT@ghost>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_091952_613750_55C27C35 
X-CRM114-Status: GOOD (  27.06  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDM6NDY6NDZQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBTYXQsIEZlYiA4LCAyMDI1IGF0IDY6NTPigK9BTSBDaGFybGllIEplbmtpbnMgPGNo
YXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEZlYiAwNywgMjAyNSBh
dCAwNToxOTo0N1BNICswMTAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiA+IFByb2JpbmcgdW5h
bGlnbmVkIGFjY2Vzc2VzIG9uIGJvb3QgaXMgdGltZSBjb25zdW1pbmcuIFByb3ZpZGUgYQo+ID4g
PiBmdW5jdGlvbiB3aGljaCB3aWxsIGJlIHVzZWQgdG8gbG9vayB1cCB0aGUgYWNjZXNzIHR5cGUg
aW4gYSB0YWJsZQo+ID4gPiBieSBpZCByZWdpc3RlcnMuIFZlbmRvcnMgd2hpY2ggcHJvdmlkZSB0
YWJsZSBlbnRyaWVzIGNhbiB0aGVuIHNraXAKPiA+ID4gdGhlIHByb2JpbmcuCj4gPgo+ID4gVGhl
IGFjY2VzcyBjaGVja2VyIGluIG15IGV4cGVyaWVuY2UgaXMgb25seSB0aW1lIGNvbnN1bWluZyBv
biBzbG93Cj4gPiBoYXJkd2FyZS4gSGFyZHdhcmUgdGhhdCBzdXBwb3J0cyBmYXN0IHVuYWxpZ25l
ZCBhY2Nlc3NlcyBpc24ndCByZWFsbHkKPiA+IGltcGFjdGVkIGJ5IHRoaXM/IEF2b2lkaW5nIGEg
bGlzdCBvZiBoYXJkd2FyZSB0aGF0IGhhcyBzbG93L2Zhc3QKPiA+IHVuYWxpZ25lZCBhY2Nlc3Nl
cyBpbiB0aGUga2VybmVsIHdhcyB0aGUgbWFpbiByZWFzb24gZm9yIGR5bmFtaWNhbGx5Cj4gPiBj
aGVja2luZy4gV2UgZGlkIGludHJvZHVjZSB0aGUgY29uZmlnIG9wdGlvbiB0byBjb21waWxlIHRo
ZSBrZXJuZWwgd2l0aAo+ID4gYXNzdW1lZCBzbG93L2Zhc3QgYWNjZXNzZXMsIHdoaWNoIG9mIGNv
dXJzZSBoYXMgdGhlIGRvd25zaWRlIG9mCj4gPiByZWNvbXBpbGluZyB0aGUga2VybmVsIGFuZCBJ
IGFzc3VtZSB0aGF0IHlvdSBhbHJlYWR5IGNvbnNpZGVyZWQgdGhhdC4KPiAKPiBUaGUga2NvbmZp
ZyBvcHRpb24gZG9lcyBub3QgYWxpZ24gd2l0aCB0aGUgdmlzaW9uIG9mIHJ1bm5pbmcgdGhlIHNh
bWUKPiBrZXJuZWwgaW1hZ2UgYWNyb3NzIHBsYXRmb3Jtcy4KCkkganVzdCBkb24ndCB0aGluayB0
aGF0IHZpc2lvbiBpcyByZWFsaXN0aWMuCgpJIGFtIGEgcHJvcG9uZW50IGZvciBjb21waWxlIHRp
bWUgZGVmaW5lcyBiZWNhdXNlIHJpIGdodCBub3cgd2UgYXJlCmNhdGVyaW5nIHRoZSBrZXJuZWwg
dG8gYm90aCBtaWNyb2NvbnRyb2xsZXJzIGFuZCBmb3IgaGlnaCBwZXJmb3JtYW5jZQpwbGF0Zm9y
bXMuIEkgYW0gaW4gZmF2b3Igb2YgaGF2aW5nIGEgc2V0IG9mIGNvbmZpZ3VyIGF0aW9ucyB0aGF0
IGFyZQppZGVhbCBmb3IgdGhlc2UgbWljcm9jb250cm9sbGVycyBhbmQgYSBkaWZmZXJlbnQgc2V0
IGZvciBoaWdoCnBlcmZvcm1hbmNlIHBsYXRmb3Jtcy4gVGhpcyBpcyB3aGVyZSB0aGUgUlZJIHBy
b2ZpbGUgcyB3b3VsZCBpZGVhbGx5CmNvbWUgaW4sIGhhdmluZyBkaWZmZXJlbnQgY29uZmlncyBm
b3IgZGlmZmVyZW50IHByb2ZpbGVzIHRoYXQgdGFyZ2V0IGxvdwpwZXJmb3JtYW5jZS9oaWdoIHBl
cmZvcm1hbmNlLgoKQ29tcGlsZXIgb3B0aW1pemF0aW9ucyBmb3IgZXh0ZW5zaW9ucyBhcmUgbm90
IHBvc3NpYiBsZSB0byBkbyBieSBqdXN0CmhhdmluZyB0aGVzZSBkaWZmZXJlbnQgbWV0aG9kcyBv
ZiBzZWxlY3RpbmcgYXQgcnVudGkgbWUuIEJ5IGVuYWJsaW5nCmV4dHJhIGV4dGVuc2lvbnMgbGlr
ZSB0aGUgYml0bWFuaXAgZXh0ZW5zaW9ucyBkdXJpbmcgY29tcGlsYXRpb24gdmlhIGEKY29uZmln
IGZsYWcgd2UgY2FuIG9wdGltaXplIHRoZSBlbnRpcmUga2VybmVsLiBJdCBpcyBub3QgcG9zc2li
bGUgdG8KcHVzaCBhbGwgb3B0aW1pemF0aW9ucyBvZmYgdG8gcnVudGltZSBkZXRlY3Rpb24uCgo+
IAo+ID4KPiA+IEluc3RlYWQgb2YgaGF2aW5nIGEgdGFibGUgaW4gdGhlIGtlcm5lbCwgc29tZXRo
aW5nIHRoYXQgd291bGQgYmUgbW9yZQo+ID4gcGxhdGZvcm0gYWdub3N0aWMgd291bGQgYmUgdG8g
aGF2ZSBhbiBleHRlbnNpb24gdGhhdCBzaWduYWxzIHRoaXMKPiA+IGluZm9ybWF0aW9uLiBUaGF0
IHNlZW1zIGxpa2UgaXQgd291bGQgYWNjb21wbGlzaCB0aGUgc2FtZSBnb2FsIGFuZAo+ID4gbGV2
ZXJhZ2UgdGhlIGV4aXN0aW5nIGluZnJhc3RydWN0dXJlIGluIHRoZSBrZXJuZWwsIGFsYmVpdCB3
aXRoIHRoZSBuZWVkCj4gPiB0byBtYWtlIGEgbmV3IGV4dGVuc2lvbi4KPiA+Cj4gCj4gSU1PLCBl
eHBlY3RpbmcgYW4gSVNBIGV4dGVuc2lvbiB0byBiZSBkZWZpbmVkIGZvciBhbGwgcG9zc2libGUK
PiBtaWNyb2FyY2hpdGVjdHVyYWwgY2hvaWNlcyBpcyBub3QgZ29pbmcgdG8gc2NhbGUgc28gaXQg
aXMgYmV0dGVyCj4gdG8gaGF2ZSBpbmZyYXN0cnVjdHVyZSBpbiBrZXJuZWwgaXRzZWxmIHRvIGlu
ZmVyIG1pY3JvYXJjaGl0ZWN0dXJhbAo+IGNob2ljZXMgYmFzZWQgb24gUklTQy1WIGltcGxlbWVu
dGF0aW9uIElELgoKSG93IGlzIGtlZXBpbmcgdGFibGVzIGluIHRoZSBrZXJuZWwgZm9yIGFsbCBt
aWNyb2FyY2hpdGVjdHVyYWwgZGV0YWlscwphbnkgbW9yZSBzY2FsYWJsZSB0aGFuIGhhdmluZyBl
eHRlbnNpb25zIHRoYXQgZG8gdGhlIHNhbWUgdGhpbmc/IEkgd291bGQKYXJndWUgdGhhdCBoYXZp
bmcgaXQgaW4gdGhlIGtlcm5lbCBpcyBsZXNzIHNjYWxhYmxlIHNpbmNlIGl0IG5lZWRzIHRvIGJl
CmRlc2NyaWJlZCBmb3IgYWxsIGltcGxlbWVudGF0aW9uIElEcywgYW5kIGFsbCBjaGFuZ2VzIHJl
cXVpcmUgZ29pbmcKdGhyb3VnaCB0aGUga2VybmVsIHJldmlldyBwcm9jZXNzLiBEeW5hbWljIHBy
b2JpbmcgYXZvaWRzIHRoZXNlIGlzc3Vlcy4KSGF2aW5nIGFuIGV4dGVuc2lvbiBoYXMgdGhlIG9u
ZS10aW1lIHByb2Nlc3Mgb2YgZ2V0dGluZyB0aGUgZXh0ZW5zaW9uCmludG8gc29tZXRoaW5nIGxp
a2UgYSBwcm9maWxlLCBidXQgdGhlbiBhbnlib2R5IGNvdWxkIHVzZSBpdCB3aXRob3V0Cm5lZWRp
bmcgYSBrZXJuZWwgcGF0Y2guCgotIENoYXJsaWUKCj4gCj4gUmVnYXJkcywKPiBBbnVwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
