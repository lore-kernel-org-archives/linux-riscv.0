Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDA5CD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYQ/e4P/1BipxrugjcrphlqejtqNqgpzAKFrrQdiQFo=; b=0YD4UYMFeGpJqX
	3eLHwUPoFZGJsH5bxOI2gs1eAFv6+nEeE8+O1OV5xSVWqPUzpUcCejyFab9loPB8S1fdXibZiBofR
	1q8zh+qR1SPLJl6thnyWVuiDaFHUe7tmkfbCph6E97fyCl4vbBWO5dFa70n5MQsE6ZDIrM4C+fAqd
	Ml4Ji/gKnlZKruv8yWdc+W1K3HS3phN3NmPTXyNSIdW9L5c4lZpz6FcHkzOhhy931QRJpja++vR6Q
	gpypgvh9wPFedtKQZFE4NS/qh1tsr0FrWHosbPofbCLrAFWINqRnRsUwQic74xTF/qT6NHmn9BpZ2
	FlwBdxQ2rxS3Yx8WAK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsk71-00000007LBI-245W;
	Fri, 05 Apr 2024 14:00:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsk6z-00000007L9n-0Fsb
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 14:00:10 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-516d47ce662so1213435e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712325607; x=1712930407; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+JOsadKfFathomT/VZJtKT0zxsgL3aEkcsxRTzINeQ=;
        b=GNt3nhCMcNgUvtp59kPGk1C2ikVHdIyluI/YI2q8pHY98+A002jmV+XyHbCaq8j7qu
         I4Gdy+zd49Pd6ofrbO08i7eGGkT+86shvwz0N4OesyWZi6bVnYcdRj3F/cmFfR+FZAt2
         PRTUWu/x0II1UOfRnqbK/oKyQOa+9RaKD/4AytYBfSFlZgzr2rGRuvh7Kdaukz7ttlIh
         j9GK0Y1jeGF4SjDCnEHwCqzKDYgmW90xPgay892cfFU/lqxtDTd+t7wBycQmpb+gPaWm
         S1HAB2tQhefrmw3SQSok0wWU+L445yRqYDucz52k9YaHMihVkqS0fz8E1YPg3hQJ1wrQ
         OzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712325607; x=1712930407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+JOsadKfFathomT/VZJtKT0zxsgL3aEkcsxRTzINeQ=;
        b=Sq6w4gzFXM+zSEB861voiwfM36catdQLZ+puR+bbpBXiL0chfsy2uTzQYbI4rLIqzF
         APP8h9cQt2jbQHS6AO3uTuXy5yeA6OhsgyUP+bctczZxyWpg3vf/TJhEaxpmDAF4Nv+l
         NO7eKwjMUcgmKth+f0o7J5hC/ILlvbLEbl2AETF7VnREF58JX9VzAAPl/x7p0js2avGE
         87GN91zNWCzGLi8o2MCQIl4Lf654fIm9wADT8MHc6Sa6BZBxVZJWpVR67ekXxxCJjyNE
         dYft78lml2i6VOdk7wK8uoSMKaaDQnWaEDxmZWXDLyOBqP0s/uIy0JIepgmdAG3ceGNa
         BBqg==
X-Forwarded-Encrypted: i=1; AJvYcCUO7JscEW3ox6GEIzyBtIqKHSx31WV5EORB/xVZ5dH8PCKji9NmmdD9wgoO3qIl5+u47NCKp/RGPnz0c28EJGrCtuG7Oq2elNn5L9CpDykA
X-Gm-Message-State: AOJu0YyNctn7oce7LFJerjtGw6ryjDHqI0Cw4kvIx6TruQJJm41pMhDO
	sN5s30b64rEIKkkYCJ1hxJN2GXfevQMVE3LFnNN4NNtf7J/8oEEoPqvBVJHaAGv1nsEFn+6gOJc
	PJMtoYBUDCwpnw0Lf+Nt4Vu2V+ss=
X-Google-Smtp-Source: AGHT+IHVt8RDgDjC3fyDpZxaqbL2BMpJsAAbrWtLM942yF9DzQZJz9W4aMfcrSjQM+xHatneoKjHAlweBiB4ZOQTcCI=
X-Received: by 2002:a19:641c:0:b0:516:c44a:657d with SMTP id
 y28-20020a19641c000000b00516c44a657dmr1349763lfb.64.1712325606373; Fri, 05
 Apr 2024 07:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240328141845.128645-1-puranjay12@gmail.com> <87bk6rsyry.fsf@all.your.base.are.belong.to.us>
 <20240403130201.3340e5fe1d01a4f86dd2d772@kernel.org>
In-Reply-To: <20240403130201.3340e5fe1d01a4f86dd2d772@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 5 Apr 2024 15:59:55 +0200
Message-ID: <CANk7y0ikcbvgHxYb_WJfofGgZQGT=cEWQCQ0CBU2V5dpqGsHVQ@mail.gmail.com>
Subject: Re: [RFC PATCH] ftrace: riscv: move from REGS to ARGS
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, 
	Mark Rutland <mark.rutland@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Guo Ren <guoren@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Song Shuai <suagrfillet@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_070009_138835_A24ADEA9 
X-CRM114-Status: GOOD (  36.33  )
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

T24gV2VkLCBBcHIgMywgMjAyNCBhdCA2OjAy4oCvQU0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFt
YXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIDAyIEFwciAyMDI0IDE1OjAyOjQxICsw
MjAwCj4gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+IFB1cmFu
amF5IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNvbT4gd3JpdGVzOgo+ID4KPiA+ID4gVGhpcyBj
b21taXQgcmVwbGFjZXMgcmlzY3YncyBzdXBwb3J0IGZvciBGVFJBQ0VfV0lUSF9SRUdTIHdpdGgg
c3VwcG9ydAo+ID4gPiBmb3IgRlRSQUNFX1dJVEhfQVJHUy4gVGhpcyBpcyByZXF1aXJlZCBmb3Ig
dGhlIG9uZ29pbmcgZWZmb3J0IHRvIHN0b3AKPiA+ID4gcmVseWluZyBvbiBzdG9wX21hY2hpbmUo
KSBmb3IgUklTQ1YncyBpbXBsZW1lbnRhdGlvbiBvZiBmdHJhY2UuCj4gPiA+Cj4gPiA+IFRoZSBt
YWluIHJlbGV2YW50IGJlbmVmaXQgdGhhdCB0aGlzIGNoYW5nZSB3aWxsIGJyaW5nIGZvciB0aGUg
YWJvdmUKPiA+ID4gdXNlLWNhc2UgaXMgdGhhdCBub3cgd2UgZG9uJ3QgaGF2ZSBzZXBhcmF0ZSBm
dHJhY2VfY2FsbGVyIGFuZAo+ID4gPiBmdHJhY2VfcmVnc19jYWxsZXIgdHJhbXBvbGluZXMuICBU
aGlzIHdpbGwgYWxsb3cgdGhlIGNhbGxzaXRlIHRvIGNhbGwKPiA+ID4gZnRyYWNlX2NhbGxlciBi
eSBtb2RpZnlpbmcgYSBzaW5nbGUgaW5zdHJ1Y3Rpb24uIE5vdyB0aGUgY2FsbHNpdGUgY2FuCj4g
PiA+IGRvIHNvbWV0aGluZyBzaW1pbGFyIHRvOgo+ID4gPgo+ID4gPiBXaGVuIG5vdCB0cmFjaW5n
OiAgICAgICAgICAgIHwgICAgICAgICAgICAgV2hlbiB0cmFjaW5nOgo+ID4gPgo+ID4gPiBmdW5j
OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnVuYzoKPiA+ID4gICBhdWlw
YyB0MCwgZnRyYWNlX2NhbGxlcl90b3AgICAgICAgICAgICAgICAgYXVpcGMgdDAsIGZ0cmFjZV9j
YWxsZXJfdG9wCj4gPiA+ICAgbm9wICA8PT09PT09PT09PEVuYWJsZS9EaXNhYmxlPj09PT09PT09
PT4gIGphbHIgIHQwLCBmdHJhY2VfY2FsbGVyX2JvdHRvbQo+ID4gPiAgIFsuLi5dICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbLi4uXQo+ID4gPgo+ID4gPiBUaGUgYWJvdmUg
YXNzdW1lcyB0aGF0IHdlIGFyZSBkcm9wcGluZyB0aGUgc3VwcG9ydCBvZiBjYWxsaW5nIGEgZGly
ZWN0Cj4gPiA+IHRyYW1wb2xpbmUgZnJvbSB0aGUgY2FsbHNpdGUuIFdlIG5lZWQgdG8gZHJvcCB0
aGlzIGFzIHRoZSBjYWxsc2l0ZSBjYW4ndAo+ID4gPiBjaGFuZ2UgdGhlIHRhcmdldCBhZGRyZXNz
IHRvIGNhbGwsIGl0IGNhbiBvbmx5IGVuYWJsZS9kaXNhYmxlIGEgY2FsbCB0bwo+ID4gPiBhIHBy
ZXNldCB0YXJnZXQgKGZ0cmFjZV9jYWxsZXIgaW4gdGhlIGFib3ZlIGRpYWdyYW0pLgo+ID4gPgo+
ID4gPiBDdXJyZW50bHksIGZ0cmFjZV9yZWdzX2NhbGxlciBzYXZlcyBhbGwgQ1BVIHJlZ2lzdGVy
cyBpbiB0aGUgZm9ybWF0IG9mCj4gPiA+IHN0cnVjdCBwdF9yZWdzIGFuZCBhbGxvd3MgdGhlIHRy
YWNlciB0byBtb2RpZnkgdGhlbS4gV2UgZG9uJ3QgbmVlZCB0bwo+ID4gPiBzYXZlIGFsbCBvZiB0
aGUgQ1BVIHJlZ2lzdGVycyBiZWNhdXNlIGF0IGZ1bmN0aW9uIGVudHJ5IG9ubHkgYSBzdWJzZXQg
b2YKPiA+ID4gcHRfcmVncyBpcyBsaXZlOgo+ID4gPgo+ID4gPiB8LS0tLS0tLS0tLSstLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwKPiA+ID4g
fCBSZWdpc3RlciB8IEFCSSBOYW1lIHwgRGVzY3JpcHRpb24gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8Cj4gPiA+IHwtLS0tLS0tLS0tKy0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAo+ID4gPiB8IHgxICAgICAgIHwgcmEgICAg
ICAgfCBSZXR1cm4gYWRkcmVzcyBmb3IgdHJhY2VkIGZ1bmN0aW9uICAgICAgICAgIHwKPiA+ID4g
fCB4MiAgICAgICB8IHNwICAgICAgIHwgU3RhY2sgcG9pbnRlciAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8Cj4gPiA+IHwgeDUgICAgICAgfCB0MCAgICAgICB8IFJldHVybiBhZGRyZXNz
IGZvciBmdHJhY2VfY2FsbGVyIHRyYW1wb2xpbmUgfAo+ID4gPiB8IHg4ICAgICAgIHwgczAvZnAg
ICAgfCBGcmFtZSBwb2ludGVyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiA+ID4g
fCB4MTAtMTEgICB8IGEwLTEgICAgIHwgRnVuY3Rpb24gYXJndW1lbnRzL3JldHVybiB2YWx1ZXMg
ICAgICAgICAgICB8Cj4gPiA+IHwgeDEyLTE3ICAgfCBhMi03ICAgICB8IEZ1bmN0aW9uIGFyZ3Vt
ZW50cyAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+ID4gPiB8LS0tLS0tLS0tLSstLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwKPiA+ID4K
PiA+ID4gU2VlIFJJU0NWIGNhbGxpbmcgY29udmVudGlvblsxXSBmb3IgdGhlIGFib3ZlIHRhYmxl
Lgo+ID4gPgo+ID4gPiBTYXZpbmcganVzdCB0aGUgbGl2ZSByZWdpc3RlcnMgZGVjcmVhc2VzIHRo
ZSBhbW91bnQgb2Ygc3RhY2sgc3BhY2UKPiA+ID4gcmVxdWlyZWQgZnJvbSAyODggQnl0ZXMgdG8g
MTEyIEJ5dGVzLgo+ID4gPgo+ID4gPiBCYXNpYyB0ZXN0aW5nIHdhcyBkb25lIHdpdGggdGhpcyBv
biB0aGUgVmlzaW9uRml2ZSAyIGRldmVsb3BtZW50IGJvYXJkLgo+ID4gPgo+ID4gPiBOb3RlOgo+
ID4gPiAgIC0gTW92aW5nIGZyb20gUkVHUyB0byBBUkdTIHdpbGwgbWVhbiB0aGF0IFJJU0NWIHdp
bGwgc3RvcCBzdXBwb3J0aW5nCj4gPiA+ICAgICBLUFJPQkVTX09OX0ZUUkFDRSBhcyBpdCByZXF1
aXJlcyBmdWxsIHB0X3JlZ3MgdG8gYmUgc2F2ZWQuCj4gPgo+ID4gLi4uYW5kIEZQUk9CRVMsIGJ1
dCBNYXNhbWkgaXMgKHN0aWxsPykgd29ya2luZyBvbiBhIHNlcmllcyB0byBhZGRyZXNzCj4gPiB0
aGF0IFsxXS4KPgo+IFllcywgZXZlbiB3aXRoIHRoaXMgcGF0Y2gsIEZQUk9CRSBjYW4gYmUgd29y
a2VkIHdpdGggbXkgc2VyaWVzLgo+IFNvIEknbSBPSyBmb3IgdGhpcyBjaGFuZ2UuCj4KPiBUaGFu
ayB5b3UsCj4KPiA+Cj4gPiBNeSBwZXJzcGVjdGl2ZTsgVGhpcyBpcyBmb2xsb3dpbmcgdGhlIHdv
cmsgTWFyayBldCBhbCBoYXMgZG9uZSBmb3IKPiA+IGFybTY0LCBhbmQgaXQgZG9lcyBtYWtlIHNl
bnNlIGZvciBSSVNDLVYgYXMgd2VsbC4gSSdtIGluIGZhdm9yIGhhdmluZwo+ID4gdGhpcyBjaGFu
Z2UgYXMgcGFydCBvZiB0aGUgYmlnZ2VyIGNhbGxfb3BzL3RleHQgcGF0Y2ggY2hhbmdlIGZvciBS
SVNDLVYuCj4gPgo+ID4gWy4uLl0KPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2Z0cmFjZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4g
PiBpbmRleCAxMjc2ZDdkOWNhOGIuLjFlOTViZjRkZWQ2YyAxMDA2NDQKPiA+ID4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Z0cmFjZS5oCj4gPiA+IEBAIC0xMjQsMjAgKzEyNCw4NyBAQCBzdHJ1Y3QgZHluX2Z0
cmFjZTsKPiA+ID4gIGludCBmdHJhY2VfaW5pdF9ub3Aoc3RydWN0IG1vZHVsZSAqbW9kLCBzdHJ1
Y3QgZHluX2Z0cmFjZSAqcmVjKTsKPiA+ID4gICNkZWZpbmUgZnRyYWNlX2luaXRfbm9wIGZ0cmFj
ZV9pbml0X25vcAo+ID4gPgo+ID4gPiAtI2lmZGVmIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRI
X1JFR1MKPiA+ID4gKyNpZmRlZiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdTCj4gPiA+
ICsjZGVmaW5lIGFyY2hfZnRyYWNlX2dldF9yZWdzKHJlZ3MpIE5VTEwKPiA+ID4gIHN0cnVjdCBm
dHJhY2Vfb3BzOwo+ID4gPiAtc3RydWN0IGZ0cmFjZV9yZWdzOwo+ID4gPiArc3RydWN0IGZ0cmFj
ZV9yZWdzIHsKPiA+ID4gKyAgIHVuc2lnbmVkIGxvbmcgZXBjOwo+ID4gPiArICAgdW5zaWduZWQg
bG9uZyByYTsKPiA+ID4gKyAgIHVuc2lnbmVkIGxvbmcgc3A7Cj4gPiA+ICsgICB1bnNpZ25lZCBs
b25nIHMwOwo+ID4gPiArICAgdW5zaWduZWQgbG9uZyB0MTsKPiA+ID4gKyAgIHVuaW9uIHsKPiA+
ID4gKyAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmdzWzhdOwo+ID4gPiArICAgICAgICAgICBz
dHJ1Y3Qgewo+ID4gPiArICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYTA7Cj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhMTsKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGEyOwo+ID4gPiArICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgYTM7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhNDsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGE1Owo+ID4gPiArICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYTY7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBhNzsKPiA+ID4gKyAgICAgICAgICAgfTsKPiA+ID4gKyAgIH07Cj4gPiA+
ICt9Owo+ID4gPiArCj4gPiA+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcK
PiA+ID4gK2Z0cmFjZV9yZWdzX2dldF9pbnN0cnVjdGlvbl9wb2ludGVyKGNvbnN0IHN0cnVjdCBm
dHJhY2VfcmVncyAqZnJlZ3MpCj4gPiA+ICt7Cj4gPiA+ICsgICByZXR1cm4gZnJlZ3MtPmVwYzsK
PiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkCj4gPiA+
ICtmdHJhY2VfcmVnc19zZXRfaW5zdHJ1Y3Rpb25fcG9pbnRlcihzdHJ1Y3QgZnRyYWNlX3JlZ3Mg
KmZyZWdzLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgcGMpCj4gPiA+ICt7Cj4gPiA+ICsgICBmcmVncy0+ZXBjID0gcGM7Cj4gPiA+ICt9Cj4gPiA+
ICsKPiA+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdW5zaWduZWQgbG9uZwo+ID4gPiArZnRy
YWNlX3JlZ3NfZ2V0X3N0YWNrX3BvaW50ZXIoY29uc3Qgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVn
cykKPiA+ID4gK3sKPiA+ID4gKyAgIHJldHVybiBmcmVncy0+c3A7Cj4gPiA+ICt9Cj4gPiA+ICsK
PiA+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdW5zaWduZWQgbG9uZwo+ID4gPiArZnRyYWNl
X3JlZ3NfZ2V0X2FyZ3VtZW50KHN0cnVjdCBmdHJhY2VfcmVncyAqZnJlZ3MsIHVuc2lnbmVkIGlu
dCBuKQo+ID4gPiArewo+ID4gPiArICAgaWYgKG4gPCA4KQo+ID4gPiArICAgICAgICAgICByZXR1
cm4gZnJlZ3MtPmFyZ3Nbbl07Cj4gPiA+ICsgICByZXR1cm4gMDsKPiA+ID4gK30KPiA+ID4gKwo+
ID4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB1bnNpZ25lZCBsb25nCj4gPiA+ICtmdHJhY2Vf
cmVnc19nZXRfcmV0dXJuX3ZhbHVlKGNvbnN0IHN0cnVjdCBmdHJhY2VfcmVncyAqZnJlZ3MpCj4g
PiA+ICt7Cj4gPiA+ICsgICByZXR1cm4gZnJlZ3MtPmEwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+
ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQKPiA+ID4gK2Z0cmFjZV9yZWdzX3NldF9yZXR1
cm5fdmFsdWUoc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncywKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmV0KQo+ID4gPiArewo+ID4gPiArICAgZnJlZ3MtPmEw
ID0gcmV0Owo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZv
aWQKPiA+ID4gK2Z0cmFjZV9vdmVycmlkZV9mdW5jdGlvbl93aXRoX3JldHVybihzdHJ1Y3QgZnRy
YWNlX3JlZ3MgKmZyZWdzKQo+ID4gPiArewo+ID4gPiArICAgZnJlZ3MtPmVwYyA9IGZyZWdzLT5y
YTsKPiA+ID4gK30KPiA+Cj4gPiBTdHlsZS9uaXQ6IEFsbCBhYm92ZTsgVHJ5IHRvIHVzZSB0aGUg
ZnVsbCAxMDAgY2hhcnMsIGFuZCBrZWVwIHRoZQo+ID4gZnVuY3Rpb24gbmFtZSByZXR1cm4gdmFs
dWUgb24gdGhlIHNhbWUgbGluZSBmb3IgZ3JlcGFiaWxpdHkuCj4gPgo+ID4KPiA+IEJqw7Zybgo+
ID4KPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMTcwODg3NDEwMzM3LjU2NDI0
OS42MzYwMTE4ODQwOTQ2Njk3MDM5LnN0Z2l0QGRldm5vdGUyLwo+Cj4KPiAtLQo+IE1hc2FtaSBI
aXJhbWF0c3UgKEdvb2dsZSkgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CgpJIHdpbGwgc2VuZCBpdCB3
aXRob3V0IFJGQyBhbmQgd2lsbCBmaXggdGhlIHByb2JsZW1zIHBvaW50ZWQgb3V0IGJ5IEJqb3Ju
LgoKVGhhbmtzLApQdXJhbmpheQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
