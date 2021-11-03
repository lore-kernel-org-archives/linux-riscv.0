Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D477CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 06:10:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06870610FC
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 06:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06870610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dj84V3wl5LRrDtwkg3NoOQmpo4aUQXjbcJqtjMwCmvc=; b=Tjd1Pt3qeFC3LR
	eBh/nI/94jBZ5HxD/Fzqo28sm9kAoDeGefr+DsgjlRDbFOQjKavxsZ+I9La9q2IETiwCMtJ3rNcFn
	xa3SILhZmbgjfi0x5W0oAHxNQZcmQyrN+Nzt5vJBKdT44OchTeOJQJlKANfn9JZzZHr0H5nUQlL2/
	08JLFol+a1ILoi0fjrCtcn2QX93wb9O1e0DT2xIzYVMZVSbC7RPetd5QGD9aUMHhr7iwH9cIa2Aif
	PVIsl5FwaXY9f+Ci6EEm3aEwDYAKjwld97UuzZEiaGhrVYV2Kez3Tx6LKg9553RD2YJQpXBQ4x/3o
	GIhIZRT1hcXjBn3B+xGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi9TW-004BHb-FC; Wed, 03 Nov 2021 06:10:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi9TT-004BGg-A8
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 06:10:16 +0000
Received: by mail-wr1-x432.google.com with SMTP id s13so1871988wrb.3
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 23:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mhFGKftRIjcJcC/nt39v6NG9deVMAPc9B2rHmoF3Wyg=;
 b=P47Fhjn5Z/MgIz6wosHw4ahOVYLyMYVRJiQOiVhZSePI2QLXypxPJt0siDj7VOxpSE
 tt6VHRnzSlvLk3yXb8lE35UPJUSQCjpH9J1ImuUA+3ZSV1c8CtsfYTQ5j1NN319vdpgO
 6NW2jbS6Kjpz4BNziepjn3GIO4IJbI+dcVJCpGwpVxAa7kHzLumr/xq2VPiwp9ncCmxY
 paqIHZE2qpapLBJUxVuVcs3Qmdd2jkciMeJQ6YGR7AhH3E+cYxVMpN/CAd4THIlBjXS2
 +8Ucb9AHLyJm5Hy3iDhsWFVJSSKXKKH4xy9Z2chTnNSw2G6UbBq7pRn71J86i8QVzsyu
 WEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mhFGKftRIjcJcC/nt39v6NG9deVMAPc9B2rHmoF3Wyg=;
 b=Km/T6Oo/wsjOig33pCuxcD8hxmr/mN0e2wx14E//oWOckeD+Fjndy5MVStxo4H9rBy
 Bxo4gsiSdvBqW5sTFED8FZsTib1mNVwX/LCCV/1GD9XWCYAM+794ZI77CTvQS8GVednD
 ok0zvL8dBSh/96LTTI0nL+rA8b1gCKvuGMqxUt2vTmSkpXWTw5VJe1n9ZDArnvvoeWbA
 GJ3A2r7mlP/IjLU8tdPF3y+92uNTMIL21IM1RQjDgNi1bW8yL0e92DrWrbGObABGwjCV
 dvM/o4cObmsheFH0Xj7nSgf/NBmsPQ7BKkuURMUEK5UZM2PRZPQIUKKdR18nexutc1gZ
 ChoQ==
X-Gm-Message-State: AOAM530qjVFaGvwyYFEJ5rNpH7LfQrOwXE2Y3zw/KL3u7dCd/+x9zU4N
 Ls9bfMHSzHnhshDK+ffNKr/knte2hQktTlh9+R8=
X-Google-Smtp-Source: ABdhPJyvNO5HtlrsmV3IHN1qX/3wt/nczXG/NErLEVaI5hbaOC/iHnZejymyGFs1wqQNKIcUpZDEgH/B5rtDWmAQJVE=
X-Received: by 2002:a5d:648e:: with SMTP id o14mr3245168wri.141.1635919813053; 
 Tue, 02 Nov 2021 23:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211102145642.724820-1-tongtiangen@huawei.com>
 <CAJ+HfNg1Ki=1Zc+ThW-ynvtDo5=fNAUK-XV08-icz-nY9CNoUQ@mail.gmail.com>
 <448599f5-e773-6ab5-bdaf-289f583edf01@huawei.com>
In-Reply-To: <448599f5-e773-6ab5-bdaf-289f583edf01@huawei.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 3 Nov 2021 07:10:00 +0100
Message-ID: <CAJ+HfNj_p36trWFzdyxVVgykrPVq=OvKcYq61w2QyKsHwa0gDw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] riscv, bpf: fix some compiler error
To: tongtiangen <tongtiangen@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_231015_397489_83D12784 
X-CRM114-Status: GOOD (  14.75  )
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

T24gV2VkLCAzIE5vdiAyMDIxIGF0IDA0OjA2LCB0b25ndGlhbmdlbiA8dG9uZ3RpYW5nZW5AaHVh
d2VpLmNvbT4gd3JvdGU6Cj4KWy4uLl0KPiA+Cj4gSGkgQmrDtnJuOgo+ICBGcm9tIHRoZSBwZXJz
cGVjdGl2ZSBvZiBkZXZlbG9wbWVudCwgaW50cm9kdWNlIGFzbS9leHRhYmxlLmggaXMgYWxzbyBw
cmVwYXJlIGZvciB0aGUKPiBzdWJzZXF1ZW50IG1vZGlmaWNhdGlvbiBvZiBleGNlcHRpb25fdGFi
bGVfZW50cnksIHN1Y2ggYXM6Cj4gICAgMS4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvMTAv
MjAvNTkxCj4gICAgMi4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8y
MDIxMTAxOTE2MDIxOS41MjAyLTExLW1hcmsucnV0bGFuZEBhcm0uY29tLwo+Cj4gVGhlcmVmb3Jl
LCB0aGUgcHJvdG90eXBlIGRlY2xhcmF0aW9ucyBhbmQgZGVmaW5pdGlvbnMgcmVsYXRlZCB0byBr
ZXJuZWwgY29uZmlnIGFyZSBwbGFjZWQgaW4gaGVhZCBmaWxlLAo+IHdoaWNoIGNhbiBhdm9pZCBj
b21waWxlciBlcnJvciBhbmQgc2ltcGxpZnkgdGhlIHJlbmRlcmluZyBvZiBmdW5jdGlvbnMuCj4K
ClN1cmUsIGJ1dCAqdGhpcyogcGF0Y2ggaXMgYWJvdXQgZ2V0dGluZyB0aGUgYnJva2VuIFJWMzIg
YnVpbGQgdG8gd29yaywKYWltZWQgZm9yIHRoZSBicGYgdHJlZS4gTW92aW5nIHRoZSBleHRhYmxl
LmggaXMgdW5yZWxhdGVkLCBhbmQgc2hvdWxkCm5vdCBiZSBkb25lIGhlcmUuIElNTyBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gaGF2ZSB0aGlzIHBhdGNoIHNtYWxsL2Vhc3kKdG8gcmVhZC4gSSBjYW4n
dCByZWFsbHkgc2VlIGhvdyB0aGlzIHBhdGNoIGhlbHBzLCB3aGVuIG1lcmdpbmcgd2l0aApKaXNo
ZW5nJ3Mgd29yay4KCi4uLmFuZCBJIHN0aWxsIHRoaW5rIHRoYXQ6Ci0tODwtLQpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS9leHRhYmxlLmMgYi9hcmNoL3Jpc2N2L21tL2V4dGFibGUuYwppbmRl
eCAxOGJmMzM4MzAzYjYuLmRkYjdkM2I5OWU4OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS9l
eHRhYmxlLmMKKysrIGIvYXJjaC9yaXNjdi9tbS9leHRhYmxlLmMKQEAgLTExLDcgKzExLDcgQEAK
ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cgot
I2lmZGVmIENPTkZJR19CUEZfSklUCisjaWYgZGVmaW5lZChDT05GSUdfQlBGX0pJVCkgJiYgZGVm
aW5lZChDT05GSUdfQVJDSF9SVjY0SSkKIGludCBydl9icGZfZml4dXBfZXhjZXB0aW9uKGNvbnN0
IHN0cnVjdCBleGNlcHRpb25fdGFibGVfZW50cnkgKmV4LApzdHJ1Y3QgcHRfcmVncyAqcmVncyk7
CiAjZW5kaWYKCkBAIC0yMyw3ICsyMyw3IEBAIGludCBmaXh1cF9leGNlcHRpb24oc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCiAgICAgICAgaWYgKCFmaXh1cCkKICAgICAgICAgICAgICAgIHJldHVybiAw
OwoKLSNpZmRlZiBDT05GSUdfQlBGX0pJVAorI2lmIGRlZmluZWQoQ09ORklHX0JQRl9KSVQpICYm
IGRlZmluZWQoQ09ORklHX0FSQ0hfUlY2NEkpCiAgICAgICAgaWYgKHJlZ3MtPmVwYyA+PSBCUEZf
SklUX1JFR0lPTl9TVEFSVCAmJiByZWdzLT5lcGMgPCBCUEZfSklUX1JFR0lPTl9FTkQpCiAgICAg
ICAgICAgICAgICByZXR1cm4gcnZfYnBmX2ZpeHVwX2V4Y2VwdGlvbihmaXh1cCwgcmVncyk7CiAj
ZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNo
L3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmluZGV4IDJjYTM0NWM3YjBiZi4uNjM3MmEyMzU1
MjJkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCisrKyBiL2Fy
Y2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAgLTQ1OSw2ICs0NTksOCBAQCBzdGF0aWMg
aW50IGVtaXRfY2FsbChib29sIGZpeGVkLCB1NjQgYWRkciwgc3RydWN0CnJ2X2ppdF9jb250ZXh0
ICpjdHgpCiAjZGVmaW5lIEJQRl9GSVhVUF9PRkZTRVRfTUFTSyAgIEdFTk1BU0soMjYsIDApCiAj
ZGVmaW5lIEJQRl9GSVhVUF9SRUdfTUFTSyAgICAgIEdFTk1BU0soMzEsIDI3KQoKK2ludCBydl9i
cGZfZml4dXBfZXhjZXB0aW9uKGNvbnN0IHN0cnVjdCBleGNlcHRpb25fdGFibGVfZW50cnkgKmV4
LAorICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncyk7CiBpbnQg
cnZfYnBmX2ZpeHVwX2V4Y2VwdGlvbihjb25zdCBzdHJ1Y3QgZXhjZXB0aW9uX3RhYmxlX2VudHJ5
ICpleCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVn
cykKIHsKLS0+OC0tCgppcyBtdWNoIHNpbXBsZXIuCgoKClRob3VnaHRzPwpCasO2cm4KCgoKCj4g
VGhhbmtzLgo+IFRvbmcuCj4KPiA+Cj4gPiBCasO2cm4KPiA+IC4KPiA+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
