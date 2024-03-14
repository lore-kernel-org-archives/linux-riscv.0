Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE11C54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZ+uQcXWaMiDCNu9MybM4ZSUrdikP5GvtFoLaKKf8Hc=; b=PhPq2Zm/2t1zro
	wlb6D7o3TrxJo5TXH+YPaH/8oEA3KDzH7fRd2Uj5GYEVBD+wxYxcrha8FZgdElOMXYYQMxBRNu4vn
	jYobN8W9fPiI1ioOiEHyaGhIKlSqT3qVwOKp9Cgesmc9gQV1vfTZqNfO3zfiuCPGiwSgV/P9Kvu0X
	ubl85oW33AqU/xs/IE3uCV1GJlt7JwKoKKKpdlYBM9Qu/P4A9gQ3ZGVgvdrbmPj6rdhh+po646SA0
	bxQcwMXz9fZEYxC3O+K1Honc2b1ANF4HAHpnIrskh9IRk/cAutY+jraIG6Z2trcy0hkIJRvBJe6Db
	tbnuo2fpBmpjZQ0UfNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklsZ-0000000Eatv-2cR7;
	Thu, 14 Mar 2024 14:16:19 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rklsX-0000000EasS-04HO
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:16:18 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-690de619293so6830346d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710425769; x=1711030569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVGU/1nT0H0Si6zm/Sz0XZCYeGIcHvVz6AxiepPYAXg=;
        b=S19K1quAk5U03/+lNUxt+xjJ7P2LiwjSZ7AViWGl89YyDwmKJ5lrQQOPqlUJ54ux3t
         frRXeEPJiGEMhaA/FyqtoJfOaO0U/enrGpApFNZInlAGK+qBzlnERiBZ94qN56BJIyl5
         YnGCoDjUI7Fqzy31KdA28vm+IBL11n4I5f/eEwPzsJAlTLo6/2oELIht6XCAMwupHY0h
         sxogZabSxYrN1CpPDl65Fi06biqGF1bE+QPba7hR6TYwFsg32ZCV1JTdF9XN/yek7bOa
         dIx4YCj7wF8OFe24mwDhES+mW3IciB/A9Xc/+hiWGKzsg49JVsHTidRn/K7XLqjffFeT
         l1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710425769; x=1711030569;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVGU/1nT0H0Si6zm/Sz0XZCYeGIcHvVz6AxiepPYAXg=;
        b=WqjuW3CT1HJj8W2TTvIZ0aqL6zTKehl1EiZjFT5TYMtkgTCacYEObRBc5fhZSl8FEQ
         pSO92NXwOhM80HGqMHpN53rKEQGyh+1PKdEzcBYuWRHH8WekAfVLuauSV5djtUfkMqRP
         RuSCPf57OwkViTB1eXMhMUwCA6oMeTCSe0KxZWlngnn9ZDuskuK4Rg4JlcZmQuu+VfLG
         S3uSJ+JcyTe+PRK2ItBATvQPydd/yGsu5DVaHV3h9MCylTS2zdgvabbvb8DVCLOfQygp
         EUXsVrZ3HlPWxJjWlJJbSVRSPVS2ygv0+HUvvHJ1r/05daBb/KkdbOioCFCblaFaLuHK
         Bx6g==
X-Forwarded-Encrypted: i=1; AJvYcCX9lt2UABO7DPY1JHHA8CzLM04BBwjocPS97LDXVTgF49ALG3wVuWK5BlDIhYI5dScbgzlNtllO4adoVihEki6QMMs7Xc59ER8Ig6jPy6AC
X-Gm-Message-State: AOJu0YzGOavRaYKHC9iRgjqnzOiAcFmE0Zv1A7TEwpSgTKfNKoKdXxpg
	ep1Fn7YAQIuYpO++sFmCkcSmY+roWvjGN/7HXsds2Jbeqq+mUiYL
X-Google-Smtp-Source: AGHT+IFXeFnBQdQlRURMStTP2QEs5eBWxgcZpvwyfw1K7G6sqYNL0c+PpV2nyZYeVsGMmtLdDAXx1A==
X-Received: by 2002:a05:6214:2e11:b0:690:de5f:2127 with SMTP id mx17-20020a0562142e1100b00690de5f2127mr1939361qvb.36.1710425768813;
        Thu, 14 Mar 2024 07:16:08 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id jx5-20020a0562142b0500b0068f4520e42dsm507705qvb.16.2024.03.14.07.16.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:16:08 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt
 <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Guo Ren <guoren@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Bjorn Topel <bjorn@rivosinc.com>, "Song
 Shuai" <suagrfillet@gmail.com>, Cl'ement L'eger <cleger@rivosinc.com>, "Al
 Viro" <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
In-Reply-To: <8734suqsth.fsf@all.your.base.are.belong.to.us>
References: <20240306165904.108141-1-puranjay12@gmail.com>
 <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
 <8734suqsth.fsf@all.your.base.are.belong.to.us>
Date: Thu, 14 Mar 2024 14:16:04 +0000
Message-ID: <mb61pplvw6grf.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_071617_107042_6811A87B 
X-CRM114-Status: UNSURE (   9.10  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPgo+IEhtbSwgZGVwZW5k
aW5nIG9uIFJJU0MtVidzIENNT0RYIHBhdGgsIHRoZSBwcm8vY29ucyBDQUxMX09QUyB2cyBkeW5h
bWljCj4gdHJhbXBvbGluZXMgY2hhbmdlcyBxdWl0ZSBhIGJpdC4KPgo+IFRoZSBtb3JlIEkgbG9v
ayBhdCB0aGUgcGFpbnMgb2YgcGF0Y2hpbmcgdHdvIGluc3RydWN0aW9uICgic3BsaXQKPiBpbW1l
ZGlhdGVzIiksIHRoZSBiZXR0ZXIgInBhdGNoIGRhdGEiICsgb25lIGluc24gcGF0Y2hpbmcgbG9v
ay4KCkkgd2FzIGxvb2tpbmcgYXQgaG93IGR5bmFtaWMgdHJhbXBvbGluZXMgd291bGQgYmUgaW1w
bGVtZW50ZWQgZm9yIFJJU0MtVi4KCldpdGggQ0FMTC1PUFMgd2UgbmVlZCB0byBwYXRjaCB0aGUg
YXVpcGMramFsciBhdCBmdW5jdGlvbiBlbnRyeSBvbmx5LCB0aGUKb3BzIHBvaW50ZXIgYWJvdmUg
dGhlIGZ1bmN0aW9uIGNhbiBiZSBwYXRjaGVkIGF0b21pY2FsbHkuCgpXaXRoIGEgZHluYW1pYyB0
cmFtcG9saW5lIHdlIG5lZWQgYSBhdWlwYytqYWxyIHBhaXIgYXQgZnVuY3Rpb24gZW50cnkgdG8g
anVtcAp0byB0aGUgdHJhbXBvbGluZSBhbmQgdGhlbiBhbm90aGVyIGF1aXBjK2phbHIgcGFpciB0
byBqdW1wIGZyb20gdHJhbXBvbGluZSB0bwpvcHMtPmZ1bmMuIFdoZW4gdGhlIG9wcy0+ZnVuYyBp
cyBtb2RpZmllZCwgd2Ugd291bGQgbmVlZCB0byB1cGRhdGUgdGhlCmF1aXBjK2phbHIgYXQgaW4g
dGhlIHRyYW1wb2xpbmUuCgpTbywgSSBhbSBub3Qgc3VyZSBob3cgdG8gbW92ZSBmb3J3YXJkIGhl
cmUsIENBTEwtT1BTIG9yIER5bmFtaWMgdHJhbXBvbGluZXM/CgpUaGFua3MsClB1cmFuamF5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
