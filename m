Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C2AC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 06:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YptdTDbAEagHwAvGhvGCOkq0ixiPc9E9fmLX6s9+hA=; b=Z7sDmjyW0+VZEq
	Pn+WN4rWJ6jFmVPncA2urN1HsTkJX3md6lZL1RW0Wjp94xFRIg7yXmSDRGZZmMmC1eMNmUGtG5vRP
	F+unhzG85Ej6Ie0YjhV4530wVBPyEay0sIN5lCrU6XWeVXe6fkPRjLm7fQkpODSlPxy2KRSD+fNSo
	I0ohdWGmSqa5cfEx1PVIl1ZR4LWxv8Tn4tLeFnLBcS0+WenhZrCFULkE9sSTKz7ctkxFGi7rERCR6
	u9VD0IQvVd/pnUZ1+5AR3lSEMto67FmuTiG7wcM3Y9wYV4RbCeg4o2+PuvXR36xAAvHskvc5Jc/f3
	YbNK41/GTmugOBcf3sDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNSuY-00EWk8-FK; Thu, 02 Feb 2023 06:17:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNSuV-00EWiy-NL
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 06:17:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0EAEB824DB
	for <linux-riscv@lists.infradead.org>; Thu,  2 Feb 2023 06:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994BFC433D2
	for <linux-riscv@lists.infradead.org>; Thu,  2 Feb 2023 06:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675318644;
	bh=lIQRjELp3Php5uFWPaHMcz+Z9q+Ruw90XMNIKquPkpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hMg2QgjSlJHN6UgkTHxwek55KSFcYKIZXn/yLjbghQ/yuVx/6E0gorCohXkQh8oo8
	 J6kGoUBMHa+B5tAP3/OkFKXN3KZ5ukeYohzMac82JV6lRk1OdPvby5gedY7UPtH1YU
	 KpYitBxiKM/KRVnLv2nr9gQRgBi9dLo+Mfor8837SV2of7tFX8ztVbkHYpu3JG9nXU
	 CvWTR1GGPYbwyEHU7AOY2qpO83q/nbEZdE97jJr3ZqiuR19Luk+SHsa8lp29S4YoMp
	 wGZO3/6GfWDp/3VwmxDY2pGtt5mTG6tyddknSXjL2flHY0wYvepqdotMLTbZP7vsmj
	 Su5HH0sM2WDtQ==
Received: by mail-ed1-f47.google.com with SMTP id u21so950809edv.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 22:17:24 -0800 (PST)
X-Gm-Message-State: AO0yUKW9HA1A1EY2aJXuR/QuXUWBAGCw2Yt/MqHhj2uhIyL0DEEKoSnk
	Yb4jfCnZa0Bc58Kfsdvf3A5s9y3S2/d4A/qI9Uo=
X-Google-Smtp-Source: AK7set+hvsuF+zcV0/OBsBn6/jJeEBczdyeQe9Yr+Fmtrt5m6gEqIeWjIa+VQ5b2Wh5DOkGM/8mrGt7hwGn/wOknxfs=
X-Received: by 2002:aa7:c585:0:b0:4a0:e29d:18c9 with SMTP id
 g5-20020aa7c585000000b004a0e29d18c9mr1520324edq.69.1675318642913; Wed, 01 Feb
 2023 22:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20230201064608.3486136-1-guoren@kernel.org> <87tu05pvur.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87tu05pvur.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 2 Feb 2023 14:17:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSj12E9+peMF0rNY_psGDyEG5BbMY6V-s4dK0FpkCC9Yw@mail.gmail.com>
Message-ID: <CAJF2gTSj12E9+peMF0rNY_psGDyEG5BbMY6V-s4dK0FpkCC9Yw@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup misaligned load text
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: palmer@rivosinc.com, conor.dooley@microchip.com, liaochang1@huawei.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	Bjorn Topel <bjorn.topel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_221728_071135_8225FF7D 
X-CRM114-Status: GOOD (  18.04  )
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

T24gV2VkLCBGZWIgMSwgMjAyMyBhdCA1OjQwIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+Cj4gPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gVGhlIGN1cnJlbnQga3By
b2JlIHdvdWxkIGNhdXNlIGEgbWlzYWxpZ25lZCBsb2FkIGZvciB0aGUgcHJvYmUgcG9pbnQuCj4g
PiBUaGlzIHBhdGNoIGZpeHVwIGl0IHdpdGggdHdvIGhhbGYtd29yZCBsb2FkcyBpbnN0ZWFkLgo+
ID4KPiA+IEZpeGVzOiBjMjJiMGJjYjFkZDAgKCJyaXNjdjogQWRkIGtwcm9iZXMgc3VwcG9ydGVk
IikKPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvODc4cmhpZzl6ai5mc2ZAYWxsLnlv
dXIuYmFzZS5hcmUuYmVsb25nLnRvLnVzLwo+ID4gUmVwb3J0ZWQtYnk6IEJqb3JuIFRvcGVsIDxi
am9ybi50b3BlbEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9i
ZXMva3Byb2Jlcy5jIHwgNCArKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9iZXMva3Byb2Jlcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+ID4g
aW5kZXggNDFjNzQ4MWFmZGUzLi5jMTE2MDYyOWNlZjQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9iZXMva3Byb2Jlcy5jCj4gPiBAQCAtNzQsNyArNzQsOSBAQCBpbnQgX19rcHJvYmVzIGFyY2hf
cHJlcGFyZV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJu
IC1FSUxTRVE7Cj4gPgo+ID4gICAgICAgLyogY29weSBpbnN0cnVjdGlvbiAqLwo+ID4gLSAgICAg
cC0+b3Bjb2RlID0gKnAtPmFkZHI7Cj4gPiArICAgICBwLT5vcGNvZGUgPSAoa3Byb2JlX29wY29k
ZV90KSgqKHUxNiAqKXByb2JlX2FkZHIpOwo+ID4gKyAgICAgaWYgKEdFVF9JTlNOX0xFTkdUSChw
LT5vcGNvZGUpID09IDQpCj4gPiArICAgICAgICAgICAgIHAtPm9wY29kZSB8PSAoa3Byb2JlX29w
Y29kZV90KSgqKHUxNiAqKShwcm9iZV9hZGRyICsgMikpCj4gPiAgICAgICA8PCAxNjsKPgo+IFVn
aCwgdGhvc2UgY2FzdHMuIDotKCBXaGF0IGFib3V0IHRoZSBtZW1jcHkgdmFyaWFudCB5b3UgaGFk
IGluIHRoZSBvdGhlcgo+IHRocmVhZD8KVGhlIG1lbWNweSB2ZXJzaW9uIHdvdWxkIGZvcmNlIGxv
YWQgcHJvYmVfYWRkciArIDIuIFRoaXMgb25lIHdvdWxkCnNhdmUgYW4gbGggb3BlcmF0aW9uLiBU
aGUgY29kZSB0ZXh0IGd1YXJhbnRlZXMgaGFsZi13b3JkIGFsaWdubWVudC4gTm8KbWlzYWxpZ25l
ZCBsb2FkIGhhcHBlbmVkLiBTZWNvbmQsIGtwcm9iZSB3b3VsZG4ndCB3cml0ZSB0aGUgbGFzdCBo
YWxmCm9mIDMyYiBpbnN0cnVjdGlvbi4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
