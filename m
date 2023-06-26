Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC41AEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 17:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SESqkM7+axLChT45+vsDo6unjtbxKpXNzaGxSFXMII=; b=OpCjvRuBhYM1kP
	JwD89n6DcT2vfcxSGZJu27jG1TqU0E8fbZEqpRsBvvtVj9vK7UR71WYtsb/2NQGf99IZ9R1xE/gU7
	o1F9YVZ9M4SnQMbAJLRw0jbOwrRIBoPtrqPWYzBAwaiVpORkZDm93sSDIooLorXsEHVXUlx7Vgjmn
	Iv/VwG1MLKJspAmOhjrqCK3uIeM5Dff1WmwJuNRvCEOLMCl62Nsw+vhZmEdGeh69N2nW6/a9cuKpp
	bpZZeSN7WGBMA1py11FxtWh4YUMP5mAblOzA9SgKTOcHrOdw1rYSiHSMBy5gYRtbvWIax+gE6miyJ
	wlxGhXlwKw5ska56ApIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDqKd-00An19-2g;
	Mon, 26 Jun 2023 17:48:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDqKa-00An00-1y;
	Mon, 26 Jun 2023 17:48:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 037DD60F16;
	Mon, 26 Jun 2023 17:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E40DC433CC;
	Mon, 26 Jun 2023 17:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687801731;
	bh=fFWuzhLLiGkinhaWeToFLkDX/dcx5OWER83aW8VgRow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qn7TSH5fBy879Kn45s8a/YCOEx1oTS+0VCd/Q+kNmCB7uRTTg7TK3CW2K5FgKL5SO
	 RoBVKuhnNkjoWxoU5K2xmCMLOL3TePePVRvun87gj3KrTnQpXgAMXLWOX/L2U+vGMb
	 wy6CqBDWmWhCmphC6Q8EiBNziTaMXriaczMp6DJiN1Ej/WUjTzJ6N+lvXogj4eiJcj
	 PJKRTqLP+Zecd+1KGIrC38/JsFePpZ84jlJVtuUPeUpe+0KdJssjei1KlWQsAb8xqI
	 wX+VWs0F7zWSqHLgR+NZLp09+VOq+k1qPrGR83NuByW+4SQgicdeCKOv73ZNgnYywR
	 IXCdgqJe6fP2Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f86e6e4038so4440540e87.0;
        Mon, 26 Jun 2023 10:48:51 -0700 (PDT)
X-Gm-Message-State: AC+VfDwSf78pZy7l7EGYySnYeATQ/+IxRRERW6z6xJsT5pqDUn2bfGvw
	vJg8m4mPfrXbbFgxagZ1WhL0ydtSo6eamIpPlEY=
X-Google-Smtp-Source: ACHHUZ6w6e1OYy7QM9S+YTdK71Dx4cd9s642AcRaJSfPZb8UXF8n/hvi2zuHhdV8C7DcTgUpaxVtcUwpuH0YchvBFOg=
X-Received: by 2002:a19:5f5d:0:b0:4f8:5e62:b94b with SMTP id
 a29-20020a195f5d000000b004f85e62b94bmr8655403lfj.9.1687801729333; Mon, 26 Jun
 2023 10:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com> <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com> <20230625161417.GK52412@kernel.org>
 <ZJmFFmexl_1GUhIL@FVFF77S0Q05N>
In-Reply-To: <ZJmFFmexl_1GUhIL@FVFF77S0Q05N>
From: Song Liu <song@kernel.org>
Date: Mon, 26 Jun 2023 10:48:37 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4pDkd7rCWRM6938ve36rfhGxyu=8t1-GjcKnNajofpQA@mail.gmail.com>
Message-ID: <CAPhsuW4pDkd7rCWRM6938ve36rfhGxyu=8t1-GjcKnNajofpQA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
To: Mark Rutland <mark.rutland@arm.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andy Lutomirski <luto@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Puranjay Mohan <puranjay12@gmail.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, 
	"the arch/x86 maintainers" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_104852_755272_C0A9ECF7 
X-CRM114-Status: GOOD (  17.01  )
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

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgNTozMeKAr0FNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRs
YW5kQGFybS5jb20+IHdyb3RlOgo+ClsuLi5dCj4gPgo+ID4gU28gdGhlIGlkZWEgd2FzIHRoYXQg
aml0X3RleHRfYWxsb2MoKSB3aWxsIGhhdmUgYSBjYWNoZSBvZiBsYXJnZSBwYWdlcwo+ID4gbWFw
cGVkIFJPWCwgd2lsbCBhbGxvY2F0ZSBtZW1vcnkgZnJvbSB0aG9zZSBjYWNoZXMgYW5kIHRoZXJl
IHdpbGwgYmUKPiA+IGppdF91cGRhdGUoKSB0aGF0IHVzZXMgdGV4dCBwb2tpbmcgZm9yIHdyaXRp
bmcgdG8gdGhhdCBtZW1vcnkuCj4gPgo+ID4gVXBvbiBhbGxvY2F0aW9uIG9mIGEgbGFyZ2UgcGFn
ZSB0byBpbmNyZWFzZSB0aGUgY2FjaGUsIHRoYXQgbGFyZ2UgcGFnZSB3aWxsCj4gPiBiZSAiaW52
YWxpZGF0ZWQiIGJ5IGZpbGxpbmcgaXQgd2l0aCBicmVha3BvaW50IGluc3RydWN0aW9ucyAoZS5n
IGludDMgb24KPiA+IHg4NikKPgo+IERvZXMgdGhhdCB3b3JrIG9uIHg4Nj8KPgo+IFRoYXQgaXMg
aW4gbm8gd2F5IGdhdXJhbnRlZWQgZm9yIG90aGVyIGFyY2hpdGVjdHVyZXM7IG9uIGFybTY0IHlv
dSBuZWVkCj4gZXhwbGljaXQgY2FjaGUgbWFpbnRlbmFuY2UgKHdpdGggSS1jYWNoZSBtYWludGVu
YW5jZSBhdCB0aGUgVkEgdG8gYmUgZXhlY3V0ZWQKPiBmcm9tKSBmb2xsb3dlZCBieSBjb250ZXh0
LXN5bmNocm9uaXphdGlvbi1ldmVudHMgKGUuZy4gdmlhIElTQiBpbnN0cnVjdGlvbnMsIG9yCj4g
SVBJcykuCgpJIGd1ZXNzIHdlIG5lZWQ6CjEpIEludmFsaWRhdGUgdW51c2VkIHBhcnQgb2YgdGhl
IGh1Z2UgUk9YIHBhZ2VzOwoyKSBEbyBub3QgcHV0IHR3byBqaXQgdXNlcnMgKGluY2x1ZGluZyBt
b2R1bGUgdGV4dCwgYnBmLCBldGMuKSBpbiB0aGUKc2FtZSBjYWNoZSBsaW5lOwozKSBFeHBsaWNp
dCBjYWNoZSBtYWludGVuYW5jZTsKNCkgY29udGV4dC1zeW5jaHJvbml6YXRpb24tZXZlbnRzLgoK
V291bGQgdGhlc2UgKG9yIGEgc3Vic2V0IG9mIHRoZW0pIGJlIHN1ZmZpY2llbnQgdG8gcHJvdGVj
dCB1cyBmcm9tIHRvcm4gcmVhZD8KClRoYW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
