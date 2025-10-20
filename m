Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415D2CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 06:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNftbqceVEb4uaMHQT0PLnSkxOqRFH6vwdK0ppz9i/E=; b=AUtFjCpobtCiLH
	PtxqLkh6+zMQPI98qNwHTzWhO62d68zicl0YsmIy4119hMM65pNMvA7En27j9k/zpCc9IHnJIqvAf
	StF6MhULXS8oDxbpBFT/nMmqB78I/Q22fufI3q1qFEYC5QFbY6jnQEwsrnBzOP5v4G5FMj9iIA7ca
	ke5DI6A3RTiSr/L4rwnC3BzR/R7F9PGyzoL1GockCZpRkkubLPysaiSHrcF7LkAXZlWmX5N5f5qX6
	4TPLuDn+idymZJSocDF9W4HzhQhEfcut6u3/sXiGf//h0CU0n9sDloUrulTyZlPsjD8aw3ldRg8wv
	t0FyUeaLwYAKzmsTh06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoM-0000000C6L0-1ztS;
	Mon, 20 Oct 2025 06:56:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoH-0000000C6Hi-2qHr
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 06:56:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96D4B44ACC
	for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 06:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770FBC4CEF9
	for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 06:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760943360;
	bh=gjo/6Sjyy4wzQdCVDI4toDbmg3rq4WBazYvMUGXP+aM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CdtgZxUDHqA2aG2niIUkozRqTfns5dsoCNeI5jiz0zWkdjP9k7J7ewWaMO8m+XKNT
	 zuEtqYS65zfSD0GX2zxkVJBSYAR3n9y3JlQMYKx2kvHJq2zFzVw/IH4YIIBL7Ik1DD
	 /d5420m7wiKxJOB3PnIFRRnn6j44dIecWPVCSBX/s+OndLN/lFYIkgLwJPTcF4CVxi
	 oekdb803Eg//VM7GtyIpjXTMV6w0kxQzizo+/se33MY5vjF6Tsjga7sxRh8HI29VDg
	 p+WuOYuSdB2YccObHd5SRnP83qU0B14HXM9lW7q75WqM6otBQ52pk9KLVCho5NHodS
	 vGSlNUB2Hxv/g==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63bf76fc9faso7316595a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 23:56:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwowwITrKShHyb3r641SBPXshG+lvP0bVgZTMn0MBGtzmA76tC01WqZAvyTn4v4TaURLfn9QZ4MsnAqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Io4w91W+Gbzf9T3d/b08MqKnkrxL4x5FiHa4BB4TvVILNSHc
	Y56wiLrSWCjSSU4u9CaLkD+n/Q50aJeLIMl0+FfEN3BPKDeFI5aBc+0lDL5+tsrj8W27zxVyTyx
	f8oa22aQ2VYhQozZXuTNrpa2kKcW+IvQ=
X-Google-Smtp-Source: AGHT+IFnfhUn8HN0p4pAoHDFb320UnHrLwc6eiuN03fPNFETWItVQO870cPTacL3OdFj5V/dRgq1RI8aSYi1eCsoLeg=
X-Received: by 2002:a05:6402:13ca:b0:634:5297:e3bc with SMTP id
 4fb4d7f45d1cf-63c1f629a40mr12798466a12.6.1760943359107; Sun, 19 Oct 2025
 23:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx> <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn>
In-Reply-To: <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 20 Oct 2025 14:55:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
X-Gm-Features: AS18NWDRalCHnTxlUVVh6Sc0-5BD00KgUctbRu4OmtnXD3m7UgQt5e4S4nAWM6E
Message-ID: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_235601_792002_420DEF06 
X-CRM114-Status: GOOD (  14.06  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgOToyNOKAr0FNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1
QGxvb25nc29uLmNuPiB3cm90ZToKPgo+IEhpIEpvc2gsIEFyZCBhbmQgSHVhY2FpLAo+Cj4gT24g
MjAyNS8xMC8xOCDkuIrljYgxOjA1LCBKb3NoIFBvaW1ib2V1ZiB3cm90ZToKPgo+IC4uLgo+Cj4g
PiBCdXQgSUlVQywgdGhlIGxpYnN0dWIgY29kZSBydW5zICp2ZXJ5KiBlYXJseSwgYW5kIHdvdWxk
bid0IHNob3cgdXAgaW4gYQo+ID4gc3RhY2sgdHJhY2UgYW55d2F5LCBiZWNhdXNlIHRoZXJlIGFy
ZSBubyB0cmFjZXMgb2YgaXQgb24gdGhlIHN0YWNrIG9uY2UKPiA+IGl0IGJyYW5jaGVzIHRvIGhl
YWQuUyBjb2RlICh3aGljaCBkb2Vzbid0IHNhdmUgdGhlIGxpbmsgcmVnaXN0ZXIpLgo+Cj4gVGhh
bmtzIGZvciB5b3VyIGRpc2N1c3Npb25zLgo+Cj4gQXJlIHlvdSBPSyB3aXRoIHRoaXMgY3VycmVu
dCBwYXRjaD8KRm9yIG1lIHRoZSBjdXJyZW50IHBhdGNoIGlzIGp1c3QgT0suCgoKSHVhY2FpCgo+
IE9yIHNob3VsZCBJIHVwZGF0ZSB0aGlzIHBhdGNoIHRvIHJlbW92ZSB0aGUgY2hhbmdlcyBvZiBh
cm02NCBhbmQgcmlzY3Y/Cj4gT3IgYW55IG90aGVyIHN1Z2dlc3Rpb25zPwo+Cj4gVGhhbmtzLAo+
IFRpZXpodQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
