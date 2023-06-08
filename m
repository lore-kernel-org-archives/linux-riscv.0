Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAFBC83003
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CO1Dy6L/jL9sU5ZCSvvMkaDmffG46OzLniKzUYU4Jms=; b=FSxpZ4ZYAFbeKC
	iKqcGj4iZnIQsks+58lpjw7A4hNatUKNHpnmKsDV8uBkGX5ynegZUWtKcB8BfhT7StLAyW1qs1r9k
	WZMjm3oYUodtzpoYQi9fjfGufIW6mY2HKQ8D5ZQ1+Q4tjAi3fpzEPuWrruqFENjzMmLVxhuSeeBP1
	7a9H3xgz5eHGGYRYNc7NC0AHIzCcfCc3gty5fx24otY2RXH2/LvfSx7X1RXpPEY1xzmwmpOPRtO14
	hnWJhMDJw4cQeV5C3KqWSRt7fR7/GZ0hH6GJowe34I+9MVXHnrELENDv1rA2oPI5SBUglre5BYoZx
	NjQUwSh8QMujMl2og5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7ECQ-009EIE-14;
	Thu, 08 Jun 2023 11:53:06 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7ECM-009EGh-2t
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 11:53:04 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-565cfe4ece7so4303967b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 04:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686225179; x=1688817179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zl1R25aFlMknfZ0TZaTg0XuHD/qftBgk3A9a/qrvBxE=;
        b=JkWwFpUHXV9of/EMlxEglfiJIwG1whJEIcTeXTzj0r1UXBhS3QQTuzkkduG01/PtL+
         Dc6zQvaguzzgwBx7WI0aYdeB7ZdtueyKcmvT7IKVzNRsqhuqwtYMPUyjy1gqCKi7EY23
         SDoM2b1Qy5nIPOupVMsQuZokYSz/qFGraoOECWmgxh0wTrApXG7k5bt7SAB/kFmj9Ux4
         H5IMMf5fkjKmupydwZm55ILHeDzk4y1Otqyjwmj34EZ6NbSwkuOhAZc6ig5rU70vV4i/
         Y8Mwh64R+JCNUx3ml3+xihLvBqH1Ja3Dh1iA1tYZ2SdKKDpJQVjhW0iAhUfUpepA3d1x
         UUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686225179; x=1688817179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zl1R25aFlMknfZ0TZaTg0XuHD/qftBgk3A9a/qrvBxE=;
        b=ZNUbTrF8XF8qsplKkXbKddawq4muDSjl5qhGKxN+yeHv3tUqXB/8Yr8jAcuPCBKiIh
         8zhp02bhONbvbizQxZVx9Y+/NiQnAN8VAcKSBdpu8GyICxwr3yr+bq3c9lvK3TQ6XJ2T
         cP72gSNCO3PUubh3/A/o43hoJje6OduLCLERKWrkqqnG2ygTEGkJiecFOHi1ok6skqAG
         gk1sKds5C6c51H98O4ra+Xnclxs2+0YaTqMnzKXNPnp7KAN/K55dvgbMXD/avOoDELpB
         6bUJ52CTun/ACVMeMQMeoRyXNFXF30wHkV6KZCCsM2p8dpHsxyjks6Zjy8ynsYlaURX8
         23tA==
X-Gm-Message-State: AC+VfDwJ3pcPHT1naVtOODP1zVpNY/+sPHD3HPKaRobzMGsZn2TP5RX/
	WJZzBj/6vIIzIQJHP0HxXCFTMBvbvqK3eQlku8w=
X-Google-Smtp-Source: ACHHUZ6h6dDyv4SxutQEfzo1GDIGkQqE4VT4CGwB81++CdMgJ3EN0Xs26iS4UkX3+1xwEFlXbP9izWEIR2g4zFlOcTk=
X-Received: by 2002:a0d:c584:0:b0:561:b246:77ca with SMTP id
 h126-20020a0dc584000000b00561b24677camr9370671ywd.28.1686225178967; Thu, 08
 Jun 2023 04:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com> <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
In-Reply-To: <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jun 2023 13:52:47 +0200
Message-ID: <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_045302_934383_5327B57C 
X-CRM114-Status: UNSURE (   6.88  )
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

T24gVGh1LCBKdW4gOCwgMjAyMyBhdCA5OjAx4oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBJIGRvIGludGVuZCByZXZpc3RpbmcgdGhpcywg
cHJvYmFibHkgYWZ0ZXIgdGhlIG1pbi4gdmVyc2lvbiBmb3IgcnVzdAo+IGdldHMgYnVtcGVkLCBJ
J3ZlIGp1c3QgYmVlbiByZWFsbHkgYnVzeSB3aXRoIG90aGVyIHdvcmsgdGhlIGxhc3Qgd2Vla3Mu
CgpUaGFua3MgQ29ub3IhIFRoYXQgd291bGQgYmUgZ3JlYXQuIFdlIGFyZSBpbmNyZWFzaW5nIHRo
ZSBtaW5pbXVtCnZlcnNpb24gYWZ0ZXIgdGhlIG1lcmdlIHdpbmRvdyB0byBSdXN0IDEuNzAuMCAo
YXNzdW1pbmcgbm8gdW5leHBlY3RlZAppc3N1ZXMpLgoKVGhpcyBpcyB0aGUgYnJhbmNoIEkgaGF2
ZSBpbiBjYXNlIHlvdSB3YW50IHRvIHVzZSBpdCwgSSB3aWxsIHN1Ym1pdCBpdApzb29uOiBodHRw
czovL2dpdGh1Yi5jb20vb2plZGEvbGludXgvdHJlZS9ydXN0LTEuNzAKCkNoZWVycywKTWlndWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
