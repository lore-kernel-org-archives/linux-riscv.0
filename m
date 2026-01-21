Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CC9C44500
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 21:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/h5t+Ju4Z4FRlCcrWG4OgTsMsJrcmDSUihWesxQwFc=; b=3XgTov++XX1BwH
	MN3RboFg8igHKMoydVZcUr8GXgBDgDqUBU3Tx2Mc+pj8mVff2Bonb1cmypnuHwYLc0gbKxNGO+JA/
	zO1/46iqoxEY0hyPV2RemL6sbxbAIfshespxXJruukrrdOGtTQn5y0o69dx/Bc7ctpkaimfTvJGop
	6OI2R+1LmV5A3NBrFWcQLBAM9tCS0l6Y+XxVDim+TIdzwoAu6OTeHB0nEFsJY3T6I5Kklm57RQK8E
	Vh4bk9EZnv21AsvW4EXg41qAP1W5UD4EsFo0+Zs4JuGL7YWJ7tmkPJeLsQCHGXXdln24imaQarPyc
	StBHgwAN/HXRiyU+9Wsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viftC-00000006539-0bYR;
	Wed, 21 Jan 2026 21:37:22 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viftA-0000000652h-0blH
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 21:37:21 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b872f1c31f1so38450066b.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 13:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769031438; cv=none;
        d=google.com; s=arc-20240605;
        b=HYlX/1PZfofbsGJu2FAxdyaDeF2WGfbA4AlHfUPPDw16R9Ek0zKX/QRN6rmkPNBKZo
         k/fgGzEjoV6kbOwbOcqfYj2JOT0vGKqsZtlU9KbAJstAhS0OOVyw4Nqffr/MSNgqb6tP
         MTllXEb0vD/nRod4a3s8prPL67V6qW+g2fzdOqCQFgnOIA8r0bidxT0PYnG6eNGiiRVc
         3t9Ax/MycRexVFvpq4o5y9h6SNKurX1/ErHusSJYj5QkshjfOM8kjTFZXhvdk8U0/u26
         lQLZ1exDcyKW6dmRjM4ykbanKMML11rC/1iqhLeRznGKsFJmzMtT6sh47O2jqpU5ZUUx
         jHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8BuAgZxAafKQAQjZdQ8lCCP0+fbooluWmWp/sP3ZGtU=;
        fh=NztQwOsrgLpheifJXu9g3gX3cWtNo2EUaunTIGtSOxU=;
        b=hsv85VFPbbn4nW1NMyWB/3qkRs3a6i+CBalxJColNoTAvoZ5AnMoUcijLL/gGteaqU
         11P5fazYzlTJC4k5gCAbPmYyIQ5gKOKFBgLQB0x+1dOdFTAPDbs45LTuwdvhBWalSzux
         y/3Cg2GQZTslOOXbUJVzUQbPJ0Ld5Rq/YGCpo1VTP39RRx1kQjfZrtBHOzFKmvqkf2Ss
         xCswiqiMkS6iqVn2L+8ujY/sIioXitIFFjRsXz8RSK6LGCdLdzjpuKAa/+XYmzD8aRAz
         b76nxcg3g8iaDDaUS2t2Dd4mSvlVVmqgPw/o2P7V3XCKmGvt+lsc3fw2XhOOxt6jTL1t
         kC4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769031438; x=1769636238; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BuAgZxAafKQAQjZdQ8lCCP0+fbooluWmWp/sP3ZGtU=;
        b=lBmT2KJWWcylap42akWuwDdm6XE9Yh5C5IFAfe5T2yYSeFql8oMfcDBm8tStmr2/Re
         ehK7VbDtsJbO0qL51Qs6G0KvnAJIkGhc3DetQYOqWJylUPION9EljtaPo87bMvPSvotN
         qW7Ytf6QyVum1LQBobKwA1taXbJLZgi9r6UpHWUxWWUzQ87VrM0Kt0O6HMz9dcIE0nwN
         x5X8MP2Vo8QxgMHxO09FuyV2Dd5AVWVRN+TdVGYvq0w+RDw8Zz8qdn7YV2M9XfJ8zkxf
         pKEu8d9qSLF9DVbKhBwtlm2y+SN1b80PW++m2gPJRELcaBOriy1d4eHGe4a3bOTVOaWz
         TIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769031438; x=1769636238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8BuAgZxAafKQAQjZdQ8lCCP0+fbooluWmWp/sP3ZGtU=;
        b=qqAAaB+mawSpVB9b9YixKsfHUSLrz5XBgU3iG1MQHRntxxsgK4gorr1M6OgcHwKKhe
         C0jTS/NSaaewMhdICMqV3r4/1i4vc8YDtsJ249SVXTCiPmP5Y5DIWFWOT6fZ7OUcAezt
         UYFyOiJRgSG9TNb8aL5c3xnvGmjqwY1k9jNdtVSqEbRBOs6FkmY8c7mh2kOvYAda2jEi
         xkNSEiUgMBWDkrZW0ClltVBq8cNOT2YSHKl4Om6U7R3hkwYSEWYYYDmsU4TQl1NDwWRY
         qUHIJinNjS2e/yuqP4JgAaR7KpnBVxhpz6xS47j5EPCrlDAigq4pmbexUbfFXtg9WcFj
         8yzg==
X-Gm-Message-State: AOJu0YwgdHasccQ12xfTz5SaEXenSwJswmDM4W4QakKc1fY1o018lmot
	uZR/RRl3nN1RHdZmMJHEVZutkd3BjEX71tpS9cqu6x/Jj07R1t5w4ua65j80D6x44X9pLPtRwj6
	fYAl3qhb/InJBL75LCXjx5DH5Ouvq+ag=
X-Gm-Gg: AZuq6aLVLONk1U3zh8Jkr+LPJr0F/HTv40tvWwwvg6Bmzr+hKD79PPn4H5y2+zEhSOC
	BXixnwhTiKTxTbrPr2w+vf+ZMRAYAQN0cH3TgrWz79wzxaLZInUpj9ExId6q265YjI0lmG8W79C
	uz7nCPrA/+AVMDFXOzbSbhQ6kHNlhLh33vjy0eJsecixC7C6yjTXMbwpL5QEl1TmzSPqxYOo2dY
	OirD7cJmChlRu1EpFuVKGzKoAdtGa6rcEuE1+1L9Y8UhK4Io8ViQEWwwVUdH/6yK2ftvQeG4Wdz
	tfI=
X-Received: by 2002:a17:907:1c17:b0:b88:3665:74ca with SMTP id
 a640c23a62f3a-b883665a7bcmr9859066b.34.1769031437830; Wed, 21 Jan 2026
 13:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com> <20251214163537.1054292-8-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-8-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 21 Jan 2026 15:37:05 -0600
X-Gm-Features: AZwV_QieYTZwjY2bYVtnrpCLc7UXxcKQyb4yI4hidBODn8DPsYh3TVbZ0S59xj4
Message-ID: <CAFTtA3MCNeB6yMKquy=7WsovQO9RJRFb8Ph-eP3W_QiRQJYTEQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] selftests: riscv: verify syscalls discard vector context
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_133720_198932_DB29A4AF 
X-CRM114-Status: UNSURE (   7.58  )
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

T24gU3VuLCBEZWMgMTQsIDIwMjUgYXQgMTA6MzXigK9BTSBTZXJnZXkgTWF0eXVrZXZpY2ggPGdl
b21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSB0ZXN0IHRvIHZfcHRyYWNlIHRlc3Qg
c3VpdGUgdG8gdmVyaWZ5IHRoYXQgdmVjdG9yIGNzciByZWdpc3RlcnMKPiBhcmUgY2xvYmJlcmVk
IG9uIHN5c2NhbGxzLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9t
YXRzaUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5j
b20+CgpUaGFua3MsCkFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
