Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6376ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 01:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NCuxXbHWvv3A46Idb4KTa7Ns+bviJ2yT5/1me3m9XY=; b=GVlXSv2koAGhw0
	9idEfyoV8XZYm7rGnr3eeeZxMUmTGgHXXVCUA14kREGrUjzoQhwGcMOmk+s0daezIdo8klA3X1xt0
	9vreBgcycbAYLnWl8buQw7m9p/mHjPyMq996vQ0pP+XSVaoYGuinPSKvJ4wRPcmKPzRZAAHSAY1S+
	IC9nfI4FDuFXnrDeYg2Bi98wFW90vWDj8yNSIMnklvd7Vg2JKlRXSynMG4dZHH3b6yTE1RfvDptwX
	d4ZnD0LzjhIozX1pwpt1ZEVtZkll1jWTaC/bRMFgDF6F3dX1mALEaqUWwg9XiOfcJJqNXMlCXM7yR
	xTMwtOSJgJ3DRm6Vh/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNfW-001Rsr-KD; Tue, 06 Sep 2022 01:46:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNfU-001Rqn-3X; Tue, 06 Sep 2022 01:46:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B794F61242;
	Tue,  6 Sep 2022 01:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96344C43141;
	Tue,  6 Sep 2022 01:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662428778;
	bh=xs4xCHPpRTSPH1q5xqbVYT0d5Xh7RHhnV/wtT03qh9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bm0qjyC2t9TwGwEG24yn5DgveTfSTLhfHEAIhHPyWVHs5IujJtgloa9bLyT8PGsAp
	 Y2deaM+vuMaSfJUUuZN2olk2QgX7fzARBfTeAxI3+k3ofdvt7yKL8sZS/72uEVa6UP
	 mfnVNtMossvMA9z5Eu11si7P1+lWKTHWiTu0WeS8i8QmUdgevP4vCX8I0t93Bz0ZaQ
	 UpBBSDjZ2IlRa9BKft/sfJEafi2pHU7RrmdimbnyrGWpORCOweKwcgoyu5acYCGJGX
	 otwfmTxF0tCSpmlp3q1lKLTZXTHcA+HvF+A0689X4Lq0bQ81E3KJocAjy1lsZhk6D+
	 8iW7KwNrfFFgw==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1279948d93dso5165363fac.10;
        Mon, 05 Sep 2022 18:46:18 -0700 (PDT)
X-Gm-Message-State: ACgBeo2tCC0Vg/IEGkdeSoW5B3jkwQhdw6I2wHP2k0C1ZbglvDKguJaX
	WiujP4DZB7Ai5dTUYeKLc+LhNNfhfhcajEwxVis=
X-Google-Smtp-Source: AA6agR7rQMCHzliXpvc366478Lt3HDQkS0AJxe6688qZr6jFNV0WLHEbuu6BgOf1F0gYkq5AKEjr6QkCE3JufBBZ0vk=
X-Received: by 2002:a05:6870:c596:b0:101:6409:ae62 with SMTP id
 ba22-20020a056870c59600b001016409ae62mr10373144oab.112.1662428777684; Mon, 05
 Sep 2022 18:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220831175920.2806-1-jszhang@kernel.org> <20220831175920.2806-5-jszhang@kernel.org>
 <CAJF2gTQMM50TZZ95XOY+Rgvm2hZ3nLxkYfaSW_2MvPiJeqTtJw@mail.gmail.com>
 <YxWYh5C5swlyobi2@linutronix.de> <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
 <YxW3cZEhEideZon2@linutronix.de>
In-Reply-To: <YxW3cZEhEideZon2@linutronix.de>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Sep 2022 09:46:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSuLNxUD=Kdn+3o6Jj_bv+X4pntvUHCsXXD5AgcVjj0pQ@mail.gmail.com>
Message-ID: <CAJF2gTSuLNxUD=Kdn+3o6Jj_bv+X4pntvUHCsXXD5AgcVjj0pQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: add lazy preempt support
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_184624_246703_3248DD6B 
X-CRM114-Status: GOOD (  18.55  )
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

T24gTW9uLCBTZXAgNSwgMjAyMiBhdCA0OjQ2IFBNIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IK
PGJpZ2Vhc3lAbGludXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiAyMDIyLTA5LTA1IDE2OjMzOjU0
IFsrMDgwMF0sIEd1byBSZW4gd3JvdGU6Cj4gPiA+IFRoZXJlIGlzICJnZW5lcmljIiBjb2RlIGlu
IHRoZSBQUkVFTVBUX1JUIHBhdGNoIGRvaW5nIHRoYXQuIFRoZSBjb3VudGVyCj4gPiA+IGlzIGlu
Y3JlbWVudGVkLyBkZWNyZW1lbnRlZCB2aWEgcHJlZW1wdF9sYXp5X2VuYWJsZSgpL2Rpc2FibGUo
KSBhbmQgb25lCj4gPiA+IG9mIHRoZSB1c2VyIGlzIG1pZ3JhdGVfZGlzYWJsZSgpL2VuYWJsZSgp
Lgo+ID4gPiBCYXNpY2FsbHkgaWYgYSB0YXNrIGlzIHRhc2tfaXNfcmVhbHRpbWUoKSB0aGVuIE5F
RURfUkVTQ0hFRCBpcyBzZXQgZm9yCj4gPiA+IHRoZSB3YWtldXAuIEZvciB0aGUgcmVtYWluaW5n
IHN0YXRlcyAoU0NIRURfT1RIRVIsIOKApikgTkVFRF9SRVNDSEVEX0xBWlkKPiA+ID4gaXMgc2V0
IGZvciB0aGUgd2FrZXVwLiBUaGlzIGNhbiBiZSBkZWxheWVkIGlmIHRoZSB0YXNrIGlzIGluIGEg
InByZWVtcHQKPiA+ID4gZGlzYWJsZSBsYXp5IiBzZWN0aW9uIChzaW1pbGFyIHRvIGEgcHJlZW1w
dF9kaXNhYmxlKCkgc2VjdGlvbikgYnV0IGEKPiA+ID4gdGFza19pc19yZWFsdGltZSgpIGNhbiBz
dGlsbCBiZSBzY2hlZHVsZWQgaWYgbmVlZGVkLgo+ID4gT2theSwgSXQgc2hvdWxkIGJlIFtQQVRD
SCBSVF0uIFJJU0MtViB3b3VsZCBhbHNvIG1vdmUgdG8gR0VORVJJQ19FTlRSWQo+ID4gWzFdLCBz
byBhYm92ZSBhc3NlbWJseSBjb2RlIHdvdWxkIGJlIHJlcGxhY2VkIGJ5IGdlbmVyaWMgb25lLCBy
aWdodD8KPgo+IGNvcnJlY3QuCk1heWJlIFRJRl9YWFhfUkVTQ0hFRCBhbHNvIGNvdWxkIGJlIG1l
cmdlZCBpbnRvIEdFTkVSSUNfRU5UUlksIGp1c3QKbGlrZSB3aGF0IHlvdSd2ZSBkb25lIGluIHN5
c2NhbGwuCgpzdHJ1Y3QgdGhyZWFkX2luZm8gewogICAgICAgICAgdW5zaWduZWQgbG9uZyAgICAg
ICAgICAgZmxhZ3M7CiAgICAgICAgICB1bnNpZ25lZCBsb25nICAgICAgICAgICBzeXNjYWxsX3dv
cms7ICAgLyogU1lTQ0FMTF9XT1JLXyBmbGFncyAqLworICAgICAgICB1bnNpZ25lZCBsb25nICAg
ICAgICAgICByZXNjaGVkX3dvcms7ICAgLyogUkVTQ0hFRCBmbGFncyAqLwoKT3IgbWVyZ2UgdGhl
bSBpbnRvIG9uZToKc3RydWN0IHRocmVhZF9pbmZvIHsKICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ICAgICAgICAgIGZsYWdzOwotICAgICAgICAgdW5zaWduZWQgbG9uZyAgICAgICAgICAgc3lzY2Fs
bF93b3JrOyAgIC8qIFNZU0NBTExfV09SS18gZmxhZ3MgKi8KKyAgICAgICAgIHVuc2lnbmVkIGxv
bmcgICAgICAgICAgIGdlX2ZsYWdzOyAvKiBHRU5FUklDX0VOVFJZIGZsYWdzICovCgo+Cj4gU2Vi
YXN0aWFuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
