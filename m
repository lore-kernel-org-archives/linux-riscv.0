Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD3810F3DCE
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3s5RUdFf1ITemwK36DUZ0UzFXB5Yg1ZbviWggx4BHws=; b=C+Iy/VguTA4s5U
	R6C8O8zsMxwiYoH+QfZciQzTTzHQ/5WnQLNO0bp+kzbUi/l2sdY19+Tar+wZwDpBhnGDZ7+CScMAW
	Ln1W5JEgbczwSVBNlgyoyf4IMB9TYAxZi1uKhXtOMV+EcrEHU0Al1Y3qwMPaOJF03xVuEgLTnQVAw
	Lh8TWZn4Vaur0vmrj54dlSAgWbegbfqcmNTufJcKbeI/mXQwSEBWyrSVL1WxEdCPSruf/XpBc4+V8
	5ehq6povhqir558tGAoVOmNTQ0ViMIQuFyriPUUWJrUB7SmbyfkjNCuqAJrTAMppDVrcYt5kT1rpV
	iTkjb8i/bqwqbFoosx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6U6Y-00000008zWz-05FA;
	Sat, 28 Mar 2026 13:53:34 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6U6U-00000008zWd-3vjX
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 13:53:32 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2c44547f6d5so14368eec.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 06:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774706010; cv=none;
        d=google.com; s=arc-20240605;
        b=ek4SP4+vfg0LHWCIRpX1EXOv6MQCNfO4hx2dNlCPgnFJKUQkNYDJAoCRA85RpQgkpb
         2zl/LQWm1Tj5kuSKWSgITBT+y7oQoUiMdUgWXGy2yYFfqUk+3IUBRp6d9agqet4kCuUX
         NryhN6KZHzKZYJwUAJH4ZRo1Fdby+4gOjE7da7kaNh9XQMlNPiKA+6llzmV4kwOgNW1s
         FOuE16IPzShm0K6Rtugtkofv7dwHOyrYZagTVRkZnc6ULWU5WKqV9SA8GovbI6iavJ4V
         4LGBSPN2YU8IGpRNk1KW/MQQMxPYL+e2XzztV0R3KLMfgF6UwXLhJ9vDVFO02YeJA+Ov
         7liA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAAaLa1sKBGqgetOeHXl/eZDgOECB6DkSmQX1X2/W1s=;
        fh=TMs91ga1l88XN207QtxFcw6WWRkJYbPuHt/wLZQPhSs=;
        b=UuRijWEgkcK3ui83HdKnOdcZfcSlsfkPFsoq1w/1XGNb6kRpZHaXKgPzm/e3/iV5rp
         NPIrIhmxWcya2JZwbqUbc43VLTNHv5sbpVMK3LnSLw3uZsD6c8DzEt2Zjezkl3Jhh+yh
         jyxK/Kjkkyonh4R2rd4lAxNhsoIHPrjXeXF5XlIFnmux+kSC36jxs/QKOS4Ygq+QLQSE
         +Ef8AEJyCOO3eFT92zCVVjuIXobDCpn6iKFcpsSuNt+tt83Lu5qFo0Na/MEjIH/7BbZr
         L26VMtWUb04jScOkfQ2CRcCClnf6KPkfjyBxxOvYw2qyMoZoAlE8XCLuzz5v1GG/96aM
         5BVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774706010; x=1775310810; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAAaLa1sKBGqgetOeHXl/eZDgOECB6DkSmQX1X2/W1s=;
        b=Rmgy+imMlal3albQMb9Or8neaVNAMkx+oI/rhPQHFBZXS7/xpnGF/fOkfSlDCAnudO
         +RPToR3ophmIO2P+lel8T+MdFDauqr1v33gqUbWfcaWRkyFl3IXO5OnGW2UuZVwRK6SC
         RG5erqszA/Hcc8BfGDZ744TFVCZwcHjN1wYNlaQrsTRSPpSl1F6BwnE2/sa1bCxnjBwc
         v3/Wkq/3NPDGxx2N3JHgL1AzW+7C43ddlPRmy8jU8iBoun8bDUVwl8EZH0bUAO7vOgrd
         LhFKBCqH/kflUgrOyDbCJz2BCc+4TfDho88pjHVrNTuhFsI798EF5z/ZPDypvtxiunAF
         tSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774706010; x=1775310810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VAAaLa1sKBGqgetOeHXl/eZDgOECB6DkSmQX1X2/W1s=;
        b=rO2YVwpb1safuC7yoQC0wSrbd2kbDQvV5w010WGxu3NL8rDvR114z2MyLUm+4Gu09f
         Em4w70JU9BuT8T2zottrCHu9xk2Ot+lh0dYjwjevuAIG0zLE8lPcS/8gjhG70ld36SCG
         u+/iBALzjMOxQSxOZX2OrImWkfG0gVnMxYg62OplQCMFLchgvH5njBAvsDRFNdlQaMqU
         8qedyYJEnQ9up+sBqdZfKkfD21ltlDY6kE42pz8XqpaRWtb+iLMGNSCTlLwv5hU7fDrV
         Kh0Ovulgf59/7se55X86Ij3MMeDE5zs3xgjwg9f1n/Y+fe3hEjOMhjC3QXKKD7yWt68H
         icYA==
X-Forwarded-Encrypted: i=1; AJvYcCWPwBGJhCOeoRj7ihzDF4Rs+ru3IMVOo97zZ4wsmZPKs5HmRbE3tcj2bQmfzFmt7LQkcGft8YDBsBMxaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzso2KXNcbkW3XactncW8GwgEU9jjll636n22q/cHtLbmNeGMT/
	Kq9dKxqe3JD5kBZtTYin50j+ePkkyY6pY1FOdGW3ndXNleCuBFf8e6pB4ZanTtyGof1kzP2zVIN
	+wBzJ6ssZ5Piaou4YdyF/CCP3S4+9jv0=
X-Gm-Gg: ATEYQzzkNrCQJICfuBOM3B3muxSqVBei2LptRfuUXSHt1QO2vdINcf1BSyBer1YoEk3
	0TrulNStLuQOGpkTgc0hD4AMNLamoG+lqHTJs2K/L672jGSxcHFrFmuSqAQdCGsEN0mWaV6tuN9
	deB9fcL0q8ReasvRh/Hr5Jlj3mUPxzNwVaaCa2J61G2JdHxIJhoXxerXTo83QtQOfx/DHDzxnaG
	JfnXuO5Yh0eB+3sN1hLx/pBz1egJIIhA8iAwbxJFCaYp+RtGYTrqVt+mG3WLx9peMsx9EGbR1Nr
	Cl8PLBe7eqJwq0xCYHgmX5cg77Urdgixaqcf3bAh/MNcnxJQFwujEgoFoVFbiTE9TfWKhc2pgZq
	tKxDp/qUJ0XRFI8v7kGIOn80=
X-Received: by 2002:a05:7301:9f0a:b0:2c4:76a3:be04 with SMTP id
 5a478bee46e88-2c476b31c65mr246246eec.0.1774706009912; Sat, 28 Mar 2026
 06:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260121183719.71659-1-ojeda@kernel.org> <aYmgjEWaLrdsubKM@monoceros>
In-Reply-To: <aYmgjEWaLrdsubKM@monoceros>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Mar 2026 14:53:17 +0100
X-Gm-Features: AQROBzA8MjUBXYFRm6h4gop3ycXvMcobXQ3-8BaNpAO4VrnoBIXKMybPKp-xm_s
Message-ID: <CANiq72kk_UJVNbQ3aKuV4_LPFm-a0xjZqZyk57ZpkHp8yX8jzQ@mail.gmail.com>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_065330_998374_721E9EEE 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBGZWIgOSwgMjAyNiBhdCA5OjU24oCvQU0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gTG9va3MgZ29vZCB0byBtZS4gSSds
bCB3YWl0IGZvciBNaWNoYWwgdG8gYWRkIGhpcyBibGVzc2luZyBhbmQgdGhlbiB3aGVuCj4gcGlj
a2luZyBpdCB1cCB0ZW5kIHRvIGRyb3AgdGhlIEZpeGVzIGxpbmUuIE9yIGRvIHdlIGFsc28gY2Fy
ZSBhYm91dAo+IENMSVBQWS1jbGVhbm5lc3MgaW4gc3RhYmxlPwoKRG8geW91IHBsYW4gb24gcGlj
a2luZyB0aGlzIG9uZSB1cD8gTWljaGFsIGFscmVhZHkgcmV2aWV3ZWQgaXQuCgpUaGFua3MhCgpD
aGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
