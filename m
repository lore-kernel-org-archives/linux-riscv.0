Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1199DCAC5B9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HpVbLAu+kms+zrBzb+nad+nBwt5i1DxtaqOFYeNpvg=; b=NVynJkajDKBZH1
	xSmbPcZvs54mm4XvcMRRjDiyxu4wHwSnc2miOT/EZfZoQwmkXFgqOWq5d8LrkMMMy9TgwRDCTxWeB
	BCKqnjBBj/iYDxdNbIickhmF9hXFS/KNog8PJN9DzhAfEnwZqBf81K/A8Fd8xSQW7H9T9c1YzSi60
	nOWuTChAlWNmg2y/AeLjuoK8KxCqLhijP0as51A+CzX2fJp/1R5QgzLzdjtFuKqbkSWmZSdKdciXL
	Z3Hf0qBOM8/8EeQvRbwaGdC1EOw5ocwXSWN6Qj1GCxpZabk/96kZSMXBqsClzwuk6SQC/KixBxTIO
	PkI4EocEwfp/HdF5EfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2S7A-00000008zCk-37As;
	Sat, 27 Sep 2025 10:25:16 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2S73-00000008yyx-1g3p
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 10:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758968654;
	bh=8gQ1btfcS9lR4xyhO4eNmmxoMM9MV//3rCHOmLGPOus=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=hZIbkHm10wA9hp7X5Q3PdaFA7mnSA2gAlv2sQC9GwILeCZYty5KPZuqkiuXOSkruv
	 mJFu1L+VnSV2uMkA6rLp2vOIuRIj11P7pzf3pYLpuICFM6CmFCjSNrP7SRJlp775oN
	 t3TvaIiNiWY9OkE+24tcPtYSwdep/sPfx+tzsgUA=
X-QQ-mid: zesmtpip2t1758968646t6adf6663
X-QQ-Originating-IP: /kIp1FpEbrRs/kHZGWmafReKwU4afgvz1uRmtyEjXAs=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Sep 2025 18:24:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11619624960712165615
EX-QQ-RecipientCnt: 9
Date: Sat, 27 Sep 2025 18:24:05 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <64AD69A1C43D8A13+aNe7RUmS73q-jSBk@troy-wujie14pro-arch>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927014547-GYA1336612@gentoo.org>
 <7F98284B9618900A+aNdiTKvvbg4G-LwM@troy-wujie14pro-arch>
 <20250927101648-GYA1338789@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250927101648-GYA1338789@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NojR6Ao/DkEDWzK408R5Uhp1H+tIhTv87PPDP6mL828IdsNJnBLVf/I1
	zz4yTnVuKMmB1sWnG2yqMNIDSXhtAkdPlmzt5fJcLc6VlRoMFI61Hi66RDl4KJq9e1Cp+NL
	dm/ATz/KkYq+r74Kvvf0d2zgaxswyBiOlQvRKNTMlK9TQFqPp/LbjcNMxrTb4UpNfrYEGiB
	evPqt+SrBBKk2ih69WQoefWMAHfVorp/X8on7/FjcCQyI3QZk1FUO0/E93TfyGnB94au0gy
	q7itSI3RsvmsbRQp26C6kJmXLfp2/0MlVklYdohZbKv+WmnSZrqQU5dIL8APY4WsKkufxzS
	eY6g7+jOgjLmw3+laHqFBudppVKId08482oADUPF8udZx+wmUPTMHhhjpvCs64dV+jmdfAC
	4rC47Wp/Ne+JDYZSVLXnuvPnkcwm14KrTsSJOaKXNdkSD8Xg52CS5ipIwvhzBmvaFEbW8ar
	SPIF/w30f78e34wgeMnFAKzg2GMlhLQLZyqZD+s7cjnhhEKTUCiKbsd6pxkO6mSf+L9ab+M
	A4zQ8WXkVdEJCY2T918HFmhtqkTfknIE4ldUG3qMfaMHcA6S95PxEm0BPzzo6iGad4WHa33
	ruG6h27g85NOsN7Rupni7kxHw3nDAEMXbN11djy5JtNIaFoTQc7doeSD63unhlUEzcXlT18
	SSy9vH2zB19P07DBg09qprxCAnfxPdd5U2354f3TOfgnBRN4yz3iWZJCDJiJzAF0VgbMDeG
	jcYYSbZmISudzZEWGBXdnyDMRaz+pqN2dWgKEQ1/OD4rqRfLTzYT9AoKG/spY+EFThTgXfg
	lXjo1DDt8q9f5Qe9qcorEVLKYj+QtXMV/gAnSjRx6ISvuYGRMcNeOwtZ6s+WewqJhNLuylf
	jAdTuxgMdJ0pRyfIWOkg2YrWon/U5r6oFhq2QcWFzXIYaBMlixELHM3QjdqTHwC0k+PP3/g
	0igcT3lY8xw/mmokt3YybYz1IUvEKqtEFXlFDDh87l0LvBeSebFxwkjxr3LXjsjYxftGnHy
	jav+asMQAA+FYFZVpcQQw5ebjKzD7JX4DCi8caYBhENsbv7TcQ7rqwguD/EErx1XJ6JANiG
	g==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_032510_348429_2E1199FF 
X-CRM114-Status: GOOD (  24.46  )
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

T24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgMDY6MTY6NDhQTSArMDgwMCwgWWl4dW4gTGFuIHdyb3Rl
Ogo+IEhpIFRyb3ksCj4gCj4gT24gMTI6MDQgU2F0IDI3IFNlcCAgICAgLCBUcm95IE1pdGNoZWxs
IHdyb3RlOgo+ID4gT24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgMDk6NDU6NDdBTSArMDgwMCwgWWl4
dW4gTGFuIHdyb3RlOgo+ID4gPiBIaSBUcm95LAo+ID4gPiAKPiA+ID4gT24gMTA6MDIgVGh1IDI1
IFNlcCAgICAgLCBUcm95IE1pdGNoZWxsIHdyb3RlOgo+ID4gPiA+IFRoaXMgcGF0Y2ggaW50cm9k
dWNlcyBJMkMgUElPIGZ1bmN0aW9uYWxpdHkgZm9yIHRoZSBTcGFjZW1pdCBLMSBTb0MsCj4gPiA+
ID4gZW5hYmxpbmcgdGhlIHVzZSBvZiBJMkMgd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkLgo+ID4g
PiBJIGZlZWwgaXQncyBtb3JlIHByb3BlciB0byBzYXkKPiA+ID4gcy93aXRoIGludGVycnVwdHMg
ZGlzYWJsZWQvaW4gYXRvbWljIGNvbnRleHQvCj4gPiBHb29kIHBvaW50Lgo+ID4gCj4gPiA+IAo+
ID4gPiBJJ3ZlIG5vdGljZWQgdGhhdCBLMSBJMkMgY29udHJvbGxlciBzdXBwb3J0IHRocmVlIGRp
ZmZlcmVudCB0cmFuc21pc3Npb24gbW9kZToKPiA+ID4gIG5vbi1maWZvLCBmaWZvIG1vZGUsIGRt
YSBtb2RlCj4gPiA+IAo+ID4gPiB3aGlsZSB5b3UgYXJlIHRyeWluZyB0byBpbXBsZW1lbnQgcGlv
IHN1cHBvcnQsIEknZCBzdWdnZXN0IHRvIHRoaW5rIG9uZQo+ID4gPiBmdXJ0aGVyIHN0ZXAgaW4g
dGhlIGxvbmcgcnVuIC0gc3VwcG9ydCBtb3JlIGZpZm8vZG1hICsgbm9ybWFsL2F0b21pYyBmZWF0
dXJlcywKPiA+IEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4sIGJ1dCBJIGhhdmUgcmV2aWV3ZWQg
dGhlIGNvZGUgc3RydWN0dXJlLAo+ID4gYW5kIGFkZGluZyBGSUZPIHN1cHBvcnQgd291bGQgbm90
IHNpZ25pZmljYW50bHkgYWZmZWN0IHRoZSBjdXJyZW50IFBJTyBpbXBsZW1lbnRhdGlvbi4KPiB3
ZSB3aWxsIHNlZS4uCj4gCj4gPiAKPiA+ID4gCj4gPiA+IFBlcnNvbmFsbHksIEknZCBsaWtlIHRv
IHNlZSBmaWZvIG1vZGUgaW1wbGVtZW50ZWQgYmVmb3JlIGFkZGluZyBwaW8KPiA+ID4gc3VwcG9y
dCwgYXMgaXQgd2lsbCBicmluZyBxdWl0ZSBzaWduaWZpY2FudCBjb2RlIGNoYW5nZXMsIHJlcXVp
cmUgaGVhdnkKPiA+ID4gY29kZSByZXZpZXcgZWZmb3J0LiBBbmQgeWVzLCB0aGlzIHdpbGwgcHV0
IG1vcmUgZGVtYW5kaW5nIHdvcmsgb24geW91ciBzaWRlCj4gPiA+IGFuZCBtYXkgc2xvdyB0aGlu
Z3MgYSBiaXQuLgo+ID4gVGhhdCBzYWlkLCB3ZSBkb27igJl0IGhhdmUgYW55IHBsYW5zIHRvIHN1
cHBvcnQgRklGTyBhdCB0aGlzIHBvaW50LAo+ID4gYW5kIFBJTyBmdW5jdGlvbmFsaXR5IGlzIHNv
bWV0aGluZyB3ZSBuZWVkIHVyZ2VudGx5Lgo+ID4gU28gSSB3aWxsIGNvbnRpbnVlIHRvIHB1c2gg
dGhpcyBwYXRjaCAodG9tb3Jyb3cpLgo+IHBsZWFzZSBkbyBub3QgZmx1c2ggdGhlIG1haWxpbmcg
bGlzdCBhbmQgZ2l2ZSBwZW9wbGUgc29tZSB0aW1lLCBJIGhhdmVuJ3Qgc2VlbiAKPiBlbm91Z2gg
cmV2aWV3cyBjb21pbmcsIHBsZWFzZSB3YWl0IGZvciB+b25lIHdlZWsgYmVmb3JlIHNlbmRpbmcg
bmV4dCB2ZXJzaW9uLAo+IG9yIG1ha2Ugc3VyZSB5b3UndmUgYWNjdW11bGF0ZWQgZW5vdWdoIGNo
YW5nZXMuLgpPa2F5Li4gSSB3aWxsIHdhaXQgZm9yIG1vcmUgcmV2aWV3Cgo+IAo+ID4gVGhhbmtz
IGZvciB5b3VyIHVuZGVyc3RhbmRpbmcuIEZvciBkZXRhaWxzIG9uIHRoZSBjb2RlIGNoYW5nZXMs
IHBsZWFzZSBzZWUgYWJvdmUuCj4gPiAKPiA+IEluIGFkZGl0aW9uLCBpZiBhbnlvbmUgaXMgaW50
ZXJlc3RlZCBpbiBhZGRpbmcgRklGTyBzdXBwb3J0LCBJ4oCZZCBiZSBoYXBweSB0byBoZWxwLgo+
ID4gCj4gZG8geW91IHdhbnQgdG8gcHVzaCB0aGUgd29yayAoc3VwcG9ydCBmaWZvIG1vZGUpIHRv
IGNvbW11bml0eT8KUGVyc29uYWxseSwgSSB3YW50LgpTaW5jZSBLMyBpcyBnb2luZyB0byByZXVz
ZSB0aGUgdXBzdHJlYW0gZHJpdmVyLApQSU8gc3VwcG9ydCBoYXMgaGlnaCBwcmlvcml0eSAobmVl
ZGVkIGFzIFAxLCBlLmcuIGZvciBzaHV0ZG93biBhbmQgcmVib290KS4KRklGTyBzdXBwb3J0LCBp
cyBub3QgY29uc2lkZXJlZCBhIGhpZ2ggcHJpb3JpdHkgYXQgdGhpcyBwb2ludC4KClRoYXQncyB3
aHkgSSB3YW50IHRvIHB1c2ggUElPIEFTQVAKRG9lcyB0aGlzIG1ha2Ugc2Vuc2U/CgogICAgICAg
ICAgICAgICAgLSBUcm95Cj4gCj4gLS0gCj4gWWl4dW4gTGFuIChkbGFuKQo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
