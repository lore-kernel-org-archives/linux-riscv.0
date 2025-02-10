Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AFDC02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 11:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lN1AuyPQITXQA9kqm/75Iiz/yH47W2rZKFG5IqKvrSM=; b=tHSrL4EM0ZLGOo
	C84Q4jH96Px1i5SRmY+JAcPY7Nlnx9JuWz+DzFEPumeTTXGHEkY7VYjXRAaycu69kUpH63n5SrGG2
	tMTp68yEziC/rUYTMO81hfGe6OG0Dw8snSif9JFlbaoIMRCEJZufNuazD1uzksWv4WP6K32+ffrGS
	ht66OcScKxKq6dxhpaQmWF8Zo/Z+/ZDjLn2KJzpAxut9NNwrP5a588IL4NgBR3SHyEHXPTnBTMto3
	uQ0ItKEBua/vLr8BXy6Dp3ePyzBGXwk5DG0x/TCTCEgCrizmLaIh/4yQ2ap9oaerO4znnxsfLuApC
	9x/zfhrnJdwlfe6YUJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRpo-0000000HBxp-0MNz;
	Mon, 10 Feb 2025 11:20:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRXb-0000000H7lE-0ty6
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 11:01:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436281c8a38so27386655e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 03:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739185286; x=1739790086; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OSaTCwW/i1a/+xT9ljUvRvwwj+Pxye0xzps/mnFBmXc=;
        b=C3kjSC96JDsiZs6dlKbhoxDpfwIPsmMpKnZK6IRVKaO+OqgLZJrewDzVocvHexHWFK
         +k7Ef89FptXS4c9noKugkK3y5W1zUTVqtb6cwX6oHaWLcwpsA0XUAPG6oXs58P4Qp7gE
         FwrmukkiuCAovfsuSl/B9tfMH7a6KEEvosxcM0GHKsJrLt93w18agP6UVpXPjzbvQaR0
         eOSFvfBA2GdB9IfYt0YKFhM1GvvvoHcpA1bBnCQirMWWFMJfohZYViErqskWp3IHQfsg
         giRjd0R15JwVvLV0ZibwRYg3xYx8KTzE2LHwNLd+tm+h0Ollp1u9U4oLNJRsgZxeg8P3
         wGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185286; x=1739790086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSaTCwW/i1a/+xT9ljUvRvwwj+Pxye0xzps/mnFBmXc=;
        b=i4YYq/PC786EuiADKZzF6BTPc0x4RJ1exnVk0Jw6E34cmXZBs+uUbkHjJ/b70aPAj2
         mEwo8Q1lhHRyKhj+sTnQNxCTBCEeEK+39A07I90PKKVIsG4f3JUmrFDif31Rc/DFPKSD
         zwGmm/NlxdQ1jL2fsXLHF/RQ4kSXhzGOW1cmOF2Y9VQjMx4oiA1anuu6O3QIhFygpjqr
         Bhc92rW8ko/IS6kxELjbwApVI3Y81+5MZoUhuBAem1DyF47e4Cx141L3b6w1ZFtcxAre
         P3I1mNesiDl+2K0xMDEMCxEn7fLoOr95iHs0Y7vIdwjAoWK11Njc5tMp+xaUwKuFV1vl
         dq6g==
X-Gm-Message-State: AOJu0YzW5ncDzQm4KJG+UIwJbrrl8OSB0VdEq2sQWsxtF563w4pMxHc7
	Xl1sVxR43DxZ7XClurXz1vTUrpAmRbmyeil0I62zYOvgeft5Oht20FVUkx1A6Og=
X-Gm-Gg: ASbGncsTTSo9MwbtZvnQUdZLG8MIhmTuR3SeCCHh3GOdC4DHiBo6oMMqKUi0u0OkY04
	fmB80b/1LPxLpKkzTZsoEWR3hxncsn9Bs/RCyDxkyd0LYfcMR3prJ06PNcT4CaT2DzdLo2dkd5M
	GrCN+W4lihPs96mrzuFn94T88L+NuC+6r0FvG0OX9jBaHC0SS2bJmw2weRMZ7UI+ccUerJTo4TW
	NWpOYVLM4rinfSR+IA4pFfSAIyXEtrDUYbPQdgmsCTRqpd93nOcCtK9iC17WwB77iZyKgryGvPx
	5DE=
X-Google-Smtp-Source: AGHT+IFXnQ0KMzWEP0v9mEPLjum+FYzLvCxDqUvIcocuOOZXnHi/RAG0ADvMPBvpRtDBnATrbHxu0g==
X-Received: by 2002:a05:6000:2aa:b0:38d:daf3:be6a with SMTP id ffacd0b85a97d-38ddaf3c061mr5632423f8f.40.1739185285592;
        Mon, 10 Feb 2025 03:01:25 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394779a96dsm16109565e9.4.2025.02.10.03.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:01:24 -0800 (PST)
Date: Mon, 10 Feb 2025 12:01:23 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, jesse@rivosinc.com
Subject: Re: [PATCH 0/9] riscv: Unaligned access speed probing fixes and
 skipping
Message-ID: <20250210-c79541eaea0d2d922f019384@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <CAK9=C2XmFtLHAxuWJVdvkUHFQTM+mE-D8E4sLvKxxUj_CqcbAQ@mail.gmail.com>
 <20250210-d575562e04d84ca570e26f5d@orel>
 <CAK9=C2X5Hu_LQHmXUea7Xhq5cHaJqtcncgwUeb2+2uMvbTiW3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2X5Hu_LQHmXUea7Xhq5cHaJqtcncgwUeb2+2uMvbTiW3w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_030127_254538_ED0D57F3 
X-CRM114-Status: GOOD (  21.91  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDM6Mjg6MTNQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIEZlYiAxMCwgMjAyNSBhdCAyOjU24oCvUE0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gU2F0LCBGZWIgMDgsIDIwMjUg
YXQgMDE6Mjk6NDJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gT24gRnJpLCBGZWIg
NywgMjAyNSBhdCA5OjQ54oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGUgZmlyc3Qgc2l4IHBhdGNoZXMgb2YgdGhpcyBz
ZXJpZXMgYXJlIGZpeGVzIGFuZCBjbGVhbnVwcyBvZiB0aGUKPiA+ID4gPiB1bmFsaWduZWQgYWNj
ZXNzIHNwZWVkIHByb2JpbmcgY29kZS4gVGhlIG5leHQgdHdvIHBhdGNoZXMgaW50cm9kdWNlCj4g
PiA+ID4gc3VwcG9ydCB0byBza2lwIHByb2JpbmcgYnkgbWF0Y2hpbmcgdmVuZG9yL2FyY2gvaW1w
IGlkcyBhbmQgY2hlY2tpbmcgYQo+ID4gPiA+IHRhYmxlIGZvciB0aGUgYWNjZXNzIHNwZWVkIHR5
cGUuIFRoZSBsYXN0IHBhdGNoIGFwcGxpZXMgdGhlIG5ldyBza2lwCj4gPiA+ID4gc3VwcG9ydCB0
byBWZW50YW5hIGhhcnRzLgo+ID4gPgo+ID4gPiBBbHRlcm5hdGl2ZWx5LCB3ZSBjYW4gYWxzbyBz
a2lwIHByb2JpbmcgbWlzYWxpZ25lZCBhY2Nlc3Mgd2hlbiBaaWNjbHNtCj4gPiA+IGV4dGVuc2lv
biBpcyBwcmVzZW50IGluIHRoZSBJU0Egc3RyaW5nLiBUaGUgWmljY2xzbSBleHRlbnNpb24gaXMg
ZGVmaW5lZAo+ID4gPiBhcyBwYXJ0IG9mIHRoZSByYXRpZmllZCBSVkEyMyBwcm9maWxlLgo+ID4K
PiA+IFRoZSBkZWZpbml0aW9uIG9mIFppY2Nsc20gZG9lc24ndCBleHBsaWNpdGx5IHN0YXRlIHRo
YXQgbWlzYWxpZ25lZCB3b3JkCj4gPiBhY2Nlc3NlcyB3aWxsIGJlIGZhc3RlciB0aGFuIGJ5dGUg
YWNjZXNzZXMgdG8gdGhlIHNhbWUgYWRkcmVzc2VzLiBUaGVyZSdzCj4gPiBhbHNvIHRoaXMgc3Bl
YyBpc3N1ZVsxXSB3aGljaCBhcHBlYXJzIHRvIHN0YXRlIHRoYXQgWmljY2xzbSBjYW5ub3QgYmUg
dXNlZAo+ID4gdG8gaW5mZXIgZmFzdCBtaXNhbGlnbmVkIGFjY2Vzc2VzLgo+ID4KPiA+IEJ1dCwg
bGlrZSBDaGFybGllIHN1Z2dlc3RzLCBtYXliZSB3ZSBzaG91bGQgYWR2b2NhdGUgdGhlIGNyZWF0
aW9uIG9mIGFuCj4gPiBleHRlbnNpb24gKG9yICJuYW1lZCBmZWF0dXJlIikgd2hpY2ggYWxsb3dz
IHNwZWNpZmljYWxseSBhZHZlcnRpc2luZyB0aGF0Cj4gPiBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFy
ZSBmYXN0Lgo+ID4KPiA+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtaXNhLW1h
bnVhbC9pc3N1ZXMvMTYxMQo+IAo+IEkgYW0gbm90IHN1cmUgd2hlbiBzdWNoIGFuIGV4dGVuc2lv
biB3b3VsZCBzaG93IHVwIHNvIGZvciBub3cKPiBza2lwcGluZyB1bmFsaWduZWQgdGVzdHMgYmFz
ZWQgb24gaW1wbGVtZW50YXRpb24gSUQgc2VlbXMKPiByZWFzb25hYmxlLgo+IAo+IEFsc28sIGl0
IHNlZW1zIHRoaXMgc2VyaWVzIGlzIHRvdGFsbHkgc2tpcHBpbmcgdGhlIGV4aXN0aW5nIGJvb3Qt
dGltZQo+IHByaW50IGZvciBmYXN0IHVuYWxpZ25lZCBhY2Nlc3MuIFBsZWFzZSB0cnkgdG8ga2Vl
cCB0aGUgYm9vdC10aW1lCj4gcHJpbnQgaW4gc29tZSBmb3JtLgoKU3VyZS4gV2UgaGF2ZSBod3By
b2JlLCBidXQgbm93IHRoYXQgcGVvcGxlIGFyZSBsaWtlbHkgdXNlZCB0byBzZWVpbmcgaXQKaW4g
ZG1lc2csIHRoZW4gd2Ugc2hvdWxkIHByb2JhYmx5IGtlZXAgc29tZXRoaW5nIHRoZXJlLgoKVGhh
bmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
