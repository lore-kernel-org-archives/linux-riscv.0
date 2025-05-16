Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D73C3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMcJ7fELc6o8WGzTDNenSHUZ4TH2fwLhRXycuOPPTcQ=; b=Qv+8QD/ieQy1/t
	KAydWtM1Ooye+VU5mjy8TTU2NUoqPV0gt2wDvwqEUmJ4NTxw8qJ01qSeU7oGLwgaIVTUKCo9WULPS
	AGN3r83tc0vNsJfPD/MmUlgirCCrLxwpiaVTdN7fMpaH7e9AxQHPGgbqu9IwqamtozhYwY67Srihy
	/nNnAI69PiQcwmP9daE4/dzi6N4f/kf1w7tzNoIoq5fhRNGUwjRWQAoHqmAifFh6RvvLpHDBhcXWf
	doP6kJTlw7o2X8SXZCJqDpk6KDihxUHnw0FJwq9Zj7lMI+KjFYRSVjPQCF5wHt56dISRqtEP0Rsth
	mYNKXhasH/zkOwvmO7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuBB-00000003NGo-1eJf;
	Fri, 16 May 2025 12:28:45 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFu1H-00000003Lsi-1Ee5
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 12:18:33 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-864a071b44bso54212139f.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747397909; x=1748002709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXLHJHBQsbaoIB4GIfSa4RhdBp3kCgsZPB8o/GVOJzA=;
        b=1H2mxIrvoixnAW36a1dV/O0g8ih0+WHEmyMFEz1eCnESl43wuSkFtbaosWwUUXIHC+
         mF8R5Anl8QTT3nYsESWGMKrjJ8a1SGNHmjnBjW6ryREZs99l4nNXY9SOUHKfk+H9QUWN
         jpvOQLMaJYRGhMXm6wJz/nVMhGzefXVp32qQRoWbOWDHExyFtlpBzx1EZ8siAXtylAne
         gI8pW/tnGqT8yDEgfOpGQghVeE1QLCr+od2ctxJWFFLoMhqgHPYMYyz3PaXbTVKwAKya
         Z6JdJeTZ6N/mSjB2Nrwl0O7A+D166VTaCFFgFscuFpyTDypNhEVxdi9aesWieLjgO6Gn
         PxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747397909; x=1748002709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXLHJHBQsbaoIB4GIfSa4RhdBp3kCgsZPB8o/GVOJzA=;
        b=fMv2uAc7bWi8z8b5iYCvalZiPX/GozXhiobRQWIa7IpyaAEK2WmgsCl8WgQZJASUfl
         67lXxA27XqGc0bsK/MIhn3pI2tUA4cSixUOjy3V/gl2bDSgV8rvHYl9+wJyHsVaknEwZ
         jWdUyUtse5DmTSp2wk66Xbq/msSjgHAqjewWSHM2lmpS/4P8ZPmmvBH1/1/OAcaYO/XE
         XyXmzw5oWNEj75vdtig2OSw7IbgjVRtOJhUpPIPMxqkTyBcMAr36jAXrueiyNSeJ2hrx
         gGx5QIG2QnPQmWyX4Y38MA0qczpGj0G/XQWUk6FNZK0xTaVi+7LKN06Kw0FodvKUSd2X
         ocig==
X-Forwarded-Encrypted: i=1; AJvYcCX1gv+HJrNuRedo+0s6GZ4MwdYuaQb1f8X+Nd2PRmnedvjg8zJjC5M8by0d6QG9174/ioEAiKEhZRtkgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGjoFgkACl8hqr4qRj+iRabneW2JFOrrQDohMayO8mf9EOR8PX
	BsbwQ+i2Ao0ZM3s5p/gpBn0nw0MjG5KjJzGSO+pnrxr6h/ysRPPrvJf4LCJk4sEJ9rBnslt08fe
	Xsu7yv8YZGrUAobaa9V/g5ydTUgDC18skbhZBZ1tDQXUnKIuI+3Ye
X-Gm-Gg: ASbGnctnAN3qEwYIz7H9TtOXq3oHVVaYUQizfDjcfsTh+9K+dRYTXx0F+knERRqaCfm
	g+nG4PLoaqRAaWR3UDOQzt5vyEI3av8spqMrN7Qu0u8C7RzeXzzAWiSp4G/pIAL9c1lZEwVwqUS
	FczD/lxkqDouZzFW3iEnvi3BRfQyPnLWv49w==
X-Google-Smtp-Source: AGHT+IHD34D+aR8KNoG6UkMJChpNYbMrPeEL3hYF56R0IoB3miRbKE+gadHVNrNRu+Eu4UN/LJ5mYFMMVGXgscMuLoE=
X-Received: by 2002:a05:6602:388b:b0:85b:b82f:965b with SMTP id
 ca18e2360f4ac-86a24cd615cmr292088439f.12.1747397908949; Fri, 16 May 2025
 05:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
In-Reply-To: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 May 2025 17:48:18 +0530
X-Gm-Features: AX0GCFurvQGwK_iA09j5NRc65qTDV-rGIIByVlNf-XtMe4x-bC4mOj899x_A1VI
Message-ID: <CAAhSdy38s0WWc7Cv4KF+0_pGC3xKU3_PLgeedz7Pu04-xKm4jw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_051831_521603_3920F8E9 
X-CRM114-Status: GOOD (  20.34  )
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

T24gRnJpLCBNYXkgMTYsIDIwMjUgYXQgNDo0MeKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFNjb3VudGVyZW4gQ1NSIGNvbnRyb2xzIHRoZSBkaXJlY3Qg
YWNjZXNzIHRoZSBocG1jb3VudGVycyBhbmQgY3ljbGUvCj4gaW5zdHJldC90aW1lIGZyb20gdGhl
IHVzZXJzcGFjZS4gSXQncyB0aGUgc3VwZXJ2aXNvcidzIHJlc3BvbnNpYmlsaXR5Cj4gdG8gc2V0
IGl0IHVwIGNvcnJlY3RseSBmb3IgaXQncyB1c2VyIHNwYWNlLiBUaGV5IGh5cGVydmlzb3IgZG9l
c24ndAo+IG5lZWQgdG8gZGVjaWRlIHRoZSBwb2xpY3kgb24gYmVoYWxmIG9mIHRoZSBzdXBlcnZp
c29yLgo+Cj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+
Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIFJlbW92ZWQgdGhlIHJlZHVuZGFudCBkZWNsYXJh
dGlvbgo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDUxNS1m
aXhfc2NvdW50ZXJlbl92cy12Mi0xLTFmZDhkYzA2OTNlOEByaXZvc2luYy5jb20KPgo+IENoYW5n
ZXMgaW4gdjI6Cj4gLSBSZW1vdmUgdGhlIHNjb3VudGVyZW4gaW5pdGlhbGl6YXRpb24gaW5zdGVh
ZCBvZiBqdXN0IHNldHRpbmcgdGhlIFRNIGJpdC4KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNTA1MTMtZml4X3Njb3VudGVyZW5fdnMtdjEtMS1jMWY1MmFmOTNj
NzlAcml2b3NpbmMuY29tCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDQgLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBpbmRleCA2MGQ2ODRjNzZj
NTguLjliZmFhZTlhMTFlYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBAQCAtMTExLDcgKzExMSw2IEBAIGludCBrdm1f
YXJjaF92Y3B1X2NyZWF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAgICAgICAgIGlu
dCByYzsKPiAgICAgICAgIHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNudHg7Cj4gLSAgICAgICBz
dHJ1Y3Qga3ZtX3ZjcHVfY3NyICpyZXNldF9jc3IgPSAmdmNwdS0+YXJjaC5ndWVzdF9yZXNldF9j
c3I7Cj4KPiAgICAgICAgIHNwaW5fbG9ja19pbml0KCZ2Y3B1LT5hcmNoLm1wX3N0YXRlX2xvY2sp
Owo+Cj4gQEAgLTE0Niw5ICsxNDUsNiBAQCBpbnQga3ZtX2FyY2hfdmNwdV9jcmVhdGUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgaWYgKGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rv
cl9jb250ZXh0KHZjcHUsIGNudHgpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsK
Pgo+IC0gICAgICAgLyogQnkgZGVmYXVsdCwgbWFrZSBDWSwgVE0sIGFuZCBJUiBjb3VudGVycyBh
Y2Nlc3NpYmxlIGluIFZVIG1vZGUgKi8KPiAtICAgICAgIHJlc2V0X2Nzci0+c2NvdW50ZXJlbiA9
IDB4NzsKPiAtCj4gICAgICAgICAvKiBTZXR1cCBWQ1BVIHRpbWVyICovCj4gICAgICAgICBrdm1f
cmlzY3ZfdmNwdV90aW1lcl9pbml0KHZjcHUpOwo+Cj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogMDFm
OTU1MDBhMTYyZmNhODhjZWZhYjllZDY0Y2VkZWQ1YWZhYmMxMgo+IGNoYW5nZS1pZDogMjAyNTA1
MTMtZml4X3Njb3VudGVyZW5fdnMtZmRkODYyNTVjN2I3Cj4gLS0KCk92ZXJhbGwsIHRoaXMgbG9v
a3MgZ29vZC4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoK
Q3VycmVudGx5LCB0aGUgc2NvdW50ZXJlbi5UTSBiaXQgaXMgb25seSBzZXQgYnkgdGhlIExpbnV4
IFNCSSBQTVUKZHJpdmVyIGJ1dCBLVk0gUklTQy1WIG9ubHkgcHJvdmlkZXMgU0JJIFBNVSBmb3Ig
Z3Vlc3Qgd2hlbgpTc2NvZnBtZiBpcyBhdmFpbGFibGUgaW4gaG9zdCBzbyB3ZSBuZWVkIHRoZSBi
ZWxvdyBodW5rIHRvCmNvbXBsZXRlbHkgZ2V0IHJpZC1vZmYgc2NvdW50ZXJlbiBpbml0aWFsaXph
dGlvbiBpbiBLVk0gUklTQy1WLgoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQu
UyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwppbmRleCAzNTZkNTM5N2IyYTIuLmJkZjMzNTJh
Y2Y0YyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCisrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2hlYWQuUwpAQCAtMTMxLDYgKzEzMSwxMiBAQCBzZWNvbmRhcnlfc3RhcnRfc2Jp
OgogICAgIGNzcncgQ1NSX0lFLCB6ZXJvCiAgICAgY3NydyBDU1JfSVAsIHplcm8KCisjaWZuZGVm
IENPTkZJR19SSVNDVl9NX01PREUKKyAgICAvKiBFbmFibGUgdGltZSBDU1IgKi8KKyAgICBsaSB0
MCwgMHgyCisgICAgY3NydyBDU1JfU0NPVU5URVJFTiwgdDAKKyNlbmRpZgorCiAgICAgLyogTG9h
ZCB0aGUgZ2xvYmFsIHBvaW50ZXIgKi8KICAgICBsb2FkX2dsb2JhbF9wb2ludGVyCgpAQCAtMjI2
LDYgKzIzMiwxMCBAQCBTWU1fQ09ERV9TVEFSVChfc3RhcnRfa2VybmVsKQogICAgICAqIHRvIGhh
bmQgaXQgdG8gdXMuCiAgICAgICovCiAgICAgY3NyciBhMCwgQ1NSX01IQVJUSUQKKyNlbHNlCisg
ICAgLyogRW5hYmxlIHRpbWUgQ1NSICovCisgICAgbGkgdDAsIDB4MgorICAgIGNzcncgQ1NSX1ND
T1VOVEVSRU4sIHQwCiAjZW5kaWYgLyogQ09ORklHX1JJU0NWX01fTU9ERSAqLwoKICAgICAvKiBM
b2FkIHRoZSBnbG9iYWwgcG9pbnRlciAqLwoKSSBoYXZlIHF1ZXVlZCB0aGlzIHBhdGNoIGZvciBM
aW51eC02LjE2IHdpdGggdGhlIGFib3ZlIGh1bmsgc3F1YXNoZWQuCgpUaGFua3MsCkFudXAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
