Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB36C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 00:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzKza5h4upfn2GuYiC+9+jpNKDXkwD7tHL/iVV010WM=; b=sXySgLUUchpk9x
	HKx/7mBFIv0XGE8lN+ROkoxFs+46OPL7h6D9rZd8YqWEh8xWJWDmMcYn3l8XrVqO2mAFx4362PrtU
	Bqlbl2gQQZqwhyfzGSzRlJpIEN4Hp9CqfpshwPHBlrsq6qczvJCPWNlHht+RowpFnDL0q/XGAkFv0
	TB8/GyeEQcwC8XGHnMFT1gHUTUJR50ms+NXdAeveDHjkl93ZlLldRJLbpC8lPe7W1Lq7givHdmnOH
	2W13nx3ASVlVSrb03hkBhP+vhAo/Cful/Qt0UL0TKbrQKJ+zZBPXyuXxwgUmTKit+GplP1wn5Tl6e
	DD5PHqYXeSnsNvpDtL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzRKP-00BSWV-23;
	Thu, 18 May 2023 00:17:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzRKL-00BSV1-0p
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 00:17:06 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so2069223a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 17:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684369020; x=1686961020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh43Wrfv+5aBpD3zk+YIOr3pgIKi6Fm6XvjoyCfmrss=;
        b=O2q6Qm5/BCw7eL+R4iqW2KRYtOD7PxCsAMTNdmblRTQBQ9SXxj97E+uiLaHvdw+0vH
         IZAgUyLD9tdpA6WzvAnycAcJlidqsKRKjEyDwYPcgFRoiRvn+aGoAETE0zL7U0uecutc
         llNmsUorv3L9LvscGZeLrSn73CHxCEwpMLc242B+rU5ye9EYoqGyqECI6UmFyVNI137l
         BrXk4d74hq54C4WH4aTFrG6aAlMIlKYkIqfTmGGIoIU7n6R2fgdc8MiqqwfXql+JUk9B
         mbUicBybFzH8SUZx97fcymQ4dD0Koiso43k2URk/mqAAZSJcQr2pCjX4Y8H2fcQR9saN
         B11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684369020; x=1686961020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oh43Wrfv+5aBpD3zk+YIOr3pgIKi6Fm6XvjoyCfmrss=;
        b=OmDRFlb7x20QBvCp2DeQvYoxFH9Tk69bZPrEvIs1ie5aikYYt+N98UCh/pNT1HKRQ7
         ukR3icIRjJ+V23pv/2Biymn7mDfG2pfh9OHVav2z2JKrpwe0rZ79f17guEAT6BLyXdV0
         hjMa+ZXhTO+eT5Ol6LOoQMkXmNh9yrWqLZTThd451YMdkzac2AJBMOmQAqA17TNm+waL
         7J7DaD78Ni7J156SH7FIm3sLE1mx1O5uS+4I1N6xko4zeqTjqvYTmdAdQvMWIcpLfkIR
         C/7WXu5/lypDhzu1G3QrCby7kinPPTgjZv9z5ShmLK0vUHpVFZCp+DjxH1HAgy4NnC1e
         Xqww==
X-Gm-Message-State: AC+VfDwNtRcVDZqfie0SAt4oyhNLUqf2/Wtuu0MdLintiy7e/1jO/sTy
	j9kV4xWrxe9xs0HG4m68grrrivgBQSsDfQxnKaU=
X-Google-Smtp-Source: ACHHUZ4tffbvWb2kOWbRDAM1NZzsqQL8R1kGzCDWJgVZSv6SDwKWRnc526sFoNefgRlhM2mGaZLNKOiitqvHwbCzGkc=
X-Received: by 2002:a17:907:7250:b0:966:b4b:eb0 with SMTP id
 ds16-20020a170907725000b009660b4b0eb0mr42160555ejc.30.1684369019531; Wed, 17
 May 2023 17:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230517034510.15639-1-zegao@tencent.com> <20230517034510.15639-3-zegao@tencent.com>
 <20230517232751.09126a6cec8786a954e54bcf@kernel.org>
In-Reply-To: <20230517232751.09126a6cec8786a954e54bcf@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 17 May 2023 17:16:47 -0700
Message-ID: <CAEf4BzbxRXGR8uL=gkU9A=bER-zUbYSKgBhPLju1JZBUn9LrvQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] fprobe: make fprobe_kprobe_handler recursion free
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Ze Gao <zegao2021@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Ze Gao <zegao@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_171705_321462_2B6594C0 
X-CRM114-Status: GOOD (  29.50  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgNzoyOOKAr0FNIE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJh
bWF0QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAxNyBNYXkgMjAyMyAxMTo0NTowNyAr
MDgwMAo+IFplIEdhbyA8emVnYW8yMDIxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IEN1cnJlbnQg
aW1wbGVtZW50YXRpb24gY2FsbHMga3Byb2JlIHJlbGF0ZWQgZnVuY3Rpb25zIGJlZm9yZSBkb2lu
Zwo+ID4gZnRyYWNlIHJlY3Vyc2lvbiBjaGVjayBpbiBmcHJvYmVfa3Byb2JlX2hhbmRsZXIsIHdo
aWNoIG9wZW5zIGRvb3IKPiA+IHRvIGtlcm5lbCBjcmFzaCBkdWUgdG8gc3RhY2sgcmVjdXJzaW9u
IGlmIHByZWVtcHRfY291bnRfe2FkZCwgc3VifQo+ID4gaXMgdHJhY2VhYmxlIGluIGtwcm9iZV9i
dXN5X3tiZWdpbiwgZW5kfS4KPiA+Cj4gPiBUaGluZ3MgZ29lcyBsaWtlIHRoaXMgd2l0aG91dCB0
aGlzIHBhdGNoIHF1b3RlZCBmcm9tIFN0ZXZlbjoKPiA+ICIKPiA+IGZwcm9iZV9rcHJvYmVfaGFu
ZGxlcigpIHsKPiA+ICAgIGtwcm9iZV9idXN5X2JlZ2luKCkgewo+ID4gICAgICAgcHJlZW1wdF9k
aXNhYmxlKCkgewo+ID4gICAgICAgICAgcHJlZW1wdF9jb3VudF9hZGQoKSB7ICA8LS0gdHJhY2UK
PiA+ICAgICAgICAgICAgIGZwcm9iZV9rcHJvYmVfaGFuZGxlcigpIHsKPiA+ICAgICAgICAgICAg
ICAgWyB3YXNoLCByaW5zZSwgcmVwZWF0LCBDUkFTSCEhISBdCj4gPiAiCj4gPgo+ID4gQnkgcmVm
YWN0b3JpbmcgdGhlIGNvbW1vbiBwYXJ0IG91dCBvZiBmcHJvYmVfa3Byb2JlX2hhbmRsZXIgYW5k
Cj4gPiBmcHJvYmVfaGFuZGxlciBhbmQgY2FsbCBmdHJhY2UgcmVjdXJzaW9uIGRldGVjdGlvbiBh
dCB0aGUgdmVyeSBiZWdpbm5pbmcsCj4gPiB0aGUgd2hvbGUgZnByb2JlX2twcm9iZV9oYW5kbGVy
IGlzIGZyZWUgZnJvbSByZWN1cnNpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWmUgR2FvIDx6
ZWdhb0B0ZW5jZW50LmNvbT4KPiA+IEFja2VkLWJ5OiBNYXNhbWkgSGlyYW1hdHN1IChHb29nbGUp
IDxtaGlyYW1hdEBrZXJuZWwub3JnPgo+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtdHJhY2Uta2VybmVsLzIwMjMwNTE2MDcxODMwLjgxOTAtMy16ZWdhb0B0ZW5jZW50LmNv
bQo+ID4gLS0tCj4gPiAga2VybmVsL3RyYWNlL2Zwcm9iZS5jIHwgNTkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEva2VybmVsL3Ry
YWNlL2Zwcm9iZS5jIGIva2VybmVsL3RyYWNlL2Zwcm9iZS5jCj4gPiBpbmRleCA5YWJiMzkwNWJj
OGUuLjA5N2M3NDA3OTliYSAxMDA2NDQKPiA+IC0tLSBhL2tlcm5lbC90cmFjZS9mcHJvYmUuYwo+
ID4gKysrIGIva2VybmVsL3RyYWNlL2Zwcm9iZS5jCj4gPiBAQCAtMjAsMzAgKzIwLDIyIEBAIHN0
cnVjdCBmcHJvYmVfcmV0aG9va19ub2RlIHsKPiA+ICAgICAgIGNoYXIgZGF0YVtdOwo+ID4gIH07
Cj4gPgo+ID4gLXN0YXRpYyB2b2lkIGZwcm9iZV9oYW5kbGVyKHVuc2lnbmVkIGxvbmcgaXAsIHVu
c2lnbmVkIGxvbmcgcGFyZW50X2lwLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBmdHJhY2Vfb3BzICpvcHMsIHN0cnVjdCBmdHJhY2VfcmVncyAqZnJlZ3MpCj4gPiArc3RhdGlj
IGlubGluZSB2b2lkIF9fZnByb2JlX2hhbmRsZXIodW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQg
bG9uZwo+ID4gKyAgICAgICAgICAgICBwYXJlbnRfaXAsIHN0cnVjdCBmdHJhY2Vfb3BzICpvcHMs
IHN0cnVjdCBmdHJhY2VfcmVncyAqZnJlZ3MpCj4KPiBPSywgSSBwaWNrZWQgdXAgdGhpcyBzZXJp
ZXMgdG8gcHJvYmVzL2ZpeGVzLiBOb3RlIHRoYXQgSSBmaXhlZCB0aGlzIGxpbmUKPiBiZWNhdXNl
IHRoZSAidW5zaWduZWQgbG9uZyBwYXJlbnRfaXAiIHdhcyBzcGxpdCBpbnRvIDIgbGluZXMuCj4K
CkhleSBNYXNhbWksCgpSZWdhcmRpbmcgWzBdLCBJIHdhcyBiaXNlY3RpbmcgQlBGIENJIGZhaWx1
cmVzIHJlbGF0ZWQgdG8KbXVsdGkta3Byb2JlcywgYW5kIGl0IHR1cm5lZCBvdXQgdGhhdCBbMF0g
aXMgdGhlIGZpeCB3ZSBuZWVkLiBJdCB3b3VsZApiZSBncmVhdCBpZiB5b3UgY2FuIG1ha2Ugc3Vy
ZSB0aGlzIGZpeCBnZXRzIGludG8gTGludXMnIHRyZWUgQVNBUCwgc28KdGhhdCB3ZSBjYW4gZ2V0
IGl0IGJhY2sgaW50byBicGYvYnBmLW5leHQgdHJlZXMgYW5kIGZpeCBCUEYgc2VsZnRlc3RzCmZv
ciBldmVyeW9uZSAod2UgbWl0aWdhdGVkIHRoaXMgZm9yIEJQRiBDSSBhcyBhIHRlbXBvcmFyeSB3
b3JrYXJvdW5kCmZvciBub3cpLiBUaGFua3MhCgogIFswXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMTY4MTAwNzMxMTYwLjc5NTM0LjM3NDgyNzExMDA4MzgzNjcyMi5zdGdpdEBkZXZub3Rl
Mi8KCgo+IFRoYW5rIHlvdSwKPgo+Cj4gPiAgewo+ID4gICAgICAgc3RydWN0IGZwcm9iZV9yZXRo
b29rX25vZGUgKmZwcjsKPiA+ICAgICAgIHN0cnVjdCByZXRob29rX25vZGUgKnJoID0gTlVMTDsK
PiA+ICAgICAgIHN0cnVjdCBmcHJvYmUgKmZwOwo+ID4gICAgICAgdm9pZCAqZW50cnlfZGF0YSA9
IE5VTEw7Cj4gPiAtICAgICBpbnQgYml0LCByZXQ7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4KPiA+
ICAgICAgIGZwID0gY29udGFpbmVyX29mKG9wcywgc3RydWN0IGZwcm9iZSwgb3BzKTsKPiA+IC0g
ICAgIGlmIChmcHJvYmVfZGlzYWJsZWQoZnApKQo+ID4gLSAgICAgICAgICAgICByZXR1cm47Cj4g
PiAtCj4gPiAtICAgICBiaXQgPSBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9jayhpcCwgcGFy
ZW50X2lwKTsKPiA+IC0gICAgIGlmIChiaXQgPCAwKSB7Cj4gPiAtICAgICAgICAgICAgIGZwLT5u
bWlzc2VkKys7Cj4gPiAtICAgICAgICAgICAgIHJldHVybjsKPiA+IC0gICAgIH0KPiA+Cj4gPiAg
ICAgICBpZiAoZnAtPmV4aXRfaGFuZGxlcikgewo+ID4gICAgICAgICAgICAgICByaCA9IHJldGhv
b2tfdHJ5X2dldChmcC0+cmV0aG9vayk7Cj4gPiAgICAgICAgICAgICAgIGlmICghcmgpIHsKPiA+
ICAgICAgICAgICAgICAgICAgICAgICBmcC0+bm1pc3NlZCsrOwo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgIGdvdG8gb3V0Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiA+ICAg
ICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICBmcHIgPSBjb250YWluZXJfb2YocmgsIHN0
cnVjdCBmcHJvYmVfcmV0aG9va19ub2RlLCBub2RlKTsKPiA+ICAgICAgICAgICAgICAgZnByLT5l
bnRyeV9pcCA9IGlwOwo+ID4gQEAgLTYxLDIzICs1Myw2MCBAQCBzdGF0aWMgdm9pZCBmcHJvYmVf
aGFuZGxlcih1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPiA+ICAg
ICAgICAgICAgICAgZWxzZQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldGhvb2tfaG9vayhy
aCwgZnRyYWNlX2dldF9yZWdzKGZyZWdzKSwgdHJ1ZSk7Cj4gPiAgICAgICB9Cj4gPiAtb3V0Ogo+
ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBmcHJvYmVfaGFuZGxlcih1bnNpZ25lZCBsb25n
IGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPiA+ICsgICAgICAgICAgICAgc3RydWN0IGZ0
cmFjZV9vcHMgKm9wcywgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncykKPiA+ICt7Cj4gPiArICAg
ICBzdHJ1Y3QgZnByb2JlICpmcDsKPiA+ICsgICAgIGludCBiaXQ7Cj4gPiArCj4gPiArICAgICBm
cCA9IGNvbnRhaW5lcl9vZihvcHMsIHN0cnVjdCBmcHJvYmUsIG9wcyk7Cj4gPiArICAgICBpZiAo
ZnByb2JlX2Rpc2FibGVkKGZwKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4g
KyAgICAgLyogcmVjdXJzaW9uIGRldGVjdGlvbiBoYXMgdG8gZ28gYmVmb3JlIGFueSB0cmFjZWFi
bGUgZnVuY3Rpb24gYW5kCj4gPiArICAgICAgKiBhbGwgZnVuY3Rpb25zIGJlZm9yZSB0aGlzIHBv
aW50IHNob3VsZCBiZSBtYXJrZWQgYXMgbm90cmFjZQo+ID4gKyAgICAgICovCj4gPiArICAgICBi
aXQgPSBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9jayhpcCwgcGFyZW50X2lwKTsKPiA+ICsg
ICAgIGlmIChiaXQgPCAwKSB7Cj4gPiArICAgICAgICAgICAgIGZwLT5ubWlzc2VkKys7Cj4gPiAr
ICAgICAgICAgICAgIHJldHVybjsKPiA+ICsgICAgIH0KPiA+ICsgICAgIF9fZnByb2JlX2hhbmRs
ZXIoaXAsIHBhcmVudF9pcCwgb3BzLCBmcmVncyk7Cj4gPiAgICAgICBmdHJhY2VfdGVzdF9yZWN1
cnNpb25fdW5sb2NrKGJpdCk7Cj4gPiArCj4gPiAgfQo+ID4gIE5PS1BST0JFX1NZTUJPTChmcHJv
YmVfaGFuZGxlcik7Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGZwcm9iZV9rcHJvYmVfaGFuZGxlcih1
bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wcywgc3RydWN0IGZ0cmFj
ZV9yZWdzICpmcmVncykKPiA+ICB7Cj4gPiAtICAgICBzdHJ1Y3QgZnByb2JlICpmcCA9IGNvbnRh
aW5lcl9vZihvcHMsIHN0cnVjdCBmcHJvYmUsIG9wcyk7Cj4gPiArICAgICBzdHJ1Y3QgZnByb2Jl
ICpmcDsKPiA+ICsgICAgIGludCBiaXQ7Cj4gPiArCj4gPiArICAgICBmcCA9IGNvbnRhaW5lcl9v
ZihvcHMsIHN0cnVjdCBmcHJvYmUsIG9wcyk7Cj4gPiArICAgICBpZiAoZnByb2JlX2Rpc2FibGVk
KGZwKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAgLyogcmVjdXJz
aW9uIGRldGVjdGlvbiBoYXMgdG8gZ28gYmVmb3JlIGFueSB0cmFjZWFibGUgZnVuY3Rpb24gYW5k
Cj4gPiArICAgICAgKiBhbGwgZnVuY3Rpb25zIGNhbGxlZCBiZWZvcmUgdGhpcyBwb2ludCBzaG91
bGQgYmUgbWFya2VkIGFzIG5vdHJhY2UKPiA+ICsgICAgICAqLwo+ID4gKyAgICAgYml0ID0gZnRy
YWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2soaXAsIHBhcmVudF9pcCk7Cj4gPiArICAgICBpZiAo
Yml0IDwgMCkgewo+ID4gKyAgICAgICAgICAgICBmcC0+bm1pc3NlZCsrOwo+ID4gKyAgICAgICAg
ICAgICByZXR1cm47Cj4gPiArICAgICB9Cj4gPgo+ID4gICAgICAgaWYgKHVubGlrZWx5KGtwcm9i
ZV9ydW5uaW5nKCkpKSB7Cj4gPiAgICAgICAgICAgICAgIGZwLT5ubWlzc2VkKys7Cj4gPiAgICAg
ICAgICAgICAgIHJldHVybjsKPiA+ICAgICAgIH0KPiA+ICsKPiA+ICAgICAgIGtwcm9iZV9idXN5
X2JlZ2luKCk7Cj4gPiAtICAgICBmcHJvYmVfaGFuZGxlcihpcCwgcGFyZW50X2lwLCBvcHMsIGZy
ZWdzKTsKPiA+ICsgICAgIF9fZnByb2JlX2hhbmRsZXIoaXAsIHBhcmVudF9pcCwgb3BzLCBmcmVn
cyk7Cj4gPiAgICAgICBrcHJvYmVfYnVzeV9lbmQoKTsKPiA+ICsgICAgIGZ0cmFjZV90ZXN0X3Jl
Y3Vyc2lvbl91bmxvY2soYml0KTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGZwcm9iZV9l
eGl0X2hhbmRsZXIoc3RydWN0IHJldGhvb2tfbm9kZSAqcmgsIHZvaWQgKmRhdGEsCj4gPiAtLQo+
ID4gMi40MC4xCj4gPgo+Cj4KPiAtLQo+IE1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkgPG1oaXJh
bWF0QGtlcm5lbC5vcmc+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
