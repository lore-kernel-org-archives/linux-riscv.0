Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB696C3DA42
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 19:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PypD5X/SBZUNOhP2TQq84AE3yaT3c4cTwf+96p9K4KA=; b=S2WwA42bzyulmU
	OPggkMKDz5wE1uR32XEwwuTlZ3wFliKk3n2qXuxF+eFbzW3QtVuuMRj2efWb9hmdSW/9Q9NnbVFdJ
	dtfZtEhZudwdnT9JRhikw0uUOJTyDWXDT1Vc9PPNUeSRqWLuT2SLftgQG8Qr5JWif1HkvN35JfOiZ
	GN6PB2bNqJr+3hQRypJAKhbE0syIb9IS+8/J1y1TLnwZnUg/RCh5pNKan9XHKeHu3SBTHKTTvyW2H
	SlHwiHsc5qtoDlr2AE/QeoaPaQikCM7sHVadTtXtcVJOIDV5MZ7w2OHNo9t132/zCl+HLYfSAEkLR
	DzFkmAGqY70EiJWMDmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT4r7-00000004zxE-3Uru;
	Sun, 14 Jul 2024 19:25:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT4qn-00000004zsM-12Rs;
	Sun, 14 Jul 2024 19:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 95A2CCE0174;
	Sun, 14 Jul 2024 19:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA381C116B1;
	Sun, 14 Jul 2024 19:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720985134;
	bh=pWElLRFvLTb94HVMKGtwP+k/lzQ0EhEm/hblzKYrhEg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W3CQq5m7+Pd2DLQTAoLsZkdVPAx9BkoanSG3eOkRWLXp7tXUtZz+wVafGD+SV90n6
	 PtwiU8QJWhsyC/JAHTa5Bx7TAqwSNHm+FI0lv6iV3IG5a91Ao7nU5YdXif3PnkLKkW
	 IOQVKyv0GTvnfiqUDdeK5PeH6jthdlZamPuRtFO27lIZx47c7S+CNna32N/UPDnEW1
	 +9q2bLiiISAG0sX9fnkZRBqwe1Vn1URG1ZWsKiG3Ta3a+QNLK/YPdAeiHGnWeIAuvV
	 53F8HyOeaLBjAsy8hYCaKULaOdeIrfARWvcAtqcUMnqf9ZL2ONUWbGcWsyrPfhgKPD
	 pSSqxwnB7L/Cg==
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42797bcfc77so25079455e9.2;
        Sun, 14 Jul 2024 12:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYPflBUzKgrn33ia5uDsyw5rud2mGd0M4SVcsaIpKO9vkx4+ZEEcWfbIUO/d6W5JQGAoj8V7W8uCsjhPLvVG5h4z80U9GENemJtX8S3MgswKci/Jd2mB+6GxnrHpQ++eKcXapBM1m6F2v+SCkysaBRGCgXr0I=
X-Gm-Message-State: AOJu0YxwH1fzsbQwBIH9pXRq6J9A2LTA34N91yeEwiSYXOh64JE7g/ZG
	CBACE3InBl1RMx2z2dCHlPMZgbi78rHyCMG0jJ0vZFgFoxucG8K8D9Xk6AGaXAPMu5lb8631ROm
	nRtcNV9AXT4iSroI8LT/h4bmyJwQ=
X-Google-Smtp-Source: AGHT+IHNi+bkhtGO/tFdAGdozXKSzwunOc9SL8x+E8ESxsKl+svJChMzCUdwALSjb4LjW8Uu8yudrhwNRE6vlxT8+cQ=
X-Received: by 2002:a05:6512:3985:b0:52c:cc46:d59 with SMTP id
 2adb3069b0e04-52eb9999d90mr13194916e87.18.1720985113376; Sun, 14 Jul 2024
 12:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240714085751.176357-1-xtex@envs.net> <20240714085751.176357-3-xtex@envs.net>
In-Reply-To: <20240714085751.176357-3-xtex@envs.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 04:24:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQfe7284DrJzo5MCy_vhd+JDytKYbzSbWvRJGiyMT462A@mail.gmail.com>
Message-ID: <CAK7LNAQfe7284DrJzo5MCy_vhd+JDytKYbzSbWvRJGiyMT462A@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Create INSTALL_PATH directory if it does not exist
To: Zhang Bingwu <xtex@envs.net>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Zhang Bingwu <xtexchooser@duck.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_122537_659939_871E1135 
X-CRM114-Status: GOOD (  17.06  )
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

T24gU3VuLCBKdWwgMTQsIDIwMjQgYXQgNTo1OOKAr1BNIFpoYW5nIEJpbmd3dSA8eHRleEBlbnZz
Lm5ldD4gd3JvdGU6Cj4KPiBGcm9tOiBaaGFuZyBCaW5nd3UgPHh0ZXhjaG9vc2VyQGR1Y2suY29t
Pgo+Cj4gSWYgSU5TVEFMTF9QQVRIIGlzIG5vdCBhIHZhbGlkIGRpcmVjdG9yeSwgY3JlYXRlIGl0
LCBsaWtlIHdoYXQKPiBtb2R1bGVzX2luc3RhbGwgYW5kIGR0YnNfaW5zdGFsbCB3aWxsIGRvIGlu
IHRoZSBzYW1lIHNpdHVhdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIEJpbmd3dSA8eHRl
eGNob29zZXJAZHVjay5jb20+Cj4gLS0tCj4gIHNjcmlwdHMvaW5zdGFsbC5zaCB8IDQgKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9pbnN0YWxsLnNoIGIvc2NyaXB0cy9pbnN0YWxsLnNoCj4gaW5kZXggOWJiMGZiNDRmMDRhLi4w
MmI4NDVlN2FiMzMgMTAwNzU1Cj4gLS0tIGEvc2NyaXB0cy9pbnN0YWxsLnNoCj4gKysrIGIvc2Ny
aXB0cy9pbnN0YWxsLnNoCj4gQEAgLTIwLDYgKzIwLDEwIEBAIGRvCj4gICAgICAgICBmaQo+ICBk
b25lCj4KPiAraWYgWyAiJHtJTlNUQUxMX1BBVEh9IiAhPSAiIiBdICYmICEgWyAtZSAiJHtJTlNU
QUxMX1BBVEh9IiBdOyB0aGVuCgpJIGNoYW5nZWQgdGhlIGZpcnN0IGNoZWNrIHRvIFsgLW4gIiR7
SU5TVEFMTF9QQVRIfSIgXQpBcHBsaWVkIHRvIGxpbnV4LWtidWlsZC4gVGhhbmtzIQoKCj4gKyAg
ICAgICBta2RpciAtcCAiJHtJTlNUQUxMX1BBVEh9Igo+ICtmaQo+ICsKPiAgIyBVc2VyL2FyY2gg
bWF5IGhhdmUgYSBjdXN0b20gaW5zdGFsbCBzY3JpcHQKPiAgZm9yIGZpbGUgaW4gIiR7SE9NRX0v
YmluLyR7SU5TVEFMTEtFUk5FTH0iICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAiL3NiaW4v
JHtJTlNUQUxMS0VSTkVMfSIgICAgICAgICAgICAgICAgICAgIFwKPiAtLQo+IDIuNDMuMAo+CgoK
LS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
