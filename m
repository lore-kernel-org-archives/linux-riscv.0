Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF4BD4979A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 09:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEaANebCna/u3LGkX+dHVYaMhnGpGq5xLtXc99MRQ/k=; b=dbmZ2/UY9i1MxC
	ny73OQMYXykd69L2TFgurqAgtgxgU4nGmLGm5BIg4IirQvcW3JYZ+2ODFUl2QUyosErOAaIhayhaC
	0+OCKsfDNpOX1KJ0o1sSR0U141LDe4H8Duq983O5q3mx3yHmj3v5iwd1bTVhLarvqLfBig83oQNDH
	ky8rupie6I2rnp8317190M5M28s1XhmccDmi+BO6dU7qGY/Xn2HZSlP/y8iLsbtTm6KBJI8tgW5u8
	uJrvJPdRf/dHi2gShvFzKSezr/SZHHFreJ144lhwahCBYzVcqN17aFpTdXcnhqiZlSN1jYYnQLwar
	j9yG6YUBChLxrKpnXu2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPJd-00000008uLW-3AFn;
	Tue, 03 Dec 2024 09:35:33 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPHe-00000008tdY-2nDm
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 09:33:32 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 8B69A1D40959;
	Tue,  3 Dec 2024 04:33:29 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 03 Dec 2024 04:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1733218409; x=1733222009; bh=xJ2Db/Ov44
	qvxA3KXnEDiMcsG53llto9u0HWU/q9HkQ=; b=WvAQLTs7qmbrdJoKTR7pT9Gk0X
	h8Wt+cN8Eigwdz/zwoocQWTRceUGUqzpLzMDvdMZD2blBS9yqi5xPJJ7kn77hbuM
	S0N2gd4UXEwndzrM/3d4uXRCcuGhkUKddRaOJQe83quDf1qVd15gTa2kzPxhLSwG
	AAqLw1ThH8Vhw1qyeLPFfdkjhD7HJbPnpLHkufhUReh45+jVSgYUxntuUGyN2X4V
	bThU0mpQ+V7dX+1VgJujgrMgkm6WGkF8VOJ6j3BenlnlRB/YbH02DQvu4HJGo37R
	JHdJnjLoWa/U2Dsgq8vkyfa0qxtnqjJ+fjzZzUSqfAhjx2IRZsXJ8HG7CycQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733218409; x=
	1733222009; bh=xJ2Db/Ov44qvxA3KXnEDiMcsG53llto9u0HWU/q9HkQ=; b=i
	XnTSKvtGHIpxehz+s85uxS1tTOYzjr1V1erjrk4LyK8OI1X16CrO+iW8MlL8aR4F
	sLeL7cUtJAlQDrsqE4WLu/fmxblT+a0HTSyfQcRv9FHuJHGKHn5tcIB0t1udgW/N
	izHwXOrhxXjRArHGY1GVkZqqTT15LISIZz0FDre9Z5cC+xavQxVdRSXFPumP7OnS
	Han8EOQVVpm/XaFxPNwT1lNLgtyH41nb8tyT7e7li95Ybf3ZnOce3eWiVKJtD0fv
	rPw7XbjBA3xeLShRERRM9Rw4M+3XKnq2Fe4WUb659cl0EBzIzFJ6LxKLpS/IX6D2
	8OH5iLEQ+4gS8EAJhO/OQ==
X-ME-Sender: <xms:aNBOZ8UGnFGJQQsZjROnxI2b6OsLsdEcJfRvqN0Av2PaWFjNn0WMFg>
    <xme:aNBOZwn8FUnSMAO0EWvJpynSopqWnChNlQ2WpL16OaSWRJGcX9392_6H_E03bZ1x6
    MBbll8VGcAGPzBn3vc>
X-ME-Received: <xmr:aNBOZwa-ePyj9U_G5_DbxqO07QtPpbCKlQshb5HyV1gQ6ewCh6ek_0k4Wkb7X8fm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddriedvgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeen
    ucfhrhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthhhush
    drnhgrmhgvqeenucggtffrrghtthgvrhhnpeefffdujedtleetieffleehjeffudetfeeg
    hfdtieeiheevueeggfeuiefgvdekvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuhifuhes
    tghovghlrggtrghnthhhuhhsrdhnrghmvgdpnhgspghrtghpthhtohepvddvpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopegsjhhorhhnsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopeholhgvghesrhgvughhrghtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrg
    hlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggs
    sggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvg
    guuhdprhgtphhtthhopegvsghivgguvghrmhesgihmihhsshhiohhnrdgtohhmpdhrtghp
    thhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgiesghhhih
    htihdrfhhrpdhrtghpthhtoheplhguvhesshhtrhgrtggvrdhioh
X-ME-Proxy: <xmx:aNBOZ7W4jaAO2ZuFeZpscEzIWD3-MO-O1HsyKE6tEEFMKi_e7qLEXA>
    <xmx:aNBOZ2kHaimsqIMzYn33Z31vm5tVMDL2-uL_gnV9BhBzZRcRIv7nXQ>
    <xmx:aNBOZwcagEhNRduqG_tkWd84hbhDdHp93F6PeXbDasHXflV0NeaBsg>
    <xmx:aNBOZ4Hw_niN3Yl89uG1lOy8CSoOCDNI_PT518u96vHW9wPFtTnZFA>
    <xmx:adBOZ8r3BwPgZGS6lksVdAMfUEbOrqdnYmTLpekK8qtEdmdbotQT2MAv>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Dec 2024 04:33:21 -0500 (EST)
Message-ID: <31d48f53-eaf0-445e-b9e3-7c56070ff6ad@coelacanthus.name>
Date: Tue, 3 Dec 2024 17:33:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/ptrace: add new regset to get original a0 register
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
 Andrea Bolognani <abologna@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, stable@vger.kernel.org
References: <20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name>
 <87v7w22ip6.fsf@all.your.base.are.belong.to.us>
From: Celeste Liu <uwu@coelacanthus.name>
Content-Language: en-GB-large
In-Reply-To: <87v7w22ip6.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_013330_801841_7A85FC03 
X-CRM114-Status: GOOD (  15.24  )
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

T24gMjAyNC0xMi0wMiAyMzo0NCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKCj4gVGhhbmtzIGZvciB3
b3JraW5nIG9uIHRoaXMhCj4gCj4gQ2VsZXN0ZSBMaXUgPHV3dUBjb2VsYWNhbnRodXMubmFtZT4g
d3JpdGVzOgo+IAo+PiBUaGUgb3JpZ19hMCBpcyBtaXNzaW5nIGluIHN0cnVjdCB1c2VyX3JlZ3Nf
c3RydWN0IG9mIHJpc2N2LCBhbmQgdGhlcmUgaXMKPj4gbm8gd2F5IHRvIGFkZCBpdCB3aXRob3V0
IGJyZWFraW5nIFVBUEkuIChTZWUgTGluayB0YWcgYmVsb3cpCj4+Cj4+IExpa2UgTlRfQVJNX1NZ
U1RFTV9DQUxMIGRvLCB3ZSBhZGQgYSBuZXcgcmVnc2V0IG5hbWUgTlRfUklTQ1ZfT1JJR19BMCB0
bwo+PiBhY2Nlc3Mgb3JpZ2luYWwgYTAgcmVnaXN0ZXIgZnJvbSB1c2Vyc3BhY2UgdmlhIHB0cmFj
ZSBBUEkuCj4+Cj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC81OTUwNTQ2NC1j
ODRhLTQwM2QtOTcyZi1kNGIyMDU1ZWVhYWNAZ21haWwuY29tLwo+PiBTaWduZWQtb2ZmLWJ5OiBD
ZWxlc3RlIExpdSA8dXd1QGNvZWxhY2FudGh1cy5uYW1lPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3Yv
a2VybmVsL3B0cmFjZS5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+
ICBpbmNsdWRlL3VhcGkvbGludXgvZWxmLmggICB8ICAxICsKPj4gIDIgZmlsZXMgY2hhbmdlZCwg
MzQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHRy
YWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+PiBpbmRleCBlYTY3ZTlmYjdhNTgz
NjgzYjkyMmZlMmMwMTdlYTYxZjNiYzg0OGRiLi5mYWE0NmRlOTAwMDM3NmViNDQ1YTMyZDQzYTQw
MjEwZDdiODQ2ODQ0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+PiBAQCAtMzEsNiArMzEsNyBAQCBl
bnVtIHJpc2N2X3JlZ3NldCB7Cj4+ICAjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9TVVBNCj4+ICAJ
UkVHU0VUX1RBR0dFRF9BRERSX0NUUkwsCj4+ICAjZW5kaWYKPj4gKwlSRUdTRVRfT1JJR19BMCwK
Pj4gIH07Cj4+ICAKPj4gIHN0YXRpYyBpbnQgcmlzY3ZfZ3ByX2dldChzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnRhcmdldCwKPj4gQEAgLTE4NCw2ICsxODUsMzAgQEAgc3RhdGljIGludCB0YWdnZWRfYWRk
cl9jdHJsX3NldChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhcmdldCwKPj4gIH0KPj4gICNlbmRpZgo+
PiAgCj4+ICtzdGF0aWMgaW50IHJpc2N2X29yaWdfYTBfZ2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAq
dGFyZ2V0LAo+PiArCQkJICAgICBjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzZXQgKnJlZ3NldCwKPj4g
KwkJCSAgICAgc3RydWN0IG1lbWJ1ZiB0bykKPiAKPiBVc2UgZnVsbCAxMDAgY2hhcnMhCgpMaW51
eCBjb2RlIHN0eWxlIHByZWZlciA4MCBsaW1pdC4KCj4gCj4+ICt7Cj4+ICsJcmV0dXJuIG1lbWJ1
Zl9zdG9yZSgmdG8sIHRhc2tfcHRfcmVncyh0YXJnZXQpLT5vcmlnX2EwKTsKPj4gK30KPj4gKwo+
PiArc3RhdGljIGludCByaXNjdl9vcmlnX2EwX3NldChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhcmdl
dCwKPj4gKwkJCSAgICAgY29uc3Qgc3RydWN0IHVzZXJfcmVnc2V0ICpyZWdzZXQsCj4+ICsJCQkg
ICAgIHVuc2lnbmVkIGludCBwb3MsIHVuc2lnbmVkIGludCBjb3VudCwKPj4gKwkJCSAgICAgY29u
c3Qgdm9pZCAqa2J1ZiwgY29uc3Qgdm9pZCBfX3VzZXIgKnVidWYpCj4gCj4gRGl0byEKPiAKPj4g
K3sKPj4gKwlpbnQgb3JpZ19hMCA9IHRhc2tfcHRfcmVncyh0YXJnZXQpLT5vcmlnX2EwOwo+IAo+
IDY0YiByZWdzIG9uIFJWNjQuCgpPaCwgbXkgYmFkLgoKPiAKPj4gKwlpbnQgcmV0Owo+PiArCj4+
ICsJcmV0ID0gdXNlcl9yZWdzZXRfY29weWluKCZwb3MsICZjb3VudCwgJmtidWYsICZ1YnVmLCAm
b3JpZ19hMCwgMCwgLTEpOwo+PiArCWlmIChyZXQpCj4+ICsJCXJldHVybiByZXQ7Cj4+ICsKPj4g
Kwl0YXNrX3B0X3JlZ3ModGFyZ2V0KS0+b3JpZ19hMCA9IG9yaWdfYTA7Cj4+ICsJcmV0dXJuIHJl
dDsKPj4gK30KPj4gKwo+PiArCj4gCj4gTXVsdGlwbGUgYmxhbmtzLgo+IAo+PiAgc3RhdGljIGNv
bnN0IHN0cnVjdCB1c2VyX3JlZ3NldCByaXNjdl91c2VyX3JlZ3NldFtdID0gewo+PiAgCVtSRUdT
RVRfWF0gPSB7Cj4+ICAJCS5jb3JlX25vdGVfdHlwZSA9IE5UX1BSU1RBVFVTLAo+PiBAQCAtMjI0
LDYgKzI0OSwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzZXJfcmVnc2V0IHJpc2N2X3VzZXJf
cmVnc2V0W10gPSB7Cj4+ICAJCS5zZXQgPSB0YWdnZWRfYWRkcl9jdHJsX3NldCwKPj4gIAl9LAo+
PiAgI2VuZGlmCj4+ICsJW1JFR1NFVF9PUklHX0EwXSA9IHsKPj4gKwkJLmNvcmVfbm90ZV90eXBl
ID0gTlRfUklTQ1ZfT1JJR19BMCwKPj4gKwkJLm4gPSAxLAo+PiArCQkuc2l6ZSA9IHNpemVvZihl
bGZfZ3JlZ190KSwKPj4gKwkJLmFsaWduID0gc2l6ZW9mKGVsZl9ncmVnX3QpLAo+IAo+IC4uLmFu
ZCBzaXplb2YoZWxmX2dyZWdfdCkgaXMgNjRiIGluIFJWNjQgLS0gbWlzbWF0Y2ggYWJvdmUuCgp2
MiBoYXMgYmVlbiBzZW50LgoKPiAKPiAKPiBCasO2cm4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
