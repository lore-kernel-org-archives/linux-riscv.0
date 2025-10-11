Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75374CCD184
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 03:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXVBt/TbECNmu7LwvRwa1neHD9quinqoe5ppprFhJx8=; b=Syzv6NndVJBTTi
	iETDE/X/a8Su6q8aNaP45G84ifaoh5DKpfHAbA8kPkq6/cjlXCr1bDsC8nY4JmpExPb58G7/oxIPI
	IEJ4N1fg3A/qaL7ZvfpWrv1uLIT3mTtJPK+9r7lBXEvY4a0sGkv0+5T5RpN436Gd2fi9Yr+IvZ/ov
	vWglbmAL0MZ++TJWk+WcEq+pQ2YKUaXcuqXYa1x65ObMf218ZJEY6nEXhvB2eL+2l1WMCIBadHUjM
	Jh/aLU2iJqKNU3hD098Iu+J+kzGT2yFHYuMFZt4BY+gix77FRdZABXyTAs+TBFuEw3OE14T9DwXX+
	bgm+jG5LXEF3JA1/thpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QTK-00000009lXZ-3udM;
	Sat, 11 Oct 2025 03:40:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QTI-00000009lVm-1ekA
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 03:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 144C943B49
	for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 03:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DABC19421
	for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 03:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760154039;
	bh=d8gS8wOiKMr+l/ZJJK/wQClNzHRVZjbJoYCPz75pBA0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DzNmc2htDKTHCp3aozZ6E5kEpQ/T9k9BWOy4+jwgGV0SIndwfInOWiuXfSFiC5/5t
	 QL0ZrMiCOK0FsZeNjSXSIG3/Br58Maj0goLA9/Q6msU1Q15XtRG+/XCdCPfCh/moCu
	 3wN9SmB4nk5eeZ2n9d7wmFfMO1QGUzW5I1c3d7STbqXTYzS+mpV20pHVAmWvmSxSj4
	 RkOfn0MoXV6y5yHYuCfrLF8mrUT/cWs/nH/BhFqc8TDo0dG4dA+boCphnqx3GOExuE
	 QOttymeUokIXpaUETbAytEn+TzSZ/z6oVLixTt5MXuB/USBSphsTqedUHobjukDNnT
	 j/m2eilL1toDw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57992ba129eso3248705e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 20:40:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWM+OAjT8K60xL9i5brdnFGjRLHSeKTulNPnXfG0fcUGUEG/887ctileGpCMtpAJWhc5DAQpWFVGLBgBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YykTt+HjCLaHlhPKcSHxS5tvXLH//SoNagKTg4p8Z5fjDXlRlEA
	ndvrOq9EZ+OeizxEXWGwAonmq3kGTxVNWPLohnTAyX5dguzDEIfe4qD+0JgMiyK3vRJhFvasm6c
	5DMvRKmBDAIQnmgbjVwnAu72/MHrD7LY=
X-Google-Smtp-Source: AGHT+IFLXMYQ5g+Z7hYaE+htkOTZgcAsNtsCxDgeGT8tN/INhUQhJ+SJe8urgMafAAQJ9Ld+ELNhgSE8e7XFB5+/m9g=
X-Received: by 2002:a05:6512:b10:b0:577:9ee:7d57 with SMTP id
 2adb3069b0e04-5906de88ee4mr3575140e87.46.1760154038165; Fri, 10 Oct 2025
 20:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn> <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
In-Reply-To: <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Oct 2025 20:40:26 -0700
X-Gmail-Original-Message-ID: <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
X-Gm-Features: AS18NWCSTMnmP5OepZJr1Y4u3ZHVFaMO9Ik-XYJVsvY5QDAPT-bP-GHnlwwanEk
Message-ID: <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_204040_470709_1539606E 
X-CRM114-Status: GOOD (  16.37  )
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

T24gRnJpLCAxMCBPY3QgMjAyNSBhdCAxOTo1NCwgSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIE9jdCAxMSwgMjAyNSBhdCA5OjEz4oCvQU0gVGll
emh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+ID4KPiA+IE9uIDIwMjUv
MTAvMTEg5LiK5Y2IMTI6MjUsIEFyZCBCaWVzaGV1dmVsIHdyb3RlOgo+ID4gLi4uCj4gPiA+IFdo
eSBkbyB3ZSBuZWVkIGJvdGggKDEpIGFuZCAoMik/Cj4gPgo+ID4gTm90IGJvdGgsIGVpdGhlciAo
MSkgb3IgKDIpLgo+ID4gV2hpY2ggb25lIGRvIHlvdSBwcmVmZXI/IE9yIGFueSBvdGhlciBzdWdn
ZXN0aW9ucz8KPiA+Cj4gPiBUYWtpbmcgYWxsIG9mIHRoZSBjb25zaWRlcmF0aW9ucyBpbiBiYWxh
bmNlLCB3ZSBzaG91bGQgZGVjaWRlCj4gPiB3aGF0IGlzIHRoZSBwcm9wZXIgd2F5Lgo+IEFzIGEg
c3VtbWFyeSwgdGhlcmUgYXJlIHRocmVlIG1ldGhvZHM6Cj4gKDEpIE9ubHkgbGluayBsaWJzdHVi
IHdpdGggdm1saW51eC5vIGR1cmluZyB0aGUgZmluYWwgdm1saW51eCBsaW5rLgo+ICgyKSBSZW1v
dmUgdGhlIGF0dHJpYnV0ZSBfX25vcmV0dXJuIGZvciByZWFsX2tlcm5lbF9lbnRyeSgpIGFuZCBh
ZGQgd2hpbGUgKDEpLgo+ICgzKSBJZ25vcmUgIl9fZWZpc3R1Yl8iIHByZWZpeCBpbiBvYmp0b29s
Lgo+Cj4gSm9zaCBwcmVmZXJzIG1ldGhvZCAoMSksIEkgcHJlZmVyIG1ldGhvZCAoMykgYnV0IGFs
c28gYWNjZXB0IG1ldGhvZAo+ICgxKSBpZiBpdCBpcyBub3Qgb25seSBzcGVjaWZpYyB0byBsb29u
Z2FyY2guCj4KClRoaXMgaXMgYSBmYWxzZSBwb3NpdGl2ZSB3YXJuaW5nIGluIG9ianRvb2wsIHdo
aWNoIGNvbXBsYWlucyBhYm91dCBhCmZ1bmN0aW9uIHRoYXQgZmFsbHMgdGhyb3VnaCwgZXZlbiB0
aG91Z2ggdGhhdCBjYW4gbmV2ZXIgaGFwcGVuIGluCnJlYWxpdHkuCgpUbyBtZSwgaXQgaXMgbm90
IGFjY2VwdGFibGUgdG8gbW9kaWZ5IGhvdyB2bWxpbnV4Lm8gaXMgY29uc3RydWN0ZWQKYWxzbyBm
b3Igb3RoZXIgYXJjaGl0ZWN0dXJlcywgaW4gb3JkZXIgdG8gaGlkZSBzb21lIG9mIGl0cyBjb25z
dGl0dWVudApwYXJ0cyBmcm9tIG9ianRvb2wsIHdoaWNoIGRvIG5vdCB1c2Ugb2JqdG9vbCB0byBi
ZWdpbiB3aXRoLgoKCklmIHlvdSBhcmUgbm90IHdpbGxpbmcgdG8gZml4IG9ianRvb2wsIEkgc3Vn
Z2VzdCBmaXhpbmcgdGhlIGxvb25nYXJjaApjb2RlIGxpa2UgdGhpczoKCi0tLSBhL2RyaXZlcnMv
ZmlybXdhcmUvZWZpL2xpYnN0dWIvbG9vbmdhcmNoLmMKKysrIGIvZHJpdmVycy9maXJtd2FyZS9l
ZmkvbGlic3R1Yi9sb29uZ2FyY2guYwpAQCAtMTAsNyArMTAsNyBAQAogI2luY2x1ZGUgImVmaXN0
dWIuaCIKICNpbmNsdWRlICJsb29uZ2FyY2gtc3R1Yi5oIgoKLXR5cGVkZWYgdm9pZCBfX25vcmV0
dXJuICgqa2VybmVsX2VudHJ5X3QpKGJvb2wgZWZpLCB1bnNpZ25lZCBsb25nIGNtZGxpbmUsCit0
eXBlZGVmIHZvaWQgKCprZXJuZWxfZW50cnlfdCkoYm9vbCBlZmksIHVuc2lnbmVkIGxvbmcgY21k
bGluZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBzeXN0YWIpOwoKIGVmaV9zdGF0dXNfdCBjaGVja19wbGF0Zm9ybV9mZWF0dXJlcyh2b2lk
KQpAQCAtODEsNCArODEsNiBAQAoKICAgICAgICByZWFsX2tlcm5lbF9lbnRyeSh0cnVlLCAodW5z
aWduZWQgbG9uZyljbWRsaW5lX3B0ciwKICAgICAgICAgICAgICAgICAgICAgICAgICAodW5zaWdu
ZWQgbG9uZyllZmlfc3lzdGVtX3RhYmxlKTsKKworICAgICAgIHJldHVybiBFRklfTE9BRF9FUlJP
UjsKIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
