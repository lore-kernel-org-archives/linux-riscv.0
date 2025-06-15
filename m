Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA71DC61CE8
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKQLSamyIaPkuDSi1uOJMzN7aer+bBsASp55JiK6ipM=; b=1i7HzPjLast+Xv
	cTMUSFOb5s662lYNQtRIQGAHSUz7WQn2ZMiaD0DvyMJaRFiUZasMQYbkbOvjYjdJ5313ADlYCMTV5
	ModcXGF6i1Rw9l0FqICUroLSmWAY+Se9Mm5hdDvWbj2FONDTjgXRs1kyXDGTwr6woqYRIUV2X6om2
	2Z27AN3o3MnrzUi/oONZPI+sRBlexhltIod+JJ2A7I0u7YVd7qCurnSzGkpZgdB1iheEOwYwKH3NU
	2w3h5mkX1x+IEae5W2RV4P2sUbUg6NT+8ucE5Cf1wwGSsGwVzbo3vM1p5oFab63ctIWtDuVil8AF/
	wl8MYiBpa0m73ir1mQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpXD-00000002cw3-3XXz;
	Sun, 15 Jun 2025 15:44:39 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpXB-00000002csx-1UtP;
	Sun, 15 Jun 2025 15:44:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a5257748e1so2576910f8f.2;
        Sun, 15 Jun 2025 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750002275; x=1750607075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q24V+OwPQTKaIgjR+NjdUiOeSoG4NNmYTDA2NhEIjAI=;
        b=G7Mg5Jocv5+oUJz4qmZ1HiTVDHD77hCp7RBNW7ZXi0iapfRK3CBRj4x//OpRXtnK+t
         BHwfKNv3xuG2kWOh9QqgGzoGjdqr+5Of7MLkI3SQjmebR8bReNndazfZphWpV7PMFKKt
         GW4FVJ455j2gYVHg0qU7PO2H+cJzgrWOKQU0pMlTUiNm8G3Pe6bcOYkffvKvwv48O173
         ScPRlq+DbxYsgNNJWGJn2tQ0UxH1pw4Px84lqx2NG5HGwAQXHE6gJ1PJyavYwgZSBDgb
         00Guqr/qqsR6zXwh8qYm3pA85C5/sl0Q2KUsVaFRuoY/gm6BxDZs0f8DTutEmP+OkrLZ
         SdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750002275; x=1750607075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q24V+OwPQTKaIgjR+NjdUiOeSoG4NNmYTDA2NhEIjAI=;
        b=wgJZup6Z3r7MfXxFXJGsqQnnwsIdhzrNJoyceFb1TcWc1kxKHVzwZ2+XT/Az/FoTmp
         j0umO4RNE901UxQOYCkJEMoM3cCwDkpIKADAyZpsm5yCW6IY9G5hVatIuEmoFvW72AT2
         109tzvtyMDvQcjx/NJze4LxjJ0Yu+9Qen5EGWxvMikDdx4Q7M5pFHWgb0LEsMd7M6M8F
         F7U2iAVQfYqDfF8q1qNI7Ih9pFeHJep/DyXzgLJX1eAGRdaujCzQlnlvM34w/ZcOzWDX
         puwb+n5GYDujzLLAm6rNAMd6nCULDAhOtU4xg6lwcgoWPLZvzadZP2m+PKHz53dWo1e3
         78nQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1dXBF0ZO5XM8gn7TrO5Cwm6W97mQOOvxDOPS3WIstGJw+uSmXQf4rbeSENV0Ga0TTcwEE3fvf5dv/xc5PkOTU@lists.infradead.org, AJvYcCVFzn2ATGX6O77I3c3N5g3ba0qw829kiuQAtKhE187tIBUihrNzA4C1KUOzb6uIlv/1+4GdYca1H/pNNLM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsY0y3NzSyFMD/aSglcKyEjqhSH3u4Bq2HgHuFxB4k/5o0vcoQ
	msROhsEu0UyAdnTiRhUgtjSSOrNWu8P5/cT2Pm5YCx14RcFXh7UkQDzs9jta5oXAYZkFZzvLrqF
	3VvtM/XBkSmzJQrgRf5RHTtR3wKPYsjU=
X-Gm-Gg: ASbGncvy8mJcHJQVZb243Rixs7IHV5+j3I4voTdlo0TA81rhhnbi9ixj/33c2JHC5dr
	vLwmEQCUnWdSdQWmAbZRZcjlyxAYnjxSRKtlyi3la6jHPecGO7aWHnX3NjDCJUi9z07kosUyfCx
	lFM6c1J2+SUWJqWTnW4nJN/fYaatk2wV37J+tSEohYARcBBTLIP4SDBw==
X-Google-Smtp-Source: AGHT+IEVMqrf36wFDwIu+Qav+T1hxhMtiOfYIpsqMlJITLohO7pPVX7dQmL5OFhL7NsYv2qBiULo8wqoJRikRf0wek4=
X-Received: by 2002:a05:6000:718:b0:3a5:3b63:58f0 with SMTP id
 ffacd0b85a97d-3a57237178dmr4884718f8f.18.1750002274959; Sun, 15 Jun 2025
 08:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
 <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
 <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com> <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
 <DALA5WYA04OG.1283TZDOVLBPS@bootlin.com> <CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com>
 <DAN5THWRO6KS.XXZ00IOTQZH9@bootlin.com>
In-Reply-To: <DAN5THWRO6KS.XXZ00IOTQZH9@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 15 Jun 2025 08:44:23 -0700
X-Gm-Features: AX0GCFum0GptEjJNe1zyPyz2oALA4PaNl_E8ueRtmTM4_c9kw_4GcQiqb2A1p90
Message-ID: <CAADnVQJPQNC5VaybR_GZry5YZhNcJmWSSouuTSsU1XKhDfXYwQ@mail.gmail.com>
Subject: Re: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when args
 location on stack is uncertain
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Menglong Dong <imagedong@tencent.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	ebpf@linuxfoundation.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, dwarves <dwarves@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_084437_398580_4B6C114B 
X-CRM114-Status: GOOD (  48.59  )
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

T24gU3VuLCBKdW4gMTUsIDIwMjUgYXQgNzowMOKAr0FNIEFsZXhpcyBMb3Rob3LDqQo8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gU2F0IEp1biAxNCwgMjAyNSBhdCAx
MjozNSBBTSBDRVNULCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4gPiBPbiBGcmksIEp1biAx
MywgMjAyNSBhdCAxOjU54oCvQU0gQWxleGlzIExvdGhvcsOpCj4gPiA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gRnJpIEp1biAxMywgMjAyNSBhdCAxMDoz
MiBBTSBDRVNULCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+PiA+IE9uIEZyaSwgSnVuIDEzLCAy
MDI1IGF0IDEwOjI2OjM3QU0gKzAyMDAsIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPgo+IFsuLi5d
Cj4KPiA+PiBJZiBJIG5lZWQgdG8gcmVzcGluLCBJJ2xsIHJld3JpdGUgdGhlIGNvbW1pdCBtZXNz
YWdlIHRvIGluY2x1ZGUgdGhlIGRldGFpbHMKPiA+PiBhYm92ZS4KPiA+Cj4gPiBObyBuZWVkIHRv
IHJlc3Bpbi4gVGhlIGNvdmVyIGxldHRlciBpcyBxdWl0ZSBkZXRhaWxlZCBhbHJlYWR5Lgo+ID4K
PiA+IEJ1dCBsb29raW5nIGF0IHRoZSBwYXRjaCBhbmQgdGhpcyB0aHJlYWQgSSB0aGluayB3ZSBu
ZWVkIHRvIGFncmVlCj4gPiBvbiB0aGUgbG9uZyB0ZXJtIGFwcHJvYWNoIHRvIEJURiwgc2luY2Ug
cGVvcGxlIGFzc3VtZSB0aGF0Cj4gPiBpdCdzIGEgbW9yZSBjb21wYWN0IGR3YXJmIGFuZCBhbnkg
bWlzc2luZyBpbmZvcm1hdGlvbgo+ID4gc2hvdWxkIGJlIGFkZGVkIHRvIGl0Lgo+ID4gTGlrZSBp
biB0aGlzIGNhc2Ugc3BlY2lhbCBhbGlnbm1lbnQgY2FzZSBhbmQgcGFja2VkIGF0dHJpYnV0ZXMK
PiA+IGFyZSBub3QgZXhwcmVzc2VkIGluIEJURiBhbmQgSSBiZWxpZXZlIHRoZXkgc2hvdWxkIG5v
dCBiZS4KPiA+IEJURiBpcyBub3QgYSBkZWJ1ZyBmb3JtYXQgYW5kIG5vdCBhIHN1YnN0aXR1dGUg
Zm9yIGR3YXJmLgo+ID4gVGhlcmUgaXMgbm8gZ29hbCB0byBleHByZXNzIGV2ZXJ5dGhpbmcgcG9z
c2libGUgaW4gQy4KPiA+IEl0J3MgbWluaW1hbCwgYmVjYXVzZSBCVEYgaXMgX3ByYWN0aWNhbF8g
ZGVzY3JpcHRpb24gb2YKPiA+IHR5cGVzIGFuZCBkYXRhIHByZXNlbnQgaW4gdGhlIGtlcm5lbC4K
PiA+IEkgZG9uJ3QgdGhpbmsgdGhlIHNwZWNpYWwgY2FzZSBvZiBwYWNraW5nIGFuZCBhbGlnbm1l
bnQgZXhpc3RzCj4gPiBpbiB0aGUga2VybmVsIHRvZGF5LCBzbyB0aGUgY3VycmVudCBmb3JtYXQg
aXMgc3VmZmljaWVudC4KPiA+IEl0IGRvZXNuJ3QgbWlzcyBhbnl0aGluZy4KPiA+IEkgdGhpbmsg
d2UgbWFkZSBhcm02NCBKSVQgdW5uZWNlc3NhcnkgcmVzdHJpY3RpdmUgYW5kIG5vdyBjb25zaWRl
cmluZwo+ID4gdG8gbWFrZSBhbGwgb3RoZXIgSklUcyByZXN0cmljdGl2ZSB0b28gZm9yIGh5cG90
aGV0aWNhbCBjYXNlCj4gPiBvZiBzb21lIGZ1dHVyZSBrZXJuZWwgZnVuY3Rpb25zLgo+ID4gSSBm
ZWVsIHdlJ3JlIGdvaW5nIGluIHRoZSB3cm9uZyBkaXJlY3Rpb24uCj4gPiBJbnN0ZWFkIHdlIHNo
b3VsZCB0ZWFjaCBwYWhvbGUgdG8gc2FuaXRpemUgQlRGIHdoZXJlIGZ1bmN0aW9ucwo+ID4gYXJl
IHVzaW5nIHRoaXMgZmFuY3kgYWxpZ25tZW50IGFuZCBwYWNrZWQgc3RydWN0cy4KPiA+IHBhaG9s
ZSBjYW4gc2VlIGl0IGluIGR3YXJmIGFuZCBjYW4gc2tpcCBlbWl0dGluZyBCVEYgZm9yIHN1Y2gK
PiA+IGZ1bmN0aW9ucy4gVGhlbiB0aGUga2VybmVsIEpJVHMgb24gYWxsIGFyY2hpdGVjdHVyZXMg
d29uJ3QgZXZlbgo+ID4gc2VlIHN1Y2ggY2FzZXMuCj4gPgo+ID4gVGhlIGlzc3VlIHdhcyBpbml0
aWFsbHkgZGlzY292ZXJlZCBieSBhIHNlbGZ0ZXN0Ogo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYnBmLzIwMjUwNDExLW1hbnlfYXJnc19hcm02NC12MS0zLTBhMzJmZTcyMzM5ZUBib290bGlu
LmNvbS8KPiA+IHRoYXQgYXR0ZW1wdGVkIHRvIHN1cHBvcnQgdGhlc2UgdHdvIHR5cGVzOgo+ID4g
K3N0cnVjdCBicGZfdGVzdG1vZF9zdHJ1Y3RfYXJnXzQgewo+ID4gKyBfX3U2NCBhOwo+ID4gKyBf
X3U2NCBiOwo+ID4gK307Cj4gPiArCj4gPiArc3RydWN0IGJwZl90ZXN0bW9kX3N0cnVjdF9hcmdf
NSB7Cj4gPiArIF9faW50MTI4IGE7Cj4gPiArfTsKPiA+Cj4gPiBUaGUgZm9ybWVyIGlzIHByZXNl
bnQgaW4gdGhlIGtlcm5lbC4gSXQncyBtb3JlIG9yIGxlc3Mgc29ja3B0cl90LAo+ID4gYW5kIHBl
b3BsZSB3YW50IHRvIGFjY2VzcyBpdCBmb3Igb2JzZXJ2YWJpbGl0eSBpbiB0cmFjaW5nLgo+ID4g
VGhlIGxhdHRlciBkb2Vzbid0IGV4aXN0IGluIHRoZSBrZXJuZWwgYW5kIHdlIGNhbm5vdCByZXBy
ZXNlbnQKPiA+IGl0IHByb3Blcmx5IGluIEJURiB3aXRob3V0IGxvc2luZyBhbGlnbm1lbnQuCj4g
Pgo+ID4gU28gSSB0aGluayB3ZSBzaG91bGQgZ28gYmFjayB0byB0aGF0IHNlcmllczoKPiA+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi8yMDI1MDQxMS1tYW55X2FyZ3NfYXJtNjQtdjEtMC0w
YTMyZmU3MjMzOWVAYm9vdGxpbi5jb20vCj4gPgo+ID4gcmVtb3ZlIF9faW50MTI4IHNlbGZ0ZXN0
LCBidXQgYWxzbyB0ZWFjaCBwYWhvbGUKPiA+IHRvIHJlY29nbml6ZSB0eXBlcyB0aGF0IGNhbm5v
dCBiZSByZXByZXNlbnRlZCBpbiBCVEYgYW5kCj4gPiBkb24ndCBlbWl0IHRoZW0gZWl0aGVyIGlu
dG8gdm1saW51eCBvciBpbiBrZXJuZWwgbW9kdWxlCj4gPiAobGlrZSBpbiB0aGlzIGNhc2UgaXQg
d2FzIGJwZl90ZXN0bW9kLmtvKQo+ID4gSSB0aGluayB0aGF0IHdvdWxkIGJlIGEgYmV0dGVyIHBh
dGggZm9yd2FyZCBhbGlnbmVkCj4gPiB3aXRoIHRoZSBsb25nIHRlcm0gZ29hbCBvZiBCVEYuCj4g
Pgo+ID4gQW5kIGJlZm9yZSBwZW9wbGUgYXNrLi4uIHBhaG9sZSBpcyBhIHRydXN0ZWQgY29tcG9u
ZW50IG9mIHRoZSBidWlsZAo+ID4gc3lzdGVtLiBXZSB0cnVzdCBpdCBqdXN0IGFzIHdlIHRydXN0
IGdjYywgY2xhbmcsIGxpbmtlciwgb2JqdG9vbC4KPgo+IFNvIGlmIEkgdW5kZXJzdGFuZCBjb3Jy
ZWN0bHkgeW91ciBwb2ludCwgaXQgd291bGQgYmUgYmV0dGVyIHRvIGp1c3QgbW92ZSBvdXQKPiB0
aG9zZSBjb25zdHJhaW50cyBmcm9tIHRoZSBKSVQgY29tcGlsZXJzLCBhbmQganVzdCBub3QgcmVw
cmVzZW50IHRob3NlIHNwZWNpYWwKPiBjYXNlcyBpbiBCVEYsIHNvIHRoYXQgaXQgYmVjb21lcyBp
bXBvc3NpYmxlIHRvIGhvb2sgcHJvZ3JhbXMgb24gdGhvc2UgZnVuY3Rpb25zLAo+IHNpbmNlIHRo
ZXkgYXJlIG5vdCBldmVudCBwcmVzZW50IGluIEJURiBpbmZvLgo+IEFuZCBzbzoKPiAtIGNhbmNl
bCB0aGlzIHNlcmllcwo+IC0gcmV2ZXJ0IHRoZSBzbWFsbCBBUk02NCBjaGVjayBhYm91dCBzdHJ1
Y3QgcGFzc2VkIG9uIHN0YWNrCj4gLSB1cGRhdGUgcGFob2xlIHRvIG1ha2Ugc3VyZSB0aGF0IGl0
IGRvZXMgbm90IGVuY29kZSBpbmZvIGFib3V0IHRoaXMgc3BlY2lmaWMKPiAgIGtpbmQgb2YgZnVu
Y3Rpb25zLgoKeWVzCgo+IEkgc3RpbGwgZXhwZWN0IHNvbWUgY2hhbGxlbmdlcyB3aXRoIHRoaXMu
IEFGQUlVIHBhaG9sZSB1c2VzIERXQVJGIHRvIGdlbmVyYXRlCj4gQlRGLCBhbmQgZGlzY3Vzc2lv
bnMgaW4gWzFdIGhpZ2hsaWdodGVkIHRoZSBmYWN0IHRoYXQgdGhlIGF0dHJpYnV0ZXMgYWx0ZXJp
bmcKPiB0aGUgc3RydWN0cyBhbGlnbm1lbnQgYXJlIG5vdCByZWxpYWJseSBlbmNvZGVkIGluIERX
QVJGLiBNYXliZSBwYWhvbGUgY2FuCj4gImd1ZXNzIiBpZiBhIHN0cnVjdCBoYXMgYmVlbiBhbHRl
cmVkLCBieSBkb2luZyBzb21ldGhpbmcgbGlrZQo+IGJ0Zl9pc19zdHJ1Y3RfcGFja2VkIGluIGxp
YmJwZiA/IEFzIEFuZHJpaSBtZW50aW9uZWQgaW4gWzJdLCBpdCBtYXkgbm90IGJlCj4gYWJsZSB0
byBjb3ZlciBhbGwgY2FzZXMsIGJ1dCB0aGF0IGNvdWxkICBiZSBhIHN0YXJ0LiBJZiB0aGF0J3Mg
aW5kZWVkIHRoZQo+IGRlc2lyZWQgZGlyZWN0aW9uLCBJIGNhbiB0YWtlIGEgZnVydGhlciBsb29r
IGF0IHRoaXMuCgpzbyBiZSBpdC4gSWYgc3l6Ym90IHdhcyB0YXVnaHQgdG8gZnV6eiBkd2FyZiBJ
J20gc3VyZSBpdCB3b3VsZApoYXZlIGV4cG9zZWQgaHVuZHJlZHMgb2YgYnVncyBpbiB0aGUgZm9y
bWF0IGl0c2VsZiBhbmQgY29tcGlsZXJzLApidXQgc2luY2Ugc3VjaCBjb252b2x1dGVkIGNvbnN0
cnVjdHMgYXJlIG5vdCBwcmVzZW50IGluIHRoZSBrZXJuZWwKc291cmNlIGNvZGUgaXQncyBub3Qg
YSBjb25jZXJuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
