Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B92DF327B4
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 07:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r0uXpXIcGEdGFxupnZqfFRbuw6HGWeah7LCWS7YLdIw=; b=RUhvAuFGk2Bjf6Qm/BATK9AOt/
	Efb3yEmSrti0XuPg+BetaWf042qJgmnKNpDVC+khxFlnyJ2k6iRJZFu//n3LNekIqAXrysH5rTXjY
	6o/7Wd0R3PLgFJY0mX9cyWCo+NBMB8HKV0AQ0BqMqS1A8NMGHSYjKcFScGSw2Gy5acR9NBUPYyEbQ
	KeEW9+XlbPjNllonyDLmaDZESUrUqoInbZOkpdcPTnC/0QAdHAWD4TrMEPvUPrh1DHVbxBal9U2Ip
	73kJftxkzwc7ZJc7g/HWfLOhYvBOn2Cfg1474NDvs2bUYs1fSwXtq78UI4sq2yu44NXzsDjA8wlh0
	5tavAtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5Wm-00000008BPa-0vMQ;
	Tue, 21 Apr 2026 07:28:12 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5Wi-00000008BOf-3PM7
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 07:28:10 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so540072766b.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 00:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776756486; cv=none;
        d=google.com; s=arc-20240605;
        b=Knoi54ePFAc31O+d5wAZn18UL4DMcYIx5/n0SkcuwTBmCEv8GH0ZWBpgA73gHAPXO/
         aHQXPsCMSg6LYBCUKh9k6PAtVC9GlVYVilrjdHuL1mxTLIVHG0o5exHBLqRB2NlP3UWa
         6VrOnoFk23hcYn/mv1FISGGYIdwtmCiJpgUnNwI865NnKdXvh9U+g+xfPwSv9v7iLzZQ
         YE/NBbmySk69ufy1AtarBZWzS2NCEoV1m3zRhrTQMThcjREXfMLz+OwtllXw7y71z6nd
         y2Yxucz8Dz4hezS0bniNd8nDqi6V7cP1uRF1M+AxJBQhmCrcEiWtTEnTnhERcKe9aFDb
         A4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Ql38lC9ZYoXrn3/+8/I12f47H5/KcGWLQDIbsninAQ=;
        fh=4X0sL6Z74hrLjnat/OAQwWYXq3N0s12t7vpiM/6D0JU=;
        b=JwX9d/Kjkt+TdLbtWYZZUm1MKC+jdOfX2vLvt5+o9vYKYAKn57vwOjgdmZT/rwcSwj
         J50LnOprkJqfYv7JnTfQ9bPCIsmf6A/MxbxNd67+c8Ncl+3SF+1upsYlX6SyexZ9gLmh
         glV/REbVQMlh+AaTsgwu5rzw5ppkAaExWJN7MLUNM7/lFbqiz7/6uY8HmoE2u1ul1BqV
         +azhuvE8Xb5Zoc9Z3VVYA4sruEyIijtnCx7WGGRu6iyKBglw7UdR+X/LFCzC+hEM1th9
         JeBxbTHALUIT5x9ZwUVD3nemgYSaL9gFLlQ1YsmOnQOYE0vw3lOCo/MJBkkGk/RWTJKX
         +rtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776756486; x=1777361286; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ql38lC9ZYoXrn3/+8/I12f47H5/KcGWLQDIbsninAQ=;
        b=O/jcfNvVEwUlcJSyZFOuO8VeZHceO+MkLTqcz5ymE+1zxK+BTkpaMOz1LlMA3T9K0h
         SsMDRLPo0KJulZ0AR/xLd1oXdxoY7bJA29nTFLn5i2CtZy/VHcEhOIHKsR6ccu0zq+uL
         RHMY7b6udhRQOlcQrkUiL95EQZAKd1JyTKrTuXNVljMImFs3QahBMkr2WqAEwJd4FDBA
         nRGLatSuZ+Xy9Lv5dKX6gpftYh9YgbYbAYx+47vr8ruzvOy0sqd4v4DrcVQz9JsaibbJ
         QzONhzSK3kyAKfwZ3xf0TEMPsjfz3iSE6gNHn/sl7CKdcOs9/r9K2kTyleQiVSwBL7/n
         hFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776756486; x=1777361286;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Ql38lC9ZYoXrn3/+8/I12f47H5/KcGWLQDIbsninAQ=;
        b=WVXpZlIeTvqSQKz756GG69x9P7Zfwt0T9LEnLAsHsH5Xw9Rvp5nSpy+hX9o4zsr+ta
         4ryu+3n0/txxVpSK54jjBR1aM6/oXXnZd8ywA7wZGI/Et9a5DkaABq8157NxqxVX1l6F
         8LCutBJssobOoYwMCkj3/jyL4OZKl9pgYbapbKKccBlppnj4dOszZ9bjaY6wUJUNuyUb
         8IlnH/5Xypq7U/g0c4IEaytTcH6JqeFSOBdzHADMfzNR0iIALhsYiTQ3mE713F4rOG3K
         KFKBgGNGIcTiDvdqkyC4y3QLhekuPhqu9WBezLme7Y8PAci9SHEnBRFuPtNK6YUP9hhD
         5O+w==
X-Forwarded-Encrypted: i=1; AFNElJ+cPdoR3rwI1Bd+4Q8T3TB6CbU0RODfIbhx4jcBOPjmrnG5CcMm1VqO36fYKZvCZxv5N80TD494mrkW5A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt0jTcUOY4IkkJeotw7rwQB0ca1RP7m5J8AteSKLuVgeQOXXQY
	4h3ENXnnlSNhdqDZ5t2Lp+NlKLy8QIIrwRqw6fWi1nF5v7l892XgXGAKyqGafftMP/DyeOvHq3C
	Wg3BDk6itLe32kOGJsdweQ/uLUJfvgFI=
X-Gm-Gg: AeBDietTw/4FFng68eeHb28Az7d41eBfJc9lts/0dLy3pav43tXBCk2Jv8jI4aOzO0i
	4KU6Qq8/DgeWpjNIZOQl86n+TruwUFunw0ryKTainZhhSLT91jdQBmErTIubWHRJxe49Cv+oEAC
	NCtMpa10RAla2I4K5PK5sHTJGSrFUnU2hydlM/YQKBCgjrQbN8XhFu48PywUtpCF9rEuxZG5SbS
	n0julb6qiCBi0kXEfqGRAstmDQjoyjCF1ww46P4MyeFpMpwf1XeEQYXgprsaRpVRWdtDRwMGqiN
	p1olJU6RXJNjGzg=
X-Received: by 2002:a17:907:3e10:b0:ba8:61fb:a927 with SMTP id
 a640c23a62f3a-ba861fc2f3emr295974966b.39.1776756485914; Tue, 21 Apr 2026
 00:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org> <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org> <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net>
In-Reply-To: <aeaXszeaE62rM6BJ@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 21 Apr 2026 12:57:50 +0530
X-Gm-Features: AQROBzC3b4LUDC2_89z11CxE5Y66IyoxVuaubMCzdKHl_KwSO1e5I3jSF-QRINc
Message-ID: <CANAwSgTXwhkV=QEJqzY3WYV9+uy=6zEN9aEktinswFARs+m4sg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Anand Moon <linux.amoon@gmail.com>, Shuwei Wu <shuwei.wu@mailbox.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_002808_872586_2579065C 
X-CRM114-Status: GOOD (  16.54  )
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

SGkgQXVyZWxpZW4sCgpUaGFua3MgZm9yIGxvb2tpbmcgaW50byB0aGlzLgoKT24gVHVlLCAyMSBB
cHIgMjAyNiBhdCAwMjo0NiwgQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVuQGF1cmVsMzIubmV0PiB3
cm90ZToKPgo+IEhpIEFuYW5kLAo+Cj4gT24gMjAyNi0wNC0xNiAxNzowNywgQW5hbmQgTW9vbiB3
cm90ZToKPiA+IEFmdGVyIHJldmlld2luZyB0aGUgQmFuYW5hIFBpIEYzIHNjaGVtYXRpY3MsIEkg
Y29uZmlybWVkIHRoYXQgQnVjazEgYW5kIEJ1Y2syCj4gPiBCb3RoIHN1cHBseSB0aGUgQ09SRV8w
Vjkgd2l0aCAwLjlWwrExJSByYWlsLiBUbyByZXNvbHZlIHRoZSByZXN0cmljdGlvbiBlcnJvcnMs
Cj4gPiBJIGV4cGFuZGVkIHRoZSB2b2x0YWdlIHJhbmdlIGluIHRoZSBEVFMgdG8gNTAwLDAwMOKA
kzk1MCwwMDAgwrVWLgo+ID4KPiA+IEFkZGl0aW9uYWxseSwgSSB1cGRhdGVkIHRoZSBEVFMgdG8g
bWFwIHRoZSBzZWNvbmQgQ1BVIGNsdXN0ZXIgKGNvcmVzIDTigJM3KQo+ID4gdG8gQnVjazIgdG8g
YmV0dGVyIGFsaWduIHdpdGggdGhlIGhhcmR3YXJlJ3MgcG93ZXIgZGlzdHJpYnV0aW9uLgo+Cj4g
QWN0dWFsbHkgdGhlIG91dHB1dCBvZiBCdWNrMSBhbmQgQnVjazIgYXJlIGNvbm5lY3RlZCB0b2dl
dGhlciwgc28gdGhleQo+IHNob3VsZCBhbHdheXMgYmUgY29uZmlndXJlZCB3aXRoIHRoZSBzYW1l
IG91dHB1dCB2b2x0YWdlLiBBbmQgYm90aAo+IGNsdXN0ZXJzIHNob3VsZCBiZSBtYXBwZWQgdG8g
Ym90aCBvdXRwdXRzLgo+CllvdSBzaG91bGQgcmV2aWV3IHRoZSByZWd1bGF0b3Jfc3VtbWFyeSBi
ZWxvdywgYXMgaXQgbWF5IGluZGljYXRlCml0IGNvdWxkIGJlIEJpZy5MaXR0bGUgYXJjaGl0ZWN0
dXJlIGNsdXN0ZXIuCgokIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9yZWd1bGF0b3IvcmVndWxhdG9y
X3N1bW1hcnkKIHJlZ3VsYXRvciAgICAgICAgICAgICAgICAgICAgICB1c2Ugb3BlbiBieXBhc3Mg
IG9wbW9kZSB2b2x0YWdlCmN1cnJlbnQgICAgIG1pbiAgICAgbWF4Ci0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogcmVndWxhdG9yLWR1bW15ICAgICAgICAgICAgICAgICAgMSAgICAwICAg
ICAgMCB1bmtub3duICAgICAwbVYKMG1BICAgICAwbVYgICAgIDBtVgogZGNfaW5fMTJ2ICAgICAg
ICAgICAgICAgICAgICAgICAgMiAgICAxICAgICAgMCB1bmtub3duIDEyMDAwbVYKMG1BIDEyMDAw
bVYgMTIwMDBtVgogICAgdmNjXzR2ICAgICAgICAgICAgICAgICAgICAgICAgOCAgIDEwICAgICAg
MCB1bmtub3duICA0MDAwbVYKMG1BICA0MDAwbVYgIDQwMDBtVgogICAgICAgYnVjazEgICAgICAg
ICAgICAgICAgICAgICAgMiAgICAxICAgICAgMCB1bmtub3duICAgOTUwbVYKMG1BICAgNTAwbVYg
ICA5NTBtVgogICAgICAgICAgY3B1MC1jcHUgICAgICAgICAgICAgICAgMQowbUEgICA5NTBtViAg
IDk1MG1WCiAgICAgICBidWNrMiAgICAgICAgICAgICAgICAgICAgICAyICAgIDEgICAgICAwIHVu
a25vd24gICA5NTBtVgowbUEgICA1MDBtViAgIDk1MG1WCiAgICAgICAgICBjcHU0LWNwdSAgICAg
ICAgICAgICAgICAxCjBtQSAgIDk1MG1WICAgOTUwbVYKCj4gSSBhbHNvIHdvbmRlciB3aHkgaW4g
dGhlIG9yaWdpbmFsIHBhdGNoIHRoZSBidWNrMSByZWd1bGF0b3IgaXMgbmFtZWQKPiBidWNrMV8z
djQ1LCBmcm9tIHRoZSBzY2hlbWF0aWNzLCBpdCBzaG91bGQgcmF0aGVyIGJlIGNhbGxlZCBidWNr
MV8wdjkuCj4KWWVwLCB5b3UgYXJlIGNvcnJlY3QuLCBJdCBzaG91bGQgYmUgY2FsbGVkIGJ1Y2sx
XzB2OS4KCj4gUmVnYXJkcwo+IEF1cmVsaWVuCj4KPiAtLQo+IEF1cmVsaWVuIEphcm5vICAgICAg
ICAgICAgICAgICAgICAgICAgICBHUEc6IDQwOTZSLzFEREQ4QzlCCj4gYXVyZWxpZW5AYXVyZWwz
Mi5uZXQgICAgICAgICAgICAgICAgICAgICBodHRwOi8vYXVyZWwzMi5uZXQKClRoYW5rcwotQW5h
bmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
