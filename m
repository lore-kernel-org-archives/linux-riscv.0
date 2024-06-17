Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C521BC27C77
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 03:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XK6ePzLsxav/z7f9Rr1LQOPPlvxI3sgMaQHFuEpuvDw=; b=rEmjuNa55nds48
	I7/tGt2wuMY3Ifr/ptylB1/iJyGf45SGxTj844tWOqnpcaAIFZihejiBhh5GD4e8N6l1kwKkJALvM
	yA/7ZiSdjryvP7ouCJdwn3Ek/2Rl9I7+foo45Zr0/fjrA//6LreTgIc0gBkGimNmawydQOlDwYIYH
	p6DiUUUOR5g/27EqmfsWtedDgruVGgMQKJCotvuL2O0IgxGAFyo6WhKCm4FsVPf0GV8Ip9DzqTjZX
	ofib86hUdxuRTQst3RRFztBzp4/LltdFmGCtqugsywhJAKHXNT6f0YzdDSzgQfCEIMF60Dbi8zVKv
	nsqykdpBXBtTMEYPL3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ2oC-00000008ysb-2Gbz;
	Mon, 17 Jun 2024 03:13:28 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ2o9-00000008yrj-1dBu
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 03:13:28 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-63258caaa91so22880367b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 16 Jun 2024 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718594004; x=1719198804; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTUZ05e6Yum4t2GwgWWjL5msqoEXhl4LpMNkyudXVSA=;
        b=Ka4lwNSgC4M8Z7MJ1o3zJBtfxouGk90Q+vsVNK1QjAwnAkiDRAckIFJ9z3yB1I03v5
         qftxJhjV2VJspKnxkT5k7qjDUpI0sfIbD9PLozHiLl6p1tBymdUr3yE0eUci64Zo5buh
         afZYG/48UbmzBPZ5INQ6lSBuWP4vBWwJeF2ixE034qyRIw/+giHlQVOa/bRHrv5nafj8
         sLr29TIQuitNNzAfjxQM8UuQLk6wCBgfBoDbN6IxKNDMGChwNzCZfByVqUeIjdj+O+4I
         ny4IxcsH9tIQ8qkDyqtX5gphv0n/fujsnp/DYYoFtaqXucOcpznd/VFiKqMxfMLCN9KR
         Gq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718594004; x=1719198804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTUZ05e6Yum4t2GwgWWjL5msqoEXhl4LpMNkyudXVSA=;
        b=ZiDTvEgsomway29qStIeVEmOdNk7VV4EAtTQBZXZr8LZxMdFtDxicJHWXRfiduSdJQ
         xXqtSP2xJpHpcIaaNnBLabL/a5upi6M1lrF1H4T9s+z38KkY9C9Va1sS5tVTLP2ooXkE
         9EQvV8SbQaPKMfhi0QmNzxBo0GvSDxQSMozoWOzEbrInQAvjsvkuU0msi1vWlQAzNagy
         DPknbYkC6QFDXdP8g4prpNRlNSM1mCkFbTf+3ghVSLRc9j+8MixisP3ZHT5qC025rEp1
         o2ry3AMBz0l4//j9G3chjwzjmdkRMt4GcTPOY0x5Xd3fPU0kmpKbBPaCJ+gJkC/afFno
         JVOg==
X-Forwarded-Encrypted: i=1; AJvYcCXSPkzQUwFFRejQjQBKGgUvnwtu8HrSvQsTbYqpOI94GazashsfrEczY6Eb2O1F7WgbVWNQSOC6+0O8dT2IAlHF+JTTwd5RHBTWQN/SGi2T
X-Gm-Message-State: AOJu0YwcQSuPbmnglbbKaf3EFNp5eL5KgNrDKbohoql+X8LzVxlBZLSo
	Clobk3Fkfg+rLt+stNq9k/KrD0Hr6FPnCTx5s/2+eG19fzablNoBOkUaCwHLm/hXn5s7347dC9C
	z4jJGnZz8rggPwGhNHBeTqD2q4f0Z7M97QAM8tQ==
X-Google-Smtp-Source: AGHT+IGcbuDhr//ejMFGoqLnDmcjq65GRM5Khv3QI8grXciiziqO38Mc6HPFBs3lKXswm9MpPGZCzPb1AOhqda4ES4M=
X-Received: by 2002:a0d:e648:0:b0:627:ecd3:6223 with SMTP id
 00721157ae682-6322480e9e1mr84249517b3.35.1718594004136; Sun, 16 Jun 2024
 20:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
 <20240613-dev-andyc-dyn-ftrace-v4-v1-4-1a538e12c01e@sifive.com>
 <20240613190920.GB1272931@thelio-3990X> <CABgGipV_6sFx8TJNrHszGLk=V9X1PJAXuOmRDxnTHPrigqJL0A@mail.gmail.com>
In-Reply-To: <CABgGipV_6sFx8TJNrHszGLk=V9X1PJAXuOmRDxnTHPrigqJL0A@mail.gmail.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 17 Jun 2024 11:13:13 +0800
Message-ID: <CABgGipXqZe5GTNNe0oRBPBaFqRYF7LLZsdhQQ9RSuXqk7+cukA@mail.gmail.com>
Subject: Re: [PATCH 4/8] riscv: ftrace: align patchable functions to 4 Byte boundary
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Zong Li <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_201325_568043_5B339C4D 
X-CRM114-Status: GOOD (  31.97  )
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

U29ycnkgZm9yIHRoZSBub2lzZSwKCk9uIE1vbiwgSnVuIDE3LCAyMDI0IGF0IDEwOjM44oCvQU0g
QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAx
NCwgMjAyNCBhdCAzOjA54oCvQU0gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Cj4gPiBIaSBBbmR5LAo+ID4KPiA+IE9uIFRodSwgSnVuIDEzLCAyMDI0IGF0
IDAzOjExOjA5UE0gKzA4MDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+ID4gV2UgYXJlIGNoYW5naW5n
IGZ0cmFjZSBjb2RlIHBhdGNoaW5nIGluIG9yZGVyIHRvIHJlbW92ZSBkZXBlbmRlbmN5IGZyb20K
PiA+ID4gc3RvcF9tYWNoaW5lKCkgYW5kIGVuYWJsZSBrZXJuZWwgcHJlZW1wdGlvbi4gVGhpcyBy
ZXF1aXJlcyB1cyB0byBhbGlnbgo+ID4gPiBmdW5jdGlvbnMgZW50cnkgYXQgYSA0LUIgYWxpZ24g
YWRkcmVzcy4KPiA+ID4KPiA+ID4gSG93ZXZlciwgLWZhbGlnbi1mdW5jdGlvbnMgb24gb2xkZXIg
dmVyc2lvbnMgb2YgR0NDIGFsb25lIHdhcyBub3Qgc3Ryb25nCj4gPiA+IGVub3VuZ2ggdG8gYWxp
Z24gYWxsIGZ1bmN0aW9ucy4gSW4gZmFjdCwgY29sZCBmdW5jdGlvbnMgYXJlIG5vdCBhbGlnbmVk
Cj4gPiA+IGFmdGVyIHR1cm5pbmcgb24gb3B0aW1pemF0aW9ucy4gV2UgY29uc2lkZXIgdGhpcyBp
cyBhIGJ1ZyBpbiBHQ0MgYW5kCj4gPiA+IHR1cm4gb2ZmIGd1ZXNzLWJyYW5jaC1wcm9iaWxpdHkg
YXMgYSB3b3JrYXJvdW5kIHRvIGFsaWduIGFsbCBmdW5jdGlvbnMuCj4gPiA+Cj4gPiA+IEdDQyBi
dWcgaWQ6IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTg4MzQ1
Cj4gPiA+Cj4gPiA+IFRoZSBvcHRpb24gLWZtaW4tZnVuY3Rpb24tYWxpZ25tZW50IGlzIGFibGUg
dG8gYWxpZ24gYWxsIGZ1bmN0aW9ucwo+ID4gPiBwcm9wZXJseSBvbiBuZXdlciB2ZXJzaW9ucyBv
ZiBnY2MuIFNvLCB3ZSBhZGQgYSBjYy1vcHRpb24gdG8gdGVzdCBpZgo+ID4gPiB0aGUgdG9vbGNo
YWluIHN1cHBvcnRzIGl0Lgo+ID4gPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IEV2Z2VuaWkgU2hhdG9r
aGluIDxlLnNoYXRva2hpbkB5YWRyby5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hp
dSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9LY29u
ZmlnICB8IDEgKwo+ID4gPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSB8IDcgKysrKysrLQo+ID4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
ID4gPiBpbmRleCBiOTQxNzZlMjViZTEuLjgwYjhkNDhlMWU0NiAxMDA2NDQKPiA+ID4gLS0tIGEv
YXJjaC9yaXNjdi9LY29uZmlnCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiBA
QCAtMjAzLDYgKzIwMyw3IEBAIGNvbmZpZyBDTEFOR19TVVBQT1JUU19EWU5BTUlDX0ZUUkFDRQo+
ID4gPiAgY29uZmlnIEdDQ19TVVBQT1JUU19EWU5BTUlDX0ZUUkFDRQo+ID4gPiAgICAgICBkZWZf
Ym9vbCBDQ19JU19HQ0MKPiA+ID4gICAgICAgZGVwZW5kcyBvbiAkKGNjLW9wdGlvbiwtZnBhdGNo
YWJsZS1mdW5jdGlvbi1lbnRyeT04KQo+ID4gPiArICAgICBkZXBlbmRzIG9uICQoY2Mtb3B0aW9u
LC1mbWluLWZ1bmN0aW9uLWFsaWdubWVudD00KSB8fCAhUklTQ1ZfSVNBX0MKPiA+Cj4gPiBQbGVh
c2UgdXNlIENDX0hBU19NSU5fRlVOQ1RJT05fQUxJR05NRU5UIChmcm9tIGFyY2gvS2NvbmZpZyks
IHdoaWNoCj4gPiBhbHJlYWR5IGNoZWNrcyBmb3Igc3VwcG9ydCBmb3IgdGhpcyBvcHRpb24uCj4K
PiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uIQo+Cj4gPgo+ID4gPiAgY29uZmlnIEhBVkVfU0hB
RE9XX0NBTExfU1RBQ0sKPiA+ID4gICAgICAgZGVmX2Jvb2wgJChjYy1vcHRpb24sLWZzYW5pdGl6
ZT1zaGFkb3ctY2FsbC1zdGFjaykKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZp
bGUgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gPiA+IGluZGV4IDA2ZGU5ZDM2NTA4OC4uNzQ2Mjhh
ZDhkY2Y4IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gPiA+ICsrKyBi
L2FyY2gvcmlzY3YvTWFrZWZpbGUKPiA+ID4gQEAgLTE0LDggKzE0LDEzIEBAIGVuZGlmCj4gPiA+
ICBpZmVxICgkKENPTkZJR19EWU5BTUlDX0ZUUkFDRSkseSkKPiA+ID4gICAgICAgTERGTEFHU192
bWxpbnV4ICs9IC0tbm8tcmVsYXgKPiA+ID4gICAgICAgS0JVSUxEX0NQUEZMQUdTICs9IC1EQ0Nf
VVNJTkdfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZCj4gPiA+ICtpZmVxICgkKENPTkZJR19DQ19J
U19DTEFORykseSkKPiA+Cj4gPiBTYW1lIGhlcmUsIHBsZWFzZSBpbnZlcnQgdGhpcyBhbmQgdXNl
Cj4gPgo+ID4gICBpZmRlZiBDT05GSUdfQ0NfSEFTX01JTl9GVU5DVElPTl9BTElHTk1FTlQKPiA+
Cj4gPiBsaWtlIHRoZSBtYWluIE1ha2VmaWxlIGRvZXMuCj4KPiBIb3BlIHRoaXMgbWFrZXMgc2Vu
c2UgdG8geW91LiBJIGFtIGdvaW5nIHRvIGFkZCB0aGUgZm9sbG93aW5nIGluIHJpc2N2IEtjb25p
ZzoKPgo+IHNlbGVjdCBGVU5DVElPTl9BTElHTk1FTlRfNEIgaWYgRFlOQU1JQ19GVFJBQ0UgJiYg
IVJJU0NWX0lTQV9DCgpUaGlzIHNob3VsZCBiZToKCnNlbGVjdCBGVU5DVElPTl9BTElHTk1FTlRf
NEIgaWYgRFlOQU1JQ19GVFJBQ0UgJiYgUklTQ1ZfSVNBX0MKCmFzIFJJU0NWX0lTQV9DID09IHkg
bWVhbnMgdGhhdCB0aGVyZSBhcmUgMkIgaW5zdHJ1Y3Rpb25zLiBJbiB0aGlzCmNhc2UsIGZ1bmN0
aW9ucyBjYW4gYmUgbm9uIDRCIGFsaWduZWQsIHNvIHdlIG5lZWQgdG8gZW5mb3JjZSB0aGUKYWxp
Z25tZW50IHJlcXVpcmVtZW50IGZyb20gdGhlIGNvbXBpbGVyLgoKPgo+IFNvIHdlIHdpbGwgbm90
IG5lZWQgYW55IG9mIHRoZXNlCj4KPiA+Cj4gPiA+ICsgICAgIGNmbGFnc19mdHJhY2VfYWxpZ24g
Oj0gLWZhbGlnbi1mdW5jdGlvbnM9NAo+ID4gPiArZWxzZQo+ID4gPiArICAgICBjZmxhZ3NfZnRy
YWNlX2FsaWduIDo9IC1mbWluLWZ1bmN0aW9uLWFsaWdubWVudD00Cj4gPiA+ICtlbmRpZgo+ID4g
PiAgaWZlcSAoJChDT05GSUdfUklTQ1ZfSVNBX0MpLHkpCj4gPiA+IC0gICAgIENDX0ZMQUdTX0ZU
UkFDRSA6PSAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT00Cj4gPiA+ICsgICAgIENDX0ZMQUdT
X0ZUUkFDRSA6PSAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT00ICQoY2ZsYWdzX2Z0cmFjZV9h
bGlnbikKPiA+ID4gIGVsc2UKPiA+ID4gICAgICAgQ0NfRkxBR1NfRlRSQUNFIDo9IC1mcGF0Y2hh
YmxlLWZ1bmN0aW9uLWVudHJ5PTIKPiA+ID4gIGVuZGlmCj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIu
NDMuMAo+ID4gPgo+ID4gPgo+Cj4gVGhhbmtzLAo+IEFuZHkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
