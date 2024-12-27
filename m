Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8B6E7718B
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2024 14:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKyAArvSP+PQWcrI7yHcgzCYsanAGwE8mggKOBwIsuo=; b=hEgxBKTXu5CvUb
	VxgyOzy73tPhImBKkkw2w2yVlRXK1WUTYf27sgTUKja5iszfzPwN4NRig8RO+Ftkb9LyMxhO7eodx
	bOlenjcrcnqkD+1Ilko31hqtDsB3SVl/Hr5RVsG5rjMWEsYWtD9ZeosglbsBEvn5EunqiUoIkI5MJ
	gzLH/WdvcbRnHFZzGeV2P2H1kv7pQ84UlOQcdfD3AupGh5YxtcclXWWJ0v09j/IQMAZbtrZhNH3D3
	MMqyboMADrS8ERrJVZX+gxX9dCiZVFI08iFkl1uLs7mLwXn/qTeRb4FJDhdwQgGAwnFXVy2ZPtrf7
	5MZ2t6xPZciakjFAqVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAuT-00000000LPF-1IJB;
	Fri, 27 Dec 2024 14:01:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAuQ-00000000LOr-42vF
	for linux-riscv@lists.infradead.org;
	Fri, 27 Dec 2024 14:01:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-219f8263ae0so50920155ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Dec 2024 06:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735308106; x=1735912906; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcXciST7Dxr7AfagHOsV87qVf13ibLVnqhyeLigrto0=;
        b=Fj9Agwyeh8/Z3i59D/U7G0GmbHweUDIgOiPNMTxsxapdSjg2j19PNk1aE7fhG1kBZR
         nGpI+nbmkH2oFun9dA5fsDiAUB4+MUCw7UZn+o4dto3yOp7CSQ6F/t3siK8NNJLSO+Dt
         PFyQPVcHrDnb3aKIywHDJJrJlL0en/6UKOrKhgFVpH7plW9MOrSNehy24hdNHgY8IHsn
         k4hXzlzYyVRNc193/xHcF6MrtlmbQ1Guan9RTIzR6OL2BbMRLt/x7m4DtVxrpR5EgfUj
         MSQLijiuORHVSGJ7+Hwmqt/N7MW4+7z4z29PR7CcXJOkv0hnxfoMpBABwjRr2fIWGFiZ
         EBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735308106; x=1735912906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcXciST7Dxr7AfagHOsV87qVf13ibLVnqhyeLigrto0=;
        b=eixKyhaccTziMOWzHpJRGqO4E2E4j/Iuh3Vka0K5oW8VX+2pxZFzrXZkNQa9H7QOG0
         pNqSj9cfeFbxmjPLC1B6HrXX0M7u8to/wAUIBCZDs+FKY2cP64aTmTIrMOgcLBcsqAcG
         bQDVnWGNYYVvg9ZmohU317oGvSvc56qcOg2aPcbsebnZJFVxZv0myjQtbMt8fjb89ozn
         XLJB/FQNDU+I3PuBPFlTismJl5z04MnbMmGGOGQNmMmdBSst+mqw4lo1XEF2CiZyc75f
         iDJHZe2NUroV5OW/cQYgM0aWaIHnxUvKG24Q87mdteWjw1lDKnYOPcQsf9KfuuQsYacX
         TRWw==
X-Gm-Message-State: AOJu0Yym72yuTBqcPs/BGqKqtSisxBaxXCchV0k9fMIY2L6qIHMiIFHI
	Wz4rbwJxSxpSHt5+aLcwTWXqYDbfbqzJ06/7EShbENOLp7Nros2Trx7OiiwPDg6jTWYqXK5RILx
	eSLtHAGsfKURS0S0QOPLGRtYvZAs=
X-Gm-Gg: ASbGnctaQMdt1229NaKrB0xz/a+s7zFflfvjYsU0cvFRLcjL4p6vnOLs6RXnlIoIJgR
	QgiA7W3rFM6NXT9fr/rBOId7zEvoHvXVid1Tjbg==
X-Google-Smtp-Source: AGHT+IGUNIHFg+j5wbkChZ6aHOTaYYkOaoS0V6Qf+2Wx+gYvS7CHBm73z14u5s5QmZy3fXzP+BjnUNkq2q+psZaJQ34=
X-Received: by 2002:a17:90b:2e06:b0:2f1:30c8:6e75 with SMTP id
 98e67ed59e1d1-2f452eeb5f2mr35713031a91.32.1735308106180; Fri, 27 Dec 2024
 06:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20241218133340.51003-1-arikalo@gmail.com> <Z2Rp2q2HCAMbD0WA@chonkvm.lixom.net>
In-Reply-To: <Z2Rp2q2HCAMbD0WA@chonkvm.lixom.net>
From: Aleksandar Rikalo <arikalo@gmail.com>
Date: Fri, 27 Dec 2024 15:01:33 +0100
Message-ID: <CAGQJe6oBqt-O5c_+pG7P6AQQ4wGsi4g0ig9O7N4nPcCXCaQ4sA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix the PAUSE Opcode for MIPS P8700.
To: Olof Johansson <olof@lixom.net>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	linux-kernel@vger.kernel.org, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_060147_012761_8313129B 
X-CRM114-Status: GOOD (  15.51  )
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

T24gVGh1LCBEZWMgMTksIDIwMjQgYXQgNzo0NuKAr1BNIE9sb2YgSm9oYW5zc29uIDxvbG9mQGxp
eG9tLm5ldD4gd3JvdGU6Cj4KPiBPbiBXZWQsIERlYyAxOCwgMjAyNCBhdCAwMjozMzo0MFBNICsw
MTAwLCBBbGVrc2FuZGFyIFJpa2FsbyB3cm90ZToKPiA+IEZyb206IFJhaiBWaXNod2FuYXRoYW40
IDxydmlzaHdhbmF0aGFuQG1pcHMuY29tPgo+ID4KPiA+IFRoZSByaXNjdiBNSVBTIFA4NzAwIHVz
ZXMgYSBkaWZmZXJlbnQgb3Bjb2RlIGZvciBQQVVTRS4KPiA+IEl0IGlzIGEg4oCYaGludOKAmSBl
bmNvZGluZyBvZiB0aGUgU0xMSSBpbnN0cnVjdGlvbiwgd2l0aCByZD0wLCByczE9MCBhbmQKPiA+
IGltbT01LiBJdCB3aWxsIGJlaGF2ZSBhcyBhIE5PUCBpbnN0cnVjdGlvbiBpZiBubyBhZGRpdGlv
bmFsIGJlaGF2aW9yCj4gPiBiZXlvbmQgdGhhdCBvZiBTTExJIGlzIGltcGxlbWVudGVkLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IFJhaiBWaXNod2FuYXRoYW40IDxydmlzaHdhbmF0aGFuQG1pcHMu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQWxla3NhbmRhciBSaWthbG8gPGFyaWthbG9AZ21haWwu
Y29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgIHwgMTIg
KysrKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLWRlZi5oIHwgIDUg
KysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPiA+Cgo+IFRoaXMg
bWVhbnMgdGhhdCBhIGtlcm5lbCB0aGF0J3MgYnVpbHQgZm9yIE1JUFMgUDg3MDAgd29uJ3QgZG8g
dGhlIHJpZ2h0Cj4gdGhpbmcgb24gb3RoZXIgcGxhdGZvcm1zLCBpLmUuIHNpbmdsZSBwbGF0Zm9y
bSBidWlsZHMuIFRoYXQncyBub3QgdGhlCj4gcmlnaHQgYXBwcm9hY2guCj4KPiBJdCB3b3VsZCBt
YWtlIG1vcmUgc2Vuc2UgdG8gdHJlYXQgdGhpcyBhcyBhbiBlcnJhdGEgd2l0aCBib290IHRpbWUK
PiBwYXRjaHVwLgo+Cj4gLU9sb2YKCldlIGRpZCBpdCB0aGF0IHdheSBpbiB2ZXJzaW9uIDIuIFBs
ZWFzZSBzZWU6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQxMjI3MTM1
ODMyLjE4ODI1Ni0xLWFyaWthbG9AZ21haWwuY29tCgotLSBBbGVrc2FuZGFyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
