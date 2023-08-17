Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA16C2FC04
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 03:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOi/2A9OPgqsif3820h+b8qqhjLzLnSp+sUdfhvlJss=; b=NwOjSY+DcDVy4t
	43BnoyN8Mu7GT8wRrVBn6I4c9cchi2OMBP7Y43D2toHSquBIztZ4yLlGbtXWq3Up/sjFdCRr1nhVc
	6qV3qC4RoLEPnKJms+2VGarsVW4NGpGtE8sscHv2gNove4yEKUx5Wt+L2tJf/f1F/v+1zwI5Vnowz
	QM2RtnKK8hBcqKfjkR8m0G5MWUq7am21VL6NB8dAzAWvwln5uh9m1sh6+gcR4Vc2OxsXwEyCJC+ur
	XWVXN/fMCMQv1YcV3tT7zk04z0fMw+jqlU9EAU31jIoUHRheN5SVB1AZKGZLNcUL/6RMbGA33G4A6
	98GAuvZW+2nTkDTpIlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWU96-005Uvt-0B;
	Thu, 17 Aug 2023 03:58:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWU93-005Uuy-0b
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 03:58:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe12baec61so66590145e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 20:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1692244678; x=1692849478;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6zcSzpJqJ0VluuSboFsoL227pWupWbEH5Uz9sUxXS8=;
        b=iRlWhDihY+i26ll38K6xAbDNtaTXOuLoVg+U++anaW8++WA1Nc8aLPFmLaFol3/DzO
         vCk8ILimnRqbPwG3L9C6UPATHJCcVyzJMW1olzMNT4uP8Ia0Xzzd7pzvpl9M9Jikbt4J
         wZREMgFBQACUU0HsJiKSqdVWByf3yAW+PtqlmCvigtgevZ6H9MT1+7qEnIAXigvkihBj
         uXfG2d6MHrrne26law8lGRUn3SgA6zcmL9i9DiNsbxR70HQIIy6WhHCmxx/zxayqen2d
         wYlKEok34Ge1IhiDocb3D6KB4+VWfUG7Di6IuDVZpfD7bxUgbmtrUR3rebpcrKyKKp4/
         UsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692244678; x=1692849478;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6zcSzpJqJ0VluuSboFsoL227pWupWbEH5Uz9sUxXS8=;
        b=TNjYzyIQ/v3V0VIhkV5lnrEgnsFTesyivQxCX2FacvWdN0X6FXeP54N3xB9gKjvXlk
         /6ux6OWYF7YWNCIjNJQqmNmHl2Hu/cRjkFgM8mvFOL/p+SThDcxWK52GYmvaY6eQ7IWU
         DbJoXuh1RhwM3dtIDoGQ7kEDUDDt14DEj7FtW2ksUa7eU77W07QHdPIEPHgEbIwivIFO
         O6DNQBIsIDyxacdWrRiYgwLLREIBvvAk4glRybhBY1RoJUnMjxX1HY00ja8NFav3/r47
         wPVp1OX+c3W944bTygYEpRANdzceDXo2GQpYwVO8yv8lzwX2MQu5rTY7XErBqf2KpK+V
         Ptag==
X-Gm-Message-State: AOJu0YzbnAqgQcm+26S5WeaRgqxRHAZ2qFCCvkD10qHt669zQNGAJC1s
	0EuLkl4HEbNNlG9yRVW/dRYmyw==
X-Google-Smtp-Source: AGHT+IHahX6f6Uu0Gp7FNlk7L/qD1ShCeUvOYFcUntgnBwGjVY2sM2aPjBhGSwRabd4YoScnF+JvXw==
X-Received: by 2002:a1c:e913:0:b0:3fa:98c3:7dbd with SMTP id q19-20020a1ce913000000b003fa98c37dbdmr2924986wmc.41.1692244677964;
        Wed, 16 Aug 2023 20:57:57 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id l6-20020adff486000000b003143867d2ebsm23309801wro.63.2023.08.16.20.57.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Aug 2023 20:57:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH 00/10] RISC-V: Refactor instructions
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <ZN1qXlLp6qfpBeGF@ghost>
Date: Thu, 17 Aug 2023 04:57:46 +0100
Cc: Andrew Jones <ajones@ventanamicro.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org,
 bpf@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>,
 Nam Cao <namcaov@gmail.com>
Message-Id: <12FAB5A9-5723-4A5B-8729-75D8A38921B9@jrtc27.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
 <20230804-2c57bddd6e87fdebc20ff9d5@orel> <ZM00UYDzEAz/JT3n@ghost>
 <ZN1qXlLp6qfpBeGF@ghost>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_205801_252258_6BDE5B7E 
X-CRM114-Status: GOOD (  28.88  )
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

T24gMTcgQXVnIDIwMjMsIGF0IDAxOjMxLCBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3Np
bmMuY29tPiB3cm90ZToKPiAKPiBPbiBGcmksIEF1ZyAwNCwgMjAyMyBhdCAxMDoyNDozM0FNIC0w
NzAwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+IE9uIEZyaSwgQXVnIDA0LCAyMDIzIGF0IDEy
OjI4OjI4UE0gKzAzMDAsIEFuZHJldyBKb25lcyB3cm90ZToKPj4+IE9uIFRodSwgQXVnIDAzLCAy
MDIzIGF0IDA3OjEwOjI1UE0gLTA3MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPj4+PiBUaGVy
ZSBhcmUgbnVtZXJvdXMgc3lzdGVtcyBpbiB0aGUga2VybmVsIHRoYXQgcmVseSBvbiBkaXJlY3Rs
eQo+Pj4+IG1vZGlmeWluZywgY3JlYXRpbmcsIGFuZCByZWFkaW5nIGluc3RydWN0aW9ucy4gTWFu
eSBvZiB0aGVzZSBzeXN0ZW1zCj4+Pj4gaGF2ZSByZXdyaXR0ZW4gY29kZSB0byBkbyB0aGlzLiBU
aGlzIHBhdGNoIHdpbGwgZGVsZWdhdGUgYWxsIGluc3RydWN0aW9uCj4+Pj4gaGFuZGxpbmcgaW50
byBpbnNuLmggYW5kIHJlZy5oLiBBbGwgb2YgdGhlIGNvbXByZXNzZWQgaW5zdHJ1Y3Rpb25zLCBS
VkksCj4+Pj4gWmljc3IsIE0sIEEgaW5zdHJ1Y3Rpb25zIGFyZSBpbmNsdWRlZCwgYXMgd2VsbCBh
cyBhIHN1YnNldCBvZiB0aGUgRixELFEKPj4+PiBleHRlbnNpb25zLgo+Pj4+IAo+Pj4+IC0tLQo+
Pj4+IFRoaXMgaXMgbW9kaWZ5aW5nIGNvZGUgdGhhdCBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzIwMjMwNzMxMTgzOTI1LjE1MjE0NS0xLW5hbWNhb3ZAZ21haWwuY29tLwo+Pj4+IGlzIGFs
c28gdG91Y2hpbmcuCj4+Pj4gCj4+Pj4gLS0tCj4+Pj4gVGVzdGluZzoKPj4+PiAKPj4+PiBUaGVy
ZSBhcmUgYSBsb3Qgb2Ygc3Vic3lzdGVtcyB0b3VjaGVkIGFuZCBJIGhhdmUgbm90IHRlc3RlZCBl
dmVyeQo+Pj4+IGluZGl2aWR1YWwgaW5zdHJ1Y3Rpb24uIEkgZGlkIGEgbG90IG9mIGNvcHktcGFz
dGluZyBmcm9tIHRoZSBSSVNDLVYgc3BlYwo+Pj4+IHNvIG9wY29kZXMgYW5kIHN1Y2ggc2hvdWxk
IGJlIGNvcnJlY3QKPj4+IAo+Pj4gSG93IGFib3V0IHdlIGNyZWF0ZSBtYWNyb3Mgd2hpY2ggZ2Vu
ZXJhdGUgZWFjaCBvZiB0aGUgZnVuY3Rpb25zIGFuCj4+PiBpbnN0cnVjdGlvbiBuZWVkcywgZS5n
LiByaXNjdl9pbnNuX2lzXyooKSwgZXRjLiBiYXNlZCBvbiB0aGUgb3V0cHV0IG9mCj4+PiBbMV0u
IEkga25vdyBiYXNpY2FsbHkgbm90aGluZyBhYm91dCB0aGF0IHByb2plY3QsIGJ1dCBpdCBsb29r
cyBsaWtlIGl0Cj4+PiBjcmVhdGVzIG1vc3QgdGhlIGRlZmluZXMgdGhpcyBzZXJpZXMgaXMgY3Jl
YXRpbmcgZnJvbSB3aGF0IHdlIFtob3BlXSB0bwo+Pj4gYmUgYW4gYXV0aG9yaXRhdGl2ZSBzb3Vy
Y2UuIEkgYWxzbyBhc3N1bWUgdGhhdCBpZiB3ZSBkb24ndCBsaWtlIHRoZQo+Pj4gY3VycmVudCBv
dXRwdXQgZm9ybWF0LCB0aGVuIHdlIGNvdWxkIHByb2JhYmx5IHBvc3QgcGF0Y2hlcyB0byB0aGUg
cHJvamVjdAo+Pj4gdG8gZ2V0IHRoZSBmb3JtYXQgd2Ugd2FudC4gRm9yIGV4YW1wbGUsIHdlIGNv
dWxkIG1heWJlIHByb3Bvc2UgYW4gImxjIgo+Pj4gZm9ybWF0IGZvciAiTGludXggQyIuCj4+IFRo
YXQncyBhIGdyZWF0IGlkZWEsIEkgZGlkbid0IHJlYWxpemUgdGhhdCBleGlzdGVkIQo+IEkgaGF2
ZSBkaXNjb3ZlcmVkIHRoYXQgdGhlIHJpc2N2LW9wY29kZXMgcmVwb3NpdG9yeSBpcyBub3QgaW4g
YSBzdGF0ZQo+IHRoYXQgbWFrZXMgaXQgaGVscGZ1bC4gSWYgaXQgd2VyZSB3b3JrYWJsZSwgaXQg
d291bGQgbWFrZSBpdCBlYXN5IHRvCj4gaW5jbHVkZSBhICJMaW51eCBDIiBmb3JtYXQuIEkgaGF2
ZSBoYWQgYSBwdWxsIHJlcXVlc3Qgb3BlbiBvbiB0aGUgcmVwbwo+IGZvciB0d28gd2Vla3Mgbm93
IGFuZCB0aGUgcGVyc29uIHdobyBtYWludGFpbnMgdGhlIHJlcG8gaGFzIG5vdAo+IGludGVyYWN0
ZWQuCgpIdWg/IEFuZHJldyBoYXMgcmVwbGllZCB0byB5b3UgdHdpY2Ugb24geW91ciBQUiwgYW5k
IHdhcyB0aGUgbGFzdCBvbmUgdG8KY29tbWVudC4gVGhhdOKAmXMgaGFyZGx5IOKAnGhhcyBub3Qg
aW50ZXJhY3RlZOKAnS4KCj4gQXQgbWluaW11bSwgaW4gb3JkZXIgZm9yIGl0IHRvIGJlIHVzZWZ1
bCBpdCB3b3VsZCBuZWVkIGFuIGFiaWxpdHkgdG8KPiBkZXNjcmliZSB0aGUgYml0IG9yZGVyIG9m
IGltbWVkaWF0ZXMgaW4gYW4gaW5zdHJ1Y3Rpb24gYW5kIGluY2x1ZGUgc2NyaXB0Cj4gYXJndW1l
bnRzIHRvIHNlbGVjdCB3aGljaCBpbnN0cnVjdGlvbnMgc2hvdWxkIGJlIGluY2x1ZGVkLiBUaGVy
ZSBpcyBhCj4gIkMiIGZvcm1hdCwgYnV0IGl0IGlzIGFjdHVhbGx5IGp1c3QgYSBTcGlrZSBmb3Jt
YXQuCgpTbyBleHRlbmQgaXQ/IE9yIGRvIHNvbWV0aGluZyB3aXRoIFFFTVXigJlzIGVxdWl2YWxl
bnQgdGhhdCBleHByZXNzZXMgaXQuCgpKZXNzCgo+IE5vbmV0aGVsZXNzLCBpdAo+IHNlZW1zIGxp
a2UgaXQgaXMgcHJvaGliaXRpdmUgdG8gdXNlIGl0Lgo+Pj4gCj4+PiBJJ2QgYWxzbyByZWNvbW1l
bmQgb25seSBpbXBvcnRpbmcgdGhlIGdlbmVyYXRlZCBkZWZpbmVzIGFuZCBnZW5lcmF0aW5nCj4+
PiB0aGUgZnVuY3Rpb25zIHRoYXQgd2lsbCBhY3R1YWxseSBoYXZlIGltbWVkaWF0ZSBjb25zdW1l
cnMgb3IgYXJlIHBhcnQgb2YKPj4+IGEgc2V0IG9mIGRlZmluZXMgdGhhdCBoYXZlIGltbWVkaWF0
ZSBjb25zdW1lcnMuIEVhY2ggY29uc3VtZXIgb2YgbmV3Cj4+PiBpbnN0cnVjdGlvbnMgd2lsbCBi
ZSByZXNwb25zaWJsZSBmb3IgZ2VuZXJhdGluZyBhbmQgaW1wb3J0aW5nIHRoZSBkZWZpbmVzCj4+
PiBhbmQgYWRkaW5nIHRoZSByZXNwZWN0aXZlIG1hY3JvIGludm9jYXRpb25zIHRvIGdlbmVyYXRl
IHRoZSBmdW5jdGlvbnMuCj4+PiBUaGlzIHNlcmllcyBjYW4gYWxzbyB0YWtlIHRoYXQgYXBwcm9h
Y2gsIGkuZS4gY29udmVydCBvbmUgc2V0IG9mCj4+PiBpbnN0cnVjdGlvbnMgYXQgYSB0aW1lLCBl
YWNoIGluIGEgc2VwYXJhdGUgcGF0Y2guCj4+IFNpbmNlIEkgd2FzIGhhbmQtd3JpdGluZyBldmVy
eXRoaW5nIGFuZCBjb3B5aW5nIGl0IHdhc24ndCB0b28gbXVjaAo+PiBlZmZvcnQgdG8ganVzdCBj
b3B5IGFsbCBvZiB0aGUgaW5zdHJ1Y3Rpb25zIGZyb20gYSBncm91cC4gSG93ZXZlciwgZnJvbQo+
PiBhIHRlc3Rpbmcgc3RhbmRwb2ludCBpdCBtYWtlcyBzZW5zZSB0byBleGNsdWRlIGluc3RydWN0
aW9ucyBub3QgeWV0IGluCj4+IHVzZS4KPj4+IAo+Pj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi9yaXNjdi1vcGNvZGVzCj4+PiAKPj4+IFRoYW5rcywKPj4+IGRyZXcKPj4+IAo+Pj4gCj4+
Pj4gLCBidXQgdGhlIGNvbnN0cnVjdGlvbiBvZiBldmVyeQo+Pj4+IGluc3RydWN0aW9uIGlzIG5v
dCBmdWxseSB0ZXN0ZWQuCj4+Pj4gCj4+Pj4gdmVjdG9yOiBDb21waWxlZCBhbmQgYm9vdGVkCj4+
Pj4gCj4+Pj4ganVtcF9sYWJlbDogRW5zdXJlZCBzdGF0aWMga2V5cyBmdW5jdGlvbiBhcyBleHBl
Y3RlZC4KPj4+PiAKPj4+PiBrZ2RiOiBBdHRlbXB0ZWQgdG8gcnVuIHRoZSBwcm92aWRlZCB0ZXN0
cyBidXQgdGhleSBmYWlsZWQgZXZlbiB3aXRob3V0Cj4+Pj4gbXkgY2hhbmdlcwo+Pj4+IAo+Pj4+
IG1vZHVsZTogTG9hZGVkIGFuZCB1bmxvYWRlZCBtb2R1bGVzCj4+Pj4gCj4+Pj4gcGF0Y2guYzog
RW5zdXJlZCBrZXJuZWwgYm9vdGVkCj4+Pj4gCj4+Pj4ga3Byb2JlczogVXNlZCBhIGtwcm9iaW5n
IG1vZHVsZSB0byBwcm9iZSBqYWxyLCBhdWlwYywgYW5kIGJyYW5jaAo+Pj4+IGluc3RydWN0aW9u
cwo+Pj4+IAo+Pj4+IG5vbW11IG1pc2FsaWduZWQgYWRkcmVzc2VzOiBLZXJuZWwgYm9vdHMKPj4+
PiAKPj4+PiBrdm06IFJhbiBLVk0gc2VsZnRlc3RzCj4+Pj4gCj4+Pj4gYnBmOiBLZXJuZWwgYm9v
dHMuIE1vc3Qgb2YgdGhlIGluc3RydWN0aW9ucyBhcmUgZXhjbHVzaXZlbHkgdXNlZCBieSBCUEYK
Pj4+PiBidXQgSSBhbSB1bnN1cmUgb2YgdGhlIGJlc3Qgd2F5IG9mIHRlc3RpbmcgQlBGLgo+Pj4+
IAo+Pj4+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5j
b20+Cj4+Pj4gCj4+Pj4gLS0tCj4+Pj4gQ2hhcmxpZSBKZW5raW5zICgxMCk6Cj4+Pj4gICAgICBS
SVNDLVY6IEV4cGFuZCBpbnN0cnVjdGlvbiBkZWZpbml0aW9ucwo+Pj4+ICAgICAgUklTQy1WOiB2
ZWN0b3I6IFJlZmFjdG9yIGluc3RydWN0aW9ucwo+Pj4+ICAgICAgUklTQy1WOiBSZWZhY3RvciBq
dW1wIGxhYmVsIGluc3RydWN0aW9ucwo+Pj4+ICAgICAgUklTQy1WOiBLR0RCOiBSZWZhY3RvciBp
bnN0cnVjdGlvbnMKPj4+PiAgICAgIFJJU0MtVjogbW9kdWxlOiBSZWZhY3RvciBpbnN0cnVjdGlv
bnMKPj4+PiAgICAgIFJJU0MtVjogUmVmYWN0b3IgcGF0Y2ggaW5zdHJ1Y3Rpb25zCj4+Pj4gICAg
ICBSSVNDLVY6IG5vbW11OiBSZWZhY3RvciBpbnN0cnVjdGlvbnMKPj4+PiAgICAgIFJJU0MtVjog
a3ZtOiBSZWZhY3RvciBpbnN0cnVjdGlvbnMKPj4+PiAgICAgIFJJU0MtVjogYnBmOiBSZWZhY3Rv
ciBpbnN0cnVjdGlvbnMKPj4+PiAgICAgIFJJU0MtVjogUmVmYWN0b3IgYnVnIGFuZCB0cmFwcyBp
bnN0cnVjdGlvbnMKPj4+PiAKPj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2J1Zy5oICAgICAg
ICAgICAgIHwgICAxOCArLQo+Pj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oICAgICAg
ICAgICAgfCAyNzQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+Pj4+IGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcmVnLmggICAgICAgICAgICAgfCAgIDg4ICsKPj4+PiBhcmNoL3Jpc2N2
L2tlcm5lbC9qdW1wX2xhYmVsLmMgICAgICAgICAgIHwgICAxMyArLQo+Pj4+IGFyY2gvcmlzY3Yv
a2VybmVsL2tnZGIuYyAgICAgICAgICAgICAgICAgfCAgIDEzICstCj4+Pj4gYXJjaC9yaXNjdi9r
ZXJuZWwvbW9kdWxlLmMgICAgICAgICAgICAgICB8ICAgODAgKy0KPj4+PiBhcmNoL3Jpc2N2L2tl
cm5lbC9wYXRjaC5jICAgICAgICAgICAgICAgIHwgICAgMyArLQo+Pj4+IGFyY2gvcmlzY3Yva2Vy
bmVsL3Byb2Jlcy9rcHJvYmVzLmMgICAgICAgfCAgIDEzICstCj4+Pj4gYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvYmVzL3NpbXVsYXRlLWluc24uYyB8ICAxMDAgKy0KPj4+PiBhcmNoL3Jpc2N2L2tlcm5l
bC9wcm9iZXMvdXByb2Jlcy5jICAgICAgIHwgICAgNSArLQo+Pj4+IGFyY2gvcmlzY3Yva2VybmVs
L3RyYXBzLmMgICAgICAgICAgICAgICAgfCAgICA5ICstCj4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHNfbWlzYWxpZ25lZC5jICAgICB8ICAyMTggKy0tCj4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwv
dmVjdG9yLmMgICAgICAgICAgICAgICB8ICAgIDUgKy0KPj4+PiBhcmNoL3Jpc2N2L2t2bS92Y3B1
X2luc24uYyAgICAgICAgICAgICAgIHwgIDI4MSArLS0KPj4+PiBhcmNoL3Jpc2N2L25ldC9icGZf
aml0LmggICAgICAgICAgICAgICAgIHwgIDcwNyArLS0tLS0tLQo+Pj4+IDE1IGZpbGVzIGNoYW5n
ZWQsIDI4MjUgaW5zZXJ0aW9ucygrKSwgMTQ3MiBkZWxldGlvbnMoLSkKPj4+PiAtLS0KPj4+PiBi
YXNlLWNvbW1pdDogNWQwYzIzMGYxZGU4Yzc1MTViNjU2N2Q5YWZiYTFmMTk2ZmI0ZTJmNAo+Pj4+
IGNoYW5nZS1pZDogMjAyMzA4MDEtbWFzdGVyLXJlZmFjdG9yLWluc3RydWN0aW9ucy12NC00MzNh
YTA0MGRhMDMKPj4+PiAtLSAKPj4+PiAtIENoYXJsaWUKPj4+PiAKPj4+PiAKPj4+PiAtLSAKPj4+
PiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4+Pj4ga3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
