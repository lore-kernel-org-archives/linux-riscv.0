Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B038C71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFmUiK+ih26KecCM8JFUWBXdFJR38zXEqeL47ZmRFA8=; b=Me7IPu10sboLgS
	oDgyw9uAAnEqFEa/3Q6k9BHwL72cdOIgzYlQilKbcq2jtNtBPJ9optwZccnii1hhcuRFYZ6YUT7W/
	mWPOx1Ofip+FBtUr7f7smI6OrBmjTktpvXP0fnFimJzoFxRCLCWMpY5WZJ0NXZPKEzo5I4/IcdUU3
	8MzrlM6NkwI3+rK9KNTEPGAhu/EftkqwfG8UrsnoBd0JyJIkfWDYK8SF2ef16Aq1W7zKUHUeal95o
	zrEaFMacsmciuO0bsgOg3FJla6PzWM9t7LplLQxbprwfPjq7YDlEhg8oFT+6W5/mCw9wVjWDmJCCS
	vc0KfTk5DSq1NEdDkOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ94p-0000000HJF6-2O1q;
	Fri, 13 Jun 2025 18:24:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7t6-0000000H8mD-1y3x
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 17:08:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a528e301b0so247325f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749834498; x=1750439298; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vue51+MgfibcA28it1/xkcw6YG/3bQrUPQvFZm0rgdk=;
        b=hj4G8zFMtA72Qu7j5bvyW/kaeCXvvRrpqk+MeKTQzPVFmRGaNqquhtSuk21+LXl9Lj
         1JlZL6Sj/5tafTjtdElAU/1Glspsn0hsyfluTlwg4AJA3fVa2Ib+Qy3G6r+QuH2J5/zw
         UEJwRfrBPG2fhsmS+H7dNpCyyeyaW5ph10Qa27lu2oy8R4PLMRcJneJuyD5Blllld3By
         W7HN3H1cnWAsgBHVbSkuxy/vUX+muyW8msyxsGABAIo1QQSqofmTya5DFBwiLZENZ0il
         /dJVeOw4+2hFDbqbWvxjGCyFa8r+EafWAHIHt9ObX81a60+pwGJn8uZWmc8HguvrM8Jn
         f6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749834498; x=1750439298;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vue51+MgfibcA28it1/xkcw6YG/3bQrUPQvFZm0rgdk=;
        b=KQDoblJX0b+usEvpBT5rrAwhGw0fIXc/4BCfU4XnBMazl41zuxvRTddFLBJyNlGq/R
         punAgH7r2S8/aO5NbkGwS4f1rmjsO4+aSFQsDDdUDWlNsfSx6KWhZktAPKTEu/alrkrb
         AiBnfbrbV7/f/hQd9YZ4pwluvEN9a2T5NWm7EKKFLH0Zi027dxrvgIsMhiPuP9niegA5
         AllX3WT0fgN8vcE4+xHs+S82YsratDlQHbrwED3SYCxPfq1KLsvByWWXgr3G+R62hYHk
         9i91wSSVRO55QN9x0O0Th1gZGdZCy67fpvS21icqoIHc3MvZ/AoqObhBgr99qnac+qnB
         zLyA==
X-Gm-Message-State: AOJu0YyrEsHmnko806QIFT69k3EaTi+7WM+4Y7Ob1yJp+lkxyYfWGouo
	BnGCIzLcvrb5T5EDbR4RtdgGvss/nnUvYVCfROy1Tr6IBJciha2uZmBD8pjoTEb67W4=
X-Gm-Gg: ASbGncscrQ47cBnInoYGDuC9vFQDahc27whcQZxeVHiMHBQsDH6W0789GQguXUQpjxt
	olm9MDYJRg1gAdluIDZbxmdE7PxetBF3t7W8OgjfZXRV+yOj9U0RVXVl8uqWiSOWSXO+xr1y9vv
	6oS+8fnTrX0L33M+JNeRJE7cv7mzywDJJ4v/tKq7BQUv13S8sieGozN2xTtjzeGhz2Nke4jBknL
	tQpArsz+k8Hy6VqIKsDjfZDiLgl/xo8H581nYc/JRSfu7ZsjU0mhMi71e3pK0cpnth8ur3FR9jn
	DecSIVXoDLa8bCTkher/QCuJmIz+0tscaz8YXdzxJ7itG6jqDYHX9EHqOZwTi7EP5KaFmw==
X-Google-Smtp-Source: AGHT+IHfUlqWvloCSvdoAAhCyaKAAKDpychdD+BfdH2KIKQft+7sNerlZ4YyA9yLV1CZzyAdw2xnjQ==
X-Received: by 2002:a05:6000:1789:b0:3a3:7be3:d0f3 with SMTP id ffacd0b85a97d-3a5723aea0cmr190535f8f.14.1749834498233;
        Fri, 13 Jun 2025 10:08:18 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:3c9f:2b68:ce36:f64b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b2c957sm2820587f8f.76.2025.06.13.10.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 10:08:17 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Jun 2025 19:08:17 +0200
Message-Id: <DALKK6MHWD7D.3ZFXSS6YNLHL@ventanamicro.com>
Subject: Re: [PATCH 2/2] RISC-V: make use of variadic sbi_ecall
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, "Anup Patel" <apatel@ventanamicro.com>
To: "David Laight" <david.laight.linux@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
 <20250612145754.2126147-4-rkrcmar@ventanamicro.com>
 <20250613115459.6293f929@pumpkin>
 <DALGSCDW0GIG.10I22KD2SCSNX@ventanamicro.com>
 <20250613165226.751541c6@pumpkin>
In-Reply-To: <20250613165226.751541c6@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_100820_518205_15BD24E2 
X-CRM114-Status: GOOD (  11.59  )
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

MjAyNS0wNi0xM1QxNjo1MjoyNiswMTowMCwgRGF2aWQgTGFpZ2h0IDxkYXZpZC5sYWlnaHQubGlu
dXhAZ21haWwuY29tPjoKPiBPbiBGcmksIDEzIEp1biAyMDI1IDE2OjEwOjUyICswMjAwCj4gUmFk
aW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gLi4uCj4+
IFRoZSBtYWNybyB3aWxsIHJlc3VsdCBpbiB0aGUgc2FtZSBhcmd1bWVudHMgYXMgYmVmb3JlLCBh
bmQgaXQgaXMgd2hhdAo+PiB0aGUgc2JpX2VjYWxsIGFjdHVhbGx5IHNob3VsZCBkby4KPgo+IFVn
Zy4uLgo+IEFyZSB5b3UgdXNpbmcgcHJlLXByb2Nlc3NvciAnbWFnaWMnIHRvIGFkZCBhIHBpbGUg
b2YgemVyb3MgYW5kIHRoZW4KPiBzZWxlY3QgdGhlIGZpcnN0ICduJyBhcmd1bWVudHM/CgpTYWRs
eSwgeWVzLiAgVGhlIHplcm9zIHNob3VsZCBoYXZlIG5ldmVyIGJlZW4gaW50cm9kdWNlZCBpbiB0
aGUgY29kZSwgc28KSSdtIGhpZGluZyB0aGVtIGZvciB0aGUgbW9tZW50LgpJIHBsYW5uZWQgdG8g
cmVtb3ZlIHRoZSB1c2VsZXNzIHplcm9zIGluIGZ1dHVyZSBwYXRjaGVzLgoKPiBUaGF0IG91Z2h0
IHRvIGJlIGJhbm5lZCBhcyBlcnJvciBwcm9uZS4KClNvdW5kcyByZWFzb25hYmxlIHRvIG1lLiAg
SSB3aWxsIHRyeSB0byBmaXggdGhlIGluc2FuZSB0cmFjZXBvaW50IGJsb2F0LAphbmQgc2VuZCBh
IHYyIHRoYXQgZmlsbHMgb25seSB0aGUgY29ycmVjdCBhbW91bnQgb2YgcmVnaXN0ZXJzIGZvciB0
aGUKZWNhbGwgaW5zdHJ1Y3Rpb24uCgo+IEkgdGhpbmsgdGhlIG9uZSBmb3Igc3RybmNweSgpIHJl
bW92ZXMgdGhlIGltbWVkaWF0ZSBjb21waWxlIGVycm9yIGZvcjoKPiAJc3RybmNweShkZXN0LCBz
cmMsIDEsIDIpOwoKSSB3b3VsZCBoYXZlIHByZWZlcnJlZCBpZiBzYmkuaCBoYWQgYSB3cmFwcGVy
IGZ1bmN0aW9uIGZvciBlYWNoIFNCSQpmdW5jdGlvbiwgYW5kIHdlIG5ldmVyIGFsbG93ZWQgZGly
ZWN0IGludm9jYXRpb24gb2YgdGhlIGVjYWxsCmluc3RydWN0aW9uIG91dHNpZGUgb2YgdGhlIGxp
YnJhcnkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
