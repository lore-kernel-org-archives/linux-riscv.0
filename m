Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CE3E7C4DF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 16:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17cvJKf9j0ywkW/ezWHzZp3YdopviaFy3qSBFOr1z8E=; b=f5b3c/CXqcyCzV
	/wIzZplOh+M6FcSTQxa9WTA4ZDj1Hw9pV7FSesQaETYAGsE/DsFn/TAhjOnnBI91JLknDB6yvbUV7
	GZ5rcUoXALfJH8HhS5KtUy7pwXuFylIMGbFWCJgD+6T5AkZjf/neU26V3bsa21EDWLRrUW64EfqZ0
	e8vPC4R1mCv5zLtoUlbIOYv07LmaseLHFXFA3r5mVpY+vsuzr0/Gsm/ktoWmwhBxO7qiengbMHAyM
	bfnykh5MjIuOQIzAqNbBMCaod52eQBh7mjI+SV8m+CPbG93dk1Vc7W7I0hQZuwnOhqGHNbf5A+WaD
	FN7Te4kH057stkr/uE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4X0-000STS-2O;
	Wed, 04 Oct 2023 16:15:26 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4Wx-000SSO-2i
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 16:15:25 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-504b84d59cbso2885966e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696436120; x=1697040920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjqJ6yA/NOdoWTZ0mouoo71KG+EE4Iop0vNyplfA27c=;
        b=M3esZUxAikMl6hrRlGmB+DAhro6OZ0OFE0OfOWGTaX2dbDw6RGzLRs5w2vuG06H35h
         5r0XlgcIj7zdwvva5Vew4YSDEaySQ/jtIyII81BxsXmfYA3BvDFjTngxlK0Xtkry/N8a
         4bdxxLf1DQiVqh36myUbI+h4XX6wXYQAyGI85MDIND6bpC3pakTnT4TkRxWd2inQzatG
         Zrp0H7sEOr7y10RmGE2PqLCpU18Mye+jlWYy70KHl4nwd161//j9iPPR4LcS0yLH+UCr
         zuz9qwmwAbyz8m4jYbQfRMtj7B4OloRtSTi3zqIpyhSHsnY97a/FD9Vxoa1QSxOfJYAm
         XN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696436120; x=1697040920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjqJ6yA/NOdoWTZ0mouoo71KG+EE4Iop0vNyplfA27c=;
        b=n1vGgntI/I8DB/15NgBw574lsnJ+HYDLlmF9t0a0lwxTDT2vtjxWfxQgWtY8aDzs4D
         eunetvnVkeGJ+apLOgztOn63h2T15zDxd08MtihRr6OEWbgKsSKbYVl7z2k2NZ4kdVYm
         DY4o2tlKcyGKqezDfbnxICkiCybWXRVSpYbr05PhlhaP7e3ddaKHqdvWIFN1bELVg61O
         tJqiW+OAXFHjEv4NH5JQ67WfR+OWpqD8S1XMolUh/J3aUw8lJp+XXK18vIPVy9EcS8pf
         Auh/p7r6dr2hYM022LSFgZJ0tAWvL9gz7LSRZMdG+5oIv9iUg+QKum72UbruU+WH/xI8
         YrPw==
X-Gm-Message-State: AOJu0YwnUKUwI44Xwx1Wsy2b7nyJNd3eC2aHz8Px30nKsjCasjP56H+9
	9Nw08nXhnHeo+Ju/+Kpyi72NN76tSYKRf2ElOUwFwA==
X-Google-Smtp-Source: AGHT+IFgAghQ+58w+Zz87hBVIlsXs3LWYovUUhxnq3Ak/RWVDzhw1Gopvv/oOCWHd8hZZx2paZ238iqWICOkl7ICviU=
X-Received: by 2002:a05:6512:ba7:b0:4fe:db6:cb41 with SMTP id
 b39-20020a0565120ba700b004fe0db6cb41mr3296167lfv.39.1696436119889; Wed, 04
 Oct 2023 09:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231004151405.521596-1-cleger@rivosinc.com> <20231004151405.521596-7-cleger@rivosinc.com>
In-Reply-To: <20231004151405.521596-7-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 4 Oct 2023 09:14:44 -0700
Message-ID: <CALs-HssMjAtsJTxR=qyx7bb60BAReXOM0-EVUQrbNYyzAdN2KA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: annotate check_unaligned_access_boot_cpu()
 with __init
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?B?QmrDtnJuIFRvcGVs?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ron Minnich <rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_091523_876417_B05533D1 
X-CRM114-Status: UNSURE (   6.71  )
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

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA4OjE04oCvQU0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoaXMgZnVuY3Rpb24gaXMgc29sZWx5IGNhbGxlZCBh
cyBhbiBpbml0Y2FsbCwgdGh1cyBhbm5vdGF0ZSBpdCB3aXRoCj4gX19pbml0Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKQWgsIG5pY2Ug
Zml4LgoKUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
