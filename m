Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A43C44500
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 21:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HlJvwTCmlcd2Za5Gdib5ty52skXep9o34ml+EbTJE8=; b=GDiFaVDjCAjxf8
	Bl0TnofsovPg3U98BuR4Vr0nQ1txUffBhH1ZFegl697zyKmk5OYxsdFY/GJ3e913kHsP6o/7Gtv2P
	LWgHLMzjIamLJvG5oxwA+snoeaHiO3trSMzyHoZeRlXWHr1ORrpTmnpPAg9QZAfq73sFrGjD+B6+W
	I0NQfbEe6hSEf7XBy/e8gcdYUuBmGZ1+trUP0N6VAKMacthmiaAsGVGgEwOy5/GTYBGoR83ayj/5q
	ZFMirXIiTsLNehLEW0VQquAZ9uM/PtuMJ2lnrGaExjqIuDUqp2IwaSIgGx5RbsZNWl8g7vLgI136/
	G5KszANZzjQ4gqbZ+nEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifNu-000000063NR-04wv;
	Wed, 21 Jan 2026 21:05:02 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifNr-000000063MK-1iDg
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 21:05:00 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-65832e566edso430437a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 13:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769029497; cv=none;
        d=google.com; s=arc-20240605;
        b=ZDCkuNle1Kzmr2CzEq5xqh9v2L4Ywy4rPrMaLrGGPkAhasC2nqu9OzX49cM3ULS9q5
         Jl2p29Fn9zNDmuWy9Tz+W+zJPOV8zlwtvDSiXPbYiIrI7KQXnPkwFUWUR6vNzBbLSGa1
         E5VH7bAtb67qY14mxNQRWgjLkoU0jhPO70YNtbjzjZvxppFu603Q4hk+sKZaDIbA0heS
         Dd7ldnIUVFIxIWY2yK020uJ3lVaiDIxssG1ESlwIBHC9vREBN5RYG3CfvpiLN+sZH0Fj
         9F2TbO6Ism7qKAvAGYxCm0RkGGL59RbmJazqz4A0r0a+asTQJnvAQd6hB5nYObQUxlBX
         4OnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gSLjnwENfDdpz+9PItfkrLqKgChq1TKHNQUCVDDelMw=;
        fh=NztQwOsrgLpheifJXu9g3gX3cWtNo2EUaunTIGtSOxU=;
        b=YCsjB/htsRgZe5+tRNIXpCa20xF58r/Q3NmL5H7MkNR7ii057AWk0eI7FNmDrZeqNL
         TwgIdNjiYDJiyO1Rb+u1T7aUR45T+6TSH/5oZArBqNazmMmI2W1EeyEnDyvOZ6jxXxMS
         cI/MQaElu+MwTDerj8VJ0ZYUj4h0M3HpYy549BulwxA7YnYvCgBWEjnz4jrGNaW6Dlm+
         pN8e5CGikyiL21/HGWvVFGhV1uqVoLohB4VUW0+YQtOBK1d3Km5tHdwcce8X9kRThINZ
         yWY0SB5ubcz2zGfg7OTvdgPL0CpDbTL7PZceaoF6rQj8+2mjGNWIDNlBLjsUoKWLiIYz
         BB4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769029497; x=1769634297; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSLjnwENfDdpz+9PItfkrLqKgChq1TKHNQUCVDDelMw=;
        b=U1hZVJgCWfihOsdVJzy1+HiVQn4j7/9dn5JOOajAiKc3ZSDJVR+Sg8v03lxBq7biPs
         GOLeUIRam8jijE/8cFKoPLoC19chc1DDrWQ1E616gMF9emyebhn529JsAsQ3Z2408Dyg
         gGr6psLubYtke9dQzRX88UfNepuh/2Ab+Eo7QdZm3Gwe4Dgs9mBDg/Yy6sK6qTWHEaOU
         /et+8I+kVQSWKp+06QNoWBa0n/WHKHOl4Iv6uh5EBSDjX07XShyRYZKW+g3wYQfitq4d
         /IN+/3MfgXcD7CG1OjsR7Itq/m3TNehPFtyu19Y5iQiF8Ji1WHu7OdLm0LFzblvCPHhF
         HfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029497; x=1769634297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gSLjnwENfDdpz+9PItfkrLqKgChq1TKHNQUCVDDelMw=;
        b=i3VRi2HdUubKHeRJo7F4G/aryco8wSWCtxzu1I3NyAccIA75cK74Xfwoaz/8P/o2eE
         /IyGrwGJFqMrCB86IHND71LVa4qCEhyPm6soiQmAq1VFmKEIlIWYEfpB57hmOM2PnJs7
         ASuPkyabn9NjCRqmX2w5rhWHUqiQZr5v9+hzS3assl620GwM+gEnJDPXcFbOkwz+z2Xc
         rljaRhHzUD9UBOuFzrQsQs7ZsYwyYWWaMS7fZnd+TWQpo3DI7iatm6ClqA3GiTQO88GN
         34E8/qlEBMVpLIoiv17a4rPv5jLyHVjMIZw+ldn9Rf1B0yenJJXSV1ZCeH2HcwyanueP
         uoUg==
X-Gm-Message-State: AOJu0YzkW7nuhx3/5RcOhoqaYNzt27rbBf4Ok+utRLNzEHKa8EE0uZgm
	6xK7rC15MTNRcbti1QVULa1Ki8mQWF1DrER7qSM922TrnHke6kBci++KEMPaDJ5vChVq31qvlAe
	pVDqoq5oOcqLyVtrgScio2mmFSP7BFb8=
X-Gm-Gg: AZuq6aJTSteJrWk9+smQku4P5XMy/xKPPM0m1mQaZRD2nSBY2WntM+gF9BJ5ng3M52Q
	mwxEdG218HDtJRsdY2IoTTJyYyAWuv7ThCqMXEhyBc1RBf2zVZ9IkeThCpmgBY2H5aWQNxNdw60
	UUq/AC7D4tCLGC8+/H4/mSmrHC0L8SMu+mv1wr2RXIpB3n5BKhq2pf3WpGcjvrOrRGdbcnVjxn3
	DZhPXS2D4+sN5w6Tpf6S3U9WGOnEEVgDdP0wh/77e+w6nu75iJh4BEKje1UHkaHlXaF
X-Received: by 2002:a17:907:3e8c:b0:b87:2579:b6cf with SMTP id
 a640c23a62f3a-b8800348798mr542186566b.41.1769029496665; Wed, 21 Jan 2026
 13:04:56 -0800 (PST)
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com> <20251214163537.1054292-4-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-4-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 21 Jan 2026 15:04:44 -0600
X-Gm-Features: AZwV_QidXXkyj2bjrzSiHllVK1M96P6KIDzPQnqs0PpSlQkqnW3H1x2SSHe7zuc
Message-ID: <CAFTtA3MMgY5Nz_ZvQNfVijjTpk4w76B3keQjCLzftuFG05PDfg@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] riscv: csr: define vtype register elements
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_130459_485990_A9586B74 
X-CRM114-Status: UNSURE (   7.99  )
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

SGkgU2VyZ2V5LAoKT24gU3VuLCBEZWMgMTQsIDIwMjUgYXQgMTA6MzXigK9BTSBTZXJnZXkgTWF0
eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBEZWZpbmUgbWFza3MgYW5k
IHNoaWZ0cyBmb3IgdnR5cGUgQ1NSIGFjY29yZGluZyB0byB0aGUgdmVjdG9yIHNwZWNzOgo+IC0g
djAuNy4xIHVzZWQgaW4gZWFybHkgVC1IZWFkIGNvcmVzLCBrbm93biBhcyB4dGhlYWR2ZWN0b3Ig
aW4gdGhlIGtlcm5lbAo+IC0gdjEuMAo+Cj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IE1hdHl1a2V2
aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5Ym5h
Y0BnbWFpbC5jb20+CgpUaGFua3MgZm9yIHB1dHRpbmcgdjAuNyB0b2dldGhlciwKQW5keQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
