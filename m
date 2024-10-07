Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3B8CFB43F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30xHBuwzmyjlishzcKrhRCvazhhdmoQsQWfHbuHUk+M=; b=Q2I5dPWKJ3Qa7v
	u0M/zRHEZJkLEj3g6zLBK2JdLfevh2sxh2HAIwtDmVOHYo1mofVh4P6DcQd9fFCHps44ggzffESdR
	o3/kLVXIUiWrh4kbQo0jUE8eT35AdksRWh7uuEY1XV/sHauRR5kBMMHOJF+JQL4jIQSiB5Rdr7d4t
	RiZMvg4ZJrjaVrpmsOmDg9yMK4+ZsrM56R3ye+oqk6rPPgWlKlMwVl4urcbfc69aQqUYCs8XnJAHJ
	/9J8inC5RfMcwl781lIWWqo2pbsG4ePAX7RciPLMTAuwqrjLn1dWUxLcRW2skP3AvrbPtBojkVwfm
	zgQNT5x8ZhlFdb0C6EtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkIO-00000001x6k-0UkP;
	Mon, 07 Oct 2024 09:44:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkIM-00000001x6E-2LcC
	for linux-riscv@bombadil.infradead.org;
	Mon, 07 Oct 2024 09:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ml6uWsothzA9eIDdAcJEjmHopJWE030UgugZ4ktHx10=; b=YKraef+Kbz26/TfRRPKLjIZPek
	VuqeZ7fkaGuwO8FuMvT4NDLiU88EuRgHjlPIN9wLV2Tt67o5050wMOCkhqrEWzGXYGZl5rbNFrj63
	yt13Q2JH8zFsN1eek1N3lv7e+nuDlHSoQznnQiwbgimEMvQy5/PCXbVN6j2NnmiPKrVSMpcuEtQ6R
	4CWRvX6E47IFp9kcpJiISuGNJYGpkB7IjawDAKTxeX6l14s1UwszFLzBteHdlH3J6Q7ElF/2Z1Ymx
	EsIxOBWzJAbVZoAg54u+6Ho3W0eFxeWFLV+JJhd7MYY1j1MPEd93FXjRRMWutvyIfQmhyNpCX8T98
	n38hDRDw==;
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkIJ-00000004OoG-1OMg
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 09:44:49 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6cb399056b4so34579796d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 02:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728294283; x=1728899083; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml6uWsothzA9eIDdAcJEjmHopJWE030UgugZ4ktHx10=;
        b=UiokRJKYAiq291ESZR+tV8JIRaQwB1QclEigZMn8MIlZ6OcjK5rNtzHLclh9qUIGc1
         Z9IQzsL3PuhC95ZeIc8Zng1iGjonigLpbLmIpkGXznS0gajL0rMDoPKs92pLKsmZANMU
         osAYBxYtfEXmB+3/Iy01zyqE0/R/JnX0bm8FU5NMApkOUJ9/p+s4DOfZX6IDdTa9fpR2
         JlHhS6tUEwAj/B2ALcZnlVXMLOJ8pPuTR2gYqlYttCTmyixWPmRpoDe7tR6byZGarwBx
         Rcai1Vz0dZllFiMOpCP+Z5L+GxBO9hhLJd/6d5H6mz5H3XsfOYI0TULkZ7dT3oPmbRSU
         MopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728294283; x=1728899083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml6uWsothzA9eIDdAcJEjmHopJWE030UgugZ4ktHx10=;
        b=I/jFtQlQ/333cONcFle3yvQgBXHtQz7/1OADk+de3nm3YCwAs+AOqKgiIz9u7XqyeY
         XzH0ZwVEnlaT59NEZ8W33brOJPjvg7rYb/YqWUlleFEI74zM7aBTyH4NUEpYSVJsDDOh
         qVcxE+MLckBPp6oA8CbjwkKfcdTlcpcxhQqin0LExtbkVKGiPd56bAGWFSAvUif94z/y
         PXfF/lHTXfkXzwZkAKgK8YmYMQVN3f7VyBGLoztu10+OuZKH7AcS/4LL02dWoevhjRQK
         eReUQFgt5r9JCaI7DS/y0g6zTOV6fnFVclqC39Pk5+IM+GEG9J69R77vlh/FSm0S7O4Y
         0sMA==
X-Forwarded-Encrypted: i=1; AJvYcCWf0OQYSru4BfS1igvEVzgr3pLoLOeMqBJOMdipZCYvZb1nnRaELsLnkjXyW2DViZXpmwWm+phzWr2Eqg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2WJr8Z3C4KP21FmFZReR681M8i5hAVC0gTb1MDlkvz/lJ2+cy
	72gxC5HL0nQYPLxO+92ztPgYypC4Sh88K0uyVz7tWWYSi+nu15u+NINXA0YbJS3NIsA5g3SMRGs
	ZXDxjlQ7kJh3AAOvtN5LNQlA0xJM=
X-Google-Smtp-Source: AGHT+IHwu0+ExraN6lI8PDASAwGp8UlOwKbUHugiEhu3POast1ep8Dt1D0BRGeu3Y+NammQ4ZQcdgvKB7XiGON60YAM=
X-Received: by 2002:a05:6214:3b89:b0:6cb:49d2:c704 with SMTP id
 6a1803df08f44-6cb9a2f98d0mr158035996d6.12.1728294283399; Mon, 07 Oct 2024
 02:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240928155219.266866-1-cs.os.kernel@gmail.com> <42d4b2cd-5c22-45bf-86b7-0ae128b2fc63@ghiti.fr>
In-Reply-To: <42d4b2cd-5c22-45bf-86b7-0ae128b2fc63@ghiti.fr>
From: Cheng Chao <cs.os.kernel@gmail.com>
Date: Mon, 7 Oct 2024 17:44:32 +0800
Message-ID: <CA+1SViAjeqYL8obCDxC=vvaKOadf9A0WSfCfF771NKAiN5bZDQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: check the SV39 rule
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_104447_492696_BD656964 
X-CRM114-Status: GOOD (  30.05  )
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

SGkgQWxleGFuZHJlLAogIFRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoaXMgcGF0Y2guICBJIGRvbid0
IHJlcGx5IG9uIHRpbWUgZHVlIHRvIHRoZQpOYXRpb25hbCBEYXkgOikKCgpPbiBNb24sIFNlcCAz
MCwgMjAyNCBhdCAzOjQ24oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90
ZToKPgo+IEhpIENoZW5nLAo+Cj4gT24gMjgvMDkvMjAyNCAxNzo1MiwgQ2hlbmcgQ2hhbyB3cm90
ZToKPiA+IFNWMzkgcnVsZTogdGhlIGFkZHJlc3Mgb2YgYml0c1s2My4uMzldIHNob3VsZCBiZSB0
aGUgc2FtZSBhcyBiaXRbMzhdLAo+ID4gaXQgaXMgZWFzeSB0byB2aW9sYXRlIGlmIGNvbmZpZ3Vy
ZSBQQUdFX09GRlNFVCB0b28gc21hbGwuCj4gPiBmb3IgaW5zdGFuY2UsIFBBR0VfT0ZGU0VUPTB4
ZmZmZmZmYzBfMDAwMF8wMDAwLAo+Cj4KPiBPdXQgb2YgY3VyaW9zaXR5LCB3aHkgZG8geW91IHRy
eSB0byBtb2RpZnkgdGhlIGN1cnJlbnQgbWVtb3J5IGxheW91dD8KCkl0J3MgYSBsb25nIHN0b3J5
LiBJJ20gd29ya2luZyBvbiBrZXJuZWwtNS4xMCwgYW5kIHRoZSBkZWZhdWx0ClBBR0VfT0ZGU0VU
IDB4ZmZmZmZmZTBfMDAwMF8wMDAwIGNhbiBvbmx5IG1hcCB0aGUgMTI4RyBwaHlzaWNhbAphZGRy
ZXNzLAphbmQgd2UgbmVlZCB0byBtYXAgbW9yZSB0aGFuIDEyOEcgaW4gdGhlIHJlYWwgd29ybGQu
CgpBZnRlciBJIGNoYW5nZWQgUEFHRV9PRkZTRVQgdG8gYSBzbWFsbGVyIHZhbHVlIHdoaWNoIGNh
biBtYXAgYSBtb3JlCnBoeXNpY2FsIGFkZHJlc3MuCnRoZSBrZXJuZWwgcGFuaWMocGFnZSBmYXVs
dCkgd2hlbiAgZWFybHljb24gcHJpbnRrLCAgdGhlIGNhdXNlIGlzIDB4ZiwKYmFkYWRkciBpcyAw
eGZmZmZmZmJ4X3h4eHhfeHh4eC4KSXQgdG9vayBtZSBzZXZlcmFsIGRheXMgdG8gZGVidWcgdGhp
cyBwYW5pYywgYXQgdGhlIGJlZ2lubmluZywgSQpjb25zaWRlcmVkIE1NVSBkb2Vzbid0IHdvcmsg
Zm9yIGVhcmx5Y29uLCBzbyBJIHRyYWNlZCB0aGUgcGdkL3BtZC9wdGUsCmFsbCBhcmUgY29ycmVj
dCBiZWZvcmUgcGFnZSBmYXVsdC4KT2NjYXNpb25hbGx5LCBJIGZvdW5kIHRoZSBTVjM5IHJ1bGU6
IHRoZSBhZGRyZXNzIG9mIGJpdHNbNjMuLjM5XQpzaG91bGQgYmUgdGhlIHNhbWUgYXMgYml0WzM4
XSwgIHRoZSBhZGRyZXNzIDB4ZmZmZmZmYnhfeHh4eF94eHh4CnZpb2xhdGVzIHRoZSBydWxlLgpU
aGUgcm9vdCBjYXVzZSBpcyB0aGF0IHRoZSBrZXJuZWwgZG9lc24ndCBzZW5zZSB0aGUgU1YzOSBy
dWxlLCBzbyB3aGVuCkkgYWRqdXN0IHRoZSBQQUdFX09GRlNFVCwgdGhlIEZJWEFERFJfU1RBUlQg
d2lsbCBhZGp1c3QgdG9vIHdpdGhvdXQKYW55IGNoZWNrLgp3aGVuIGFjY2Vzc2luZyB0aGUgW0ZJ
WEFERFIsIEZJWEFERFIgKyBQTURfU0laRV0gLCB0aGUga2VybmVsIHdpbGwKaGF2ZSBhIHBhZ2Ug
ZmF1bHQuCgo+Cj4KPiA+IHRoZSBGSVhBRERSX1NUQVJUIHdpbGwgYmUgdGhlIDB4ZmZmZmZmZmIw
X3h4eHhfeHh4eCwKPiA+IGJpdFszOV0gPT0gMCdiMSwgYml0WzM4XSA9PSAwJ2IwLCB3aGVuIGFj
Y2VzcyB0aGUgRklYQUREUiwKPiA+IHdoaWNoIGNhdXNlIHRoZSBwYWdlIGZhdWx0Lgo+ID4gSXQn
cyBkaWZmaWN1bHQgdG8gZGVidWcsIGNoZWNrIGl0IHdoZW4gY29tcGlsZSBpcyBuZWNlc3Nhcnku
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgQ2hhbyA8Y3Mub3Mua2VybmVsQGdtYWlsLmNv
bT4KPiA+IC0tLQo+ID4gICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDggKysrKysrKy0KPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4g
PiBpbmRleCBiZmEyZGVhOTUzNTQuLmE1ZmIzZmMyYjJkYiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTEz
ODcsNiArMTM4NywxMiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYXJjaF9yZXNlcnZlX2NyYXNoa2Vy
bmVsKHZvaWQpCj4gPgo+ID4gICB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+ID4gICB7
Cj4gPiArI2lmZGVmIENPTkZJR182NEJJVAo+ID4gKyAgICAgQlVJTERfQlVHX09OX01TRygoVkFf
QklUUyA9PSBWQV9CSVRTX1NWMzkpICYmCj4KPgo+IFZBX0JJVFMgaXMgZGV0ZXJtaW5lZCBhdCBy
dW50aW1lLCBlaXRoZXIgYnkgc2V0dGluZyAibm9YbHZsIiBvbiB0aGUKPiBrZXJuZWwgY29tbWFu
ZCBsaW5lIG9yIGJ5IHByb2JpbmcgdGhlIEhXIGNhcGFiaWxpdGllcywgc28gdGhlIGFib3ZlCj4g
Y2FuJ3QgYmUgZGV0ZXJtaW5lZCBhdCBidWlsZCB0aW1lLCBvciBhbSBJIG1pc3Npbmcgc29tZXRo
aW5nPwo+CnlvdSBhcmUgcmlnaHQsCmluIGNhc2Ugb2YgQ09ORklHX1hJUF9LRVJORUw9eSwgIFZB
X0JJVFMgd2lsbCBiZSBWQV9CSVRTX1NWMzksICB0aGlzCnBhdGNoIHdvcmtzLgpvdGhlciBjYXNl
cywgZGlzYWJsZV9wZ3RhYmxlX2w0IHdpbGwgZW5hYmxlIFNBVFBfTU9ERV8zOSwgIHdlIGFsc28K
Y2hlY2sgU1YzOSBydWxlIGhlcmU/CkBAIC03NjMsNiArNzYzLDExIEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCBkaXNhYmxlX3BndGFibGVfbDQodm9pZCkKICAgICAgICBwZ3RhYmxlX2w0X2VuYWJsZWQg
PSBmYWxzZTsKICAgICAgICBrZXJuZWxfbWFwLnBhZ2Vfb2Zmc2V0ID0gUEFHRV9PRkZTRVRfTDM7
CiAgICAgICAgc2F0cF9tb2RlID0gU0FUUF9NT0RFXzM5OworCisgICAgICAgaWYgKChWQV9CSVRT
ID09IFZBX0JJVFNfU1YzOSkgJiYKKyAgICAgICAgICAgICAgICAgICAgICAgKCgoRklYQUREUl9T
VEFSVCAmIEJJVCgzOSkpID4+IDM5KQorICAgICAgICAgICAgICAgICAgICAgICAgIT0gKChGSVhB
RERSX1NUQVJUICYgQklUKDM4KSkgPj4gMzgpKSkKKyAgICAgICAgICAgICAgIHBhbmljKCJ2aW9s
YXRlIFNWMzkgcnVsZTogYml0c1s2My4uMzldIHNob3VsZCBiZSBzYW1lCmFzIGJpdFszOF1cbiIp
OwogfQoKPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICgoKEZJWEFERFJfU1RBUlQgJiBCSVQo
MzkpKSA+PiAzOSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIT0gKChGSVhBRERSX1NUQVJU
ICYgQklUKDM4KSkgPj4gMzgpKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAidmlvbGF0ZSBT
VjM5IHJ1bGU6IGJpdHNbNjMuLjM5XSBzaG91bGQgYmUgc2FtZSBhcyBiaXRbMzhdIik7Cj4gPiAr
I2VuZGlmCj4gPiAgICAgICBzZXR1cF9ib290bWVtKCk7Cj4gPiAgICAgICBzZXR1cF92bV9maW5h
bCgpOwo+ID4KPgo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+CgpUaGFua3MsCkNoZW5nIENoYW8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
