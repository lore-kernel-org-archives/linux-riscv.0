Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08913C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzbV/ZVo4hmrKvQs8ibrE5AwHRat2tAg2kQuRo1MrbI=; b=td3VOq112Mb1mw
	NWY+9zHqHOfKvv5AM71OIJ+Xjx9+isVOKMa44F6kpGimmpAeW1xkyyqU1yq36qWGR6VRCTrZOrT6T
	wnU4+keChdvkHXhhoyHiuULI7/ulZiXoLiPimEccwB1NfcsiaL768LBabh12pl9s5fYxnEX9Jahnk
	SUgQoKiX32sBG0MScCsTEvBLqn7CgRoqlxLPry6Qx2nBEubOBJtehWtx6qd5pbrcIT2O3x4HcaBno
	iLvY2ziklcFljAi540jjqsbSiXFXDxUriqCDPpSQBtPLHZHHT/ju0jeZzjG4K798m0bqb82Mui7DM
	jk+LKb3MoQSDkPMB+aBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjb3P-00000000dEW-1FzJ;
	Mon, 11 Mar 2024 08:30:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjb3L-00000000dDy-3GPM
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 08:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E851C60C8E
	for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 08:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D8BC43394
	for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710145833;
	bh=Er7u94lEpOjZccaFLo8IEx4UWBeOB3xvtiaJHH5y0kc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DKrG7jAR3P55e9l6jgt9O54meqHayrCq+IQ2eoU62+DiT30w6Z/x99POp8UBCjRpz
	 nAu+ps5ITd5TDtKIzs/7L/iFSphhMAr02ROTmGahTbZKArBPPOUW9GG3onsQIYU7o7
	 MGrun8GNK1vE5IpQP0txVCPVKt3bCBJPTp8OYV/qlRLhlah/waApNSR6tvbK09wnlF
	 yCSFPHS8kV8CTWQbyVG5dkuBW0fUCDhgCLXhMvkmRTM9GITv7e/VPQx7dk/TjEd9+D
	 T6g/kH/pGkh/ondcOpWYSR0pspTcD9ZxhL+PRKUeSoV8iO/Znpw6Mn8GTGhxq3YyjT
	 L+3wRQYWP5ePg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5683093ffbbso3832682a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 01:30:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpysh+engjpnNj7A1dBtxnX4gYVX58OcLMCfwF7y5nVDKuw8keFW8QTBQblAGKNNazHk2u413Mt1xfzrvURMCGZJ+sgc0ZH1I3swt8zuCW
X-Gm-Message-State: AOJu0YzIY2uucgDC296ZlVl/04U+JrFGl8FfevhWJ9VEnnuN2TkUtQaM
	rrriwTroIKJ0Zn2bFTdXy8ZrGS0FIvlQ5ogQ8VR28R6pDe1+R3EHG3iMOqwNzHuCDC/+Pfi+Gev
	DPrZQrwalqM3S8bxODFTO3tthDxI=
X-Google-Smtp-Source: AGHT+IGD+aDotYFoArTsKtHpncg5YCd2NNMm+WJKWQ1gs9/zzlwEd53qNb/yIsFJYQWDyWJaSXUefHx/+VztyLOvHHA=
X-Received: by 2002:a50:c90d:0:b0:567:e0eb:c9d1 with SMTP id
 o13-20020a50c90d000000b00567e0ebc9d1mr3892576edh.36.1710145832109; Mon, 11
 Mar 2024 01:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240310112129.376134-1-shorne@gmail.com>
In-Reply-To: <20240310112129.376134-1-shorne@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 11 Mar 2024 16:30:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTQejVrTE5P+snObx=+hV9Chzfk4h6i73Mm9g3b4BU7uQ@mail.gmail.com>
Message-ID: <CAJF2gTTQejVrTE5P+snObx=+hV9Chzfk4h6i73Mm9g3b4BU7uQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Remove unused asm/signal.h file
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_013035_887480_E8595F8A 
X-CRM114-Status: GOOD (  15.66  )
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

T24gU3VuLCBNYXIgMTAsIDIwMjQgYXQgNzoyMeKAr1BNIFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVA
Z21haWwuY29tPiB3cm90ZToKPgo+IFdoZW4gcmlzY3YgbW92ZWQgdG8gY29tbW9uIGVudHJ5IHRo
ZSBkZWZpbml0aW9uIGFuZCB1c2FnZSBvZgo+IGRvX3dvcmtfcGVuZGluZyB3YXMgcmVtb3ZlZC4g
IFRoaXMgdW51c2VkIGhlYWRlciBmaWxlIHJlbWFpbnMuCj4KPiBSZW1vdmUgdGhlIGhlYWRlciBm
aWxlIGFzIGl0IGlzIG5vdCB1c2VkLgo+Cj4gSSBoYXZlIHRlc3RlZCBjb21waWxpbmcgdGhlIGtl
cm5lbCB3aXRoIHRoaXMgcGF0Y2ggYXBwbGllZCBhbmQgc2F3IG5vCj4gaXNzdWVzLiAgTm90aWNl
ZCB3aGVuIGF1ZGl0aW5nIGhvdyBkaWZmZXJlbnQgcG9ydHMgaGFuZGxlIHNpZ25hbHMKPiByZWxh
dGVkIHRvIHNhdmluZyBGUFUgc3RhdGUuCj4KPiBGaXhlczogZjBiZGRmNTA1ODZkICgicmlzY3Y6
IGVudHJ5OiBDb252ZXJ0IHRvIGdlbmVyaWMgZW50cnkiKQo+IFNpZ25lZC1vZmYtYnk6IFN0YWZm
b3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NpZ25hbC5oIHwgMTIgLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBkZWxl
dGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2ln
bmFsLmgKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NpZ25hbC5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zaWduYWwuaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDk1NmFlMGEwMWJhZC4uMDAwMDAwMDAwMDAwCj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zaWduYWwuaAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwxMiArMCwwIEBACj4g
LS8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8KPiAtCj4gLSNpZm5k
ZWYgX19BU01fU0lHTkFMX0gKPiAtI2RlZmluZSBfX0FTTV9TSUdOQUxfSAo+IC0KPiAtI2luY2x1
ZGUgPHVhcGkvYXNtL3NpZ25hbC5oPgo+IC0jaW5jbHVkZSA8dWFwaS9hc20vcHRyYWNlLmg+Cj4g
LQo+IC1hc21saW5rYWdlIF9fdmlzaWJsZQo+IC12b2lkIGRvX3dvcmtfcGVuZGluZyhzdHJ1Y3Qg
cHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyB0aHJlYWRfaW5mb19mbGFncyk7Ck5vIG1vcmUg
Y2FsbGluZyBpbiBhcmNoL3Jpc2N2IGZvciBkb193b3JrX3BlbmRpbmcuCgo+IC0KPiAtI2VuZGlm
Cj4gLS0KPiAyLjQxLjAKPgpMR1RNLCBUaHguCgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
