Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E8AC76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 06:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMWrHRY3T4vMZ7OPiLom7nSr0TcbG7yQmSEIikI47xQ=; b=JkDn41SeGrFK2C
	6Z+u4bvjJSNyUeSqN+OXtLQxwmuzriUYjabACi+QmGSYyxbBa1OdFbMy1gkXqal4khzEtviNuULIT
	ScHCZ0i9HxLbICmxOqAdvuSwJd22ci6YPE415tviP+nrJS1uBwQGkwdFaTpHVepx96gk+vHPkl88V
	9q3rIB0KJw4O0yL63lFABxBV1ODPpekptoVlKbOE+LLTZDoEW0Lj6Ts/73LJlyADBiFLQrZTynHFN
	27SSTQh1hdd55IY1q0k8ypJXQOSsyCaVcE1kuNXUo7XSfhkVwmHZywTWm+0ztY9LxM7tiTSeTfjRS
	Z2kpOIgyMaauaP2Fi9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pggef-009zpU-03;
	Mon, 27 Mar 2023 06:48:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pggec-009zop-17
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 06:48:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07822B80D0E
	for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 06:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06F9C433D2
	for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 06:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679899706;
	bh=qoCwbQa9yJKqGGJPhoYr2N4l5H+s4bPnSYnKpLsXKt0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GqRihggKLaHBnnuVWjeT43NOO8bAds3k1IG/YtRt4NGfn6xs6BmkW97Wx5RfyQpPf
	 zYo4e4v1T1zCX2IEToC4jWhKtwz1L8uDwxSBrhoX7RBI0Y1Mjt8qjRnsBEeMDkDaU6
	 ySGQs7vh6U+phOPLgkQugZHS20dM+H1kHpqqAtjmpJ/qyEfMScbMcS0BadnOfTvGCI
	 txvFq70FppAtkt7kbLb9gVMbdUOKCubOYGCqu7da5jiNMhTywFEaxOGUZgIWrPVpGA
	 fSFiyoozB/LZjqD6tD+KJ49+6rvuwkniSxhZRtd31b00ZZyINFzObjRRWJjGAe9e+F
	 t7AzT9Tiw52kg==
Received: by mail-qk1-f178.google.com with SMTP id q2so2099684qki.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Mar 2023 23:48:26 -0700 (PDT)
X-Gm-Message-State: AO0yUKXqxInZ4qOQcg3PjAmSCoRRjSZoERp9GIMLFFx7bpfZpSFAEa3u
	AlOYuQGeqN0EdPujewimuOdgl0F1Gwd/7Eq3l6k=
X-Google-Smtp-Source: AK7set8S6iCTqQhhwC/lflTHTfz7vlwdY+o6PFRAZ6lqhSrHl5LDlNFhVFVJnN1z0GFVzIfM6MJQpojCDgqQt9I/v4I=
X-Received: by 2002:a05:620a:1aa3:b0:72b:25b4:5660 with SMTP id
 bl35-20020a05620a1aa300b0072b25b45660mr4100144qkb.6.1679899705860; Sun, 26
 Mar 2023 23:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230323123924.3032174-1-suagrfillet@gmail.com> <20230323172403.nfrtgm5vea4qvinu@orel>
In-Reply-To: <20230323172403.nfrtgm5vea4qvinu@orel>
From: Ley Foon Tan <lftan@kernel.org>
Date: Mon, 27 Mar 2023 14:48:13 +0800
X-Gmail-Original-Message-ID: <CAFiDJ5-=X1z-WZz-BKpcUDU+yN93s5cDXy2YZD1HfMCBjPqKWA@mail.gmail.com>
Message-ID: <CAFiDJ5-=X1z-WZz-BKpcUDU+yN93s5cDXy2YZD1HfMCBjPqKWA@mail.gmail.com>
Subject: Re: [PATCH V2] riscv: export cpu/freq invariant to scheduler
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Song Shuai <suagrfillet@gmail.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_234830_543386_F7C7BA9E 
X-CRM114-Status: GOOD (  11.06  )
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

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMTo1MuKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgMDg6Mzk6
MjRQTSArMDgwMCwgU29uZyBTaHVhaSB3cm90ZToKPiA+IFJJU0MtViBub3cgbWFuYWdlcyBDUFUg
dG9wb2xvZ3kgdXNpbmcgYXJjaF90b3BvbG9neSB3aGljaCBwcm92aWRlcwo+ID4gQ1BVIGNhcGFj
aXR5IGFuZCBmcmVxdWVuY3kgcmVsYXRlZCBpbnRlcmZhY2VzIHRvIGFjY2VzcyB0aGUgY3B1L2Zy
ZXEKPiA+IGludmFyaWFudCBpbiBwb3NzaWJsZSBoZXRlcm9nZW5lb3VzIG9yIERWRlMtZW5hYmxl
ZCBwbGF0Zm9ybXMuCj4gPgo+ID4gSGVyZSBhZGRzIHRvcG9sb2d5LmggZmlsZSB0byBleHBvcnQg
dGhlIGFyY2hfdG9wb2xvZ3kgaW50ZXJmYWNlcyBmb3IKPiA+IHJlcGxhY2luZyB0aGUgc2NoZWR1
bGVyJ3MgY29uc3RhbnQtYmFzZWQgY3B1L2ZyZXEgaW52YXJpYW50IGFjY291bnRpbmcuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgpUaGFu
a3MgZm9yIHN1Ym1pdHRpbmcgdGhpcy4KClJldmlld2VkLWJ5OiBMZXkgRm9vbiBUYW4gPGxmdGFu
QGtlcm5lbC5vcmc+CgpSZWdhcmRzCkxleSBGb29uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
