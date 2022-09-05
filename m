Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B06ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbi4CuagQ9f1eAY6z+Lbk4KTI2maAjejfqMx/SSRsmw=; b=ieKkrGtGtl3M1Z
	Zr+FoxNdKEdY2rreT8IM4fyATQu4OtA4sLK7cdoy1PSDsuTB/3YvyjAQFeJ5jRqfnkH+LWxHM31X7
	QbmFn05JENvlPoDGwE+z+cH7BXH56nyBWLhIBfPVQ+MjH7hKGWq155zaBxfwlQpFbg4N8Pe8sr9/2
	TGQFYl1++/VRTEw935Nve0N+ckQVFu4PxHTdPOLVDWAryc+xPO8ONJXClIzeI9GzB2/7NaxvO15JK
	vTZT/6cK9cJBw3ozlWkqNPcvq8m7nbtPga7Egb7q6jGXIB5hKkvru8kNEhod9ThO3QRte6R6q/eub
	ui3Xxr//9xXS5kYGB72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV950-00HT4N-LQ; Mon, 05 Sep 2022 10:11:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7YX-00Ekkf-OI; Mon, 05 Sep 2022 08:34:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B09161189;
	Mon,  5 Sep 2022 08:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFA7C433B5;
	Mon,  5 Sep 2022 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662366847;
	bh=MFwr+ylrLqHsUdJos34a0n+CwOKCUfeTFHhIzjgR+eQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j36VktyFiKHbg5ZEF7eYwQw14//bO1WbHu8aKGzTeWRY2j1Zt0QCjLlOkiP9s+DYN
	 56x38j43KsQwIm5I5734SyOvrRGvbdcy3709mYXgngkHE0GznBxnPOO0Pb6I5QV6gL
	 k6eraIABCQjLDq4W3clDn29nde1Lcb5JehshdjtMlSukBy6CUtdsHopsJ+df1pzB0S
	 leqQ1MkQ9MSzmQ82nHEidJ5l5tKuPVJxKfw6SCnFA3V77X4kTg5YTUM2IE3aMAyVb1
	 pzDYNpFf9Ar+yJ++X+4jR5k1kJkl1AdRkUNRq7N+0lV4qBpkoOHIBMNsGcarMxIIq4
	 1ZSsrLC67d8CA==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1272fc7f51aso6586323fac.12;
        Mon, 05 Sep 2022 01:34:07 -0700 (PDT)
X-Gm-Message-State: ACgBeo3+oxn0mv09ZAq4Ksb+TXvhIBimePmGBnuPswHm1tdnIvte4wyM
	mexCpAITU8Di0TGSrwQisYh0IXUSu//RL12wh6I=
X-Google-Smtp-Source: AA6agR5IglQGOyI7jNiRY0ei+A9SaaYr4Yxhd7s10i4P669D16mJGNnghE8P/xcvEucKgIbX3phIaTViycxWEFtW7D0=
X-Received: by 2002:a05:6870:7092:b0:11e:ff3a:d984 with SMTP id
 v18-20020a056870709200b0011eff3ad984mr8071019oae.19.1662366846586; Mon, 05
 Sep 2022 01:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220831175920.2806-1-jszhang@kernel.org> <20220831175920.2806-5-jszhang@kernel.org>
 <CAJF2gTQMM50TZZ95XOY+Rgvm2hZ3nLxkYfaSW_2MvPiJeqTtJw@mail.gmail.com> <YxWYh5C5swlyobi2@linutronix.de>
In-Reply-To: <YxWYh5C5swlyobi2@linutronix.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 5 Sep 2022 16:33:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
Message-ID: <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: add lazy preempt support
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
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

T24gTW9uLCBTZXAgNSwgMjAyMiBhdCAyOjM0IFBNIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IK
PGJpZ2Vhc3lAbGludXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiAyMDIyLTA5LTA0IDIzOjE2OjEy
IFsrMDgwMF0sIEd1byBSZW4gd3JvdGU6Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+ID4gPiBpbmRleCBiOWVk
YTNmY2JkNmQuLjU5NTEwMGE0YzJjNyAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvZW50cnkuUwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gPiA+IEBA
IC0zNjEsOSArMzYxLDE0IEBAIHJlc3RvcmVfYWxsOgo+ID4gPiAgcmVzdW1lX2tlcm5lbDoKPiA+
ID4gICAgICAgICBSRUdfTCBzMCwgVEFTS19USV9QUkVFTVBUX0NPVU5UKHRwKQo+ID4gPiAgICAg
ICAgIGJuZXogczAsIHJlc3RvcmVfYWxsCj4gPiA+IC0gICAgICAgUkVHX0wgczAsIFRBU0tfVElf
RkxBR1ModHApCj4gPiA+IC0gICAgICAgYW5kaSBzMCwgczAsIF9USUZfTkVFRF9SRVNDSEVECj4g
PiA+ICsgICAgICAgUkVHX0wgczEsIFRBU0tfVElfRkxBR1ModHApCj4gPiA+ICsgICAgICAgYW5k
aSBzMCwgczEsIF9USUZfTkVFRF9SRVNDSEVECj4gPiA+ICsgICAgICAgYm5leiBzMCwgMWYKPiA+
ID4gKyAgICAgICBSRUdfTCBzMCwgVEFTS19USV9QUkVFTVBUX0xBWllfQ09VTlQodHApCj4gPiA+
ICsgICAgICAgYm5leiBzMCwgcmVzdG9yZV9hbGwKPiA+ID4gKyAgICAgICBhbmRpIHMwLCBzMSwg
X1RJRl9ORUVEX1JFU0NIRURfTEFaWQo+ID4gQ2FuIHlvdSB0ZWxsIG1lLCB3aG8gaW5jcmVhc2Vk
L2RlY3JlYXNlZCB0aGUgUFJFRU1QVF9MQVpZX0NPVU5UPyBBbmQKPiA+IHdobyBzZXQgTkVFRF9S
RVNDSEVEX0xBWlk/Cj4KPiBUaGVyZSBpcyAiZ2VuZXJpYyIgY29kZSBpbiB0aGUgUFJFRU1QVF9S
VCBwYXRjaCBkb2luZyB0aGF0LiBUaGUgY291bnRlcgo+IGlzIGluY3JlbWVudGVkLyBkZWNyZW1l
bnRlZCB2aWEgcHJlZW1wdF9sYXp5X2VuYWJsZSgpL2Rpc2FibGUoKSBhbmQgb25lCj4gb2YgdGhl
IHVzZXIgaXMgbWlncmF0ZV9kaXNhYmxlKCkvZW5hYmxlKCkuCj4gQmFzaWNhbGx5IGlmIGEgdGFz
ayBpcyB0YXNrX2lzX3JlYWx0aW1lKCkgdGhlbiBORUVEX1JFU0NIRUQgaXMgc2V0IGZvcgo+IHRo
ZSB3YWtldXAuIEZvciB0aGUgcmVtYWluaW5nIHN0YXRlcyAoU0NIRURfT1RIRVIsIOKApikgTkVF
RF9SRVNDSEVEX0xBWlkKPiBpcyBzZXQgZm9yIHRoZSB3YWtldXAuIFRoaXMgY2FuIGJlIGRlbGF5
ZWQgaWYgdGhlIHRhc2sgaXMgaW4gYSAicHJlZW1wdAo+IGRpc2FibGUgbGF6eSIgc2VjdGlvbiAo
c2ltaWxhciB0byBhIHByZWVtcHRfZGlzYWJsZSgpIHNlY3Rpb24pIGJ1dCBhCj4gdGFza19pc19y
ZWFsdGltZSgpIGNhbiBzdGlsbCBiZSBzY2hlZHVsZWQgaWYgbmVlZGVkLgpPa2F5LCBJdCBzaG91
bGQgYmUgW1BBVENIIFJUXS4gUklTQy1WIHdvdWxkIGFsc28gbW92ZSB0byBHRU5FUklDX0VOVFJZ
ClsxXSwgc28gYWJvdmUgYXNzZW1ibHkgY29kZSB3b3VsZCBiZSByZXBsYWNlZCBieSBnZW5lcmlj
IG9uZSwgcmlnaHQ/CgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIw
MjIwOTA0MDcyNjM3Ljg2MTktMy1ndW9yZW5Aa2VybmVsLm9yZy9ULyN1CgoKPiBTZWUgZGV0YWls
cyBhdAo+ICAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvcnQvbGludXgtcnQtZGV2ZWwuZ2l0L3BsYWluL3BhdGNoZXMvc2NoZWRfX0FkZF9zdXBw
b3J0X2Zvcl9sYXp5X3ByZWVtcHRpb24ucGF0Y2g/aD1saW51eC02LjAueS1ydC1wYXRjaGVzCgoK
Pgo+IFNlYmFzdGlhbgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
