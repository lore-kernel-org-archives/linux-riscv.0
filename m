Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB95C388F7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 02:57:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5DE2068E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 02:57:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jo2oSxCy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TF7x00Zg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D5DE2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d8mxc0m8umY80EzFTeFhNLbaDotd2plm/R05xpMFAos=; b=Jo2oSxCy6He1jo/td1XqGYtWk
	ZhFNenFnJNyazMesx80Ro4w8/CyPFkjdFlJXHzXwRv7ownp7Ae3/NrJ+XbMgyxkY6+2h8F2kqx9+X
	c2fmmLhXv66EaVvKLZ6i9eTFskhHFFr8BqIluIyzZ57lXyypW9wsnWq1IwESBFd9wPn/ukCC7Yls4
	pRo2cTF1AjnZ3+y03SRk9HcFYoRuXxp7KT+7TZ2Ao2P8o5P5L+Dm3BIHqFWwbkF1Io8Kd8gVStyVD
	LjEq86iVxner2f6VLciaAEMBFAgge+gHSA0Rl9rh5Lz3xoll7arOBDaJbeD4nVMwe52q8WPqn4boX
	0nvOMES0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1karw8-0004Ws-5S; Fri, 06 Nov 2020 02:57:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1karw5-0004Vt-63
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 02:57:10 +0000
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C842720B80
 for <linux-riscv@lists.infradead.org>; Fri,  6 Nov 2020 02:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604631428;
 bh=9rQRIBsHfZeDxfMqnHjDf3pUoaqjw7mhb/AQ10vMDoY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TF7x00ZgQVa4HaGnSQPmDiTyB8y+VIQoCzJV3YdhsaaRLyFkTM9ISom0fByffhcI1
 pBZBzMw9pSGGggy6eUaKobaD6IWzYqTcZEfnah5VBBFPN+U/8aODKos2zvTkGnE6/X
 iTrY+Q7WCTabdB4kIhBAdrrlNJU9vVaKgMtfmRRU=
Received: by mail-lj1-f170.google.com with SMTP id v19so3779838lji.5
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 18:57:07 -0800 (PST)
X-Gm-Message-State: AOAM533ECvxjufRHzwINLUQKMiJnxU3qXHjdIRQNulakP0f6TsWNWaOA
 /guzq3pRDkdMd5+gS/rWBmDopdZUVV7+xgcRBm0=
X-Google-Smtp-Source: ABdhPJyS549mSsbY71592hwkiYhz+BcFJErkk2ka5vmMUXvgndKh9GeAWhQ5JZMC4w2XtW9dc3WPYMqmypHc7huC/0s=
X-Received: by 2002:a2e:8816:: with SMTP id x22mr1814521ljh.377.1604631425962; 
 Thu, 05 Nov 2020 18:57:05 -0800 (PST)
MIME-Version: 1.0
References: <1602918377-23573-6-git-send-email-guoren@kernel.org>
 <mhng-7d7afc22-b857-4f64-868e-0c7aad7f8f6a@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-7d7afc22-b857-4f64-868e-0c7aad7f8f6a@palmerdabbelt-glaptop1>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Nov 2020 10:56:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSWubMT3hk4pMg5my9=6G+U+8+Wx_Hzud+rxLgn6Ah6kw@mail.gmail.com>
Message-ID: <CAJF2gTSWubMT3hk4pMg5my9=6G+U+8+Wx_Hzud+rxLgn6Ah6kw@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] riscv: Add kprobes supported
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_215709_411019_5F15C6AD 
X-CRM114-Status: GOOD (  21.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Alan Kao <alankao@andestech.com>,
 Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-csky@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Bjorn Topel <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBOb3YgNiwgMjAyMCBhdCA5OjAyIEFNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJi
ZWx0QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCAxNyBPY3QgMjAyMCAwMDowNjoxMyBQ
RFQgKC0wNzAwKSwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxn
dW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gVGhpcyBwYXRjaCBlbmFibGVzICJrcHJv
YmUgJiBrcmV0cHJvYmUiIHRvIHdvcmsgd2l0aCBmdHJhY2UKPiA+IGludGVyZmFjZS4gSXQgdXRp
bGl6ZWQgc29mdHdhcmUgYnJlYWtwb2ludCBhcyBzaW5nbGUtc3RlcAo+ID4gbWVjaGFuaXNtLgo+
ID4KPiA+IFNvbWUgaW5zdHJ1Y3Rpb25zIHdoaWNoIGNhbid0IGJlIHNpbmdsZS1zdGVwIGV4ZWN1
dGVkIG11c3QgYmUKPiA+IHNpbXVsYXRlZCBpbiBrZXJuZWwgZXhlY3V0aW9uIHNsb3QsIHN1Y2gg
YXM6IGJyYW5jaCwgamFsLCBhdWlwYywKPiA+IGxhIC4uLgo+ID4KPiA+IFNvbWUgaW5zdHJ1Y3Rp
b25zIHNob3VsZCBiZSByZWplY3RlZCBmb3IgcHJvYmluZyBhbmQgd2UgdXNlIGEKPiA+IGJsYWNr
bGlzdCB0byBmaWx0ZXIsIHN1Y2ggYXM6IGVjYWxsLCBlYnJlYWssIC4uLgo+ID4KPiA+IFdlIHVz
ZSBlYnJlYWsgJiBjLmVicmVhayB0byByZXBsYWNlIG9yaWdpbiBpbnN0cnVjdGlvbiBhbmQgdGhl
Cj4gPiBrcHJvYmUgaGFuZGxlciBwcmVwYXJlcyBhbiBleGVjdXRhYmxlIG1lbW9yeSBzbG90IGZv
ciBvdXQtb2YtbGluZQo+ID4gZXhlY3V0aW9uIHdpdGggYSBjb3B5IG9mIHRoZSBvcmlnaW5hbCBp
bnN0cnVjdGlvbiBiZWluZyBwcm9iZWQuCj4gPiBJbiBleGVjdXRpb24gc2xvdCB3ZSBhZGQgZWJy
ZWFrIGJlaGluZCBvcmlnaW5hbCBpbnN0cnVjdGlvbiB0bwo+ID4gc2ltdWxhdGUgYSBzaW5nbGUt
c2V0cCBtZWNoYW5pc20uCj4gPgo+ID4gVGhlIHBhdGNoIGlzIGJhc2VkIG9uIHBhY2tpJ3Mgd29y
ayBbMV0gYW5kIGNza3kncyB3b3JrIFsyXS4KPiA+ICAtIFRoZSBrcHJvYmVzX3RyYW1wb2xpbmUu
UyBpcyBhbGwgZnJvbSBwYWNraSdzIHBhdGNoCj4gPiAgLSBUaGUgc2luZ2xlLXN0ZXAgbWVjaGFu
aXNtIGlzIG5ldyBkZXNpZ25lZCBmb3IgcmlzY3Ygd2l0aG91dCBodwo+ID4gICAgc2luZ2xlLXN0
ZXAgdHJhcAo+ID4gIC0gVGhlIHNpbXVsYXRpb24gY29kZXMgYXJlIGZyb20gY3NreQo+ID4gIC0g
RnJhbmtseSwgYWxsIGNvZGVzIHJlZmVyIHRvIG90aGVyIGFyY2hzJyBpbXBsZW1lbnRhdGlvbgo+
ID4KPiA+ICBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAxODExMTMx
OTU4MDQuMjI4MjUtMS1tZUBwYWNraS5jaC8KPiA+ICBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtY3NreS8yMDIwMDQwMzA0NDE1MC4yMDU2Mi05LWd1b3JlbkBrZXJuZWwub3JnLwo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4K
PiA+IENvLURldmVsb3BlZC1ieTogUGF0cmljayBTdMOkaGxpbiA8bWVAcGFja2kuY2g+Cj4KPiBD
aGVja3BhdGNoIHNheXMKPgo+ICAgICBXQVJOSU5HOiAnQ28tZGV2ZWxvcGVkLWJ5OicgaXMgdGhl
IHByZWZlcnJlZCBzaWduYXR1cmUgZm9ybQo+ICAgICAjMTA4Ogo+ICAgICBDby1EZXZlbG9wZWQt
Ynk6IFBhdHJpY2sgU3TDpGhsaW4gPG1lQHBhY2tpLmNoPgo+Cj4gICAgIFdBUk5JTkc6IENvLWRl
dmVsb3BlZC1ieTogbXVzdCBiZSBpbW1lZGlhdGVseSBmb2xsb3dlZCBieSBTaWduZWQtb2ZmLWJ5
Ogo+ICAgICAjMTA4Ogo+ICAgICBDby1EZXZlbG9wZWQtYnk6IFBhdHJpY2sgU3TDpGhsaW4gPG1l
QHBhY2tpLmNoPgo+ICAgICBBY2tlZC1ieTogTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2Vy
bmVsLm9yZz4KPgo+IFRoZXJlJ3Mgc29tZSBvdGhlciBjaGVja3BhdGNoIHdhcm5pbmdzIHRocm91
Z2hvdXQgdGhlIHBhdGNoIHNldCwgYnV0IHRoaXMgaXMKPiBvbmUgSSdtIG5vdCBzdXBwb3NlZCB0
byBmaXggdXAuICBDYW4gb25lIG9mIHlvdSByZS1wb3N0IHRoZSBwYXRjaGVzIHdpdGggdGhlCj4g
Y29ycmVjdCBEQ08/Ck9rLCBJJ2xsIGZpeCBpdCB1cCBpbiBWNSBhbmQgcmViYXNlIDUuMTAtcmMy
CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtY3NreS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
