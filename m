Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E481C5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xaN9yd3IeCmxLOE2hKdS9LuFP+d3I00P1H4h8vHtUs=; b=4k5xbB8Tg3qQ4L
	mb6Xms9cRE32dxUFCe9ICNeV1NG5A2TnFxSDEwGq08OCWhY+rxYgB2JspESVJlILmPAywfuUpECNs
	ix8q1c+6B8QD5EoYlyAxDkuBDZci+t0ROX96A2Gb4Fizz2F9As/Vkrpya3PFCn1ihDL9mJvKOZl/i
	F5JZyNB07gmAmNBmxWJeQIgb+QH339sinpItV2lbT8ufPQYLDi2qiqL59+P/jFPZduZbEQQ3m5uCV
	KS6UHcQk244UlkriDlZuwSpHZUI3gLakLANotreH1ncEHm5T00NW8Jzsrj2fLqrqdGFnOWEPRt83E
	0s9hSEQmAF/H5x5mBIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyRM-00000006Joz-0ak5;
	Mon, 17 Aug 2026 14:35:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyRJ-00000006Joe-3Bqz
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 14:35:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so18230565e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 07:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786977348; cv=none;
        d=google.com; s=arc-20260327;
        b=RWASIEy3g7QRgsZzempAJCAyBmPpHk/39NBN0wL4h44VQy1dfjjHDU1VJKiSYfPlFR
         b64xtsLEcPzZOO9Sc2EYDwx0Ufdkso0OP8MHLX1gqhzMoXQaXyrR2UJWmrYoqef4cPef
         XvKvGYBxOW1aaYUkM5R3twO2XeP9IU0mWp34RLvggYEHvya/wQCAZRt7c6mIyMQzIjtq
         6bUGyPhgMsm6ojMwVGJp7YV2B/r3t7W6UOy4LatCwuaplcxABJFXzQ0wL7BiAfA1GLwz
         tkJAg+qodNqfeq7YJ5lfmwYU2fepYSZmWONXi/iZmZhLRXTtJzJXcn99R5OKCYeTobEl
         oTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oB4C4YGrpyfPRAlJXtjTglv+bodI3E9DvcYaVkpK1hY=;
        fh=brfo6Ysyf96agF5jUnIB1va1uhheD9smAXhC4AjqiMg=;
        b=d1GJQ3ReKGvXAWFedmk4zCfyVUTyOrFJ0rQR+AIpsBhwCpM8VDycbUhW+hBmxgPh7Y
         tIQjYxe0BMPxqcMbAVhX08rLRWiEuOnfEo89iLhP29bJlIOw2y4Zv+nBiYDKrCSjz8oV
         TH/mstYWpGBfefyCP42Si3gIt6CSYrVSFMhds3EDRP5tT+oCkjyskHsNiv4pGwvSJBIM
         cDnsxSrTZoG/ZfE7dn4co68IAPwozcGl1y2647DYe9y7GdP0/DT/jVd6tWAGoZAx8Afa
         xPt5UF/ozL/qP1NxCtPCKvtznZGBvk/koKRtPWzpNg3vMCDAN2NPafhHSx0ZKJQeZ1Oe
         eljw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786977348; x=1787582148; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oB4C4YGrpyfPRAlJXtjTglv+bodI3E9DvcYaVkpK1hY=;
        b=rPdNh99Brpttv8GXK15MrACPMjI0r3SaPM74PIylsAjWgfjZuhtmApXvmZrhbrl7rf
         e2xppMCaw7HfhnqgSHknZZNtjBjiG7cHV+v8Q5iNWN2j+QGEKTeiRRDWEYtypAEba10g
         qa5FwRqx/9MCz4vjtyWzbKopGBA2ihRlIqMMZ9z5upXZ/XKpTkqsRRlmgqdAAk+BRgJy
         XOGx2IS78x19OVyvSWdhlwZisKZei7AUvXSdlQ0RXvRgZVSHtKoYdSoVLFpJiOHUPsQL
         39slduRt1FKSmH5xnnQvr5g3MWxx8g43PdpWiL9+HJRyRdKJKoBbFInPqLVeRlIOp0r7
         WWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786977348; x=1787582148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oB4C4YGrpyfPRAlJXtjTglv+bodI3E9DvcYaVkpK1hY=;
        b=slnxW0+HxpDe0mVFkzXAb20UxVXxgP8vvF9rowdEndCw7uXAQKuzJREq3YDXKnhWjV
         6o8rpn/a9WiU57rRUnYwGy5ogb0eoN+TpGwAwfL8YezzBfImzednXQMw01aKGXUi5JA+
         xtXm/8T7SFMSkSw2f+anoJlJWX2ssnYP9b19QrvR0hyNmk1P3lcyiDy3zkYPoJGwzxEl
         0X0rpVTkx1EFcjoBXYymTndaBnth2gC+FCWEe5LgOQO/hvR5DTGEm+xBpUz2clMuW/m0
         AhM+69Lx7lakWd0DwjZIk1sSR/aWTWoLn3wzTZXg70VGMvSNMJbz43gEim/ZX4IhDqxj
         daAw==
X-Gm-Message-State: AOJu0YyP5dwZEF2JflBOy2o7AOT///o4zcbgtuL2JRKmvyq/LSYJoriZ
	8zcsWyO9OUu8qS/VhC5HWGZMxOgmv4euVOp1MPwVekGJ5mTepGORiLoXsqVSn3GE2lgj2SPt8qH
	ua9YzXjqPmZ3fF68x3kwZVtMvsI1tXF1WHnZov21yzQ==
X-Gm-Gg: AR+sD12v2avTFHL2HWm5IWfYVNeIdAO61XFdaIBMj7V1kX+O4toA/ChZLBscQuaOi/8
	O3kmwChXW82r5FcBZi21liLQR33F/1Hum4paopSPPLAcWlz8uZXY3LZQiPLHTBOUEGRSoBnpWRq
	ZpNwXCmzIPa5UozBEoXj/W1/r8oqAGMTi9Sa+CkTz57y3y/54AJZjRI3eawXIsSCC/2y8BGLAka
	zzdxZDIN93J30RJDWE2tvKrctMy7eiap++zLFyFlLlS9B+ve7jmCFDlaIjA832rr3qQp6QrCrkG
	25tJhlkZwYhn2bWvVeVdcUTE3N7HYW4ETt3UnfgBCj1e9Id/8bvOz/nrfbZ6OGM6nMHSe8KCPMj
	OthtkxjpxwCEM3WitaQ3Y6gRhIINc+v6FWJ4Z96hGCcDG+hmlHg92nuB+VGNH2KKTw/5UjmKPOz
	k=
X-Received: by 2002:a05:600c:8509:b0:496:c9cd:e7ab with SMTP id
 5b1f17b1804b1-499879337acmr454991355e9.5.1786977347350; Mon, 17 Aug 2026
 07:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260816070049.2097442-1-guoren@kernel.org> <20260816070049.2097442-2-guoren@kernel.org>
In-Reply-To: <20260816070049.2097442-2-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Aug 2026 20:05:34 +0530
X-Gm-Features: AcwNN1UQ33Bn-x0HVDnJs4qNgeeI9T6JkkBzLU5bx46f57HnJ1gTId8MnFZpwN8
Message-ID: <CAAhSdy082HFjZ6b+5ANEv=rJpc2YjN61ezAAPyAHME2dHse9VQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tglx@kernel.org, daniel.lezcano@kernel.org, hui.wang@canonical.com, 
	samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_073549_846941_0CDE8753 
X-CRM114-Status: GOOD (  15.22  )
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

T24gU3VuLCBBdWcgMTYsIDIwMjYgYXQgMTI6MzHigK9QTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiR1VPIFJlbiAoWHVhblRpZSkiIDxndW9yZW5Aa2VybmVs
Lm9yZz4KPgo+IFRoZSBJUEkgbWVzc2FnZSB0eXBlIGVudW1lcmF0aW9uIChhbmQgdGhlcmVmb3Jl
IElQSV9NQVgpIGlzIGN1cnJlbnRseQo+IHByaXZhdGUgdG8gYXJjaC9yaXNjdi9rZXJuZWwvc21w
LmMuICBTZXZlcmFsIElQSSBwcm92aWRlcnMgbmVlZCB0byBrbm93Cj4gdGhlIGV4YWN0IG51bWJl
ciBvZiBJUElzIHRoYXQgdGhlIGFyY2hpdGVjdHVyZSByZXF1aXJlcywgc28gbW92ZSB0aGUKPiBl
bnVtIGludG8gdGhlIHB1YmxpYyBoZWFkZXIuCj4KPiBUaGlzIGlzIGEgcHVyZSBjb2RlIG1vdmVt
ZW50IHdpdGggbm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHVU8gUmVu
IChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5vcmc+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAg
UGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NtcC5oIHwgMTIgKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yv
a2VybmVsL3NtcC5jICAgICAgfCAxMiAtLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NtcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zbXAuaAo+IGlu
ZGV4IDBlY2M2NzY0MWIwOS4uYmVkMzlmZmYxZjhhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc21wLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NtcC5oCj4g
QEAgLTE1LDYgKzE1LDE4IEBACj4gIHN0cnVjdCBzZXFfZmlsZTsKPiAgZXh0ZXJuIHVuc2lnbmVk
IGxvbmcgYm9vdF9jcHVfaGFydGlkOwo+Cj4gK2VudW0gaXBpX21lc3NhZ2VfdHlwZSB7Cj4gKyAg
ICAgICBJUElfUkVTQ0hFRFVMRSwKPiArICAgICAgIElQSV9DQUxMX0ZVTkMsCj4gKyAgICAgICBJ
UElfQ1BVX1NUT1AsCj4gKyAgICAgICBJUElfQ1BVX0NSQVNIX1NUT1AsCj4gKyAgICAgICBJUElf
SVJRX1dPUkssCj4gKyAgICAgICBJUElfVElNRVIsCj4gKyAgICAgICBJUElfQ1BVX0JBQ0tUUkFD
RSwKPiArICAgICAgIElQSV9LR0RCX1JPVU5EVVAsCj4gKyAgICAgICBJUElfTUFYCj4gK307Cj4g
Kwo+ICAjaWZkZWYgQ09ORklHX1NNUAo+Cj4gICNpbmNsdWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvc21wLmMKPiBpbmRleCBmYTY2ZjljOTdkNzQuLjg5MzBiNjJiMTVlNyAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5j
Cj4gQEAgLTI4LDE4ICsyOCw2IEBACj4gICNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPgo+ICAj
aW5jbHVkZSA8YXNtL2NwdV9vcHMuaD4KPgo+IC1lbnVtIGlwaV9tZXNzYWdlX3R5cGUgewo+IC0g
ICAgICAgSVBJX1JFU0NIRURVTEUsCj4gLSAgICAgICBJUElfQ0FMTF9GVU5DLAo+IC0gICAgICAg
SVBJX0NQVV9TVE9QLAo+IC0gICAgICAgSVBJX0NQVV9DUkFTSF9TVE9QLAo+IC0gICAgICAgSVBJ
X0lSUV9XT1JLLAo+IC0gICAgICAgSVBJX1RJTUVSLAo+IC0gICAgICAgSVBJX0NQVV9CQUNLVFJB
Q0UsCj4gLSAgICAgICBJUElfS0dEQl9ST1VORFVQLAo+IC0gICAgICAgSVBJX01BWAo+IC19Owo+
IC0KPiAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBpcGlfbmFtZXNbXSA9IHsKPiAgICAgICAg
IFtJUElfUkVTQ0hFRFVMRV0gICAgICAgID0gIlJlc2NoZWR1bGluZyBpbnRlcnJ1cHRzIiwKPiAg
ICAgICAgIFtJUElfQ0FMTF9GVU5DXSAgICAgICAgID0gIkZ1bmN0aW9uIGNhbGwgaW50ZXJydXB0
cyIsCj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
