Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA42C48BF6
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 01:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2/HoYWMzh79fUUet5YdKH/zEX+bgluMdpb3DsWk55Q=; b=YY2BpkKNoG5J6S
	2WQF43fNCniX4ELu+kX7pa+/gC85dBGpjVHz0xMkuxj/S5e50QBZo51y2OLNtnsr0i+hPY0SZBbXE
	cFIhJBMZ+HY6uTO8DoRnAlxbiEwiGvPH08lqfJJxf3EjSQPDXtVq3VoP1QvGRwAfY7F+o0FjuXnG3
	G/zLF0spsnJiUiPQZEiJvZLWN3ebXgVLauwz/T4lWoqTN3uR3Oa7pcNH02SVVAGdevtDD1iK/gHLU
	JAXT5AWFsPXvWOgP1C9yg+Er9jF8QEF3bzvPfwKouEeeEqNjCLPEE4LsHmLD7vDNfXGcCIoDOLiC0
	3/tvyriqr7EvO/jIGLIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhJtK-0000000BQeM-2fr6;
	Tue, 05 Mar 2024 01:46:50 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhJtE-0000000BQcf-3kKl
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 01:46:49 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so3612103b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 17:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709603203; x=1710208003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q8XfC8X0sSBGJM5X8fKplgHHh/I1jIORCkIdpaZ79U=;
        b=KxWlh6bzXFD1wnN5vHksnBwZVC0qcLYQIrNUPsBAGy+AufTPL/8yVpBK/kTVSCIY/A
         66JFvVjaEGcMOlByi/xswrzrC0XJt22t/CeHLRiNobnA3cTQG87mAPkZZxepIETmUOhK
         xY59so1SD/UR37BJ27UXuUl3+JYsBsiwnIsv6TCvEZN0nGlVEpf6T22AnjLOZJuN1XPX
         w+NJpbz25mid2ARLzpQISqZUQhtt+v2FZebkbDhK4esKN/eGpP9WrdXJUY1DqtwpzggB
         eCt6pu42XlwKdpe3Qk+MaTvzp/msthTJvDp+Xl+PvSWen6HQuVJbZl8fIfk1+EfN8abh
         00ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709603203; x=1710208003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5q8XfC8X0sSBGJM5X8fKplgHHh/I1jIORCkIdpaZ79U=;
        b=fF88l/zQIcpdsy3TV/bKTgYHEPAtsPTczbNG34ONdQg2QxDtKcEcQcrqUbPzOFBjmC
         I9a771RjtZ1WsPMfCTkW6x94YQaqURlo6e/tTMLu+0oXmbgUGNeq4SAAG85qRwAANmjR
         nZTPW3FykjqhKXoIdJdVPYdq6ItwHudR8oS8hQGtFoXMAOJrH5vGh6riiTNEMWPi5OJv
         pZ4jzuyQZi8f5xhpQQxhZCtCkERFx54mUzW+FnKC6B6D0Ry8Nro0BYgPsFkKG8o/lERA
         +utKag9WjjEr/9Dp2jhqQdsKySd4YO5sccvCsvU/6alz0jJ1oRq24TkpzDP6A9MsizUT
         U6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUw1GPsB8UN7troyc9Pj+aBkkrrt5eRrCZyMRc7XqSJPUWofMJzZbtBVRMP+nmM5xVA3NRZW6JS1n2Y4hMJP6yA11BNEg/Xye0QeghuCJEG
X-Gm-Message-State: AOJu0Yy7+YyCZEHBSSnBzZ07atqKjv3/BKqkSOuw4L27r1+i7Q/Ix87g
	935mjCQAFLt9r+dFSPlg3AmZMjWdwfgOp24sBL0gt28r9hgvItsDGbbrlty/CbZZdZgLRJbFQw+
	0RjTazUMS1ZLXquCPdTWUFRVL8IM=
X-Google-Smtp-Source: AGHT+IFTj1MPlCHGWTdjZLDUdn/iWQfX/NaKINyMcQIMj2NwGyAsVchqCPjJu8IIopxsRzD2KEj4wTNPbDXiBH20iu8=
X-Received: by 2002:a05:6871:5b28:b0:220:a23c:6786 with SMTP id
 op40-20020a0568715b2800b00220a23c6786mr475843oac.11.1709603203177; Mon, 04
 Mar 2024 17:46:43 -0800 (PST)
MIME-Version: 1.0
References: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
 <20240304090248.1247215-1-qiujingbao.dlmu@gmail.com> <91f0a339-ac0e-49df-bd26-dbfe1485308f@linaro.org>
 <CAJRtX8TPz_jTvPmuBW8t=mC+BR1kWmu=GS9K1k6ys7U9u0ENFw@mail.gmail.com> <0c957a95-9f82-41c2-8e2c-0b5bf4b061a4@linaro.org>
In-Reply-To: <0c957a95-9f82-41c2-8e2c-0b5bf4b061a4@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Tue, 5 Mar 2024 09:46:32 +0800
Message-ID: <CAJRtX8R-j6BfJC6We0Xh1e0sYe6_CyUjbznf7e-kNmcF0=Bcjw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: u.kleine-koenig@pengutronix.de, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_174645_011272_EE4BD502 
X-CRM114-Status: GOOD (  17.36  )
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

T24gTW9uLCBNYXIgNCwgMjAyNCBhdCAxMTowMuKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAwNC8wMy8yMDI0IDE0
OjQwLCBKaW5nYmFvIFFpdSB3cm90ZToKPiA+IE9uIE1vbiwgTWFyIDQsIDIwMjQgYXQgNjoxNeKA
r1BNIEtyenlzenRvZiBLb3psb3dza2kKPiA+IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMDQvMDMvMjAyNCAxMDowMiwgSmluZ2JhbyBRaXUgd3Jv
dGU6Cj4gPj4+IEltcGxlbWVudCB0aGUgUFdNIGRyaXZlciBmb3IgQ1YxODAwLgo+ID4+Pgo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBKaW5nYmFvIFFpdSA8cWl1amluZ2Jhby5kbG11QGdtYWlsLmNvbT4K
PiA+Pgo+ID4+IC4uLgo+ID4+Cj4gPj4+ICsKPiA+Pj4gKyAgICAgcmV0ID0gZGV2bV9hZGRfYWN0
aW9uX29yX3Jlc2V0KCZwZGV2LT5kZXYsIGRldm1fY2xrX3JhdGVfZXhjbHVzaXZlX3B1dCwKPiA+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaXYtPmNsayk7Cj4gPj4+
ICsgICAgIGlmIChyZXQpIHsKPiA+Pj4gKyAgICAgICAgICAgICBjbGtfcmF0ZV9leGNsdXNpdmVf
cHV0KHByaXYtPmNsayk7Cj4gPj4+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Pgo+ID4+
IFBsZWFzZSB0ZXN0IHRoaXMgcGF0aCAtIHlvdSBoYXZlIGRvdWJsZSBwdXQuCj4gPj4KPiA+Cj4g
PiBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuIFlvdSdyZSByaWdodC4gSWYgdGhlCj4gPiBkZXZt
X2FkZF9hY3Rpb25fb3JfcmVzZXQoKSAgZnVuY3Rpb24KPiA+IGZhaWxzIHRvIGFkZCBhbiBhY3Rp
b24sIGl0IHdpbGwgY2FsbCB0aGUgYWN0aW9uLgo+ID4KPiA+IEJ5IHRoZSB3YXksIGlmIEkgbmVl
ZCB0byByZXNlbmQgdGhlIHBhdGNoLCBzaG91bGQgSSB3YWl0IGZvciB0aGUKPiA+IG1haW50YWlu
ZXIgdG8gcmV2aWV3IGl0LCBvcgo+ID4gc2hvdWxkIEkgaW1tZWRpYXRlbHkgY29ycmVjdCB0aGlz
IGVycm9yIGFuZCByZXNlbmQgaXQuCj4KPiBJIHJlY29tbWVuZCBvbmUgcGF0Y2hzZXQgcGVyIGRh
eS4KPgoKVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24uCgpCZXN0IHJlZ2FyZHMsCkppbmdi
YW8gUWl1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
