Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB494C61CE8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 22:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KekA0pfcueGYD9GrLkuwtZ1cIBMfRW/DOc1RIQUtQL0=; b=0jsLBDDRr5UvXP
	iV4ni4YUHeLO1TP+hpBFJHDWalxpaajmV5GTIboEuw5ymNTlUz7f3BiM2GdzHpelqpoqsg4S4Hhaq
	UN0MTG+gsnroqcXtp2BVDCIUYALqoE/gk08ZnM/A3POqtwzEt9QbOuj4mUBKdIfEtawzZusleVg0v
	eSK5VlPTJx/XaYJshOYnqAlTLgEQTGLpzC4TGyWNIdaL6DZ9hMBkm0Zb7m3WvRkZdG26Ju/KyB9yb
	JWudHel1f9nqeAyW/ZSfn2ocMRRz50y8yOgLRQPk8eByHludx3KHYCXYDx7H7MurQOpCHUepq1bxN
	LcM7Wa3lzG/7rLL4uUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOl90-00000005MSf-13jK;
	Mon, 09 Jun 2025 22:39:06 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOl6q-00000005MBp-2ZZ8;
	Mon, 09 Jun 2025 22:36:53 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4a6f3f88613so22625721cf.1;
        Mon, 09 Jun 2025 15:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749508610; x=1750113410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hq0btBK5TQK/jQfASAZ7ArH/Py2u4qhWqQQYIBxtEI=;
        b=mtVsdTebZPmNqTwtlpTrlOlEsfwNDJIBqj47NeCFEAMiBmVXBDoosm+ATj8FH8n2Rc
         lBctxrN29zOdRJQpQhFOVjPH/8pc2wtsFoMyT6VbCYXU0v61dv3OGoRR6Xsn2aWMx+nX
         xbi3Dir0Uxqstqnozp6OgVR1odW8+xw4g+DefY73vfPIlpjVYEm8l0GH6C0YDmzrsYjy
         e9uS2TEOCCy2QwbJRWRzTxTcpVogb4nr71oks6qWsS7XTkbtXk6VE8AFAarHvwiXGoNs
         PHT6jsOvrLSEH13jVdB9y5FuDQzhRir5nKFDGwoWmBjJeJxViiDAlXsp6kzFLEBeeWur
         sKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749508610; x=1750113410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hq0btBK5TQK/jQfASAZ7ArH/Py2u4qhWqQQYIBxtEI=;
        b=f3aSoUhz0GaIHb1w7bLWdWGbb2w9lOUn7o0NLnkXsLcVoN5IhrjWmN8DQ7H78YOzjE
         oc00pkblNoYvR6YQiZToR9nTfprtc5sawoZwLw2ryFlqEBrVleRWprxYTUxMyQI5IUWD
         uUgyZNougzp7bcO/ssTSSeF3znN6rx7isDHzs3u9EP1TnMNT2tRXtSU/MVE088OgogL6
         7n47bkihY4ACDHlPdUlnQx+VQeFymdgbviwFtyCldoFCi/3mn7JCPnQwMEeaq7Y9uvTk
         Yta9lTWbIc5bhI9g0eRHW4V43PoK6PQ6h6yya4nWAkqxJmHSyMHHyXhOCTedhhcoQwm9
         ymBw==
X-Forwarded-Encrypted: i=1; AJvYcCUcgKRj2UBu9YQR2sSzxsi6t6cIivSvji4FnY4V0eT6v9I4W2VPqtRlQ4GZLOrgdicowBmJh1ZsHEkza+U=@lists.infradead.org, AJvYcCWR86gP28MyyfXgGogEo3vcf5X5/cm3b0kGMc809t02UNTHOYRqlQOjfvs2ptyo1W2I8oNx5Pmg/8BQ1umuBeWf@lists.infradead.org
X-Gm-Message-State: AOJu0YxoF2MDA2mmKp5AxGL1TLub3B5nHZgLdppqw73LxWKwfHkNlmqi
	QYZSVLxoaUB07bXhyZLrxEPgR7ryvlSEJWwfAIF9zAlo+C2jJq6JE8vk452PJHjseLZf6uPWDTG
	14Lz7On3SgPb2DY7nS+Zx11jPN1L/YRE=
X-Gm-Gg: ASbGncvTAFNDcyBXjiOnRiUZJS8F2lq4ZhIWo/pshzQRB8mLWImNJ0ioG8v0XQ5/aiC
	D8M7qNuuaii/h/vXYVFRcZB0X6mw2lHIQUlo5ZDdIGvo92mYzuHutDpyes5ZPWHrVYzcXrICvhS
	3PPc+HbX4mc8C/L6BO3n+a2duUj31PQqz+UtIkFdvwlgQ=
X-Google-Smtp-Source: AGHT+IEs8tHro3Bqg7q8bk+joLEpnvyUJ+PSWmsKZZ858+7uklxqykPVE6FCaw1PpU8qCZAfdipBs10XMfJUvah5VmA=
X-Received: by 2002:a05:6214:f2a:b0:6fa:f94e:6e75 with SMTP id
 6a1803df08f44-6fb08f5f7c4mr277251346d6.25.1749508610272; Mon, 09 Jun 2025
 15:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250607200454.73587-1-ebiggers@kernel.org> <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
 <20250609194845.GC1255@sol>
In-Reply-To: <20250609194845.GC1255@sol>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 10 Jun 2025 08:36:39 +1000
X-Gm-Features: AX0GCFuUtzPWjE_fUMffnG3t-eGyXruP1OclUqP-Gat86eROO8R2ly8lc5p3jN0
Message-ID: <CAGRGNgXw5LcykjiRS3yteb0K8FmYtb9wp1CJPM+GCKAw7j4ktQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is integrated
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_153652_660955_2A8D5CED 
X-CRM114-Status: GOOD (  34.96  )
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

SGkgRXJpYywKCk9uIFR1ZSwgSnVuIDEwLCAyMDI1IGF0IDU6NDnigK9BTSBFcmljIEJpZ2dlcnMg
PGViaWdnZXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMDksIDIwMjUgYXQg
MDY6MTU6MjRQTSArMTAwMCwgSnVsaWFuIENhbGFieSB3cm90ZToKPiA+IEhpIEVyaWMsCj4gPgo+
ID4gT24gU3VuLCBKdW4gOCwgMjAyNSBhdCA2OjA34oCvQU0gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vy
c0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBzZXJpZXMgaXMgYWxzbyBhdmFp
bGFibGUgYXQ6Cj4gPiA+Cj4gPiA+ICAgICBnaXQgZmV0Y2ggaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZWJpZ2dlcnMvbGludXguZ2l0IGxpYi1jcmMtYXJj
aC12Mgo+ID4gPgo+ID4gPiBUaGlzIHNlcmllcyBpbXByb3ZlcyBob3cgbGliL2NyYyBzdXBwb3J0
cyBhcmNoLW9wdGltaXplZCBjb2RlLiAgRmlyc3QsCj4gPiA+IGluc3RlYWQgb2YgdGhlIGFyY2gt
b3B0aW1pemVkIENSQyBjb2RlIGJlaW5nIGluIGFyY2gvJChTUkNBUkNIKS9saWIvLCBpdAo+ID4g
PiB3aWxsIG5vdyBiZSBpbiBsaWIvY3JjLyQoU1JDQVJDSCkvLiAgU2Vjb25kLCB0aGUgQVBJIGZ1
bmN0aW9ucyAoZS5nLgo+ID4gPiBjcmMzMmMoKSksIGFyY2gtb3B0aW1pemVkIGZ1bmN0aW9ucyAo
ZS5nLiBjcmMzMmNfYXJjaCgpKSwgYW5kIGdlbmVyaWMKPiA+ID4gZnVuY3Rpb25zIChlLmcuIGNy
YzMyY19iYXNlKCkpIHdpbGwgbm93IGJlIHBhcnQgb2YgYSBzaW5nbGUgbW9kdWxlIGZvcgo+ID4g
PiBlYWNoIENSQyB0eXBlLCBhbGxvd2luZyBiZXR0ZXIgaW5saW5pbmcgYW5kIGRlYWQgY29kZSBl
bGltaW5hdGlvbi4gIFRoZQo+ID4gPiBzZWNvbmQgY2hhbmdlIGlzIG1hZGUgcG9zc2libGUgYnkg
dGhlIGZpcnN0Lgo+ID4gPgo+ID4gPiBBcyBhbiBleGFtcGxlLCBjb25zaWRlciBDT05GSUdfQ1JD
MzI9bSBvbiB4ODYuICBXZSdsbCBub3cgaGF2ZSBqdXN0Cj4gPiA+IGNyYzMyLmtvIGluc3RlYWQg
b2YgYm90aCBjcmMzMi14ODYua28gYW5kIGNyYzMyLmtvLiAgVGhlIHR3byBtb2R1bGVzCj4gPiA+
IHdlcmUgYWxyZWFkeSBjb3VwbGVkIHRvZ2V0aGVyIGFuZCBhbHdheXMgYm90aCBnb3QgbG9hZGVk
IHRvZ2V0aGVyIHZpYQo+ID4gPiBkaXJlY3Qgc3ltYm9sIGRlcGVuZGVuY3ksIHNvIHRoZSBzZXBh
cmF0aW9uIHByb3ZpZGVkIG5vIGJlbmVmaXQuCj4gPiA+Cj4gPiA+IE5vdGU6IGxhdGVyIEknZCBs
aWtlIHRvIGFwcGx5IHRoZSBzYW1lIGRlc2lnbiB0byBsaWIvY3J5cHRvLyB0b28sIHdoZXJlCj4g
PiA+IG9mdGVuIHRoZSBBUEkgZnVuY3Rpb25zIGFyZSBvdXQtb2YtbGluZSBzbyB0aGlzIHdpbGwg
d29yayBldmVuIGJldHRlci4KPiA+ID4gSW4gdGhvc2UgY2FzZXMsIGZvciBlYWNoIGFsZ29yaXRo
bSB3ZSBjdXJyZW50bHkgaGF2ZSAzIG1vZHVsZXMgYWxsCj4gPiA+IGNvdXBsZWQgdG9nZXRoZXIs
IGUuZy4gbGlic2hhMjU2LmtvLCBsaWJzaGEyNTYtZ2VuZXJpYy5rbywgYW5kCj4gPiA+IHNoYTI1
Ni14ODYua28uICBXZSBzaG91bGQgaGF2ZSBqdXN0IG9uZSwgaW5saW5lIHRoaW5ncyBwcm9wZXJs
eSwgYW5kCj4gPiA+IHJlbHkgb24gdGhlIGNvbXBpbGVyJ3MgZGVhZCBjb2RlIGVsaW1pbmF0aW9u
IHRvIGRlY2lkZSB0aGUgaW5jbHVzaW9uIG9mCj4gPiA+IHRoZSBnZW5lcmljIGNvZGUgaW5zdGVh
ZCBvZiBtYW51YWxseSBzZXR0aW5nIGl0IHZpYSBrY29uZmlnLgo+ID4gPgo+ID4gPiBIYXZpbmcg
YXJjaC1zcGVjaWZpYyBjb2RlIG91dHNpZGUgYXJjaC8gd2FzIHNvbWV3aGF0IGNvbnRyb3ZlcnNp
YWwgd2hlbgo+ID4gPiBaaW5jIHByb3Bvc2VkIGl0IGJhY2sgaW4gMjAxOC4gIEJ1dCBJIGRvbid0
IHRoaW5rIHRoZSBjb25jZXJucyBhcmUKPiA+ID4gd2FycmFudGVkLiAgSXQncyBiZXR0ZXIgZnJv
bSBhIHRlY2huaWNhbCBwZXJzcGVjdGl2ZSwgYXMgaXQgZW5hYmxlcyB0aGUKPiA+ID4gaW1wcm92
ZW1lbnRzIG1lbnRpb25lZCBhYm92ZS4gIFRoaXMgbW9kZWwgaXMgYWxyZWFkeSBzdWNjZXNzZnVs
bHkgdXNlZAo+ID4gPiBpbiBvdGhlciBwbGFjZXMgaW4gdGhlIGtlcm5lbCBzdWNoIGFzIGxpYi9y
YWlkNi8uICBUaGUgY29tbXVuaXR5IG9mIGVhY2gKPiA+ID4gYXJjaGl0ZWN0dXJlIHN0aWxsIHJl
bWFpbnMgZnJlZSB0byB3b3JrIG9uIHRoZSBjb2RlLCBldmVuIGlmIGl0J3Mgbm90IGluCj4gPiA+
IGFyY2gvLiAgQXQgdGhlIHRpbWUgdGhlcmUgd2FzIGFsc28gYSBkZXNpcmUgdG8gcHV0IHRoZSBs
aWJyYXJ5IGNvZGUgaW4KPiA+ID4gdGhlIHNhbWUgZmlsZXMgYXMgdGhlIG9sZC1zY2hvb2wgY3J5
cHRvIEFQSSwgYnV0IHRoYXQgd2FzIGEgbWlzdGFrZTsgbm93Cj4gPiA+IHRoYXQgdGhlIGxpYnJh
cnkgaXMgc2VwYXJhdGUsIHRoYXQncyBubyBsb25nZXIgYSBjb25zdHJhaW50IGVpdGhlci4KPiA+
Cj4gPiBRdWljayBxdWVzdGlvbiwgYW5kIGFwb2xvZ2llcyBpZiB0aGlzIGhhcyBiZWVuIGNvdmVy
ZWQgZWxzZXdoZXJlLgo+ID4KPiA+IFdoeSBub3QganVzdCB1c2UgY2hvaWNlIGJsb2NrcyBpbiBL
Y29uZmlnIHRvIGNob29zZSB0aGUgY29tcGlsZWQtaW4KPiA+IGNyYzMyIHZhcmlhbnQgaW5zdGVh
ZCBvZiB0aGlzIHNvbWV3aGF0IGluZGlyZWN0IHNjaGVtZT8KPiA+Cj4gPiBUaGlzIHdvdWxkIGtl
ZXAgdGhlIGRlcGVuZGVuY2llcyBncm91cGVkIGJ5IGFyY2ggYW5kIHByb3ZpZGUgYSBzaW5nbGUg
cGxhY2UgdG8KPiA+IGNob29zZSB3aGV0aGVyIHRoZSBnZW5lcmljIG9yIGFyY2gtc3BlY2lmaWMg
bWV0aG9kIGlzIHVzZWQuCj4KPiBJdCdzIG5vdCBjbGVhciBleGFjdGx5IHdoYXQgeW91J3JlIHN1
Z2dlc3RpbmcsIGJ1dCBpdCBzb3VuZHMgbGlrZSB5b3UncmUKPiBjb21wbGFpbmluZyBhYm91dCB0
aGlzOgo+Cj4gICAgIGNvbmZpZyBDUkMzMl9BUkNICj4gICAgICAgICAgICAgYm9vbAo+ICAgICAg
ICAgICAgIGRlcGVuZHMgb24gQ1JDMzIgJiYgQ1JDX09QVElNSVpBVElPTlMKPiAgICAgICAgICAg
ICBkZWZhdWx0IHkgaWYgQVJNICYmIEtFUk5FTF9NT0RFX05FT04KPiAgICAgICAgICAgICBkZWZh
dWx0IHkgaWYgQVJNNjQKPiAgICAgICAgICAgICBkZWZhdWx0IHkgaWYgTE9PTkdBUkNICj4gICAg
ICAgICAgICAgZGVmYXVsdCB5IGlmIE1JUFMgJiYgQ1BVX01JUFNSNgo+ICAgICAgICAgICAgIGRl
ZmF1bHQgeSBpZiBQUEM2NCAmJiBBTFRJVkVDCj4gICAgICAgICAgICAgZGVmYXVsdCB5IGlmIFJJ
U0NWICYmIFJJU0NWX0lTQV9aQkMKPiAgICAgICAgICAgICBkZWZhdWx0IHkgaWYgUzM5MAo+ICAg
ICAgICAgICAgIGRlZmF1bHQgeSBpZiBTUEFSQzY0Cj4gICAgICAgICAgICAgZGVmYXVsdCB5IGlm
IFg4NgoKSSB3YXMgc3VnZ2VzdGluZyBzb21ldGhpbmcgcm91Z2hseSBsaWtlOgoKY2hvaWNlCiAg
ICBwcm9tcHQgIkNSQzMyIFZhcmlhbnQiCiAgICBkZXBlbmRzIG9uIENSQzMyICYmIENSQ19PUFRJ
TUlaQVRJT05TCgpjb25maWcgQ1JDMzJfQVJDSF9BUk1fTkVPTgogICAgYm9vbCAiQVJNIE5FT04i
CiAgICBkZWZhdWx0IHkKICAgIGRlcGVuZHMgQVJNICYmIEtFUk5FTF9NT0RFX05FT04KCi4uLgoK
Y29uZmlnIENSQzMyX0dFTkVSSUMKICAgIGJvb2wgIkdlbmVyaWMiCgplbmRjaG9pY2UKCj4gVGhp
cyBwYXRjaHNldCBzdHJpa2VzIGEgYmFsYW5jZSB3aGVyZSB0aGUgdmFzdCBtYWpvcml0eSBvZiB0
aGUgYXJjaC1zcGVjaWZpYyBDUkMKPiBjb2RlIGlzIGlzb2xhdGVkIGluIGxpYi9jcmMvJChTUkNB
UkNIKSwgYW5kIHRoZSBleGNlcHRpb25zIGFyZSBqdXN0Cj4gbGliL2NyYy9NYWtlZmlsZSBhbmQg
bGliL2NyYy9LY29uZmlnLiAgSSB0aGluayB0aGVzZSBleGNlcHRpb25zIG1ha2Ugc2Vuc2UsCj4g
Z2l2ZW4gdGhhdCB3ZSdyZSBidWlsZGluZyBhIHNpbmdsZSBtb2R1bGUgcGVyIENSQyB2YXJpYW50
LiAgV2UnZCBoYXZlIHRvIGdvCj4gdGhyb3VnaCBzb21lIGhvb3BzIHRvIGlzb2xhdGUgdGhlIGFy
Y2gtc3BlY2lmaWMgS2NvbmZpZyBhbmQgTWFrZWZpbGUgc25pcHBldHMKPiBpbnRvIHBlci1hcmNo
IGZpbGVzLCB3aGljaCBkb24ndCBzZWVtIHdvcnRoIGl0IGhlcmUgSU1PLgoKSSB3YXMgb25seSBy
ZWFsbHkgY29uY2VybmVkIHdpdGggdGhlIEtjb25maWcgc3RydWN0dXJlLCBJIHdhcwpleHBlY3Rp
bmcgS2J1aWxkIHRvIGxvb2sgcm91Z2hseSBsaWtlIHRoaXM6IChmaWxlbmFtZXMgYXJlIHdyb25n
KQoKY3JjMzIteSArPSBjcmMzMi1iYXNlLm8KY3JjMzItJChDUkMzMl9BUkNIX0FSTV9ORU9OKSAr
PSBhcmNoL2FybS9jcmMzMi1uZW9uLm8KLi4uCmNyYzMyLSQoQ1JDMzJfR0VORVJJQykgKz0gY3Jj
MzItZ2VuZXJpYy5vCgpidXQgeWVhaCwgeW91ciBwcm9wb3NhbCBoZXJlIGhhcyBncm93biBvbiBt
ZSBub3cgdGhhdCBJIHRoaW5rIGFib3V0IGl0CmFuZCB0aGUgb25seSByZWFsICJiZW5lZml0IiBt
aW5lIGhhcyBpcyB0aGF0IGFyY2hpdGVjdHVyZXMgY2FuIGRpc3BsYXkKY2hvaWNlcyBmb3IgdmFy
aWFudHMgdGhhdCBoYXZlIEtjb25maWctdmlzaWJsZSByZXF1aXJlbWVudHMsIHdoaWNoCnByb2Jh
Ymx5IGlzbid0IHRoYXQgbWFueSBzbyBpdCB3b3VsZG4ndCBiZSB1c2VmdWwgaW4gcHJhY3RpY2Uu
CgpUaGFua3MgZm9yIGFuc3dlcmluZyBteSBxdWVzdGlvbiwKCi0tIApKdWxpYW4gQ2FsYWJ5CgpF
bWFpbDoganVsaWFuLmNhbGFieUBnbWFpbC5jb20KUHJvZmlsZTogaHR0cDovL3d3dy5nb29nbGUu
Y29tL3Byb2ZpbGVzL2p1bGlhbi5jYWxhYnkvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
