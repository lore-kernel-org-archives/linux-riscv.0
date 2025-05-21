Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCE8C54E71
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FwHOiDLZIoiLpkb/O9DolWrNeeiYu5HYeVDOM1zcbw=; b=4G+DuZx/WddbWB
	rsUMXi+Ju3T4tbAm0i3f/XQ9ek+H0B2EM+MTDxWrbBtGJICF/OgzvPH9D0TmiDH2/OV+LFghD4wNJ
	6/sO1mzqrBCqlHLRQ3vloXLghGlSRWFmptQR9rImAhWopXJ6o/lcMrKmfolrDrv90kFNgo8obsSkc
	yHZzWKDjKRETyhfcC7DRef2fRPAGUUIfhz/wqOXrODSy0EeRTT7al7YX80jor2hXQXWvIfu8XTEQY
	+xKkzvRvOvseF9bIiBNU4Vpwlo6PCOEvT6eQnI4uMDKIBtxg0ayF3nwIA+hcyAfueySCllpAoLd8P
	aJXriPMJANyKNa5oXpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlUX-0000000GInh-2ASu;
	Wed, 21 May 2025 15:36:25 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlUU-0000000GInA-3VR3
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 15:36:24 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3dc8897f64cso94065ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 May 2025 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747841782; x=1748446582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az3/bLvwhgAccccliRUeu6lJ2uvLaYoVC/qOEZV47ms=;
        b=ZsV5vnRwjB8iB7/w14Jc06GeNZqjNg0oWBgYLiSwVOgz4P3XeAj2NyB+yEu/nGV+Bx
         UKf1UxcLwE52fGrR7DzcKQSBWaU/v6mAr0dcru5euVLVTkS8GHlEgox4ILGG2eLeifbj
         /d1+PWuyQyjiN87YP6QCmbBYUuSYq8I9vzkXznUwH80mYAMf23zCGr26wea98KbuD5s7
         /Q6kdDDtxwscMd9Lc/YiAHe12ZEx96wjNrE6v4O/2krsL57LJBCt1QTFJVH3KuFrIT5J
         W+5l81yRFc0DAfa4PHtBCrqw7JCj29aMpUDqqH9mrrpp+c9I59nf0xgqdSv5yEUNFXDf
         AB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747841782; x=1748446582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az3/bLvwhgAccccliRUeu6lJ2uvLaYoVC/qOEZV47ms=;
        b=Bn/32h9GwvYZ81ksZHmjjJR5k8xX2Ilnynxvp92X0pidbo6NrjkACH0HJ8i3QdX0h+
         RGgt/q6Bgi7ZSBC42xWep2XhKqmKrOJAglV8W2zpXpdpj7E4dmPIOJ7ru67X0VrP8yaA
         vVXbw2W+r15/7Re/s771jMxXdCItRvmTxtPKHYvRrLBzv0Y3RHzaP9+iYxr5r4nhgWZ6
         9PwGkHaMSc9rIYylKPCrZMagzXYC6QinOr3+5HXiiPS7pDcJUm31daHLDykGq+D3vCHd
         BRvh5bGJh7j2Utp3QjddvaFF8kmqWxA/KCXxZ0WBDcEqCwkkPVNFKGK2D5avJVhfjngC
         CcPg==
X-Forwarded-Encrypted: i=1; AJvYcCUaR1nG1WWQrcju/UbRrxUg4ni5eyEDKM4GkAUh4Zo+B2Yb01UQ7wA66n9MyB5IcJbIcATLtYk6FI1yAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOpMFm1R+BHgHMnxwIjeC9kXMvdTZDae0Rwz3kIGu3o8i0oIuu
	D5jzyYitmHv/qD5jPtsmY5xzo/A8ZLtV1Lqxfa/QHMud/L1I6Kxi4ZhANj9XaZcbQrhLqjzVZ2V
	3rrh2gXJo2fHsV2QpCtBr6Ly88p5BLzsdFp8PSntS
X-Gm-Gg: ASbGnctaDXSm/1ZTaqurCj5l2i+0r7gnoKkeZOlwCc5yRWrrvmOVuPoInZo2wVpFvUW
	+MlhVKEvZNC0ObyMiuWCgWcANyMshfquBBXeaQoz4N9EfGbM33iyPzQgLe8i/85cDaA/xdCFqKf
	ICALKcRb9rC9Wp+Q24LKWrpq9Y7SBBHodoNKE8h6ZIJ8kCN3nhHsDW1XkyVo9FcJuTksdmrQhNQ
	a3iGUbj5t0=
X-Google-Smtp-Source: AGHT+IExe/qiDd82F0VPU9OyslSsa74vsznODI2XirW1CU3HzJLOhKrOAhY6hnuLK9U9rc6IjPD+SqI8/2nJKLwhXpk=
X-Received: by 2002:a05:6e02:1c29:b0:3dc:8116:44a8 with SMTP id
 e9e14a558f8ab-3dc81164585mr4888995ab.26.1747841781531; Wed, 21 May 2025
 08:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250116230955.867152-1-rkanwal@rivosinc.com> <20250116230955.867152-2-rkanwal@rivosinc.com>
 <CAP-5=fU9ovvb-JopPqQfNaj6xtL=u_WZO-b56RdhBmUw4mY0ZA@mail.gmail.com>
 <CAECbVCvX8St8sXh9pTnyO_94-cJT_DB4MyggtS_-PXqWNtXDXw@mail.gmail.com> <CAECbVCui6ZgHBXBr3LdVGd16ERe0GgAnA1zy_zOQZVTU3bPoWw@mail.gmail.com>
In-Reply-To: <CAECbVCui6ZgHBXBr3LdVGd16ERe0GgAnA1zy_zOQZVTU3bPoWw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 May 2025 08:36:09 -0700
X-Gm-Features: AX0GCFutvbsbaRRv95Ix63BFV2gQsIqNkZTt3-Zp5Jf6rbiC2pQQste-OqEaHZw
Message-ID: <CAP-5=fUy0QfmazuNq1yJzAxsuM7wD3zD=KAVMGHuw0wXvez1ww@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] perf: Increase the maximum number of samples to 256.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: ak@linux.intel.com, "Liang, Kan" <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ajones@ventanamicro.com, 
	anup@brainfault.org, acme@kernel.org, atishp@rivosinc.com, 
	beeman@rivosinc.com, brauner@kernel.org, conor@kernel.org, heiko@sntech.de, 
	mingo@redhat.com, james.clark@arm.com, renyu.zj@linux.alibaba.com, 
	jolsa@kernel.org, jisheng.teoh@starfivetech.com, palmer@dabbelt.com, 
	will@kernel.org, kaiwenxue1@gmail.com, vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_083622_884948_EB6F8D0F 
X-CRM114-Status: GOOD (  48.02  )
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

T24gV2VkLCBNYXkgMjEsIDIwMjUgYXQgMzo0N+KAr0FNIFJham5lc2ggS2Fud2FsIDxya2Fud2Fs
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEFwciAxNywgMjAyNSBhdCAxOjUx4oCv
UE0gUmFqbmVzaCBLYW53YWwgPHJrYW53YWxAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiAr
IEFkZGluZyBBbmRpIEtsZWVuLgo+ID4KPiA+IE9uIFRodSwgRmViIDIwLCAyMDI1IGF0IDY6NTHi
gK9QTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBP
biBUaHUsIEphbiAxNiwgMjAyNSBhdCAzOjEw4oCvUE0gUmFqbmVzaCBLYW53YWwgPHJrYW53YWxA
cml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFJJU0NWIENUUiBleHRlbnNpb24g
c3VwcG9ydCBhIG1heGltdW0gZGVwdGggb2YgMjU2IGxhc3QgYnJhbmNoIHJlY29yZHMuCj4gPiA+
ID4gVGhlIDEyNyBlbnRyaWVzIGxpbWl0IHJlc3VsdHMgaW4gY29ycnVwdGluZyBDVFIgZW50cmll
cyBmb3IgUklTQy1WIGlmCj4gPiA+ID4gY29uZmlndXJlZCB0byBiZSAyNTYgZW50cmllcy4gVGhp
cyB3aWxsIG5vdCBpbXBhY3QgYW55IG90aGVyIGFyY2hpdGVjdHVyZXMKPiA+ID4gPiBhcyBpdCBp
cyBqdXN0IGluY3JlYXNpbmcgbWF4aW11bSBsaW1pdCBvZiBwb3NzaWJsZSBlbnRyaWVzLgo+ID4g
Pgo+ID4gPiBJIHdvbmRlciBpZiByYXRoZXIgdGhhbiBhIGNvbnN0YW50IHRoaXMgY29kZSBzaG91
bGQganVzdCB1c2UgdGhlIGF1dG8KPiA+ID4gcmVzaXppbmcgaGFzaG1hcCBjb2RlPwo+ID4gPiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS90b29scy9wZXJmL3V0aWwvaGFzaG1hcC5oCj4gPiA+Cj4gPiA+IEkgYXNz
dW1lIHRoZSB2YWx1ZSBvZiAxMjcgY29tZXMgZnJvbSBwZXJmX2V2ZW50LmgncyBQRVJGX01BWF9T
VEFDS19ERVBUSDoKPiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvaW5jbHVkZS91YXBpL2xpbnV4L3BlcmZf
ZXZlbnQuaCNuMTI1Mgo+ID4gPgo+ID4gPiBQZXJoYXBzIHRoZXNlIGNvbnN0YW50cyBzaG91bGRu
J3QgZXhpc3QuIFRoZSBwZXJmLXJlY29yZCBtYW4gcGFnZSBtZW50aW9uczoKPiA+ID4gc3lzY3Rs
Lmtlcm5lbC5wZXJmX2V2ZW50X21heF9zdGFjawo+ID4gPiB3aGljaCBJIGJlbGlldmUgZ2V0cyBh
IHZhbHVlIGZyb20KPiA+ID4gL3Byb2Mvc3lzL2tlcm5lbC9wZXJmX2V2ZW50X21heF9zdGFjaywg
c28gbWF5YmUgdGhlc2Ugc2hvdWxkIGJlCj4gPiA+IHJ1bnRpbWUgZGV0ZXJtaW5lZCBjb25zdGFu
dHMgcmF0aGVyIHRoYW4gY29tcGlsZSB0aW1lLgo+Cj4gV2hpbGUgd29ya2luZyBvbiB0aGlzLCBJ
IGNhbWUgYWNyb3NzIHRoZSBmb2xsb3dpbmcgdHdvIHBhdGNoZXMuIEl0Cj4gbG9va3MgbGlrZSB3
aGF0Cj4geW91IGhhdmUgc3VnZ2VzdGVkLCBpdCB3YXMgdHJpZWQgYmVmb3JlIGJ1dCBsYXRlciBv
biBBcm5hbGRvIHJldmVydGVkIHRoZSBjaGFuZ2UKPiBmcm9tIHJlcG9ydCBhbmQgc2NyaXB0IGNt
ZHMgZHVlIHRvIHJlYXNvbnMgbWVudGlvbmVkIGluIHRoZSBzZWNvbmQgcGF0Y2guCj4KPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzE0NjE3Njc0NzItODgyNy0zMS1naXQtc2VuZC1lbWFp
bC1hY21lQGtlcm5lbC5vcmcvCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNDYzNjk2
NDkzLTI3NTI4LTgtZ2l0LXNlbmQtZW1haWwtYWNtZUBrZXJuZWwub3JnLwoKVGhhbmtzIFJham5h
c2gsIGFncmVlZCBvbiB3aGF0IHlvdSBmb3VuZC4gSSB3b25kZXIgdG8gcmVzb2x2ZSB0aGUKaXNz
dWUgd2UgY291bGQgYWRkIGEgaGVhZGVyIGZlYXR1cmU6Cmh0dHBzOi8vd2ViLmdpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJl
ZS90b29scy9wZXJmL3V0aWwvaGVhZGVyLmg/aD1wZXJmLXRvb2xzLW5leHQjbjIxCmZvciBtYXgg
c3RhY2sgZGVwdGguCgpUaGFua3MsCklhbgoKPiBSZWdhcmRzCj4gUmFqbmVzaAo+Cj4KPiA+ID4K
PiA+Cj4gPiBUaGFua3MgSWFuIGZvciB5b3VyIGZlZWRiYWNrLiBJIGFtIG5vdCBzdXJlIGlmIGl0
J3MgZmVhc2libGUgdG8gdXNlIGF1dG8KPiA+IHJlc2l6aW5nIGhhc2htYXAgaGVyZS4gT24gZWFj
aCBzYW1wbGUgb2YgMjU2IGVudHJpZXMgd2Ugd2lsbCBiZSBkb2luZwo+ID4gNiBjYWxsb2NzIGFu
ZCB0cmFuc2ZlcnJpbmcgYSB3aG9sZSBsb3Qgb2YgZW50cmllcyBpbiBoYXNobWFwX2dyb3cuIFdl
Cj4gPiBjYW4ndCByZXVzZSBvbGQgaGFzaG1hcCBhcyB3ZWxsLiBPbiBlYWNoIHNhbXBsZSB3ZSBi
ZWFyIHRoZSBzYW1lIGNvc3QKPiA+Cj4gPiBCdXQgSSBkbyBhZ3JlZSB0aGlzIHNob3VsZCBiZSBt
b3JlIGR5bmFtaWMgYnV0IHRoZSBtYXhpbXVtIG51bWJlcgo+ID4gb2YgZW50cmllcyByZW1vdmVf
bG9vcHMgY2FuIHByb2Nlc3MgaXMgbGltaXRlZCBieSB0aGUgdHlwZSBvZiBjaGFzaCBhcnJheQo+
ID4gaGVyZS4gSSBjYW4gY2hhbmdlIGl0IGFuZCByZWxhdGVkIGxvZ2ljIHRvIHVzZSB1aW50MTZf
dCBvciBoaWdoZXIgYnV0IHdlCj4gPiB3aWxsIHN0aWxsIGhhdmUgYSBjYXAgb24gdGhlIG51bWJl
ciBvZiBlbnRyaWVzLgo+ID4KPiA+IFBFUkZfTUFYX0JSQU5DSF9ERVBUSCBzZWVtcyB0byBiZSBk
ZW5vdGluZyB3aGF0IHJlbW92ZV9sb29wcwo+ID4gY2FuIHByb2Nlc3MuIFRoaXMgaXMgYmVpbmcg
dXNlZCBieSB0aHJlYWRfX3Jlc29sdmVfY2FsbGNoYWluX3NhbXBsZSB0bwo+ID4gY2hlY2sgaWYg
dGhlIHNhbXBsZSBpcyBwcm9jZXNzYWJsZSBiZWZvcmUgY2FsbGluZyByZW1vdmVfbG9vcHMuIEkg
dGhpbmsKPiA+IHRoaXMgY2FuJ3QgYmUgY2hhbmdlZCB0byB1c2UgcGVyZl9ldmVudF9tYXhfc3Rh
Y2suIEJ1dCBJIGNhbiByZW5hbWUKPiA+IHRoaXMgbWFjcm8gdG8gYXZvaWQgY29uZnVzaW9uLgo+
ID4KPiA+IEkgZGlkbid0IG5vdGljZSBQRVJGX01BWF9TVEFDS19ERVBUSC4gVGhpcyBzZWVtcyB0
byBiZSBkZWZpbmVkIGluCj4gPiBtdWx0aXBsZSBwbGFjZXMgYW5kIHRvdWNoZXMgYnBmIGFzIHdl
bGwuIEkgYWdyZWUgdGhhdCB3ZSBzaG91bGQgYXZvaWQKPiA+IHVzaW5nIHRoaXMgbWFjcm8gYW5k
IHVzZSBydW50aW1lIGRldGVybWluZWQgdmFsdWUgaW5zdGVhZC4gVGJoIEkgZG9uJ3QKPiA+IGhh
dmUgc3VwZXIgaW4tZGVwdGggcGVyZiB1bmRlcnN0YW5kaW5nLiBJIHdpbGwgZ2l2ZSB0aGlzIGEg
dHJ5IGFuZCBzZW5kIGEKPiA+IHBhdGNoIGluIHRoZSBuZXh0IHVwZGF0ZS4gSXQgd291bGQgYmUg
aGVscGZ1bCBpZiB5b3UgY2FuIHJldmlldyBpdC4KPiA+Cj4gPiBUaGFua3MKPiA+IC1SYWpuZXNo
Cj4gPgo+ID4gPiBUaGFua3MsCj4gPiA+IElhbgo+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IFJham5lc2ggS2Fud2FsIDxya2Fud2FsQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4g
PiAgdG9vbHMvcGVyZi91dGlsL21hY2hpbmUuYyB8IDIxICsrKysrKysrKysrKysrLS0tLS0tLQo+
ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
PiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvbWFjaGluZS5jIGIv
dG9vbHMvcGVyZi91dGlsL21hY2hpbmUuYwo+ID4gPiA+IGluZGV4IDI3ZDUzNDVkMmIzMC4uZjJl
YjNjMjAyNzRlIDEwMDY0NAo+ID4gPiA+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9tYWNoaW5lLmMK
PiA+ID4gPiArKysgYi90b29scy9wZXJmL3V0aWwvbWFjaGluZS5jCj4gPiA+ID4gQEAgLTIxNzQs
MjUgKzIxNzQsMzIgQEAgc3RhdGljIHZvaWQgc2F2ZV9pdGVyYXRpb25zKHN0cnVjdCBpdGVyYXRp
b25zICppdGVyLAo+ID4gPiA+ICAgICAgICAgICAgICAgICBpdGVyLT5jeWNsZXMgKz0gYmVbaV0u
ZmxhZ3MuY3ljbGVzOwo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4gPiAtI2RlZmluZSBDSEFTSFNa
IDEyNwo+ID4gPiA+IC0jZGVmaW5lIENIQVNIQklUUyA3Cj4gPiA+ID4gLSNkZWZpbmUgTk9fRU5U
UlkgMHhmZgo+ID4gPiA+ICsjZGVmaW5lIENIQVNIQklUUyA4Cj4gPiA+ID4gKyNkZWZpbmUgTk9f
RU5UUlkgMHhmZlUKPiA+ID4gPgo+ID4gPiA+IC0jZGVmaW5lIFBFUkZfTUFYX0JSQU5DSF9ERVBU
SCAxMjcKPiA+ID4gPiArI2RlZmluZSBQRVJGX01BWF9CUkFOQ0hfREVQVEggMjU2Cj4gPiA+ID4K
PiA+ID4gPiAgLyogUmVtb3ZlIGxvb3BzLiAqLwo+ID4gPiA+ICsvKiBOb3RlOiBMYXN0IGVudHJ5
IChpPT1mZikgd2lsbCBuZXZlciBiZSBjaGVja2VkIGFnYWluc3QgTk9fRU5UUlkKPiA+ID4gPiAr
ICogc28gaXQncyBzYWZlIHRvIGhhdmUgYW4gdW5zaWduZWQgY2hhciBhcnJheSB0byBwcm9jZXNz
IDI1NiBlbnRyaWVzCj4gPiA+ID4gKyAqIHdpdGhvdXQgY2F1c2luZyBjbGFzaCBiZXR3ZWVuIGxh
c3QgZW50cnkgYW5kIE5PX0VOVFJZIHZhbHVlLgo+ID4gPiA+ICsgKi8KPiA+ID4gPiAgc3RhdGlj
IGludCByZW1vdmVfbG9vcHMoc3RydWN0IGJyYW5jaF9lbnRyeSAqbCwgaW50IG5yLAo+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBpdGVyYXRpb25zICppdGVyKQo+ID4gPiA+
ICB7Cj4gPiA+ID4gICAgICAgICBpbnQgaSwgaiwgb2ZmOwo+ID4gPiA+IC0gICAgICAgdW5zaWdu
ZWQgY2hhciBjaGFzaFtDSEFTSFNaXTsKPiA+ID4gPiArICAgICAgIHVuc2lnbmVkIGNoYXIgY2hh
c2hbUEVSRl9NQVhfQlJBTkNIX0RFUFRIXTsKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgbWVtc2V0
KGNoYXNoLCBOT19FTlRSWSwgc2l6ZW9mKGNoYXNoKSk7Cj4gPiA+ID4KPiA+ID4gPiAtICAgICAg
IEJVR19PTihQRVJGX01BWF9CUkFOQ0hfREVQVEggPiAyNTUpOwo+ID4gPiA+ICsgICAgICAgQlVH
X09OKFBFUkZfTUFYX0JSQU5DSF9ERVBUSCA+IDI1Nik7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAg
IGZvciAoaSA9IDA7IGkgPCBucjsgaSsrKSB7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIGludCBo
ID0gaGFzaF82NChsW2ldLmZyb20sIENIQVNIQklUUykgJSBDSEFTSFNaOwo+ID4gPiA+ICsgICAg
ICAgICAgICAgICAvKiBSZW1haW5kZXIgZGl2aXNpb24gYnkgUEVSRl9NQVhfQlJBTkNIX0RFUFRI
IGlzIG5vdAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgKiBuZWVkZWQgYXMgaGFzaF82NCB3aWxs
IGFueXdheSBsaW1pdCB0aGUgaGFzaAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgKiB0byBDSEFT
SEJJVFMKPiA+ID4gPiArICAgICAgICAgICAgICAgICovCj4gPiA+ID4gKyAgICAgICAgICAgICAg
IGludCBoID0gaGFzaF82NChsW2ldLmZyb20sIENIQVNIQklUUyk7Cj4gPiA+ID4KPiA+ID4gPiAg
ICAgICAgICAgICAgICAgLyogbm8gY29sbGlzaW9uIGhhbmRsaW5nIGZvciBub3cgKi8KPiA+ID4g
PiAgICAgICAgICAgICAgICAgaWYgKGNoYXNoW2hdID09IE5PX0VOVFJZKSB7Cj4gPiA+ID4gLS0K
PiA+ID4gPiAyLjM0LjEKPiA+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
