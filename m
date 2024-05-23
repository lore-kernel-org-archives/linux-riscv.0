Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0166C25B79
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLaJXybAZGoeyrsRFcn/unSmpSIk8AOkKX9ejQzI2pw=; b=hmqcM4hkZ10EGG
	MAr9MxZGNOaHuq+4Ci6T9ZEv2+v6LDeqlkFmhbfVsp7uHz4frYsxZKsLQs2QCsvFDTC3wzhabn24/
	JOONhIQg4Dz+zvLfMwmqFOQLu2NNjVoCIBnaRQ1igs3chD6LU7zp9Thb05QYvPSSm9UM/1gglyzMS
	p+KtUaRl8XtT/sb0236utVI2wzrMMT+xweAhsvquP6w1PPn3lGrx376D1JmaG6xizh08qqn6Wq3zt
	FCyLUOYXll/aWkWMS5qD2jnaIxsHaFEiNQSY0m+EK/kHwTJMR/5h/OR6FaYY6wIHNJzPo/ElXih+4
	yjN772FDb719BPdyqnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA9v2-00000006ZM4-01r0;
	Thu, 23 May 2024 14:59:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA9ux-00000006ZJ4-3Hrc
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 14:59:45 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a59b178b75bso847963866b.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716476381; x=1717081181; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJf8nECqEBzmEqcVWslv5AXViIlFFnTcWLmUE5Gi6ig=;
        b=PuWDZtEPgFdpR3c+vC+d/hvtrFxpNXu9/YeRAf0dtHKioPRsblVN/g7fSgAdwaTt22
         VxUKQmYln/dSZL1mHD/YRoWJlskzuyYiLBQq78FaJUy1BRcvE9lGfEo0BpgDZH/3o1VB
         GmQ97Gg2YxxmeHWrQtwpM2votK/XsJmuYeLRPf3vdkTf2DedYfh8ZKik2ac3i4b/j/Cl
         0wBbAs7IneQBE9rrrD8a65FhLDVCmZjLux7TgSYf/IuIt/3NQZyagvp/KLMHdMGU67Bu
         yk0lMyYLHvQsA6De0XiQenIez6LqkOjWgjaBqO8STce8f8wNQnGZO2oOWLnuPxB7vLTt
         seWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716476381; x=1717081181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJf8nECqEBzmEqcVWslv5AXViIlFFnTcWLmUE5Gi6ig=;
        b=mI+Js+SFBb2r/5qNrQvKuc40nM45eNZ0LeEqYOaTbCZKQypRV9cpZdxa5jzh1L+YqI
         IWdbDZ1zhvSUvf7JgqBREeF/zvz4HZt6BVzjjWKLDn3a+SJHQTwj/IwRds9UNRqVNUt6
         hElh/C0zpbqA2rYLDkCSNI1KhAMJRQNXgqoPEEoont8eQ6k/IbewZVFBP2C5jPpr9fj+
         SKLCKJ69+V2+HWajXlNSTTv0qF9ZGbl5lSAzn7P7IlRw+PnbC46WQQunNPnKxHz4Yr14
         jDCzSTPu16+uI1MMqdjgORliINgS+ANW4XCXXE0HsHjufyD5pgwdbQfQ8fZbpI8VPdzI
         yrgw==
X-Forwarded-Encrypted: i=1; AJvYcCXnZUmE0xzGPNvuQ8Lsh821knbGGdfAU7ev+fRdNdnz+7scvbhkFyhT30utT4wXbuotcC5FGa/mqiIagbHCF/x+gv6wTG4Xba4ksIFD7Dzi
X-Gm-Message-State: AOJu0YyTDI8PSTy9+ZbVQWq4DI+lv35A0qLwivr90y4oXkQHs4MeGK7D
	JzREeW2SE6SySd2oLZSXcdpkmLMr16Q6BzXxu1A9mdHNZwxKe+eBTudCAlQssDpFnm9tGoqTzBf
	gPciecRE3ODDHmVN3D9iCJOe85xCJ/lUR0SxqjQ==
X-Google-Smtp-Source: AGHT+IH96ZBYqe4cc+1wFeLH7NX/PsHsWO2WigAasUwgg3Elfr20rtzmvQZZHOI45ry8NHHXFtdf/BIf5ZeuawftPVg=
X-Received: by 2002:a17:906:5296:b0:a5a:5c0b:ff77 with SMTP id
 a640c23a62f3a-a622806c0camr321589066b.19.1716476381026; Thu, 23 May 2024
 07:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240403234054.2020347-1-debug@rivosinc.com> <20240403234054.2020347-14-debug@rivosinc.com>
 <276fa17b-cd62-433d-b0ec-fa98c65a46ca@ghiti.fr> <ZkJOs6ENmDHFsq/U@debug.ba.rivosinc.com>
In-Reply-To: <ZkJOs6ENmDHFsq/U@debug.ba.rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 23 May 2024 16:59:30 +0200
Message-ID: <CAHVXubhS3CJ87DxC+9+8z6CiWDV1bQ8nK+iOZUDvMiT7vszFLA@mail.gmail.com>
Subject: Re: [PATCH v3 13/29] riscv mmu: write protect and shadow stack
To: Deepak Gupta <debug@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, paul.walmsley@sifive.com, rick.p.edgecombe@intel.com, 
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, 
	keescook@chromium.org, ajones@ventanamicro.com, conor.dooley@microchip.com, 
	cleger@rivosinc.com, atishp@atishpatra.org, bjorn@rivosinc.com, 
	samuel.holland@sifive.com, conor@kernel.org, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de, 
	ebiederm@xmission.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	lstoakes@gmail.com, shuah@kernel.org, brauner@kernel.org, 
	andy.chiu@sifive.com, jerry.shih@sifive.com, hankuan.chen@sifive.com, 
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com, 
	charlie@rivosinc.com, apatel@ventanamicro.com, mchitale@ventanamicro.com, 
	dbarboza@ventanamicro.com, sameo@rivosinc.com, shikemeng@huaweicloud.com, 
	willy@infradead.org, vincent.chen@sifive.com, guoren@kernel.org, 
	samitolvanen@google.com, songshuaishuai@tinylab.org, gerg@kernel.org, 
	heiko@sntech.de, bhe@redhat.com, jeeheng.sia@starfivetech.com, 
	cyy@cyyself.name, maskray@google.com, ancientmodern4@gmail.com, 
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com, bgray@linux.ibm.com, 
	mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, david@redhat.com, 
	catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org, 
	shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org, 
	jhubbard@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_075943_994895_1FB4241C 
X-CRM114-Status: GOOD (  27.40  )
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

SGkgRGVlcGFrLAoKT24gTW9uLCBNYXkgMTMsIDIwMjQgYXQgNzozMuKAr1BNIERlZXBhayBHdXB0
YSA8ZGVidWdAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgTWF5IDEyLCAyMDI0IGF0
IDA2OjMxOjI0UE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+T24gMDQvMDQvMjAy
NCAwMTozNSwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+ID4+YGZvcmtgIGltcGxlbWVudHMgY29weSBv
biB3cml0ZSAoQ09XKSBieSBtYWtpbmcgcGFnZXMgcmVhZG9ubHkgaW4gY2hpbGQKPiA+PmFuZCBw
YXJlbnQgYm90aC4KPiA+Pgo+ID4+cHRlcF9zZXRfd3Jwcm90ZWN0IGFuZCBwdGVfd3Jwcm90ZWN0
IGNsZWFycyBfUEFHRV9XUklURSBpbiBQVEUuCj4gPj5Bc3N1bXB0aW9uIGlzIHRoYXQgcGFnZSBp
cyByZWFkYWJsZSBhbmQgb24gZmF1bHQgY29weSBvbiB3cml0ZSBoYXBwZW5zLgo+ID4+Cj4gPj5U
byBpbXBsZW1lbnQgQ09XIG9uIHN1Y2ggcGFnZXMsCj4gPgo+ID4KPiA+SSBndWVzcyB5b3UgbWVh
biAic2hhZG93IHN0YWNrIHBhZ2VzIiBoZXJlLgo+Cj4gWWVzIEkgbWVhbnQgc2hhZG93IHN0YWNr
IHBhZ2VzLiBXaWxsIGZpeCB0aGUgbWVzc2FnZS4KPgo+ID4KPiA+Cj4gPj4gIGNsZWFyaW5nIHVw
IFcgYml0IG1ha2VzIHRoZW0gWFdSID0gMDAwLgo+ID4+VGhpcyB3aWxsIHJlc3VsdCBpbiB3cm9u
ZyBQVEUgc2V0dGluZyB3aGljaCBzYXlzIG5vIHBlcm1zIGJ1dCBWPTEgYW5kIFBGTgo+ID4+Zmll
bGQgcG9pbnRpbmcgdG8gZmluYWwgcGFnZS4gSW5zdGVhZCBkZXNpcmVkIGJlaGF2aW9yIGlzIHRv
IHR1cm4gaXQgaW50bwo+ID4+YSByZWFkYWJsZSBwYWdlLCB0YWtlIGFuIGFjY2VzcyAobG9hZC9z
dG9yZSkgZmF1bHQgb24gc3NwdXNoL3NzcG9wCj4gPj4oc2hhZG93IHN0YWNrKSBhbmQgdGhlbiBw
ZXJmb3JtIENPVyBvbiBzdWNoIHBhZ2VzLgo+ID4+VGhpcyB3YXkgcmVndWxhciByZWFkcwo+ID4+
d291bGQgc3RpbGwgYmUgYWxsb3dlZCBhbmQgbm90IGxlYWQgdG8gQ09XIG1haW50YWluaW5nIGN1
cnJlbnQgYmVoYXZpb3IKPiA+Pm9mIENPVyBvbiBub24tc2hhZG93IHN0YWNrIGJ1dCB3cml0ZWFi
bGUgbWVtb3J5Lgo+ID4+Cj4gPj5PbiB0aGUgb3RoZXIgaGFuZCBpdCBkb2Vzbid0IGludGVyZmVy
ZSB3aXRoIGV4aXN0aW5nIENPVyBmb3IgcmVhZC13cml0ZQo+ID4+bWVtb3J5LiBBc3N1bXB0aW9u
IGlzIGFsd2F5cyB0aGF0IF9QQUdFX1JFQUQgbXVzdCBoYXZlIGJlZW4gc2V0IGFuZCB0aHVzCj4g
Pj5zZXR0aW5nIF9QQUdFX1JFQUQgaXMgaGFybWxlc3MuCj4gPj4KPiA+PlNpZ25lZC1vZmYtYnk6
IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+ID4+LS0tCj4gPj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMTIgKysrKysrKysrKy0tCj4gPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj5kaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaAo+ID4+aW5kZXggOWI4MzcyMzlkM2U4Li43YTFjMmE5OGQyNzIgMTAw
NjQ0Cj4gPj4tLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4+KysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+PkBAIC0zOTgsNyArMzk4LDcgQEAg
c3RhdGljIGlubGluZSBpbnQgcHRlX3NwZWNpYWwocHRlX3QgcHRlKQo+ID4+ICBzdGF0aWMgaW5s
aW5lIHB0ZV90IHB0ZV93cnByb3RlY3QocHRlX3QgcHRlKQo+ID4+ICB7Cj4gPj4tICAgICByZXR1
cm4gX19wdGUocHRlX3ZhbChwdGUpICYgfihfUEFHRV9XUklURSkpOwo+ID4+KyAgICAgcmV0dXJu
IF9fcHRlKChwdGVfdmFsKHB0ZSkgJiB+KF9QQUdFX1dSSVRFKSkgfCAoX1BBR0VfUkVBRCkpOwo+
ID4+ICB9Cj4gPj4gIC8qIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX21rcmVhZChwdGVfdCBwdGUp
ICovCj4gPj5AQCAtNTgxLDcgKzU4MSwxNSBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZXBfZ2V0
X2FuZF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+PiAgc3RhdGljIGlubGluZSB2b2lk
IHB0ZXBfc2V0X3dycHJvdGVjdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3QgKnB0
ZXApCj4gPj4gIHsKPiA+Pi0gICAgIGF0b21pY19sb25nX2FuZCh+KHVuc2lnbmVkIGxvbmcpX1BB
R0VfV1JJVEUsIChhdG9taWNfbG9uZ190ICopcHRlcCk7Cj4gPj4rICAgICB2b2xhdGlsZSBwdGVf
dCByZWFkX3B0ZSA9ICpwdGVwOwoKU29ycnkgSSBtaXNzZWQgdGhpcyBeLiBZb3UgbmVlZCB0byB1
c2UgcHRlcF9nZXQoKSB0byBnZXQgdGhlIHZhbHVlIG9mCmEgcHRlLiBBbmQgd2h5IGRvIHlvdSBu
ZWVkIHRoZSB2b2xhdGlsZSBoZXJlPwoKPiA+PisgICAgIC8qCj4gPj4rICAgICAgKiBwdGVwX3Nl
dF93cnByb3RlY3QgY2FuIGJlIGNhbGxlZCBmb3Igc2hhZG93IHN0YWNrIHJhbmdlcyB0b28uCj4g
Pj4rICAgICAgKiBzaGFkb3cgc3RhY2sgbWVtb3J5IGlzIFhXUiA9IDAxMCBhbmQgdGh1cyBjbGVh
cmluZyBfUEFHRV9XUklURSB3aWxsIGxlYWQgdG8KPiA+PisgICAgICAqIGVuY29kaW5nIDAwMGIg
d2hpY2ggaXMgd3JvbmcgZW5jb2Rpbmcgd2l0aCBWID0gMS4gVGhpcyBzaG91bGQgbGVhZCB0byBw
YWdlIGZhdWx0Cj4gPj4rICAgICAgKiBidXQgd2UgZG9udCB3YW50IHRoaXMgd3JvbmcgY29uZmln
dXJhdGlvbiB0byBiZSBzZXQgaW4gcGFnZSB0YWJsZXMuCj4gPj4rICAgICAgKi8KPiA+PisgICAg
IGF0b21pY19sb25nX3NldCgoYXRvbWljX2xvbmdfdCAqKXB0ZXAsCj4gPj4rICAgICAgICAgICAg
ICAgICAgICAgKChwdGVfdmFsKHJlYWRfcHRlKSAmIH4odW5zaWduZWQgbG9uZylfUEFHRV9XUklU
RSkgfCBfUEFHRV9SRUFEKSk7Cj4gPj4gIH0KPiA+PiAgI2RlZmluZSBfX0hBVkVfQVJDSF9QVEVQ
X0NMRUFSX1lPVU5HX0ZMVVNICj4gPgo+ID4KPiA+RG9lc24ndCBtYWtpbmcgdGhlIHNoYWRvdyBz
dGFjayBwYWdlIHJlYWRhYmxlIGFsbG93ICJub3JtYWwiIGxvYWRzIHRvCj4gPmFjY2VzcyB0aGUg
cGFnZT8gSWYgaXQgZG9lcywgaXNuJ3QgdGhhdCBhbiBpc3N1ZSAoc2VjdXJpdHktd2lzZSk/Cj4K
PiBXaGVuIHNoYWRvdyBzdGFjayBwZXJtaXNzaW9ucyBhcmUgdGhlcmUgKGkuZS4gUj0wLCBXPTEs
IFg9MCksIHRoZW4gYWxzbyBzaGFkb3cgc3RhY2sgaXMKPiByZWFkYWJsZSB0aHJvdWdoICJub3Jt
YWwiIGxvYWRzLiBTbyBub3RoaW5nIGNoYW5nZXMgd2hlbiBpdCBjb252ZXJ0cyBpbnRvIGEgcmVh
ZG9ubHkgcGFnZQo+IGZyb20gcGFnZSBwZXJtaXNzaW9ucyBwZXJzcGVjdGl2ZS4KPgo+IFNlY3Vy
aXR5LXdpc2UgaXQncyBub3QgYSBjb25jZXJuIGJlY2F1c2UgZnJvbSB0aHJlYXQgbW9kZWxpbmcg
cGVyc3BlY3RpdmUsIGlmIGF0dGFja2VyIGhhZAo+IHJlYWQtd3JpdGUgcHJpbWl0aXZlcyAodmlh
IHNvbWUgYnVnIGluIHByb2dyYW0pIGF2YWlsYWJsZSB0byByZWFkIGFuZCB3cml0ZSBhZGRyZXNz
IHNwYWNlCj4gb2YgcHJvY2Vzcy90YXNrOyB0aGVuIHRoZXkgd291bGQgaGF2ZSBhdmFpbGlibGl0
eSBvZiByZXR1cm4gYWRkcmVzc2VzIG9uIG5vcm1hbCBzdGFjay4gSXQncwo+IHRoZSB3cml0ZSBw
cmltaXRpdmUgdGhhdCBpcyBjb25jZXJuaW5nIGFuZCB0byBiZSBwcm90ZWN0ZWQgYWdhaW5zdC4g
QW5kIHRoYXQncyB3aHkgc2hhZG93IHN0YWNrCj4gaXMgbm90IHdyaXRlYWJsZSB1c2luZyAibm9y
bWFsIiBzdG9yZXMuCj4KPiA+CgpUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiEKCldpdGggdGhl
IHVzZSBvZiBwdGVwX2dldCgpLCB5b3UgY2FuIGFkZDoKClJldmlld2VkLWJ5OiBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFua3MsCgpBbGV4CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
