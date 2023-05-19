Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C979DC7EE26
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30EGvfmawBaHgMgkUCkuEGdCCs0+w/G7d4kWoxSfDRM=; b=ENdVTEu/x2BTV7
	uUDdZb+pcTq6b/EMaKf4sUob99kZNZQV3owKh/xNi4EPyiJuFsXCE1tb/2A52rZg9uabrKaIFS0UM
	7d7I4grxigaQjiYx2L/ZobGLVkLb4bAKpfp8ahLlRxpQEAoB4jLwRSum5ZlzKqdvMAdYdUPW7w20G
	OpKvfh/s1yaU+yieU3gyMY0Q2U+dOv9KkzZNBUU7aEpXdYliqnbU2PWaUEVlzVf8Ov6z8h8jPgaBH
	1JF5gFou0VViehHc8tZ9aygS5QXsKTePsbi3wCxzR7Dr/hsjEzWbu+oV0KFHMb0KPXzfnNnPKVMFu
	WdU5SiimjJfaD85Xi+sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q03Jd-00GlYb-2s;
	Fri, 19 May 2023 16:50:53 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q03Jb-00GlXp-1u
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 16:50:53 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso6074646a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1684515043; x=1687107043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtABjzB0C4odF5c0xpse4cUAQWQzyn/IxLw5sIWp3wA=;
        b=5jFMv+RKVKdIkhypHP4y08tfdCV9hkIMZJ8Qxsb9Ky58QuT/DtVSobRoMgT0sxoj0o
         tY2UcczNDxlDLLqfZZxst8cn+BG3VWjev7T1kKUKz9vc5n92Jya8098evqNTIXnk6jEP
         uC2BrHe5N0G+xn6L5+Um7IVUq3jpF+8QIqFkJzrtwqML3E6d4Jb8BtYvSyNkP6KDsL6p
         HkiUefmkBhuhH9p+e+LYpEbG8wUGuQdhuIH2kAMKFE+ILzAY7/vDIZ9iY3abVIZscz+t
         rB2mKXzYaP73i+0UHovGtFicMeWFA4YBFHSm2iju3FXl6DGbWDziipD10ily2NQ+Rzha
         7Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684515043; x=1687107043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtABjzB0C4odF5c0xpse4cUAQWQzyn/IxLw5sIWp3wA=;
        b=XjeUYfvKVerDBd1I2agsbTjjCAMXJL864twBC3MKq1IbrZgbtFkBsRMDbkrYcfgnGA
         GTMn1DrQW73pmmYVjtyYRCB+l6Vn/1q6z8Dd4ncVlRyd8pTnvaaC1+i3AWh2KXOpK8zC
         NS1+OGscvdEMNBklW07W2j34Bj+etTvKaoSIhq/kJ2D7cirRW2KNr+Di3/1N6H653Gun
         d0+bk6iZxZddcRkD+5idhfo3846lxZb6M78xeSwjemd5/mjmoALuOHkM3bFyzV2eVWsA
         WebwtFwYQ+xTwpaI0UrNCIt0MEJrukYQUsHAe16peyTNcDw7rjjz6AozH6cQV3ZcoJSO
         idIA==
X-Gm-Message-State: AC+VfDysHTg6OYFl81An20ZhZCIjeP3DqKBaayoboKYJrj5BozP17NnB
	RaG7ZG9KATbCY1iBmPGQ0B6MXkIhxiA9OqNmZCpJcQ==
X-Google-Smtp-Source: ACHHUZ7Wa66h7rfCspUIEGJSIRWIT6LEQ5VwUl0kcVhQLSxwKBGekN9/RNnvcHqS6J/oIW2wTZKT2v4ZfW4OGKooXO8=
X-Received: by 2002:aa7:c303:0:b0:504:a2e5:d951 with SMTP id
 l3-20020aa7c303000000b00504a2e5d951mr2846985edq.13.1684515042920; Fri, 19 May
 2023 09:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230518161949.11203-1-andy.chiu@sifive.com> <20230518161949.11203-4-andy.chiu@sifive.com>
In-Reply-To: <20230518161949.11203-4-andy.chiu@sifive.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 19 May 2023 09:50:06 -0700
Message-ID: <CALs-HstHyZ055SDu8s_KyACERufD1tU8_hxM1UckN4YF4ms2Cg@mail.gmail.com>
Subject: Re: [PATCH -next v20 03/26] riscv: hwprobe: Add support for probing V
 in RISCV_HWPROBE_KEY_IMA_EXT_0
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Andrew Bresticker <abrestic@rivosinc.com>, Celeste Liu <coelacanthus@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_095051_631576_B4975C43 
X-CRM114-Status: UNSURE (   8.18  )
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

T24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgOToyMOKAr0FNIEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gUHJvYmluZyBrZXJuZWwgc3VwcG9ydCBmb3IgVmVjdG9yIGV4
dGVuc2lvbiBpcyBhdmFpbGFibGUgbm93LiBUaGlzIG9ubHkKPiBhZGQgZGV0ZWN0aW9uIGZvciBW
IG9ubHkuIEV4dGVuaW9ucyBsaWtlIFp2ZmgsIFprIGFyZSBub3QgaW4gdGhpcyBzY29wZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+ClRoYW5rcyBB
bmR5IQoKUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgoKcHMtIFRo
aXMgd2lsbCBlbmQgdXAgY29uZmxpY3Rpbmcgd2l0aCBteSBwYXRjaCB3aGljaCBtb3ZlcyB0aGF0
IGh1bmsKdG8gYSBoZWxwZXIgZnVuY3Rpb24sIGFuZCBhbHNvIGFsbG9jYXRlcyB0aGUgc2FtZSBo
d3Byb2JlIGJpdCBbMV0uClRoZSBmaXh1cCBpcyB2ZXJ5IHN0cmFpZ2h0Zm9yd2FyZCBmb3IgYSBo
dW1hbiwgc28gdGhlIG9yZGVyaW5nIGlzbid0IGEgYmlnCmRlYWwgZWl0aGVyIHdheS4gQnV0IEkg
dGhvdWdodCBJJ2QgZ2l2ZSB5b3UgYSBoZWFkcyB1cCBzbyB5b3Ugd2VyZW4ndApzdXJwcmlzZWQg
aWYgc29tZW9uZSBtZW50aW9uZWQgaXQuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDIzMDUwOTE4MjUwNC4yOTk3MjUyLTQtZXZhbkByaXZvc2luYy5jb20vCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
